Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802243njk;
        Mon, 2 Dec 2024 05:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWfjQGaWSzi9i1ALBDlPHY49o2zNZR0YfH69esmOa1m98Oc27cd1WJYCpEiXfHwW3to0h4XqSsRzlQeg==@linaro.org
X-Received: by 2002:a05:6000:156f:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-385f0c94ea6mr4496160f8f.33.1733145272839;
        Mon, 02 Dec 2024 05:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145272; cv=none;
        d=google.com; s=arc-20240605;
        b=Kz1tTrr4cLXJW9z0O/YbyHzKV3Xf+c48WDI7+FsuabB85xS1/4+6+P86ttII3D2xiG
         kqIlxp7WBuZ2i4yeHVS7fIfLn+8HGks9T04dfHswWT0rI1nWWuaydddDZYqZveeLvZzC
         BbOAfeddm8OUE9gm3p+geg/PJJMou3fNNJnc9Hbp4WkvJow+RA0ubdfbwMGXDHDUFQU4
         i3vROdbOgze9yTd+6gidpiK6dpyUP286H/aRsHBGyGgVqh5D3xclS+0MrBIsBzOtafhL
         GnsH9jmcpocv+Bh/DxXw0bcObalEue1400aBr8ur6TPG47NNzVYW5nzXNRpZrjiZgA9z
         yKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e3mx5QSLs3F08ZGNoyI8psAl3Pzx9Z5IpdlAACesozc=;
        fh=Nh8enBfoLFbY/9YmNx0sqt7CwomBJAwXF0CrtR5khsQ=;
        b=bOPt+nt30LnPaGLx4JILswSSzg24xYDu7IGgdHXZnUanbqC8VJcNIey4PUNQXlWJ7C
         xTeeTJvhpBj9kWk2DFbLDlxGEMJmUBdlSiq7DbzUgAgqcnn2DZXiM9wixKLcFzGCD+mZ
         BEcRDLg5ycbMhyUiN/Z69niRdQ+LWOFKF+UyHwdQCW+HxvFaXIMjlAiqVc2KKqvCpXGl
         Giqeqt8EBA+Y4wzx7dLti8ovzjoJKkhSb/6h9NFm9jXMJ8Sw5ZlJMf8G1XccrnHvDdxW
         5DIA9wKcrIp9bSBk1LrXui7+untixBavrwwHIdlLSU+/y9KW5PnWakebSHu0lvWzI6Hz
         d91w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ucT01ukZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10544dasor35070215e9.4.2024.12.02.05.14.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ucT01ukZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145272; x=1733750072; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3mx5QSLs3F08ZGNoyI8psAl3Pzx9Z5IpdlAACesozc=;
        b=ucT01ukZCAIJhGjGSxCqwCt3gDtDD9Bqfyopy3Fp7dX5gPflvzNGBn9vEXPQ14Ey80
         +HJuLuR3YfSFikumuyWihI6HIrsyOVs8LeVH0NLUzRKiimB7ziMGFKLZHxWCqBFdJFkn
         0ULxHyXQK1gLUlpVs91MQWydgH0811VeUSHfrODgEBeBXnQ8mCkp4a54RFdgiRIzdwT+
         IpDJbwxR5Me+lPSf2GfpHD9iBberR11jDw/O2SWzQmYeLcx61ZSpjF2E1gc6WBANNa8c
         LrXgDWtd00g11Qbf7ntzbSC8mQ7as5WtJP4T4rTXC0Aazj3JUuk5EKgmUb6z3hOxd8ta
         ywfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145272; x=1733750072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3mx5QSLs3F08ZGNoyI8psAl3Pzx9Z5IpdlAACesozc=;
        b=XenR5mzTRZHvFuSExMK1GI/b8o8AUBjiHPaVFXoRap9Xk4Wsk81s3gvr/HRsgQ9XRq
         jkaBsed7/jUWypkxTSI4iLrrClQjMhjp7SLbsRSiQQuwXffAnksB3fV7syEGEEsGH8b3
         AhmUqOJvcdk3l66YprcFvh0G0xRB5SSmIcM+okbRipKwfnrfIVcXmjwXWri8u0Dk/7Sg
         54ReWtMTWYFA3NSDDbRGH9RwhnnuiCkWnGeL8XAVECiCr7tf2OHOo5DhbMEgTiebADP1
         S0e1lSMQvWCc0qWPGQjcxDzYSjJ/CjrDA6VmHcdvBRpZ5Sz1aS4edkO22uXX7yhJqE/n
         oqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCFGhHboiORHveEFjkzDE9Zdd0PGoRekJl8C6ppdthIHU4mMNwrcl7rtXHEu6WRQYk5tjlxziw3uDkhw==@linaro.org
