Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1588835lfa;
        Fri, 30 Oct 2020 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7RNSKimQQcnVTyF7wgQWMV6BG8ZAtzoHsxecVfGZ5fti/4D/PPwTlBL+ny1cPlDaMaUOc
X-Received: by 2002:ac8:4e44:: with SMTP id e4mr2329688qtw.171.1604068238575;
        Fri, 30 Oct 2020 07:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604068238; cv=none;
        d=google.com; s=arc-20160816;
        b=QqhL9x/8RMtSo2LTjJTPLXJhjisUltxGfT3KX+rPzMD0cVttWaYXJWTGlyKb6Zpqn+
         ugugoFHXkYmwQqA7lGoRLR2CQMLtyeQxij9TriNEY7Yqc1ImfIY2LAGlm4Vd7U5dOPzS
         kBEDKGLKYpdgMJNK5mFRqqsUmxpwJqLqnAfCJSYM+hH5B5qRb+yehhObpb4jt4GFQnVU
         eYEvRMn2WqP2YIiwGfQYVRmPC80Qb+4QaK69FcQ0EGv2v+Bdx2o7ZtISdeWw30tbgaBS
         QxxDOfguWuyeSnaYLwXNMVt6YJpsJRipWVqgXXSXmrFc2f7tDXv3K3MmWuu9W26GJzN9
         3ORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrRzD2OxH5662WFncZKSf2Ox7cQn2AYxZntw1toNEbs=;
        b=WpGeDOmufAGi/PU0Mdf8MHhJ17gab4l+3JO6P07pQJjnVYzluFzR+YH4UApnw5VS1L
         bk3a3P6BzO7UO+3RksThybeB3EtjNK7UarZq+uGy3ImdrMwdP+JrfypbInJ8HoVSU0ph
         nt6BVKh3vFrm59qHHk/fMuFJVi7IQP0OjG6WgQUbbEA5e+EfUDQpOsbSiwSSqMJB9eZN
         yFu+h/yhgZHeSaQRmXtzORpeSBS5oJu1yrgIwbciu9KIPGBVh9rG8WOVxP7boCT7Kt2A
         fSe3Az76Cjjlw0W/MSc8mhY54V+YX7qxRp44etgX6nGwysC3qT8URFW+P8Vn4YXsjT7i
         IQUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2PJEKf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si579524qts.8.2020.10.30.07.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2PJEKf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVQL-0006HH-WF
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVOp-0005TV-Kp
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:29:03 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVOn-0000yV-Mm
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:29:03 -0400
Received: by mail-ej1-x642.google.com with SMTP id t25so8827982ejd.13
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrRzD2OxH5662WFncZKSf2Ox7cQn2AYxZntw1toNEbs=;
 b=X2PJEKf2WVVNxxn4NBDT/5Xpr1Thzq/P2GXXPWAjEMiQmjVFD8XKRmDCqW7TxjX47o
 aBoF19VB+zGHQaM8KRIc/4mfxah+ArTI8N0lFuhXSVELywcxWfu+2ajfBN2Y9gY+Kq18
 hs/41zG3bIlOYt7bqIPfa/ct7K5eQSgANmZPDySyHo3e2t2J0qUfZTvNGXmIZ34izupv
 ep7snExaGXzDpG0GthKKvG478JeZ+H7TEnmi8v4dM6edSHSEB8ufzsUEc2b9pVlubGD2
 6Zkc6BUOcPF4GRsUHfpcUCYex4asRW2JDsA/igpFRQWuCeXL47lzHXxLKH1aSS17s4ES
 9y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrRzD2OxH5662WFncZKSf2Ox7cQn2AYxZntw1toNEbs=;
 b=UB43OVmeMa9MoW7CUkNsamJQlhtw5sxGNcdPB1Z8hoV872/cVSreK3Iqtf9PvGUSOS
 XwhhwzbBSAQcaK3W0bRTXUDa5M+XwC2mKINU3XdYh0WR87afyEABjxEQE5rFgp+sS7/j
 PlEd7L4k8fugUYiLkHNnWuPXNpWYE71YwgzwP98O9rOFg5WZFxIOVAu07g7F+L46HEXB
 ZZEEUIyUy1jFRyTWNMGhZj3NwKPq+woVoPq2CbcAX25MS6KR6yoGUF1XHcEasdV8HMOS
 2P9uRsSJ6P6GwmS82wyp9qV3mY1l/99Xq9dg3Ig6DxzbjnbhunEI+RhFMffqfQyrQDMD
 qDaw==
X-Gm-Message-State: AOAM5338ynJO7hDCoYA6VXvwGIZxvq67vTNHWJdndPTMn6U6Xh2SnGzZ
 TrXP8KP+NeZz4TyS0YD8XlZHAUBvsCGtRaQrf+t3tA==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr2667860ejk.407.1604068140154; 
 Fri, 30 Oct 2020 07:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE974.3040806@huawei.com>
In-Reply-To: <5F9BE974.3040806@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:28:49 +0000
Message-ID: <CAFEAcA_7xMjOTAWkk+k34oneB_KGCGk_hoBVMX-oDRMLZzR8Wg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r5y3RX3hY0QX

On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
>
> In exynos4210_fimd_update(), the pointer s is dereferenced before
> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to global_width after checking that the s is valid
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/exynos4210_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index 4c16e1f5a0..a1179d2f89 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1275,12 +1275,12 @@ static void exynos4210_fimd_update(void *opaque)
>      bool blend = false;
>      uint8_t *host_fb_addr;
>      bool is_dirty = false;
> -    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>
>      if (!s || !s->console || !s->enabled ||
>          surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
>          return;
>      }
> +    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>      exynos4210_update_resolution(s);
>      surface = qemu_console_surface(s->console);

Yep, this is a bug, but QEMU's coding style doesn't permit
variable declarations in the middle of functions. You need
to split the declaration (which stays where it is) and the
initialization (which can moved down below the !s test.

thanks
-- PMM
