Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802505njk;
        Mon, 2 Dec 2024 05:14:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNsUuxsvFQ9zs1ntbKE6+POA2QdrPYArqeeC3wBsObZ6vHSTRWohNlYxSYM4ayy6N6BFwpLD+CHNKlgw==@linaro.org
X-Received: by 2002:a05:600c:1c81:b0:434:9936:c828 with SMTP id 5b1f17b1804b1-434a9dc3db3mr213478195e9.12.1733145289189;
        Mon, 02 Dec 2024 05:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145289; cv=none;
        d=google.com; s=arc-20240605;
        b=F54J9ZqnBwMadLGrEtTQt3xUm5EFVzQQieEsCkdmTUVDz8LQx8J7qRWSqZis81osXP
         94WVJYvYvYm7LkPQVJumPhocydWpESvlZKbWozQx9IgFI2yRkhqU+pwCDfx52QiToJKY
         KvsHaYC31LA2ZH4bzb8avWsqplpEK9XvKATgRdhsXs+BS23uPU9IUceAevJGyw39joHy
         bBjKCtJv8TRPKD2BzY1ikerAIGKNP2UlNiQVbMup2iIFF2+K1ar2PK37W0bI4NGRjVP+
         rhnqEpLRFxv5Xmakdob6pZx/NwInQxkO4uVoWYfq6cGytIEQ3woHXCHntmOrqMXEYvKi
         86nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vygoGC00xfYC/uInMNcn40F6CC96Rh4moS0oHLIBbXA=;
        fh=cfmpjnWtaF3hP8Fj2DzXww1u2XvcKum5ROLQnBsUriM=;
        b=OMy5gZmbujj9i9grErTUIrQyrLxlw3p4eXe0xJjN2NP8+Kqwu7QNmYJYBsnGxGWLIs
         3sjfR5NRsUBXPOwgxdzC54OeixAlWEn6aarMRkeX9iy15rlNUnDnrNgASMPzdhX3zkLZ
         sPmhCyqIM9+wDHCLtIUQmKN6xpY8zFf/vU3BOgea9xaT/jTUAJsG+CdR0kTKseTdfxd6
         nZPROAxqcN9Xd5WZuieI2QIOYiqlJQQvWMIy6NV/wKnbL/k4euKTYgFqtCGhhvyEGVD1
         pJl2jHzhKNXh6Wo9weFNv3QHWcdFwhR/X8crXmKqMivDigYiIKToGO8YYY1VqgeAf21v
         GAVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s3j/EBb8";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b0fc8f17sor32376865e9.0.2024.12.02.05.14.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s3j/EBb8";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145289; x=1733750089; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vygoGC00xfYC/uInMNcn40F6CC96Rh4moS0oHLIBbXA=;
        b=s3j/EBb8ivqvN4vIzGAzlpesze5dvw9XYSyHMlOX6CPv1mqxhlETbpy1FKdegz4vwJ
         AgY8vmi2QkmDE9BVTGZv9GZXjKdFWQkc+QbaxfDaEY/1VNltYqiDWvai4Ho2wL+VZl2D
         dIPwXMsrZ983q3gdpK6fvJFP0VYxpHbknhwNPFnEp5aDiGbkYj6vcompx+u740guZE/7
         ToKJ0qaY51V+yC7w+HjpZXxzgCoNRsRazyMTty9UsKXv3r+N0oAu0w27mIBUV+mCFr6V
         wEfvTWiuq+d7tWqKdq9xad34SWwcp1yn4sIIHH3MAybpUGwFcOsBeefI8ERda+1zaMH/
         pcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145289; x=1733750089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vygoGC00xfYC/uInMNcn40F6CC96Rh4moS0oHLIBbXA=;
        b=JekDAOK0Hn7diCib2NShdZWNupUXvUdHPTQ6K5+QqyE2zrTn0RHjl6HNahCzKKyGW2
         0Ij1YZDjMSqlRdKUYRFrrpx6SXHGJMJZgHYnM4qPZaVczJHs2IorzY3JQRh3qDQnxVJE
         APlbjljgiKSD/luxDCpAFnmNg47rNTcQPAgG2jzFLIhgGEIKb1U0jR8ea8JgVaUne19D
         zsSFkYSSJ+N9Ti8uwlJ3cAJyO8HsQ7JkPWqcNrKwmS/BHmhh1sOeiST5BnDqGPvP3dK1
         DFPF1egItVdp3rUSjtzJA9uDX0KXYFoYAiYdPfO7qgiNGc1CshMQ0sL12j7eI6VEJUEo
         /v0w==
