Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp270812ejx;
        Thu, 1 Dec 2022 02:28:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7aQK4gzw0UU92TLIJ/5YfJGFoPwvG+E2Yci6BKkarRcYgS5KlAZ0oIl6yzWCDbK6WQKrOK
X-Received: by 2002:a05:622a:5c92:b0:3a4:fb85:6059 with SMTP id ge18-20020a05622a5c9200b003a4fb856059mr46519420qtb.102.1669890516936;
        Thu, 01 Dec 2022 02:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669890516; cv=none;
        d=google.com; s=arc-20160816;
        b=NCPu5LeYMr1L91xIyltVaSNa56I0NclxkZ4c4WICvtcl7RgOIjW2TZ7NCyHGfjcqhf
         G1TwVlZAFQJkeD2tnqE7Rid0nG7DcaxaR2SX+XLo4Tn7lh72N1a0gsPihMiRFWgkUGpf
         10lgUV/bu7o5SANZe2ZUb9fYkW/MyLcb7U5R/EeZaU+0dIpIyQYX5sRFxKjyjnItxeLu
         6TKVlndAmezKA3N8vX2rlCfMdUPfcPCQSidnrfGewWVoKwXrHgT1rEJknR117pR03C46
         NJM8IHNaYLyIuwhSgcT98w+r1x4LOne+Scob5rwyqsNWotdRmcosdgExRKUw1xnSsI7T
         Mp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1hazWKSL745ZvpNZN8kS/JIbdGHSa80I7/5Pc5IP8CI=;
        b=qjdx0MFuIu/nUBiUFiibbNwywtuwknHvbjs5rPsh7bhX2G0iSkBfPSpPVI71cr9MnJ
         rS/6FPkKObrvSeLBGdT0PFUwKrbcknzq5Gtx42+bHdCczZpnGyXSlWOnfOLoaX2HUZ9C
         5MFwwyCtusbB+SThue+lrqk8xqkPLw05n1rCzLavWVAKpM1rz8M212mt8vp86VMkT3C1
         ZH0rC8hY+MkxVmK9NkyyCqFQ5B4UfzL6nqT4khig36aNQkAonGKJmOp1+loy6Kz2UBNs
         46EwUyTabG2Jf9vpUoxmH44Qdk7HyOXAM2K2GqHQUmL7VmviPIV5TNSaO7bPfSgxGpqK
         TlqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfJjgRVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a05620a40c900b006ea90816130si2326193qko.624.2022.12.01.02.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 02:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfJjgRVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0gns-0002X3-9a; Thu, 01 Dec 2022 05:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0gnq-0002Ss-FJ
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 05:28:26 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0gno-00037x-O7
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 05:28:26 -0500
Received: by mail-pg1-x533.google.com with SMTP id 136so1305771pga.1
 for <qemu-arm@nongnu.org>; Thu, 01 Dec 2022 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1hazWKSL745ZvpNZN8kS/JIbdGHSa80I7/5Pc5IP8CI=;
 b=CfJjgRVsNdZLrPeUlQoOg3WUqjGjD5B1gYnEMGE9XuuQpHgf1iW3Og2MFPP3R1fYKZ
 pY7rs4AlNRNJWkvp3xomsi5Gw1Z7l37MXaiu/p2v2SdxKfmouMNspZ7eDPSKx3jrbnRw
 sr8EatU2szvDa+gcLGmCXN1kyU5AC0HCn7P0YbKd8f+xlzBVY6t0iSqQRBrluw+OH0SN
 3rymySVpXp3PRR9wT76Sq+38sKVMqCFGjs6HKuUO1HDruLxxW9LZEjC4Bc61MV3xDs4/
 rnns6UDamGQts0JiI1PgQwDENifQjzD8vb4XttSq5oTlPwkyJwXpi3Twl84nZRAcQpsN
 eFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1hazWKSL745ZvpNZN8kS/JIbdGHSa80I7/5Pc5IP8CI=;
 b=u9EKhaNkx15twhNyQbTvwDlS9lIxD2Uss+SSLRI62viTPZRK2EkM6LNGEqn/8e3+l/
 9sfn0cXlopj7zsJolGFBp5Ie6YSpo99OU67PBqcOaM0N7dzM6PQcI02DC74Yh6vxeJc5
 xDi0ovPwT0YyZDinbp/g8uDySFAooMk2n603AeQXR0lzBZVK1B1Pj9jl/nx2W2hllP6s
 U0a8txDJ8pEvPxd1raZr16GLdrcd4FLmeMIVtlMZ0WcPSD1nAGZIyU8yEZE2ZBVhTVuZ
 APrbEAyROwVVSixEMh8QgqgmIDGZA32hMxhqyq0/cNY028jE7IcDPNDiO94O3msTN83p
 redw==
X-Gm-Message-State: ANoB5pk1dvZehXQ9qN6M/wao4WFh2bmk7rPUOjkSMTf4irH6L1kdcsdR
 zrY13FDhc3CCRlzoEpecG0M1SAEMYIzc3anRwi2+TQ==
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr47374249pfb.3.1669890503042; Thu, 01
 Dec 2022 02:28:23 -0800 (PST)
MIME-Version: 1.0
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
In-Reply-To: <166983457648.13115.4940680286975412418-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 10:28:12 +0000
Message-ID: <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
X-TUID: kcuvy2VmwUUK

On Wed, 30 Nov 2022 at 18:56, ~axelheider <axelheider@git.sr.ht> wrote:
>
> This patch adds timer peripherals to the arm-virt machine. The
> use case is, that this machine is quite useful for testing purposes
> when it comes to non-Linux operating system (seL4 in our case).
> However, is currently lacks a dedicates timer peripheral, so some
> scenarios cannot be tested easily with QEMU. The RTC cannot be
> used, because he resolution is too low. Since the sp804 supposed
> already exists in QEMU, adding these peripherals seems easy and
> it does not appear to break any existing use cases.

Is there a reason you can't use the CPU's built-in generic timer
device ? That is what typical guest code does on this system.
I'm a bit reluctant to add more devices to the virt board
because over time it gradually gets increasingly complicated,
and every new device model we expose to the guest is another
thing that's part of the security attack surface for guest
code trying to escape from a KVM VM.

thanks
-- PMM
