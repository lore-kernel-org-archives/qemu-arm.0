Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp637291ejb;
        Fri, 26 Apr 2024 12:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV2FHCszHrIi0jCzvG21xX0PmMjKu51nT4GUDQm6ECZpHXLwjhrUYVyfrCbOLyM0a8eKpM6ejQWi0DK+ttPE8v+l3rwpa/
X-Google-Smtp-Source: AGHT+IFDBE4cPKUi8L7nfnmS/RzxFQrTZhlh1RO0ULlkmN54ZZuKbPAmm9arXOm3n6DNBRd0lI7Z
X-Received: by 2002:a05:620a:3889:b0:790:9817:309d with SMTP id qp9-20020a05620a388900b007909817309dmr5019934qkn.9.1714160655775;
        Fri, 26 Apr 2024 12:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160655; cv=none;
        d=google.com; s=arc-20160816;
        b=tQ97yKvjmaYBownDlJZF47mNv6AXR96G2gxkQazhrfL3jzee4Qf0BUcgFD2n5GqJiG
         Lf1Lu1x+IX3rDziO0rCz5O1BHA7rCkvpKs7dni20Ax7kVHN9BAqd/EtRwaygRava/6lW
         WiQVKWfzyHzUXaLa1uAC4GIdkzvf/o1Gnf5QOzvaQfLT5BRfb8ne3Q+aGFlJGKbSZTmo
         MskenIzbhsbU6qjb5xGjhlY42H/lxm3M/lmyE0OlVJY99CRhdUHnxMtWSWfWwHf0bjoF
         fYkpt3idN4nwpB4I/JTM9bnrEsT+AnbY/bQJTdXqEKvsDYfWqtjJ0MjNjqmuPRG5z7H+
         6eXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zCHikf9aNyk3WhcB018t8YJhGkQVI+bzenRpRAy8E10=;
        fh=vrgnZ2KBskJ2OKJj3lNyG1o4xMqth8alyTyyIGcBdSg=;
        b=KgQWolf3WMp5ikUBIJmCDi6s+/5na5OU/wVvi+j+vNhA2g6sBmDR2DEGeJEVk7n8cb
         djML2eKdMktnAwu1ips+A2M/5BHSeyFE3dwI9s5e2Im/JoNyOn6WE8p9HxCzqQiKnBkK
         u4C5TYSPWf3N5Iw6cYU6SmcMP7RbuLOdUYJg09KtDlcAvFf0SxDYVF5ldyhpcQEwXTc3
         urxDYAXV/g7fbfWAFJj5Mg/IXuBkCzkkDgsNb500fC9oFTd4JvInRHTS5n6j2jjNH7qA
         GmmZA8M4jT0rtFhzbiO8racNwpzapFLCgEEe0WdKX2FmjmzFbwZ1loEDBNUIXw6eokHf
         XYNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ymlZhQlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id yf19-20020a05620a3bd300b00790676e03a6si15365680qkn.331.2024.04.26.12.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ymlZhQlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RTv-00024c-1K; Fri, 26 Apr 2024 15:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTj-0001YI-Kq
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:43:27 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTg-00034u-Ki
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:43:27 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a4715991c32so281852266b.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160595; x=1714765395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCHikf9aNyk3WhcB018t8YJhGkQVI+bzenRpRAy8E10=;
 b=ymlZhQlQ1VzKm64oGfteRO29nS8XfmuSYGxOpxtp75eg5VF6T0AXaKCFqrYEYnalCN
 w5fnhEJAfmhJ5FLLmyu0YSFBkEenyCKXOEY71UVl0z2jT2kD7d2PmTgkc1KwILTHfVse
 tvz0BkeuXjdPKqIxNJcK/5BIbX0LDMM8BT/OeihwEjz0Roh5+npNOLTipXTozn0GOC+x
 gAES0+cAdICfSTPg537+z9gOoWaiuImQpFebi6Yq0WIPJg0OMgSBZxAOvqprx7UKwkLT
 dyfkuWZxsY6Q9xXuhlgk/2rfXRqPZiR0jokMgpvdA47M37PRKrNS2jmtlyjucDBdsW6z
 /BWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160595; x=1714765395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCHikf9aNyk3WhcB018t8YJhGkQVI+bzenRpRAy8E10=;
 b=oTOwMcY+CsPromll36c3pGAxwfuLKUQWdPXRWzZ6kk7NGYqbUYBfDa2f23nxSnwdPZ
 qD+t/b1CpfmNtnF03FDrtJva6mJQTYsDlKYhnbnXavLbB8p9l0Suq9jSKjdK+JGiYw2x
 eSWg7tuDbLnUsBH71ahHFrxVux/n1KUC7+r3uA78FsGffIgAFJKFqDiNT8/hHVUDPO6T
 dPoXV2T4iJsLkAaXR/xA2EgHkroXfJXpCT3Q7ygPMR018CTbk4YBMkj/vtVgvjjrSL2B
 CPe6EdlAprU2YvZOcuisbJTl7HHp1P9i/4A+quiPmN/wW8qgDgGeQwVUyKjhNvY93MJj
 wA6g==
X-Gm-Message-State: AOJu0Ywwd4jmWS9QQNd9D2p5k80bEaYMRBCey3GNUUsmbaUWfgh+12pz
 M1g+zm6TuXO25uhVUR6RNfjvRTwSSLko0LHoZSKF9Bsr4arzfxne9p7zXUK4bDM=
X-Received: by 2002:a17:907:97c8:b0:a58:7857:fee7 with SMTP id
 js8-20020a17090797c800b00a587857fee7mr3023416ejc.68.1714160595167; 
 Fri, 26 Apr 2024 12:43:15 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170906090d00b00a588dab605dsm3666771ejd.88.2024.04.26.12.43.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 12/38] target/ppc/excp_helper: Avoid 'abi_ptr' in system
 emulation
Date: Fri, 26 Apr 2024 21:41:32 +0200
Message-ID: <20240426194200.43723-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: p78vN4dNPcxm

'abi_ptr' is a user specific type. The system emulation
equivalent is 'target_ulong'. Use it in ppc_ldl_code()
to emphasis this is not an user emulation function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231211212003.21686-18-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 674c05a2ce..0712098cf7 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *env)
     return !!(env->msr & ((target_ulong)1 << MSR_LE));
 }
 
-static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
+static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
 {
     uint32_t insn = cpu_ldl_code(env, addr);
 
-- 
2.41.0

