Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1250687dyc;
        Fri, 4 Jul 2025 07:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjMfgWs0RjHPai6SYJW1zl54ij5rheLYbFVpdAj+YVxTX8avXCuTc7WHSlmqBt8SjMUoYy82BR4/zd3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHATHn2rhHB8a/04UjDXIKM3JkRaKw5syXeteHSBhTfx7GRN/nveqGLE+FVeV13juVlrjiR
X-Received: by 2002:a05:620a:1aa2:b0:7cd:1f2e:dadd with SMTP id af79cd13be357-7d5ddc9831bmr296125785a.55.1751639040740;
        Fri, 04 Jul 2025 07:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639040; cv=none;
        d=google.com; s=arc-20240605;
        b=TeyMq1HKiVQT9nX0xOtnxQO5wymwUZIE9cPogDomK3DJQ7doBieozpy9ZWYahrRSKD
         zAC53o1Y+cSRGXESUs2JW5V0tiWH6r7s9vSRwdnnHqQIqnwO93U7whNkO5WeH677zVTP
         jRqlvqSZa1uDE/n3INsoRKEhNbzOeJRq9BP1+cdaUspF+4B41EsI6RhjkFB5JubyNfBB
         uTkDb2/YYNEjQM4AltBpkTDYuHiGEdpnNDmHxH9j47HzbuBEgI6jHrTcBXnRQi1wgR21
         f/NRtcoZRAC9rXQ8U87s8rOzHdDrBJTAtS6MAqJHxjS2zT2t9elo7bAlEQNIKmSw5nXC
         tIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lx97SAEIj0LDjsKZhXBcjsfLl0dzyMaFjd8rhTBp/F0=;
        fh=s400U+Tx6cQDhtn+2Oey97pyo8KpW6wmR0wxZgTa8vk=;
        b=D0PcsruU6j4S8TLqClP+gfUcrOeB0fNIwIi0Vc7s2Uij36alFPe1ZrpMbWzNM9acfe
         DqFIOvrB4RC0VPAq0UvvzLUmz9LyPVCOABPagYc7khTBPDuOqNQ5YYUK/nRDzL++rHnd
         QvhUygARfTMB2NdHtS+BLUamYBRsHeoUWoWKq08gqsuFK1+JL42Ock5iw9EqNJk3GkGA
         zPWtgf9ArqXJAgHgeTEL6QBjyGkqTp+Qb37J8vXGPJL9gZmRh3YHfAquQgZIYkpX3QZc
         bqx75D5QVsrkTXdE1noUr6ye0IcIwBmy/WOeXKjRF4+OnfIe9Iz1c5fbeFACSVWw10Je
         aJzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kIVftFVB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbee1fbbsi233099985a.477.2025.07.04.07.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kIVftFVB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhIr-0006t8-Td; Fri, 04 Jul 2025 10:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI6-0004rC-4F
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:27 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI4-0005O4-1r
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:25 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2efc0ed41efso403625fac.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638883; x=1752243683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lx97SAEIj0LDjsKZhXBcjsfLl0dzyMaFjd8rhTBp/F0=;
 b=kIVftFVBbXin13GdWsgxGe2ctjmeUr7GFwf2MZkhEhRLKKfNCzZlLJR4bShlgwvk+C
 9IRFXe61rCbtBeXF3wyBrPZXDEx08msyRErdAt9WPMp7Udk6/gj3yeMfXwpH29KVQiPF
 o1mDLDkxEPRVQmAZJOgN+YWlxH9rUKdbOalQrJfJSYA9Ul22fcU0xyxE86DAH0C7hoI2
 B8vdms+V0AHsNs/WUJd33qLpYjACeH7QJZGNNn7lTX+dUv2594CMhGxVR2EKBBQTU9Kb
 pw5Xx6ga5xKpQmzmTnbbDG9LX6BmghN9wAyXiJaoT+iYGJvVi1nsjhIke7N6hqTNjw/t
 65VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638883; x=1752243683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lx97SAEIj0LDjsKZhXBcjsfLl0dzyMaFjd8rhTBp/F0=;
 b=T4vR+umFzGb8u8gPkBPORdW0ex46inP/ejxA7BfzByBd7i6XQUHvaZcKq7QQ/EPrF8
 0ocOw+6QuoZrumO8VYoNrbaO+gAC+q4BZLiavywpiujMRSGuajgZQjJHXplmCwnRsSL5
 nzVJs3NrGCpwEwOSzpG8brZDB9ahGK0fsJSk6VEXD9WsJSQcp/unJiQBv6uOwfBrPz0v
 qRE65UwWil2HZysq6EZbIQHO2vtHrLBy2vL9XOG0u+3ZwW/pIxz123zTjb06NwH090+H
 E2bN+SovyVO36VBUgq/AH6FW/sgF/MgbaNZxcHdMkeBk4KVu/fIJpiIuhbtpLi68aB/U
 U0rg==
X-Gm-Message-State: AOJu0YwWN4ZP4cCcyeVMCBp5a6bVa2Y2FbYSs8KaU8BG8JFpRTVda/TA
 p86mYIbjiOEeV4u2cg8V5ImRZk69VYZq7+O0uUpZNDiIZRlkC90I3njhcJ8MPxhemAtWHn3F1cr
 RJ5+QGyQ=
X-Gm-Gg: ASbGncuAaQ1hr8AL3mVsmeHpzCgm3R/9zWXP1ISuLoa6VZYeXaZbAwh+sU/F8m6bb6L
 n5aG8AS12KDNqN9yvoelsta1AB3fj9NLgVSxKEiYOrHIEv7qci+cp6OmV0WRDMilwNXLmNLq56P
 qz8NJ+alp/YVrJBeyVQX7gSz0D83lNBtqMofr2Otd67+LmlQRzJsr3ePX/Kr6i95qhBRyjUmWCG
 qRbKZKlTVB2k29sp7z1/uCxXt/sqos6Y6StaTpzCIOSOVdjAKR0Lmaw5xCy8UETG4fu4G+5lvLn
 yDho5HkETjYdTC+0gYyBrzL4xbXbC87zU71wcE/bDpggoRGlQL0TSqoDtmDX2O/tooTHX3RXJdZ
 PDfX1dGLo/NzLTMYQbFDc8/EjMMG+DfIi83vz3lBxdAnnnntiZYSGAIbRjv8=
X-Received: by 2002:a05:6870:c14e:b0:2d5:b2ae:2ebd with SMTP id
 586e51a60fabf-2f796cd72fcmr1738180fac.34.1751638882899; 
 Fri, 04 Jul 2025 07:21:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v4 007/108] target/arm: Fix PSEL size operands to
 tcg_gen_gvec_ands
Date: Fri,  4 Jul 2025 08:19:30 -0600
Message-ID: <20250704142112.1018902-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rJivmKEjqXaJ

Gvec only operates on size 8 and multiples of 16.
Predicates may be any multiple of 2.
Round up the size using the appropriate function.

Cc: qemu-stable@nongnu.org
Fixes: 598ab0b24c0 ("target/arm: Implement PSEL")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index a0de5b488d..8403034a0e 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7291,6 +7291,7 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
     tcg_gen_neg_i64(tmp, tmp);
 
     /* Apply to either copy the source, or write zeros. */
+    pl = size_for_gvec(pl);
     tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
                       pred_full_reg_offset(s, a->pn), tmp, pl, pl);
     return true;
-- 
2.43.0

