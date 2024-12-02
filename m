Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802404njk;
        Mon, 2 Dec 2024 05:14:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtjXHagCdNUqeSC6yGH07EEUSI0iGZHtwEdc1A6uaUOMtI2hvrVM4xaKPBGQNCZx7Nv5HkUMnMKjTjoA==@linaro.org
X-Received: by 2002:a5d:64ed:0:b0:382:4aab:eb9b with SMTP id ffacd0b85a97d-385cbda2b3fmr14567643f8f.27.1733145284096;
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145284; cv=none;
        d=google.com; s=arc-20240605;
        b=Y3JassPNHmyjsFOBPZ0IV5F4E01ZpE8ZBeQs/LWqtxe+LiLwFVyBN8rImflMZlilLp
         Lzzqwl8msjdwzDp3tBDoomW7CaPYBeBSQkFkDWH4BlS2zs/Oa2vZiw0jHDHmjHC43LHm
         8lDIg5qGKUOsTV5qy1YFvxFApLy51e5X1NyfNIe5WEE6HYedCGIrVu4lUGB0+qk3/bnF
         NcTKoKTQhEXj44bzF6RdP+LuisIpzLIogzZgYG0CndUgVpN6lXPbbRYSkzPc0WCNxW9N
         zI3loVgerheND0YsQSbJEw6FqooQThCJN8NL5QsX+G1zflUlAaI2jtV61zenQ7c28cxV
         rb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TSWsGbiJd5nUa8W+i0kSSd0cIwA3gG9T6rGPFTmCLJc=;
        fh=vYQzVyklpM5iAxIurcem9H2mGr4uXODBRndEc0YiLzo=;
        b=ZHFXryH0WuMHQv+EXufZymbZrikrSrmLQq0VqrYgNumajNsKseSEd3JKCQNN64NXZ8
         hMuY664U0/N/sT4/dGtT5CPwdAu7KRVvquRB6mTMa5OQ2at1I4HEVhKRl6DkT9yTjjHF
         /yQN/bpAyxCSeFEQF7HntVE0SsvVhSDiNTzwK1t7sWxl888Bw3b8kzgr3IUFZB9GzXsp
         LqB4xAmIVwxk+J3mCA78rx1nz3CV7aTG04Clcw44M7eahXPXqQislgdrEZJKW033G6oD
         HW3kbb6jj+4S7Wnx9OJCfc4afF9tEPtgAdF7LR2jbAdLj2i0fwieF/s5hqsqORHLwM5d
         GezA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAJYv4FT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385eaa5a0cesor973051f8f.4.2024.12.02.05.14.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAJYv4FT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145283; x=1733750083; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSWsGbiJd5nUa8W+i0kSSd0cIwA3gG9T6rGPFTmCLJc=;
        b=pAJYv4FTNYEJ5F/rBnkl7sA6VGIEmJrEgkkkhlpOgKn6UaHiKxWMWPY5vRMfMfvchB
         O23pxwfQe35vNI8r8EDt0/LJbm58kGyvjmrAgiPLZfvWLaJ8v7lPssTANThG3/JZ8Rdq
         iB5kiBL4yHLHhcXZp03WyJT8m/i2ST0+BYOBEkChbYvdGgeI5i5/h5oca8E+n6Bd/SbT
         cOv7UZtq6l+Ur4ZE3yDh8SCeZoKYT7xIU6kfm2nPGHRE5WKiQ04x55nuIpc4/+cxEa3n
         RXyihjho8C46Aa/Rr03LPAVc6P6br/FrA9dfSDKd4OgPn95OVFPT2FfRrp/M5z++UU5C
         1Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145283; x=1733750083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSWsGbiJd5nUa8W+i0kSSd0cIwA3gG9T6rGPFTmCLJc=;
        b=uZixXOe06+lk8QCUOt+hYfFkyrjfN2VNTRb9RUvFLmxtGmgaR/Jr918jaCDCaEDsgO
         ZjPhF2Iqrwvkj6upQ1JIZ6PKtnf4GHHA5q/pGJuSCVi+6teyXwm581S1pjqqUfbZKImr
         vpvqYuxOMpKBQqIMLfQw46gxwqEFxcqhnB16iZKvqBg0Q6fT9un3FPMzYyqfA0mpONgr
         n2Nh/KhErKEoPFPonzbwoRlt6DYzkGF5+KQzI6CGynVTtImXYdylzNKJRHWXQ+7g16pI
         Pmr7rW4+p2AvOLM7xToFYvkMSbSwfnN4Iv/+4DMni907fuiLVpA3FCQuTPL7z7BIvqlr
         EB/A==
