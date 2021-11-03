Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4295523lfv;
        Tue, 2 Nov 2021 21:06:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw3QK9HJGUZqDaXjpVIWiSC6DGG8XuDIz5bGO6vIPU3vaifZj3xbvmih8XaolLMpIMsyUs
X-Received: by 2002:a05:6830:3093:: with SMTP id f19mr31038904ots.97.1635912417001;
        Tue, 02 Nov 2021 21:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912416; cv=none;
        d=google.com; s=arc-20160816;
        b=swtMyeT3seZPnud2d4pqieL1YyapTXtSN6iBrlFkKE55nIJZsl+EIJ0mMhX4mqrVop
         DwuNf+oHFEIe4Aj5n6kOxWHCRFE6ZrPjGL+W36X+CYH9RkSWK59qrhmBgWOheDaGg0ER
         5J9enGmpjN8U0s2Zt2i5CKvwHHR5anD7LSRH9GMI8yoFyHv/AZWyvjyy9lYawy8W6uYD
         iNQnKa0yim57wI0QKD8k+J+IpMeM4lGZXjfnOaIaxy+v/tBb4gSziUEJ4C16jCPs0I5R
         yV5ElOAX+j0VWyJGY1F+aYZJ1e6KTPYWiBTZzZ7D00fWpDA94FCUoEkMjWP23XPdprf5
         IAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rD85GE1yJzMtNOUqHAoor4VFksIyrwnTsoaHAPCG9mI=;
        b=Ur98+rNEYp+PLbN909OHrY+0EEyIVbAo6tfvCWS2ZDD9G6JnA0alrptr2SfVUEb4IE
         KOtLWjUXZdk9RJ8b9NksB56adaz9EoShPlvL0z9jEVVdew4gSQHDwQOKnZxiGXVUKcsT
         wCeDCztBsWRnP+bXEiMByYwbIqeEiLAVlnl5MCOVknXxr4NnxAvUmZDNobTY6R9cL9SD
         Yb1X1oPFdO4LLIwxAM40KOWws8X/CLjQU3VGjJ8+WzPU5/GkvYZceYF9e7WYN3kExj6O
         m0EbGWpFfr3DlNyRmeSDpKETwxg91zpREvufTBgqnpflJBGl3xGsSOC64AkllB33p0M+
         BCSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GoIZq52T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si1411608oov.68.2021.11.02.21.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GoIZq52T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7Y7-00088r-8n
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VG-000557-Q8
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:58 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:33300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VE-0000tr-Ch
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:58 -0400
Received: by mail-qv1-xf35.google.com with SMTP id bu11so1526966qvb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rD85GE1yJzMtNOUqHAoor4VFksIyrwnTsoaHAPCG9mI=;
 b=GoIZq52TiCp22gyZy9VBVtNEF0W4g4bSIZV+8O+RZJymDQOznyA4H8wQIfaagm5aBq
 GmbnjQxHix26nrSMbEWA8dRibQkQ9UnygBFbTzNTz4U+k2l3FHn6MFprhZJIuGNwhaY7
 4VULP6BazHeTQSHp/+CaJm/sjtUj0zkfvw1HLd3NpUukZn/DtQQSJtMOsjKU+wMXqT7d
 DMCn0v8yLm7uM+5xICH/bUbg6KGb83K7ByugUdUZ0pccq8Aw9wTyf8kWWXHpeH1lr0OV
 p0phNRZH/SmX6me8voZ6VzTAWObOziGHrNKZneWrL2p205C4YFwmqh3BO5vF6c2aVFro
 E9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rD85GE1yJzMtNOUqHAoor4VFksIyrwnTsoaHAPCG9mI=;
 b=Ggq3maGXb5bDgxOgUrTjH8oBmvZI476drnSapAzDmGeEsmIBu7ZuAM5dNJYBXNXFsx
 ETdje7LZKqq66K2ZdlCt7Dewl4ByXqVFopVp5B5a6RO5hycEhdA6/wsmkhlsxkrpSzzN
 bTYuLWrIoDdJ/nRHh+mXZQyEk5lV2rfFWy+BTBF9bKTHShXlPPyohREeFcpcMpRKsx6l
 kJvwxBO97pNgd2b48sBMZO7xfUO0YMwTl/+7DIMlfJHKCzzP+U4qobWmTVVv4WdgdZlG
 du14mmns2tfyzStWa8xJW6iJ/8eCCpTv/jPqCbeDELKaVpI20/GXFooVwif+eSI6PbPE
 BS8A==
X-Gm-Message-State: AOAM531dchcU4sA+OvB0qbnag8bmR6wJQTaFH3YhCKCFYqvrbntXT4X7
 ByetRXSjVyQxqzJiwYbvlS0wUexINh4fBg==
X-Received: by 2002:ac8:7d81:: with SMTP id c1mr23115535qtd.56.1635912235533; 
 Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/10] target/arm: Hoist pc_next to a local variable in
 arm_tr_translate_insn
Date: Wed,  3 Nov 2021 00:03:44 -0400
Message-Id: <20211103040352.373688-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cYzY4FadVGnL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6af5b1b03..ead77e9006 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9559,17 +9559,18 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
     if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 4;
+        dc->base.pc_next = pc + 4;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_ldl_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
+    dc->pc_curr = pc;
+    insn = arm_ldl_code(env, &dc->base, pc, dc->sctlr_b);
     dc->insn = insn;
-    dc->base.pc_next += 4;
+    dc->base.pc_next = pc + 4;
     disas_arm_insn(dc, insn);
 
     arm_post_translate_insn(dc);
-- 
2.25.1

