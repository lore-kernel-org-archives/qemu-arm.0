Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp310312njb;
        Thu, 27 Jun 2024 09:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmAAmlQUocoJJhGfReDNzZ0FZPVGwK2hNzrU8pLi98pyJcR+NPrM3Mirk4YvOID5f1XIM6TNkYjTGKm+QcsZHyuDdg/FU4
X-Google-Smtp-Source: AGHT+IGiL1WTvJjCiYJesWvwXe973++lfhv+CJIIbf41E8pSKCXGx374mB6wDo+ekLErBAeE3jqI
X-Received: by 2002:a0c:f010:0:b0:6b0:7485:71ac with SMTP id 6a1803df08f44-6b540a12df5mr123140826d6.38.1719505543726;
        Thu, 27 Jun 2024 09:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505543; cv=none;
        d=google.com; s=arc-20160816;
        b=qXH5vVcbQibRTxGpfB19ZYEO9RH6wn1wrGzm6LKcCM43l0OEBXD/LAGDQ90lxDewKK
         X215r1JyaF4MhMVWi503RrknoM05N71ZFS3rvvqSyMCS5qhzDnRnVlGkel9Hxp7xiNnc
         gXX2FEfWh04e4vUTYsleDS45vEobQWKQcV8fPNqC1Vk/bobwcf3+mwO1sIcOxuPDscX9
         YSJJz3Ifu1Nhc5AUcbWt/G+4WLXY83AcqOwv/md2THdQrww/2IH04x/FdOw4Z4ZwPrVI
         gwhjJ1uoK3MSLE503rkH5AhhOjNbhtYeStQIF0vlAl1xJWVoTWSjD1ujnECYUGI6PvyG
         ZuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zk4YjB9lQI2zLem86by0CBqxXy4bvU8ycOt1g+Y0WQQ=;
        fh=keOIgLfHg6PLhi8N9FU99febVVvmQvfp4/vFaUdRDLA=;
        b=iYVZA11+gZRMMlhr8B4uBgauHJkgKs970GeZyejgWPmtdhv76nY50tnKSKYsvjurpI
         8O6kAamhGs5g4CdyslI5RWPC3nv3UXg2JRZKgNeBXLRtZsEsQ0jdbDMZJTAQcl6SKoqK
         zG1RsayhBV+V0iOtpgHZrgeVKSSSJk/HGho1MtPiKuw781YW+37leLpnxfi1oH9sgo6U
         RMWb4tXtIfnuhDoRhLXsoxy/UThyOuFt0HgVagc90eKpj0U18Yio9lWZwIY46PPMKKoi
         eKt12rMeYorbPbdSOEWQK02rCpfqnr3Jzm58occ5jvz+7SpWNr/sSa2tJ59b8yjdFE68
         Rfuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h0QES/EN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59269ccfdsi15586876d6.381.2024.06.27.09.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h0QES/EN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrwE-0002sz-GP; Thu, 27 Jun 2024 12:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwC-0002jK-Hd
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:25:32 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrw9-0002X2-PI
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:25:31 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so5718744e87.2
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505525; x=1720110325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zk4YjB9lQI2zLem86by0CBqxXy4bvU8ycOt1g+Y0WQQ=;
 b=h0QES/EN/cW4hVUVQ+eEtzCkcIu3eEXMWadNgcmK0lrKnArUNHvCE5Kz0E/lasdgoq
 +HdCtGCts3PDDQkXoEcnV3q7YoZMP8K2oCiu1GBKT8I1NG/eHEdscExni5yPeZbWWAKn
 mcvQUoo507u0LyBsOdIOvrSIB0EffLJLMpFqaFWZYDgIs7DvNihHAQaxBHaOJce8amej
 j2YXaknEJTSRfrOv2RI/9FChFvLDZd7Hu8lZW8iFh8uKQJe0inOlSdiDCg8E++AwNM+j
 xwAdeu1uD+tqbZ6ygMDFoSc3dad8CAtaN5BZSpcAsJPsgWzCyk3luTUU4Ane6hv0tMho
 aEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505525; x=1720110325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zk4YjB9lQI2zLem86by0CBqxXy4bvU8ycOt1g+Y0WQQ=;
 b=e+nfVuJTkpfN3QQRty+9wIZqo+WrgrVXjkKvWE9vbTSTac20jMVA0rl/hOrFx46N9y
 erJG55FvG3C4Q+Y4rusPLiv8OHCb5drmFIOL+W95JvDQBjrfPZdr18o8jcTMS2iJWHCz
 4wKLeMn2WvqclacpTLvXfExQ+LHQPTx4sVk22eSL7sc2Q9otP3yG2DcEKRaPpZW2KE/H
 BiCcrXw728G6DhdLmFWbqAYBFMgOkPqnwisFreVlXGiXcY23F73OcqstKWMYBTszATET
 RiFJ6/2cxDINJsojUvZTahsQhj5giKGiyJDEw4LBM88EdFS/Aw01x50irTaUkDBz2zkw
 3yhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIIAiqa/aw8A+gs11GkvA5Bua/wuV+0ZRwlFVi4yCWTUzGZ4HVdvV9rm/3ckUSmhYg7prNaAypUaQFy9KxBPu2pp8H
X-Gm-Message-State: AOJu0YxPx9TxwnDlZhry60qeQiojA1KbWE6NOw2kMaByz+tKT8+fc4Oc
 g7w89Sfsf4FmSendF88RjjO41hIR3tftwoHGNV3D6ANG/K0c5i1HpvnnJdjhZw8=
