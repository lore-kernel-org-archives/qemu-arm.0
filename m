Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653750ejm;
        Wed, 3 May 2023 00:11:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mlnCoO+atdcEPRJoZ0QqnMbDe33UdxpQZtp39V2kCCHKVfxMuckr9PVxbusNbPckpJZ4p
X-Received: by 2002:a05:6214:d82:b0:5f0:23be:a302 with SMTP id e2-20020a0562140d8200b005f023bea302mr6948227qve.9.1683097876517;
        Wed, 03 May 2023 00:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097876; cv=none;
        d=google.com; s=arc-20160816;
        b=PFKfp+xplBv8AS0QR3CPAeZdqI3MvJNy5hb9oYx4RMiIW2srhrrVtITD6jeDe7pGfr
         Nj1V8kdrPOhdNjzhd6BxO7KpNIZsWG/+uyxxoUt2fClX/02gFJMU9tK0b2aa27gNFp7U
         aJ/9egrfVTPmUjJ3+aGwCwXHfA3UWYPf31gwZHPpmEnGTKyv6EWDfOZpG19MoxY61JMY
         5AB8vy7lTAs+efoM204hRP+8x33vQKr84DQPM14gVU9jMEDVbu7btNcYdqXpAY3DdoFM
         Umc1jeD4rvkMyXfApv5gyEnILLFWX02VsFoyXSVX3dzwlH6pnSpaMliqXHJDuBHMWoiH
         tWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
        b=vVOKPF4xUwroIxcu+XwnZplqEk3SQ8x7yDF6/k734hPzvSKhnBC+H+ysGK4gvu66Uu
         6xdfAKyZI3W6y7rZtKYDtbTU9aVfBCFVR5Znax8+ZgsjApMS5p4lu/77oVE0tdPRC6n6
         AXG+1GoO24A78mDaDMU+9Hjx4UGEQk4gTK9V5LNeNWsrTdHJYBX3Gr92SVLNKqTS09bw
         KhfT+HWczzcq2zZLauRBZyJ88vJqQbMouu0BMW/CJW6qDJ3joQ1eJSu41YtyK8q/bMn+
         Y6+w2rP6ditdYuOdVhjf6IrJxD3t04NAXPezHVTOfhl92AwYWCSzVTiYhQIYhrmdteq7
         kKwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IS7A/Ip7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a05621419ce00b0056ec21e1722si18555798qvc.110.2023.05.03.00.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IS7A/Ip7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6VC-0008SD-Rw; Wed, 03 May 2023 03:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UO-0006Hl-KC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003DH-3u
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso855130f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097269; x=1685689269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
 b=IS7A/Ip7RvcI+Z4JlTn8WJLzDB8hjw5wKc7iazR4nwKVKRs5qePmUwnXUkgQZH70W4
 nMiQptVLxtQ+uUv5PKBKorC9MRvKNBkkZqlmtz2c3RTAyfUFVtcJPGssNaUZD2fGQ3Cf
 BTNNj6Rt/Q9ELQVERE2nCCaMS32WjOTbKXJ4LzjGkvuDs0oS1lLxb+8/N2p+Y4vZ1W5H
 9QSbQOISXearExRsVNY+zKBeHjprdcmwww7sHP9DLpi4X8oxv1n0d7zyb/2vBiOwkDIk
 /R09SPCV/f7n06NxQmnynembpHL9lXD5gv6GAISITD1x47DD6xk2S12/zsE+K2SSwiPk
 5eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097269; x=1685689269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
 b=eyZP/lUyMCgmZYhTi6idaQbKIlKlzEKkzZ5mbjOE3CN3lwX05OPMb5u7288GeakrGP
 Sj+y9/7gszlQUGd4eGCpxmM24dh34ggSiQ3joLaANolWB05IMj4wmOFskGhsZYnXgG7p
 xXNV/oYwMXIZkK+0zn4qkxG9b17eA+LLjuY32A3uWXIbHQKbsaFMLR18W7ApnXn1EPqx
 AeRSQaP5LovsFtnlbima23kWXeLxGIgKb/R+AE4yIVxdAgg0iyTZjbLTc1w4cNmvqMDr
 DdGhOYazb4kAqTeZIPkkVbzT/qAOPUYC05Zfjv4/UxE8svw6HT/WqVZZE2/gD6XOEs0P
 ktyQ==
X-Gm-Message-State: AC+VfDw4dJTK9atkVNx6leoUO7RQUyIrwsLWhsGbFoADF4COhypwUxIz
 xeuhsgFsqE4OtWObcIe1GmY7kTzdEDvb9nHD6jPyLQ==
X-Received: by 2002:a05:6000:10a:b0:2ef:baa1:f3fc with SMTP id
 o10-20020a056000010a00b002efbaa1f3fcmr12032057wrx.19.1683097268700; 
 Wed, 03 May 2023 00:01:08 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 50/54] tcg/ppc: Remove unused constraints A, B, C, D
Date: Wed,  3 May 2023 07:57:25 +0100
Message-Id: <20230503065729.1745843-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: /vuvYwi2KwjS

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1

