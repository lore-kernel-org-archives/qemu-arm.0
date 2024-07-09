Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1561401dlb;
        Tue, 9 Jul 2024 08:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtgGPTu5Cazqsm1a/msg309WOxxLpIDo2PghQTyQEF3StJaWB9Hh+ADEwIyqnoXDX2W1J6yrLBIFfLWt+PlEJ0dZi3Ns8x
X-Google-Smtp-Source: AGHT+IEeDiFLa0aoaqIihIOiuz+0OOsJys5atsiS4NPJpMDJRJFHOR9cK8FwOIS4htlAqO/yGDua
X-Received: by 2002:a05:690c:6681:b0:64a:4728:ef1 with SMTP id 00721157ae682-658f02f5ea0mr39282077b3.39.1720539005483;
        Tue, 09 Jul 2024 08:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720539005; cv=none;
        d=google.com; s=arc-20160816;
        b=xRBC7PvE64nY6HsQjy0haU0TUdZKeYkljQcsw+tj5oeo01UMpaOQjKPdB2NLJ22LfY
         h3BdZ486lt26BKdieoOnKU39q0YIAd6MNqqgampXhVxdjOAcU5X2fLXSHcWUN19aFtFz
         Zp6VioaQO6r8A3SNN3Jj1cAYCpGvCbd7wH0aEFR+zYJhSR5cb9DtZ11WUZjzBuhO9yKp
         KQIPIB87Y6Dd3slZ+jJHURR51130tw6SVv9L+ndflHyGa1d+5C7a6mCnXsnTn84EDlIc
         GlRtQTcY9Kujv3dI9k7Y7YZkjyMsR8plBws+e7mWtCMIswqVJ/GMKVMDJmfHJLTL28WP
         V3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=daY+t25+t6fUlvq8XgRmvXSG1rxW6z777bj+RrC4xDs=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=w1qn+rUAkjOi4pGTaBqI6xYDIKQARthiIEj7RlwxSOqV8H+Lba3HBuW/ALzoptQfVk
         QusNvxyqhrn3CLFHgl1lNJgbtzBxRs6S3J2TIguu0+fNTJ2x85jQw9Y3S+OmvwXaLfVG
         Ink43vHANUsI7Sl/ekpaOvPIoKgVvKALc+Fe+NAFlarhPRwV0aNORXeQoI+hYKZa63gs
         KRysNd2rhflECHI6bT5qRoOetAXpgDBYwzIHwXaab2rjDdsro+/OZ61yr4h1iC96st3V
         5J7T34luFOdT3FjhbTvUurPvOdJv2x97Psp71I7BQgLbi2F1VnPyVyGF01qTELYOpENF
         dwAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FUdkAThu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc2518si23700471cf.395.2024.07.09.08.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FUdkAThu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCjs-0004G8-VK; Tue, 09 Jul 2024 11:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjp-000435-HE
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjn-0006Gn-KU
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso12606525e9.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538798; x=1721143598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daY+t25+t6fUlvq8XgRmvXSG1rxW6z777bj+RrC4xDs=;
 b=FUdkAThuB/oVl2mEKN3PytIRlKxYmI7yeJLXAKUiqwpM3znJpM+m11sH6RTlT01KOE
 llhMCOfrGBAs9Ta8uOcec6/DCOZw5F7Y47o8rnMI/+5fawcL4U3lsgrZlRbcab4POkLf
 PpP8CZXjF2CeBDux3odTrQJ19wrmx80qqPjR40CJHG5sxVhZ9D5wJ/HDGPWWX6ST55eP
 CVH1cmVsVR8ptDKKAyBQLWSNeV4hS4nF80cpJQEIlN3cxg/o0QitMfkuysM9iiXZsme6
 dw5WJMuuppHRMLvgnpPX69nIlWBqfatXF1gojPsRG1UmkFiWTggDzuKnwuaH3ZuyThrE
 JrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538798; x=1721143598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daY+t25+t6fUlvq8XgRmvXSG1rxW6z777bj+RrC4xDs=;
 b=IfL7AfpGkgptnzY9uK+i6RPoC7MdNsl6bZpA2VJGuvHlKSyGpxI1G86Q7reo4/t1tZ
 uHDfuwxfAkxvJNiZxJIFZAoCNUz8LXnFNAb7COqPd7haa7EiTSPxNklQyvK1ttbYjg7t
 EiGSg8mYLf5Oi98QaQe0f5RJFtUpcs7l8zgxzv66xpzT3H/V0/hogBWr9BQLflMb0CFt
 Sbxdk/5LHjxFi2bwfiWumBqg84lMT583nyStK9ThC8XbdoWWJhAGRIlZDA4G7eLxwh1Z
 7xwqihDTajZ7SuVEAuIc+OqPvvZqDFTIIR8RLaFGjlAFt3KKFJ6D1nHstW8uA0GFrrhP
 XVLA==
X-Gm-Message-State: AOJu0YyB/Q8b6ivm6kPNTJV8hCsNyIRoVknIVEpZNdC/pHlk5KtUT+jN
 a1LMI021jg5jZegCXseUk83Lduz1GJAJUOtdxxMP3rw6dpcuKdBlu5zhCH+HnEo=
X-Received: by 2002:a05:600c:1c10:b0:426:5416:67de with SMTP id
 5b1f17b1804b1-426707f7e68mr19359555e9.30.1720538798331; 
 Tue, 09 Jul 2024 08:26:38 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f7362d9sm44351915e9.30.2024.07.09.08.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [PATCH v47 06/19] hw/sd/sdcard: Add emmc_cmd_SET_RELATIVE_ADDR
 handler (CMD3)
Date: Tue,  9 Jul 2024 17:25:43 +0200
Message-ID: <20240709152556.52896-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Cvt9/iKVsOkr

From: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240628070216.92609-86-philmd@linaro.org>
---
 hw/sd/sd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index f580c6b2ae..83d45c897f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1280,6 +1280,20 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
     }
 }
 
+static sd_rsp_type_t emmc_cmd_SET_RELATIVE_ADDR(SDState *sd, SDRequest req)
+{
+    switch (sd->state) {
+    case sd_identification_state:
+    case sd_standby_state:
+        sd->state = sd_standby_state;
+        sd_set_rca(sd, req.arg >> 16);
+        return sd_r1;
+
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 /* CMD6 */
 static sd_rsp_type_t sd_cmd_SWITCH_FUNCTION(SDState *sd, SDRequest req)
 {
@@ -2445,6 +2459,7 @@ static const SDProto sd_proto_emmc = {
         [0]  = {0,  sd_bc,   "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
         [1]  = {0,  sd_bcr,  "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [2]  = {0,  sd_bcr,  "ALL_SEND_CID", sd_cmd_ALL_SEND_CID},
+        [3]  = {0,  sd_ac,   "SET_RELATIVE_ADDR", emmc_cmd_SET_RELATIVE_ADDR},
         [4]  = {0,  sd_bc,   "SEND_DSR", sd_cmd_unimplemented},
         [7]  = {0,  sd_ac,   "(DE)SELECT_CARD", sd_cmd_DE_SELECT_CARD},
         [9]  = {0,  sd_ac,   "SEND_CSD", sd_cmd_SEND_CSD},
-- 
2.41.0

