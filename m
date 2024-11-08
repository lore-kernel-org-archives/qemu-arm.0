Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5009370njc;
        Fri, 8 Nov 2024 07:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUF3d/GuceOGYk1Dt+OhPD2BLZpEoTo8NqULeAIEDPsgayPkY3NftM1k0V/k/+sAbDHXxCAsZpVuRkCPw==@linaro.org
X-Google-Smtp-Source: AGHT+IGBtwjmVfOny9vBySRgH/P+cGUlSr4yccAfYDMkCfxXTxEGUji3JmGJnFmTurjVHXy1eaLo
X-Received: by 2002:a05:620a:44c8:b0:7b1:43e2:712b with SMTP id af79cd13be357-7b331e71568mr509839085a.11.1731080771697;
        Fri, 08 Nov 2024 07:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080771; cv=none;
        d=google.com; s=arc-20240605;
        b=jSi3WEM0bIb8DzTsA7Ej5g8ui/Iq/7zYeLpvnLKvG9lqk3N+r3nA97Dmopj3HSt8F+
         vFNnOwpRu5TmSTdX2JxCFEv15lvwpPOZUuRGcgNM4sLntynB756/eme3AgKEXWunR0LE
         Z9MoGY9gx2V2JJyZ28uLcV6UKfMIh1iyuMbd6Dp4+P5kWWVLRsZ4wXvtY12VWe9pNFch
         3D0VQ3lx0c3xj5LOkvIzJRx7kP5T2NbxFCZsCBXAWFDJqlXkT3295Cyb0OjqvJIicNBm
         Ape7+TT9At+6NifU5UUJxO6tiDkZs8XgOktYobFqvzH1t34eszQAUs9LfHqYL2SWppG4
         yxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zZt7LLYaGK4gLd7N4XPj6yKOClYWTX3p+vA4olh24GE=;
        fh=mt2exbo1CwJYCOt9uF9zIbkUg8fivfsy3JN21JZbs+0=;
        b=JxF9vfaFhniIf3xZHBvQJUF/YNw5bcwSKRtn/HPTKzMlG9h4fUO0h+p6V2yfT19QFn
         HYaH+fObecv+Y02Ze7nCxKMRsPESkwCXqxmgia8gprAjZGSofuw6bopJqR2So8gz2p1/
         hsZ6Ie9/DCF3LzbOVdUEAzUtC/+igL8aUKTXQL6GIKoRdAKvnTldDTk9zUn8/EblS6VE
         BPzYxJTD1tQMee9Ta7y6wLU77fiiXAl3xMZGLMHYfs/oVcPavb8huno9nStr3rxZn2Hi
         mIXYkFtUkwsZ6cMipa2sfBbW6AVk5PL5NVB6/XC4ha2xugDq0YYgBPwzxLm5QoDNpzLC
         QXuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S9jWg/eN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad0ec7asi497125385a.554.2024.11.08.07.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S9jWg/eN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9RAY-0006dj-CN; Fri, 08 Nov 2024 10:45:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9RA0-0005ZK-5t
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:33 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9y-0005gx-8d
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso20146385e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080669; x=1731685469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZt7LLYaGK4gLd7N4XPj6yKOClYWTX3p+vA4olh24GE=;
 b=S9jWg/eNnVWpra7kLz+hDJCIcNCA6qZe0wMZXK1WrDZMiWaeixpscavNpmJQ143Cv1
 mhOBnXfsxl/25i+Ph1Jete7Tof05lQvqrHQT4I92vVVK4Cfnn3bLU28x7dOT/rRHK/fq
 LRgYoDbIy//szUJPgtOSk6ckRNAhuTJ2u1j049Y2/GYN1EExP21tpV+1/6u93th3rWhp
 A0DidWMVEACNYRVNeWxLV+Kkj2V+LXqpSsNjv/9RJD+vRcixunNW9ilD8ajpW2LIyYkG
 ywbltn+SBJdYru81jwqV3hGi5yvraXpYl7mLFzCk7YK/XRO4cybMoufkUoJXoXniQTB+
 0AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080669; x=1731685469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZt7LLYaGK4gLd7N4XPj6yKOClYWTX3p+vA4olh24GE=;
 b=XArnUvH7UoEurMw6roy5ofLlXepus45n/AxTHDvMy89LHELKVHXrGBAFm7DwqHsP9b
 G3aHzbilSwrAEDRjMNSKJwEHhxThVAGmmmsCpPSra31GYNqSjjsB1xwqB2bJFgRcN5of
 M10kIJ6pTNIWpnmJysaYOP08S2Xx3C3fn0kPExXs/YNpSh2zvaay8vpsWx8071bAY25h
 qaBEpQA6SJrHnWt5FOSYhUOkhM2B3+wC7OCT1txHfkMpvBgJIIJYVYy7VIg3L7J3Hb5s
 61Fl6BWCoEl0uzDU8j03ZD1SvrcsZ5JX3itXikA2aACexIwPCv6tZPRDzkViL7yqh91r
 RAWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxR07vvLFwCEQ4uGWzS5NPo6Jme2L0uwjCT4CC+VwN6WkZHSl/PSM6zqlDomRSex73U0TZED/WRA==@nongnu.org
X-Gm-Message-State: AOJu0Yw17mM4CLCpFZ1zGCkBzhWvybZ67fsey92x3F0uziqVl5+3MND6
 BFH0CB9LxxD9jATcw1sKNH+T2j6yVyk8MjU0wzryEIxHyBFhZms7fCtvGAv9ZBk=
X-Received: by 2002:a5d:59c3:0:b0:37d:37b2:385d with SMTP id
 ffacd0b85a97d-381f186319fmr2860087f8f.12.1731080668871; 
 Fri, 08 Nov 2024 07:44:28 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed99681csm5368641f8f.49.2024.11.08.07.44.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:44:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/17] target/microblaze: Consider endianness while
 translating code
Date: Fri,  8 Nov 2024 15:43:14 +0000
Message-ID: <20241108154317.12129-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
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
X-TUID: iC1WQDXxAt/9

Consider the CPU ENDI bit, swap instructions when the CPU
endianness doesn't match the binary one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       | 7 +++++++
 target/microblaze/translate.c | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 3e5a3e5c60..6d540713eb 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -412,6 +412,13 @@ void mb_tcg_init(void);
 /* Ensure there is no overlap between the two masks. */
 QEMU_BUILD_BUG_ON(MSR_TB_MASK & IFLAGS_TB_MASK);
 
+static inline bool mb_cpu_is_big_endian(CPUState *cs)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    return !cpu->cfg.endi;
+}
+
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, vaddr *pc,
                                         uint64_t *cs_base, uint32_t *flags)
 {
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 0b466db694..5595ae4fad 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -709,7 +709,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
 static inline MemOp mo_endian(DisasContext *dc)
 {
-    return MO_TE;
+    return dc->cfg->endi ? MO_LE : MO_BE;
 }
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
@@ -1646,7 +1646,8 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
 
     dc->tb_flags_to_set = 0;
 
-    ir = translator_ldl(cpu_env(cs), &dc->base, dc->base.pc_next);
+    ir = translator_ldl_swap(cpu_env(cs), &dc->base, dc->base.pc_next,
+                             mb_cpu_is_big_endian(cs) != TARGET_BIG_ENDIAN);
     if (!decode(dc, ir)) {
         trap_illegal(dc, true);
     }
-- 
2.45.2

