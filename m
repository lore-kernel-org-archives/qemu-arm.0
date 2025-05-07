Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94436njb;
        Wed, 7 May 2025 16:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2IYa1C8FBLHfyOIR0quOJj5fG2Xrieak6+lxuvT+ym2JuAqtIgnuQjWsLkT0/tPsluYyH/QQav3jWzg==@linaro.org
X-Received: by 2002:a17:90b:1d82:b0:306:b6f7:58ba with SMTP id 98e67ed59e1d1-30aac186069mr7128324a91.6.1746661390478;
        Wed, 07 May 2025 16:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661390; cv=none;
        d=google.com; s=arc-20240605;
        b=S9E7wfdVI18lFzePk3UHw6bh/1VagJVlSEEv1GkKKbZzN7yOR6t81l8nVulqWON1RV
         inSmWL4t9c4HqVzk2RhFcBVrp/FvLWv2J4I9ziff6Kdb7KTzzvDAs9jzVv7E2RhE8mXZ
         Wj/PNk8DP+u846mw4WuSZ4ekWZhbqXQPEle0sqPbeKwPVV9WxqOCbpYB+pfjj900o35q
         rcg6Q34LW9qbj9qX2+Kmj8ryILm7VSP5lfns4QVglHohNASZ5OZeQFJ+4jX+MB2Kq3jZ
         1eETLFER+gmIORv4hSOK6KX5D3SFWR3LEp13ni+AnELKE7YxEfGMZCnNewkIdj1L7rOT
         Wr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EMEP48GWxCsRSx7QE2iBFebS5MEkI8l2Uk35GcFvWVQ=;
        fh=lnI1gb6jxwvhmKNF4qp94zXz87aQ0aJ0FgwPwvHkyUM=;
        b=b0DVZqJLWSaTt8X/1eExjEKFC0u6IrnYG/eI6yqDp+oDQ/kWrUpFQJd+UIB39qTQnx
         k1+ygxKrJ2iidyR7IjdXAOlFHR91VHJpruLLySYd34aoYddgdoXt6RSdE37ENLVgjkP1
         Sk6bcZ+F6taWah5LLG3dFaJfr0Tra8+KXrv2N3CwD5oBt+Mri0ELHcYMXN85KZDKig6G
         oEdCkBhHkn5dQyRgKQq3P9loo5jQz/qOJtCHc65JFILJOIqDXa+aXvc0GTMoHkaqZGfb
         sAyZAxhdSV9JcqJgQcAQ7/9YTr/hSjDvT+AvdoBnshAmtcgsWARxlrrF1gDwTirHe1+C
         Ms2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1uLt4jq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a4763a137sor9074530a91.8.2025.05.07.16.43.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1uLt4jq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661390; x=1747266190; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMEP48GWxCsRSx7QE2iBFebS5MEkI8l2Uk35GcFvWVQ=;
        b=F1uLt4jqtlA7xPQmqdFS789F/jnovsKaD6x6Gwr+XR4QMTmQYPYY7cd2Z97iqK119a
         DYmKumO/fn0xzEy8yMTfOvsvgpuZram0BE79GwZUhhvczjlQvEVew4pbpQX791HK/RA4
         2ZEjkyAXJ4bBSOA6dL3GWcnlJgwi72Ba9ukJanRBaBcS+CMTLD08/XkjjJQVQtWo8rxj
         ziR8uFzIgxV6xZI4iqnZFfksC2j0PbTxfT0H+XZzsCBEgNsFLRkF/TcebTG/AZlYbK8c
         I711y5lCH9cuCeSw+ZMfj1k7vRLbbDn5Ao3wGcvW8H6L4NkssxV7nlc00VsCFehY2wVV
         Tvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661390; x=1747266190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMEP48GWxCsRSx7QE2iBFebS5MEkI8l2Uk35GcFvWVQ=;
        b=Eb9Eulvunztnagiak5dRe6zOngQtsn7HMZlbFeFr/LrNdZIINS3UrnbHyIBKgbD/M1
         6E9nXn5ul9APXSFs5BIMASxf0bcypuwR1ognRqkphF30hxXX71AhAdDjXH/6hIRjbPvl
         HsHp9hwfhXu0wcJiO5TkDN542E+xaqHjOEcVF2X0tT3KW4FOrTdF3wpgBEMsvZmRDa9S
         RBS64csjK/DRrGpY3YDaFgURYNiuK6prrCR4Rzj0mWImVcgR0hALFGyFP52d8e3oXkhd
         xnoz92Hz06QhXrFvcxTU5beEhsplZobcdD91AAG/I8F8UpYhwSFK64n7IQYEheYZ9a+v
         RwiA==
X-Forwarded-Encrypted: i=1; AJvYcCXN3qAAw1j7QSh+BP79liI+K+Q9VRrB2un40a9vBy3x+P34keg+U7YD+UoaEGcbPEFAoCeO8w8dGjkl4g==@linaro.org
X-Gm-Message-State: AOJu0YxG4AceZHvR3+uwf/h0skSzclp3sRpDQAs1jQV5uSrvE9mjF1wR
	MzOqDPnHoKXmgBYa+zThDvlKh9YxAfzrbOi/LxORYontwt7+VfMoYvJP9xRZgbYtng==
X-Gm-Gg: ASbGncvZOX8vtkB+Q2VSJ1umHF+WvEkCQnlPzGjFQJKopOOj5vntpQ85GVKtRFMTv9y
	guS41BcoBal+xLh0Kar9A+Aab/ut/b08Ml8sCQA63Bkr4cFlhRIYn9Vcn0qMItg+m7OfkvZSNX0
	w3ZhBZEayZlaZu7tJgSgGcZFlMwY8V0afTbetxHI2ASeLZBAXe589hGO5d5XQe7IpX5dWg1B1U5
	e1Kqcntxmh4dDk096Xq/jbXVCQS+QX3dSR88GTn8XtAUXYWByl6usyHQe6t/D4p3H1/S2fT3QuC
	poRDNiNts1y322eYN7gAyu9QRCJ7XP7MWN9yq1Ts
X-Google-Smtp-Source: AGHT+IEcU9dnskRHp617G3UulVikylQpHRfLIGjQ/yGDH7e1z5HXtg/D6CcYwWudm0EWP3DH+uoZgA==
X-Received: by 2002:a17:90b:4c88:b0:2fa:15ab:4de7 with SMTP id 98e67ed59e1d1-30aac19cf0dmr9668869a91.12.1746661390062;
        Wed, 07 May 2025 16:43:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 31/49] target/arm/ptw: replace TARGET_AARCH64 by CONFIG_ATOMIC64 from arm_casq_ptw
Date: Wed,  7 May 2025 16:42:22 -0700
Message-ID: <20250507234241.957746-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nMjYE+I4XyHt

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
