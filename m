Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp430076lfc;
        Thu, 3 Sep 2020 04:09:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUI51zlrqXguLGS3SGHXm6ReaMjdQoff1xzlytn4zieWf+Hityd/8CUuZ7FEJ+bIouP+Rx
X-Received: by 2002:a5b:b91:: with SMTP id l17mr1933475ybq.276.1599131367289;
        Thu, 03 Sep 2020 04:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131367; cv=none;
        d=google.com; s=arc-20160816;
        b=GsVzaM3HZwfQbBkviHJeP18k3iJIdizYZGA+PX/lMAOAYjN3m8uAqYAzknV56mDknf
         22hgaRFVvwKdGK2a5nrwWoGCSMmFdD4N0/63estw/UH+JD4WtlErjPEGAPBWtlTS4BmO
         /HXmNLbGTfzsmO9xcLblxlNMfAt+fBr5lftKj9HTjwyOgwRlrZ9ky4unAnviE4FBSlJX
         uyiUeI02DuVtPC9J9aX1tAegjJ2sGviT1Jk2lJFHwtZWjQXu/svi1gCZ8LP3vY01V64H
         7fUyhBsbZPYGOYSVsVsFqOdStobpKmDezg/y5kHz1jpySp4nrjzxUUFIZdgCJYlon/0D
         5mvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j+CTPuGUnIINTsaPCLli+OHIjRAwlTE0OOiFGbSRLLI=;
        b=SKJZpPpXEgZEHA0cUnUbV5hpiBF2i3hl8yBgrzn8BIRXVx41JknvLcsEuEw3/oxUS/
         gqVEpVLIMgXUY3CWwAY5ThhgBSaPz7jZzuO4eF1aMnslnL5OVLXIU04xlkamOVW+6lky
         i9vmBCoUc3av1UtvsfTcwud+UykIh3sSKIsSZ3zrolvisLToILrUA1d1BZe8onTiyGA0
         +vj8HtjuoWgtKXBIfIcCjiIElJ4vM3wKVLexQavS4g8bFh6dOXZnr1tFr8ad4z9Byz/i
         PFkupWxU1Dak/tpyqBBDL1bU6A43RrJkYqBqJ1mGbcjwL7MPe33DrX6pny//bm6A3JuD
         oC3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YGI4DY76;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si2622863ybe.424.2020.09.03.04.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YGI4DY76;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDn7O-0000N0-FW
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn73-0008M4-76
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn71-0005pZ-8O
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+CTPuGUnIINTsaPCLli+OHIjRAwlTE0OOiFGbSRLLI=;
 b=YGI4DY762GNDVysu1xauKV8EmU09E4Meoo/UFXaxmE71ah00uJTdUnT8XnPE2pxVn3IKeT
 KWv+cwjkg3Tp9u6re5BSVL/7NzZ3LYLwlxFM201WCbwEQp6vqHObLiWJTAbPY2OUuOimyF
 77C/laYMwqOnbXdR7fbKfI9VWSZJOM4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-CtWWDZ5rMd-lEHfGcyexXw-1; Thu, 03 Sep 2020 07:09:00 -0400
X-MC-Unique: CtWWDZ5rMd-lEHfGcyexXw-1
Received: by mail-wm1-f70.google.com with SMTP id a7so853934wmc.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+CTPuGUnIINTsaPCLli+OHIjRAwlTE0OOiFGbSRLLI=;
 b=a3YvfAtrsPSegATg3RDA6lsHwty47R807kSYUbKqjKzsQX3WXI18o0teLLu2eX67yT
 a84y9XY5T7/o04Rq+G4nJQ45lCNR19256Wg01p7WcIImUxC2Mg5yFhvqeR3LDutzNbkc
 a4k8RkMv15aWCXdbK7zDdeC5sjap+O2PKXu5eVaxPB9gtLgX9JVyRjkLzi1RWAHCQm/1
 FWnuVkUBpNsUgAlctbwQA9fIX1bmpHTQ5YB0asQQD7lCRCnSNHIqUd4EkCJ4MWD2SGBC
 I1YtUQ3KWFb/iFGshXLzZsmqu4Ib1l3WFM3U1sJnKxhe/F+0+fE1zXZQT/pllBjcVs3H
 ifjg==
X-Gm-Message-State: AOAM533rcYjgFIUHVlCbl3t7fnhsXoGHgeXX6Ag3fBBRI1u/J6rC6Qpk
 MR3PGIkHggBFaGhKK1RjTuqq6he9BogpqoQb6U8IHiNfXcBxCNe4FmztuybfcV2LPl6n/vTzvWg
 iUVP47W+zJm3U
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr1912990wrn.68.1599131339763;
 Thu, 03 Sep 2020 04:08:59 -0700 (PDT)
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr1912961wrn.68.1599131339616;
 Thu, 03 Sep 2020 04:08:59 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id q18sm3863193wre.78.2020.09.03.04.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:08:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] dma: Let dma_memory_rw_relaxed() take MemTxAttrs
 argument
Date: Thu,  3 Sep 2020 13:08:23 +0200
Message-Id: <20200903110831.353476-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903110831.353476-1-philmd@redhat.com>
References: <20200903110831.353476-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dF7tmaiNYPxA

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 34f957cc278..6068323e48f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -82,23 +82,26 @@ static inline bool dma_memory_valid(AddressSpace *as,
 
 static inline int dma_memory_rw_relaxed(AddressSpace *as, dma_addr_t addr,
                                         void *buf, dma_addr_t len,
-                                        DMADirection dir)
+                                        DMADirection dir, MemTxAttrs attrs)
 {
-    return (bool)address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+    return (bool)address_space_rw(as, addr, attrs,
                                   buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
 static inline int dma_memory_read_relaxed(AddressSpace *as, dma_addr_t addr,
                                           void *buf, dma_addr_t len)
 {
-    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw_relaxed(as, addr, buf, len,
+                                 DMA_DIRECTION_TO_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int dma_memory_write_relaxed(AddressSpace *as, dma_addr_t addr,
                                            const void *buf, dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
-                                 DMA_DIRECTION_FROM_DEVICE);
+                                 DMA_DIRECTION_FROM_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int dma_memory_rw(AddressSpace *as, dma_addr_t addr,
@@ -107,7 +110,8 @@ static inline int dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int dma_memory_read(AddressSpace *as, dma_addr_t addr,
-- 
2.26.2

