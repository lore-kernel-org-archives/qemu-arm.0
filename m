Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp310224njb;
        Thu, 27 Jun 2024 09:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXU/CD/VTjdB6efTaMRfViX6EvgJyNCJzpZkvNrXqvDrfHymgM9I9pmmSlTinOZ43RiJ8jom9M0nF6V/Ar397rF7cXstgym
X-Google-Smtp-Source: AGHT+IHET/dK5SkQ8xrijEaIWiQfn3KzBmJjaub3TkRhHi7eHymdwYQg+H+/QM3EUBXVmkrG4l46
X-Received: by 2002:a05:620a:4405:b0:795:52f5:4c04 with SMTP id af79cd13be357-79be6f24d18mr1552549885a.72.1719505531909;
        Thu, 27 Jun 2024 09:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505531; cv=none;
        d=google.com; s=arc-20160816;
        b=E3gfAprdQeeoAYCDqKmRNFRQf0Ytovitq1T0giINRGJKQ1I+15MRLyvbqIpFXCZKc7
         NYwPiSQ3AF8RCqW8KOw/xIOVzAKnsIfYwuvwuI80bVjdJSaRHCoUcjGuFIMrVc2Ba7AL
         Px+laJYPsJiJeRiV1TIKRTO0FiTQizJpQ1G24p5YjezQ69914XqeA+92lvLS1Xyy6QvG
         tox8nvM/FgcNZgimq7voNFUKm34B97NhsA2BcUXyhRS7ppbETRJU1Wkyt7AaQ8mfnVoh
         sXrodlysbQFBJiPwzyMfv6ycbayOq+RZ8HQ81+tSZ9KcwgwHnt9zWcCeaCtSO0EcgjeW
         IqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hpSfmrc8id/iTbpDVauIfBux1xBlvB+2LTLQjc6fyJc=;
        fh=76HNCwhYN6T3GgxnZjhW0Vw/gPNzlqk8tc0CIRn0r2c=;
        b=CklkXIIbeo7w/na8jjOn3jeNH1Uw1s7yB4SYvcv6r8R/d+c/ftXeOKzCxcl/2Z6fYT
         r3Avdb+jIgZtTDlyvhZ63Ks20hZYGbGh2mf+hBtqGGyROX8+Cai04bVH/JGKp6+KCy0w
         B8p7O1k3wT5rENB9m6WnYR3XNEO2TWf6+sP1gEY4RVgilHz4diFZWV+Qo54/dSbiFvgz
         KjyLIRNciG1Aj0itibvTCcwr35/3vgnThJBf/Fd0qI3l7aVoBoAdtmNheBzWFN/Ezxb9
         ybUChpEI8FeCzFla6fxgTxLKLF55QFHgZZeVg2mYiOq+W6xMY8qAHxVBwIhzHi8M08MC
         DqiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnptKduC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d5c8b751asi168363085a.455.2024.06.27.09.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnptKduC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrw2-0002BD-4W; Thu, 27 Jun 2024 12:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrw0-00023u-Mr
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:25:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrvw-0002QD-UJ
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:25:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-36701e6c6e8so1782420f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505515; x=1720110315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpSfmrc8id/iTbpDVauIfBux1xBlvB+2LTLQjc6fyJc=;
 b=hnptKduCGVkOFV7ctEM01LltMiXKWxcvAjpmSrHIp0YL8RvUqacvG36iXWUhjDt7hL
 fjTUl515muzKhBSXT02SVw3kkl5jJ/MOgf8behtfF68lGC9x3230Ai/lMXsvzo57oKrs
 3wZTUqf6MjHSGSK8y8ev5e2wRcNJWDujQzi1LlnKqDxZt/uc+By8hlR4sJQqgqWI+aCJ
 /0J4hZgGv6Ku4SsMktdpNXXX0kD3cF007+lYbjuMZbIdwdmgoJiV9NAFl21Med7UDL+3
 ap98wbrVWB5tkXv/rAyqCZDcSECO1XAZO0hJ4GO9ydNdbFlk+Z4d6mvHuXkv5h50CUlX
 XV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505515; x=1720110315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpSfmrc8id/iTbpDVauIfBux1xBlvB+2LTLQjc6fyJc=;
 b=Ws+zQJhumYOCze4oB74/jvJr4RT+iIHbo+vlbR+202TzjXwjy9k4BZzxMvRpvj5Ej+
 M5cglX927wbkd9QTR3ZrsSg7ULr5AxQdsq3j8wB21gY0NdguiFCnbcjZYHzQZD0Ws22Y
 uXi6zvsUp2/K6iGiwWs2JXyGK+5yBWe09O/VG4vA+hwqpTlU7v08DRuN/UZXW+qXAPV1
 mX1ls9+YtUpEHH1fV4O7MB3LfgDSDBLwShwbYMT7L56pKkv4XX9iM1IekorWd/uhLNGl
 XIbApxx+v/F71LYmJiqI0ljwn5NdLhJ9dLE23jZdCeVGH1tZ2nstjhrvzWmdbFQ6SOI3
 b9CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDmO9fZe9NzPwXA1yn9k6/Ld+tpnyK89gD4VeBFWqZym6e2Hgtu3oO3YpCWvnWYEV1oAjDGIAfvkHZYrc+ZdxeX7I
X-Gm-Message-State: AOJu0Yz3QUVLuEu9+OdBlAmC9oAPXraV0DkAo/Q9F9Di7fDmlcKi2u//
 eWcmlbTBtDEWU+MliPDjmTD0sbux1LdzEO5GB5c1zkyl7GvxxT2xwcXokHuOcfE=
X-Received: by 2002:adf:f50d:0:b0:366:e7aa:7fa5 with SMTP id
 ffacd0b85a97d-366e7aa803amr10705832f8f.1.1719505514940; 
 Thu, 27 Jun 2024 09:25:14 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36743699aecsm2343316f8f.87.2024.06.27.09.25.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:25:14 -0700 (PDT)
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
Subject: [PATCH v3 12/17] hw/sd/sdcard: Restrict SWITCH_FUNCTION to
 sd_transfer_state (CMD6)
Date: Thu, 27 Jun 2024 18:22:27 +0200
Message-ID: <20240627162232.80428-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: uPgB5GauQcK9

SWITCH_FUNCTION is only allowed in TRANSFER state
(See 4.8 "Card State Transition Table).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7533a78cf6..8f441e418c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1205,6 +1205,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         if (sd->mode != sd_data_transfer_mode) {
             return sd_invalid_mode_for_cmd(sd, req);
         }
+        if (sd->state != sd_transfer_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
+
         sd_function_switch(sd, req.arg);
         sd->state = sd_sendingdata_state;
         sd->data_start = 0;
-- 
2.41.0

