Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801989njk;
        Mon, 2 Dec 2024 05:14:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDKlWW6+WIuYEnyHSNsSw12Yk6DpGGFZDM5gwaOrq/Kto5h3FoxdaPLYuPJWLh+c5wzpn0sU63xgHLGQ==@linaro.org
X-Received: by 2002:a05:600c:1e03:b0:434:a805:1939 with SMTP id 5b1f17b1804b1-434a9e0a29amr178458535e9.33.1733145259423;
        Mon, 02 Dec 2024 05:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145259; cv=none;
        d=google.com; s=arc-20240605;
        b=YFLI0B1Yfh4qPcUdHsi0Xb5HuCcAbMtR6dqSYO3s8wUNx5RvXPrNlgNFIBR2AWIYQJ
         34GtZJ8DgGVnDjFrRFqKGAbU8+rOjcuFuUiQIWPMO9ir8YhUCxn0XArx2kPw4CzG/6dO
         PxMv48wMkTbY8Jt+qmNV5i5lEsRsp64su5lQlfnSCY8aXFwdREljwODG2LmRiM2lKwqM
         DK6VPwvwUwTT4K88D3jJOMf2PEgKnZ0PJJ+Tm1hYSprr+KwuojQa6OgK/0OeDRf2exB1
         M6Q5kYtQ/gUouTi46OtXhZrYl8SccMK9p4Uql2AHW6M49Px69XMwnQgSBU5uJ9XsB6dv
         STjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qV7tBbcBhiVlOigWvkNnjFqiUrRYKt540d7v7M5Z7xA=;
        fh=5bCvZ2S/+tiIcZ/bUUxh7H2kQ4Ix9y0VrJAC3xoXOB0=;
        b=VBQFLU3c2VxQslNp55j55fxsCNWoJaZx2t9cQpXn1nGHd5iTJo2xNrZqzxPZIVlkol
         orTY31bYOkpTTgesYmQlH8QoLokkyon39lFZymnnC/Z7yTLNeAuCSf6EnRqwRY7QO1B6
         hBjVMvjtYxlL8LuO9KNScTPjLKh01rAKKns8S2iiMfFiSbHK/OgUv8MtzWNWPqKUt58o
         F+sldwYzm06gmU2FT3FtVyWWu9sg8qqWIcXOnCDrK3MgfFstvO5wAwIwMan2EvQVlhKP
         1t75GshO9PsmojJW+pncwxsdC3eLHPYqUsfj6ORBr0jwzugGheP422n+ObW6RpffKazM
         ubIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IrpyXwx/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a083dsor33134305e9.12.2024.12.02.05.14.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IrpyXwx/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145259; x=1733750059; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV7tBbcBhiVlOigWvkNnjFqiUrRYKt540d7v7M5Z7xA=;
        b=IrpyXwx/AUaxNKF/S6zilhbxCfL3GYXV42ntNpo1nuhlHTrpj+28WtBmPKn9H9DcpD
         jcpalzMbS4dl2HoC6uiHJEOv/7unnJgdcWHHZGum+hTXIElKgaGHanzfGPkBAZVinIoJ
         aa0p5vsZLK5Fg+xpJpODjLKoK0VIVFAL/0ZLVreB7HJ4HAPMHxk/8ue7Ze0C7t9lndG4
         DNc5zRd2opPz0Zo8TxUFzsTCpgK2nXAzk3E4UTuageaX6CwdKVmo5BQ4+NbkpjzARLL+
         9teQmnFqJDlZNjSGl0YDNd+yNvgf/Tl5tYSdUG0p84jgyDu8qdOhFYi7/TqXewh12EtH
         Lkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145259; x=1733750059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV7tBbcBhiVlOigWvkNnjFqiUrRYKt540d7v7M5Z7xA=;
        b=BtJHzXk2nW63zdNsMk4P/MPNioig9AybQkwF/jzTzWVffSpY5SgqZFtDUxc7F1Ucb7
         sTuScugd44MbvKeWXejeSEYBDlJBaMTeWhRdJ1nkbgWcm4eRcIN6l6PJOJIhfPzf41rl
         IUP8zCpgK75flvOHBc8vZuRsqa+kOtBRr3bpv096m0bqDWuWvWDCCvnvzAsfMpk3/JRA
         jLsqFGznDMQvKQSpTWND/KGM/t0SvJirRUpg/XS28cZ1Tu3ablhnX5hw3Ks9TCxLefxN
         pSftvwCev1TXIdaksApZXPxd8bEHtsRz1gQD2J5ODz5Od2PV1QM1ryMiEjAWSO3rsCew
         whRw==
X-Forwarded-Encrypted: i=1; AJvYcCVxYfMX0HWGcik6HhP2htCOCVA5afZ3/34Ij5LMUkKalBtZ09VE95FwGIAnKI1b7i9WTkolwQbo/i3Skw==@linaro.org
X-Gm-Message-State: AOJu0YwR7j1EVmyspnF1WibImbniS3ZUOkaaq2MHtTQl2FHQlAf3VvrY
	VV+1YKK/Hl8iFPJJ+2UGLyYRW7QW7hWNLHdFpN4YYfx1OhEZzqqp6k2tkNeabv/Whg==
X-Gm-Gg: ASbGnctFPfo64njQeQFNpiPElpfAG9euu3fn2mhrPskoWWPIPVqmmV0BkWfftXMrPx/
	1Q6S1VOxUIJpvc6noMOKoVXbxOI/J/WsM0r9QCQ7Fjb7fGzexNWa9uCoL2+8Q9R356Hn6D68Arv
	k0xrcRyDL0/6XGFDNxENltMmX4o7yXb8RH8l9kuKrfMroY7pl1D/lSncFprjLUKWCudLyk0dwzg
	nFbL3y4jq/iTSuF34ckDvvQ3tz3gS3GtYhyAR0jJXot2x2QhhzvUA8=
X-Google-Smtp-Source: AGHT+IFJClLlHD9zixmJJD7I8t9nu49gsXOm/M1tFSQat4cWaHqcdDYrHisGj/PdsQjH2SFUjBshhw==
X-Received: by 2002:a05:600c:198c:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-434a9dfee3cmr216628145e9.31.1733145258795;
        Mon, 02 Dec 2024 05:14:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:18 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 18/54] target/loongarch: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:11 +0000
Message-Id: <20241202131347.498124-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Gslzzudbpcmt

Set the Float3NaNPropRule explicitly for loongarch, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/tcg/fpu_helper.c | 1 +
 fpu/softfloat-specialize.c.inc    | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index 6a2c4b5b1db..37a48599366 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -37,6 +37,7 @@ void restore_fp_status(CPULoongArchState *env)
      * case sets InvalidOp and returns the input value 'c'
      */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, &env->fp_status);
 }
 
 int ieee_ex_to_loongarch(int xcpt)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 3a2d0444475..d610f460026 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -511,8 +511,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_LOONGARCH64)
-        rule = float_3nan_prop_s_cab;
 #elif defined(TARGET_PPC)
         /*
          * If fRA is a NaN return it; otherwise if fRB is a NaN return it;
-- 
2.34.1
