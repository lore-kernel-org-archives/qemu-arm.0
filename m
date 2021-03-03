Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706792lfg;
        Wed, 3 Mar 2021 13:49:16 -0800 (PST)
X-Received: by 2002:a1c:2288:: with SMTP id i130mr859259wmi.62.1614808156164;
        Wed, 03 Mar 2021 13:49:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808156; cv=none;
        d=google.com; s=arc-20160816;
        b=sCWdOBYV14vD9nhQBMTVsaa5KAd69krslAMtdRw2svu49ehMxvKJnSnUviMZGRrcW4
         70Ncg5dfbZ11gbo+6AJ5BzrbL2b4LcLEPYKliw+yIlrQKXMPTqPQXKDimpk5VAMrMgHy
         U9cOaiD+m1a1kTSj52OfYK9foR0Q+CzD/4jLZVzBRS9ROQXwZTggiiz2zfN2HhNxPCnk
         xyCRacrewsJxkIXUfF8vfeEAnk5PSj9Ctlo1oGYisrG2lbGzvIOa1Y4IENn+9+6rrwRr
         udGtKb2eozwvj1HxO1ZZ89peF0GiWimLsHblthbRnwg6vd2psz+ELpg8rELJHGdAJCR6
         gp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9CGCXi9+Tg5mub0B9murOfm8Ay83y93iGvVDRpdfsps=;
        b=zhPAb83JkyXsiCAZNYR1JGcOwfLbyRHk6FamOkH8xRWgOSJ7Ye5InpV8Ik7i7or5EC
         4bB+XGrxtivu9ntrLjWjvNXCqsumdx1k9t4vTH7svPfJdSunzcs1r0n9e2dqr5gas22e
         HJGjjs5zVB/S0m0Imypp7oBQ1C6YkZUBkCiCKmlA6kNuJv56bey7VmKI3QMBN7096aDU
         QVhk9LCP4N5ve4SrMbLqy5kPQnLaAxd9tlBmXOeMX2VC9ovya7TzWLlGET8hWQ0zjPLe
         bnCtEZTEGQcbwBgBqeaGOAJIdp0sPLGUICqhAl5pLiOhhbYv6dbdkrmxzslGyKBcvZeL
         jpeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BncbyaUi;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d13sor12772998wri.42.2021.03.03.13.49.16
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BncbyaUi;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9CGCXi9+Tg5mub0B9murOfm8Ay83y93iGvVDRpdfsps=;
        b=BncbyaUijP8mQby/RC1m6CuBqJhX4f8uzsk1xf64D9tsy+AD9d9Brmpw5VZRQO5Syj
         o7dArspPMkOOna0J7WUiL/VZKqa53GatDrqwn81COGz1Kmg6n6n+PgYM7Ojvi0zo/SsJ
         OH4A6PPki8hgQwWddehU5FTIuhNRyDe0sGkriywquNcSNxM+lnOO2qlBfcA1BLLjq+o0
         N5Qzx5ODP0kfUJ39RwRX1uDACMjEbHauAqY0TD3Fh7164xGvF+VquUY3zrvXwZWm8bG0
         xIEOPPoEtQZaGTdgO50avbceoOmKWn2ovQKrYyYuaFK/1KFgo26ChFQUdCSNo0KtUTRb
         RFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9CGCXi9+Tg5mub0B9murOfm8Ay83y93iGvVDRpdfsps=;
        b=CpgJAYm2kDl165+VCP4IfkNaUdj+61NxXDMRvmpJsRyjgOBu511K/7UZ4/+LYegLpv
         NozkxKzAXOe70ftwyj6si07FnrQRYtK6CdoMVTHro8UMvSAdghIKdMsPHP8gLAveGvaA
         iQvU1ybwCzIKi5RlKuQmttOAZB7U1Z/DlObvRY2hrVB9OkGlJ/0MNqq53MdnXQU7TvW4
         L7cj37SVbejDSM5dVgAqiaP7a2p/a5Nco0+z0cdHxusHz2RVJ4pBrZ3uBhcWzbv9MRCf
         QEmJnrn0kTGmPlacon7NfSYO6yJX/d/FUEjctk5yMK6cB3uZcQlHz3m+zGWuXrbO2orb
         5wGA==
X-Gm-Message-State: AOAM531fvEXEhmXCgbd8JLFk07WWHmU/xjq6R28NnFtbDOCd7FQdex2k
	XvxmiJz8KloSCpaGMoFppEE=
X-Google-Smtp-Source: ABdhPJxYM063IJN0COFfaPkajKqL++yy+J1PkY9rOTXrR2FtKls2fwIULR4oDLlqPmI4itT1CUeXgw==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr815714wrr.0.1614808155948;
        Wed, 03 Mar 2021 13:49:15 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id d85sm7280009wmd.15.2021.03.03.13.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:15 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 23/28] target/i386: Restrict watchpoint code to system emulation
Date: Wed,  3 Mar 2021 22:47:03 +0100
Message-Id: <20210303214708.1727801-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: T9vMBDAWBqx2

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 994d58aa754..4b8f06f6193 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6182,7 +6182,6 @@ static void x86_cpu_reset(DeviceState *dev)
     env->dr[6] = DR6_FIXED_1;
     env->dr[7] = DR7_FIXED_1;
     cpu_breakpoint_remove_all(s, BP_CPU);
-    cpu_watchpoint_remove_all(s, BP_CPU);
 
     cr4 = 0;
     xcr0 = XSTATE_FP_MASK;
@@ -6205,6 +6204,8 @@ static void x86_cpu_reset(DeviceState *dev)
     if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FSGSBASE) {
         cr4 |= CR4_FSGSBASE_MASK;
     }
+#else
+    cpu_watchpoint_remove_all(s, BP_CPU);
 #endif
 
     env->xcr0 = xcr0;
-- 
2.26.2
