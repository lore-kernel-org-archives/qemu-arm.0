Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp19257lfo;
        Tue, 2 Feb 2021 03:08:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcqMfIdMagpsdjfmJTzG8w3gXoRXlsH57kD/na8Q1wM602snT3FvYBlp+csJlj/qukzSe1
X-Received: by 2002:a5b:745:: with SMTP id s5mr32407533ybq.265.1612264086597;
        Tue, 02 Feb 2021 03:08:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612264086; cv=none;
        d=google.com; s=arc-20160816;
        b=TFQQjQnbwbDnDY/yZyzTnOMsiC/mz2fQNhL2a5kFVJ7TBgQi6BUQ+psBEY85MF28e+
         lCS7kvw98oRIkGeEu0HQZnwyzDAIvBMggBEIicnfwF5djT8Ed5lHc2g1giOUiy8fmEmM
         Yvpc605GAkN62APPqdg0XvwoPHuAyz/KbF+VAz3RmHw2tjBkgYw8gXVZRb0o5iZU+LnN
         iL9EzqLS62HhexFxboeYML4aljxEFxu+VRX8YQFwUU8o670JnZMuwN2FlrFyiToDgX/e
         sJzKh3uMT6J5ok5SW4sSvskY7evZV22/NQ5rUgzkGPoFCJqSOJFcuUpRyjhL57WCxsXR
         2QGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o8nk1CZIw+R0dDTkXmAHT/zo6Kec0z4UH980yk2OXsg=;
        b=yAfD5pelmDReg6E7/yQvfqgqTLe86L4VJA0BlyBrMM8VVt///pD1nwX67Kgt/A8ITi
         Hm4At0/8GT8v2X7xsBQLwCskha9bmDvXI9x76bfy3sJvUGPW43P3HJ8Udefq+dewCpRH
         8p9sXnbdiump0GFPsDrriCAj+nKcTXe3eBouLCJkaIhTtDnbd4KsZ5h/0LXgiGPdprpR
         bp6Uh44WOSBIPn9LV9clq+vcXnBDBXL99TkzZAX750bNGxUrmpWYxcoDqj138jB9ftJ5
         MqPF0De/crVTJZJNH+1DPZEJOhUSaQ7PbLVvxOdRWvL6eALt8WD2oWb+qFrAEqGBPrhV
         Abgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kD8sQqhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si10274352ybc.75.2021.02.02.03.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 03:08:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kD8sQqhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6tXS-0007hy-0c
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 06:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXD-0007hb-T9
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:07:51 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXC-00050M-4F
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:07:51 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z22so22392154edb.9
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 03:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o8nk1CZIw+R0dDTkXmAHT/zo6Kec0z4UH980yk2OXsg=;
 b=kD8sQqhZSEAsN/QhJdPZtwGkt6QQ4GVgszNCHGLB7X+l85s8cWaQ50u8REbaqV8qPJ
 gpk/lX8bFjrRNZiVfguhvNz9YgjKKMGF48Z2v87LT/4lMWX1W9eGJlRj6FIfN2tqDN2M
 +n9AR4G4dbAWHxNUOo+FPsxrZeY5xBn8zkxc/HgdEmViyOc+Qj8iehFN5uN197G3pICS
 576F7ukBO2dSW55EZ44btjf1geFpLKPRreYsaYCmWJySbdWKyQVvsf82hbxG5UWLEPal
 BFmaCfe+RIgeHN3dnoB+tLg61YolpP0bpk10zDCyb4SGvUa6AOp1M97KfsmnQxs+nyGX
 vATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8nk1CZIw+R0dDTkXmAHT/zo6Kec0z4UH980yk2OXsg=;
 b=iyBr+8/Y1QyHdUAAFEJYneISt4AwUK2tqBiGYGLpwX11Y/iVtDjluCY6fiYAJ+H2lX
 oGl+LdJGgLzkiGqsEIQfguAOXJCXwQnR81zt1VbOqEV9QwL2gzAAUtS0f3VFyyqIH05G
 S5YC8aBDqKG9+7cw5cMz6Oe9aKsq2lqcITKnBmL6a5RfU7wO5WIlzqK/dr1pA/JtwD8W
 CpJsHMLP1gmg398MwY9ChcBlmNwoihzJmd7OJox/NgZ0GzcJcfjHiWHObtnwvpLog3/m
 leRuieLRghCssBCwxEWFodeCMZ9dhc59pfzWtDglL42e5V9q+EZfFSe1O+7rWFdnWIVW
 yP8Q==
X-Gm-Message-State: AOAM533/SjK16vCVfGK0ZY3tZeYlJLJA6K6pa6oPyPNps3MzU59k/ajC
 lYghqBkHCxv2XSf0lWIaDPtgcU96OliFSztzsYINbg==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr22900909edd.52.1612264068313; 
 Tue, 02 Feb 2021 03:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20210130184016.1787097-1-iris@modwiz.com>
In-Reply-To: <20210130184016.1787097-1-iris@modwiz.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:07:36 +0000
Message-ID: <CAFEAcA_oouEJ0-=FA0iu2EsuQxwbw2buZXvjuUfYWAdvEVKurw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix missing call to report ready
 for input
To: Iris Johnson <iris@modwiz.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QrLD08Z3UxsH

On Sat, 30 Jan 2021 at 18:42, Iris Johnson <iris@modwiz.com> wrote:
>
> When the frontend device has no space for a read the fd is removed
> from polling to allow time for the guest to read and clear the buffer.
> Without the call to qemu_chr_fe_accept_input(), the poll will not be
> broken out of when the guest has cleared the buffer causing significant
> IO delays that get worse with smaller buffers.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
> Signed-off-by: Iris Johnson <iris@modwiz.com>
> ---
>  hw/char/exynos4210_uart.c | 1 +



Applied to target-arm.next, thanks.

-- PMM
