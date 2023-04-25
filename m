Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721570ejm;
        Tue, 25 Apr 2023 12:44:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBLv0Ll7dc4cxkAKNXsmCN4whxrO4EVuHgSZ6u6SxrERPRkBc8r87pKf4fsupONFb7ofPO
X-Received: by 2002:a05:622a:11cb:b0:3ef:52ac:10c5 with SMTP id n11-20020a05622a11cb00b003ef52ac10c5mr30442880qtk.35.1682451884703;
        Tue, 25 Apr 2023 12:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451884; cv=none;
        d=google.com; s=arc-20160816;
        b=DvJVOltokdqLcpG1/M/fsHHK5UvAoLs4XgZ/PEF7PkhlYb3q1/7N/h3Vq+iI0nIOVS
         cTMTFKzs6mgN4ZkWpKjGGcqIOu6QVhvVcPe9alGpK0JDRRjveii5YQNjZRWc4IT5drY9
         y7dtv4sM8Orx1z5E76S3TKoOnV/T3zpb4cRnZ5iJJgUN7FIiQljZAiYGkf3utEQtSOcc
         JDaR3x0sbN7diRPjU5RiEow3ehCoB1rxdpfyuoM21Fl1RNlSZWWtLjqnZe7oT+CIG2d7
         pcOl19NJpWccX+iJhAKA6cS3XEzkzoZHQyHlZcloNDOeTTmQ0cDMtps9knqj0HG6yc7r
         U4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eK0NEMONjmg/1ucpaSNt26amgB3shibpw1tARmPQjiE=;
        b=BhKhfixk3ImPgGzd7QLgXrSNd9PBXJ6o+/S9rpnhk5L11hdAstcO1+LGilIa7+9MJ9
         oMUNyVarheurdh9Od7XeUIkCuiqa610NB0vLUN/2roPvCK573LRaRtqAic+hzeWOzYxs
         tdO4KwKV8TosFIWlxLMhX+EPMYZe6pz9ox0+UfTLBBxRV367glrvWmTLAIjFdEyp7uew
         WbisJt8vHqS5JeYpAxLZgIEY4/i+ndyGLVzp/b86Q4kdwmIZdD34D99wixI3Ei+vubsz
         dN/u0pl/owAdhapEadT9PkqTHUVrn5Zm6V9+t2Vm0fFD9I0GnP8UOwpB26+8OK8N8H+7
         v6UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAGwvaaf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac85712000000b003ef5b46071bsi7424033qtw.327.2023.04.25.12.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAGwvaaf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prORr-0005hb-HB; Tue, 25 Apr 2023 15:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORj-0005ay-Kq
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:35:27 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORP-0005Lo-FW
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:35:27 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso26802062e87.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451304; x=1685043304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eK0NEMONjmg/1ucpaSNt26amgB3shibpw1tARmPQjiE=;
 b=JAGwvaafapQwmMsl+A0SFwjFn3gsSFSfYOWnUb3D7UsviPVpuhCvdkNJ6UTlTfHX/8
 /AQMXamibfOmKon7evVEWelZMa7kzv7WRavTmhs2nzKbLTtsbQNoxt+4TAtUrCPE3WUH
 Rb95VAhzQ83X+JFR6kQaBcIeTNSNPQ71hXj616XLUqs9oyUjwlelwMFC/QDEpM5C2DUr
 YwyjeVf4zVUbecdM7ski4KztZXetMOC+9QUKoKSuVEXqo+IEjOhF4i7bSrjkjLufPss3
 m8vxBsmh+oxF3e7omK5GOXUuEnu5x+Gb+9lU/pNF5tMzFlKVNqJANLcm5lKxGud+38UX
 PWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451304; x=1685043304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eK0NEMONjmg/1ucpaSNt26amgB3shibpw1tARmPQjiE=;
 b=dN5Yz6OZrIe0zt2nbWTSCXhAf1nOAjcNDqZu/7a4zcYGcnMvKvziQ+tWoebsJE8FVN
 bw5cqs9iBQFCe9S/msCTHeKV3OTT4hEba0UZboRl4mS8J8NqmDQgOEglV0e3lVOmLBsv
 Ekk3PRcDoIwcYURa4o4mjDaGqPdhCN/RSHId0jcOjAc7p3CQp412kcvIz+b4R0S+EXh/
 4Qho1834W805Q3nSu1HJPiPCt76APVdmPEelpL5bH/M7qGkC5t2hpqT955Gb42rs8XTr
 ALBD04wPborw/lmM+7W/h46zGCm4S64LiFL1UdQEusJUkEuULZbDx7XVQJ7TBmXViiXC
 js4A==
X-Gm-Message-State: AAQBX9f1JHxhFbK89lyheU2GC7n25wWkPxe8gLJAcULzJETUWikz9lCp
 KgSVfqYYX1qoPcmoR+/ZRgn2hg==
X-Received: by 2002:a2e:aaa3:0:b0:2a8:ea1f:428c with SMTP id
 bj35-20020a2eaaa3000000b002a8ea1f428cmr4079149ljb.23.1682451303827; 
 Tue, 25 Apr 2023 12:35:03 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
Date: Tue, 25 Apr 2023 20:31:24 +0100
Message-Id: <20230425193146.2106111-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: IEQZFdYUp8Ey

These functions are now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  6 ------
 accel/tcg/user-exec.c  | 10 ----------
 2 files changed, 16 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 64f48e6990..7dd57013e9 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -60,10 +60,4 @@ void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 void helper_st16_mmu(CPUArchState *env, target_ulong addr, Int128 val,
                      MemOpIdx oi, uintptr_t retaddr);
 
-#ifdef CONFIG_USER_ONLY
-
-G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
-
-#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 98a24fc308..b6b9112118 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,16 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
-}
-
-void helper_unaligned_st(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
-}
-
 static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-- 
2.34.1

