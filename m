Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2437106lfb;
        Tue, 7 Jun 2022 14:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiimE2q3mkNzfuQ0QnUYbyuPxv8GARpUPi0jOpskqPpGGWYO2R3y0G7tmNRU4ZEPNSbDxl
X-Received: by 2002:a05:620a:44c6:b0:6a6:d033:7804 with SMTP id y6-20020a05620a44c600b006a6d0337804mr6248587qkp.153.1654638796359;
        Tue, 07 Jun 2022 14:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654638796; cv=none;
        d=google.com; s=arc-20160816;
        b=cRB4Xs6apk0gD7T/jWu7gJkBfG8zcWGbA6VZau/GY5EA8LU8L/ghlmjGyFD2u3ZHn6
         77VgBxZ5GrKF4AHepjnyqeRtTSjN5QRT+N9lLA+1CLui4cm+MMdDWf4RyaJrNE843zfz
         J2xsCZ4LjV7PV6wc27eGXssthtMi6wsaXKLVXKRsOp8NOjeVrIegG7QpvefAKlT5iQdL
         UBfjmdFBMaai7faQW/X4xKnaenTcu+0E6eNCz9sFHFZZ/QSfWKvfX7B4lM22A/3P7tRY
         zYAg90Ivuj6r3PN25sffUejQMcRgvTjPFouMLBxlXniwbzIcYTqNKCNRnjPBZL/MnQ9U
         Z8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
        b=GzHeRO9KsWwzXAP4QxMwOknNLp4Uh96FeklBTjkfepssVwwvcx09v+eKGELiPYLr5V
         FG0C19MPKjWD8Mv3uCF78vw/9Ci6r5+QJC/QAmkxypUc9cStSvDEly3j9lDzmnwjPvsR
         bq78s6e/0FTsSqxM0DdLr960BaWSncFdmzWeCOjR5piJVI/RuAGPG3Zz7zeAZJNkCRvi
         U5VSKcwYTTtVsAnZ5t7Uc84IZm6pgvpPXQFdCbCpswsGnjZ3hPA9K0XFg5KPKNnAX+5m
         H8LrUvOiFyPv37aaMprmm6fRptjKhY04BZAx1+6UOHN9eCqBhIMKINOM/sOgpJRg6mZV
         T98g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NBRgEiOe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b006a68d8b7b93si9592224qkp.684.2022.06.07.14.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NBRgEiOe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyh8V-0007je-L9
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfww-0007Ka-Nr
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:14 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwm-0008L0-D0
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so16431749pjt.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=NBRgEiOefQ6of5ai/lbpMJqEnYjAkS/4NedeDVG+IoVaQLU+LQxsm9d6UTp4Lce6y2
 gFfhiT3mZ+riSg7DGJZcZo9wXbqA8GOemvXaPpwvadeRm4T6Ml61rtRWyKeCoATxhj9e
 cVlYK+PI2E/XcMyvrPZlNA/p0JBK6STfS3/K5giEGNF2dYEJ+B+PItfyDt71q1i8ixtV
 4rYxpZ9VY+Nlm12ZuWBLZmgS/DwOk/Hytf7D4Ky6f6/9vKUSjaoTO7lHzDuyBpupTVEf
 wRUo93itIAc3CNvNvP0yQGIikwbG409rQ7f9+G9zwDoi3ai59mE9Ktc2koZbuP45HPYx
 y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=7zkDXI1EXSRzN2UaiHPRZu+AFXTkcHF3swIK25y7zaov8/w0g/wIQdbliEtIfIo2Wk
 4opqvxrzhIXKtfOAMf4Vz9+y0T3CutILNfkuOzsXz948pUaK1WuftIIPBw/iA/UA3nIs
 CqEUWSktQdVo3Qqxj8q+AtHNm8YqTVB/BDn4YMuD155bNO50lIb6H4wqDGsCnFQTEWD7
 w2/1vy/UK3+UUjI3afplrpTSs6S87Sc07Xf28WGvX6P6d35VC6ZjCqiipoG0uJQJZZ4l
 ob9oL7vHOHNrllZupplthqBtgWIKA2O+ulmqE+BzgAc0E/NOy0jXtAR/jkF1shYIGGqY
 IJKQ==
X-Gm-Message-State: AOAM531yldMg0Ivd5zSv2rNl0dqS0AypJbZlPBTqwsIrGKarFfLhoqsO
 z/0OtcdprqO2Xv53JDaPBxc2cA==
X-Received: by 2002:a17:902:d509:b0:167:6ed8:af9e with SMTP id
 b9-20020a170902d50900b001676ed8af9emr15593000plg.140.1654634223172; 
 Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 60/71] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Tue,  7 Jun 2022 13:32:55 -0700
Message-Id: <20220607203306.657998-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zYILAVwhA+ll

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..4af6996d57 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.34.1

