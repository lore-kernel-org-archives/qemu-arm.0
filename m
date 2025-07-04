Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1250958dyc;
        Fri, 4 Jul 2025 07:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkUsYRWStYQgSh2haD6q8ClmbJLZCj7LNMWzazQ8J0ZVnzn/vyOD/ORwkb5TtvVUO0dLgcBeQznO84ig==@linaro.org
X-Google-Smtp-Source: AGHT+IETDIO9svM0ZQs8O7yHJPggnQ2aruWQawM4GAxL8DbvnjrPmFCnFuCzjb4RBfTz5QPvW5E/
X-Received: by 2002:a05:622a:c9:b0:4a9:93f8:86b4 with SMTP id d75a77b69052e-4a998669794mr38010461cf.14.1751639066060;
        Fri, 04 Jul 2025 07:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639066; cv=none;
        d=google.com; s=arc-20240605;
        b=WpcIxY9jCanxUJ9hJVg+/VzXn3CGNPn8gXMuroMbrruzgd7WbxotK/yGlec8J122hv
         jbII5UJghL57bXzAg6wyXo+tPQYvDCCQvFvHQ5L/PcFM3vQdxEpGC/48MXrsVk5ctysO
         l60I/0B5LP/wYpnzHetdljPcETrZBIsEtY3eTGknRQyvMg3FEOZwjBCe76xGnO5m3mEU
         w1h8KNiMy7fJY1as2OSZRzng+6y/xnVEEPrJ8XxkALuH0qMF6btrxwoo6t4s7EBhvW/N
         eqhzW+40noe5uaqmZEZ4Uy6T8EgTS0zG4TyHexWv4/5uwi2QzfVEuAkc46zHSB8vb6nm
         bSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SujQ6LdtijDSv29ZxZzc+699lWE9s+/bKoHsoQqj4yY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=IPGmBcldXdwGADpLa0fc2JRc1KZ9aEF9ycgeSCLmnrCW/VXXtFrV9vrKVX9TaX3CK6
         Dp/T+C6myPvsqwrtwLrgjmLv4C8aWlmJwN9u28EUn0QLJIfTAr8guweNc3XEwpiliwu+
         97K/QnAJ2e+Ys5oGpLRpWUwWzGLOsWNrotqRd/ik6Bbyw2ClTIqfAAZjczGYiz/H7uDv
         XQBsjO5tXmcI40vInp4KdzzB8zu35pCp9wr12PcLGidCKg18hODfNwcAEvL5Ctmrbody
         1RgwkTMNWwhTRpOSdPBbN/y2ZuLH/zq/GuSaS/UJAVvxc2mlWqMrgx98iPN2k5nmLDHP
         251A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzfqLhaA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994b49831si21334181cf.527.2025.07.04.07.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzfqLhaA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhIg-0006Su-Kf; Fri, 04 Jul 2025 10:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI8-0004yN-AN
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:28 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI2-0005Mj-UJ
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:28 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so1149842fac.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638882; x=1752243682; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SujQ6LdtijDSv29ZxZzc+699lWE9s+/bKoHsoQqj4yY=;
 b=TzfqLhaA4GgK8dSDMg1dCX1jR9ma35Ryg0GCpmpYV/RkIdsYj4UJB0ej1B8htaiyYc
 U/Ym1AhEgv1+8yj8Sarg79LpmDgycYYr1qe6Va/FwcJtyNjSDcZDrj/4Tz2ss9TEHbHW
 2LWApReH3Ofy6bUiRcvthHS0nn0dFJ3jv9LpitCp7v93s/0+zrhrocfBDqPLVG+hdFtL
 jPxaJWTFj7aSJ/h2OPkUO+hkr8XriTv3xk7ubci+ZvqJCUbJs+c0ScTFMPaTdKU/tA/B
 iiBCiTdBvPAia3iF2HXlCO2qyLC6Tl7bFeLJnpezcr/SX7D/lTDmGWS6XbSRyb/xQJcg
 Qs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638882; x=1752243682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SujQ6LdtijDSv29ZxZzc+699lWE9s+/bKoHsoQqj4yY=;
 b=NvmxEY7+OKYfOdEsUOkpLaKI2qZl6lYeT8g3FYigiUIRjT8p8MFEHI5j5gnSqRCW4y
 PClOxlD30NmmYvuOnVh24DgqO+y4TsJhx0t0wCCrzqhHfzSgN0VA1hrQ6LytkR/xfCxd
 +WrYR6UG66ZZmEKtBgKAWVm2Ns0m5eczbZd+XKqISidGHUn6j70rABvBaIdw+pZ4DNcw
 oYAPUNlTReBx2Q/w35s8VM8hgnIk0SHMmEKzRP/BsthdcaBKot5IeIcXAZIwo2exyE0B
 TZTDsjXQ2mRDKVCgDVglv7SDXNl9AGuSsAygyAQ7pnuCBIUPTCAEbdpYfHGza7zWKe3F
 +D1Q==
X-Gm-Message-State: AOJu0Yww7htyE2iT8gz5fLgVQuC0CNyZ95A8rqSoTgfG4yLnAsemMvIx
 o4RCr9662PhFyA7YeLWT0F0vE7hYtSG+hRuQHlDZs05MJHB4twIfh7r8m23QXtrkC0RNNdmT3Sv
 vzcsU8FE=
X-Gm-Gg: ASbGnctwNkU9EP3hvo/Y3UMgoIYAPR8hlNFSCDgTYgYo/0osS6+5bczT2tFAO8fnhuz
 /Uvm7uodROvGrZAMUKcqDwwkJSnlp+JRmB/IazQSE8GYLV7wps/f0mxnGPjHkIQ40Rd5MbrLdGE
 cVho3K/gXl9TRxL5AyTGQzPj8K+/WTdOxY0AS1H08dRNVDImmwm5G4aptYd4/nzhjeuHtclUcIo
 JOd8RlhTvZ+Nn7G+YLttl/H+IjkSdlNrtAkOpPhvXLHr3jSfUePt9kbdy8Rlr/JwlYlzBWyC2h8
 o0yz5+3vF5vkC73KnC8lMVVCLP2nmGRN810qDvK6MvX9AWbsAtHtVKHZrpR4JffCptf7CZ4H8SN
 zZf9Kgmj3fXWK9lcQ+EfntODtr/dvgTPnPCTHfvrG7ON9nRgN
X-Received: by 2002:a05:6870:c086:b0:29e:2594:81e with SMTP id
 586e51a60fabf-2f796a75f48mr1758726fac.13.1751638881021; 
 Fri, 04 Jul 2025 07:21:21 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 006/108] target/arm: Disable FEAT_F64MM if maximum SVE
 vector size too small
Date: Fri,  4 Jul 2025 08:19:29 -0600
Message-ID: <20250704142112.1018902-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
X-TUID: HU9Tel/ObpaJ

All F64MM instructions operate on a 256-bit vector.
If only 128-bit vectors is supported by the cpu,
then the cpu cannot enable F64MM.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1f3406708b..77e7c4a6a5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -259,6 +259,13 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
     cpu->sve_vq.map = vq_map;
+
+    /* FEAT_F64MM requires the existence of a 256-bit vector size. */
+    if (max_vq < 2) {
+        uint64_t t = GET_IDREG(&cpu->isar, ID_AA64ZFR0);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 0);
+        SET_IDREG(&cpu->isar, ID_AA64ZFR0, t);
+    }
 }
 
 /*
-- 
2.43.0

