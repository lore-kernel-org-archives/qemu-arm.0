Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104368ejb;
        Thu, 8 Jun 2023 19:28:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wPr9YPiOA5kbXp6rj4dYQMvdg7LegsH2Jcz1o/exweV/fXu8/AKPj2KHLq39J732FyfXt
X-Received: by 2002:a05:622a:f:b0:3f1:381d:1067 with SMTP id x15-20020a05622a000f00b003f1381d1067mr282401qtw.42.1686277704686;
        Thu, 08 Jun 2023 19:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277704; cv=none;
        d=google.com; s=arc-20160816;
        b=nH+cn+cCJ1iXshCPUioOdbNq3vkz0+4mD22Y3lhsIQ+9My2+jBykVjxaBmFjvhuo0n
         K+ySBuHLFjF2u8mmIlGJ7QMzQG1Q1PKjj4qyB7IXd8Z/bYCaw0Foy+We1LrZ5aGGSKY1
         SFKvTyyzOcB+VnpJ/pAsAZ583ef5L+llXtOtuIfx2I8vHKkZJU9FompMkiQwS2dKYUCy
         krI3p0+t17Im6qOw0oSdUdusPJGMIsZ2Dsg1G0h+2NShUr33RQwAc8RHWiSd/dV7LwSy
         iZb8QwpWQ1OStU32EP071A7WQWOnEa0W/vyt8soYm7z89uHU6VzrgH8c8i1b+yqrGuyu
         N2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
        b=G7w1+B+yAcXYl54XdEzNW45XcqKu0WqtLSyvv0K3VkqMee5TK2OWtnQiEHSMiieykQ
         3mUWurFUSsEjaQ0aGHXJN4kuCHovH2wkHp6WpHyy2eTC0PhqroiVyh3wZzI7VZbn8rZE
         li66i8lAgKPrXU2wN2s4EZxLKx66vsPR7tFdrnfBn8ZLb2XnBBw8zGknjqOfnLwoS4y6
         QGiHo7QMzM2wqBwejAFAv6YZ5u8Zw3s094R7toZ/uSDrXkVIIXPhMShtUKzwuLgltUFg
         gCP7pGCz8/8hFHgV4Sn4YFkrF/TbI8bpZwEiReufcV6vYQ5bItDJRTnmMhWmCK8POnay
         T0vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ich6EZwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020ac87c50000000b003f8704f386esi1548996qtv.652.2023.06.08.19.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ich6EZwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7RpE-0005oJ-3I; Thu, 08 Jun 2023 22:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoF-00034v-Cw
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rng-0005kQ-H2
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:03 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-662b85f4640so1068733b3a.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277467; x=1688869467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=Ich6EZwRkdpG8fEHOiDbeIHJTpvbXVwajTCODoplBZdnYuGe7aoOhI8ZuRvaYZl6Mq
 xEmZNWdG7jttOLj7+MIzkWQUXs3+3xioqvSy5v9lHYZOVe1fMa/Q650esYtaXHtNgAHC
 z0fZhhJ3IBjofSYLmqrma/gA9PMV6KXunil7lbc/UETmraSwryzhTpIQM7OEAk/or+sR
 n7i8HRuAHeMW2iQAuobdpbrtDQ3IjsqY/4oUPczGgFNo6kB/tWeSKR5VBo5LfCUcUw8Z
 teGi0JtFS1DxtGY844Ry5EQYkO2vhafrm3sI6L/HXWJ/ZdCsF2oKSoGnoq3kB8Z5Zk6I
 oIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277467; x=1688869467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=TrojvqulMk3ooJjw9uBTGeo2smK4MHtoSm/PWmdbC5msXHaeda0kWQzkmngGPSGC9n
 WxJZ5pt9OJlBsakh3uLO+deJbsKTlYmOwNVXt/SoPxew5qvdTEibUAsl3CqNs3NrpckY
 DKpXdtMkRlheVQNzPnYKbgnm5sZZkEj3GqtA0i4AmGlswmGbnUpeC4XZMAGB8+RCqGUt
 M7R7JMAe4ea1Or3o+WTgbnKzGf9cMenAXRjdjfs1MJ2U/S9Di9HaVUBagLLCIq+u904n
 9DFgIDeBbrzH+GAIfAdwQNmRr3o3jtVmQN1G6XhBbG6AeojEdcF8/pK4qS2UFUKJHb7V
 n7nQ==
X-Gm-Message-State: AC+VfDxu9SFPGTYvRWw5H32ka5AGImc0En1kw7HIQriUzfS6BKgzmIpZ
 ia1xF061ePuZNFCk6kQV0c2j0A==
X-Received: by 2002:a05:6a00:23c2:b0:647:e45f:1a4c with SMTP id
 g2-20020a056a0023c200b00647e45f1a4cmr36484pfc.11.1686277466951; 
 Thu, 08 Jun 2023 19:24:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 26/38] target/riscv: Use aesenc_SB_SR_MC_AK
Date: Thu,  8 Jun 2023 19:23:49 -0700
Message-Id: <20230609022401.684157-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YtePXM6p0S74

This implements the AES64ESM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 505166ce5a..c036fe8632 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -198,7 +198,12 @@ static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
 
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, true);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_MC_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

