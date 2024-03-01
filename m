Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1245485eja;
        Fri, 1 Mar 2024 10:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLWUhQjx4kh58qtwdBSEb5KnNThAbVIrVWRnqBdEoWrcJxamNJFuqbbcjtGj1mkfL7iY83uqLlRSprnl6WvBROR05pp/gl
X-Google-Smtp-Source: AGHT+IEcmCA8paCHs0KtieyyudKrWW1QcEvRk1FjI5LlcL97P7okA/a8HCweUTXcf9XqDAcA5EI3
X-Received: by 2002:ac8:5d4b:0:b0:42e:74bb:6918 with SMTP id g11-20020ac85d4b000000b0042e74bb6918mr2627163qtx.1.1709317997176;
        Fri, 01 Mar 2024 10:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709317997; cv=none;
        d=google.com; s=arc-20160816;
        b=iN2Mj/FOVq/T/a+s/FYAY9wOGsozN7kBhrGZ76hzXzM/DVyHD0SJ9TCfzutl3gK9nK
         mAoyttJYkny4kOJ3gsuywhYDuaJf7tYGQCW/5vhfNW5pDIaZl5802jniD2ddFt6JtNBo
         HC8ZUAAcw2y2UIWZjz+G0oypVA5MGKRzYoo6r0W2z3jNztJC7Im5w9mbw1oWHAoDW5ln
         5gRBQsGp/EabmzJzIvF/l/+0RszoTcwS7EaawSNwmM/xgVCMUocABK80GJA9quWDU2RZ
         TkjwWihKaIlzv6B/HsHoazvBExfix0AsWsLIPE95JsI8dcw6A1LE9Wqs/r4NUMqOOID4
         jFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9JEZmlz8rcZzNAyfALikSOUnOYbC8gIs8wauxLnIi0o=;
        fh=x4yV6W++5EDM2T8pvDWfrYghCgb7XqbEnMjseNXnlds=;
        b=fIGSk86z0Jn4NjS2Pm61O78zbYXU7lbGrCLV7eujdJDtuglaSXg+/T/yfm29Pcf7yE
         HfvkBg1rQ/LhJJLDA2ZABoiwYbm/BA855ykML30nBT5gA427xnGXzhHxiiIKu12E5Xgf
         gcy5z+dwi67QQJO+aVc1A7um38BszgZWzg0lYFcoHoeb6vYuM1p1g8N8fmseCHn6X9JK
         RBySh5pKhF20CIbAL8jA4emJ57AJf4/LOakP/eepltA8cfoMLbXWqrcvab96eJ7KBhie
         /7C8zn3YVO4FxTPruKJ6O8Xs5rdRXMfilYXYa0yJ2kn7TOmaou3hrQT0WXIlJ9TMFy0z
         2cIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z5js9U12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac85e4d000000b0042ec1e0d8c9si3474054qtx.397.2024.03.01.10.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 10:33:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z5js9U12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg7gS-0006T8-NE; Fri, 01 Mar 2024 13:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gK-0006PV-7M
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:30 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gG-0008Kr-8H
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33dd2f0a0c4so1318240f8f.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 10:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709317943; x=1709922743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9JEZmlz8rcZzNAyfALikSOUnOYbC8gIs8wauxLnIi0o=;
 b=Z5js9U12/Dkpl5Kpn6ukVxb8HgTdViDDB4vV6AWSCQmArVZ5lxZkqOBlLlljOwamlN
 MFMNtGH+g6Hvt+CBo8o8o8v7ih+Fdt2Dq+vLulSBB1JybVD48Jv3jdWXXIRDtOQDo8P/
 xbVY1HMATvpcE3Ywqie1W/ejHAQDWxvcNeUl0bynEBgxb6IR35kESNW/Wv50aAklGwA5
 5dvSeN+F4o5eftP14L27Eb7QkMsR1gntpTJe+50UwTFRY0kvz0z2vJAFzfv4J3iO8sIM
 Y+wvSDPvTTNPMFK2Ddnx9wupZ6PluEZijEuxIujUL/7nUn32XQ6Bl1++GvOEV6Uz3wCP
 pvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709317943; x=1709922743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JEZmlz8rcZzNAyfALikSOUnOYbC8gIs8wauxLnIi0o=;
 b=Ofptb8cUdGOTyz3E/vbyEw/ioNvLk/RHugzTk8dHrRSb2M4HTtWKljkt+BI0HL4XAD
 SFja0tBXrhgGdkq6Swo5/ZPgkuOmGat49rtqFPe/n6YFSxscfv9lWxtk7udwPgK6ixhm
 b5rQInkcqrBzAGO3OvRZrBMFkhWZlwZTLQ3364Any9FwRuLDwcEQwiBgu4GeQif/+++L
 RVauXt+YzDYkEPhtPkJncg7e5z0lUyN4mhi2MVyH8J8f1AH+6W8qVjnsFXjrVhuGBFda
 cbmi1RL1dLLIX4GqNA0fWfcryQgLfH1sbt12P3/k6+jRvv4md0l3Afn+m0FcdL+UiACq
 ZwOg==
X-Gm-Message-State: AOJu0YzQDmDWYa0yoGc8RaLwkamVS6Xm4FRmVTwhahqhsPJ52zSTAz4X
 mF3gHpxVDK78pVy5CBDTR/o0MG0zjbHPQIMGUe/B4W1NSws9ogzpdq7LC4dYunxPz7o/wBUZBrj
 2
X-Received: by 2002:adf:a11e:0:b0:33d:b2fe:763c with SMTP id
 o30-20020adfa11e000000b0033db2fe763cmr1662534wro.33.1709317942908; 
 Fri, 01 Mar 2024 10:32:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfeb42000000b0033b483d1abcsm5158934wrn.53.2024.03.01.10.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:32:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 4/8] target/arm: Don't allow RES0 CNTHCTL_EL2 bits to be
 written
Date: Fri,  1 Mar 2024 18:32:15 +0000
Message-Id: <20240301183219.2424889-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301183219.2424889-1-peter.maydell@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: ESFd9Dz8J+Ph

Don't allow the guest to write CNTHCTL_EL2 bits which don't exist.
This is not strictly architecturally required, but it is how we've
tended to implement registers more recently.

In particular, bits [19:18] are only present with FEAT_RME,
and bits [17:12] will only be present with FEAT_ECV.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1c82d12a883..8ec61c12440 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2968,6 +2968,24 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t oldval = env->cp15.cnthctl_el2;
+    uint32_t valid_mask =
+        R_CNTHCTL_EL0PCTEN_MASK |
+        R_CNTHCTL_EL0VCTEN_MASK |
+        R_CNTHCTL_EVNTEN_MASK |
+        R_CNTHCTL_EVNTDIR_MASK |
+        R_CNTHCTL_EVNTI_MASK |
+        R_CNTHCTL_EL0VTEN_MASK |
+        R_CNTHCTL_EL0PTEN_MASK |
+        R_CNTHCTL_EL1PCTEN_MASK |
+        R_CNTHCTL_EL1PTEN_MASK;
+
+    if (cpu_isar_feature(aa64_rme, cpu)) {
+        valid_mask |= R_CNTHCTL_CNTVMASK_MASK | R_CNTHCTL_CNTPMASK_MASK;
+    }
+
+    /* Clear RES0 bits */
+    value &= valid_mask;
+
     raw_write(env, ri, value);
 
     if ((oldval ^ value) & R_CNTHCTL_CNTVMASK_MASK) {
-- 
2.34.1

