Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp340708lfo;
        Thu, 28 Jan 2021 08:01:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhi1jRm4oBe81wteyqUpaU/TV0QUcQ/ZpHCe2ZCl02ZJOD3xfpIPx76MBY15rsgGWSeg2W
X-Received: by 2002:a25:ca94:: with SMTP id a142mr13151309ybg.239.1611849666605;
        Thu, 28 Jan 2021 08:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611849666; cv=none;
        d=google.com; s=arc-20160816;
        b=h/GnbTnoDQ5Ui97PHVmtIx1EEwNUWvoqnujpDLozZ7QrSs8rFrToPB7uVCQqBmZhML
         JfHx5aKGqWIdCY1/cHxJGsHQ2Q/HnUMqYrSEDfnMaeNl8iKecFqdb4uo4dU3Bb2Y7jsP
         MeZ2cglLRD5mQ2krMDg3CKxtNQztVMgMU4/2hJzBewwcIje3gbSLelPj0tephIhvdpMK
         7PvcgL+NMRkqqZTbXUj383sPyWaxkq0GttEiBBsriPCjyW1+H/6ld0JrTsChfrwwrO2L
         AgDdeqXx88zArY7JFb6oV/qSihA9aoXd3UindB2KONMKsywrUqiBA2LeKDPS0iKXFI98
         au7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5kwg4gdbZspXmiJL8+f2EgzLJGp2DZkO3F/HF0QXW/Q=;
        b=vNAJ6abStKagjR1OD4qavPDjks/Cg45fZ0gXGPDEjL4lLbwDsmemdD10BZ/YIBO8N9
         bG2VVjbcGCaTU072dU5q0siLySpg9ctmuW75zkg2gTY320dgTX70r2GsJXPRDjcF9P0e
         GVe4kayZycGbKmavy6W79+7it5/kNAZo6ql0+zdece3GhTdMY++FB/O6jSZaa3ODcyXp
         fy7wFu0yJU1aPrPat2acKAOoftYl65Mn0Tb7bzPTQNnlkdPM+4XHuMIhIgnNWJidLoEH
         OZ8xuTgU4HQbJGPynuTM/M/IR/sGbUljD3onu1w7WMhPf/htMRCiXb9wBov5dkmoQzzX
         A3/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fgRNa1rj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si6128469ybc.213.2021.01.28.08.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 08:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fgRNa1rj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l59jF-0005zu-VN
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 11:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59j3-0005yh-K0
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 11:00:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59j0-00034c-1o
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 11:00:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id r12so8519852ejb.9
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kwg4gdbZspXmiJL8+f2EgzLJGp2DZkO3F/HF0QXW/Q=;
 b=fgRNa1rjv2U/gthbSs4rF0jQTm9MGsr1//6c+rxFLLYK0MtqRZIkCaYk21xAldFxuH
 qSd0DkRIzuRhSX+YEkuaEE0z2qrlv2XMGjUUysvnJX+C4yMtMQm81CSuWxk+YGXCMCB5
 VjjP7+deTeG7RK7hwSe8lUOgS8wGZTdszASImkTKX7GxpwasVhfqpKwa34TttzW5a3n8
 pdlJS/A2D9SV602tv6lH1pucd17IC2o2RHLUIdpiip0ihHDluzjzC7je26jsmx6gcIeS
 sTAEV4FtcNhVbHiM+AanozzurlZsvdd+NKLRDul7W6SoFxO8C/x92JiBo3jwj4MQuCyN
 EdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kwg4gdbZspXmiJL8+f2EgzLJGp2DZkO3F/HF0QXW/Q=;
 b=cgpaEfdJREwQ4ar9rDMjJ9hVD8Ye2Qut4rHqq3BU5RILu2hMbs5c7L3RbX1dcJ4Q3I
 yNC2WVF78BLj/N96eAq2bzDub2N0zQ6PALACAd619osr8mTJckwEU98kJs9+XMofQ1Av
 r/kBpZ9LxWGahCz8KbRsPBXysPKgN3GEYBuZR3dB7sHvd3V1xJ5FCDtqqGV5o37/Hasw
 94K5HTvHOT3k9OmiOZXn6Pdod3dFZwia2GI+ahP5F/rIQY9PJTN3oE5mOX2jfWr5CE3I
 FvOCrZ4YPZpKUKh0CcQcB5ssfMZeyFYZi7+MxR0DT5NrQuFib9COcib3K0Zhso6fNZRB
 X6UA==
X-Gm-Message-State: AOAM530VJT4WG1yJvissn7p6vgibGjn4JQmIJToavUdsdBduFJbWp+0R
 gp+1ACUA8VUH8eTwXOyqzgLHzvkyGemcv5hf+CIPzQ==
X-Received: by 2002:a17:906:3603:: with SMTP id q3mr47871ejb.382.1611849647601; 
 Thu, 28 Jan 2021 08:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-9-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-9-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:00:35 +0000
Message-ID: <CAFEAcA_MPkZ_5k=erNdh68wg4WWN2R71s4y9UKhbvQdWa_Pzcw@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] arm: Add Hypervisor.framework build target
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FLAD+W2DDcwu

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
>
> ---
>
> v1 -> v2:
>
>   - Fix build on 32bit arm
>
> v3 -> v4:
>
>   - Remove i386-softmmu target
> ---
>  meson.build                | 11 ++++++++++-
>  target/arm/hvf/meson.build |  3 +++
>  target/arm/meson.build     |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/hvf/meson.build
>
> diff --git a/meson.build b/meson.build
> index c667d64498..8302fcbd90 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,25 @@ else
>  endif
>
>  accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']

We don't support 32-bit x86 hosts so I don't think you need the 'x86' here.

> +  hvf_targets = ['x86_64-softmmu']
> +elif cpu in ['aarch64']
> +  hvf_targets = ['aarch64-softmmu']
> +else
> +  hvf_targets = []
> +endif
> +
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i368 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets += {
>      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,

This 'if' is specific to the weird Xen thing where for
arm hosts we build the Xen code into a qemu-system-i386/qemu-system-x86_64,
so it's the wrong place to add HVF stuff.


I think what you want is to follow the same pattern
as the KVM stuff, so just

accelerator_targets += { 'CONFIG_HVF': hvf_targets }

after the if-ladder where you're setting hvf_targets.

thanks
-- PMM
