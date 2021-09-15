Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp503237lfp;
        Wed, 15 Sep 2021 13:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws5f8bw+ctPpUwYYJuqe/gA6whdzjHCedN5vmI5V0XzgRa1Qnc3Mk96iGqsoUbZ8jfQO+D
X-Received: by 2002:ac8:498e:: with SMTP id f14mr1883966qtq.354.1631739574541;
        Wed, 15 Sep 2021 13:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631739574; cv=none;
        d=google.com; s=arc-20160816;
        b=aTDGYAkE77PNJ19KlSUFgTjGzXfRT0LUJTVspLuEf99sd+RLsuD2O3vBfrSn77BfLe
         KcFQDCx2zRMQI0EZGKxg9kJJ2R7uRhsEEzphpaSVRbmA9ZDdk59fuuwOIV3lCcjzQgZe
         FfMYgltXQsZDj+Xi7na+Q9vH+xYqqqKdBE2UZ++5xp90dOmEeW7+ZRImnsH9R7a3Z3ea
         EHEgFhkkro9nrc52ramCzDEO03q1xTr+1Dr0bK5zyl41Jth/EHdSWWS4FXDWGjnKA9pI
         gQm/nRluGwGORuPiehxFNAlDHMn0ODG8s7fCiYZM1+fHBSnPFC/LhBsVrAsFv/wZnTjy
         E7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ShgEHmB38y0/TC3f/A3ORO3pKSaLl3lYLY7Mc+AkT8w=;
        b=rZ5bzb7hu6Mu00hx/14rBKrZhPy1Pj1yZqOgAM3Mnuz+7FRYW2hlJstT3Qoj5g2+ea
         CiClLNkjy00zjufaZOY3wNXAjI9wlG2kTQ/ONuZAjT3GbE9lvFn0mzK+BkTrhvCP4cJl
         xmAsVe81z0/KeQ1poSN/5jw40JeAghZL97snOKskgLHXcI/kmdXCGYGJ4hueXzdAjNPn
         DoMUbfe80y4rOaHa+yRQl1OnU9rlGaYxt6rRxzT+i+orcLQOpEq5xFZVXYkz/H4l7oEG
         zGIdtX+oXV+n/5sYUN8aFqyWSWGCHQ8J+CnnC7PuI3W7F9qNENqaXNZzwD4ILn42gbtL
         ZEUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dWuo4fOo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si625341qkl.175.2021.09.15.13.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 13:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dWuo4fOo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQc0E-0008GI-0v
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 16:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mQbyy-0006kv-Pa
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 16:58:16 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mQbyv-0005U4-0t
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 16:58:15 -0400
Received: by mail-qk1-x72c.google.com with SMTP id a66so5083218qkc.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShgEHmB38y0/TC3f/A3ORO3pKSaLl3lYLY7Mc+AkT8w=;
 b=dWuo4fOoDR7yOPpYf8vHoEVHVns+DM4YaT82woqtM1EhLfUtvWohQu+8AwQ4grJOIP
 xFFSdFrYexMayt9LWxLbOY3hUfX9moP3DITiHyDLmmyE+F39QWfD36Yl1GxGgxiQGp7K
 tzVVhiPJDzlT6LCP2INxAfPIGAmftIbeYD5oLMsqP3XAlF30WmvlcGdGK8wsMnrrZObM
 xPlea1RIQQTEyeoNLgqFhtvMPM3QGn+50c6KCEo8q5hCZ/mhfBLSr8bezxsPncVBuLmk
 RUibCC+SffQUGA7BNurPloVRHy9i6osncm+rE3JGP+keM6SB/RpUoqxeRhBvMgTySRGM
 j1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShgEHmB38y0/TC3f/A3ORO3pKSaLl3lYLY7Mc+AkT8w=;
 b=xIPoYI3Hz5fzpHV+UZL1kEAP3ObaON8dgTb88HU0obDsuIS+/S2pmu9uFzf7YTVX4m
 FwMKp77qa7WZ/MVS3XPl9mDcv3IbP+K81mPeflNWE8OW53VWTG6+tIzNEhsQU9ill0Qu
 eC5Z6hr7QTv3nn1vnMGdaldAcn3ClbY1F/jjf1WDducETk/1ODVrLHRINTghhUKcdhyp
 hwsqwgZRALQJaAN9coYdxU8ClI/DC/Vk8RdeBpCtCWa5goPM6SJVoZ2Ww5eNWoTKW0C/
 9V5DJWuuKpwv3E7hkaImv/XGEf9zjh81g3Hio2kwEx7ylumtjxKse5MUNxRV+CrPIuqP
 /TZQ==
X-Gm-Message-State: AOAM530ftPtkWFNJKZqx3dioPNlAcKWrxhak5Nv1a128CBQQLQWWOsAl
 +179cC+E9OfkkEgj5ZrjjawMpQ==
X-Received: by 2002:a37:803:: with SMTP id 3mr1872521qki.127.1631739491669;
 Wed, 15 Sep 2021 13:58:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id q22sm778080qtn.25.2021.09.15.13.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 13:58:10 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH] hw/intc: GIC maintenance interrupt not triggered
Date: Wed, 15 Sep 2021 16:58:09 -0400
Message-Id: <20210915205809.59068-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kb+h64MdFlVw

During sbsa acs level 3 testing,it is seen that the GIC
maintenance interrupts are not triggered and the related test
cases failed.On debugging the cause,found that the value of
MISR register (from maintenance_interrupt_state()) was being
passed to qemu_set_irq() as level.Updated logic to set level
to 1 if any of the maintenance interrupt attributes are set.
Confirmed that the GIC maintanence interrupts are triggered and
sbsa acs test cases passed with this change.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 462a35f66e..34691d4fe2 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -418,7 +418,9 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
     }
 
     if (cs->ich_hcr_el2 & ICH_HCR_EL2_EN) {
-        maintlevel = maintenance_interrupt_state(cs);
+        if (maintenance_interrupt_state(cs)) {
+            maintlevel = 1;
+        }
     }
 
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel,
-- 
2.27.0

