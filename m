Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413196njb;
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmz7i7KfSFn4hPsIxvhmD+3ByfZkSyN6d6tBiNnDDdur49SPr8g1YX8V3ez0TyD3Jzkznfm1t7FDhD/A==@linaro.org
X-Received: by 2002:a05:6000:4188:b0:37d:47e0:45fb with SMTP id ffacd0b85a97d-385c6eb7d7dmr4358035f8f.21.1732790613591;
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790613; cv=none;
        d=google.com; s=arc-20240605;
        b=FrXFr0w63VAI6N+CR+9qPapH3kTzMsMM8KG94EvvS8KyFp2LAoyUbs7UpRZxrT8v0/
         4PiFxtMuQHeb60ugU5oW4Pic+Ooopz/M8mhS+JhFZ9PIaWaDEuyWYRNiYR9vtjpCiwa5
         cx+csdwFJbeNOIPPpHGUTHOLEGvZsm8l8Xq2pjpqPmu+u4/EwNuedAkkQAE0xliSOqAV
         /vzi67vOg7eSeWcvixB8hRewlAwvqjiJWnlpY+IkdTYfNennEkSqVL5YSPmuOt3FJtrr
         lVtKrHSnYL2RGkChUJWzkoq7JpVazwtkU2k7DLCI40bQUKBJ0rO84D9qKgPiFXCVbjPs
         4kvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xHFYmwmnqcmAvgEMbarhecchly8CdIQ7oYTdDVFhVcI=;
        fh=uvBaJBn+voDeBsKzns8tbSwclT8Jv/soQ0QRl2PvmtQ=;
        b=MH982u53HJdO6q9mbS69knFD9H2BwM5+53EUrxk4ebQySbmJ6fhQYOcX5+VCllSFWN
         Mzz7uukTkebamZjK0bFxUYytVqdg9lojG7SlYPugxA6KSCHhpIDBWkd0av5N9yEBa0Zy
         Mf/OLKuXxIqdxljYCqOleMybOq6odrAyjLyn03BOlym1k8Rw4VdWjHRyiwEyf7GMmSRC
         xDmUFUgvkyCs1wv1iu6u07Zyk+VniBzazGjDCBSrUI0FTTKrW7GwuWoTzJ3vXVfYUKYO
         ObD+6ZafCeiFjFr+cP3WJqlE6LFAWrQZLxEcnHx7i8OtYiPZOuWUvmyqhfRt+9RbCE8a
         F0sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8bhh75E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd73cabsor444315f8f.5.2024.11.28.02.43.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8bhh75E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790613; x=1733395413; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHFYmwmnqcmAvgEMbarhecchly8CdIQ7oYTdDVFhVcI=;
        b=D8bhh75EUOG88tYV9SexY1X9TCdMzz3sPWc77+AhqxENDFL7+CAtkHQO606ykhyEu7
         K2TEsxBmw0Ysj6vAkhC6hHQYm/903BAnj+xO5zaKybEnSEXCM1N+ptXdNyCmvQFNTe3l
         HN4gglJbFEolhfpB0qu+IVV2bjFGVPU+H1g7Db/bF1HiexVFs7Rax73kxFGqLQJaJOjC
         p/TaiyV2F0b6ilb5JvXjHr/gmlVXjbXLiOzHIhFdLhXZwSxCFd4ecnWUCe/v6x3aRBee
         sN8Y8zkzccv7/csBwLcogKRmb0CAc4cK/xJgMlOa6g/nbxufznHtuL1PXw3SNx3Pvm3V
         VFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790613; x=1733395413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHFYmwmnqcmAvgEMbarhecchly8CdIQ7oYTdDVFhVcI=;
        b=OgkMGPvRTVFthz/0zRn8UjbUDCIQuYR/3kSzC4dyru5Fg11gl788l8xbBrvgWbbBBv
         v6yDu2j9aWZ4lLl95eNWYDsVRrlZCwoGd5mPx7JM4sn/Z73k1O0fXRhCNJ5FX8Cn0PSl
         63eKyrqELigEvxcpyNpYnYmsJudXSBKokVY6iP2U4DFtj6GDx+04+eDaOaAArb1mG4qw
         6K6kM5i22du3izttIpnC86lU3tOOHpm8ZykzxZqgMJskNOsj8zO5V9Y9oV4NTXhmdpoP
         x8liUCBWDew2RQ8z4HzOj4WxSfGSRASgdgyeLY2ZPcm72Ccz5pp6QfOMOhJ723hLzDOG
         zSNg==
X-Forwarded-Encrypted: i=1; AJvYcCWhZ1MSETkAzR9hI9PZTVcpEZSd1rqgFkkMD1VFnmW4ibyK5O5iUlJBqwTKZYTTo/APwDLAusapJoYzAg==@linaro.org
X-Gm-Message-State: AOJu0YxjNrVO/9JU35kfdNrlzhwKQLUMmf9Z3sSbUWZkbzueDOUEO+Ph
	J+5GJtzNRUOMRflsAr/BpZTsyPdn4CNJhVVChHX+1vUPcNNHhNllHl/35zapd82urw==
X-Gm-Gg: ASbGnctdVJ3xbkrhO0x0ChqQUp5IB9ZwblGm5jBibimUjNS57i3Av/hSsY6dF//ZKBG
	QA1C91/EPmFUu3MAY1Ij7jZM/0t06+w6dmgzCzYtKzDeqKRY15XKKdLUqH2sFkyhBZk7cTaWTqL
	3UoPQ1AnJSQinAh3NspcE02i63k8nM6KABr2RbTPX44mtEmorrzFRij86VW+NZvWWdDmq9ZKnjX
	eDx+xjOKoMBCaXlbrpMiWvE9sGmLKsLj5djMJ5Tn+p2e79YwY1wYqY=
X-Google-Smtp-Source: AGHT+IHD8Eop3Sl1nLVu2mVi+S7Bbn0D0QOlNKeDuqEmug+IgUvyzvvZweODFgWcNmvnV9fee/YCpg==
X-Received: by 2002:a05:6000:1449:b0:37d:4376:6e1d with SMTP id ffacd0b85a97d-385c6ed97f5mr6117943f8f.41.1732790609207;
        Thu, 28 Nov 2024 02:43:29 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:28 -0800 (PST)
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
Subject: [PATCH for-10.0 18/25] target/ppc: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:03 +0000
Message-Id: <20241128104310.3452934-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: og9N14R5R1rJ

Set the Float3NaNPropRule explicitly for PPC, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/cpu_init.c          | 8 ++++++++
 fpu/softfloat-specialize.c.inc | 6 ------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f18908a643a..eb9d7b13701 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7270,6 +7270,14 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
      */
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->vec_status);
+    /*
+     * NaN propagation for fused multiply-add:
+     * if fRA is a NaN return it; otherwise if fRB is a NaN return it;
+     * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
+     * whereas QEMU labels the operands as (a * b) + c.
+     */
+    set_float_3nan_prop_rule(float_3nan_prop_acb, &env->fp_status);
+    set_float_3nan_prop_rule(float_3nan_prop_acb, &env->vec_status);
     /*
      * For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
      * to return an input NaN if we have one (ie c) rather than generating
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 32edb493776..d89ef62b38a 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -508,12 +508,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_PPC)
-        /*
-         * If fRA is a NaN return it; otherwise if fRB is a NaN return it;
-         * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
-         */
-        rule = float_3nan_prop_acb;
 #elif defined(TARGET_S390X)
         rule = float_3nan_prop_s_abc;
 #elif defined(TARGET_SPARC)
-- 
2.34.1
