Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545775ejb;
        Fri, 2 Jun 2023 19:39:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rIn0FgTgXeXX9luJ4omQNvasnJjQhHmCLbiDF1z4NUtwZT8nsjsUFbrOm5zSAgY/svLpL
X-Received: by 2002:a05:6214:300a:b0:628:4d91:78af with SMTP id ke10-20020a056214300a00b006284d9178afmr262630qvb.62.1685759960522;
        Fri, 02 Jun 2023 19:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759960; cv=none;
        d=google.com; s=arc-20160816;
        b=BcvfN5e0VJ+sox46QJEYwFGEysezrBUGuhpxqKQfF6qRFPPreqAGEwu5lduVeRNfyM
         hvxh0BiZRa2l0ZgJuTKGTRxSK8d/emROWwwyV9gpEHhxTOIpnBwdcfB8DaEIgz3eDs7n
         hpclza3brH/WqkljJhhUCEquqpVoQ6FF7g8JqFqjc8xO35PE/ake8vzk0c5Ww8pSpvNs
         QO1zMuJxQbX79IGtYtu+nm63NQpD8nJOTtqmnKq8i42hy801Df+XNNqG/G8FD+1WhWOG
         VmgWF6teYl0rqs7Nnq63zdidIN6Yl1XCpxpJkrI4vC5rYFxKdJW6mx5aa55bZGH8/nS0
         Nz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KjbdSIi7AgQurj1OT59iZ2YBwJtnwTAVxN3qZ4NMVr0=;
        b=eenHmp8pNkP1tX+N9Z0iiXOmlmNviMOvTHkBZhU3XT7ZlW8fiZIHLbfKD2mu+pNZTp
         0nW810YjEEW+17laaTinK4ABichp3Uq5kOGx42KVQZPRdXMSWD5zLMrTBFg3zvuS53No
         CGRW8yjRQUgkmqUWgWCIkT0mSvYjPto46yH4hdgUgI4ZNjvf7vfJVXn8Zb779kONRZFb
         kCnwfFXFfuO+PHJOmTziSPplPlMNsnwyftcT4l4H2YKQjkykO2SJQwxPoAzjtHt6vfIR
         vfsUg4xac4eAADkDJVaJqR6isk9cdm0ce/49OecgisMZWRhfU5EcgysTuSANnMsnnwOH
         RGaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xN+me5Ne;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020ad45ca9000000b0062593095d19si1746807qvh.475.2023.06.02.19.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xN+me5Ne;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H7T-0001ZK-0y; Fri, 02 Jun 2023 22:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6e-0000ca-B7
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:05 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0004j7-Lq
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:03 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6af6de9fb74so2490962a34.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759690; x=1688351690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjbdSIi7AgQurj1OT59iZ2YBwJtnwTAVxN3qZ4NMVr0=;
 b=xN+me5NeFll1hb8CNm18UjfyRJJTTCflg+QGVAVSXSDP1GSrRTNBnFgF2CinLlWMBA
 0SPyQ3hGIYlWUigkIDIWY9OszUiXTHKLMHxgXv41vNYwmVwT+vnZG5tESMGg8OQkeFFU
 bHOmg1LC1eIlr5ahLFQ2B4uFXITEk0qexoh6ojNMvEhmL57nSBabjUXy7KEA+f8jsdiP
 zBmltHFZkFX1W0JefwdVdL+3nsTkOZ+jeBLzlUstnJsCWxNrH3KSAxCo55yR2rt116dy
 Ovn8zePeXW4DxCjZ8GVcZY/q2ZwWLZamOL/7Wy7UYZAgure5Aoik19AL5+GD806cmbX3
 N1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759690; x=1688351690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjbdSIi7AgQurj1OT59iZ2YBwJtnwTAVxN3qZ4NMVr0=;
 b=Ry75eIJbQsznslbYISmFXllQJkAOqGWZijB2GbaIs0/aTgtQgNP708qkHu4TH0/TuL
 IWpGvBuWrp41j5e861wCpDb7zsGTaYDOrQbj8UQF9pDyG13049sxVKYTlyCEIGSTWkSF
 mLQ/nwzWDy1d+RMYILJsTB2fEiEP6VPo01jqCuoSEnwILXNn4S9S9QYG3mpmYS/IkCim
 IZO+a35XLCKGRYxjIXBnGChrAxXh0XEVe0DzUQ2bEXW2CiGyHtii5mvSvWduTcY65iI1
 6yOMRvdGiJsefXlOwtjkcdqORjRzKm35LjZx+6tqVDZwaM95V9fsjJI0oDRLBZ1+Ugy9
 Cd5A==
X-Gm-Message-State: AC+VfDynaLub0xSAIdvMZUEpOk5DUYdWabWbFtfqPX3iKQjUeAhRGtaI
 YG+onQcG9MA4OtLNUM65lFpo3/2TkHdM/6NtPM8=
X-Received: by 2002:a05:6358:cd22:b0:127:fb1b:6b16 with SMTP id
 gv34-20020a056358cd2200b00127fb1b6b16mr1458591rwb.15.1685759689753; 
 Fri, 02 Jun 2023 19:34:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 24/35] target/riscv: Use aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:15 -0700
Message-Id: <20230603023426.1064431-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
X-TUID: 68eu37KkP2Yd

This implements the AES64ESM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 64004b2329..71694b787c 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -196,7 +196,16 @@ static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
 
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, true);
+    AESState t, z = { };
+
+    /*
+     * This instruction does not include a round key,
+     * so supply a zero to our primitive.
+     */
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_MC_AK(&t, &t, &z, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

