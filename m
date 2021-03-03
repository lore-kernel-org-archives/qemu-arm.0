Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706876lfg;
        Wed, 3 Mar 2021 13:49:26 -0800 (PST)
X-Received: by 2002:a1c:9a09:: with SMTP id c9mr825655wme.172.1614808166211;
        Wed, 03 Mar 2021 13:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808166; cv=none;
        d=google.com; s=arc-20160816;
        b=m38rg4mY5fdqIyG7d70wmvaRKNV/XGnGlAgx8wByIAcPmNl7pvrjUDSZ9RV4vgR8vu
         WXZ5mprZ2GlJB02eoWIcq5AROJBI6k7inA0ry+0Q99wb06YeU5Mul8oQbOziQcpctdY7
         eOPbMPdl9nL9HwtU2sD+Drw2r2gRhYBhtSqsjeBvwqfVA3BPs4pBpMHOyTT0uibbP9kC
         jkLvn+BBdlPEZfJGwUlNVv3ngwvAIXYGn99pqYDI7eozoFKHTEh/h2nr5IGrMnczvAIe
         gLHz/9oROgZcHtGIuVg2k4WpuiGynncqh7WinZPntYJw/YHoMSXOu2iUb8K6nQk2wlMW
         Et6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4R5DcpwiVyH1crneA2P/IW+Ft2bwjopPdJYmPr1uTds=;
        b=EJhV7OssSYnYlmqigluCsNyxcE2CQ3BKepO+YJcRQnWA33TBrpWcSeTVXFrdHRsIup
         TRNceNfvR5yRUMcMOxz0+1gmphado+TyVtFX7hSRF2a7VGWBumOvJFvytLiHos14J6at
         8m2VaGWKJMfTgQgHg7Tr9/CYh1S9dCaojS/5PyKojJ68z1Px66Z16htpTNFIcX3/RE0t
         I/b6fhltqLYVUz0sYTjgPUzMU/l8G5aobDNMLUGtScLxN+YDnOR5NAgarazaXIThIDKo
         k40Oo6maxRrXrxcNxeaUnXBU6WDVkGyQleScza2/VoWiHd4AI1WwWgGmpf7mTDm34RBZ
         G/3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NbAIWa7c;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e7sor12433101wrq.22.2021.03.03.13.49.26
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NbAIWa7c;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4R5DcpwiVyH1crneA2P/IW+Ft2bwjopPdJYmPr1uTds=;
        b=NbAIWa7c7wZe+GDH8szDSnlBZPWxefFR6ntjrAyy3SKVtlc+p67YkOygXelyZmOmah
         OacmPQiMQ0lbJXnBe+33mRgfmD5dw7+k+5Ow/5Pn1Ci9mGYzyOz5bhtpFfpCkY3+QQrZ
         5OpMSLo+GrtqvuQrFkRHoCmjX4zqF9222pqR0ZAzPPMiqRDPvrAK4bs5UwU7ZNOVznZF
         f9Xvgwp06LFaXUxDXE7xbatRKqokXNme+UMnhRg/a+IFQ5sisTntQew93UxnY+Pof4nA
         KfW9JorwSMGyM8dJqxFIBkOk5Xngz0MR+vlqm+6W06idIcZ7v2TDzmRgin0C7txbfgFy
         8uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4R5DcpwiVyH1crneA2P/IW+Ft2bwjopPdJYmPr1uTds=;
        b=EJS7c+DR93bbfiHED6KvNHkvgsSv/KlorwlrZFeg6G1lQmflryyRj7pUZE61xpzevs
         LE2+uZ0iYBxZalXBt0D5HXa1TjCWkbxDzefHkY+OpkEHlVaxGZAnKNwJpOngarKG9qZZ
         fshd/HzpmRsuGUlkGm/AwBC669SXSzB/8C5VV44x+Kh7P2gC+3BKcTS8t5qKth3gCmLa
         bfFAvPuUKpeurHQkp+4ZAULQVITnDyVRss52Z7b6/63R6QlultpTwJ14sllm8XpimyC6
         GUQRLNnfSZ2lToldnLrTPMyS1S/UIfj70GpeGJvEbK29nv2GXLETerxGq2z0wsLgAjz1
         j0ew==
X-Gm-Message-State: AOAM531eSEEeKYnPRpJSQh15f0bw5aJFVqPeVQkFu1nBD5KoLKdngmG1
	hHk0EB2TNj3WQjTS6wQfpHg=
X-Google-Smtp-Source: ABdhPJw5M5BRw3KaT9S7Kgh8uaaWjhLQQiXmBsGhFLwNCBpvbqOZzXsB1MohyDvx9cI1GkLbED4wdA==
X-Received: by 2002:adf:a418:: with SMTP id d24mr663327wra.187.1614808166003;
        Wed, 03 Mar 2021 13:49:26 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id o13sm38037052wro.15.2021.03.03.13.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:25 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 25/28] accel/tcg/cpu-exec: Restrict watchpoint code to system emulation
Date: Wed,  3 Mar 2021 22:47:05 +0100
Message-Id: <20210303214708.1727801-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DAZCCV+pjamD

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd8..3a6436013ea 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -471,13 +471,16 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUWatchpoint *wp;
 
+#ifndef CONFIG_USER_ONLY
     if (!cpu->watchpoint_hit) {
+        CPUWatchpoint *wp;
+
         QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
             wp->flags &= ~BP_WATCHPOINT_HIT;
         }
     }
+#endif
 
     if (cc->tcg_ops->debug_excp_handler) {
         cc->tcg_ops->debug_excp_handler(cpu);
-- 
2.26.2
