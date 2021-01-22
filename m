Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp775570lfb;
        Fri, 22 Jan 2021 04:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbvlGk6cPKxV/6EoS12GmK3WyeGm3xvAju4eNzF/uzgq/LbJqfw7+UQFlLsI+E3qLzXpE+
X-Received: by 2002:a25:7614:: with SMTP id r20mr5561773ybc.364.1611317036617;
        Fri, 22 Jan 2021 04:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611317036; cv=none;
        d=google.com; s=arc-20160816;
        b=XJYW7oKKb6lccpowpP0Pdxhoy0pg8FNvEWeozpf6NI9el2OPItVGFCS89ChQSuLtu1
         GyR+d0Y7HqFjAjpXvRPneNQxaVLp2tX/zIRc9XI2eXXroHSSumUGzBobTt6EI3rr8gQY
         Jgp0n/hCwmgwcfcvqj+5huroE6hmufDm234p7qqdDQ7RF25qxHBCEqlmT8t+XdCTVW0o
         cMOFu4nqUhK+1LBwGWrXyu+os5WvxPTMOTnYM+J63/WM1wLCxSe5q0njct44jYIkeDwT
         7a/lzv3mZWXc9gqEfREJNAKC9CBnefvg+r3RU5oy0k6qzuNs/OMbR1Z0mdV3hj2/JDlQ
         Q69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+Ij7T8O3IU04/0swRAjJER9rbY3TfzLGvMT8dFj48k=;
        b=pPTv2aap1Fi7c1iNmaO31LQBpvSzmo5nFedpzNJAUPEITS8GBFxxJ44F7knWfBr2G8
         iAxbxep+tebcUexp/+mZjn7x5kJCQgkeUyvKdPYxBBdE4dl0F/7ucPcncyDFJaFqPrLG
         THiUIB464B2UF5i40gzO2wZ+KfBf7mxNNCCPq4hBjEGCC44QwCFcu1ekIkn33c79CtQu
         iofo3lV9YTEtgyi34sfU6va2Xn3uE7v7aekOyzV3LWLjR+tixCVBCiR4Ybq7c0Pl7xjl
         A68l9hRYsyW9W8w0a0Zk/PEfz8YACGJ77cyaSsBuBxHNLxinwkP1Q4SE8gm1/UDjWad7
         BEKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d60zEqCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si8005996ybk.283.2021.01.22.04.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 04:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d60zEqCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2vAR-0006Zm-UM
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 07:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2vAE-0006XU-Lh
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 07:03:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2vAD-0008Av-7d
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 07:03:42 -0500
Received: by mail-ej1-x632.google.com with SMTP id kg20so6830102ejc.4
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+Ij7T8O3IU04/0swRAjJER9rbY3TfzLGvMT8dFj48k=;
 b=d60zEqCz3DxxqydfJ8rAIbSi13w1bNJYLIPfBCJKAO7ma3gtRpmSWSC7HI1R7/vH/R
 RwQ7GnbZEzQTcAMAAAXxw+my8OxgKdyXQ4Ok0/9bSndumiQN3EwF4rQ7O2epHK3UJ6b5
 q32hH+xngeJMoftda6M0h05kXD4UWGfJJ7WZanaraX/0CwrU85qSQdhZyscEI+DoN7nB
 MRiCfWgpaFRiyBlhn9WshMQsfkO1E6IrF+7FEQ1HqSCLrEFsMsun6H6XoCblksosVcfQ
 8rCCf6wreNt+XPA2T1f0ao4IOAU8xrWSLvy6L9ie6u3VM5TAE5Eh+eUsSsJPf7K07kgS
 IgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+Ij7T8O3IU04/0swRAjJER9rbY3TfzLGvMT8dFj48k=;
 b=T6pSyWyCjNVnYj8k9BFgXUgR1mJsdiMyJaJEOOcaHouNVhofyRVCrvriNZcMYT6tOa
 RyJKWFwjk/FiEleZuNWmhnnXnmRVILggvMrLd+7dUqpx/S4c/OOTTHbxi5cWtR6JNY+1
 2L8QV9C5XWH51dfv5gbzz03eut2NcmfRFXnaOZAKVRmjs1qQ0ZQJNXcsvMkWzle1vRKZ
 KcjIs6vE1oZ786W+QSm4mVgwGNSUzNBgSxZHA5cc+Vnbc68v4L6s9Yo4qxaoC2GJXWnT
 b7J0zRt5Sse+aIgvy48HbgK8gyF0S4jOWDR0w8WKRAaoeUAl4R+bKid5yg9Ycfl02ndm
 HpNg==
X-Gm-Message-State: AOAM5327YHrMOaEqzNAf29F2R8ogRwpOVa5Tih6y/KhdS+enBUP1IRT3
 PQLN2HXvsCfPDVZn8J9xIk1AyPIVcHlMRehQrWcLJQ==
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr2763961ejf.85.1611317019529; 
 Fri, 22 Jan 2021 04:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-18-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 12:03:28 +0000
Message-ID: <CAFEAcA_7xAJOy+PPm35t7dNNHvJiwWbRZkVqxziEe9i23sKzrg@mail.gmail.com>
Subject: Re: [PATCH v3 17/21] linux-user/aarch64: Signal SEGV_MTESERR for sync
 tag check fault
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JRf4LzvEFuyU

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h | 2 ++
>  linux-user/aarch64/cpu_loop.c      | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
> index ddd73169f0..777fb667fe 100644
> --- a/linux-user/aarch64/target_signal.h
> +++ b/linux-user/aarch64/target_signal.h
> @@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
> +
>  #define TARGET_ARCH_HAS_SETUP_FRAME
>  #endif /* AARCH64_TARGET_SIGNAL_H */
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 7811440c68..6867f0db2b 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -133,6 +133,9 @@ void cpu_loop(CPUARMState *env)
>              case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
>                  info.si_code = TARGET_SEGV_ACCERR;
>                  break;
> +            case 0x11: /* Synchronous Tag Check Fault */
> +                info.si_code = TARGET_SEGV_MTESERR;
> +                break;
>              default:
>                  g_assert_not_reached();
>              }
> --
> 2.25.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
