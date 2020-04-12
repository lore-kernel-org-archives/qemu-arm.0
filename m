Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3081352lfm;
        Sun, 12 Apr 2020 14:10:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJQH5+8oyl3e9NvcUCH6sb26f1UVDReFnCpZnyzkkKUw1IRkiFkHyKgsncHIkq8myCiax2I
X-Received: by 2002:a37:5e47:: with SMTP id s68mr13017387qkb.411.1586725844885;
        Sun, 12 Apr 2020 14:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586725844; cv=none;
        d=google.com; s=arc-20160816;
        b=kkAvYvvo+vajXNv9cYZAxj5xXNSSzKVzAY3xiWjcW8R68TSaQHuhBamsdfEa2ffrDV
         ogygvbXo31mYiI8Dj4osYre+gK/gscsi3BRCLIGHc0CvYVebUcwSpHGWAjc+VpztPb51
         7+2bUJBECT2NM40BYJ7r9+fyKjA0AHxILKc5WB+9NfsrZrbCN1W89j1gYw8w1mpwcTNm
         1t221SlWfhKYCQ3pr05W6qN7Znh1iG4RywHbNqIriiE8zpBBPI3hyHKB7QA/Jy6iF7H2
         tDKU8xvdQcg2zLHPfIGTsAQFaN13BAkdS88FbyHKh/BRoppwZg/fOut6nkckIQofkpMC
         qeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
        b=m22qu5H1E4nWVYnOXGAbt0nfke4aHSt9Jwr+Gw81bCT3N1PJgwzNOimvfD3dB4wmqy
         LyN8x6CoiE4LjZqN91AQzspKRNt1XVeP98F11YrVz67S4xlHV7DcfCIgQaMPCHSwmsDs
         gg3bHgLPRzWWo1Cai1EhpObuACNm8kiN0OT4zev0IBUkBexkD+OcrRMDSqOCZrvMrHQ9
         5iIX5VDMN59HL3mYabAa0evfDR9BcZcCT7sNmXcXJnOYkwyrIzi4zVmRpR/jt5SqF1Nz
         a3Y5OVuVjQF0jnhfjZCR0bvtsNCKEMht0wtmb/lnWbVLtbaN9uivlrReM+T8YSdEbh/r
         9b3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TKsyfLjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si4554240qtp.390.2020.04.12.14.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 14:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TKsyfLjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNjsJ-0000Zk-Ap
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 17:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrl-0008G8-0U
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 17:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrk-00057I-4E
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 17:10:08 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39877)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrg-00055B-AO; Sun, 12 Apr 2020 17:10:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id p10so8395402wrt.6;
 Sun, 12 Apr 2020 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
 b=TKsyfLjrtirKrDYfamB6nSrrR1fPhrULfxHjh5dsXKznOBbWceZZrZQvEgoeZxVwzh
 lyJwOD9688ualAfVSJptSzKTDdFxJmthHKBJK+Zzg977Bw1z5adwWSDk7qwbN0r+btX/
 VgcDBQWB1idyVqirNa1KnHS0CTnRxSpja5/oIGNROIK0uS38xV2hbPpj/ESifO26aecS
 t++f3fH9j6yhpg5IpeK0CdEbMOlUMsAvicHE/sEEZptPqxP5EE1D4KJgdxQse8zEOmnv
 WuYFZdR7TlOo5Wtd9u6MzWOwp5xvBCfBKt/2HASpFTnxjpmuCx3jFscSZH0JywZchrBM
 nEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
 b=rG/tUU2KEKvJMOPs4HUnQpDPrRgqGYEp/v27IVaQW/vMd96gpLPnXOypNsI95uYb72
 d1K8PTEqLVRroIOtXr5qxTtghdEJD3Rszb94C2XRGUq5Ue9WujIPJwxH4reLD8UyLq5o
 W3aKXRQfLZ6P/LqU88vqGraCkHoBSxn9cPKFh7K2HvWc1sAlUhtna853yKTBZ7gqDV1C
 jSHo2Vlf/AXtHm0sCc2RgwM+zL29nisw29IKqm73/wCCIOLiEExWYV/ZR9Z0ybZtsbgr
 UOoihkomLruaSgJB5TDFqx6UAdaBmeuFZp8hagJAc2F6+Wc1NqakR7z7XBqZqJYRgh5o
 6aHA==
X-Gm-Message-State: AGi0PuaTdSljtQOpAsKjTf7yEV5yXorUk03JP4wMqrSd2n+ZJWukCqBt
 gWP4IOrFNiB096wqJ4+XivGgzUufK/k=
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr15464439wrj.165.1586725803042; 
 Sun, 12 Apr 2020 14:10:03 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:10:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 1/3] target: Remove unnecessary CPU() cast
Date: Sun, 12 Apr 2020 23:09:52 +0200
Message-Id: <20200412210954.32313-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cPTX3yztONBf

The CPU() macro is defined as:

  #define CPU(obj) ((CPUState *)(obj))

Remove an unnecessary CPU() cast.

Patch created mechanically using spatch with this script:

  @@
  typedef CPUState;
  CPUState *s;
  @@
  -   CPU(s)
  +   s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 86c667b094..8972714775 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *env, target_ulong BATu,
     if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
         /* Flushing 1024 4K pages is slower than a complete flush */
         LOG_BATS("Flush all BATs\n");
-        tlb_flush(CPU(cs));
+        tlb_flush(cs);
         LOG_BATS("Flush done\n");
         return;
     }
-- 
2.21.1

