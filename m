Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp5221ejc;
        Thu, 13 Apr 2023 13:33:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350blLH7NVTwZH8LPq20QzDQgd6XkYRc2ef6EAP2WU6nv7Bi3dKT1pNBU2aFpSDm5qBTYiWk4
X-Received: by 2002:a05:622a:188:b0:3e6:71d6:5d5b with SMTP id s8-20020a05622a018800b003e671d65d5bmr5826074qtw.4.1681418002125;
        Thu, 13 Apr 2023 13:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681418002; cv=none;
        d=google.com; s=arc-20160816;
        b=VTe0ORGJKYoK/5NixPOB0FGgzJrSKid8Bpoy0JbWteYzVtUuwhpMa5iRBCk96weesW
         4CkC0+6K3td1xcltMLwjy+b12Ih2pAAiYBBzrI9ACfnhf3bltahxCtOK1BTg2lJNPsGD
         0K6M5bOHvVPWjsQ9yKvWpT86Lou/nNFOIn4LwjL5S4kjGUHE/Fe91ZmgSiiXg6JY/4T2
         3iWxEMxp5qZSSOyN/qlW9gkrVaxmHSQxkbWeFdtVcxDW1Usaz3n7i/1lvo7B2djXlqr/
         URIQu2fJUJCldg7NkUN2DU0SrBnRwxtghUs6G0p5mnQthtt8hJ+nC7VR5AYiVv/8jvPP
         oR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2nO9cO2rW6HrUeC/QMpTXWxsur+tUCg5wRn+l8dArpI=;
        b=rdGwk7tcHZ0n173KaNt3pbfCrNGe/RaU8iC+QEWm77E8RKfqSuNVLqagHRBCEkSJxk
         9tsYZqBryIEy6dofh62uf4jJbhYqioxoc8sIMSZjHcoIAFNspCtb5vBGhbqrBT5QLJtU
         u11Ix7kGXUvHFSlzN1p61Fo7PynJRbLXChX7qc0FxN6eb0jdr1RCIbBkgl5UIg/Ul4Is
         yUWbUY8GcxPqvWCPcaTILeDlBTudkw02bu4QBnmEG80NZIWAdE/HOmrmO7bRkCMDR0VE
         ZAa3JzRlzJaDpPCJd7Stw2g0Bn/2XbsHA0pEpDBRyG7ChFoWzgaI74eMWQAnzoI/U2ka
         ew6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29-20020a05622a181d00b003e4e4f83ef2si1627224qtc.327.2023.04.13.13.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Apr 2023 13:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pn3c3-0003mj-Uk; Thu, 13 Apr 2023 16:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bv-0003ge-UH; Thu, 13 Apr 2023 16:32:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bt-0003k5-Ux; Thu, 13 Apr 2023 16:32:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 79D9940135;
 Thu, 13 Apr 2023 23:31:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 03C8621B;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: (nullmailer pid 2344349 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 09/21] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Thu, 13 Apr 2023 23:31:21 +0300
Message-Id: <20230413203143.2344250-9-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3UyC/jKQyqQA

From: Markus Armbruster <armbru@redhat.com>

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

Since monitor command 'dumpdtb' was introduced a couple of releases
ago, running it with any ARM machine that uses arm_load_dtb() will
crash QEMU.

Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
of freeing 'fdt', assign it back to ms->fdt.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-id: 20230328165935.1512846-1-armbru@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
(cherry picked from commit 12148d442ec3f4386c8624ffcf44c61a8b344018)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/boot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 15c2bf1867..725bab8adc 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -686,7 +686,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
-    g_free(fdt);
+    if (fdt != ms->fdt) {
+        g_free(ms->fdt);
+        ms->fdt = fdt;
+    }
 
     return size;
 
-- 
2.30.2

