Received: by 10.25.0.198 with SMTP id 189csp509227lfa;
        Tue, 2 May 2017 15:05:40 -0700 (PDT)
X-Received: by 10.157.9.177 with SMTP id q46mr11489457otd.50.1493762739816;
        Tue, 02 May 2017 15:05:39 -0700 (PDT)
Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id v81si7020872oie.281.2017.05.02.15.05.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2017 15:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Received: by mail-oi0-x242.google.com with SMTP id h4so1426038oib.0;
        Tue, 02 May 2017 15:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=tZoSoz8G+m9oQuvTVGJ1C9FYijnszKd6ncExX6dN+rI=;
        b=qjZ5nW4WN/2qk9/6q2sIWBBhAcbRG9Gf9n+dUcV7SJQ+68KecGvdoIlKqar3hJ8maz
         Zto7+RndM172rB0VPt6fsM5rUfGi7fWi61/kuvZY6iBxahQpKgC4T57SfQBxP3ArTjUH
         CsPLnS8TjiTNzZJkJhf4T3PkGq+38Dm/wtsrhB0KhNLux/EZeqcjxCywJsgS8zyylqpT
         oWwIiox2BCbOVpBEdTXS4MwdXLPAwvL4bVGGLbSfnWge+teNDr0EOjsMmKOSsmq8e0D9
         XVmOr4udazRlwGHDRfxyuzTbxHBrAq8zmqhPmN0qIuSBs6BhZadkeSi75Jz4fJAhVV6W
         6jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=tZoSoz8G+m9oQuvTVGJ1C9FYijnszKd6ncExX6dN+rI=;
        b=Z9ffh5iYHm9Cofm/D1PPF3g1Z3GiiIs4uXofvX8yVBvE19nlOfzh3Eayya6PPlfm0J
         UldDjr4m+8arn7ZeOXu4HTiL5QSkHvCTD/wp0LYstwLqyUzV2DvoDzO8rAJyugrWJpR3
         XT4V//g4Kn+Aa4beOhCR2gWyuh4FmRRQnOy1ZRtc/j933uJV1rBoqzClTXdWGJuyfDYp
         zIAInRnuz2QHUKK7hdAJtPpWgjdA3xzlo/Oo6jiG/H1Mv3kkjoir1h/atqoSnGpRQNGe
         m2/02b1p7MnHV23IHV6VDZiNAGGu3G+CJ2PDrwdcMdnbJ5gfTSmO/tV77/cDpIS5aM1J
         D/aQ==
X-Gm-Message-State: AN3rC/7pnewpTuL444PwZ1f93U28QsbgkA6uAbt0q+G0BBdA80SCDcru
	bO6/bbheJMTSz0MxV4SAjdq3m8rIp6jb
X-Received: by 10.202.77.141 with SMTP id a135mr11560037oib.46.1493762739194;
 Tue, 02 May 2017 15:05:39 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.72.162 with HTTP; Tue, 2 May 2017 15:05:08 -0700 (PDT)
In-Reply-To: <1493122030-32191-2-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org> <1493122030-32191-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 2 May 2017 15:05:08 -0700
X-Google-Sender-Auth: WvDo954xUYb16UGK31Y40BM_HBI
Message-ID: <CAKmqyKMPX+=acJqRKkncy=s4G3C04Q8grD9PdSiPs8f1RuVRxg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 01/13] arm: Use the mmu_idx we're passed in arm_cpu_do_unaligned_access()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@xilinx.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: vkdDecEozpCu

On Tue, Apr 25, 2017 at 5:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> When identifying the DFSR format for an alignment fault, use
> the mmu index that we are passed, rather than calling cpu_mmu_index()
> to get the mmu index for the current CPU state. This doesn't actually
> make any difference since the only cases where the current MMU index
> differs from the index used for the load are the "unprivileged
> load/store" instructions, and in that case the mmu index may
> differ but the translation regime is the same (apart from the
> "use from Hyp mode" case which is UNPREDICTABLE).
> However it's the more logical thing to do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target/arm/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 156b825..de24815 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -208,7 +208,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      /* the DFSR for an alignment fault depends on whether we're using
>       * the LPAE long descriptor format, or the short descriptor format
>       */
> -    if (arm_s1_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
> +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>          env->exception.fsr = (1 << 9) | 0x21;
>      } else {
>          env->exception.fsr = 0x1;
> --
> 2.7.4
>
>
