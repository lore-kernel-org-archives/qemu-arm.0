Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3006089njk;
        Tue, 28 Jan 2025 02:46:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIV2JyMNWGwze2yfLWYicnYqqcgKNf72fxxYIz7XmHNjrv0YyLNeuF8N/RHEEBM6/ds9E+tG3zT0VTfA==@linaro.org
X-Google-Smtp-Source: AGHT+IGF7J5rvtcr7K+hTsdbv6kKxgyFNpfA7N28Xf7QFw1BPkQNJ30VOoANdRE/iTLJR4bQyk7f
X-Received: by 2002:a05:6214:4401:b0:6e1:a5c1:d52d with SMTP id 6a1803df08f44-6e1b21c46bdmr729151076d6.31.1738061194724;
        Tue, 28 Jan 2025 02:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738061194; cv=none;
        d=google.com; s=arc-20240605;
        b=bbXVzk/pWOUeocWh+9km+NDEVBoNfGML+G+6A9+Wv7DrLAizRHPulqfRTzVDcQ8xZy
         +SkpCBXlxTBuCDYcAC0QwDNExiFtnZm99+AFp3kvnTOKw1ut5PYMeBCggeXCNXWUz/Dq
         vkDHNRfyOikmFbR5cOrMTdRMMGbyCAfovxWk/tjwzX/yBR25G5dmbS7ezZEohoxM1FSS
         Sa6Ck2VEzdX/T31YUxoq+22YhlM/RRUUvy1fuYrP6hBPTA0UUApcwFZGcQuUs1tgQgDN
         6t014oA8oJ5wE44EJgrjNDBi9fp9Dnhwd/cKOyn/baS1odW3QO5lentQ8Tsz6T6yYgme
         oMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yra2hKs7hlszYhHH5kmHgDMQvYtSgS7xsph+xNM9Ghs=;
        fh=A97/iOffPx0L7qKdtR8255lBwbYmj4xzdLgKCUqohbY=;
        b=edxW6l1Vr0NMOiV/Jyy8afJS2W4KQNX8YWaYwFR0X9GIaquiNPOoNxMBU8UOa9VW46
         TGMgvYNZ9oXyFsk4MOjPIJxSdE3/IsEy19oND601CQ6enrMDX1PWyE1EsBoDm2tOW5tV
         DPPuNLzqA1rRXsyHtPVSDz9pgb0wOygSwo9SfmQe2c6R8G32jCHoMXxdP7aB6X0o2d+0
         Q85D1PuR93oiXfzdPvs5XqejwSZ0iYMFe3wGLPLk48+cU3+apewmUdbWBayy6WV+PSt0
         xXMOKX9eSUVxYlPJYebOrJlwB6AU0Vl42ptOSJfiI9Ar00MHY5kprbmwPNQfmppnvEMM
         6AVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzZb2v0y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2052596f8si117006746d6.52.2025.01.28.02.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:46:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzZb2v0y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcj6a-0001JY-V9; Tue, 28 Jan 2025 05:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj6A-0001Ab-Ly
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 05:45:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj67-0003bc-6e
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 05:45:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283d48so38515065e9.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2025 02:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738061134; x=1738665934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yra2hKs7hlszYhHH5kmHgDMQvYtSgS7xsph+xNM9Ghs=;
 b=vzZb2v0yKdSlAauETvb1y/k4M0l9G3KtplqvCVytpdVkdgLhT305L5aReMngP11SWn
 C2ZvcXIemzqUhFiTeIQ0TL8wTwHIFwa+wyYLNYJ2nZ5J68f85YFNYKNhSwc4+tBd27Q5
 z6qU/S5jRHZR1B7Qat5xVC3JIyBrJv2yVBs6tDcIhORl18GY7ZKndQNJ5GpMWVe8KICY
 OyPEp7AU8X3JUCkKey6g3fXWL50v/tGbZNLhdk4NVbKkssvp9LFW+YYhL7dcUhgOgEuj
 vWB9JGBWDbt+7n69+JSLeXiJ2gOAgtYqXqriK/RWqHA/fQ/kMODdZfht5K4DKIcVraBo
 o0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738061134; x=1738665934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yra2hKs7hlszYhHH5kmHgDMQvYtSgS7xsph+xNM9Ghs=;
 b=soGGzlC2X4qK/jQ5RMkku/VQ32M/ROfYZuWrK+w3x9dDTW9q53oRmr8//wjBy3BsQ7
 wRpw8zpD7MdUqvPERSCtpdQ8vb3D61mwoPL/hJX3ZkKmT5q/R5sbNp7S2wNz5PJWC61u
 AMVqmSwnVQBc9gRVFTlByBUotqSlZ7Ky1FvMhO/XMtQJ3uIyBLkCl+gfHqX8gHiVXrGN
 sKi2t8z2MKmkdLl8GiANRGHn+bI8fILFxX5BsKmlvCS9e6IPBk6QeF5lUqNUBIKHbEzv
 kPtz0+rzlwbUDTL/NPF5CEy8SR850z7y6pgCKBCQqDbRGgseHu09vGWzcQzldlsKbAVR
 Xoag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr0wRqb5EtKa27gx4BhCqBGxpkty4fmYBDSV4CwqGZ40VYyuRRwjFTm0g/WUetwcN6ETnjbTZfYl2W@nongnu.org
