Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2156780lfo;
        Sat, 30 Jan 2021 10:54:48 -0800 (PST)
X-Received: by 2002:aa7:d39a:: with SMTP id x26mr10937407edq.51.1612032888419;
        Sat, 30 Jan 2021 10:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612032888; cv=none;
        d=google.com; s=arc-20160816;
        b=xN9P5zl2PMBlqjC6AvwVByWWxycaMLMki/9xBNG5jyjQHLSJBFwJuhdd6YDrTmXdts
         I/XQfUL3gg025uZrrPWL4fSDSh9bvIGrITOqQRnNL52aNCFM0q3Wyy4EoRtf+28qKMF0
         YhYWUWl+grdmhjKZonvxbJjG7JhSOsRbP0ebDYtnstJQElZpSyysaxRZ8jytqeElxi5+
         ehHRhZKvYnndfdyaqeIMXzQqW7yNYa2YFea+N3wveRBwfPfWIjt+beyOVLch++cdS5bp
         qt+sBnKnTDxYt7vWPwPIgiIZQcPVnIC7q0dmp33zPU20Gn1B+odbzEHY6fp4jkIqbQNr
         9EMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXtPVE2IbtRRYCpvUtiVFQgbW5mh8YjoQMknIuSaeAc=;
        b=wDh6weAVo7l0jw1U03W+4stwG9RJIpVuDqU3EEmPqTLwJ46J4rPx+7tTxMR7I/J+dE
         6dfYBK2PzfY4oKDOCyENqe9CqtYhQI7VWIgGRpvvhL7QXXbmVh/jkehVFSuou1q5y/zv
         bfyZYi50Qp3l7xNHasrVJed+8aDxHHN9TvrjSWya+3VV8CFU0Dy6DfxdybcHG5alPQqV
         cNwBBL3FExGAbxz89BRLj8nDnKgVWZVPGgwc5dGCWDNNDzA/cgK2L9jqq0tRz+GVdOB4
         lV7QUFsKeqBF0NNYtcE5vTQF+3QwgrWO9VLWDbv3X0cQSYMXJMAwlV3UJ2vsjvJrpN8n
         PBLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1rE5reO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9sor8199011ejd.46.2021.01.30.10.54.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Jan 2021 10:54:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1rE5reO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oXtPVE2IbtRRYCpvUtiVFQgbW5mh8YjoQMknIuSaeAc=;
        b=b1rE5reO+/ylwUvWHDQ6gFBD1ZMLvjmBVj7z6iHZEtOIrt85KafbIsrJiUTFMjgkMv
         EO239Ch7/2vVc0sITyLPdJw79Y+DCrMrThTp86B/tp4yto0D8J7B2oagD+F+VrSA1ciu
         I5poKTCsVbT2lrqibfeCp+VtxN5qYq2t6UgtTQzNfWSNTueccgRu9w7NSq60zrXpqF00
         E+yG6zYuZ31QrSrfccmyDg4uryatxiI+pF7o1OOGRbojYu5vd9czNJSN+4ROCzG5yfv6
         OGKU/10X2cC0Qells3y39Jm9YWDAtsEjcdG3fj0bTfhFF3WPV5yrPTu2+mgt4gwFPh4s
         n7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oXtPVE2IbtRRYCpvUtiVFQgbW5mh8YjoQMknIuSaeAc=;
        b=ZTovAyP0+lvRsafh2WIDWFW7Hx4qJxYg1qQwkZFTp4/sVZSNTSEPoJnY0kwOU1Cgz1
         KoenKRvRYPqQN7T0jFxzlP9FxcejKf58ANTx64CBgG/Js9H0p3AHXDLJzaDoO7Hpv2f+
         Pg31S6b+nMCAgL3DHJ97XO8yngnVwd27t2IKJl7iSJvXu5DxC1K+m1Wz0JMcAx4Hsmgx
         av+PVCXoq2IcHlQsSngXAYm732tQzAN2noLjOv9BnLHy5TI8lv0W2Rm9LVV417t9sWKC
         UebVavdrX4I9SaYJKiVtk471qK7PHtoHeD2Ks/ipihl/14gpYANJSzW5J6w9neexca4D
         D3Ow==
X-Gm-Message-State: AOAM533ZhZu0EgCNkb9vUZ2sJhsS2tjxcHUosjd67Ttrh0dZk2JFY6U8
	dWdgXPXJI+gCGBeiSzC9YmSQ7cF7ic9K6jTvsUZnyFya
X-Google-Smtp-Source: ABdhPJwo7gvPhPJtvirAJL3BBx+tVDxaTzL7yXGFz6XeyRrStm+3laD7Nmfgez99qF2/kAXH8/BrkdUPl35U/QOjqxg=
X-Received: by 2002:a17:906:b215:: with SMTP id p21mr10088000ejz.407.1612032888158;
 Sat, 30 Jan 2021 10:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20210130015227.4071332-1-f4bug@amsat.org> <20210130015227.4071332-4-f4bug@amsat.org>
 <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com> <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
In-Reply-To: <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jan 2021 18:54:37 +0000
Message-ID: <CAFEAcA-W1tcRREaPTfMw98cNsHs7JHk4gjaJWaJNLpxZoVnKaw@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: n91PuX8HZyKc

On Sat, 30 Jan 2021 at 18:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 1/30/21 4:37 PM, Peter Maydell wrote:
> > On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>
> >> KVM requires a cpu based on (at least) the ARMv7 architecture.
> >
> > These days it requires ARMv8, because we dropped 32-bit host
> > support, and all 64-bit host CPUs are v8.
>
> Oh, this comment is about the target, to justify it is pointless to
> include pre-v7 target cpus/machines in a KVM-only binary.
>
> I'll update as:
>
> "KVM requires the target cpu based on (at least) the ARMv7
> architecture."

KVM requires the target CPU to be at least ARMv8, because
we only support the "host" cpu type, and all KVM host CPUs
are v8, which means you can't pass a v7 CPU as the target CPU.
(This used to not be true when we still supported running
KVM on a v7 CPU like the Cortex-A15, in which case you could
pass it to the guest.)

thanks
-- PMM
