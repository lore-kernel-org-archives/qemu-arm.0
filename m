Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3318712lft;
        Tue, 28 Jun 2022 08:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sSFOe8cl1p8I35z5Y1F8fUHJ5JDpL6ZlsQAKcgrXxhkbM6sfbwWt4I6uwVmz3VMEWXVBIN
X-Received: by 2002:a05:622a:20a:b0:304:f641:d715 with SMTP id b10-20020a05622a020a00b00304f641d715mr13636042qtx.436.1656431275631;
        Tue, 28 Jun 2022 08:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656431275; cv=none;
        d=google.com; s=arc-20160816;
        b=LTS97KVqWpuarfEVmc8sIZSVBT54LroqkpLH6IBTkNB+t8fbPB04b9ICoeOlHH21oL
         y+iNGMw0mrQheB1MgpeQypbJ+vqiTqDdzcviozU+vLiucRTxegoAxAhCRuv79i8R/4+P
         TEFAYSITaw+uS1JNBKSbu1hlB2jl2jWFrFYtV78GcpNXWytFvq7ZeEV2Lk/wU4zUNxjn
         I44Khmr7+EINOd9O6OAn3MHe8gNtoYjOYbJPHrNatHOgT9itrOOULVwuHjFpF29W/vj3
         lrN/nZXZGOHR1wKGxjNd2Si6f+TqY+FMjuXCLlkYVLggtLy2gu1kPBSZ1SaPoNUdMrQC
         k73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JiuCEj2xQ/c91sEvynV74DJKiJu/V4mqw+6nB9+yEdQ=;
        b=eJh17d+R2w9V/+jJ6ew4tMIZV98P7ufYF6pqbsBMdSvhIj5TISi6ndcWrQqtZkzpOP
         897yhEQ++FgZW2MZPinBQvRVMIIsH/5Pbr3sFj/FNyUBDWUsa/XqDWdZQjALcXrG+QKN
         e66d7wuRxNU4zS+VfCroevJh9WoV5bpIr1kIGxX+xzFDjZtdximgZxsjVIrXFIPaFJn4
         8byWPRWdTwFLR0lDBlONUnZDXTo+r73uLGKuh3qvZklV/ZVFWGQ4ySpld8Gcsu0Z65lP
         QZekfwOLDk0IZDQuP6/0JdbyOEmDbqvKa4MF2VkTPhtjAJLY94Qt3JM/SlFTQbVWfmMp
         fpGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yIwrxxkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a05622a018400b0030520d5b5a1si2241178qtw.134.2022.06.28.08.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 08:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yIwrxxkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6DRT-0003BE-3h
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 11:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DR5-00039Y-No
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 11:47:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DR3-0001bk-ML
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 11:47:31 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so7010304wmp.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jun 2022 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiuCEj2xQ/c91sEvynV74DJKiJu/V4mqw+6nB9+yEdQ=;
 b=yIwrxxkqNwYp5yvOoY7x8EVXbRsTBpnyK+IhgM96oI1uveIrHgG6Dvtcop0hRfJHYa
 BC25xhr14SEUY/n0XgXlJ/PN4hxC08AbQZKHKqZTuxq6/Le9VqsV6fvEnVTQPewoUYC1
 hvTr3E4V6oAM8UDT33vTqALQTl0p+LEjJA5dRHU/vZnzOYoj7Whz1tZ8/unOhkcjt9S4
 0iAfneP18EtJy4m6MNze6tUNrW/F1n+K0hhJpSF8YWTsYnZT5vB7EXleCW4moIsoymXX
 h+z3Ag0LEr1BPsXJNFjEkIuu/UxkkVc8GUkC8P3B5kF2KuSLuQ9CqEQMZhm32obIDx+O
 K4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiuCEj2xQ/c91sEvynV74DJKiJu/V4mqw+6nB9+yEdQ=;
 b=4G/btCnkBvOiWk89qPwUHW6ngN7b1PzJ09ob7Ze68FeDIlqyEu0q5qABfLQIoZgx8l
 1PPETsxJkn/1LCEWJG+HaRstJgkzKqXaf2hK786w9dR+8kOnx/icd3ClRDKTaDV+24b5
 nq9MNN2LcF7KNAFkwjvkWcpl4rtU4kiVKA8b4wre5NZzqxMViY5l1HL7k3OOZzN6JM5h
 9iBFhOM+lihZvVU8ZcZHLtsWIwY/wKkmTO4QpjOZusaoohiZZTbrDjwMaquPthA8XHv4
 +NUic1oKJUoe6i4nyhgZLNVydQzFTesQbiZTCsz891+E1/0m+0bTkV+pU1Wp0hoCzLS/
 oE4w==
