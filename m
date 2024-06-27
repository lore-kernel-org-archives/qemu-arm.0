Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp310354njb;
        Thu, 27 Jun 2024 09:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgGne5y6hkDoBgqJc47qC7tyB6wgC6wvybbHj36zEiogkaBv4l5CtBoKfyctEx0m6t1tiOH2l7duQh26SErp+bnXc/iVV/
X-Google-Smtp-Source: AGHT+IE76mSHK2loKeoWbIWCvkNS0b2DaRklpiBp9TH0I2vG3UzGo1lHyeGiUNzngEgFvLwSjmMG
X-Received: by 2002:ac8:5dd4:0:b0:440:1c16:547f with SMTP id d75a77b69052e-444d3c0aed9mr192580331cf.41.1719505548391;
        Thu, 27 Jun 2024 09:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505548; cv=none;
        d=google.com; s=arc-20160816;
        b=h/iWEN8g+HtLLDK5znrWn0K2XX6YtjchjaWYOqJ1ftZtTDfV12/x1z/BTUlhO7OIc2
         0PKYoKp/nyTLNSF4lHaZZF0uEEMAjUiimWRYN0g6dtj8OrId1EvIfVp5jjDUnSIcJDi9
         B3ykwUwviH/+fDoJN9yOdq7Sc4t1AxHnFLThI3fSsXV20njRU7BEApB7uB0cQNEsrAsm
         ZONCS+iAC/LNlYArhedXpzjMA8fCHsBukEqP5/hd4rW1z6pTCoH4nz1dJ1DkxhKbxPnV
         EykaI4t3P2/mwZGuZ9CjHFj79ZpmA3GYgsK6NbVUuG6Pz+Fv/+lDwi2/iYKxaHOFAyal
         wOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DSF5Ro3NaUsJXtCUAFWLr+3NgzU6nFSUILhMkj2n5D4=;
        fh=ER8hsVY4xWfUSDBa7uqMOVXCAXHrv2isulLRc2ono9U=;
        b=UE6x1FDog7GUNPft6lFWAdn3cP5391NWR/Jh4FI7ctRxN7Myz8FZN1WZOJtupJiPrG
         hF3o2wK3mzLltt1AfG/lxiC2VDpbvhnnh0pxuc/KCXqH2FD3IADwB7EDV4fMHyCC4gYx
         sLVdj3RdDvMk0JAO/30/mZa2Btg7x4vsxy8w9qudImi9Gw8c2cSq4W/yElmD1fIfd16K
         og7Sdbor5OlmjlkMgk4X69F0n/BrrW+VhwGbfxXmpNkhKis6/wsC24gqyextcLjgiKlu
         Fvy20ONWLYVYKz59mzLmAgOZk/uwWRJY45iSX+J7xK8a3/AAhD2tMFnRoPuBIY7Z/8lh
         XsbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRTLmw2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446421e52e6si15647921cf.597.2024.06.27.09.25.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRTLmw2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrwM-0003Vd-VW; Thu, 27 Jun 2024 12:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwL-0003D5-4m
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:25:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwI-0002ck-Jv
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:25:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-364a39824baso5574942f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505535; x=1720110335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSF5Ro3NaUsJXtCUAFWLr+3NgzU6nFSUILhMkj2n5D4=;
 b=VRTLmw2Kl7Psz2fJJmQvLVcfBWkyXFy7RNqZ2CiL1cd/wxLbsNePqyzT3SatEzCGLq
 ZOdhDuNshAIun+hWnUpgFP1XrOxY7+BlE7WBpPu7NqwXAuAZW3ls73bh0plkc1xQu35n
 RnDUSnc452/zeszBtOLdrqe4K8EpfwhRWBRZVFwukNPIwcUYGpwO84lTYkAAIzTLNq6k
 +k9pPHJePki5DmfklbxS9uJpxuGwsZbpnXxtECvNJORbmS0jbxafDPrvNrQlGeko/rhL
 5CPq7Vn8QNAjmR9x9MjI0HzNCSKjlHadeVY4jnrSTgYznvCIuf3dc7EJNVOFL7RnS/lO
 whrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505535; x=1720110335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSF5Ro3NaUsJXtCUAFWLr+3NgzU6nFSUILhMkj2n5D4=;
 b=MyTkkky6Wvz75b+U+EtxYKNFESX9XNaaB2y2WEsGNGne6Wgi57X1pZfnI1sdp26PM5
 l9ZnmQn2+P/SrBjMpmWEtPkOVosyDP0QV/cdKg84/GI8NbNGMJNGsnT0Mcb19g/+eYtE
 XWcfRWlnyU3BdMi1mYezjQl1pG/AYKiuswthEyyrD0My9Ecp8koJ8j2WkUcMJS+w27WU
 oZK7+1pe34tAvd63/xE85OXfn8q4/HLdiDA3YlSHCmyIbvOlPyyZwpMDwSHw11RVRT9w
 47bVQdxdmsh2efcCMIs+x9xnPfBduvbxQA26wNdtuwoK38TSwmOSLCyWNHbkHnjgNobp
 AXPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBS0q+LET8OTemPEqYrl0cV73dMM0Zh7jf/Mf+v5OiUlLlzF8S5uW0hmFOZmpfYSnfOwJtRCl4cOekkVP1yXPEeJJT
X-Gm-Message-State: AOJu0Yyd3VNAIgBXxECda2clajvcYFoicFnrmdDPmO/LAeeEKRQ4IHUG
 kKVszYivkKFDgb67zEX+GNbxqTzcBbAL9h8qGc0+dbt5v9Nld3lzrv+J46ZYC7I=
X-Received: by 2002:a05:6000:2c5:b0:366:e89c:342b with SMTP id
 ffacd0b85a97d-366e89c34bcmr13353327f8f.52.1719505535283; 
 Thu, 27 Jun 2024 09:25:35 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ebaesm2348335f8f.91.2024.06.27.09.25.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:25:34 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 14/17] hw/sd/sdcard: Extract sd_blk_len() helper
Date: Thu, 27 Jun 2024 18:22:29 +0200
Message-ID: <20240627162232.80428-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: +Bn6Zy5wefqx

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Extract sd_blk_len() helper, use definitions instead
of magic values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index aaa50ab2c5..5997e13107 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -603,6 +603,14 @@ static void sd_response_r7_make(SDState *sd, uint8_t *response)
     stl_be_p(response, sd->vhs);
 }
 
+static uint32_t sd_blk_len(SDState *sd)
+{
+    if (FIELD_EX32(sd->ocr, OCR, CARD_CAPACITY)) {
+        return 1 << HWBLOCK_SHIFT;
+    }
+    return sd->blk_len;
+}
+
 static uint64_t sd_req_get_address(SDState *sd, SDRequest req)
 {
     uint64_t addr;
@@ -2076,7 +2084,7 @@ uint8_t sd_read_byte(SDState *sd)
     if (sd->card_status & (ADDRESS_ERROR | WP_VIOLATION))
         return 0x00;
 
-    io_len = (sd->ocr & (1 << 30)) ? 512 : sd->blk_len;
+    io_len = sd_blk_len(sd);
 
     trace_sdcard_read_data(sd->proto->name,
                            sd->last_cmd_name,
-- 
2.41.0

