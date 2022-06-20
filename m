Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp621463lft;
        Mon, 20 Jun 2022 11:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vopoXi7G2/WemkI2Vl+/lJJUorOL0ys6jmlcdyEm7RAV38PVOce8rgPAAxwr9dVrMX5F0f
X-Received: by 2002:ac8:5e4a:0:b0:305:aeb:2efe with SMTP id i10-20020ac85e4a000000b003050aeb2efemr21105027qtx.664.1655750438371;
        Mon, 20 Jun 2022 11:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655750438; cv=none;
        d=google.com; s=arc-20160816;
        b=ZkyMn3Q3LW87Dtn+oGzP6cp5fGQNGiKPSS7UyaVESbaN/+cwiznj8VTicnE09Uep7D
         TTWRHhL5kRM4G6qS9fFX5d/vga4dqsMedWJmcnJr2nNv5Not4+LZOiC3ARn5EAxcJD/n
         N6kgA8clZiW9AEVkE16QdI+HuFj6irrMhPmAqYuKKkIv2YjJP6xpBo17YBAcA2b3x+7N
         5/xBDCwbOhK2xLfrsRMQo+zFlz6/FXrcR9Oc8VWA5xa4K7vnf4UfMPIcm3yWOyn0AglN
         iuwC/FBi17aRcEKQrO9MSyILfYdyBf0HqiD7vJBrivks4lS9WOZjTzfEg4tyX3P7Oyg/
         7F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
        b=A70vRiVFjKxp4CyNKVL/x2FnAHRkPWIe8+4st/RYZsGMcQQvpme62Ug9AX4NxJ0p6M
         td9hKhg5HDJCGv+zZekKnzCs1j1sCvKVJtdpnFWMvB+moiqLoIF7KWKXZKH3XHOuuXeH
         8NJyOe7He1HAy3Y7x7JL1tLNy+HtdYvyrxdQmNeBQR2Rq//ug60A0NvOl4cZUlYfwASu
         nwHaf2kl6DSLwlfAE+YGjknK0IytCC5Z8JTzzQ6DEECTXpxTYnf6GfaNXQ+91ducrOx1
         C4tcK0kvlj6PQfWfm/U8Aue8card1jIEJm89olvua9Ta+U9v+zSQVhfHqTjhyRWgyFAd
         GmMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOZ6WjVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020a05622a048c00b0030509d96d28si9145794qtx.709.2022.06.20.11.40.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOZ6WjVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3MKD-0002PH-Kx
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdU-0002wg-AW
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdO-00024N-B4
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id g8so10394318plt.8
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=vOZ6WjVfq6PlWLWxHF1KA1SQq4/Xh+RW+M0BmTlonYHyzfaNeFv5rNpI7CxpcNwlEh
 b6iZD77nMbVosz+qSccHvgMQuLqUDCkHOIJ0emwnix8ROXczhmOJdQDsLTx1f7E65IW+
 h5BIjik+8O8bRMCt10Qw9zBxwsz90LKyGF2mZXBHQ3reD7Ah2JA/txS6fDl+b/iFhoPa
 tlMK1s3cCUGaVM2LqFrq/F9ShKYPmUL0Dw0LK2JaaG1i3x1Pp3INBHPvpLqleDAiIbPh
 ttHToHqd2GQvY9xv/sLIpYANx61K35muwuMJYrYR1mrSiCoczZqvIobXZ623IekTNdyQ
 xixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=3WMlolMP/45l9uD0D6ggGAzPBUSvKqr2bOpJq5kSP22Z0WrHxI3+btT+56FKFDkYXw
 PaLIitJW+QLSDxfXZOwoRyWzJXS2K0pwYCjVzIYSA8utLeCnoQso/77NO7MmKqpfAnbE
 nHiN3AtQf+UhwkB7Ygs3n8epLXK099oFj+JEC25+3Cz7GCnLu7jFW3vcbGJZJcUXhWjM
 ODBBmeNvR/P0e4nsxwlFEYTtAL9uq67ammJZAPzGt5Ne6U0W3JcJHcAREmJSnTtb4eSx
 VnyLsc/mezilDHad3FbOfB+NAvPaTnNtQSD+7asu6ed/lt+eSK2JVjhdnObJO9gC/y0+
 e/rA==
X-Gm-Message-State: AJIora+h6DzChFoX0ap44GV7/pCnRtWf8VMvEgQh2EKYHvFLngRNSia7
 CZ5SaXTdTid+3XSTdRxGIdqlwg1sdPxSnA==
X-Received: by 2002:a17:902:74c7:b0:16a:1be3:b7f2 with SMTP id
 f7-20020a17090274c700b0016a1be3b7f2mr9273904plt.42.1655747779598; 
 Mon, 20 Jun 2022 10:56:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 49/51] target/arm: Only set ZEN in reset if SVE present
Date: Mon, 20 Jun 2022 10:52:33 -0700
Message-Id: <20220620175235.60881-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BjooDzT4q3q

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 75295a14a3..5cb9f9f02c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -203,11 +203,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1

