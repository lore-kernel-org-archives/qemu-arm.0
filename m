Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2229976njb;
        Mon, 10 Feb 2025 13:31:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwvwAECAg1w6cJpJlmUha7lAnJhhCH80fC41sEvcMvC44KR/Xe0D5mfvELMehWcOwNoH3iMwkNijfaGA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIrVSq6t79A83xW4if3TVF0CzNlMC/a70/jwnYzL8xk110RX7czZUCwnORyMeUHf5D5C86
X-Received: by 2002:a05:6122:91b:b0:518:a261:adca with SMTP id 71dfb90a1353d-51f2e21564amr9304810e0c.8.1739223090012;
        Mon, 10 Feb 2025 13:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223090; cv=none;
        d=google.com; s=arc-20240605;
        b=bJ85qrxEPbBkmIcPywh4BCkpiz7aq68xRSX0zBBgf7qHv6yXe2sB0+ePC3Fz63B05g
         lw3i02Cw6B5vk0rfReKD11QJAJWGdjcHYV5CxobS+e/9z/MPHHeMC3BOAdHhkTGnnOk/
         XpTgPLrOYf+j2pF6DH5HJLYZVAIQ4O4IzTwNqboamNv+BigrALKX2yQXGRxyBmX5c+3K
         fMTjaEIBlzN5X0pSfCbfmZ2CWdDAhlVRQBBkgV9TFOO0nKheKDwZnN0i9np4diVW5Lca
         EftbcE8u5Nsjxxp5qOirVu7SlFIMSquLTAT2358zSkHtvRtduxhRvL/Tz9Ycxtu0w9ge
         5n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W3TRvMCsTOKayhPJBtpLWMZ5XRU7il83OMKb5CXGBDk=;
        fh=mM1ERsVQwgcKb3yo7TgbYZeCYb5iRr8ycQ/rB4WqrWI=;
        b=bwIWZVGM2cYESeIxsS908rh/X2n259TvS0Dhu8araZwmhzdPxBqHfiLFJh8I1LWVHY
         iojs2oRWoaMRnFVu6tyHXa54CG+iYKKVVn6WhpB6f1n1jTv3CFEJyjYlSh3yJWYlqipD
         SqAIwugY9inM7NHKNiMUncMtpzrMak0MOqG4pgKe6kdvD6QE3hAon0UX/q3wrLZXgK/+
         fXGlLxM+1nJUv5Dx0gS/aZ76tXPskMMSPZbBz06GtjTpvlYQvwndas4WUNqF8dnT26iA
         y8oRjwTxcEVA30ZOoGFc6xJUnBUDXRAfhKuA1AsKom5GQZtrJGlRkjhTTD/QDGX5Gej+
         xSAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1sgswSz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f2273824fsi1835381e0c.29.2025.02.10.13.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:31:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1sgswSz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thbMY-0004e0-Pd; Mon, 10 Feb 2025 16:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMD-0004QX-64
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 16:30:22 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMA-0002Te-Eb
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 16:30:20 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so33523655e9.1
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223016; x=1739827816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3TRvMCsTOKayhPJBtpLWMZ5XRU7il83OMKb5CXGBDk=;
 b=P1sgswSz2ikAXuhcR2LUP38G+wLbQC9CkkWKTbI7/0SyRE/bFYPN6MccULfnc0XME8
 uD5s993mLhaoFhKSowp+J0PBStq01snVkN+XMLRnguAlWnX63V6m0wLxnJ92j3tx/10k
 FmvgCmsKzcml524EB7AC5l6g1AUHHoPYG+tOPhjzep/iBcuI46YkGJCNdjTIxP3ePExe
 1AIiaES+Yz39ydlG4OEkPUKyrYsukyWQMuAkzLPblOLX0oS7ZY8tGjvisvHctN0RDnY5
 CmYc4GVYanW/49TU+VYbZZG1f+KZNay0pPlpO0sMPKz30oly9vqhuoAPRKwMJFwmcVfb
 JlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223016; x=1739827816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3TRvMCsTOKayhPJBtpLWMZ5XRU7il83OMKb5CXGBDk=;
 b=vgWA5cR6MHZ2aVbVJQrM0kDU1l4Jx3tulEzKh62ntQ3UzORImroeVGzfSvb0Ks0rHi
 lRB42xevzFHhlwOQLrTeoe03VdWu6diJW0x5uoOx9MH9gp338hMEAb6zfodzYSWNlEgq
 fdhEdgxO77zvaceeeBv12ktgpMIQJCjDQLWeBPpJ+XeKhP4kRnyDiEND93VVNeg/rzwD
 LPm84uiBgeEqCNfLoUjvvwkJRJynFVJ8ipttfS8jPuYQ3PaQdAt8uNzpWAuzXW8ctBn7
 UQFDOeWRpR5ftOvKQrNuXbIrxtDy7wlnSH4kM4GgpDZDvtvRkQhFTPlWEzGrBucZdqbw
 jDYA==
X-Gm-Message-State: AOJu0YxVZdaCNiVVEENXIiLBkWjKMT7rCzQtnBP1iPF1Eq8jn3pUNMdv
 hCf3UBAjZeE5+b3Oki2dF56TlZkQdSqs1Qk8MjkAJKYqqqYsq2SSg/tuJSqYN1zlgqgONEp2UvO
 7g/8=
X-Gm-Gg: ASbGnctT/N99LC5SZcWFtNmkq8vYVPAWiZWSJW1VjiRvGPtoMEeXMOOqhUORe3FOVBN
 fv12I4bhxqKEoPHnw1DLvRclkqKFdCadcJrBhBO7xkURepKPgs78Gxef334Odn5mUCRtDJYOTcR
 RvFwFg3ADrPYDxEa1SvRb84UFLEj9z58uuR9Wc1Q4ZWv7oDfy97sGI05H6AAHcpV0xDuGLmzWt/
 /cniZH/BFoUeEmlz+a37JnjAaNynPTTRm9sHFtL+tFdgLHpe2tu5EiucEbzVajTaI6sUg6ywWse
 L30wGEA0iB+h5X+ESuEpgRCvD2GEVJM0ByROALUER+cJbEBayUz4cjr5050wABVa6A==
X-Received: by 2002:a05:6000:1f83:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38dde92ae55mr5311247f8f.29.1739223015904; 
 Mon, 10 Feb 2025 13:30:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb22f737sm10243442f8f.24.2025.02.10.13.30.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/10] target/sh4: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:28 +0100
Message-ID: <20250210212931.62401-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XxVmcQwNSlg9

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/sh4/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index e3c2aea1a64..9d3e6cb2fd7 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -134,6 +134,11 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
 
 static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
     info->mach = bfd_mach_sh4;
     info->print_insn = print_insn_sh;
 }
-- 
2.47.1

