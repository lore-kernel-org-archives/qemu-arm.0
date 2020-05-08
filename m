Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2669148lfb;
        Thu, 7 May 2020 23:25:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2m1DVaBpj3ZRVI8FRAloHKxX68UPT/xRaovx9zOkZi6NXrngp8T1SqhD6N6S5mfYU2GLd
X-Received: by 2002:ac8:5208:: with SMTP id r8mr1330264qtn.11.1588919121350;
        Thu, 07 May 2020 23:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588919121; cv=none;
        d=google.com; s=arc-20160816;
        b=b/WYyiVm/6FoPLI7gq7HhBVAViI8sq1oHCfptFbODsPdiRqRxOoFFQAtoE8gMFefq9
         5DCLtQtGJD3NgZA73hUTRsLqTuOuF/4w1wM2GDIAzxee03VBoxWKuJiPIHNXscsrP6hv
         EQ1Dgd+dpNfguh3onGTGExrtUCIrENaNHrlDYHXDOTkeUcRuXhrpxj8O9LF4qDhQv6av
         3HKKIIEgE3nLCZhu9BcnK4eHVH0xQedOEV/W41k6VF/UE8JFPuFaYi8eDAllHXFjeYBi
         fukNQ77K1ZYgxvE//lfLIJz2yPxBiu+HuTK/ddvABs+S5ZU1K9fwKoKKu1vqFHWb/uWA
         fHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qfS14LJEpOzY6PX3UrAqMHPU323E/PoXkpCr/b9ynrI=;
        b=PQW2CyBstlDjwTnhAmX593h7qvHTCEVPYFOCvieVOhcXw4RxOZi5bKgYneIkhQZ59u
         ypJifW19lXnddbpN8yoAsOk79zDGjfMyYOhgyCooEW8D0tFFmPj5yggxPl91zan1a5c9
         2sTwC1lbQo5h7ekoqAS/Zvr9hfHlpgCej9begLuRXi5vM064j1fP09N5zL9BtbfhBtKF
         lTjFYONv9jNV1xSy7SracNgetHvFU1lSgdkNXVcVGdPu4oUxFnlXlVVI0+pRY+P+qKlz
         NqBPL/umpUhFSdNJAIJc/VRFhlnrGIPK3ZsYy4fuRyvk6tlTqmowYiG004xmcWUGFzy0
         Gh4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RwtSieZv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id d47si356705qtk.64.2020.05.07.23.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RwtSieZv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwRk-0006NY-OW
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRc-0006L8-3l
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:25:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28364
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRa-0001KY-6W
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfS14LJEpOzY6PX3UrAqMHPU323E/PoXkpCr/b9ynrI=;
 b=RwtSieZvzaVn1yN88Y6wDfHoBwh+etUpgg7qa0/HjT4eNdCl26zuUS6rLuCQOmgFxANa7j
 khyJGhJKJ08sWfkjM5Yq1+21jbqGCCcsGL76KcyXYfD0LWy27nC1YGVSQT2c6wPnksYHMJ
 5K0upoSMj4qVg61aH9g1qAaMSz9/C5Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-lnZaKAejMmWrquFXYqMGdw-1; Fri, 08 May 2020 02:25:07 -0400
X-MC-Unique: lnZaKAejMmWrquFXYqMGdw-1
Received: by mail-wr1-f72.google.com with SMTP id d1so397550wru.6
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 23:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtFWs4BxQJZYmga34DJ69kEprWz+1I1FCi2dNjcpyyQ=;
 b=FxViWw0A+JTyS6REPkehpvHpZdc3J8ZA9ipyZ04p4YyoX0mnakI/0xNWTv9B+LTZJT
 Dtp63LQAN0v8hJTuSwGDipRXYcf67umJ5sJjo1rqBIRFSlxMiHF+JcqpqxQBMcEtKJ1R
 /7c2sYiaOkahjgwcb5pMdVEXk30WBdOsUubIpL3GrqyDStAsFPR7A1ZtTEEaE6ZEdbAB
 ZzSzv5oF5UiEEM+OtQ2KnwiqgaUh9uP2aYvV4SZeFQR0WUuOt4Y/is4KpzwlPPSvtg1U
 AOiMsaJYtiBTSM+DgMwYevO2/35Q7kb2wFhZxPO9yAbE9cC8ZCOcy4BxfSe7zVLAviYH
 xg+A==
X-Gm-Message-State: AGi0PuZY/z2X1GlEfh5q5yVL7SMnRQpcKpFQ+OdTxLl81NkVPqG4bEOJ
 lk3AsHagHCCRCC08BsYv17sSXv37HrL4sf/wA86HPGJn5+tR7DdkMn7O1kM1vbG1eOWrkMtdOxA
 zSJGeM3yPN33c
X-Received: by 2002:a1c:8094:: with SMTP id b142mr1182399wmd.61.1588919105846; 
 Thu, 07 May 2020 23:25:05 -0700 (PDT)
X-Received: by 2002:a1c:8094:: with SMTP id b142mr1182374wmd.61.1588919105605; 
 Thu, 07 May 2020 23:25:05 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id w18sm1304743wro.33.2020.05.07.23.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:25:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] memory: Rename memory_region_do_writeback ->
 memory_region_writeback
Date: Fri,  8 May 2020 08:24:53 +0200
Message-Id: <20200508062456.23344-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200508062456.23344-1-philmd@redhat.com>
References: <20200508062456.23344-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wceGyfZqhPuF

We usually use '_do_' for internal functions. Rename
memory_region_do_writeback() as memory_region_writeback().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/exec/memory.h | 4 ++--
 memory.c              | 2 +-
 target/arm/helper.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e000bd2f97..1b7cfdd5b6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1474,14 +1474,14 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr);
 void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize,
                               Error **errp);
 /**
- * memory_region_do_writeback: Trigger cache writeback or msync for
+ * memory_region_writeback: Trigger cache writeback or msync for
  * selected address range
  *
  * @mr: the memory region to be updated
  * @addr: the initial address of the range to be written back
  * @size: the size of the range to be written back
  */
-void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size=
);
+void memory_region_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size);
=20
 /**
  * memory_region_set_log: Turn dirty logging on or off for a region.
diff --git a/memory.c b/memory.c
index 601b749906..aa1f807392 100644
--- a/memory.c
+++ b/memory.c
@@ -2198,7 +2198,7 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_a=
ddr_t newsize, Error **errp
 }
=20
=20
-void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size=
)
+void memory_region_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size)
 {
     /*
      * Might be extended case needed to cover
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a94f650795..c4710b7371 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6829,7 +6829,7 @@ static void dccvap_writefn(CPUARMState *env, const AR=
MCPRegInfo *opaque,
         mr =3D memory_region_from_host(haddr, &offset);
=20
         if (mr) {
-            memory_region_do_writeback(mr, offset, dline_size);
+            memory_region_writeback(mr, offset, dline_size);
         }
     }
 }
--=20
2.21.3

