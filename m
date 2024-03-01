Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1245882eja;
        Fri, 1 Mar 2024 10:34:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTTBIdvapJBQAovgsSSXlgTmqyvoneSOU2PcIcV5C8+i6tQPk817n62E6vGkLWYiWWCLj0tqgKSjQT3vRfhAnHn8SP8AAG
X-Google-Smtp-Source: AGHT+IFQgMW+d0y21UcmBdQVApYc1jm6i8yg+cRZQOcWJoTV8iVE6rHNrNzOB4xDFSXyy77lEldQ
X-Received: by 2002:a05:620a:12d2:b0:788:12f2:7536 with SMTP id e18-20020a05620a12d200b0078812f27536mr927348qkl.4.1709318041273;
        Fri, 01 Mar 2024 10:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709318041; cv=none;
        d=google.com; s=arc-20160816;
        b=C1OvAfwPJQURiw/EcfalkN61ohesjfdrgy9B0evcSqa2plt6dzM8/D4fubM6SUsbmg
         6t0+Cj7PsopcD84ldS8yxo11gb4Du4Gs0YRw90pv84hLjmvxS44fMpwTwbOFoHYKDTgs
         kxBF6JnImzSvzXvS0V7IAaiCexLLo0fnJ5IBWmaHk6ZCjAkgSqMWa5C7Nufox1VO24gq
         hrF5e3OH33X2+ewUaKnVa9DXXHyM2SduaX5P+F21xr5o3kKZ4ZhABqzCTFjlp0eMMtKL
         Bx0qxmYSx5oANL7SFTrIdwjjV61dZwwMlCecUd246qcn3sbcjFbr2q0KRveucaMAwCuw
         mOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ug89tsgOuUzq4MSu20MZm19VI4nBxO1N6UPUttck1FU=;
        fh=x4yV6W++5EDM2T8pvDWfrYghCgb7XqbEnMjseNXnlds=;
        b=vOTbcRWmxbq/Vbs9NrloB5wKB/yqWkty5JLbQUltvApmYBMif5kIy4DKhczFUKeyQs
         UTIHP4ii7K5Yo0AxbMVlzQlgy3ToxbaaWT/IzB7TBfcnrP8uBLIvglCy72gIUigJzQn8
         2+fjEDFFEH7IkyrOJRR4sHqs4+WaZRRIzRMZrQ9ZVeHRduUgR9Rk7PJSOM2DuuS3woCl
         9aNbnz3Bv6259z3p7lJDDDld2pXeZB++FMWcdYgFvyy3e/fjZYEaHh8BzuiRIn08JajX
         txJOyAHeOkO1jLzAwcxgRUrj5Mk+8S1l7tgh7iDLQZX8ANdkkAOX6uxUQ++uqsJQgM0B
         N0Fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQWWLHIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25-20020a05620a201900b00787ecd1c54asi4030246qka.672.2024.03.01.10.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 10:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQWWLHIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg7gS-0006Sx-4E; Fri, 01 Mar 2024 13:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gI-0006PN-Aq
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gF-0008K9-Hl
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:25 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33e1207bba1so1402312f8f.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 10:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709317942; x=1709922742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ug89tsgOuUzq4MSu20MZm19VI4nBxO1N6UPUttck1FU=;
 b=BQWWLHIHzvh68hMEDDX9/mbZCmafIcS0q6ZDaWOYJZrtDJnClNV3cTuBP1z+6ZXS2B
 ydjMIdWq1pC/uqu9HrHE5jifA6J9aJ7lfm1fwaFObezQOwDJ0lgxYj0fqI4oHrwEC3Zl
 zJD7dleaH8snaQ4xkWL1bI/QuXJkqugPxLrS3IypMMMLgI9melY4UHWQn+WjmT4cfvc9
 VqRKiXa7AtFVsYMn/x28URTDIuLphXKjxORBOAtu77Onc2FAqagUye7hbEdOLwO6WFSg
 kEHue9AKseQzSo7z3xogZznI3pGCHmGHaTFv/6Axqytlpa1OoD+UJBXAmkrTxqkFg1g5
 jKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709317942; x=1709922742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ug89tsgOuUzq4MSu20MZm19VI4nBxO1N6UPUttck1FU=;
 b=pyvl0wRdTCHEfCKlAddG3nKd8BNXw0imTdN6+v4ii7lmyp5ONVGCgpfK+o6jaumoLT
 C++vlwUEoO6T2CKi+TIzc4dSVtzimDxfMC7YtkKn3AyjjBLSimyJ/dzQn4ZdIeFclpnh
 PNmZ6ly03p5hu95R0EcGtAJCAzUZ6sJGi0cQxrzzVRjR50zK4r9LTHErZ1QUZfc9uzTr
 hAK34hFTfOExAIMDmAG3CL3DAZxU8VGWTVmM81FPxFVr29IAaLUpkCm3mJQV+pSl3m5h
 Ry5f30UC61PVuY2Luvwafevd4O9Sq3vIy39vOxl3umYAiqMUeVTZAs0DSbR0YrgCXdXQ
 3PDw==
X-Gm-Message-State: AOJu0YwEt/IbQ7Z9n6dOIruzhJs5LyOlpljD62bJhsjhUzAiY8r58DQG
 zGDHfzauchcKAsq11Scqd+pgJuWSJ3CqUejN/Xh9GeXejhcs3mZFPvnRwLb9jycWmxbQ/wTg7WZ
 r
X-Received: by 2002:adf:ec90:0:b0:33d:746b:f365 with SMTP id
 z16-20020adfec90000000b0033d746bf365mr1762332wrn.52.1709317942051; 
 Fri, 01 Mar 2024 10:32:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfeb42000000b0033b483d1abcsm5158934wrn.53.2024.03.01.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:32:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 2/8] target/arm: Timer _EL02 registers UNDEF for E2H == 0
Date: Fri,  1 Mar 2024 18:32:13 +0000
Message-Id: <20240301183219.2424889-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301183219.2424889-1-peter.maydell@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: lpwQxEHVoi2D

The timer _EL02 registers should UNDEF for invalid accesses from EL2
or EL3 when HCR_EL2.E2H == 0, not take a cp access trap.  We were
delivering the exception to EL2 with the wrong syndrome.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 90c4fb72ce4..978df6f2823 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6551,7 +6551,7 @@ static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
         return CP_ACCESS_OK;
     }
     if (!(arm_hcr_el2_eff(env) & HCR_E2H)) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return CP_ACCESS_OK;
 }
-- 
2.34.1

