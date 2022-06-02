Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5222396lfh;
        Thu, 2 Jun 2022 15:46:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4aG388pqT4GG8+2E9bEYAYA2EWQmcWSo1SmAO+1ByAsYeHufvMkJBK6QGa39Wv4shR5+L
X-Received: by 2002:ad4:5cee:0:b0:464:404d:be71 with SMTP id iv14-20020ad45cee000000b00464404dbe71mr23294623qvb.64.1654209985171;
        Thu, 02 Jun 2022 15:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654209985; cv=none;
        d=google.com; s=arc-20160816;
        b=yWamkCJhmr6KAvXoma58pG8STaPjFkImDQxCgU7IJ96aHh4jFtW6U7hBcrQRqqD1Gh
         jKNyq7pJyG5kLOr99UQg9uuyZ27jEETGGMsXjiNXhh6OQd3wKUl3CchiVrsC8Fh9EuZf
         H70sFtVfLI12GV682sQidKw+zFY52SaBi3LwyjsEZu2J3sCEeZOs4r4eaiIM3FJEkOSp
         e4lmFKjjmXDri7SRl+91FUSCD5nEDWMUkZpfmQfzMjfe1ykowMXEmCpJw7yqtcTxl6fw
         LihjOay8Rx3/VsAggAeFypAFPYecG4bxubp4oK952NpsY3MzkxY0YGA98keDZWeJAQ0c
         gCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
        b=nASIqeHx3GnKBaQWsJE3vZx25s4uKZUaiiLSYdjn7pY62bLNBnTOKRLmcCESe+gTpC
         909l2zLiMEszUljDG1ZBDvwvspXhocMXPlaYuK/IOq2dsD/hU9I7oypkUPQJvMNd/5iE
         UJO3tSwnEc4xJYSR0AregnL1l1iJhJuje8jlnjj30RWpg9wABi3va2VSw+80GYGTV/nb
         c4+nSdmXNDkXx1a/EBp031W1EFSudR6puSLawFcDL+4f/9x/e4xIT4QykSXjQ18FeOzf
         hKrm6Va3H3zQqaMsqhgWayd0W6QkJH5aYz5qXfTtnoJDvoDFouzX5lYSEGCzfOY+28ab
         XKFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bg3Fli44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020ac87f16000000b00304bf77a97csi2940975qtk.243.2022.06.02.15.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bg3Fli44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtaC-0006sJ-NF
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskO-0001h9-0w
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskJ-0000wu-IE
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:51 -0400
Received: by mail-pl1-x632.google.com with SMTP id s12so5586354plp.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=bg3Fli44Ic1XJqkc889xc/WCNbVx6q3cClYbT99/y1umLsyQXql+DpCCpHpPlhzSW+
 mPSGgEAhDZr9iIRxvoMctOimn5t7XqDribZ9c1eDlDUsLZX7n9hObxcqI46o7lJZ+S4X
 wYKyezrm5dF1G/WJmSZMRP9xgDwa1EruQyOzZw3MjFKZbRTkByXK7eWIPuqehCEn9d4w
 AnOg+g8h/SY0A/pfBSZDAxbG7cm/rK5Wiuj3f/CiSpNaTeDD7wofv9yLS6DljbPiJrTJ
 nzaHETacJiE1q6MPzGC8b8IqoyAVxeLiIvwFKJDKG6p48ustslK8j52XTV+urESTL2vc
 4QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=JBVeobTbXIbh1n4z+rzw/MMHonRrKPSYPWZAyLAbnerCgO27d3oPHk8uAT5j8yFL/z
 hZ0EbZgvCEFx8tEUV9Ly6rOUurOlH7ITGZgYajNPTxNjXKQCQOr3Gw6jCV3CTyTxuv6x
 qaPSFNMk7CocRO0CTFu77NVe+f+9hAbgRZPd4HD3KyoQTY7hLWZb96eRRG8adMjNpP0k
 4LsW9ktBfdHsTss6xmohmBWvkBjT89eTeRtC+XyvoqIICEBXgWm+yzCQdp9Be+Bcoygg
 ZyJKKoMUCuCp+vTB24FjYr6YYQO8XRYhJZf4tDjXCsNsKQTN9Ft28TVU8K6bP/CeypQy
 iUwg==
X-Gm-Message-State: AOAM530/g/Ii12FdgOJp3enpAwpF4z26izQEWubvomZ2QDNmKXsKB1k1
 uf7qPifY+7/D/WSOu7g6e7Q6Gw==
X-Received: by 2002:a17:90a:cb8c:b0:1e6:715f:ed28 with SMTP id
 a12-20020a17090acb8c00b001e6715fed28mr7447100pju.69.1654206765945; 
 Thu, 02 Jun 2022 14:52:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 59/71] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Thu,  2 Jun 2022 14:48:41 -0700
Message-Id: <20220602214853.496211-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZKcAMSEOu5QX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1

