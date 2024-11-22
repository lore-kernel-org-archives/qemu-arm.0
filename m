Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748607njc;
        Fri, 22 Nov 2024 14:52:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4tBzDUkwgwf37Km2eZWKQqqmebUW4EwI/vj/tcRPDpDziDu1jxrOJu1vMizxrf3H+uK97Eir5AS4tCQ==@linaro.org
X-Received: by 2002:a17:902:f54c:b0:212:5b57:80db with SMTP id d9443c01a7336-2129f82e47dmr52889585ad.49.1732315928186;
        Fri, 22 Nov 2024 14:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315928; cv=none;
        d=google.com; s=arc-20240605;
        b=GMaBzGWN3axCuPjYGweFzl9pvYn6xdrBJv7uCKnUCcRf1rWPMEVMpLzLz8/ks1b42+
         bxwQY6I/7N6UKB62NESaLByhlxHw4uzMvfs30wfxO1MfvtZgD+uVHB6Yw5uOHdYaD1AU
         CDaRjyAGLlOx9Vzw/FzRykwThkJ6qG+Az8w7VwzLp54wK6CD0ghvFn4blQLeeqd/GKpE
         MVS8rf7zoBOhlYgxOs/B3LeTx0/S6dyAmNQBfbt/ho+GxovkpgaTbLtHgI3IqdSm9It4
         805ihwRAJoPX5ppB4bt4WMEjLiH/JQPg9uJpwvkHTwtsQXrnNh3PZWJK01Ku4qqBf44R
         /vVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4LchKyCC8/lK94Twv/nBZVCfFgzSxUclYfBwVM5ni+0=;
        fh=MIBeZqLIceUTIe5m1o5nqm9VJav3RmOBwFdELke2V5A=;
        b=A1HtLwO08ABpybjmKNL3VHYJZW4JFmMlZzAKrRLYSe5STQlSbnLjxKqrwXMxmw7NAN
         dIQUz0xL9MVPl06tiq1I2fbod93TY86CbHY0IGUy3WbnyHW/L0YFC+u2SFG7aj9YgQAF
         rbKy5XeRKziBsHpMVpFQQpHgvd+L4YTJMMn2XYoAHJM9I3T7xTrox04SXCE4m5dJc77U
         jRrH2eoqiYRWMTxvyGeX7gqZyXImRbrvUe922DHmhsbghHyf+nWcAVc8Ff1hzbyMs5o0
         BhEGwXpsceL7u2Rd9l0xbdpridMw/egTZXmLkkVYtQcBhxLKHIB7gv5tDy3BWczT1MVA
         EOdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOHjSIjV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dca4376sor20699295ad.14.2024.11.22.14.52.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOHjSIjV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315928; x=1732920728; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LchKyCC8/lK94Twv/nBZVCfFgzSxUclYfBwVM5ni+0=;
        b=kOHjSIjVUaVTu04Gn4PTMy55xTxWO/NIyXVY7UvsIKIriJLngeoj/NOm7BCqriYU1V
         1juMftLPdF0DeRuG3LNbvZIV94s1ZwYNxPxyX9k6Fd3u26sQ9yA6x186jWkN/4JtTV6p
         jvZpate5kyzBHkhXRE7r0gm90YSMeib4VHy8QYUfzdXBv0YMwaN3NFRmSnF4NLPHmAKW
         Z2M+fNc1lyACWhoAxcjcJ7Q5LLQEGrkVkC6nwP6e1rJfP7xe2loJgKaN4H4EIsXfjNTu
         6NHBu4e/unWln/JkcxX+iXdBoX/qz4cz40Q6f5yI4iyoJMjSxRYBxSgDCymtJaW5pwZN
         Xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315928; x=1732920728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LchKyCC8/lK94Twv/nBZVCfFgzSxUclYfBwVM5ni+0=;
        b=gHLl0gTE9kI5iejYpMQKc3f/H4Cswdf+UgkeSKpBpcnIKOM31tXETlQfFh8bOLI9dU
         m7oXLvEDToXYr5tq9J2RF+1V8UWhMu/qbmdhm4Y9NoH6FbsmpRL24k3QzPnnfX/eK7Pi
         wLKANB5+7hmURu8cjsT6IfxDOLGY7dQov4RW+8kpqzjgQAFHRVFqTGrzffoxsG+HWqAi
         ugRsgA4iyOx0hzjbwspeh2nB5o9mjSeWswcH0XE9lI8PD3Zg+jv+KrKz4qjKiaBSG9db
         FWZXulP/pqBZxHkcD759kagifxSNl3ZosSMLuY1GdJiFJ2rr6Op4+FMppgUnBgrH5sd1
         rtcA==
X-Forwarded-Encrypted: i=1; AJvYcCXOT7j9QjhbV+fSpjgfmHIVBBXgvwTrn9WFQW/c0VYvxKHxeB4UmhjK3upP2eDg5CpICjE4a0Xm0qOX2Q==@linaro.org
X-Gm-Message-State: AOJu0YxSgSqb2ZHpQbnZUpyi/JnqHl7tdu376vQjx4rid8YwhNWWupkJ
	7kqBp8JZ/oyu6AFGFqFXLSQnog1eksf4qd6cGVP1fhTgkhRQNAsieLEtJhgDBBamaA==
X-Gm-Gg: ASbGncvs97VqD500hHm3ckrgJ5MloIxwXCqwFsnT4+vaISN8/GZh3gcKzUKZRZv8u3Q
	bCDQVckr7E1S0o9jg+0z44dLIy93DXw/P/jHtpNFLtshLixk77udR2LhkVc19t/U76D4/FiNGG3
	NYRGYoQZh8Ow0dWK66DakX93gKd/awXTcvpW2M4B3wjdzKzIm1sIypVke+8VosIRaVp+GFo1kiA
	i6unu++Ww6KvjhaMR1r8pwFrCrCY5MgVxAkaZfJRjzhg8iLjkfkku6xf605ipDLvN6e9Cl9gVki
	yUlwvy1MfdII9w==
X-Google-Smtp-Source: AGHT+IHw8iVN+ZSOv/TEg5Cih/cMGfzTOajDhRYtMu/vMbTv8vmoACzHOunxshdthvNacOue6I0Tog==
X-Received: by 2002:a17:902:f64e:b0:212:4aec:f654 with SMTP id d9443c01a7336-2129f7bccb1mr76303585ad.31.1732315927763;
        Fri, 22 Nov 2024 14:52:07 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:07 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/12] target/arm/tcg/: fix typo in FEAT name
Date: Fri, 22 Nov 2024 14:50:41 -0800
Message-Id: <20241122225049.1617774-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cnzjnNvE9R94

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/cpu32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 20c2737f17b..4e589b747e4 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -71,7 +71,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr5 = t;
 
     t = cpu->isar.id_pfr0;
-    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.39.5
