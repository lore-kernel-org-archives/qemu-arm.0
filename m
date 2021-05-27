Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp156517lfm;
        Thu, 27 May 2021 02:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylRx0S+3TtAZq7mT0RRB0vvzSKSmJL/v8qWE6JbmE7izxZgD4PcMeHCOIXmVohszNjC0Ol
X-Received: by 2002:a92:d290:: with SMTP id p16mr2121640ilp.80.1622106296833;
        Thu, 27 May 2021 02:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622106296; cv=none;
        d=google.com; s=arc-20160816;
        b=ptCfJnWyYEpKNh2fD2CBMdj10q6MZO/YsBEPHqoclK4ORYz/TRQHuYxm/DUAI3kDVi
         HNLIyFNFjmBRAaUyQEOix3ZKOUODrSQmiPNWjBlpEd9jIhVR3vTEMinf9VlsJ5bNrnML
         WT2zquFENWAx6Eh7OR6YXEEz1ZF4ig+wiqcwcHHJvJGxaV1CgemMTwYfY+vk9UeglIqy
         gDW+ag/azLU9toXRpdqn5NNo+bpw/vMqxnS+fqmcRe00pqb0MZbOf23ivMsuKe76Tc01
         lHgKXeG0T6haRsZCsMutbzUbtNL0uF1pTm/LmRitjruyYQph8gr17Y7YRd3YSjm4c5n8
         bHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=j1K665DWN4ZiKQztmxe9q0N6SGvqyosNgZAisBnHWWA=;
        b=j00F/XYultTYyzqNRSNffoz9yyfI+7DucDBx2jIpRzzGsryZUvUJrYSamPFL9mtNhZ
         PR/VY+9z+9uFM//cKwfNNf6KH/82wmAUwjjjNb2Y1w3b5r+cDN3njhFVK9I4opnipT1k
         Y3G2hdE185CXXtai+Zzbv8EfyJk5n41cyxQMuxnnu0F4ZDl7/iW1T7zC/7vxCftprjzz
         5cabO6hCFXKhsmFpGbP17VWR/EummEDENrUX8ud4wZvyO4fQOTlrPGRJxaKERrXrQI5b
         8GXAO7idNsG1PbNdIdv5ubUusjBRnh4xR36NdSQaCpuA3p5qvDej8PybqC36Hf4L2m2r
         b/LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s+b8FjYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si1686505ilq.106.2021.05.27.02.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 02:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s+b8FjYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmBwm-0000ZV-5j
	for alex.bennee@linaro.org; Thu, 27 May 2021 05:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmBwd-0000Xd-LM
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:04:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmBwb-0000xz-Te
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:04:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id r11so4831728edt.13
 for <qemu-arm@nongnu.org>; Thu, 27 May 2021 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j1K665DWN4ZiKQztmxe9q0N6SGvqyosNgZAisBnHWWA=;
 b=s+b8FjYIR92L1aTOa7NEQqanHqqphs6s4KeT9uXve/VqVfjcXGlG4qBAPvi1ylrcfG
 n2wqkugHEbS1m51HDPborn2WjbjN768DRzZbS0teNcFnwTCh+Pw3BWG9Uk25k61c62cj
 Te52VtckUdCVwjsPryoHt+hqbq7omna9S3rsmJv8kRxK6gaf1WUmqOS2CPYEwKCfWUI6
 T1cMh53mvmVPljoH82e3kmwoJCG7UN+pV/8L27KzfC3eoVCMyOKsMufE4UdPfN5LJm/o
 Je+EtEq2dW6gaziafrr/HDcwwqbRDX/A5cMrBI/O+9q+FY3u1RIVkkBGDCxPIzpXBMM/
 B+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j1K665DWN4ZiKQztmxe9q0N6SGvqyosNgZAisBnHWWA=;
 b=WZZkNyAPKzfU7tmL3PN7GSmKEU2HTcRNKd6EhTJMh2DD3x08UFHClzsJm7WrnLs6S0
 3y3K3HfxGnHb4ocfHgmpS93ShEwciBs5lGtMzoug/cgD3hL5qDsBGHVkzf4z8bpNYv2r
 0D4QvNPGLWuY9sax1ywgDX2R/ucChu5df2ctrpJgh/WoFHxWJGT/G/MU9px4iEKwjf9w
 d/sfCDs7EgP/bH6nkIlO0MtQegELLNRgqG9/gn5oUHyw3Pg7wdHrJ1z2Kgjvp8gK1fv7
 Ic4YA+bHwcZOeAJu107iijZjRIa9xZBd6bqrTYDcnNraUD1L689ZP5DoTD+mxXP7GTQ1
 UgNQ==
X-Gm-Message-State: AOAM533DWfP1aVrHNU6dLhLzTI3NC0rhQNorhPR8UJtPaGXpTiNT1kI4
 GMH35tsZc8+L9U4cucVYsMStqYrxTCfyur1F6GNYJQ==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr2924467edd.251.1622106284055; 
 Thu, 27 May 2021 02:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210520051542.2378774-1-f4bug@amsat.org>
 <20210520051542.2378774-2-f4bug@amsat.org>
In-Reply-To: <20210520051542.2378774-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:04:18 +0100
Message-ID: <CAFEAcA-CUvV3G+C_cE-1sQNQAFpsv2W=VYsoufr28VB-9cRiTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/arm/boot: Abort if set_kernel_args() fails
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5xb1+uFS0Gpb

On Thu, 20 May 2021 at 06:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If a address_space_write() call fails while calling
> set_kernel_args(), the guest kernel will boot using
> crap data. Avoid that by aborting if this ever occurs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> @@ -786,10 +811,16 @@ static void do_cpu_reset(void *opaque)
>                  cpu_set_pc(cs, info->loader_start);
>
>                  if (!have_dtb(info)) {
> +                    int err;
> +
>                      if (old_param) {
> -                        set_kernel_args_old(info, as);
> +                        err =3D set_kernel_args_old(info, as);
>                      } else {
> -                        set_kernel_args(info, as);
> +                        err =3D set_kernel_args(info, as);
> +                    }
> +                    if (err) {
> +                        error_report("could not set kernel arguments");
> +                        exit(1);
>                      }
>                  }
>              } else {

Since this is in the 'reset' method it's in theory possible that
we might end up exit()ing here in mid-run if the simulation
does a reset and the second reset fails but the one on bootup
didn't. But that seems pretty unlikely, and in any case this
code is all in the "booting Linux, but no DTB" codepath, which
is nowadays a pretty rare case.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
