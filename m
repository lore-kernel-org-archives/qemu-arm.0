Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp352860lft;
        Fri, 8 Jul 2022 08:54:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/IM63b7bxBvNsgfHZ1Lst63SZr6S/XetJUFWQRZcsQvuhcHvPckTUuzo+/krWYvio6kwF
X-Received: by 2002:a05:6214:27ce:b0:470:596b:4e82 with SMTP id ge14-20020a05621427ce00b00470596b4e82mr3378004qvb.118.1657295640029;
        Fri, 08 Jul 2022 08:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295640; cv=none;
        d=google.com; s=arc-20160816;
        b=GTzne2mIrAtXkdrgIyxW+XXoBJttRDIp6/bsxpnXDUfNmIdFlS60xabZngG4oBpYQx
         DDmPkbrPXmG6LeRKHrrsWegRTH+AItJVe9iwbxOVvBpYdfBOxsj4M253F5Ikk2xZw+a0
         3FwjQripN4IM4wKNiHlHCpgraDfyjl5acoWCDzEKAgFrhgquUwKpUMmr/feAfUbh9io6
         Ulo+8Lj7pckRpetdwZD7xaTadumLXYF/PleYz/RSCI9o/om2vVLXDF5jwWQ71bkwPD5j
         2jRuyFO9K4+qirYGAEhXn0leVQ6lY0uqWdZO/T7gpr9ptj9K33I+ovbtgmTLzmxs1hZX
         nJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
        b=pTJS96AHnfLOtxrk99bhxYq9vv4/Q+BNzeJAaVUl9WLrBmD0JuTpsbLRgsZFVu5Wtc
         ZfR9GVJ1+EVyuGBwY3sJRnu22spkEgr9THmVWH6YybXzSwgg1zG5nAhwzmjze/yxR/mZ
         MZcRPjE9Li+rLUsm4YvBtwqEkB8St7GvtgaQ4R4SxK/qU3Nd5ZVNjkXXePEyE97HFIok
         OngsTu7svLCydcjX7b2M6dfR9erNPh6jEZ84Xnzb/htnRLVCHoe1k7dcsZ7aPJ6OBnnQ
         ebtE3rYmcVsojUtfiyE19hozNM7fbwnRNBdcCf1ObQqqhOYILTkBjxyNacb0V9GDkdAU
         1Vlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xgquYLXY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23-20020a05620a067700b006af3bc022e0si16573018qkh.476.2022.07.08.08.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xgquYLXY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qIp-0000aK-D1
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pn1-0003qp-Ua
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:21:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pn0-0003JX-D3
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:21:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id o15so13826750pjh.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=xgquYLXYJXsW1UdcvjlI689LtEmJcoi3Hr7/dyoIlSxt75FzcYeh8n6q5oqoVq7jiM
 bnn+CpvLDm4RRA7cKilyTkHndqjIruzjPAJZDzZVZa+ktu79asB5pjTzdT3QyWnJPrPY
 vkUm6ZrfFg8/jiwajXZyBaJvPUV7UN3IpzVDqJQ8IpU4Zbod5h6t1oUSuqpiV54rVOXe
 M9a5Wtnnrwrx+habCsi3qxjLPspeXVtqjm/NKWyHi6IHyqkysnvLuxeXnCbnlGb0xt+5
 0drSnI7tYK9i1QyQKlKfbzqmBCsHFKnI/JML9Aul+4PoeLS23o2+qoSJFG7YMdtodHvc
 0geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=kbkIUEsJNIH3Ihf6vQ9xEdXtoaQ4aB63IDQvjRNFMM5yWawo+pbRuLtrVfTQS0mrvQ
 xSniM/+tnR2XCJUoyh5KvIezv7Q0+319QE8zGPQeh/Agteyo9PBc1eUdnkdJQA5iNZzD
 qkWnAzHMWrKH3apOyHMKoAGLBtsYeyqYGi67LlQfZpYKk1GW2XYo8dKYl7PrTj+upcf+
 xM+Sz8sxnAbJzgdsHMpG+V78E0BtYHeWZLbVaC/alA9uDOHudv8pyIFbsR9Kp57VfiHJ
 7AYzu8XtwtJzuShJxhn1pbdY89P+5l5COTY3brIvREzsawvJJmPShAKTkxpHT1I+5FZa
 h1JA==
X-Gm-Message-State: AJIora8dYB68SeskmeTAuWUofRLDbe9iu5YD+94tO8S87sK6G8QQSL6q
 h7524mJSocnxx171Cm0OKDmalg==
X-Received: by 2002:a17:902:e84f:b0:16c:76c:561d with SMTP id
 t15-20020a170902e84f00b0016c076c561dmr4301208plg.119.1657293665113; 
 Fri, 08 Jul 2022 08:21:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:21:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 45/45] linux-user/aarch64: Add SME related hwcap entries
Date: Fri,  8 Jul 2022 20:45:40 +0530
Message-Id: <20220708151540.18136-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: kj3vO6l5Gt4v

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1de77c7959..ce902dbd56 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -605,6 +605,18 @@ enum {
     ARM_HWCAP2_A64_RNG          = 1 << 16,
     ARM_HWCAP2_A64_BTI          = 1 << 17,
     ARM_HWCAP2_A64_MTE          = 1 << 18,
+    ARM_HWCAP2_A64_ECV          = 1 << 19,
+    ARM_HWCAP2_A64_AFP          = 1 << 20,
+    ARM_HWCAP2_A64_RPRES        = 1 << 21,
+    ARM_HWCAP2_A64_MTE3         = 1 << 22,
+    ARM_HWCAP2_A64_SME          = 1 << 23,
+    ARM_HWCAP2_A64_SME_I16I64   = 1 << 24,
+    ARM_HWCAP2_A64_SME_F64F64   = 1 << 25,
+    ARM_HWCAP2_A64_SME_I8I32    = 1 << 26,
+    ARM_HWCAP2_A64_SME_F16F32   = 1 << 27,
+    ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
+    ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
+    ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -674,6 +686,14 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
+    GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
+                              ARM_HWCAP2_A64_SME_F32F32 |
+                              ARM_HWCAP2_A64_SME_B16F32 |
+                              ARM_HWCAP2_A64_SME_F16F32 |
+                              ARM_HWCAP2_A64_SME_I8I32));
+    GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
+    GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
+    GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
 
     return hwcaps;
 }
-- 
2.34.1

