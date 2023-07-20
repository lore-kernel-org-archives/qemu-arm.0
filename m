Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7975713eje;
        Thu, 20 Jul 2023 10:10:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGuObOuAGYyXMvifa0cvK4mTY6FFgM6XyM3pZAXgxiS8+P54vrsfj7wYmVtNTUSyfKLNydb
X-Received: by 2002:a0c:e509:0:b0:63c:c96b:d68 with SMTP id l9-20020a0ce509000000b0063cc96b0d68mr4071283qvm.13.1689873021314;
        Thu, 20 Jul 2023 10:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689873021; cv=none;
        d=google.com; s=arc-20160816;
        b=tBMKc0gF5ipqgT/2XRGT0YI917zz4Ah62Zx9J/3gDCnuY60VH/s0vIbORgKfPEopeJ
         iEuKEayJGqHdWKkw5XDYuTsVJzKGj0hHIASmBVDQsbiQdTTk+SNireY9+vVtYM1LYUhs
         W/JTOqKQuDCDBSYFTyLhzI9jAGMzSmLSPHtkirSHuGxT/05OKac/uxVFFCobHvCaP9FU
         1m1aZ+Qmuvk+MPKYuMV16UtCfSv+SRa+OtrIg3tLp6eE70d8TL/zDZQchwyKzBhXu1W3
         OOZkJ1MBzogzVZJQgCBDRGIeDqZFM95Dl4mBYpqJlEozKyzzjVbxJaxlreBGxecowYcV
         Ezgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5iaA+6Ta500m28WMLcFXycKifZZt1SSLyD8Olu6CtcA=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=Zwg6VxW4s1/yioERUrZnV2VlCHH4L2XuCTqxaFkW+Mp5V8Lto8PoapxlITBH6z3NFG
         LZ0OkrWtScqqr1E2DuOjkLZjS7CGH7cS5IkD7pFpRMeh2v2l9b4sZ9KIOHtjP/wOnU0O
         JJi1L4Ry70V9wvJG+s6I1m6jpGH4vKuZW1/kQwhdVrruii+TU087bY9ARcGK0sHnVXbt
         Q3YFLLhe4Saxxeg79cu49CIyzSB1W8SHbmTVB1H1+/bIo4t0IW8f9vR1VxgYf/XcqjZa
         yVzz+f93PVmWpQOimrWhe7CuuUP2tlDaNnRFTzuIRFNv7fIr49mlOpw8shzVQ7dvkARm
         39rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=edpx7voU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05622a149300b00403acaaaeb3si550553qtx.36.2023.07.20.10.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 10:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=edpx7voU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMX9r-0003wg-Kn; Thu, 20 Jul 2023 13:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMX9p-0003w0-Tk
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 13:09:41 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMX9n-0000eo-UG
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 13:09:41 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb41682472so1623265e87.2
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689872978; x=1690477778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5iaA+6Ta500m28WMLcFXycKifZZt1SSLyD8Olu6CtcA=;
 b=edpx7voUFK3OB+gtK8DA6CR2JGnEZLaS+tcWJAVmQC5vr+Urro9FEVSJIFi5i8yuDj
 AB2jDCXewjswaLGU4w7GHm2pU0QZOpRzFjrnSyUo0CB7yDtC7H5aXicGAvK0ty7YnnUK
 g8eVxWBOo/cCCYeVOvu8nshI3sAz1B3dWEvY2uyDSQDEOgDu1jK0v/aqaOHjKVQQYlq/
 I53x3VqFGK+RxB0g6tdz3GwjK/cRX7Y28a2tkWlZMFBu3YXIhWk0X7A+VJFoY5dnWMzG
 iD5elyxHu+aqZmu0KkJ9dEdhdZILHSFOjZDHmivo39WfFWXataV7rxRrxds4DTD//d50
 gxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689872978; x=1690477778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5iaA+6Ta500m28WMLcFXycKifZZt1SSLyD8Olu6CtcA=;
 b=kwbCG0kCZcUOOhYhLp3HcCWuv+0K1cWsH9k1zNxIXThNQRoUs3tNeHX+O6Pq8lJMSF
 F+Sw+TPfjamC7eMgRpF3Av1veEOH6JV1RmMszgLkb51446b0QwyPT/CS50QmDZuNgI0E
 0mWOEufvxUGCsN9bOLBUrlKegKJVAHGb9ooT3FD7yHfLAR9hx23QsvYyBwn4985bkp9+
 4JLwqoO/sHn2lQx7Yv65pPq/azpvaPWlm60NnD+K0YBH5tajKNWVA6SW8fGVXUP0cSbi
 TGp1zRIy6tJ61gRakKvQLyNndRIDU/OlcqZvfaB9kZ94WzdE9+bL1bsPPUMkY+XwZvkJ
 4SsQ==
X-Gm-Message-State: ABy/qLbHZLGN5qpyY3RsCbz4py00nF6GU1mvZJe5f6Y7mBFqN1t6FpfP
 k6/kxb3vUsWAhuBIbgvB7McJXVAWoAf2kKEU6h794g==
X-Received: by 2002:ac2:55b0:0:b0:4fb:8bab:48b6 with SMTP id
 y16-20020ac255b0000000b004fb8bab48b6mr2730189lfg.52.1689872977713; Thu, 20
 Jul 2023 10:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
 <20230719153018.1456180-6-jean-philippe@linaro.org>
In-Reply-To: <20230719153018.1456180-6-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2023 18:09:26 +0100
Message-ID: <CAFEAcA-8-ekD_Hq7V-vYbZPJY+s6-S6hWtF45t_RZTHFmqmoZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/arm: Pass security space rather than flag for
 AT instructions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aEDNy2ckkHjU

On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> At the moment we only handle Secure and Nonsecure security spaces for
> the AT instructions. Add support for Realm and Root.
>
> For AArch64, arm_security_space() gives the desired space. ARM DDI0487J
> says (R_NYXTL):
>
>   If EL3 is implemented, then when an address translation instruction
>   that applies to an Exception level lower than EL3 is executed, the
>   Effective value of SCR_EL3.{NSE, NS} determines the target Security
>   state that the instruction applies to.
>
> For AArch32, some instructions can access NonSecure space from Secure,
> so we still need to pass the state explicitly to do_ats_write().
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> I haven't tested AT instructions in Realm/Root space yet, but it looks
> like the patch is needed. RMM doesn't issue AT instructions like KVM
> does in non-secure state (which triggered the bug in the previous
> patch).
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

We should also implement the check that the AT S1E[012] ops have
that if FEAT_RME is implemented and SCR_EL3.{NS,NSE} are a reserved
value then the AT insn should UNDEF. But that's a separate patch.

thanks
-- PMM
