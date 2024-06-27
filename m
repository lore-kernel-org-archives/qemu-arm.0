Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp310116njb;
        Thu, 27 Jun 2024 09:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU55XzlITx5dSpWJflbGaf5lYklr8GheuMl8cANQSUqxRfA6K5z2RYpQy/WVQawHM+WZ0/xEG3bDAOHlAOB6fpGc+J8HQm1
X-Google-Smtp-Source: AGHT+IHFK+PH8mMPnznuW3/HD7tC8FwfVLkZzlBsbS0DnjL9Ad2fGOL+Mjm5tXrRyS4a1Zya3cZf
X-Received: by 2002:a05:6808:4497:b0:3d2:2b5c:5181 with SMTP id 5614622812f47-3d545a7d699mr16674966b6e.52.1719505515744;
        Thu, 27 Jun 2024 09:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505515; cv=none;
        d=google.com; s=arc-20160816;
        b=knC8crFQF6O0ezwUyRh2YPGrFFqhPeYyKPkI54+zxsgfj8Ja+owry8dv6tXhSKp6uT
         AQQ6zUHMNxeKrSvmouLS1nGq9Z4IQpJ7g1lElI4BGDHN6ZnU5LwdEvlTq5y6hAdwRdxn
         tOvtOiD9VRwHuWBWzlNLHKLCVjh9XheVLLVjTWBdpNeQbJGd1lmP+C8NeGsBTFJ1Qm+w
         R4LpgfS9APG/MvX1O8UzUX1X/NwmkxeEhX5TJJvaT7qUVUYwH6MqH2rkMxuQMoUEObhE
         FLrHXwd1T8S13l4N9ff4xQyaf6eZHdkl6mzxhtSrjYY1/ACYEzo6HtcwajikV4+IgeU3
         RcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JpVotoHspFlZ3BpKrTY/FaOKVvxynyJagKJZJS+6h3k=;
        fh=MizaK8S6E3UsI8ne3esFaSyUX4GzilgMK3MtPZVWK7Y=;
        b=gs8o/fqfRxcMc7Ie/9EJFvwTPnBLpV1kko2gkmJ9POaH/zP+taw21y3RFLU4CIojTb
         zNPZkICvyaYn6cwXo0Uyv0sMusy1EVE9CkmIWcjge5Y2iMQcmP7o18KLIAxbQMwtGAWI
         HH53/B3aEPI5n0DCf1eLuWa3nmEcdB0JKRB7S/oRrijxZojHlAmFv/i/VzJuzb4ns7Cg
         Z6AZA/G03VFpejTy3+Vkq8p1p6k0VcoGVE1wIUU9mTPNs3QUIllclaTgLB2Lro8H1lRV
         jUhpjQ6/jHeo8Jm737/aNQN25ODFTm+WiTs5Nn8we+Et67yTcHrp2dAJbg7MoMvz2bs/
         tDHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sAD4SVpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44641ef93c3si17651471cf.124.2024.06.27.09.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sAD4SVpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrve-0000VP-O5; Thu, 27 Jun 2024 12:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrva-000882-6H
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrvY-0001NQ-Ii
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-424acf3226fso19099015e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505491; x=1720110291; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JpVotoHspFlZ3BpKrTY/FaOKVvxynyJagKJZJS+6h3k=;
 b=sAD4SVpep7t9QEf0mJp42GPVlhDmfctgRDq9RYjpqQx5fDlAIXk0sPjt6TM6pRX+j9
 jpvqFtw6ih9WH0zbmf7LLgYLYAcJxTvJPaFy+I9pKBKj1yn5EnVocFeuaOkDdc1mNH7n
 wXwX+T6uWYxK5sPP9fZkglyYK2NYeN25xm8+rv6jTU48Yf99i97ZOh1agOZGRcWp2gVc
 hKp67AFftySEtJWW6Vephc7oQGjRhNF6H+fOeLp9J7iTRdAvFBt+5jTaUtFt4Y3Jpv+q
 uIeJkYRCJEyu6YSGBeGUC4CiUjPsm2iX2TeR2BWmXV3A//io6u5eYSl3r40gzjqEMAt4
 ZuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505491; x=1720110291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JpVotoHspFlZ3BpKrTY/FaOKVvxynyJagKJZJS+6h3k=;
 b=hGLwUJpOJK86jW2ZMi0XH5P2hjFxMbpk6fGgarHbTKMd3fOOzsm2DkoSb82GpQEu5S
 mmILyS1Vobur+O3N1tXwGMYz1BQFDLoQhENd3mvJrtBKX9YQlx3sJBCfQ5Oee24xuz2f
 3njCeiBbUCV8xQ8f1x9Cvij3rn7pBD+C/ZuW2XfbkxVcsdhLDVCYOEyHLRjPYcJxgsmc
 AfnZG3vTTJa1SdBT/YkbzkJ8N3fahpRGhVOkB5Pw4i7o74HCOs3qS33UNrpaTcLmo481
 nJpTnRQUNdqFiCAWPEZef716/9UZgPpOClKzzQZDz0DlZrYegOgx99Yq6sdZxFzXrbFr
 X8yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOkUjR+aLGgj7pFk9QKH/k38zpLPwU9VO7in5ojMk/UToQ3EBjuvPCP98q8HapZGmwX8oO6/DrYhbzPqO9U5OUbh0J
X-Gm-Message-State: AOJu0Yww8jspDhsr6raYfq2TE0g58LQ9Q+lPxnYomeY1gsG3ffpQ5HEv
 fYx/mA3Zns+d7EFR1MoWX5yjWQIjw7BdQr3c1WlVedDVqIT5HjD4G3ZevAJqDeo=
X-Received: by 2002:a05:600c:16d4:b0:424:a406:ad52 with SMTP id
 5b1f17b1804b1-424a406adb7mr55279375e9.19.1719505491050; 
 Thu, 27 Jun 2024 09:24:51 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36743699c0bsm2349553f8f.70.2024.06.27.09.24.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:24:50 -0700 (PDT)
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
Subject: [PATCH v3 10/17] hw/sd/sdcard: Assign SDCardStates enum values
Date: Thu, 27 Jun 2024 18:22:25 +0200
Message-ID: <20240627162232.80428-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: 6jwEUvSMqhNz

SDCardStates enum values are specified, so assign them
correspondingly. It will be useful later when we add
states from later specs, which might not be continuous.

See CURRENT_STATE bits in section 4.10.1 "Card Status".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 135b7d2e23..fbdfafa3a6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -75,16 +75,16 @@ enum SDCardModes {
 };
 
 enum SDCardStates {
-    sd_inactive_state = -1,
-    sd_idle_state = 0,
-    sd_ready_state,
-    sd_identification_state,
-    sd_standby_state,
-    sd_transfer_state,
-    sd_sendingdata_state,
-    sd_receivingdata_state,
-    sd_programming_state,
-    sd_disconnect_state,
+    sd_inactive_state       = -1,
+    sd_idle_state           = 0,
+    sd_ready_state          = 1,
+    sd_identification_state = 2,
+    sd_standby_state        = 3,
+    sd_transfer_state       = 4,
+    sd_sendingdata_state    = 5,
+    sd_receivingdata_state  = 6,
+    sd_programming_state    = 7,
+    sd_disconnect_state     = 8,
 };
 
 typedef sd_rsp_type_t (*sd_cmd_handler)(SDState *sd, SDRequest req);
-- 
2.41.0

