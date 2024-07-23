Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2672386njc;
        Tue, 23 Jul 2024 11:13:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkQ9MWrwK/ERViRX569r6rgRrw1nB60lpg/FYNmK3Foq4RBOvSSBDtZxluon7JTUg82i0cRHR8aYjlAG+0IfRyT53PyWM6
X-Google-Smtp-Source: AGHT+IHWXA1WayEHbluO5SXf30JIiDW0P9rUHfHVZuSnUvc7/HjWs6DRq1yz9Di6mFvDRVqUbiF+
X-Received: by 2002:a05:6870:a10d:b0:260:e093:ff8d with SMTP id 586e51a60fabf-264692a6d2cmr3863034fac.45.1721758397581;
        Tue, 23 Jul 2024 11:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758397; cv=none;
        d=google.com; s=arc-20160816;
        b=bqg5c291Cvcy6AmKAi6aTU5IRRvLbMsdHZv2jeU89clv/P1suxUp46efrN1AZsGkbp
         JhYIneJU/E2zYuczx6Szcwoz4nw2Qqt9p7G7J2g/2cXvxg7wGkSVt+Qs2zFXLMbeLymQ
         c2iQUYAVn9KdgjrMaRG4TF43EqtXcpUiv/d0LWtjMq8KgAX6c5IA/0f5tJh7km1KS1yu
         oUbKF4FX4bM5wUQ6LKtAM8W4mUFZMmJnQ/5Z4AkO15+Js+hJTshQS4Ur98vL01V/6+Bd
         WLKRZofBwbhtUSRXenQya5xSeYLT0BHvN1/8ujfkKXlKupjCOTlDeSVgPzcHKEr/NZA9
         gOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sKGM9WxUN43+saolT8pUI05xHvMsh3XU6bG+jc3msxQ=;
        fh=P3FU1jZrno9RL+Vs9Oy/0V0k+4z/okEptW/EcmytJu4=;
        b=A0I3c2vfO/fFmR7EBvs6iQ4fj8reyU0Nq+6vPy39e26KN11uUE63j3d6U6q5A0Z4d9
         q96INk3JOr6EqwvBeidrLtuabYkfES5rFiW1F2ITgGWD5J5s1Zoq9zRM3xVIowuvB757
         7JPJQmDzMEQoKVy8gIcaF1sfc9YereRMrx2lM2j+c7DFrKgoot4UtX19q4tHN21txSaz
         3Y97d8mEdUoewCXBUuxKIn53jRfoobCKHqtgK1fI6mOKJbeqlIm6SCFApauRKWDFvTyo
         EBIADkaVt+e3qhxn0yFBHknDyrTT+gJ6t5QIByIOyilNu1xW84HaO/GEsa59ywLsfJM5
         aglw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=hlLf+C4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a199093b23si1074664285a.643.2024.07.23.11.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=hlLf+C4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWJxb-0003Td-BK; Tue, 23 Jul 2024 14:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwv-0001Hn-FC
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:25 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwr-0001Dm-LE
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:20 -0400
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-396e2d21812so22353645ab.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758150; x=1722362950;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKGM9WxUN43+saolT8pUI05xHvMsh3XU6bG+jc3msxQ=;
 b=hlLf+C4beHtkT9fCT/JoDVVeCW8mgKuuj03OrHB3LNun0s09Jlnvh7hdelQ5hvEDZ0
 69lkEMn44A73xklZN8TrUwKk0AIJ6Zn2nmVvLiPPEzUpG4UCgdRMtFV25OZiSC+85eZm
 6NFlc1e7wh3teXm5ncW8RJRXOE3Y9gASfgnaDuyrEgobz8t8ragvhAODasLwtV+GKyob
 bMl/P5JYH0oSHZYykUC7yg6f9fADHyukSJ7LTGFzBK8uCSJI2XbsJc26LBYUqDOElJVx
 ptfDC7QS3OWZjfgWispLKKkev3nlO2t1JRF8zMujNsR6gfUuZ+yLckL80R4ra6DodJ2o
 2E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758150; x=1722362950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKGM9WxUN43+saolT8pUI05xHvMsh3XU6bG+jc3msxQ=;
 b=TlvyczHMBCEosucuv4/fFabz/9z7bYBxsqazuXVTZmEm1u/WPHcpExLaktNnCDHS1I
 B+zYoe5i60F26MsgzU6TcJKNdUvi5do8pnu0uuSWjrLSZoLMzl984FmrLeBMkCIlji9U
 PYvLZaO8dWbHoH0UIvykAv5m4XyzhkAJfo5EDqNNursjgy5h/AwHN/5EflttWNS6Sfgy
 C0WzbYWwd02PAdjWuES5C+yn1NHHVnQkS7g6OCPfY2Bdx6tWKSHBYc6EYT9zj+Cw98Lu
 xnrXNQWapHegqevsNtSRm7bisQFT9n+UhSiv+3Pscau4nFp0SGQRt3e4xkksnQCMxs7f
 acdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Kbk0VNCXZ65k3/CXGcZluuBXl+3GilFg0a6kLPVP36Y6IUf0ymCx0ZKNoBnnHzngHHB9QNVKge81Y8K0Dsz990CY
X-Gm-Message-State: AOJu0YyQUvFwyTdUUR1FrNd+YdfB9rrZPs2xQ8FJOK/AQPgQytLYTUZS
 8rMmvDkVdPqGikdD7IPNxPBl1TYhZxHM6DckLBr+beonFfhJSqbAeBbtWF3I3s8=
X-Received: by 2002:a05:6e02:13a6:b0:398:54dc:1408 with SMTP id
 e9e14a558f8ab-39a0c93d842mr44229435ab.23.1721758150198; 
 Tue, 23 Jul 2024 11:09:10 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:09 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/14] bsd-user: Make compile for non-linux user-mode stuff
Date: Tue, 23 Jul 2024 12:07:24 -0600
Message-ID: <20240723180725.99114-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ABJFcyAeno3I

We include the files that define PR_MTE_TCF_SHIFT only on Linux, but use
them unconditionally. Restrict its use to Linux-only.

"It's ugly, but it's not actually wrong."

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c8cef8cbc0e..5221381cc85 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -404,6 +404,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
 
 int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
 {
+#if defined(CONFIG_LINUX)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
@@ -425,6 +426,9 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
     arm_set_mte_tcf0(env, tcf);
 
     return 1;
+#else
+    return 0;
+#endif
 }
 
 static void handle_q_memtag(GArray *params, void *user_ctx)
-- 
2.45.1