X-Forwarded-Encrypted: i=1; AJvYcCWGV/HZ7MNuTSXzASvhAVcz+/00EIAxnZC1GmHuD3kdYFqYE/DMOrIzGRWGy9SW/AM9/tmNl4kGkwh6DA==@linaro.org
X-Gm-Message-State: AOJu0YzcMp890Smn1EkkV2DcC2hm8Bf3GDIkTCeN5/HkW3By15pq6kem
	126KmOSrnW6M/e/OmPF9p91/Q0rFvVsFnS8oZTGVzdRJDBAlTAZKGAbUjd2WRkqzOQ==
X-Gm-Gg: ASbGncv2xzolSSrdsY13CJMhqasWw08KKgEIwV7HstF+8AHRIMr2OXNyJFOudlDy5sn
	yLh/BBFnMo20lRyE6jA0jLqCDza6by0cjanhDe+6Kz+3lzcjPiBdC7craDgAhCe5GE5fA5BK6WO
	NOZ78mFA017bsdrp3KbEYsBWDMACdPhtdulsXBIgW/95oLrnDhOLiTpttJVB/Jm4nOEuFVcrLHl
	MsT3hwFXvL/NAPiBSBblyqmEb5WDy2WKVerunP3pzc9NifSe2uqKl0=
X-Google-Smtp-Source: AGHT+IHzTpNXZ1PtLUb9+17YAW4kTnA3P4qTzfTKsM34d7nTquK7UvQdp/L/vYqNNTGHVlb3JeXnhA==
X-Received: by 2002:a5d:5f92:0:b0:385:e90a:b7de with SMTP id ffacd0b85a97d-385e90abc06mr6148162f8f.5.1733145283390;
        Mon, 02 Dec 2024 05:14:43 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:43 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 37/54] target/i386: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:30 +0000
Message-Id: <20241202131347.498124-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: V8CRv58FRQwZ

Set the default NaN pattern explicitly, and remove the ifdef from
parts64_default_nan().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/tcg/fpu_helper.c   | 4 ++++
 fpu/softfloat-specialize.c.inc | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index c8bc5b7cfb3..e788fcd1b25 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -181,6 +181,10 @@ void cpu_init_fp_statuses(CPUX86State *env)
      */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->sse_status);
     set_float_3nan_prop_rule(float_3nan_prop_abc, &env->sse_status);
+    /* Default NaN: sign bit set, most significant frac bit set */
+    set_float_default_nan_pattern(0b11000000, &env->fp_status);
+    set_float_default_nan_pattern(0b11000000, &env->mmx_status);
+    set_float_default_nan_pattern(0b11000000, &env->sse_status);
 }
 
 static inline uint8_t save_exception_flags(CPUX86State *env)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index d77404f0c47..452fe378cd2 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -139,9 +139,6 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
 #if defined(TARGET_SPARC) || defined(TARGET_M68K)
         /* Sign bit clear, all frac bits set */
         dnan_pattern = 0b01111111;
-#elif defined(TARGET_I386) || defined(TARGET_X86_64)
-        /* Sign bit set, most significant frac bit set */
-        dnan_pattern = 0b11000000;
 #elif defined(TARGET_HPPA)
         /* Sign bit clear, msb-1 frac bit set */
         dnan_pattern = 0b00100000;
-- 
2.34.1