X-Gm-Message-State: AOJu0YzFAY6IInY6rfmnpGB0Sf1kJM5tbj2WWUv8pGjvho8OoT1Zn7gg
	qntV0DjiFiDyQQLaR2KGdze6j6BvPu/f5kBQvnWqcUhlQ+AK22mUO8RpWcY0vWsC6w==
X-Gm-Gg: ASbGncv0YqU0sc/QOV85JZTsf1abgWS7ey26nN1VkpSgade/IdE7ETkW9Dx63xf2ZZ1
	TJJoeL85y3KY4VuHAby06P2z5YyVkcz3jf8H0ail6l0/2lyLSUYzYfKG1Fshgfg7NcfS6J69uvI
	wxmdjYFMrHOt7sP3ul/85/QINBTvYHRSRhebmoNE0x3TX3h+H5ucqnVN2KlIfmOUymo2EwxkhC+
	pdc86+bSz7bS43rxKlp4xxEFBBIt0dSBrYwIzXgO8be+WOojkTbV18=
X-Google-Smtp-Source: AGHT+IHo5qXo80fvKVDN2QJ+mr7r2kre4mQEoU2bb76IiltLkjwknMLbk2u95ylvKm0zOC8wXnfN/g==
X-Received: by 2002:a05:600c:154f:b0:434:a706:c0fd with SMTP id 5b1f17b1804b1-434a9db8386mr204248585e9.2.1733145272313;
        Mon, 02 Dec 2024 05:14:32 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:32 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 25/54] target/hppa: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:18 +0000
Message-Id: <20241202131347.498124-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NyVsfKNUvN84

Set the Float3NaNPropRule explicitly for HPPA, and remove the
ifdef from pickNaNMulAdd().

HPPA is the only target that was using the default branch of the
ifdef ladder (other targets either do not use muladd or set
default_nan_mode), so we can remove the ifdef fallback entirely now
(allowing the "rule not set" case to fall into the default of the
switch statement and assert).

We add a TODO note that the HPPA rule is probably wrong; this is
not a behavioural change for this refactoring.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/fpu_helper.c       | 8 ++++++++
 fpu/softfloat-specialize.c.inc | 4 ----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/hppa/fpu_helper.c b/target/hppa/fpu_helper.c
index 393cae33bf9..69c4ce37835 100644
--- a/target/hppa/fpu_helper.c
+++ b/target/hppa/fpu_helper.c
@@ -55,6 +55,14 @@ void HELPER(loaded_fr0)(CPUHPPAState *env)
      * HPPA does note implement a CPU reset method at all...
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fp_status);
+    /*
+     * TODO: The HPPA architecture reference only documents its NaN
+     * propagation rule for 2-operand operations. Testing on real hardware
+     * might be necessary to confirm whether this order for muladd is correct.
+     * Not preferring the SNaN is almost certainly incorrect as it diverges
+     * from the documented rules for 2-operand operations.
+     */
+    set_float_3nan_prop_rule(float_3nan_prop_abc, &env->fp_status);
     /* For inf * 0 + NaN, return the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 67428dab98a..5fbc953e71e 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -504,10 +504,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         }
     }
 
-    if (rule == float_3nan_prop_none) {
-        rule = float_3nan_prop_abc;
-    }
-
     assert(rule != float_3nan_prop_none);
     if (have_snan && (rule & R_3NAN_SNAN_MASK)) {
         /* We have at least one SNaN input and should prefer it */
-- 
2.34.1
