Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp304430eju;
        Thu, 4 Apr 2024 07:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUs23g7K4l6a0bser3FiuLaMwPtAbFzeMSdjfdGKEw65od1NcV151zJtZzSMXgsw2iv/EUyviILq3msua1TvASdZ4vHEpKa
X-Google-Smtp-Source: AGHT+IFH4ixGZkQJ5liSLPJGpGbnkvQVB3OQSR+Ut3Q4hFxlsrf8F/0amfkHTyhC6kxANkpsfvKZ
X-Received: by 2002:a05:620a:4146:b0:78d:4618:610a with SMTP id k6-20020a05620a414600b0078d4618610amr1149229qko.27.1712241613196;
        Thu, 04 Apr 2024 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712241613; cv=none;
        d=google.com; s=arc-20160816;
        b=0zBmA0EMwd7Gmw6+XICYrJfRdwLhS65B7f5OHH4HU3LjtP73D9ExUGG7J5jdycU1zl
         ikFE7iZ/bjz+1ajwHywupi9jqC+DVqaa6DC4d5JjgGtIJKvNpgVmKTYGo2P1zyVmmJ6Z
         MZFGk4UyIfJOm/yzEIJj6zLR+U2JnVdByEh3PYt7F/6ZtZl2sqNyUJYIlTdsxjw33uOY
         TQp3K2N9NoWLsegLkA/G2L14QSq0US8SW6/fNlHhWQNcJOCtQso6Gjqcog65mvNyDLJB
         vumjQx9k5vCeDyYYzjKN9Uz6r2lrGFhKwt8Ht+7buhRQBfpPMuMrJS7P8l2Dk837iyNx
         3BpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GibgvPlEf6K6Ev5wyGbWbItBdY6+6NVY04HUHJy7dQ0=;
        fh=js/2azNliICPnUiDCKJBaolfqaqmAAiyi8gVuy7U1LI=;
        b=agKZRYssRlsDbi3wn46A9wITA5rL9tfaGkeH32/gB6rvSf6Jce9JqBBsAYrAhxq5BA
         GyZE+Nf5nkgFC7mbaLnPzjJ4cOFD2nVH/78HRw8vqP5wgYaQNa3MCu0axvrU9amNpGmz
         TUM+a55kczdqLTUhKv0sCzCMQhMJRRr0ZlFkzBrZHzOK0a8J2gz0xKuhbtYeLGKgbrzm
         mDjoCMh3qBtvWRaQBVYeTmfpdEidJnt7y/obF6m7RGOp4DRE6Tx77RdRUqJmvVEK3lfB
         +dDm2toRBCc+7ZP4rNfi86dd+Vqu0NFSHDWZRJyHbg3/Fq38b7RdYkHYl5IV9Q+x5Nd5
         iFaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P23Jsslg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020ae9c016000000b0078a3b1d1cfesi16445228qkk.652.2024.04.04.07.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P23Jsslg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsOG4-0001HJ-07; Thu, 04 Apr 2024 10:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsOFx-0001Fw-0o
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:39:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsOFu-0004Py-MD
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:39:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso1472986a12.2
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712241592; x=1712846392; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GibgvPlEf6K6Ev5wyGbWbItBdY6+6NVY04HUHJy7dQ0=;
 b=P23JsslgLA8OdHrwLwJQq1gWVsS3HOFMldB+/U+hV5WDL6QIaoZRAAOYoL+MCpnKX5
 AfuCu6aJ8gznZojDNzAsIr+KEgMxk8wEtY6l/0p8n5LeBjJe98EZOdmdDSNVUzEktAmT
 r/ctm+CsHTkwMkVCLtAkRO6kqFw8Bsd5XClaUc3AeKmx8RAuc3/VvNfzjLEyvPr31UtW
 v3t0yLCJHizpWt3Dpt/6g20WUfy5Gh3b8VJYV/j0FkI0e2+U2DljRpA+uq2RmzEB8PO3
 dc/P3nEZcH1DJVjOT100FrEF1N68PGW67KVGfWHVvjpYnrJNW8W39JITRWghUhgiUPlJ
 HG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712241592; x=1712846392;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GibgvPlEf6K6Ev5wyGbWbItBdY6+6NVY04HUHJy7dQ0=;
 b=njChisrRivDuzG7e3bn+cGwI9VTkkTnv3emk5Er0AIvTDbGG7Dyo4+uMzmsYm622bF
 u8i2ZNRx1w8Hvdh6/S75ICZg3LtCBUtirkKS8TWnbjnN0Ulbb8v09wes18cNu/8269W/
 tgAy+Slg0o2sUKM3QYbORUYsdFzJD1uDFLnDkfJFGdvUAH1qySlUBumi3C8EEoMfi7Pm
 x4Ov+RljmVYgXcjokC+VyUo1YdkJLhPLTIQPI871SqlbmP6K8KymiXRCWvrPXL1+4aIP
 ShnctOc42hogZEYIifR85zObrZIyzHKqa8J7JDGpulW/D5bO8MRLulxCXip2vcRcFAtj
 5B3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8WxOBWgp45/r6hdg5b7V3eLch95yowzEnfKRYG/RNhp6tpSh03Et9c3iEuudEpo5a5DTI1VDwVLCkqxzlimJM2Lng
