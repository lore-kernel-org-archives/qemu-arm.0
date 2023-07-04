Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959518ejy;
        Tue, 4 Jul 2023 07:51:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE3D3dfxcQtXAiInHkqMRcarEUqezm14SotPsM+TFJiKuF+qVt9XuuQb+Nig8433UGirfH1
X-Received: by 2002:a05:622a:1b9e:b0:403:54d7:e340 with SMTP id bp30-20020a05622a1b9e00b0040354d7e340mr11334851qtb.13.1688482317126;
        Tue, 04 Jul 2023 07:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482317; cv=none;
        d=google.com; s=arc-20160816;
        b=V2xHiZbraFIHUqeSjIbfFwnVmJ073h3hqROWiDmMYnrDZW2gyMkd2i8iOjAhJTlI79
         2OVbt593xiDZNB1upjXiwiC4MvVoOCEIMpm+LdpF9kST3PvGrP1B6V4l9Cykp7U3PWFK
         kjS4nKJNhjKcrdBjsukF21aAiGJiaShjntksBe5K/hKiTxZ7/aEm4veZhXZ2/YpUWZyK
         Ix5bdf/ecfHRzaiHuxf5X4kMm+u4v5NGcK2W0byqE1/oqpNv7ork6ZRJRNLYDzJ3TatL
         ZDU+CRRNptnKqI8bysZ8vVftQD9H++aKQ+PW+oOhXetdtBHHb5Kcz0VBNAcPJxm3y/lx
         941Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dgWYaksSJaOtaePi8Z6uVzlBPseEZMVW7Vioeltdwwg=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=SKBdXORb+wenwFoLL4cJy7R96KYMzhbfXTl5O/zVm4M8Ov6nm+l8NJUqtPjtwr4Sgs
         oAFuikq9x8MA35KwsDtZ7q4xXwDyEXUHeIhdViJBlPFzow6slpvxE5wn6GDSMLDn3FmE
         mBd5h/OHtXuMblwG3A1h9RysfI0ya+jhqaFf7SLkm4Sa+m1uYTeVbud5SIf4YZ/A4vyD
         d77r0U9vzR2H0QmYTjktra2eCmPwvvPWedB9reJ2wo6WHqOdEgKt0eisUKKmn0URXaBl
         iy04Jw5ZMa0djrP/kzcqlFX80E0o+dAfQUDawmrmMfETg+fPpZdMO2tMVNh7XFKrmhq2
         sm3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkAdqkx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05622a010400b00401e76746b8si11404894qtw.651.2023.07.04.07.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkAdqkx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhNH-0004UU-1l; Tue, 04 Jul 2023 10:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMq-00049s-H6
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMn-00035e-T6
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3142970df44so4046881f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482256; x=1691074256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgWYaksSJaOtaePi8Z6uVzlBPseEZMVW7Vioeltdwwg=;
 b=lkAdqkx653X4o9NMfbfuxXpqzYhzCsDeI2xC9GFs59Ec1kHZggnAe4xQW0aUPyma01
 OrFHMnGFq7Qzm7HjHPmUGU3MhRpc3IssBFA4GyI14PUdKodRoLtLPRTq4sL234fGdxe6
 8NOESHFt8DT9pYTiQFuVpLami0HE+PfHWdbQVQOihe8z5cl60mLG4xKVH5oNWz4b6am9
 ckfKJ/aNlrx7baamol6TweP86vjBw9x9h/3oZ07GZAIYFQT8XjA57qQxJ5WuHFeyBIJN
 AC6BWIKmmIC7BVH+IWO1bVs2GXtrORlJFAes0EyUBMcdcbt0ot7x3Wa9h0w8zyQzjG+q
 F8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482256; x=1691074256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgWYaksSJaOtaePi8Z6uVzlBPseEZMVW7Vioeltdwwg=;
 b=bVinYbWLLmJHvyGCQHR50vVZsV+pVSD9ddQp/Kcw0ETT9pBQfWuaKqjVqWMU4LVKAm
 xDj9YIH0ZjnsJTIxtq6n58jD0vuq4Pn0QKbMJwf+YyPtbtQR4Tp6m6urCjhV5W2q2DWM
 Sohc4M0W3j0h1zmU6BTG87rjB3t5IO3W4zW3Yb73+rXzZNsz9KLImeVD1EeGkXde0YZL
 uMbIuRYCXtifDaFYYYUjkj2JA4Tho+qBvyQ7hyqh+TumyTv6UsL+ijK/ZXczX2W1Nas8
 M2s4K6owpbpWWwm+DFlg9DF6WyI/A9hS3hhE0HwCH7iJNwCSL6eRblYMmgTdJxUSNi6Y
 CoOQ==
X-Gm-Message-State: ABy/qLaRGPd7iX+L+8LI0eLWnEVELd7jXyhdu4QkhSeO1ObA7qKgZOdc
 YBxwBc2xUetzDkA9b3Zr7Jkr8A==
X-Received: by 2002:adf:eb8c:0:b0:314:2ba3:15dd with SMTP id
 t12-20020adfeb8c000000b003142ba315ddmr8043553wrn.16.1688482256402; 
 Tue, 04 Jul 2023 07:50:56 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d4908000000b0031432c2fb95sm7226101wrq.88.2023.07.04.07.50.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:50:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/19] hw/timer/arm_timer: Extract arm_timer_reset_hold()
Date: Tue,  4 Jul 2023 16:50:01 +0200
Message-Id: <20230704145012.49870-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k2AwPQl8ZIeJ

Extract arm_timer_reset_hold() before converting this model to
QOM/QDev in few commits. This will become our ResettableHoldPhase
handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 8dae845998..0d7fac4d78 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -172,13 +172,20 @@ static const VMStateDescription vmstate_arm_timer = {
     }
 };
 
+static void arm_timer_reset_hold(ArmTimer *s)
+{
+    s->limit = 0;
+    s->int_level = 0;
+    s->control = TIMER_CTRL_IE;
+}
+
 static ArmTimer *arm_timer_init(uint32_t freq)
 {
     ArmTimer *s;
 
     s = g_new0(ArmTimer, 1);
     s->freq = freq;
-    s->control = TIMER_CTRL_IE;
+    arm_timer_reset_hold(s);
 
     s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
-- 
2.38.1

