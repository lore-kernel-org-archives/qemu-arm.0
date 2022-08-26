Received: by 2002:a05:7108:414f:0:0:0:0 with SMTP id l15csp416071gdo;
        Fri, 26 Aug 2022 07:13:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jz7iGhOearh3NFRjcxnyNCfYw5GQlRsYFaER4EadGGzT+STcL/vdlH+p5ZAKLHcy4XkRz
X-Received: by 2002:a05:620a:468d:b0:6bb:5cd6:680e with SMTP id bq13-20020a05620a468d00b006bb5cd6680emr6748235qkb.29.1661523191823;
        Fri, 26 Aug 2022 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661523191; cv=none;
        d=google.com; s=arc-20160816;
        b=pHxaX97cPoDGl/EC5ESnySxpIH4OR4Sh5kWWIh7rWQoLu4klNAZ4iin6Vlj4GqzLn9
         MkAlYwiljo+FsATJCcfpd4qanNcRgdq3BJPQGBYPfje+w5PHDrLg4A/aPd06l30wGJvM
         09tDp6SRQ1wz4/OeiusG+DFyyRDorjaVvWGFz3yqw5yWaKj4wepMQzo37uAoFx+2RUr/
         uLxPT7P1WIqOCtI0bGsDmBU/0ZlqU65L8d8JQB85BQ+w19ICur8RsAQWhpjk+X705j0F
         hS9z5Z0AblJ/9a3cW/kNL+cbLcAUe7q4BHAGT7G9aLi5lUO1bn3GH+cP5jy/IhOToSF2
         11CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7nsBpd6U2T94rIp6E9694uNRx1OUw5ceVkhMbv8n9sQ=;
        b=SM9teNuYZjrFoQC9fcqRhz0lwXcB/x+znrV5rZatGTT+00hIP33xJCtprYmtV2/yZb
         hsnSL0eTtlYOEqbCkPffusUNUlHw0tsyuJ9J2vyO8hn6jvTj7AMI83Zq3dVcrEfl7Cy+
         pj+Tlb+onPkgIgFU4m+P+XrQ/5yTVYAuPlsog8hA525wmMwt9uH6lVycmVIoC9XOWrHh
         kv2s6gGQXstQFbtdrgjYdALCld6IP9RoMRYEMSv8IGZJBX3rqZlIPKfb2he3HOFy2p7i
         alH14XXfZAHAmcrHPc8PqfcFo6GnY0IRagNAFgkv5wQ4eEEq0edDnlnSFjsFyc4IyVeh
         qGGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dHu8iCKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a0562140d0f00b00496b529849dsi1017648qvh.357.2022.08.26.07.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Aug 2022 07:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dHu8iCKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRa59-0008OC-Di
	for alex.bennee@linaro.org; Fri, 26 Aug 2022 10:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa43-0007Xl-5A; Fri, 26 Aug 2022 10:12:03 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa41-0003ot-I0; Fri, 26 Aug 2022 10:12:02 -0400
Received: by mail-oi1-x235.google.com with SMTP id r10so2137821oie.1;
 Fri, 26 Aug 2022 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7nsBpd6U2T94rIp6E9694uNRx1OUw5ceVkhMbv8n9sQ=;
 b=dHu8iCKsKPB1tufnPw6xfyTL2kEBCGfGhu3tJziTp3HoUR7yAWchSuqbUwotSIisWs
 NCF/NUNgVCcEYBd+/sYghKYzdxOTHwcUsj7sCwuCVMbj0FCxZVEHMZ16/pDVLPPhSWIA
 6mbGZkbE7i15GQulFK0w84gEFXYL1YqM0tl38nkZLmtNnQoeZKTue35n3RugJ2lfwPYf
 5iYlINiA0drmTa2IngkPo7ZIoB7anQpBDwIa0iV7/AI5RJ2lRRaZuRoD7RwrB6GfEyTk
 BC7ohDXI1SciwS888L+KFrGGX+RV24DqQVEA49/k0yGtGIyHd0Aw61PIo4F0U0XfYS7j
 Q68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7nsBpd6U2T94rIp6E9694uNRx1OUw5ceVkhMbv8n9sQ=;
 b=LgFXJ4QougSPSFfv1DmOlIBzzqJ8fP7I/QtLvocYvhwyvsTt8W7B3bhiR3kzS3DDdv
 WKTuw/vdUFUDXr/yg6xF1Dwnl5ge0VmCQmU110kwlfsY5WbfDuUbIEPfLZU5j5ilBTa4
 Pfvv+axFfcVUEHHCPu7zmX65HTmLkj2hgPi4HqUoL+iF0uTLy5rSFYzTY5qqqVHBdPfl
 IEnhfWX+1sv7V7uw9KsgqoSCcus/Gh1oIk2t1gN8E3VsSIkVS/SOUIDF5+l96BCI8W5K
 niNrTpK22PCrs9AV7e8MeKAtXytOpI6XOtsXq5kE/Y5U75f3EWRUqKh5AZp3WO7WoFeq
 wBWw==
X-Gm-Message-State: ACgBeo3TZhrJ/u6Q0wuW/PCvMEssrG8vGNDzvgztlm53XFFmyETkM6lP
 A5pNO+30sURxitOdAkJmx7Pi4cfwpqs=
X-Received: by 2002:a54:4598:0:b0:344:e71e:3a13 with SMTP id
 z24-20020a544598000000b00344e71e3a13mr1760681oib.239.1661523119049; 
 Fri, 26 Aug 2022 07:11:59 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:11:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH for-7.2 v4 01/21] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Date: Fri, 26 Aug 2022 11:11:30 -0300
Message-Id: <20220826141150.7201-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F6NIcaqRjOUh

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a couple do
FDT HMP commands that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..669a978157 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,11 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /*
+     * Update the ms->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.37.2

