Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp700472wru;
        Wed, 1 Aug 2018 05:34:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfaU6aNbjxnZA4DqvFGYWV8WNvROXZxPus1zCXn2ZYlSp32+K0Ytx7ZO2wFwwd52uvQjtZV
X-Received: by 2002:aed:3c55:: with SMTP id u21-v6mr25323108qte.198.1533126848324;
        Wed, 01 Aug 2018 05:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533126848; cv=none;
        d=google.com; s=arc-20160816;
        b=G/DF1OXD+8UvnseNLpi0JHRK7gePY94LXfZwfWY7h1Y64znnpI0yJ++xvpEeoKtXBX
         JKNfKb4agOvr28CEXHlCo4PFZ5VYzEUfqA/JIZl01iT5Nk/iegcBTJRAeDfHuiiNmWmq
         tnaD3WDWiM0Qzh9WCt2ImgE3QmCGEYs6STqj2tcsjteVXjG2zb9YrrZYfFIuEwtFkaRK
         LWiOScvk7tFpohpz9M/hZG2dDOhDfJWY3jFeihz5F6xFaWmempfupNOj0wiOd1ugiYD2
         oAWfEHZGmmj6ltbqYZM8RZbqvCaj+0uzCJT2fzZer1WqkLnuNOT2awuQuStwI/PFj9ND
         J41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=meIxI9REfNuuDXqb2d2tUiCdfpPmOKrHrmyjZQJNHEc=;
        b=YTRETMH2gxn+LJ31ilA2mIhJgcenIn8Xf45tMAjq1Sppj1pFAiVRUpsbkwxCqWggnu
         w2UFbJvgru4f4VzDs8FjxovnR874toxIpH5RXBmg5n4UA8+H2TOSTCMXYJ5jZ5ZuWiQh
         rreScqnvCtM2EclyblKpVl6gk2qWZsYvPQuOj2zIiOFBvJ6kOe60kaQ6XgZeugaCEWSj
         Z4nr20wWvshNlwnPJv07c+vIgfuA4viDd5VtR1OG1wn5KEKjtYQAH6WaYvpzyfNCAxBs
         KNgsYrQGFs0EvWCzGklJkC9W7TK9K0cA3aAL04fDPQkdgCvyjuHSWsQCpyjwglht3vnv
         NLCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RipsZSu7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13-v6si2895728qtj.316.2018.08.01.05.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 05:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RipsZSu7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkqKN-00078v-Pg
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 08:34:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHj-0005mK-1v
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 08:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHi-0004Sx-9J
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 08:31:23 -0400
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241]:38611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkqHi-0004SE-1L
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 08:31:22 -0400
Received: by mail-ua0-x241.google.com with SMTP id o11-v6so12543567uak.5
	for <qemu-devel@nongnu.org>; Wed, 01 Aug 2018 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=meIxI9REfNuuDXqb2d2tUiCdfpPmOKrHrmyjZQJNHEc=;
	b=RipsZSu7IzIAoT8UZJK51TdZ9oAsytH1dwONaFGzgLna61/90YWjLBxtrlHvAEwqqG
	l/zIOR7YO2ljcyq3AQBS5+WLH3WTHeJveOYamNkbWkcSqbNgoDXCjk3OE0tTYlHmC86R
	M6WNbl/iK4QXEkbf+c9sR+KsyvZ8vaWtQyvM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=meIxI9REfNuuDXqb2d2tUiCdfpPmOKrHrmyjZQJNHEc=;
	b=ohKVkSQMhzxAC+YP1imPV0JFFKZs920XtWAhzkRJ+5+28VB5bI0JTd8ybh5mckUf6X
	7GbZUCth8trC9wX7LbobHn8EGQv14zXfSkt7Ozxc++1sSihG2dEqP+CkQfuIOeNEASwx
	G1+M7JPVJHUpTNQ4OnI9kSNOrN6LplEoLj0wCBmxpoDeQC7yDKPzwidBNRSZ4J4nqDsO
	y9th6wkCz4wGFv/u22BFCBgIki5DyJ4TKIOe7clXy37Ne3lJ92hpi1QPT2Yq2HTT75oK
	dS9SLAHV6t/tva0NP0RpfWCRCdTW2zAofN0wmI4zFCL47kpTSgGLWB0HPCy/+p5ZXFh9
	/vuA==
X-Gm-Message-State: AOUpUlHTB5AM1fwErJXcCdZrBTZPHbVKuZMMJA+sOB63izFfDVr624mH
	WXamR+w7OoTvZYZhcSo6ZCEoVmwsxxg=
X-Received: by 2002:ab0:238f:: with SMTP id
	b15-v6mr17877170uan.164.1533126681148; 
	Wed, 01 Aug 2018 05:31:21 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	f60-v6sm4247847uaf.10.2018.08.01.05.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 05:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Aug 2018 08:31:09 -0400
Message-Id: <20180801123111.3595-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::241
Subject: [Qemu-devel] [PATCH 2/4] target/arm: Fix typo in do_sat_addsub_64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HD1ugOkHvaYx

Used the wrong temporary in the computation of subtractive overflow.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 374051cd20..9dd4c38bab 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1625,7 +1625,7 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
             /* Detect signed overflow for subtraction.  */
             tcg_gen_xor_i64(t0, reg, val);
             tcg_gen_sub_i64(t1, reg, val);
-            tcg_gen_xor_i64(reg, reg, t0);
+            tcg_gen_xor_i64(reg, reg, t1);
             tcg_gen_and_i64(t0, t0, reg);
 
             /* Bound the result.  */
-- 
2.17.1

