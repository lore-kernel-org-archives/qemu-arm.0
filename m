Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3879831ejc;
        Tue, 17 Oct 2023 05:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiAjHRd3sE85K0lBKPdsnCgpWYXGrQrE75c1rUKIoL6LSKI1Zm47Nu7f6oJEyKC2NAwJ42
X-Received: by 2002:ac8:7d92:0:b0:418:490:6891 with SMTP id c18-20020ac87d92000000b0041804906891mr2649930qtd.47.1697545479304;
        Tue, 17 Oct 2023 05:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697545479; cv=none;
        d=google.com; s=arc-20160816;
        b=vONkRUe9gzH3En+erDwll5JrBhirlYUsmEhy0DDd/2SVdu12jsCyDtx+uoPk0kvUGn
         17f8/+/WwfwEa0OiLHx2gBDYcP1NjKyQqaJ2AlS3BvdZCSJ6nlNe4CBAgNDvDILT7oap
         jheYFxA5gCj99ARe2WgNXDayLAFgOHEYWYPnj5GT7jSuFZwrbNt3l6x9b7ZG8LAAotrq
         H19RM/md4CCLcg2Aml/XpT9/N0EYMkhhYkmEkpxPlhBgRe8nCNFdJQPWNc7tzKcI4MHO
         TU/RdgszY95PuYwEM+fw7aaWJuHGRARDepIw6Enf6EYdtpmvNOmnWd4xfKozOENmNoo0
         cHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ef3VyVefq+kXZQrOwVAifLvgHJQILqSEiKZ6PIGal1A=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=PShLpi7uAtn5qG1JdfPg0o14RkJLv3DQjXDTFsOd034kz9ySL1eV87mxWufGr5mCsC
         dSYuCkL5evdQbwW52iWHl1wY88gQhDKpk5Jt2TmlUBdhyQXa7GLWbGb+o9v6myGIsNEO
         V2uNhmHkD2b5ctPyRi/un5c+1mM5/72jdKdZnP43MDdXMQomqWaijgyt1kGcJfy4YqzI
         nzoEDn+R0ePEOvOrsB0MPMlaFj3X8R6MbZ4QJHJKgDkRUnZjBkguV/NOzmMToomHTvDN
         2v+FgfJVlT2Jq8CHU4eLu7wmcFkXvVhZvxnliB+URzGgXbIXfKuJcaKaN/dY3T0BTysd
         ba4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkXU0yo+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85c56000000b004198402319fsi1002532qtj.422.2023.10.17.05.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkXU0yo+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qsj6O-0006YM-3I; Tue, 17 Oct 2023 08:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6M-0006X6-87
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 08:23:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6J-0003uO-6h
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 08:23:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so4968249f8f.3
 for <qemu-devel@nongnu.org>; Tue, 17 Oct 2023 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697545385; x=1698150185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ef3VyVefq+kXZQrOwVAifLvgHJQILqSEiKZ6PIGal1A=;
 b=YkXU0yo+pd5+4KZYInlTlRE/4cGpegvjH91v/ZZlLzGbXSOk8BNjv6V5hYn/d4lzfA
 vRznfRCo6tKVDlmm5DqxaRC9qkqLT428Os3nd+x6k/IHcZbuCPsUtOtfgowLSoyxoJAy
 5TivsW/xolRfyLJI91CI1aSW3X+xUDfuNZyvTk1a65+0x7D4n4TVy0pVewnaCxee9Yhn
 iA+rVSY5QkzcRqcBfCyepWP9W2G3lkKUK+zH95Ai8hMulFrsR5J1jI8kZaJ+UzVZjmdh
 P1Fhat6Vfzt1c/z9W/2YuloH85QuO+phU9f/9JhugCLDf7RMbdjAn8GYc7y9kQiFKfI3
 XODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697545385; x=1698150185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ef3VyVefq+kXZQrOwVAifLvgHJQILqSEiKZ6PIGal1A=;
 b=oenswuRhA1wIdxv57BcyYb7vDyptHFbeiMqduRf1kYv4y+TZJc1D7LTsBlIDmuU22B
 Q1F02d2lAwV5F4rchw20UDtzGC0p1UrDv4GAC9QUSZh5lt6hahu6LOqmKIo85GWKHE27
 hGgPixOXHDtM5KY9DPmL4BtDihtO0S2WavSBkLjPrvlC9hUIsjPo6raf/Y/iIGsTfXIo
 JSqNEAHsOadGdMh1eok07wBgxNVzNZ5BTgxuMDr2C5zxpo+DyhgekhI2UpCeS3NbYK2w
 yzEOHCPiMN+L6wLVAvKQ0hx9GTEh7403jBK9u+sdO7GcPdTFfvxmImMFNWqhWJJhvZLj
 ju5A==
