Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004352njm;
        Sun, 30 Jun 2024 12:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzUbn5wQ7j38ryB05vGzYnAEk3GUePSzACz6eSyyT2qM47EJirmiG1Ibk4y90CehkElun0cUubHE5Zb4f250ps7WOCITGV
X-Received: by 2002:a05:6808:2011:b0:3d5:6332:7077 with SMTP id 5614622812f47-3d6b3c86b03mr5937099b6e.33.1719774066369;
        Sun, 30 Jun 2024 12:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774066; cv=none;
        d=google.com; s=arc-20160816;
        b=U7u+86I7aSXPwO4DbUG5HuFMY0TGfLiYQ41KBzbmLuexi2e3YytTqXBlKb+7HobN/x
         pQCZ5ugOVzBDP4PwqfSc+EhBtKOdupp3h6JX3tPIybFkFnTKT1WCnxOGJj9XhSvHZ4lK
         IY1wi3fdMqvM3+WCeDjYcIaXF3ELzoIjIlkB6W1+oWBGqhudEujcH2/rlidN2jOmfdTi
         Ce3r64WsxvswXM44v/yzwvhHc3D4kLQ2g4yKVkMVKs9WT7+z1VOhOQYtDDFB5p+fuDU6
         /roKnOsD5nPY5nACsHeYhZPaAs3IucQby1Zr5kuVRp16DUULk+rk9uVoA1S5O5/NuwmF
         0C2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6nLIZwPhlbR4+HoVwsyjSvgsNERsQEppTTQuHndlMMQ=;
        fh=6/KV7dMbZLryHnVS8pgVrrUOcnB6VlwczpaBMFqLvSA=;
        b=abNg1deZxyQIy2yaSGBeNDZEcNaI9Fj/y/q8ODFj+dq+2vXv80tjY+BheD5DWN+ymS
         p2dnpAxCBiNVkDwRpR5Hy3o5w8ihmCHcdjOPc2nfiUG/4OaVDG6FBUyDj9eVfa6uQxjp
         Dw2od/ed4w+rm02TlQ36+y7Twml6LD40szWKLZDpdI7NB1ehyVQCwtgdBrREooyFoI1J
         YR3DWdcNZjUKRyu3mJv0YqU/scCRP8FTTwMNG7mKE0qLLgkRFk4m4YuUCjITySQdjqsN
         w5GaltHKbr3Tc8nQWCbdd6bAFPozFp3366lLeoj9agh2DgQ/NZwWfnHD+dfxC17nymPj
         +Ndw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R1TMjbyE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d62fa2a00fsor3912169b6e.13.2024.06.30.12.01.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R1TMjbyE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774066; x=1720378866; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nLIZwPhlbR4+HoVwsyjSvgsNERsQEppTTQuHndlMMQ=;
        b=R1TMjbyEYS71s9oNFLSagzpnGNSkCIJ+ZM9WGRoiBr7lNAVh1mOuRlnG6mfsOES1KX
         wA6uMmZmaRxBoxO8yzThK1tcaJFeSh44+ELuGkUqvuXCjOoIF5zYR0BgjSPbWbD2vfOl
         O1Fn/30D9ZNBpBIJ4CBhZjeH4WApIbgJVFMoYf7S9DGyYLGoO+ZNdXpnrAYN47HRPTkM
         NyfvAJrWQQ67Ryu9obEhqb8c4ijalO4hILuR4BuyOT8hs7tW46Yc571ft2lRO5sJhLlH
         0y8+NlB9sLrNoOM4svEBez5cZVDAykGmc6NnX7eFE5viBSAXq2+Gj6NQXNShzoj9wdyj
         Zbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774066; x=1720378866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nLIZwPhlbR4+HoVwsyjSvgsNERsQEppTTQuHndlMMQ=;
        b=fju3SFFsMj2e9zQKkblJxTj/UQjGWK3sHv0XjyDX5MyueuAzHx9tg/np3gOiz3Kgmg
         /kscJzPBiKmDhLd/VzXCRByHV0XBzbmCk0kC0kxS7GPkXg4QaZnk8l8Q6aYBP27QFKgi
         a0weVRIYHVKYw8uXnYFXe7CWAd9vXhEZwk5UnUfBZ793VXrC4O9KwdbW4MN3D4Vl5nDB
         SdLr/9/H1NN/2FlbwUSlJvVr2HjvV6G+7HYFkD0eBkGCfnwOhHA4n85hXRghx7z7qTD8
         vrYQlaczpSL/NHzX7jLOU3M1pPZDM2wga0/5Z5GMPsRv0RAK4VdLIKACMnk4DtJ990s+
         dlIw==
X-Forwarded-Encrypted: i=1; AJvYcCUhoG+E/+GrZWqy0V9oGFQSY+rE5ujEczoznOEnU+6x07uE1iY7ILVwSQzz5M1N+DhjcWlsFbbz1qAzIN1R+K7Wov37qMiW
X-Gm-Message-State: AOJu0YylHX3P13f2GVZIYgn4ICsnMpJG3hHpf+kmyo0sI4wCOMtMJlA/
	Ydg33XTDCy2mmzs5x4fNUJXCWmllC989hyG3BEvc2gLgo8Q25DW5h81i87Rrop2fNhkW4y4RRnD
	drcs=
X-Google-Smtp-Source: AGHT+IEqWP513l7m3XZokZvK4CqxnJ96fkduIxaMkV40JqrLQBySIAhHrU1eNkTdPS+LPu2XPqX4CQ==
X-Received: by 2002:a05:6358:6f93:b0:19f:509e:ae38 with SMTP id e5c5f4694b2df-1a6acccd1a7mr476425455d.5.1719774065617;
        Sun, 30 Jun 2024 12:01:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:01:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 14/14] linux-user/main: Suppress out-of-range comparison warning for clang
Date: Sun, 30 Jun 2024 12:00:50 -0700
Message-Id: <20240630190050.160642-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kPjV+dXd0nT/

For arm32 host and arm64 guest we get

.../main.c:851:32: error: result of comparison of constant 70368744177664 with expression of type 'unsigned long' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (TASK_UNMAPPED_BASE < reserved_va) {
            ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~

We already disable -Wtype-limits here, for this exact comparison, but
that is not enough for clang.  Disable -Wtautological-compare as well,
which is a superset.  GCC ignores the unknown warning flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 94c99a1366..7d3cf45fa9 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -843,6 +843,7 @@ int main(int argc, char **argv, char **envp)
      */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wtype-limits"
+#pragma GCC diagnostic ignored "-Wtautological-compare"
 
     /*
      * Select an initial value for task_unmapped_base that is in range.
-- 
2.34.1
