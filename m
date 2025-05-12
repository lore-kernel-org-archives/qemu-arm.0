Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42905njb;
        Mon, 12 May 2025 11:05:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmz5CP/NzGeI+FZnmx6fAABQqQdhQVvdT0PMFojOCFeVr2THsgNqPX+xt58rtuX7AHgLBA2vwz4a7YiA==@linaro.org
X-Received: by 2002:a17:903:188:b0:22e:627f:ebbe with SMTP id d9443c01a7336-22fc8b6c25emr175857205ad.20.1747073138979;
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073138; cv=none;
        d=google.com; s=arc-20240605;
        b=dWHc58zWn9xjUzJ97AK/DYfkbsOF02Yyl32kIbPcK8VDd9vFTaTCwI//p6HSkVJTCM
         UPVIeoSdFHHSxCiUED95i7okgXC4TxZpV57ieY4EGQYix7wU7EbcbjvTZiP8PsIMa/IL
         aR2Gl1eoQ+zdjgzpKwfjDQ561pwgIqPXbYrhF31W/5cBKZfAfuwJkYikiqjycw3gqtSN
         euxvlwl9WNO4fjYFbsLG4ivEkLjHkGvXoRrSC4/WdPz8uwbbWfTrnOR4TRhrwh3OXfJi
         OfzQ8598phNzpSI61dgp4exAN67c0pmxv2PgZLRoKodKSs3SGe3WsOTIdSwsYQeDba6t
         r+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EMEP48GWxCsRSx7QE2iBFebS5MEkI8l2Uk35GcFvWVQ=;
        fh=nL4Nujxp8xCBmlu6oxX0AHQ2FE7oUlqjsCpBOwLdvio=;
        b=iLv2N+5QUDK1x3grylEzdWyCLtjFBZgztoBtpnngc3GaFDQqgo9DugoGm9oxiKLbD2
         n2Jvr24+DHZnIi8fF8jDtfvCaNwzQZti+/X6OdTs0mXX9/XSCHM+ogv0uASF8kAoduOt
         9V9oxL957uU1talWBaaZDqPLk+3upgTSe/eG5/XCL4ZIUJxu+eISwF3J+ZAmmDwLl2Xi
         EUzdkh2v3UJlRu6AeibOS5oe5mWQHaKATG/Gm0xTWyaGozROYg149llcWn4qAFgiIbA0
         kS7dnt+MNo2GnJUkvfB4vBOuPHz2mvWNKAN4ToM+lpOhJRPyHBpQxL8pOY8w6lAswWBs
         VxSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U5ATcw/B";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6efbda5sor46147945ad.11.2025.05.12.11.05.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U5ATcw/B";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073138; x=1747677938; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMEP48GWxCsRSx7QE2iBFebS5MEkI8l2Uk35GcFvWVQ=;
        b=U5ATcw/Btwo2G7IwQIs5bsNeWwSt6nDhnnFRfJZFnqms0HpmuumHutYz3cq24mc0BX
         rjGutTXMBnHH8csSoEVyQOxHkdvF8GkUFNw2ZVdSnHOnKHdzOKmIYEwG5SMsmKMIxgTS
         6ve1IeZ9c2Bjy6x/GYKCqYWsB9Om1v5yn21op0tmKJbSbkl0FmkyCC3c5zxbGE4dyMHF
         UZUmNGCuc/k9TsoEb0th6eYpN+yTw32i1uGCPbGWW6sQ3eCpr1C2+9dDl0KMjS4suXry
         tmcBSHAzQd2CNccHZWkIFSz4trAB3D0x0SfI8bcsr9t23l49aCXpcKAYmZ4tf9+69+2r
         wZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073138; x=1747677938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMEP48GWxCsRSx7QE2iBFebS5MEkI8l2Uk35GcFvWVQ=;
        b=OfjLafzbtHazfhup0ihD2AtRYzgztsZEa7YB9Q4nqpL06DMKcjtBzg8MWS7CpefzUX
         9yLCOYenUutx+YnXn/rJ4PqHGM6oxD8v1efTr4HHmsQet9Qo9z2mTQrahFfp2HhfgHuJ
         LI0BmvC90D/io6mMQjr+RgX1AWIeJWb01/fTXJ0ai0d7WYseD6KQznbF/0uyy/O+C5+8
         4PU1tF7scpSlNHdF/BWmZAm1FnWA2mhC2ZeAneFcplg8b8KFTLjdPkJDF3YwoInuJPsa
         1wb5KAcfAg62vqJZYpfPN+64cDTOnNgJlfXaTCZmj5LUNizyqjLrmhT+LAan8XMzRDY4
         5Iaw==
X-Forwarded-Encrypted: i=1; AJvYcCW/njaBCq7g4RKVzf9GA/60M8IdHq24TOBHFuK/aseRpXRyORnICjdzFgY22OSsE8kjGiczECXKr7U4ig==@linaro.org
X-Gm-Message-State: AOJu0Yw2ugwNsY/rQrm3nFh4WdOitatB04W4Q6Ox1H4VD0FvPicEat3e
	M2XU/Y0nKBu0Z4UV55v4Nk/ihStOaIa/mZIJjbZA2SmnpI1Zn+0tCsDmn0isNtZqow==
X-Gm-Gg: ASbGncv9L2wXTheDBVszjiFyRDJCkwmXdqveXRlYS/ZQlrYzLRkpZpcbJL+5zQ5h3hD
	eiifwN7IfPQ33WOhjNcc56v//mfs3J3GhUQvdk61amWxq8Z37cfnAmTdyXWQNID6UodNRuZ6++w
	n42jyw12zbEWofEHOce0UaKFNRoBexH6cSI/bIW60MBjYpO1q+6i9hyx7Q83tmKCnqIJE0jp3TA
	LjuGVEV7xnmJolQQsVjWn6OpHPkPCFFVKsDMHAhNh+sqhOBvIZYPjCqLpe+PhNmJZj59qTiZNz2
	W6BQO33ogrHnRAu+aOndkhuipQZAB2cQQBiUyHAstasGtBs2GX2sySIyDELGyg==
X-Google-Smtp-Source: AGHT+IGpj+ByGGA6P9uf6PMDolvOaWHxRb5ursUcXrTwGZkqDGtHApsXva51S/fwpSIQmOg1POT4HQ==
X-Received: by 2002:a17:902:ea0c:b0:220:fe50:5b44 with SMTP id d9443c01a7336-22fc8c8ec4bmr205601205ad.31.1747073138576;
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 30/48] target/arm/ptw: replace TARGET_AARCH64 by CONFIG_ATOMIC64 from arm_casq_ptw
Date: Mon, 12 May 2025 11:04:44 -0700
Message-ID: <20250512180502.2395029-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /817yqm6ZW96

This function needs 64 bit compare exchange, so we hide implementation
for hosts not supporting it (some 32 bit target, which don't run 64 bit
guests anyway).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 68ec3f5e755..44170d831cc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
                              uint64_t new_val, S1Translate *ptw,
                              ARMMMUFaultInfo *fi)
 {
-#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
+#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
     uint64_t cur_val;
     void *host = ptw->out_host;
 
-- 
2.47.2
