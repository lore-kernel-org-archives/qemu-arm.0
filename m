Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp633579ejx;
        Tue, 22 Aug 2023 04:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs/TiZk90eI4XXllqH84p63hLDrtjQpoaxolXwg/uJbiaVkBzLQYq2j8BKJPi0sxnuGdrO
X-Received: by 2002:a05:6214:3d9e:b0:64a:157:1d00 with SMTP id om30-20020a0562143d9e00b0064a01571d00mr10020984qvb.63.1692702239370;
        Tue, 22 Aug 2023 04:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702239; cv=none;
        d=google.com; s=arc-20160816;
        b=VftM2ew9pUTkM6dPi9u9dcWa84XUhHQEms591KXLxsPAcKVOxNWL6UBbvAWBb9AgG1
         +6lCAL1YnB530atozE9RB4oXZEVHIkw3YAYczdZsZA9EiM1D3PBC0RyB8ObUbUmuEjeP
         CT49jUKpoYCotxdpluM7d2AlxsCHVojV68EDVrNLHWpebVHAYQwjioxIvOO8KxOt3Pm0
         1LS2OASelOsf8dGxEWGCubXF+fTfVnG04vx3nGo5dzA7N/4oHTEJXWyG3kE5wFE0eC7d
         x8hqwl/kdWflf9K1nr1v7+Vd9kNLQVDAmemLUTeGil8UEXyPK0ZYoCs+nfra7W8vndHC
         SCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=94KriI0niEOcMbu2tDSQW96357N95QTAdPKbo4MTmaA=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=wwiFOuKU4j5p9IigXdezExCdhE+z8l7Lx8LvQnFZk7ToAW3GGXS9938QdE9u7oSs08
         C6CbyhDXtMqhu23kqTWz5aJ4J6ibi3LQepBxamsQYP6cW/JKPEJ/HfVZpyUcIi8pg/3L
         eM2yJmGR5puLrZXRVaWZyKOvwzC5Lapw8gI9h2Vj4LeJ0NOAmCwYfYH8ogTax0Qrxskg
         hRJOqlTuU8UJu1N2+M0MRgNNyr29cEKsbgrHjQSK4Ku6Rho0Etpdi/KPRg6EIWMsKoKQ
         JAQOVkVp29WFXQTEOlm5cIcHTXlbxcE5JUIh9nwKbok7xDXtrDTcGyfk+3TbWZn12NxT
         QzjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5S5A+es;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020a0cb44f000000b0063cee148360si6110702qvf.590.2023.08.22.04.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5S5A+es;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qYP9h-0006Qq-LG; Tue, 22 Aug 2023 07:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9K-0006JP-Nl
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 07:02:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9H-0003Mk-Rj
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 07:02:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso3399304f8f.0
 for <qemu-devel@nongnu.org>; Tue, 22 Aug 2023 04:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702130; x=1693306930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94KriI0niEOcMbu2tDSQW96357N95QTAdPKbo4MTmaA=;
 b=h5S5A+es7DmCFoaLeGCa4PV1hyy6CUGtK9Xg2SIyzmZ0nOuJevfPSqlAeH2GZxlGSX
 ZvSQxnBRlqDg1ss35urod3/mnBenDmUpCEivWCjecuN7Jn242BU7RSY5H7rg6NPJm0Gw
 XNHbprDZfJJoa3DfZ0PQ17XYek3G754uFrJh84vCKayE8hJMYRsfzV/0NGwNGdGhu4/z
 P8+aKHSwoWw9AxWc5elzjIznaBtNFYYKqUdE8ZkABBTZUpJsMdyPoXivqY09ShDnJcBs
 79/KJYQ9dIQR7sIeEQ1KzK2bj4TI6Yr63dS0i3ONUNhoYCuYkS20OtFSbNe6rMTsgd+M
 t0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702130; x=1693306930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94KriI0niEOcMbu2tDSQW96357N95QTAdPKbo4MTmaA=;
 b=aGaze1R+HlNe4dHakMWZIXZSsNKK9Dl2pGySkQpoIkyQnD20XPwnIgfoH8m6qYELTO
 TYGn3L51FV2URD2LaUYcj5oRt+RBmKCJff329LsCpDrlRYhjmFXbkNSQALyqSwkyIuKv
 zGBn/jWD21buZ2waMllHOHXxCvgQJIXpyk+9orpRIa9fW/H3uU9Z0JOORL6xgPPRs0m2
 WkRpEll/bdqKifMNE3tzapVwOFsqW66geiaEZ5YgLAOO0yycTcHiRQ5T1EvD76utH2E1
 bh+SgZOFjWnGb/l0NK258KGNy5a+nb9qIPARSxhXuW7p2vfrq/iJ8hYExp3Uqcu13hsX
 lNyQ==
X-Gm-Message-State: AOJu0Yy02GcCEHVSpRJgNVXZPfjoqhHE9Eu/FBAOd8YUvO3PkP+3991u
 xyd4BDLf84ghfXujCktQ/S2UEyGsVL/2RcVRD8nPNg==
X-Received: by 2002:a5d:470f:0:b0:317:dcdd:3fa1 with SMTP id
 y15-20020a5d470f000000b00317dcdd3fa1mr6545955wrq.34.1692702129860; 
 Tue, 22 Aug 2023 04:02:09 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 f8-20020adfdb48000000b0031934b035d2sm15656693wrj.52.2023.08.22.04.02.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:02:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 5/6] target/mips: Use hswap_i64() in DSHD opcode
Date: Tue, 22 Aug 2023 13:01:28 +0200
Message-ID: <20230822110129.41022-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822110129.41022-1-philmd@linaro.org>
References: <20230822110129.41022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jGsH+zEmBAwJ

Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
introduced the generic hswap_i32(). Use it instead of open-coding
it in gen_bshfl().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/translate.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 9bb40f1849..4f34ea9b6a 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4948,19 +4948,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
         }
         break;
     case OPC_DSHD:
-        {
-            TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_constant_tl(0x0000FFFF0000FFFFULL);
-
-            tcg_gen_shri_tl(t1, t0, 16);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_gen_and_tl(t0, t0, t2);
-            tcg_gen_shli_tl(t0, t0, 16);
-            tcg_gen_or_tl(t0, t0, t1);
-            tcg_gen_shri_tl(t1, t0, 32);
-            tcg_gen_shli_tl(t0, t0, 32);
-            tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
-        }
+        tcg_gen_hswap_i64(cpu_gpr[rd], t0);
         break;
 #endif
     default:
-- 
2.41.0

