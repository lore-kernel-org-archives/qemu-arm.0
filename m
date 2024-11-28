Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413231njb;
        Thu, 28 Nov 2024 02:43:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZ/3Cr8nxfYDhip2FpRyx+JnroXBg7wU7YtKPj2+sMGOHaWtIjBuO1jNslcE1OZTfRc6dHOfN9zX/PDw==@linaro.org
X-Received: by 2002:a5d:5f96:0:b0:382:4f4e:1cd4 with SMTP id ffacd0b85a97d-385c6edd2damr4388992f8f.42.1732790617395;
        Thu, 28 Nov 2024 02:43:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790617; cv=none;
        d=google.com; s=arc-20240605;
        b=llbRnVkzmLDJJ3a+a6JCbw5m1u4QhMn5jVaVL7um7W8FQySnOH/pRBLNeWj6yJv3Cg
         FsVvX4hQS+g7w4vdy1lWwGtQvtJRxA+7sFu2es0iRQv2vJR7GmQ7HPMAUvp06cS3+uz5
         P6fnPu7Vnq11/KJnis0AQI3cqmTTdJYne5PdmNNRCwC+Vbm+0Ua/0UhTNuiLa59G/H+R
         AlDOihxjsLpdaNEIx5D9cwBG+VLrdW70xQZaFmARn6kb+GbK/DcnnYF2RmxQE6doRwV/
         CuoT//v3vhv9Kw95Fb0Mt8mgEl6kqRhk7O7EpUBPDDOOKbKLbUA3L59TfYUNKWbcCC41
         nJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SDBKL9MPqps6ny2XrO2kAvFlwZGolk654R0X02D8xvM=;
        fh=eS3huiRnR92hBIT8ruxXBlrIVcdZ6WkTiDT+RTxtUQY=;
        b=M2ggM5P6jeDMNWoyaLTgBqjCZviar8PTjjf3sl9IyuWeNtLLXr1+qWicSzWGzXITb6
         Jf4v17CfO+xhoH12L+fJ7elU2UfIWzcH4ywXLkcXgQVbLPeoRhH2exL7iNzEq6R7z4ZM
         4ZRKWXvE+rfviLxrVYaQa0Nr2FEvhzuhmD8kwb/QzgAjZmKrpVGFrUEf35DTjffAXxrB
         buov5nZRoFMNx+rFNh3WqSf/hML2jgiEQgRs3U8kZeEc2Q8ITFmUKiBwKEBuOHh7zoyP
         AbXzXGR4g9SP73DK0VwpRiCuRqQQHVGGO/LKb87fvQhZulNCqdx5T5eth3bQtsljIFi4
         t7Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sOZMtaVu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd59f61sor245013f8f.5.2024.11.28.02.43.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sOZMtaVu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790617; x=1733395417; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDBKL9MPqps6ny2XrO2kAvFlwZGolk654R0X02D8xvM=;
        b=sOZMtaVuI1HWuLsmtjRtnW0Ay4/J3w7fAPpRLm+Ee15jsbQYU5HvDTMzECUawGh4y+
         czaDshUOQcI+JrL5InCbI2ZvLOw4ppTQ+ZKdQE9wGQxRE3TxmrNjznnVFsxL0DXfPCvD
         vFgONlkm7IAecuwxMb4sGJ7blel6PiHh8ooo8bUHzmvFu+igLv38rA1KMKJ7Md8FVBjG
         OAzZJxY3vD2bOxoZuea/T0qU6w5qMEZAMl2oN2UcFYCkv/LvMCLUasKmvpB2OX29fJFm
         wecvGhxKURV7bnm7dI1TvVZHum6H/APfqfwcQI3QLQxK7Z3W3WgJIjjJnoxvXnd6aYJU
         rawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790617; x=1733395417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDBKL9MPqps6ny2XrO2kAvFlwZGolk654R0X02D8xvM=;
        b=F0cCyLWTtk2+UaNQoVagsSMGOr64ELeD4g2TcB5W17ag8paNplxCCF7g28iLWbgYbo
         xMkIXzYYH8O3tvI6KmpOq/EH+vSRqB5TdkgHV+iKZ0ExZMg1bUf/2VVbDoMEonPIXIMm
         UoK0ysG7KB6q9400JgOPizPCFt7NhJe05MRBqNymZB7hiEQH1p7SezZlBdG0MOOFUUoF
         Zcuou2D92Oe9iXBXjzmGAUsyQA/Kdt7nntKdDN+UxONww8q0DUJ4PjNZqECLLKCLqSxV
         0ToAcdh0HSiSYml5OHiCQCL9UN9/acXiAigH4J6b2oPyY15NXkusnNRsCySHQ+avmaEt
         lFGw==
X-Forwarded-Encrypted: i=1; AJvYcCXZYsU5Dph03HjCNkyeIFOSF2LCDCVADdRJQ9vgGfkKdse3S6OMQwmxnU7+uADGP5IrRsBU+YU7LiCijQ==@linaro.org
X-Gm-Message-State: AOJu0YxhkZt+33nd88S8iVzVSazsD6ZndVCIszUE/obQuLVOnWrwDsob
	qmgYDXjn9Dstt5IBEySSozpAustwraG5jdM/MnjdkQyLxOVYnsiE3GobhPKSRYk0xw==
X-Gm-Gg: ASbGnct8uNGakdBDzz9TgFB6OqeBjF7Xtz53WFfmNXe9qAJ+kcR/f9ekgIObR304CZq
	XKbk3CbvJvwDuHe/2ETnxAV4LRIVB5XLfuYWB72Cb7R3bRjwYi07Qo+VpsWpBwJFSPhgi10feM4
	6lpsilDnFpzMsnfA5q2W7AzF+vyy851krRqbcmRqeFPtsSL4SmrxpJJjJKvkA5WMsLNadOTc64T
	CdWcOXPDxySGtjw5WMGEiFIymofz+LT9S3VaUEvhoNDJALgHor9ETw=
X-Google-Smtp-Source: AGHT+IFPUDNHsVTbne3PyCSxDI1YCIQ5wGD0dfm48aH21lq3U8smxfK2qRR3l6+GuMUuCsLhh7mANA==
X-Received: by 2002:a05:6000:1545:b0:382:450c:2601 with SMTP id ffacd0b85a97d-385c6ebba39mr5425612f8f.24.1732790616845;
        Thu, 28 Nov 2024 02:43:36 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:36 -0800 (PST)
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
Subject: [PATCH for-10.0 24/25] target/hppa: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:09 +0000
Message-Id: <20241128104310.3452934-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XNwfNorkKxhd

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
---
 target/hppa/fpu_helper.c       | 8 ++++++++
 fpu/softfloat-specialize.c.inc | 7 +------
 2 files changed, 9 insertions(+), 6 deletions(-)

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
index 60de68012e1..353b524d2de 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,7 +475,6 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, float_status *status)
 {
-    Float3NaNPropRule rule = status->float_3nan_prop_rule;
     /*
      * We guarantee not to require the target to tell us how to
      * pick a NaN if we're always returning the default NaN.
@@ -501,11 +500,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         }
     }
 
-    if (rule == float_3nan_prop_none) {
-        rule = float_3nan_prop_abc;
-    }
-
-    switch (rule) {
+    switch (status->float_3nan_prop_rule) {
     case float_3nan_prop_s_abc:
         if (is_snan(a_cls)) {
             return 0;
-- 
2.34.1