X-Gm-Message-State: AOJu0Yxv8fzaH2gzbt2/yXRL7SPNrynHqJLOT43232u5zpS47D5kxZpu
 zeGoPZ22Fjjajmgeg5UcGNO1nlgMQeycaOJ5dbY=
X-Received: by 2002:a5d:668d:0:b0:32d:9789:6066 with SMTP id
 l13-20020a5d668d000000b0032d97896066mr1876964wru.5.1697545385138; 
 Tue, 17 Oct 2023 05:23:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4b51000000b0032da4c98ab2sm1590905wrs.35.2023.10.17.05.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 05:23:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/input/stellaris_gamepad: Rename structs to our usual
 convention
Date: Tue, 17 Oct 2023 13:22:58 +0100
Message-Id: <20231017122302.1692902-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017122302.1692902-1-peter.maydell@linaro.org>
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MjhuAxg0ayYQ

Rename the structs in stellaris_gamepad.c to our now-standard
CamelCase convention.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/stellaris_gamepad.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/input/stellaris_gamepad.c b/hw/input/stellaris_gamepad.c
index 3bab557cab3..377101a4035 100644
--- a/hw/input/stellaris_gamepad.c
+++ b/hw/input/stellaris_gamepad.c
@@ -17,17 +17,17 @@ typedef struct {
     qemu_irq irq;
     int keycode;
     uint8_t pressed;
-} gamepad_button;
+} StellarisGamepadButton;
 
 typedef struct {
-    gamepad_button *buttons;
+    StellarisGamepadButton *buttons;
     int num_buttons;
     int extension;
-} gamepad_state;
+} StellarisGamepad;
 
 static void stellaris_gamepad_put_key(void * opaque, int keycode)
 {
-    gamepad_state *s = (gamepad_state *)opaque;
+    StellarisGamepad *s = (StellarisGamepad *)opaque;
     int i;
     int down;
 
@@ -55,7 +55,7 @@ static const VMStateDescription vmstate_stellaris_button = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(pressed, gamepad_button),
+        VMSTATE_UINT8(pressed, StellarisGamepadButton),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -65,11 +65,11 @@ static const VMStateDescription vmstate_stellaris_gamepad = {
     .version_id = 2,
     .minimum_version_id = 2,
     .fields = (VMStateField[]) {
-        VMSTATE_INT32(extension, gamepad_state),
-        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, gamepad_state,
+        VMSTATE_INT32(extension, StellarisGamepad),
+        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, StellarisGamepad,
                                             num_buttons,
                                             vmstate_stellaris_button,
-                                            gamepad_button),
+                                            StellarisGamepadButton),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -77,11 +77,11 @@ static const VMStateDescription vmstate_stellaris_gamepad = {
 /* Returns an array of 5 output slots.  */
 void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode)
 {
-    gamepad_state *s;
+    StellarisGamepad *s;
     int i;
 
-    s = g_new0(gamepad_state, 1);
-    s->buttons = g_new0(gamepad_button, n);
+    s = g_new0(StellarisGamepad, 1);
+    s->buttons = g_new0(StellarisGamepadButton, n);
     for (i = 0; i < n; i++) {
         s->buttons[i].irq = irq[i];
         s->buttons[i].keycode = keycode[i];
-- 
2.34.1

