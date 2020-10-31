Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2297586lfa;
        Sat, 31 Oct 2020 02:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+ULsiBIYVqPbKz1/LqFN69bz3fGEHtEs8zB25F2tWJorVaqHF9fU0t0ftgC54KapHhYNs
X-Received: by 2002:ac8:5741:: with SMTP id 1mr6220152qtx.33.1604137690209;
        Sat, 31 Oct 2020 02:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604137690; cv=none;
        d=google.com; s=arc-20160816;
        b=DrGQcxQLLZkH41qj+N66kqSFV+cogcNo2EmhRTuFoh05gKOAP4D78Xqt8m9rrHd6kg
         +1nMsjbfmT9dWkc4JiTkbNvXnkuvC1P6dAw2LdKtFRD2q1BoJHY+yJVGr7+q2eYZqLTQ
         XtghkCcdXUiXZvzZu7jc06dp+4VXcajyiHCOgV+Bbvar2g3EqsSR+uGLiQ1ABP24tLtk
         3400C4lbOIwG3WxcF2+GvtG38uSu9hUx8srgnJ49eICuM0nO1XgPJ1u87Bsq3MHoK4KI
         HRiZYFwOVe2xwEO3hUOwEo+GpjHTUuLlzYl8aZBmOqrCFEhZ5T9ZM2+b6WnNGrUvX/O5
         mRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=urG2kFZ3ce8Op/j8tESCCY+aOGYMljSJmXSJJ2Vr/XI=;
        b=UvdP5keOUKuv+llbVc4qzDv1zxNypX4snJf+k4d+SE5ykAoxRF/G7OHFGNacB+0dXk
         xaVO3Cfl6qzKxiBRGuzfgRceZH8Duez3JOAbyAEsSd48royVeuu48gF3RY2kv9Ik89kE
         jlFMophCxC1LvaMJO1SKDmKKixvHqYVHKFObtSonLntaOFPoS2d/g2jf9NIWFNAuoA5e
         I3NzJ279V9ByAbKlhGVPwIBgAnfgQaVX3dJm98TjU1EaScXwkgSGYqH3kauXO7X2xK29
         vXGvYMT04/r4F3fxK3fFpSTG/iuPMLI9t+4E2FD5fFdYSS1r8S4jJqHx1/fDkc+3bTLX
         W3hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NAdvUhJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si5127185qkz.103.2020.10.31.02.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2020 02:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NAdvUhJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYnUX-0000Oi-JO
	for alex.bennee@linaro.org; Sat, 31 Oct 2020 05:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYnUA-0000Mw-8f
 for qemu-arm@nongnu.org; Sat, 31 Oct 2020 05:47:46 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:33211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYnU8-00085q-DU
 for qemu-arm@nongnu.org; Sat, 31 Oct 2020 05:47:45 -0400
Received: by mail-ed1-x542.google.com with SMTP id v4so9206272edi.0
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2020 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urG2kFZ3ce8Op/j8tESCCY+aOGYMljSJmXSJJ2Vr/XI=;
 b=NAdvUhJsc9heM/Ik8kb4VHKedwI0Wz/vHNVaZMxVJGPulVHpcfEpPuXmCtm6f9C8Gt
 o5Bq/4yJoGVG75Jchs7tVPp4CEtmKGOiI49mzRknGcmlr8dkbE/z0dhELuxWunRg08YL
 8KGWKlMwt81QfpTqHIbsM2hmqpjlsqrFbqZWcrib1K135szWIrXlltsgME0GKKxD5gPY
 NH+akUUc7P8kML6rOykkzZzOR+QxNPdwbLGWf7HZqklY/fHQGt4JrAuPEay/9wXB3Wtl
 bMILmrVk7C9lAn6bPPUXo+//18cu9qbu09stemF5VqjO+RMiSj4Roithna9STITbWhEL
 +cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urG2kFZ3ce8Op/j8tESCCY+aOGYMljSJmXSJJ2Vr/XI=;
 b=Sk+TJSlPU+4MC8IBaq6gge9MC3LVMqDq12TNMHK/pzLLpxHYmq99139wCwhzRCpGTx
 iAwPOLqkbsBM0Qj7dTmuH1x0DC6ZtLcoMUumKiD0I6eY5a7z295PFTMxw8Fqv5NGyzK6
 AHIEy4MR2eOj0Bm4ShrqgSF1/EM5sVm+kfM5LFTpVEmSbKWMEvtvEyRzxoPFv3dlPUo6
 1Ekwklj3zDzCUC0coDssCK+o8g0o6WKMf/NZTR2dgVJO5jMFPB3qIyaevy5Cap6GfpyN
 1krsuVdB+lCajAbSOrj1YnO/nsltufpTBNr/34yxN0OM3MO9GaLWbQ8r5imD+OeSN6zC
 ffxw==
