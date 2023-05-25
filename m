Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788230ejb;
        Thu, 25 May 2023 16:27:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FVxM1eEOvHRdpUIh8zUm2LCukew+xs9qQLS3z56zEF0AzVcVN/lore4pgh4COBJMpswHT
X-Received: by 2002:ac8:4e8a:0:b0:3f7:c88a:57fd with SMTP id 10-20020ac84e8a000000b003f7c88a57fdmr135015qtp.35.1685057258544;
        Thu, 25 May 2023 16:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057258; cv=none;
        d=google.com; s=arc-20160816;
        b=WtjMHPinU/qnsadvt2iQr24q/H/YWeY60W5OyNTJty7PY4jvf32z4LyQRTm6ERALIn
         QpjcFqLh8U73ukY5Dtzy2NInQ+Or43sHSKaRgs86DVVQG3rZjYoZLem7mXY5yPvTlkfK
         QkhqwkB8eANGoHk4LuNX6YaQ/V35mDwYdt3m0Xz1ho79RXmMD7n/x6/N9QBVeNE6oD1a
         Atn3sZp6HdcNy3F1vypC5Hou60SdN/cxkhMdNCS9js8ujyi1LFcU3Fqk1gloNJwjxM75
         MX14nNPN8oJEiwAZz9bA/w9rEM7EM4f7BbhK8TRP9HNZXmfgskO4L02V+HyFvuZhccFP
         Fx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CpvW00ddRwDH07plculUro7MWZapiIBGBi2vNxmqeJQ=;
        b=T5v/CB1VZ7u1le4opau5oxw8UWKkXQKDI3SkVFsyg44kqArbEEMK0ZkPEp9m7p0isM
         d32ALONEfwEgpzc1esRIjMzAKSG8CczLZgZZGusg9SohxL1eFzWmTWAJp2Kqiq+WtN03
         SsJ259AsQ/d/YfTc+r84GpOwsMDwAXRWT82xzKiNx/SrjrxyHZ1j6Dfwp2kaoBp+Usi+
         Yssmq8GEPjEuJCFUpB1D2YoLaKw7TFY7u0dZC+RIR/f9kwuMymL/ZAcTN67TaD6v6h7/
         qQoAx8ce8/zFPFZsuSFTIHtLkijOunGn8dSQm17pXYZUoqUqV5xW9346okw5azqR2AOe
         CVHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmLT9cUC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020ac85a4e000000b003e4e314252dsi906675qta.509.2023.05.25.16.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmLT9cUC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q2KLa-0005rT-Lr; Thu, 25 May 2023 19:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLP-0005mW-QS
 for qemu-devel@nongnu.org; Thu, 25 May 2023 19:26:12 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLJ-0005kk-Sc
 for qemu-devel@nongnu.org; Thu, 25 May 2023 19:26:07 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d5b4c3ffeso246915b3a.2
 for <qemu-devel@nongnu.org>; Thu, 25 May 2023 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057160; x=1687649160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpvW00ddRwDH07plculUro7MWZapiIBGBi2vNxmqeJQ=;
 b=NmLT9cUCjY7lmLmkbl/x9Mf79s4BA4rcDsWaTasq5DcYrcbZ2kkUm/WSTPZRK/cbGz
 RAj0xtCdCVeXPNmHzAR/hvW6mBuliYKkDxR8wL8LxxYXZxKVg0Af2+eBhz/gjLEWp4gO
 A0GbAniNNmhDBkkO1tVZOqQ3fdK5oLBRP+Ex4WP8oAaNNRT0GbvVStmClfFIVIQ4N7t/
 R5dMMJ8WTdR4bfs+gG8ldSpuvoFXck84CLHx8id68dEu8Hw75p1DfqyRxlhe/T6RlL+1
 XdgQUAzgoEWsrWWPF1LSwDxmITNdhV78TymWbbgvDTSKjJqUoOOoZ3fKrog8tuM0wra/
 z23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057160; x=1687649160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CpvW00ddRwDH07plculUro7MWZapiIBGBi2vNxmqeJQ=;
 b=jaBiPmeZOIMDyjuf3ZEEqW2FjGqDwIUD8Y1w/XfCZ82zn5gyBZOJLltudionZhtSsx
 WZhmivN76tdHg3FPUnW8hIkgZf+f5HUl3CCDkzAqD+RpDHMvT+GqgYfkz2wdewKV/vbc
 bf4ND1W8HeUZ9ArHsIjjRfgN/6iYVZhnAmxYs4R89IOOxdxoI5RWxJeWQOME7HZS5WJr
 AP56C7LKOFQUe7ArmU+Ro4LVxKeDNmVoevYS3rbe09LbtgS2brabX4FtgnkLKdRh2sO5
 akioRBL6QG/gvwtqnDC3nEYz2KaZDaQuzOWS+L2HKnOWyAOhmvVP4VwqDWWJsY4TYMxc
 Tbmg==
X-Gm-Message-State: AC+VfDym1Jj5Ho8GE4i9RMzHAIysqxPtCa/tJ6Olp1QGvnqK2DHQ8ymz
 HEaSSFH7JpdOesaamy9OXK1m2RGIKVOPr3RhXkA=
X-Received: by 2002:a17:903:482:b0:1ad:e633:ee96 with SMTP id
 jj2-20020a170903048200b001ade633ee96mr290051plb.55.1685057160416; 
 Thu, 25 May 2023 16:26:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 01/20] target/arm: Add commentary for
 CPUARMState.exclusive_high
Date: Thu, 25 May 2023 16:25:39 -0700
Message-Id: <20230525232558.1758967-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: ++vz6smOPirA

Document the meaning of exclusive_high in a big-endian context,
and why we can't change it now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d469a2637b..4e16eab82e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -677,8 +677,15 @@ typedef struct CPUArchState {
         uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
         uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
     } vfp;
+
     uint64_t exclusive_addr;
     uint64_t exclusive_val;
+    /*
+     * Contains the 'val' for the second 64-bit register of LDXP, which comes
+     * from the higher address, not the high part of a complete 128-bit value.
+     * This is perhaps confusingly named, but the name is now baked into the
+     * migration format.
+     */
     uint64_t exclusive_high;
 
     /* iwMMXt coprocessor state.  */
-- 
2.34.1

