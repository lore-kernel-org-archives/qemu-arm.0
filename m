Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2229292njb;
        Mon, 10 Feb 2025 13:30:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDHTMEot3t8whwcj50AKB8F+wLUngm/2HKtKP7z8lSyJmH67m2QvyyltqNfvnVKl8rGO3mx+TgAmXMyA==@linaro.org
X-Google-Smtp-Source: AGHT+IHWlt4CkZXN83rZZpGjU3J6eVXa6ZDvX7yo0BLFvEr+HzXDMlVfpG+JK7VDxW7wJzxYdElN
X-Received: by 2002:ac8:5d55:0:b0:469:715:d94c with SMTP id d75a77b69052e-471679cb06emr192554391cf.6.1739223017029;
        Mon, 10 Feb 2025 13:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223017; cv=none;
        d=google.com; s=arc-20240605;
        b=H8PmZpRKlqDy7KjzMKID7OAxz7U33OdPOE6Yl1ZJM+pz76snj0Z4Rsg7tcAmPrv2Nh
         WWTCh7z3fO74fEzc+olMdIFZ1cc5E8f9RlIeRr4wNNTkeBiKa71dEjNEQcxWpHwch0dw
         1jg0kEcawl9uyGdXGKonX2h5VfT+R13wdtlBYfzAGMDSnbwnCUZ4LSJV9wk2KQ/DQXFb
         AkMr2mUy3le48CIAGVDP4yzEH2SZylJa+rikqdBd3fXvX6/MprItZ3GJuxqb5jCp0gvz
         bXcyjYQgv5d2yaRN5XK5P/zQcNZ4W5d7kcksr6IT+lbuBXjnzTEuFgNnlMciYvZPg3br
         Atqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+JtBiYKMI/Sj3oIOkec3F7FVIT/FlOHh9WNs4yErZgw=;
        fh=HarYPfWvS4LrJl8pZgaxkUds5SIzsQcYzODWGEiukHI=;
        b=Zhvx4EzME98a39ZfQudA4iY3s9irbNrZkNhZ0Jo4SjlIx72qy1ct8/Upau1S59g0kB
         KXeWzOJmT0sQrh4kNMgVhlrMpzHtb8lcYwKqzHv6WXlTWdu5lprfbw2+NVZc0MMFg24g
         93yD0CfiXjuum3outVmkS1eXFBqD3MkRulxN1oyRawFB7TVaUaZLlrGAd1kOu3PD99mZ
         p3A3aBDs2nD+0xCYwT+1W2D+snYfxu235i3SRnJcZu51d4GqdKrH0AftaDEJRWnz9lrM
         SxiSO5IPrU9C3xROJwIyov1dbPj5ZwsLNEp4P7sI0I9W19jtmS8oHkRevnBD/SS78t56
         Ks1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ddd0eL4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4719e7d3659si10193401cf.396.2025.02.10.13.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ddd0eL4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbLw-00041V-6a; Mon, 10 Feb 2025 16:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLu-0003yp-Te
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLs-0002DP-8I
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so48382485e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222998; x=1739827798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JtBiYKMI/Sj3oIOkec3F7FVIT/FlOHh9WNs4yErZgw=;
 b=Ddd0eL4vR2q1s62vhOZtVtmwLGOyQ7MO7Ajn56hWS+XC+3CjlsK9JEZeCPpuxO0h2c
 H08NMxioC1ovSmVlbMw2Ad7Hyy8anAEDzgXGD4jxS4Wrz4pJ9xZgCNeLtzNAMJniemXu
 UGN2SnVPGAA2zakOmGFIZ4FwQMx8p4PeXOk/06MXQ0akIRM2ayxkZ02CJzKmfA8AaWgY
 0q1UxL53hoesNbEA6um3YSypyBIiVph/RmpemNmWOxrVVQAq2Okcd0a4AhS13lj1n27q
 DZ1a532DskpAkcZw4ParpHdsp8w7viaCCxzj9fabjpGAy5LhcWv3FbzsZRQEI61eW++b
 k7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222998; x=1739827798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JtBiYKMI/Sj3oIOkec3F7FVIT/FlOHh9WNs4yErZgw=;
 b=jVrBoGy8JEIHv+OSo9bP5ycxGSkKzPnUKGkDc9KJkjKVO6YqIRTmS56RYwV0B/nWCz
 JI6yaYb6fUFe68GLQfOFWhWQ8hbEOrYc2GQiScjJED1GFVHc1vLUtf0e03ekaFWsU/g+
 kIAhaVzQx5YY/7ySxo3vWD0qWwhAikyiY7o0piaobSTcK4hf1kEDkRlqu0aGxmDogES/
 EimXMnpntG0jJjEUf2wsDE8PKZgCXX6ZZGIy6nN6DxvEUyRP9NFFxJh6bh8ihqkTyYA+
 JqwL5ZgfO0LUDMjLSEhjMAQ55ZHvWk9DFpJ146q7yS+QxvS8o75LlgG6UX8tP/KZGyJR
 U3Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVom1RjfGEaSET7itHnTdsRFXLsEPD171iaKEAByidPNJj9Hj5hXygI9MnyJSTrczt2wx/apBsG8Q==@nongnu.org
X-Gm-Message-State: AOJu0YzjlAc7etF+Re0WMiICbegOqDphlZVJx4+jcqSazsKSbuyF0m9h
 sfwyZLaRxMtoLBBTO5JCloBypnuekrbASB2nCIEcVI+C6p4C9nHZZRFv8H1AN7I=
X-Gm-Gg: ASbGnctD45vwSr7SxWGIALOvUfD6Hkt1MCdbSBqbgmOXd1VboTa6g0T2/Cbjlq+BtpI
 asD5lPdeuFTIG+n8wzMpUNNVV76fJm+JZodNg9mQHSKwOdpc/cO6lg/GV8I8lCULnDFo0QYu3MI
 gcBm66QRATJFZjFHUWnvg/VAGPEj3H8cNJC+hYi3mQSWG8e/p0+PY+f0dMKr5K91SyIW+xTW5Pd
 jpylc4/6T3/m2jBGxOwKoi4ZOFitzlCgnlidiXibgyBseEMWsgCRo3qgq/EEFXX/JXZzI1xpa1m
 aBPAVdAbdSLpMfu243s0oWmMYqTk3VZ8KkPGKjZzK8Ze318ABI4VrV+SDRVrdaDCrg==
X-Received: by 2002:a05:600c:1e02:b0:434:fa73:a907 with SMTP id
 5b1f17b1804b1-43924992054mr128935005e9.13.1739222998589; 
 Mon, 10 Feb 2025 13:29:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dccc1f531sm9947450f8f.87.2025.02.10.13.29.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/10] target/mips: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:25 +0100
Message-ID: <20250210212931.62401-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: /I8ZwbLIMR5D

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/mips/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0b267d2e507..f6d247b530f 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -429,12 +429,15 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     if (!(cpu_env(s)->insn_flags & ISA_NANOMIPS32)) {
 #if TARGET_BIG_ENDIAN
+        info->endian = BFD_ENDIAN_BIG;
         info->print_insn = print_insn_big_mips;
 #else
+        info->endian = BFD_ENDIAN_LITTLE;
         info->print_insn = print_insn_little_mips;
 #endif
     } else {
         info->print_insn = print_insn_nanomips;
+        info->endian = BFD_ENDIAN_LITTLE;
     }
 }
 
-- 
2.47.1