X-Gm-Message-State: AOJu0YxiMPn9tb5ITe1XCSxlh32H+1mn0L4GcWvZZZgZ807xQFjUYhOy
 Df73T/VOLdGXr6BzEl+nINQo4TJiLuo90DpdRqRB0kz+3ClObAX+9PG3WPH8paCNGoq1jmTKw3l
 lukbVUGeN1tGegdzry8MPpM0Q0r9MHn7s9Otdy91dvG7SnEeB
X-Received: by 2002:a50:c315:0:b0:56b:9ef8:f656 with SMTP id
 a21-20020a50c315000000b0056b9ef8f656mr1885953edb.7.1712241591805; Thu, 04 Apr
 2024 07:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:39:40 +0100
Message-ID: <CAFEAcA9w6JUyjCU7uqiaiwrGG6w0V4G6DxjUC+DcvcKcoBtFKg@mail.gmail.com>
Subject: Re: [PATCH v12 00/23] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cyh29hQ45wvd

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for ARMv8. These
> introduce support for a new category of interrupts in the architecture
> which we can use to provide NMI like functionality.

Looking through the Arm ARM pseudocode at places where it
handles NMI related features and bits, I noticed one corner
case we don't handle in this patchseries: illegal exception return.
In the pseudocode, AArch64.ExceptionReturn() calls
SetPSTATEFromPSR(), which treats PSTATE.ALLINT as one of the
bits which are reinstated from SPSR to PSTATE regardless of
whether this is an illegal exception return or not. For
QEMU that means we want to handle it the same way we do
PSTATE_DAIF and PSTATE_NZCV in the illegal_return exit path of
the exception_return helper:

--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -904,8 +904,8 @@ illegal_return:
      */
     env->pstate |= PSTATE_IL;
     env->pc = new_pc;
-    spsr &= PSTATE_NZCV | PSTATE_DAIF;
-    spsr |= pstate_read(env) & ~(PSTATE_NZCV | PSTATE_DAIF);
+    spsr &= PSTATE_NZCV | PSTATE_DAIF | PSTATE_ALLINT;
+    spsr |= pstate_read(env) & ~(PSTATE_NZCV | PSTATE_DAIF | PSTATE_ALLINT);
     pstate_write(env, spsr);
     if (!arm_singlestep_active(env)) {
         env->pstate &= ~PSTATE_SS;

(I haven't thought about whether this fits particularly into
any existing patch or should be a patch of its own.)

thanks
-- PMM
