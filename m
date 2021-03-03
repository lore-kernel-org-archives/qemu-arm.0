Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706841lfg;
        Wed, 3 Mar 2021 13:49:21 -0800 (PST)
X-Received: by 2002:a5d:6610:: with SMTP id n16mr642358wru.399.1614808161240;
        Wed, 03 Mar 2021 13:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808161; cv=none;
        d=google.com; s=arc-20160816;
        b=FkBgqGJTgCHFkWNi2ai9TFC5Jh4Q8Q37k5ev0qCpH63AFCB/RCARGsuFZVoIYOVnHs
         ViKZcCPCkxdmlnZDLDS0XaOdnrj8qoxnJ2XpTnIwZXcJ1o04hdYewsWxAXFmlPbm0u3Z
         ZDK5kCMMOnv2BURi5rNqNFdLZerqeVu/9MGdT45m/tkgxq6EkeMBEdiTVajtTX+QBNL7
         eeAxic/2023q/ca/JFy/QqpTYWw0sLp4kUhG2QoDX10VTdrckiNtIvKBcgzbcB1z+9uS
         fewYZcDOuVCgorhReiuu4NWaKs9qZh/Da75AZlO4rlQswUguJVVRFsTnTe7a4NrXwVEf
         iOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=EiAs45/8RrC9+ORKHg3D6zi8PaaattSX1vXVK8lwp1c=;
        b=ajB0wFXQQwhNmT2xp1SJp1+nOPFqlf3N6sQCGNZh8G38KmkwRtCckLl7wonpkBUoE4
         BD6DC+vwjDyIffekBsq5/ip5VPchcpUdmmL7SmYuivWZGkr8qpMLnSrGw8esXzqGyBHD
         M7WYa4I3kfcmXfGg+x2qUeFtnIYmQNCBkQRQ0NRaaqhl5YdAludt7e3hlHFvBPPeomjx
         YkBOkxZzckUc26N7/DLH9Y6qz1Q/kPe1jT+CLdiF9nfhzur0jncctAITFp1o9ACExwof
         13cEM2lgj18wQ0DrtoCowOUAeFAnYtmzUGUOh+IVkolEc1KoLNb3USMsZda8x7JwMogW
         SSjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ufEWTYp3;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r13sor3211142wrs.26.2021.03.03.13.49.21
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ufEWTYp3;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EiAs45/8RrC9+ORKHg3D6zi8PaaattSX1vXVK8lwp1c=;
        b=ufEWTYp3p7tj6hEz3k8BTBwooYiH8JE2gOPjzdAVZBAQxBy49PqvCSMtwHVUvmH9tO
         OF58jteoXSWCt2xb2zqnQgvagPNAI+6QYEg4hgQ43fTnaIOMTMeddrbjhL6ikmFZUfVj
         s3Ed31LBPh6fVAo1A4RqjaOvcjWhcW3DfVsXsa93SI+qM4H2BwjHwQuykHklyqvjqbSy
         BWcN/B40cP0uVpQjX7xyktAmzuYFO4hGvSI5E8uFSdzKUL+gRdpsV3P43lpD+QrAzHed
         pU1E+US1ZSbayHmCTI1+Ig7SAXB5TymhMtHeYnZMKVq2OLycCtcWtbItm9Qx+oYUso+N
         GVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=EiAs45/8RrC9+ORKHg3D6zi8PaaattSX1vXVK8lwp1c=;
        b=j5krj28dJ8DNf0I5rwRlonCeDYya57cqePzcVDZioaCdJHsxzrWItyoUA3H858dcnV
         EgNYRn3k+spYhSp/fKVwmvk3psUHNM+l3Edvioy0OXtLYsrweiWTcJCdOJFRP/ULjEeM
         jcSP4JPEQMoIbbb19R+tT2AMioJ+xW2HX5gzqQdyjWmSL/PHckcWl0vFKw97sc6TiKvZ
         ELa/feh4bSdMWMN9U9LDc4Q7W7xwRj37jU1Wo/NLsLmnQRu9lEnYHAb0zBnYy+JKrI7i
         i/GydsNASrZ4YQzKL/ssN6TpPT+q2RSaeXcZwzfAExQEIGKUBcE1w99IeA8JkQ346LQG
         Fdyw==
X-Gm-Message-State: AOAM533aZM7j2e9nrdbgLqc1dWswSFQPM2YszEMOaRtgATQ0rPViKkOn
	rrgjS1QxaRv5s993Xw/G9yMIcoSiDf4=
X-Google-Smtp-Source: ABdhPJzuZWFGh3IGPE603zM6dkg+gEydT+i8E3xcrTonUKvbAsPed0eKEbxmkeJkLgl19/unaDBZEg==
X-Received: by 2002:a05:6000:191:: with SMTP id p17mr813048wrx.154.1614808161082;
        Wed, 03 Mar 2021 13:49:21 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id r7sm33806893wre.25.2021.03.03.13.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:20 -0800 (PST)
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
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 24/28] target/xtensa: Restrict watchpoint code to system emulation
Date: Wed,  3 Mar 2021 22:47:04 +0100
Message-Id: <20210303214708.1727801-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LuUEqSJYWawj

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index eeffee297d1..85e466b37d2 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -201,6 +201,7 @@ void xtensa_register_core(XtensaConfigList *node)
     g_free((gpointer)type.name);
 }
 
+#ifndef CONFIG_USER_ONLY
 static uint32_t check_hw_breakpoints(CPUXtensaState *env)
 {
     unsigned i;
@@ -213,9 +214,11 @@ static uint32_t check_hw_breakpoints(CPUXtensaState *env)
     }
     return 0;
 }
+#endif
 
 void xtensa_breakpoint_handler(CPUState *cs)
 {
+#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
 
@@ -231,6 +234,7 @@ void xtensa_breakpoint_handler(CPUState *cs)
             cpu_loop_exit_noexc(cs);
         }
     }
+#endif
 }
 
 void xtensa_cpu_list(void)
-- 
2.26.2