X-Gm-Message-State: AOAM531JqBzZDOZXzpvBNXuEuKuFiF9uvZBWTqC7F8hwiqOrisclH19X
 jWPI+FWkYC/LeoSaXghis0EN/FKMSRrLBDb8+u7n4A==
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr7061428edb.52.1604137662703; 
 Sat, 31 Oct 2020 02:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE974.3040806@huawei.com>
 <CAFEAcA_7xMjOTAWkk+k34oneB_KGCGk_hoBVMX-oDRMLZzR8Wg@mail.gmail.com>
 <5F9CD2AB.1060601@huawei.com>
In-Reply-To: <5F9CD2AB.1060601@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 Oct 2020 09:47:31 +0000
Message-ID: <CAFEAcA-ig-+T21OmbiRXhEZF6zpjsXXN=pm7Y=bj-P_d2SHFNg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x0CeTa/nK5kE

On Sat, 31 Oct 2020 at 02:57, AlexChen <alex.chen@huawei.com> wrote:
>
> On 2020/10/30 22:28, Peter Maydell wrote:
> > On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
> >>
> >> In exynos4210_fimd_update(), the pointer s is dereferenced before
> >> being check if it is valid, which may lead to NULL pointer dereference.
> >> So move the assignment to global_width after checking that the s is valid
> >>
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> >> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> >> ---
> >>  hw/display/exynos4210_fimd.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> >> index 4c16e1f5a0..a1179d2f89 100644
> >> --- a/hw/display/exynos4210_fimd.c
> >> +++ b/hw/display/exynos4210_fimd.c
> >> @@ -1275,12 +1275,12 @@ static void exynos4210_fimd_update(void *opaque)
> >>      bool blend = false;
> >>      uint8_t *host_fb_addr;
> >>      bool is_dirty = false;
> >> -    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
> >>
> >>      if (!s || !s->console || !s->enabled ||
> >>          surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
> >>          return;
> >>      }
> >> +    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
> >>      exynos4210_update_resolution(s);
> >>      surface = qemu_console_surface(s->console);
> >
> > Yep, this is a bug, but QEMU's coding style doesn't permit
> > variable declarations in the middle of functions. You need
> > to split the declaration (which stays where it is) and the
> > initialization (which can moved down below the !s test.
> >
> Thans for your review. I have also considered this modification to be incompatible with
> the QEMU's coding style. But the type of global_width is const int which cannot be
> assigned once they are defined.
> Could we define the global_width as int, such as this modification:
>
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index 4c16e1f5a0..34a960a976 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1275,12 +1275,14 @@ static void exynos4210_fimd_update(void *opaque)
>      bool blend = false;
>      uint8_t *host_fb_addr;
>      bool is_dirty = false;
> -    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
> +    int global_width;
>
>      if (!s || !s->console || !s->enabled ||
>          surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
>          return;
>      }
> +
> +    global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>      exynos4210_update_resolution(s);
>      surface = qemu_console_surface(s->console);

Yes, I think that would be fine.

thanks
-- PMM
