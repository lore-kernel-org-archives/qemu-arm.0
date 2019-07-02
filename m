Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp3838968pjq;
        Tue, 2 Jul 2019 06:58:49 -0700 (PDT)
X-Received: by 2002:aca:4d84:: with SMTP id a126mr3277176oib.23.1562075929208;
        Tue, 02 Jul 2019 06:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562075929; cv=none;
        d=google.com; s=arc-20160816;
        b=TK5ch7lFgble/JHUDO3ILCuKLMhT2z/5eBWOi3Uo4ocBedZqdNgmGhWCC04AyfOUlW
         kjSPRKcfy/vUc08hNj+FRf2W8k6vaS5O4t9JmlULLZvFNSbdgHpbygTSmgx4uJNTd7pf
         h9NNjO467vIrJJzxxqoPpwRE/jBUeo9996o790OzmpN0SCDvGnZiW+258TFiCz697/Yn
         24YLWxSc29RiXstlFEb2891mWa4f2EiCeYSE8qqWEaVt1cASc/PT5RuCppj89czeo7s5
         Gigf9cShRl6hTIluH1DiX4AT7K+jcSxMID7A+gg5hh7vYsndeDGWHiX6QaGuCh8zb083
         pgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+jHy48iSxspioqGS3Ovjl+wHzVcWi4HmsUkyeKtm5I=;
        b=BYOahFN8CWyJKIxSs/YpbwtMOQmntkoHyiAcGE6QqV3vAyXe9pMSpphd46EG3t3l6B
         7RDwuPlFnDssxTSwc9RXWXoRkX53cXo1VzMGyALQ3WfwZO/WfHpjbih8y3DYDP6dHgsW
         7xWPJ/8eNVI3fQ5O4+DIhQqXiLHWitfbU3btjjYxL67cSaMu5fMI9eSfFvq2xtiNbI9h
         ta3AjBxMzFPZp/eZxRp2h40LdNvlj9m57dcqISHrEFGJKxu6ICVH8ASMb0WTpCmO4hza
         PY7T9P412fBgibsiIJUbs8yH2UGnAim1Bbgm4z10SgGbUjIDJSKgybF2T9gGY5hBpZ50
         PRfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nG/S20r/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r13sor7387990otk.62.2019.07.02.06.58.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 06:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nG/S20r/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S+jHy48iSxspioqGS3Ovjl+wHzVcWi4HmsUkyeKtm5I=;
        b=nG/S20r/iguAF4sFMgx8Uoy6AWQSopVOz2nhUjGOncE2JRmfkNJGwUxX8C4DQ3/W2U
         hexwMOZ/2c5ap0wzDhEktzWuvuo2y3oeg0ze5Egra9KLmK/j4vGpgZ/pFL+vHg9dZNuw
         3z7o3P/P9+BRI22NJVRn9jPPF4weJA9JGetuWP1v6/xs7LaCEbrwD33u290kHQ0XRYTQ
         5vUk9I5FIXzcjfrvN2g5nUR+7zSWu8kzoW1bVFpjqn3lyv6XyMMVRGEK/ropBlzSJDDA
         QX5v7dD3dTyrrx2AtFGmzEH3xtBbdlPxLQGPJHMNEQFK+/SFzi2UyuCckwkRJFU1V3NY
         dlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S+jHy48iSxspioqGS3Ovjl+wHzVcWi4HmsUkyeKtm5I=;
        b=c+LCfDAH0Ref1Dy7emX/hZ33IXUQ7zv5t2diW6NQBoEFsl65g+FwFZYv7IenTo9cEH
         iQkq3NjaWcpEMirD8I9iRbHgMl/7B94718GlkXGagZBeoFCYuXmJd0VlKTwDirw6ITsu
         lvzmGahzRHX9rn/BTUL2Hf57gVfxv41FWOuSwsalPXoQtvUBg2yumFCOGhyBE0A/j3lT
         cv8dvkW5Re+KU0GxujmlewGKxGq494YJqfH6D57T7bhvp5sxvF8BMKzlgUhLdjbAP7aj
         g00hGtVKkEMNAhSx4gvZDc73WTfDu6A0bARWAYCJGOsy3MGY/hFps+EbUsA8nvff346z
         zb2g==
X-Gm-Message-State: APjAAAWj5ahDM/bZCPtNyjBBkw2cLxQIXTYf4aFoMPuSDk0e/MsTVO6d
	oYLptvvo9o3TquKXkmLQ034c2S4vCRxjH2MTqQzov/CcfL/o+w==
X-Google-Smtp-Source: APXvYqwcE4RPq9RDLvCdgHY2TC+CAMUsuI3/1rQwte61yIUvinTXNyhddPOR79QxhoN1sYIuc5AbkstoyqUcwMfiyDw=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr25110572otn.135.1562075928909;
 Tue, 02 Jul 2019 06:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190701194942.10092-1-philmd@redhat.com> <20190701194942.10092-3-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 14:58:37 +0100
Message-ID: <CAFEAcA855a+_uKWhF9pN5DyArD3g-YEYbQ+7hwMfaVAOvBYQxQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] target/arm: Restrict semi-hosting to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Andrew Jones <drjones@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: r0QJY+v4uBDr

On Mon, 1 Jul 2019 at 20:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Per Peter Maydell:
>
>   Semihosting hooks either SVC or HLT instructions, and inside KVM
>   both of those go to EL1, ie to the guest, and can't be trapped to
>   KVM.
>
> Let check_for_semihosting() return False when not running on TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: inline call to g_assert_not_reached if !TCG
> v4: fixed some ifdef that had moved in the next patch (Peter)
> ---
>  target/arm/Makefile.objs | 2 +-
>  target/arm/cpu.h         | 7 +++++++
>  target/arm/helper.c      | 8 +++++++-
>  3 files changed, 15 insertions(+), 2 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
