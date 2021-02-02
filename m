Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp193059lfo;
        Tue, 2 Feb 2021 07:05:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHkO+gHLBmfbIsJdHq5AvhOjThmVhGxvW+7VP5F3iUWRyL7pw8Ph9GIlEQkyIFPqQEHbnc
X-Received: by 2002:a25:2512:: with SMTP id l18mr34017943ybl.457.1612278340548;
        Tue, 02 Feb 2021 07:05:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278340; cv=none;
        d=google.com; s=arc-20160816;
        b=DiqkcX/5016vCzOL4SrKQJssUPk237aaeZ0lI+NLvBIzwqjpjWJX93AOHLKCs2JI+1
         K2Y+7qrtJSPt9w7rom4M25U1IzG2UeMZ4JuIwKcw1ItrUgRczQf28fjhhDOB9Ef1jvwy
         qRUbaW23FTQGYJaGKhe7Hc/GIdMpxtob7KrYgMy4aXOXTftw4qunGe2yINwGX1T+TqbR
         dKfjYSKl9HUF2PE3xAeSjEMhj2FN1FjcdqZOtDHQi4Bq/r3ruW8SfAaSjRUF9bchCTWK
         cB+KFnaNcVOu5b4IOCuTxyQ0yDGG49oMz+lqB9jS6cvFneHEsqtKk03TdG4ZAK6UWzQi
         vPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fBMKLjtoB57sc4ZtakR345EdP2jcOh9tuWkUtAui6SY=;
        b=dk6hEZgns9ziGqwpJRCJPSKAoCAasQ06egWn7vFm7PUOn6LVXXEqgSMR6Ke+xIXMqe
         l+FQn92MTC7QGMWRhnTBitVt4kaYerToVMCbY+f6fSIYIRAcY8+t/PrU0fBkI23/wngt
         f6MoKi4+642hPmKr0MdbT1/BOTjY2wvq7iOxnLTHdE3JYO4SfP8O+LByo8kSXRBksUqf
         orkX5k0LZmoI/H26prACeJrUG+KcibTusgGPS1kWb0gc8ZPL8K4/fj+Am6+fDBpcFnY6
         dd8UlFQMr0cyYzMdFKk95FBsHbnnMg7j00uhA2v9kEodqKLjbd3rsHRB3h+meXicrNnD
         26fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AQ3zzyxe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si20327097ybg.47.2021.02.02.07.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:05:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AQ3zzyxe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xFL-0004BN-Kf
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wx3-0007ut-9w
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:46:45 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wx0-0003Kn-T7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:46:45 -0500
Received: by mail-ej1-x629.google.com with SMTP id i8so13903095ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fBMKLjtoB57sc4ZtakR345EdP2jcOh9tuWkUtAui6SY=;
 b=AQ3zzyxe/vkvkB9kHLy+z2NWk5GOip91rE4hzV7+DtoRjscIQmBDX3Vdr+s3TkSALp
 FSq5tfovmjOGsSAEj1+w6OcHcB0dL9fIKpuNAdBRkj/PgBuWZZt6RxGrdgtBhdzfD+HH
 nz+7DUh0t/cs5wftfc8NxW66RfwDRm5VhfJ+G38s3E40XTQ+KkHaPhbrWj7mfRIXwN1+
 NvpMg99QxFfGE32dV1/dW9cxd0mUICH3hFFNntxMSp39j+ZCV5JpWwwMJRm9jdYTXUbn
 EqZxaS1efwpypLm+zBW2D6BkiV1jzeM1/88ChmdyRDjUuKrAYEIZD29BNAUh3Qz9Dn1O
 atMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBMKLjtoB57sc4ZtakR345EdP2jcOh9tuWkUtAui6SY=;
 b=pwDyPxBCqQFqUZJSCE3ADNY4IHxkJyGUMIMSctJYrgMCS7csymKqMxauhuEAf2WowE
 qJv8qOvXLM13ocQu/LT3FX2ZTRAjJppZcOHcccy/E3PUqVqx/s6rrd+/upMkzNB77B7X
 hUNBQdCznNGBklw2ZImj6iijPOwPPymXypnGS74vtusLCyNJszRvEEfa1WWY4rTI6Aqt
 ovHRx7I9TBBtjDNgXwqLOAKloKRfLsAEGcwmJ3jbodwbrExB6qCJO3bN5RWq5Ao8sTQe
 fO/2RyQnpqwcxytX8iK1d3Jx1ow30nmM88cRrpfNrtI0f3lUuVLAczfmX4KfyqdEStNK
 zT4g==
X-Gm-Message-State: AOAM532b6dguznNrq5PDWgkWaJhDbh9HF4FTgGQWcoNxJ4bRdxbDCsUY
 YawL4WLcrX4bg/2JvKr0QXHiNm2MHM9615sEfZGzYw==
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr22545236ejv.4.1612277201078; 
 Tue, 02 Feb 2021 06:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-21-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:46:29 +0000
Message-ID: <CAFEAcA_sXsYkngC=1uM7hGP_h_J7u2oHUo2zE+1xm_2gWFzmaw@mail.gmail.com>
Subject: Re: [PATCH v4 20/23] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 55/JnnFvHupf

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The real kernel collects _TIF_MTE_ASYNC_FAULT into the current thread's
> state on any kernel entry (interrupt, exception etc), and then delivers
> the signal in advance of resuming the thread.
>
> This means that while the signal won't be delivered immediately, it will
> not be delayed forever -- at minimum it will be delivered after the next
> clock interrupt.
>
> We don't have a clock interrupt in linux-user, so we issue a cpu_kick
> to signal a return to the main loop at the end of the current TB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
