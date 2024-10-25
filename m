Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086225njx;
        Fri, 25 Oct 2024 07:13:14 -0700 (PDT)
X-Received: by 2002:ac2:4e07:0:b0:536:73b5:d971 with SMTP id 2adb3069b0e04-53b23e85224mr3174138e87.38.1729865594200;
        Fri, 25 Oct 2024 07:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865594; cv=none;
        d=google.com; s=arc-20240605;
        b=MBPbK7yryR9h3yHhAu4qoWPDItuS762TD1wzzB9tbwSO9nYcl5Rqt0rDKSNA/a2WaQ
         JB1ZSy7Ec3MoLnf3xswc60QHsm4R7BPiPgxNkGu2LnaM702smH7HGZgKhTfZD6q+SrEI
         o7/cRhN7irAJv3ncony1JCu6M9riRj7EablZXgTAl9h7iPaLXTjXsROhov7lUAL12TEc
         olxLwMv7AqZfPAW893HO1xVNG21LF9J/bmm1Dn1qDFMf/g7YMAbg8KLRaQbMH3lCVi3H
         xvpSK0Qzx8/tAJduBUD7r/ic49A13UsbFG3a3oCroDIgc9Y3PjziW39I6Tat9jKBP/xe
         MoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D17Ee6pVmUO+XC5zV2qFLSsZ3L5n+f/7oR7L3Btz1qY=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=JBJ1/HZBCXDxL1/rdMtZtZiiB8lrE+13C7kVy/5h3uXhYIrwtSn7YxiboQTYABfvKo
         seXye97MzumzQp5MgOVCPIiaY6p+jQHyYwkxXT0eN/Tl8qgxSTHa4vv2rXDVQkTobvnx
         vu/6MXh6AzErKoP8pGMu2MvboEwwub+wHJaOZUQYnsJyWpM0c8gbn909OvUdKLnZVUUL
         3jupp0yMgoNWF244JPXl4xK+IfT3xwwoAVUfHh+75Bd6luW5ivrQq0VPCgiUczVUHhN2
         ncgFLPFapC7j0urfkREsZAatucqanjI1oj0p5p+DkgGJ4X4mwRkCHrpBRg9NjbYf2ozv
         jfgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6A4nslK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319396f914sor4540755e9.10.2024.10.25.07.13.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6A4nslK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865594; x=1730470394; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D17Ee6pVmUO+XC5zV2qFLSsZ3L5n+f/7oR7L3Btz1qY=;
        b=w6A4nslKUFArVFZM1NPVhYuFL2qx+WMDVL8O5w3Oj/1raaZwlLQHc78E7e1uQs13xA
         nQwjAuJXLi6EwPEjAqbvWzXFHSltwre5X3cYmhYKuI6UKIoiiGQAcItxbYtIfo9NvLuW
         /WUEFPDd+PfLpZB2yaew3dyHxhNJS5J7TwInUsLtYzetFk9LxXki08OZdqWcuX0+I/vi
         0BhHwHhZbcT4F9P+1urE+xxxUn7i1ZYTpbmSdZ00TyBtSJYKBBpykq5sFfEdbUy6mxqX
         GF2LzXUQbO7OfVq/2wfXtYN87jwuutmQhHXl0ANkE6mE8NCNoWX868+pZguqdRfWnp8L
         4XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865594; x=1730470394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D17Ee6pVmUO+XC5zV2qFLSsZ3L5n+f/7oR7L3Btz1qY=;
        b=fp2qoKziqTj5ca2b3bjv1aC8aYGD7lOTeP0IKzTE8ETi4OedGmsbO7/2LSo3sc3Lyd
         OuAXtV30+RExacdcjegl1I0mc7v2rSMrvxunJoiTkeRKGvbgYXPLIEecSJpRUqUZedKZ
         5DU3250wyPn+hTzMrhxzwB4Y8xM9QAcVAhqxckZGvtDqMH+qaX6SJyKbLofg/Tweq4n9
         WQZEy4V3SX2NFAEPlBbbktNFGiWchWFdvyHXTqflpj/oL9qQ1dDtzZl0XKPpZOZmGYaS
         Pmj1mENMM6VmUtZ1EjitkP2iEQWNMhzxOmAGm/sZkkRloJ3QvQ5O5Wio4x/hsMXqwXFN
         srgg==
X-Gm-Message-State: AOJu0YzlmP8SmCfotY6BzulbXNpsdKZakWHXR+bTYgl+tjtR/XClnhU+
	kq50yxP1lxEdN7/TUqq0rrVGfNdpEKTzh4nj82ym+W52gWiW8gxPfVckfCmWUJDkKA==
X-Google-Smtp-Source: AGHT+IE6SunM3yD3t4t30wBjNrnIVLm0v13hiEc1NlGpoPN0dqsnmdSTJwzAz0kK7OG5Le9C/0ne6w==
X-Received: by 2002:a05:600c:1d98:b0:430:5356:ac92 with SMTP id 5b1f17b1804b1-4318c6e8ad6mr49585085e9.7.1729865593604;
        Fri, 25 Oct 2024 07:13:13 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 20/21] target/rx: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:53 +0100
Message-Id: <20241025141254.2141506-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jzQ6W9x3GGIG

Set the NaN propagation rule explicitly for the float_status word
used in the rx target.

This not the architecturally correct behaviour, but since this is a
no-behaviour-change patch, we leave a TODO note to that effect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/rx/cpu.c                | 7 +++++++
 fpu/softfloat-specialize.c.inc | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 36d2a6f1890..65a74ce720f 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -93,6 +93,13 @@ static void rx_cpu_reset_hold(Object *obj, ResetType type)
     env->fpsw = 0;
     set_flush_to_zero(1, &env->fp_status);
     set_flush_inputs_to_zero(1, &env->fp_status);
+    /*
+     * TODO: this is not the correct NaN propagation rule for this
+     * architecture. The "RX Family User's Manual: Software" table 1.6
+     * defines the propagation rules as "prefer SNaN over QNaN;
+     * then prefer dest over source", which is float_2nan_prop_s_ab.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
 }
 
 static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index ee5c73cad46..254bbd67168 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -407,7 +407,8 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
     || defined(TARGET_SPARC) || defined(TARGET_XTENSA) \
     || defined(TARGET_I386) || defined(TARGET_ALPHA) \
-    || defined(TARGET_MICROBLAZE) || defined(TARGET_OPENRISC)
+    || defined(TARGET_MICROBLAZE) || defined(TARGET_OPENRISC) \
+    || defined(TARGET_RX)
         g_assert_not_reached();
 #else
         rule = float_2nan_prop_x87;
-- 
2.34.1
