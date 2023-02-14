Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1425143ejb;
        Tue, 14 Feb 2023 08:32:06 -0800 (PST)
X-Google-Smtp-Source: AK7set99WFYko5BaftOeKJOO/eXAY+ghpJ5t9zPcL8yOc9J6yxnE0wNQBLd081DRCCOJSiNxsia0
X-Received: by 2002:ad4:4ee2:0:b0:56b:ec1f:db0d with SMTP id dv2-20020ad44ee2000000b0056bec1fdb0dmr6321671qvb.34.1676392325863;
        Tue, 14 Feb 2023 08:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392325; cv=none;
        d=google.com; s=arc-20160816;
        b=PU3DSndB49Pm7v/dFI6xiponzMzhZ0mnU4DocjmDqgYbPiqMIX+BgUvZW5lOVZDwKo
         avCt08sXABEo8qgYlvFaxmkA8uCJ/h/MB0ywcF2pbQbKkgzVOso7kjQbtMp50TWVq6za
         ax8GQZ41KHaX6LXMS7oj/L1YZ1XOUpr6THzGiXRu2LMHrmk3e5AB1Bysv9IDcpAOelFf
         4cfcMlzxZyXIwJ6+8hJLmqs27zSBdlQhmMV7t8JQ7K53GJJPLwut6MCDJdeLFdGIAjKc
         hknjN/KsReV7nyDQzOzGguTxv/TmRR3kC2EYZGyDjvua4SP6/roUHiMZ80Fvbs+HEbmT
         h0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nBthFvzzHD8e17j/GA3l/lSzIa3Cmb/GvEClpF90p2Y=;
        b=CCX83YeOE4xvFki3Lwk5RMV6hRnfkdOGqK9GzflZwdeVhON9H9nkQe6rTKCrsTv8qd
         TXRWb2dCGC4HLVdtOWqgWJ+D2OkCVwXPezwJslGsQMJde6ZclFeXQoAuwBOn5ZMU2AAr
         wWPCyedV0zhe2vdkZyAbwsBDzaoBVcyiLVe6wZNok8sh7ou6FIydwcbK73hWSOPHzytn
         YnN67yIwTkSkW/3PvrT80RP3veJoDHOVDg/x0qTE6U5AJDJyRRODt0v3qLSnt8VpZEOQ
         WbCgG2LzyBe8I5vFPBL0iWcdKY7Tq97BpqSXD2rgoqco2i+9afTfc/z/FGTOV28j3heE
         EjeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EyzsaGOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a0cb682000000b0053a300cb14fsi10187676qvd.402.2023.02.14.08.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EyzsaGOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyCz-0006XU-Dx; Tue, 14 Feb 2023 11:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCo-0006Po-QG
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:00 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCl-00026G-P9
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:30:58 -0500
Received: by mail-pf1-x42e.google.com with SMTP id n2so10548905pfo.3
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBthFvzzHD8e17j/GA3l/lSzIa3Cmb/GvEClpF90p2Y=;
 b=EyzsaGOhKJtxJQElNPrphGSmIuouKwqysr78vMj4rzCK6VflfX5OkUc+UQm1CR3PZf
 F7gZxFtY0k6dkO1JNcMCkhk+79rasMMjS2NzkUKfcy98FfzT8EFPKtIb9uSwD1HgdjsT
 LnliEn1ZDgHgjsC9GMjCAmmCFn3EBQyIRLGQN9LxoI4WpRPt99LThByrYmizaBhaRkky
 epo58wIOgrzuS4IBYeZseuD/hQKEGI8+x3L6P2GGRSwpoVcKZVtCrnnjMN7dC+MeNct2
 ziDTW8xAp2S+SlNfL9UZ6rXMnTJYwlCMmt0pdHE8MoIxRIG79btkVVZ4QCSkx1s9xabO
 NQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBthFvzzHD8e17j/GA3l/lSzIa3Cmb/GvEClpF90p2Y=;
 b=V1SVWBjm+92OhNPERUkoeOstIh2zLtVWrcKocjNTCbjpR4BLVzy3boKwqIxl/JXBMA
 SpOYxCLMTXjPLsIdy67d5UKHLr0g7o+FDfHSDd8ZlvI1PgPxXTLEx5p2Qsa5LVvbPAZH
 Y0xA7JYfw4riD4YPJP9r3xKmnEuadtV961k3Gn/X25UBL7/X50tWC8iIYDmNkGurkkCT
 SIIjNwTM2caNOcKK53AAiEcxHIPtTB1w/AgXCeHD3HVPDZxSQUZGjSuRPBjLpqCVZU16
 cNHHhW9owRAk9pQO0XiD5GtyD4LKQQQu0ehC+4RliibL2k8jFb+dpo/OJ2gbcCALbvr/
 b1vA==
X-Gm-Message-State: AO0yUKX4rbpYY41meozElvkczU3m3FV2c4T5rkWtYlL4nHEa9Kp4OWL0
 MQn2JxiTbh4gvN61tFPxHRRwrQ==
X-Received: by 2002:a62:14d3:0:b0:5a8:a570:45a0 with SMTP id
 202-20020a6214d3000000b005a8a57045a0mr2541759pfu.34.1676392254445; 
 Tue, 14 Feb 2023 08:30:54 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Date: Tue, 14 Feb 2023 06:30:36 -1000
Message-Id: <20230214163048.903964-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rSLhc5Daf+2U

This function is not used outside gdbstub.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 -
 target/arm/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..b2c49b3605 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1114,7 +1114,6 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
  * Helpers to dynamically generates XML descriptions of the sysregs
  * and SVE registers. Returns the number of registers in each set.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cf1c01e3cf..52581e9784 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -305,7 +305,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     }
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-- 
2.34.1

