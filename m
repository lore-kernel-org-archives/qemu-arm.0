Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4300564ejc;
        Sun, 26 Feb 2023 21:49:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+PWq2slzkwEP5FZ/03VzvIn+PLEfJ8gkFtBD3opcvAxMUJL1ESmXRtL+qUCUZk1d4jnj6l
X-Received: by 2002:a05:6214:23c5:b0:574:8ef8:89d1 with SMTP id hr5-20020a05621423c500b005748ef889d1mr458602qvb.5.1677476975064;
        Sun, 26 Feb 2023 21:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476975; cv=none;
        d=google.com; s=arc-20160816;
        b=Z73KS2aglCK3yJ9IMzDXcSC3htKUYIk7a0oH/RLU1P7x9wUEQJz8wRcZa7xRGO4wwr
         nauPvBPPSAINf/WBaqYaqAh3SgpReBIfQe6DidhzXKTssDG7+Xie1+gv9RMZc3e7XL57
         My4a8TBurE8rFlSZP5rY7oQN2XFVNIAQ3Znd1fqTE/+CP9TKkjEYonynwP6HNa3DI8Hy
         lWMfDLHJpO6t3MgBjPfJnJMWPHifgeLwAvRUIDtrDATpvwiVMPmlultfbyjmVFiE39je
         GEF8l2FiGgs68XIk/lljZl4j+ZeFvAgXCubVPVB14arPFLDRu8nS7GToz71TC0ieEYvX
         lv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
        b=M6KuMlCRki4LyogkeCNVTY/YlrUF+gtjdXVj5nBmvFYtJm7MT7qzGf5hMWQ1gMY2LM
         B30XrcMJof3L1TbH7d0ZHdePN27jS1aHacGb/z4TCpCrRIIQ48qAwKBqNGi/nG6E0hR1
         CL6u4nmbcs7U6b8TwKzX+1USmcWZTHML/SHh2yuItF/hFqrN/eGIolwx7ashoyI15Df4
         mN1s7mu1tPR1uHuioh09lvBo4/6f/vH5ZHBKyA8G4Mb68C57R1m5YmMMSf4vgWBvqbt3
         XETRcglV9NixeTEx6e1zoPuGPFyH1PEuIvtdrdiLHRWcO31rgf9aD+b7DW3azfZUNcDD
         RoNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vhwm0qvs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ae9ef07000000b0073ba7884843si5430686qkg.8.2023.02.26.21.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vhwm0qvs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWER-0000ax-W6; Mon, 27 Feb 2023 00:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCz-0003Mg-Pz
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCv-0002ow-BI
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8910986pjb.1
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=Vhwm0qvsjtsA6wvMpMuv4W6xBYYfrNezIKAp1isoNgu76u1vMp7xhKecNJbXi5PLRj
 VLnSkrB/UWEuiTxmzawxYjYdYYTuh+vWTBrVED11GTk000z4aQ8V1pOJCHYOcKWvnDTK
 4d7qwo5fAjmWH0jE8qWjN7RQVtJK/XKo+1x+knGwuB8xeGNdcgyrjSqr5vcRn3E+BY4w
 +DUm9Pw1bPw+SsP5ZN3nnD8qBPgLRJy2h3zxyTTaIBDF3ZiIuOU5Ly1x0KMLHIXbcbeK
 hR56oHByAhBwBh959oqfDl09C5XZFgCLz/hh9tUOkDhLLMwgCwGmmCipHJqlFR7Kn37p
 NKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=v9ZJBHoEeHfhI588xABGd089uWUEvMVUjpcupHSvBcekC0MwctxeOpba6/4RkpMw7F
 tSSbO5BuJw01qeenB/8oXL9WBmr6UPLY8aqdDp8shKIJny1EjyUbVVTdoETc4aX54BXd
 gB62AqPpZr6vHEqbW9EhQLfkDJsvdircUs2nFwuErE7iNqAKcXPkBbesH3Vi0m1B/TAF
 1lhftvG9EWY8HuE/Ndg2zYDom3H87R1n/x+1ygO9Z++8YAIwJCgnGgHtFJrgNOQAZTlU
 KFmGkOQNBeE7IgUIxXN5xPPD0gbhwhsZPJfdqOxHTJqGawR2yuQi948RZxU4ZdR6ihdf
 +YVw==
X-Gm-Message-State: AO0yUKU8ikGKVSvJgPP7YszYLlXD/cTYzQWlShwF254/C2C1q75OFdC2
 UefAyqjIDgu6ziU0r4HSPlayJlenRdY9IzKDuBU=
X-Received: by 2002:a05:6a20:9388:b0:cd:11e3:4105 with SMTP id
 x8-20020a056a20938800b000cd11e34105mr5068539pzh.27.1677476270706; 
 Sun, 26 Feb 2023 21:37:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 16/31] accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
Date: Sun, 26 Feb 2023 19:36:46 -1000
Message-Id: <20230227053701.368744-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VXJ+y+HCsCUz

Here we are creating a temp whose value needs to be replaced,
but always storing NULL into CPUState.plugin_mem_cbs.
Use tcg_constant_ptr(0) explicitly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9b793ac62c..c42a436c0c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -630,8 +630,6 @@ static void inject_mem_disable_helper(struct qemu_plugin_insn *plugin_insn,
 /* called before finishing a TB with exit_tb, goto_tb or goto_ptr */
 void plugin_gen_disable_mem_helpers(void)
 {
-    TCGv_ptr ptr;
-
     /*
      * We could emit the clearing unconditionally and be done. However, this can
      * be wasteful if for instance plugins don't track memory accesses, or if
@@ -644,10 +642,8 @@ void plugin_gen_disable_mem_helpers(void)
     if (!tcg_ctx->plugin_tb->mem_helper) {
         return;
     }
-    ptr = tcg_const_ptr(NULL);
-    tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
-                                 offsetof(ArchCPU, env));
-    tcg_temp_free_ptr(ptr);
+    tcg_gen_st_ptr(tcg_constant_ptr(NULL), cpu_env,
+                   offsetof(CPUState, plugin_mem_cbs) - offsetof(ArchCPU, env));
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
-- 
2.34.1

