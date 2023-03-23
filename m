Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp6661328ejb;
        Thu, 23 Mar 2023 09:11:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set9cLN72Q3ndrUuNcf11Gx8eIiXWKDONfDqpvWnqTcgth6UVcih9gs2qrKNFwSNA9JMksCrj
X-Received: by 2002:a05:622a:1a25:b0:3e3:7d85:1520 with SMTP id f37-20020a05622a1a2500b003e37d851520mr13647370qtb.49.1679587893464;
        Thu, 23 Mar 2023 09:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679587893; cv=none;
        d=google.com; s=arc-20160816;
        b=Wp78fSxp9SA7x3QxyDN/ixKmFHVfkdomAGaFivzizDbAoPUiVNYNFk7kV+KnGKF7o1
         SB+aUEH6go4rlo6ZkzUGe6DHoqr4vPzOAMOloMUnCXegcTVXGJh3od77iS5xp369/Tme
         F04GC2CuGnCD71KThsflRi+aWTSzN77cleqi63XMwvixUyPnD60v41bS9d00Dp3OOt5N
         8z5xnttSeU+b1zSghxp8eaKRXRNP6n3YsElrrIXUa+LRhS+bn1G40gjVOvelLJRF5+3J
         O914tSN0mcM+zSiTZNJq4bCqZlPKL+Hg23VbCUGbcNOfiTvV4oHIGsLI/8O+J6i8+6x+
         oV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lEoL38ueQvzw+JlzgnfkvuDS5A/n5kW5dw5q3wh5w8U=;
        b=HevSpIQBwkLBntyI/UP1A6mT5t7WdB4jD0EzInpRsE0/UiLKOleTsXym9Z1D+HfZw6
         jiy0jBZMeNmKBjfKMbiJvMfmo+2ZCz6uAJC4ZoxV5HqYe2pD2lsgQR859FTB8hKzBYYw
         mPYVmD63rX1Izqj2gGtkK2M2f0GKyurrZnCoUiNRXaBgKIiqkJLgGtm+thHYHQ4eCT77
         9NZW+IQDs73QO+N9zpBlvAJN8qJx4Niu5URo7aMaSviVV8wZ0+sG25jyq0AE7aePddbs
         K/USbsMHHfEWFHtOEg5lOfdqtkueZ8aazhWzF7SaRXKd3q9kVTqmN3cbNlig3H4aprEX
         XMBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYmRA6IU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ac85881000000b003d5151ca404si12831896qta.165.2023.03.23.09.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 09:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYmRA6IU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfNWu-0005ib-82; Thu, 23 Mar 2023 12:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfNWq-0005fs-9y; Thu, 23 Mar 2023 12:11:04 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfNWo-0005fZ-TB; Thu, 23 Mar 2023 12:11:04 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso2985903oos.7; 
 Thu, 23 Mar 2023 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679587861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEoL38ueQvzw+JlzgnfkvuDS5A/n5kW5dw5q3wh5w8U=;
 b=VYmRA6IUocahRHDYdYe+DtaSHWHPl4/aTDyqhzcgD6ybeRa77VoUAdRFPSfCZB743o
 zszlPKrMRMsHP2H31OO8POPitU2JUIBIR3tAZgJu9spvaP2fhpufwfetyiuh2jYqiawI
 8+lGKVY/ZiNoJatx/IhHdLgV+L4Ao8mNCCwv2HAEpW1FTk/gcfYBH0/I7NeZNSh3r3Su
 Z9XUSKgCQGms8R15fGhUvcjog6kSuVZfU0a0nvkOQeTuzl2lai3XKuqnpRvOoAo11yi1
 D9RyWmKIFkb0bKd+ZEcsspK3AkWKW5w9u+W3W6i3j26ctuwu+mLTYWQ87JgtDjK5gBfD
 SVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679587861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEoL38ueQvzw+JlzgnfkvuDS5A/n5kW5dw5q3wh5w8U=;
 b=d1Z+zd3ztWMAylLtZoTLZAuOWouAgZweWxpZFbRnJphtVOvMV8XPxVO9UKe0s2PoGA
 wIiTecyw1I8lr9h0LX3v7ywFm2E6C3dLBlXJITK5XRmF2ypGP0prX7AaxMr1kQUlsO4c
 IHoK1SBt1MsOd5aSmXIILztcUJExzSX1BjmCRwruXWNRg7sErdV9lmwpdH72QcJklA6H
 +2/nEp0LHsk3opspM4UpZDCUQ/AOm90Nek1ykDH3LlyXNhAo37yjSPRJy7gikHreTiTF
 5X2zANa0okbU68fnRZMZoHfnCUUUB8GU76lJSE/WAjfxX+mnNiyB8z48IqAxlHeEv0IR
 sjlQ==
X-Gm-Message-State: AO0yUKVLdTujW3XaRbaGF1lHX9EQsiNOog4peRhtsLMFlDdWo/7wDyxy
 4wMk+97rBKgQqKjGgl9D4zZVMJk8TFk=
X-Received: by 2002:a4a:2cd6:0:b0:536:bcd5:9498 with SMTP id
 o205-20020a4a2cd6000000b00536bcd59498mr128911ooo.3.1679587861055; 
 Thu, 23 Mar 2023 09:11:01 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 q32-20020a4a9623000000b0051a6cb524b6sm7575504ooi.2.2023.03.23.09.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 09:11:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Thu, 23 Mar 2023 13:10:53 -0300
Message-Id: <20230323161053.412356-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323161053.412356-1-danielhb413@gmail.com>
References: <20230323161053.412356-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UEmJRp7SIHS3

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

After the command 'dumpdtb' were introduced a couple of releases ago,
running it with any ARM machine that uses arm_load_dtb() will crash
QEMU.

One alternative would be to mark machine->fdt = NULL when exiting
arm_load_dtb() when freeing the fdt. Another is to not free the fdt and,
instead, update machine->fdt with the new fdt generated. This will
enable dumpdtb for all ARM machines that uses arm_load_dtb(), regardless
of having 'dtb_filename' or not.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
Reported-by: Markus Armbruster <armbru@redhat.com>i
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 50e5141116..9418cc3373 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -689,7 +689,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
-    g_free(fdt);
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.39.2

