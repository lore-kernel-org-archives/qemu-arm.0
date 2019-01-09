Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp843547wrt;
        Wed, 9 Jan 2019 08:52:45 -0800 (PST)
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr4727426otb.253.1547052765428;
        Wed, 09 Jan 2019 08:52:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547052765; cv=none;
        d=google.com; s=arc-20160816;
        b=HEsP1dGpHpD6HAPY3yEG5PBCqEOJcMfdt7hN8FbsJxjEtKqQ79n1CPpU9dAAPxhNxz
         z0eIOqqY4CWy5zXtVkLgG2R+bhzcjLGMUzuLgipES81mWFqJSXq4tgUBaYMwIeyF5XnG
         Cf56kRJIazoHNtescFV40i7UfSsdyBFNto2/AiX74geMD5TVZ3zvmVmAQBcvYPaw9oEe
         Zef1DwC6ENTTsGBmDZW0r8LE/rPqAzsyFYHxZSAuMia3Q7p6eDubDbq+eYQjC2ngdXW+
         QfLSuFu6gIbrlIhj2aCaoE4+Ed+JpSrd78E8HVTeev71NHPLnN8y9/x/hcqfXRB5gYUM
         tuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YwMfRa0waeg2FY+c/iGV19ZG2AlTagjnn8EhGOfuUmo=;
        b=WAbRucXBzx0R+C9Jiixbw9uEgJialUtXfy2ESIvLTzs7Ldm7b/crXTgA6Ghyb0sF/m
         lk2A41KKEnv3c0a4q3LKvFJy3E4HKUqYUgdBfetpTGEZiTYG77bW1vsY+zpBwGSLZKYz
         aQyvQnjdzXBxmD9wfLstksuP6n/b8ddZ3VX+MtQtNXkOQ8W741ZYmdWU4earltMuWA+C
         tZR49QThenmTUVPpXTo/+TYf8jc7KY8wylkadT88XhirwIcB+INBBnOmA4QI9gslnONv
         cYvr+cwS/aRSuve3J6Bm2qUh4zaNvdFVPhRsObdxBwsWu0OBCqXf6YPuan+a31TjIW+8
         NdNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyn+PHLc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c5sor38604856otr.19.2019.01.09.08.52.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Jan 2019 08:52:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyn+PHLc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YwMfRa0waeg2FY+c/iGV19ZG2AlTagjnn8EhGOfuUmo=;
        b=kyn+PHLcekLJFrxMmGRbnWmoa2ds+iFChpTU0Y2jsGcNSvyEBp/4ixPogHpyXHGd56
         SeNBzDtC1OTshquN/mnhvFwizM/FSbERRUUdBdq4mZk7mRrVJkhqOwjJSQRZesDYA8Um
         V/KjuwPrqvMa0ahOUW/9dGEd5LYytswhad1Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YwMfRa0waeg2FY+c/iGV19ZG2AlTagjnn8EhGOfuUmo=;
        b=RYtqaIXhlY1fhi4hkI2J3Xt6yoer3G4giMijBzMSVRF7cNW7kbD+Mtbw7tdQIDU9rU
         2gM0IlvmcNNyJzN0i6Bc+LGY/3Gg8lAigXS7v1lIhumYU3M/o+YLBzRnJv8cUK6wUlyJ
         qShQVRAAcNZc1DludzmkH9P2QhBrmy/Ej7MoFIrmmCZ7WoNMp5emk7AaFzUvn8tIBvRh
         vpIZeEOcitZ+OKO20WcXmqKYi5U1mihyEzvfNFOl27l+MNNwXGXKevCytM0M97/MiktA
         MCMlixzsXNcIghqlmM4qarL+9cEsZigf7HYsTGGp3AmZkQrSfsHh+IcWPIgxtyWy7UsB
         ePLQ==
X-Gm-Message-State: AJcUukd7ZbS7CiuNUam4U5qa57YtT83LcP0C3SWE4wfDDbLYuqb685Bm
	o3iA5dBdrlbdsnhb7ATX85duyrzSvsMi0DrSJcX6zV7qElluIoG0
X-Google-Smtp-Source: ALg8bN4sVsT1cLCtYG9s2EyrTkGoPq1qfq5Vy5s721pAyhS3Cxj9xl+vPEEGTnQzNg90D9HajX/Y5PLrHfVu3gVSjyA=
X-Received: by 2002:a9d:6f0b:: with SMTP id n11mr4215103otq.363.1547052765005;
 Wed, 09 Jan 2019 08:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20190109152430.32359-1-agraf@suse.de>
In-Reply-To: <20190109152430.32359-1-agraf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jan 2019 16:52:33 +0000
Message-ID: <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on AArch32
To: Alexander Graf <agraf@suse.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, Tom Rini <trini@konsulko.com>, 
	Michal Simek <michal.simek@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: zIIstS7Eb0eB

On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
>
> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> HYP mode. This dance seems to work ok (hence it's there in the code
> base), but breaks with current QEMU.
>
> The reason seems to be that we try to see whether we are entering
> HYP mode from the NS side. However, MON is always considered secure,
> so we always fall into an error case when going MON->HYP and never
> manage to actually do the switch.
>
> Fix this by not using a different helper function that does not bork
> when we're in MON state, as that switch is supposed to work.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f00c141ef9..9bf8fbd8f9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6297,7 +6297,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
>          return 0;
>      case ARM_CPU_MODE_HYP:
>          return !arm_feature(env, ARM_FEATURE_EL2)
> -            || arm_current_el(env) < 2 || arm_is_secure(env);
> +            || arm_current_el(env) < 2 || arm_is_secure_below_el3(env);
>      case ARM_CPU_MODE_MON:
>          return arm_current_el(env) < 3;
>      default:
> --

This took me a while to figure out, because the
bad_mode_switch() code is called for doing checks
in two situations:
 (1) changes to mode by instructions writing to
CPSR.M (ie not exception take/return) -- this
corresponds to the Armv8 Arm ARM pseudocode
AArch32.WriteModeByInstr, and using this to enter or
leave Hyp mode is forbidden in v8 and UNPREDICTABLE in v7
 (2) changes to mode by exception return

Changing to or from Hyp by writing CPSR.M is
forbidden, but we catch that already at the top
of the bad_mode_switch() function. So what we
need to consider here is the exception-return case.
An exception return from Mon to Hyp with the NS bit 0
is OK. So this change is the right thing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