X-Gm-Message-State: AOJu0Yxfk3pRzEm5e4d4YdMRXfO6mXCQL87gw8P+2HuATcjy01/3sfeH
 eVcTWJ674mz43l7Eftiqg4A/3BKKO3C0z1JwBj9OjrS9U4eIWsjmdFFnQDjZ8PQ=
X-Gm-Gg: ASbGncuzjAxb+u/YvkkTJOrbuMV/RFclw/nBoCqa4nYYqBoAyGM9SK9WbMzfGRwUyLd
 yhXFWZOdoe9Mc/XqNclas5ACIMk6OupGGZqK+VlgGe+7u0+OR+PTtFl3C/HX79EvipkCbIhHeLu
 uEa/yhwxYzeb9o8N35h6HjK1YhFTbEQ1qhCduVqqB86FxjL4B0pFbE78U4VubmhxdBM5wTwXcs+
 5Rib4tB/t0rtLR+iwDyTdQOi2sqFFEsAThm/TVnCTBjln+gGir6fnBp0a/BUUc0zP8sxu0bvYeT
 YaxIqhXFjO8rsUT18TPP
X-Received: by 2002:adf:a1cc:0:b0:38a:a074:9f3c with SMTP id
 ffacd0b85a97d-38bf5663dbcmr35230039f8f.16.1738061133781; 
 Tue, 28 Jan 2025 02:45:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c418esm13920133f8f.95.2025.01.28.02.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:45:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 11/11] hw/sd: Remove unused SDState::enable
Date: Tue, 28 Jan 2025 10:45:19 +0000
Message-Id: <20250128104519.3981448-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128104519.3981448-1-peter.maydell@linaro.org>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: C9ri7sNQDDEK

Now that sd_enable() has been removed, SD::enable is set to true in
sd_instance_init() and then never changed. So we can remove it.

Note that the VMSTATE_UNUSED() size argument should be '1', not
'sizeof(bool)', as noted in the CAUTION comment in vmstate.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sd.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 74bb7f39bbf..e541c57f8c3 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -173,7 +173,6 @@ struct SDState {
     size_t data_size;
     uint8_t data[512];
     QEMUTimer *ocr_power_timer;
-    bool enable;
     uint8_t dat_lines;
     bool cmd_line;
 };
@@ -292,12 +291,12 @@ static const char *sd_acmd_name(SDState *sd, uint8_t cmd)
 
 static uint8_t sd_get_dat_lines(SDState *sd)
 {
-    return sd->enable ? sd->dat_lines : 0;
+    return sd->dat_lines;
 }
 
 static bool sd_get_cmd_line(SDState *sd)
 {
-    return sd->enable ? sd->cmd_line : false;
+    return sd->cmd_line;
 }
 
 static void sd_set_voltage(SDState *sd, uint16_t millivolts)
@@ -976,7 +975,7 @@ static const VMStateDescription sd_vmstate = {
         VMSTATE_UINT32(data_offset, SDState),
         VMSTATE_UINT8_ARRAY(data, SDState, 512),
         VMSTATE_UNUSED_V(1, 512),
-        VMSTATE_BOOL(enable, SDState),
+        VMSTATE_UNUSED(1),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * const []) {
@@ -2146,7 +2145,7 @@ static int sd_do_command(SDState *sd, SDRequest *req,
     sd_rsp_type_t rtype;
     int rsplen;
 
-    if (!sd->blk || !blk_is_inserted(sd->blk) || !sd->enable) {
+    if (!sd->blk || !blk_is_inserted(sd->blk)) {
         return 0;
     }
 
@@ -2297,8 +2296,9 @@ static void sd_write_byte(SDState *sd, uint8_t value)
 {
     int i;
 
-    if (!sd->blk || !blk_is_inserted(sd->blk) || !sd->enable)
+    if (!sd->blk || !blk_is_inserted(sd->blk)) {
         return;
+    }
 
     if (sd->state != sd_receivingdata_state) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -2429,8 +2429,9 @@ static uint8_t sd_read_byte(SDState *sd)
     uint8_t ret;
     uint32_t io_len;
 
-    if (!sd->blk || !blk_is_inserted(sd->blk) || !sd->enable)
+    if (!sd->blk || !blk_is_inserted(sd->blk)) {
         return dummy_byte;
+    }
 
     if (sd->state != sd_sendingdata_state) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -2664,7 +2665,6 @@ static void sd_instance_init(Object *obj)
 
     sd->proto = sc->proto;
     sd->last_cmd_name = "UNSET";
-    sd->enable = true;
     sd->ocr_power_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sd_ocr_powerup, sd);
 }
 
-- 
2.34.1