X-Gm-Message-State: AJIora+lJzuu+flmLbd0UFfDuR6Di6BArnaJZjZEeSjpjVqnGsMDIog6
 yH8kIxWwsHbHmHAfPULBO5QkRtNaNjXNUA==
X-Received: by 2002:a05:600c:1d25:b0:3a0:4cc8:f644 with SMTP id
 l37-20020a05600c1d2500b003a04cc8f644mr261764wms.121.1656431246985; 
 Tue, 28 Jun 2022 08:47:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a0560001a4300b0021b9cc87aa9sm14231990wry.111.2022.06.28.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:47:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Igor=20Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Subject: [PATCH] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is
 being held high
Date: Tue, 28 Jun 2022 16:47:24 +0100
Message-Id: <20220628154724.3297442-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +DRdq8o7HvtR

In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
be set to the Pending state:
 A) when the input line is high and the interrupt is not Active
 B) when the input line transitions from low to high and the interrupt
    is Active
(Note that the first of these is an ongoing condition, and the
second is a point-in-time event.)

This can be rephrased as:
 1 when the line goes from low to high, set Pending
 2 when Active goes from 1 to 0, if line is high then set Pending
 3 ignore attempts to clear Pending when the line is high
   and Active is 0

where 1 covers both B and one of the "transition into condition A"
cases, 2 deals with the other "transition into condition A"
possibility, and 3 is "don't drop Pending if we're already in
condition A".  Transitions out of condition A don't affect Pending
state.

We handle case 1 in set_irq_level(). For an interrupt (as opposed
to other kinds of exception) the only place where we clear Active
is in armv7m_nvic_complete_irq(), where we handle case 2 by
checking for whether we need to re-pend the exception. For case 3,
the only places where we clear Pending state on an interrupt are in
armv7m_nvic_acknowledge_irq() (where we are setting Active so it
doesn't count) and for writes to NVIC_CPSRn.

It is the "write to NVIC_ICPRn" case that we missed: we must ignore
this if the input line is high and the interrupt is not Active.
(This required behaviour is differently and perhaps more clearly
stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
that implies it.)

Reported-by: Igor Kotrasiński <i.kotrasinsk@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Simple change, commit message long because I included all
the analysis that we haven't forgotten any other cases.
This is essentially the change Igor suggested in the qemu-arm
thread, but it took me a while to find time to audit the code
to confirm that was the only change we needed here.
---
 hw/intc/armv7m_nvic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 13df002ce4d..1f7763964c3 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2389,8 +2389,15 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
         startvec = 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
+            /*
+             * Note that if the input line is still held high and the interrupt
+             * is not active then rule R_CVJS requires that the Pending state
+             * remains set; in that case we mustn't let it be cleared.
+             */
             if (value & (1 << i) &&
-                (attrs.secure || s->itns[startvec + i])) {
+                (attrs.secure || s->itns[startvec + i]) &&
+                !(setval == 0 && s->vectors[startvec + i].level &&
+                  !s->vectors[startvec + i].active)) {
                 s->vectors[startvec + i].pending = setval;
             }
         }
-- 
2.25.1