X-Forwarded-Encrypted: i=1; AJvYcCVbH+ohwjp3ixsSTniqul5/0jWxP5Ci0UGSQ2LXzzaWOFCRWFRRuEBtIDbRv9tImWcQcPjHYuwSoiV98g==@linaro.org
X-Gm-Message-State: AOJu0Yyuow+9PsCuehYv7o8IZjKJwkcV+MTi35CNmkOUCsBn3ThQLFQy
	qGpBIdKqpDdiBIFQsKMFYoGpVs9tSRUJmnSsmq1vGMFLnwB89BlzgF8RRvxDOYmCtw==
X-Gm-Gg: ASbGncslrnKlQhv5+fdkN8UMN8ag/WTsbG8UPqenvpk1H1ztwzJXLCugNFTm3wubSQ0
	KXO8nGNbkkr0YMWm8vZvlXf2zFXZG1S/nvwSxWtTtokaRN3rn1pn7OnRi4234WaS7q8CXMI7nCS
	IHIAKbvRnPcGDY77hT3s1ce7DLM0REEpec4f0GWMNLnxaoYrJbc1va+yinq8g3U5iHx+j6sznAx
	6QKw/V8wsawCFmOJhRmJCOkSfGHAQQmFjPz17V+1QNJv/3SkbUUFqs=
X-Google-Smtp-Source: AGHT+IHdUF2LtH6AI9ENX2DDk4Q1y9wiIXG/PfUs/1Qp2CqVtbJMKv9t9Hc11c+RWxXGdhxqR/Yb+w==
X-Received: by 2002:a05:600c:4686:b0:434:a962:2a8c with SMTP id 5b1f17b1804b1-434a9df6af9mr189221625e9.22.1733145288636;
        Mon, 02 Dec 2024 05:14:48 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 43/54] target/mips: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:36 +0000
Message-Id: <20241202131347.498124-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: p5eOKzHtIjYT

Set the default NaN pattern explicitly for MIPS. Note that this
is our only target which currently changes the default NaN
at runtime (which it was previously doing indirectly when it
changed the snan_bit_is_one setting).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/mips/fpu_helper.h | 7 +++++++
 target/mips/msa.c        | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index 8ca0ca7ea39..6ad1e466cfd 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -47,6 +47,13 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
     set_float_infzeronan_rule(izn_rule, &env->active_fpu.fp_status);
     nan3_rule = nan2008 ? float_3nan_prop_s_cab : float_3nan_prop_s_abc;
     set_float_3nan_prop_rule(nan3_rule, &env->active_fpu.fp_status);
+    /*
+     * With nan2008, the default NaN value has the sign bit clear and the
+     * frac msb set; with the older mode, the sign bit is clear, and all
+     * frac bits except the msb are set.
+     */
+    set_float_default_nan_pattern(nan2008 ? 0b01000000 : 0b00111111,
+                                  &env->active_fpu.fp_status);
 
 }
 
diff --git a/target/mips/msa.c b/target/mips/msa.c
index 93a9a87d76d..fc77bfc7b9a 100644
--- a/target/mips/msa.c
+++ b/target/mips/msa.c
@@ -81,4 +81,7 @@ void msa_reset(CPUMIPSState *env)
     /* Inf * 0 + NaN returns the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never,
                               &env->active_tc.msa_fp_status);
+    /* Default NaN: sign bit clear, frac msb set */
+    set_float_default_nan_pattern(0b01000000,
+                                  &env->active_tc.msa_fp_status);
 }
-- 
2.34.1