X-Received: by 2002:a19:7612:0:b0:52c:d639:dd4b with SMTP id
 2adb3069b0e04-52ce06442eamr8285193e87.23.1719505523361; 
 Thu, 27 Jun 2024 09:25:23 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bc4f70sm36674055e9.39.2024.06.27.09.25.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:25:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 13/17] hw/sd/sdcard: Add direct reference to SDProto in
 SDState
Date: Thu, 27 Jun 2024 18:22:28 +0200
Message-ID: <20240627162232.80428-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: miw6h2ljA0/R

Keep direct reference to SDProto in SDState,
remove then unnecessary sd_proto().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8f441e418c..aaa50ab2c5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -116,6 +116,8 @@ struct SDState {
     uint8_t spec_version;
     BlockBackend *blk;
 
+    const SDProto *proto;
+
     /* Runtime changeables */
 
     uint32_t mode;    /* current card mode, one of SDCardModes */
@@ -154,18 +156,11 @@ struct SDState {
 
 static void sd_realize(DeviceState *dev, Error **errp);
 
-static const struct SDProto *sd_proto(SDState *sd)
-{
-    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
-
-    return sc->proto;
-}
-
 static const SDProto sd_proto_spi;
 
 static bool sd_is_spi(SDState *sd)
 {
-    return sd_proto(sd) == &sd_proto_spi;
+    return sd->proto == &sd_proto_spi;
 }
 
 static const char *sd_version_str(enum SDPhySpecificationVersion version)
@@ -1044,7 +1039,7 @@ static bool address_in_range(SDState *sd, const char *desc,
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "%s: CMD%i in a wrong state: %s (spec %s)\n",
-                  sd_proto(sd)->name, req.cmd, sd_state_name(sd->state),
+                  sd->proto->name, req.cmd, sd_state_name(sd->state),
                   sd_version_str(sd->spec_version));
 
     return sd_illegal;
@@ -1053,7 +1048,7 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 static sd_rsp_type_t sd_invalid_mode_for_cmd(SDState *sd, SDRequest req)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "%s: CMD%i in a wrong mode: %s (spec %s)\n",
-                  sd_proto(sd)->name, req.cmd, sd_mode_name(sd->mode),
+                  sd->proto->name, req.cmd, sd_mode_name(sd->mode),
                   sd_version_str(sd->spec_version));
 
     return sd_illegal;
@@ -1062,7 +1057,7 @@ static sd_rsp_type_t sd_invalid_mode_for_cmd(SDState *sd, SDRequest req)
 static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i for spec %s\n",
-                  sd_proto(sd)->name, req.cmd,
+                  sd->proto->name, req.cmd,
                   sd_version_str(sd->spec_version));
 
     return sd_illegal;
@@ -1073,7 +1068,7 @@ __attribute__((unused))
 static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
 {
     qemu_log_mask(LOG_UNIMP, "%s: CMD%i not implemented\n",
-                  sd_proto(sd)->name, req.cmd);
+                  sd->proto->name, req.cmd);
 
     return sd_illegal;
 }
@@ -1166,7 +1161,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
      * However there is no ACMD55, so we want to trace this particular case.
      */
     if (req.cmd != 55 || sd->expecting_acmd) {
-        trace_sdcard_normal_command(sd_proto(sd)->name,
+        trace_sdcard_normal_command(sd->proto->name,
                                     sd->last_cmd_name, req.cmd,
                                     req.arg, sd_state_name(sd->state));
     }
@@ -1185,8 +1180,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    if (sd_proto(sd)->cmd[req.cmd]) {
-        return sd_proto(sd)->cmd[req.cmd](sd, req);
+    if (sd->proto->cmd[req.cmd]) {
+        return sd->proto->cmd[req.cmd](sd, req);
     }
 
     switch (req.cmd) {
@@ -1632,12 +1627,12 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
                                     SDRequest req)
 {
     sd->last_cmd_name = sd_acmd_name(req.cmd);
-    trace_sdcard_app_command(sd_proto(sd)->name, sd->last_cmd_name,
+    trace_sdcard_app_command(sd->proto->name, sd->last_cmd_name,
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
 
-    if (sd_proto(sd)->acmd[req.cmd]) {
-        return sd_proto(sd)->acmd[req.cmd](sd, req);
+    if (sd->proto->acmd[req.cmd]) {
+        return sd->proto->acmd[req.cmd](sd, req);
     }
 
     switch (req.cmd) {
@@ -1928,7 +1923,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
     if (sd->card_status & (ADDRESS_ERROR | WP_VIOLATION))
         return;
 
-    trace_sdcard_write_data(sd_proto(sd)->name,
+    trace_sdcard_write_data(sd->proto->name,
                             sd->last_cmd_name,
                             sd->current_cmd, sd->data_offset, value);
     switch (sd->current_cmd) {
@@ -2083,7 +2078,7 @@ uint8_t sd_read_byte(SDState *sd)
 
     io_len = (sd->ocr & (1 << 30)) ? 512 : sd->blk_len;
 
-    trace_sdcard_read_data(sd_proto(sd)->name,
+    trace_sdcard_read_data(sd->proto->name,
                            sd->last_cmd_name,
                            sd->current_cmd, sd->data_offset, io_len);
     switch (sd->current_cmd) {
@@ -2227,7 +2222,9 @@ static const SDProto sd_proto_sd = {
 static void sd_instance_init(Object *obj)
 {
     SDState *sd = SD_CARD(obj);
+    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
 
+    sd->proto = sc->proto;
     sd->last_cmd_name = "UNSET";
     sd->enable = true;
     sd->ocr_power_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sd_ocr_powerup, sd);
-- 
2.41.0

