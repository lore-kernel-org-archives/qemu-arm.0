Received: by 10.25.77.4 with SMTP id a4csp1585756lfb;
        Tue, 14 Mar 2017 04:53:42 -0700 (PDT)
X-Received: by 10.28.191.24 with SMTP id p24mr14616457wmf.118.1489492422372;
        Tue, 14 Mar 2017 04:53:42 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id n107si4826314wrb.4.2017.03.14.04.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Mar 2017 04:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x229.google.com with SMTP id n11so61767383wma.0
        for <alex.bennee@linaro.org>; Tue, 14 Mar 2017 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=WacbL4yvwQKF1F+xVfK5KtNT4x5eN/jqbQ3QzYu901Y=;
        b=Jo63WE4FbHmLRn63quNctHuNkAIs52ILP/KRos8zy/0jzw7I5prZ9/iwVng+uOquJD
         XFGe1yO+axDFGyFJkdEUhFDUUCNqIEhT+v3ZwrM/ZZIhRQ7PR5yfeqguFxp1Bbz/oGYf
         1h3pI1+7bVLGcJc4yFr/coqroJruUFPDkeObY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=WacbL4yvwQKF1F+xVfK5KtNT4x5eN/jqbQ3QzYu901Y=;
        b=WRzhK/Kx0t9zNWJsQ1RcRIj5ElApoRG4zVVh/1voYk/lUyo2V9hYH1o/WP+/SRuDg9
         iCgOJ0MvILiJ6ll2YnyGH+/KaJ/3w8YSAqmw30XfcCwx7CAmXK05sFzVvaAW/BCics7K
         FrfxiZ7OgGcifSzv/2LTNuroo3TTPZbaWJ5UxgSOXvuJS4ZVp+FB7QJzJ6j/y6Q/Sdn8
         YG3vYoXssRPO1/cW01/Y+g2BemRnmWYU2ew5ufWZTAGKHSBQXNf6bxmlomjbjJ8frGTy
         1inemE+BeEhB1SDHJRM1vu5UhQPvNcES8dCcdvK9rFVtu4xYx0oZXNnl7jcaIWyIae5f
         iKHg==
X-Gm-Message-State: AFeK/H3anN61FPqAic7nw88dj5333vD9V0V5ZTwNdxPad03+A0VJPw0O7Zmlshuif52mVAn5tTAqevyRmq+PUAbnJXE=
X-Received: by 10.28.172.68 with SMTP id v65mr13830212wme.111.1489492422067;
 Tue, 14 Mar 2017 04:53:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 14 Mar 2017 04:53:21 -0700 (PDT)
In-Reply-To: <1488542374-1256-1-git-send-email-peter.maydell@linaro.org>
References: <1488542374-1256-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2017 12:53:21 +0100
Message-ID: <CAFEAcA-S5REnMvKZsDKf8cNgfsHrCCtQm9A=mMevkkwwCYb1BA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH for-2.9] hw/misc/imx6_src: Don't crash trying
 to reset missing CPUs
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Chubb <peter.chubb@nicta.com.au>, Jean-Christophe DUBOIS <jcd@tribudubois.net>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: dY876eXm1Qp/

Ping for review...

thanks
-- PMM

On 3 March 2017 at 12:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> Commit 4881658a4b introduced a call to arm_get_cpu_by_id(),
> and Coverity noticed that we weren't checking that it didn't
> return NULL (CID 1371652).
>
> Normally this won't happen (because all 4 CPUs are expected
> to exist), but it's possible the user requested fewer CPUs
> on the command line. Handle this possibility by silently
> doing nothing, which is the same behaviour as before commit
> 4881658a4b and also how we handle the other CPU operations
> (since we ignore the INVALID_PARAM returns from arm_set_cpu_on()
> and friends).
>
> There is a slight behavioural difference to the pre-4881658a4b
> situation: the "reset this core" bit will remain set rather
> than not being permitted to be set. The imx6 datasheet is
> unclear about the behaviour in this odd corner case, so we
> opt for the simpler code rather than complicated logic to
> maintain identical behaviour.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I couldn't actually get this to crash even with -smp 1 with
> my test image, but we should fix it anyhow.
>
>  hw/misc/imx6_src.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
> index edbb756..cfb0871 100644
> --- a/hw/misc/imx6_src.c
> +++ b/hw/misc/imx6_src.c
> @@ -143,13 +143,17 @@ static void imx6_defer_clear_reset_bit(int cpuid,
>                                         unsigned long reset_shift)
>  {
>      struct SRCSCRResetInfo *ri;
> +    CPUState *cpu = arm_get_cpu_by_id(cpuid);
> +
> +    if (!cpu) {
> +        return;
> +    }
>
>      ri = g_malloc(sizeof(struct SRCSCRResetInfo));
>      ri->s = s;
>      ri->reset_bit = reset_shift;
>
> -    async_run_on_cpu(arm_get_cpu_by_id(cpuid), imx6_clear_reset_bit,
> -                     RUN_ON_CPU_HOST_PTR(ri));
> +    async_run_on_cpu(cpu, imx6_clear_reset_bit, RUN_ON_CPU_HOST_PTR(ri));
>  }
>
>
> --
> 2.7.4
