Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2917700lfy;
        Mon, 27 Jul 2020 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+2D0f/IO/pZCRuqIUZOtETs1JKgnCXdt4kMTIw9XaxmqVVUY5qpByu7ceKJ5rS7M8y7qY
X-Received: by 2002:a25:400e:: with SMTP id n14mr11998602yba.420.1595860891394;
        Mon, 27 Jul 2020 07:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595860891; cv=none;
        d=google.com; s=arc-20160816;
        b=EcVr8fxK99n3ZVkG9Fwa4fBGTKHUTI/RM93fR2iKD0520EKUXX7mfMwIdrp3ZuVXDj
         j/6itEeBi/US8P+1Er3NSgFs5kVxXLdFI+CZYux4JCI+F4GTJCYHnBr3jtZbgyTChiCq
         f+UIgp5xck840JkB/mzE/AVSBPXJGU8O4xeaqSacF/6ViK20oXzaKvwiFjw+WenxPeUF
         rAx18SHgHdx7xWI0mwAOcjd6uQNkbV0r26Tsf3nAFs/NYomclf2AR0CV5U0eNhoB62Zq
         VKrmJdnAKjaRqGZooYP0OjpwKkr/Q0xO35D45yqdl9pIdE1jxY18RqAeVQ+2UKuV1vyB
         ofOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k0Nc/mzW4Au/cLCFSSt16cyxxq25OSsf6soFbxRpQoU=;
        b=tBboLULm4WB+hBihNt1Rh1UEhrnD/k2LThWouc6gkNrPMWQqBfTqqb8H4RrIsVreKf
         KPoOrLvw9FjTGA6G3xdJHeNV9VRynDQvmLwAIYrOf7HenlAcpolrhXgGOaJzxUZyDVCl
         D4L8sfNy6j06PE1LtLTCtcgWN1lgyYq/P3A1e6D3dTVahNtAe5iO1/B7wjRryjXbuC5j
         zQEZhzMgF1We8t+QlisHvt22GfQ/qLc5SpztFd/XdDIBBwLFL4GnNzId3Ke2MfQxKPtq
         mNmtQ0BjtF4GDYjLEQuoPC+zkq2uSoPLa+RbBVbSHzMwhqjEKADnPezfwrv7t9BtG7yQ
         qmZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OYGh+atc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si8667023ybb.202.2020.07.27.07.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 07:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OYGh+atc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k04Jm-00089C-Fm
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k04Jc-00086q-67
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 10:41:20 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k04Ja-0002Qs-9l
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 10:41:19 -0400
Received: by mail-ot1-x341.google.com with SMTP id 93so2307990otx.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2020 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0Nc/mzW4Au/cLCFSSt16cyxxq25OSsf6soFbxRpQoU=;
 b=OYGh+atcPw8DAhWBx1kqldcXjp+SYb7b+9EdldBv0zHqSKKD2l0JOoOCE5agPwkwly
 hvdRVmJtMqnYTH0wBCD02BAR4sJ/ci8oxOooh8+FkRh7YfADldFb+0QZ52HIAXZHEbio
 SvoqYQ44eRHC/wk3kNb8+VziPZreaK00z+QpR/ADx7jzojnPN+6CAtj9VbeEsLQlo9K8
 8EzuKuh+yG/o3bHF81ZaWFMw0z/uzp4n9fG6pOVNejYMVOsXDFzq0koarojHhaft1IOj
 3hQwVMVTRjVDApEQ+1s/gd+NKvi9l/XEZuUHiwVFwa3ejeaYC4A6gZizvqJ63KilN2np
 SfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0Nc/mzW4Au/cLCFSSt16cyxxq25OSsf6soFbxRpQoU=;
 b=svxzXtq5/QMRLBNOSErwdgwXOpckdBh4/IptvPKGM85WaNVPmzktPPEimTJkHuh72v
 WBCdUB7LvhCRV360PuBmTKYZRYjeEd/gOSzWJbSFOrSNidL3qc+QekITEAT+CiG0pNi4
 4Di9cKwF2UNKMj2A6y1przIMo+ym49FyXCTrnsFZchH/0tYVYqvoNOQpOYCSx+TShIZM
 KuM1TjG86tbBzlXM7NB5VLYQbF1EiXw94ZIIDOuDk+xSChl8F1MsrPUiU+unZpfn+HVK
 VxhLODCRXNif6gVOKOG4y4X6G9golfnaxszpVT44pvE/R5y0xURYQmyC86//NtssLVFU
 N50w==
X-Gm-Message-State: AOAM530lvwyAkBbjTNPIo8raMLOSJeLz7WuJFKYVHwbSw62jGfbAxToC
 IvRwalOJY/ZiCimMzVwl/WZRDbPW0YyF72ByRw4Pig==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr19686034otk.221.1595860876984; 
 Mon, 27 Jul 2020 07:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200727130225.32640-1-zhukeqian1@huawei.com>
In-Reply-To: <20200727130225.32640-1-zhukeqian1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2020 15:41:06 +0100
Message-ID: <CAFEAcA9vQMP0YLAuzdPW2m3RcRNySxA0gJQZmeXBUYRy4=Dk+w@mail.gmail.com>
Subject: Re: [PATCH] bugfix: irq: Avoid covering object refcount of qemu_irq
To: Keqian Zhu <zhukeqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, yezengruan@huawei.com,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h47dOFIHO4q4

On Mon, 27 Jul 2020 at 14:03, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>
> Avoid covering object refcount of qemu_irq, otherwise it may causes
> memory leak.
>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/core/irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/irq.c b/hw/core/irq.c
> index fb3045b912..59af4dfc74 100644
> --- a/hw/core/irq.c
> +++ b/hw/core/irq.c
> @@ -125,7 +125,9 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
>      int i;
>      qemu_irq *old_irqs = qemu_allocate_irqs(NULL, NULL, n);
>      for (i = 0; i < n; i++) {
> -        *old_irqs[i] = *gpio_in[i];
> +        old_irqs[i]->handler = gpio_in[i]->handler;
> +        old_irqs[i]->opaque = gpio_in[i]->opaque;
> +
>          gpio_in[i]->handler = handler;
>          gpio_in[i]->opaque = &old_irqs[i];
>      }

This function is leaky by design, because it doesn't do anything
with the old_irqs array and there's no function for un-intercepting
the IRQs (which would need to free that memory). This is not ideal
but OK because it's only used in the test suite.

Is there a specific bug you're trying to fix here?

thanks
-- PMM
