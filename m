Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp101548nji;
        Wed, 11 Sep 2024 03:19:37 -0700 (PDT)
X-Received: by 2002:a05:6402:360a:b0:5c2:6a73:d13b with SMTP id 4fb4d7f45d1cf-5c3dc7c02d8mr16277225a12.34.1726049977695;
        Wed, 11 Sep 2024 03:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726049977; cv=none;
        d=google.com; s=arc-20160816;
        b=akjqIl6MbeD6STh8xBEJkZMu0oPeUF+orMo+7TEc3UlHtK0jAhqRdWxyeMugQ8dyEC
         Om9iTkAefOaL9hOvvr2HmBsew/R+wdBPu3hpIdadvtlN5lnCCC/L6PNoptzX+2dpZGL7
         CEeK2TKk6sxYCfvVxanqYj/Q4SIfxYfyb0IT+dC/xHY3hGXNAvnLkt8DKGiFfxMCX9IO
         L8viBI7llEzvleBs4HBMM8lS9ZdEkRSDK7uDwZU2gUny33+UdRUgfs3a8gA4YvS+0NTm
         w/0IDTuQBICJzsMrJob+MINTUbgtGoF/63+s2wghmi5mGcTnjp6RkNzrt2QrnwwrVff7
         cLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RJ9Rnud9ZGrPX9HKlWsgEFwrznga+AkXAbAK1v3BN6c=;
        fh=JtSB0LkbSaXiNrhJoxy/vkOfGlTYCBqabcuo3taEAos=;
        b=HbmcVXYIfR31ZaqiTjEc6ZolT4oYNVFP6uOODfpmfZAVmFuEj3R+0ENhRJXXsZn5HL
         loDRg5Oju5/xonBLl9o5vWvjyMkE2CWRMuDZIpYbamfc+Jwkc/MkpLOq2mkjrSrTY8E0
         ntg9o4jlytQ1lgveBXZ60I7zJ5UTUiN7V7BfZcBmgufmc/9Q5rnbevyNEidgalfLuQId
         KEWZngR3AsSbjNGQMDB5alJBsCBWxPk1y1GpNe/bwLSIkZMGWHswr2n9FwFX8PYb1Z8P
         V+hfsTaFOkgwgQNAIG2qToyt09iqyjEyRS3w4SaJGXdBxzymCmutTtKzBIWWkuYoCYVG
         0m7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpK3NUvn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c3ebd44b2csor915846a12.5.2024.09.11.03.19.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 03:19:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpK3NUvn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049977; x=1726654777; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ9Rnud9ZGrPX9HKlWsgEFwrznga+AkXAbAK1v3BN6c=;
        b=gpK3NUvnTb4MnYX6nDF2+b23etSSVwIWuG65bErgWZ87vk2FfjtjzdQCDrdXPbsIr6
         i1tcALHykuM0eGQOP5V+XeADYgwvip9J1ePSLtXMFVgCiVC6bTagFXg2FqyJpWmLRfd5
         GdyDSu326J4ikdT54nJ93CfiSlzwrnNnwaX43B4sCqsWTqaaMijIqu15ohcye645wxQK
         ix1AEoOw5RE0DqMURMTLfEaLf/x56ao106/99xxXQQkdr9tffVibcLpSnW5FcB9PLfe+
         82XwuWIQ4b087c7OEABpyWFd01E58MqiBvKPJ/y5pIdeIlhwGJ24BCsgMvnbyjPkRcgd
         JJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049977; x=1726654777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJ9Rnud9ZGrPX9HKlWsgEFwrznga+AkXAbAK1v3BN6c=;
        b=TVr+aOIZDiXBPX3IJQ8A/daxZvHs3HBdgd8bYo318gj2zSf0dFFvscAMiNhUhLI8Pa
         I0uYb9Vmsu3Ih/Y0HhZ9HcMY8l43LOcgnbBAlaMulcAbK6ip8r70obhG8F5NXEbtmGrw
         V4ZkFZ1lpBBU2lfje34mfaLEzU5Wx58mzZpL+Ydz7SHhC/XGDP8fdWFW2H4BKkDr111R
         o16C7rOiFKDXZXlcX6Tuu+nZ9v0E4/fFVgrrZB2SvMSxoPkZrSlyY1ZaJAvpU5xkKB3x
         EdcYAJuqVbs3fhZv1B4dp7G7W2TJtYtV9M+uUQUF6E0vvwzm4sMnAwJ978ymQQD+aYL3
         pJUA==
X-Gm-Message-State: AOJu0Yxq+ya9CDkgaX0J5Q7rmrKE4DX9S25Xn25itZFLILc/tfDLU9a3
	IVJ2xS99Ll9Lyne1AFYvMxKv9A2VMpIbimxjeKQvImR8XliiICgUchJhpX0ex5EfD9F8zajBkoR
	/CZgO+L1TkYnnxuVO976cphU8zM8iq+EM3B0UPE1l
X-Google-Smtp-Source: AGHT+IH5NeluPI86CQV9NpcDpivwCARU1eNdE6f3GaRJf9ZtztSoAtNIqT0mCrzMXSj8FTOhD3pH7sSBR3pT75SieEs=
X-Received: by 2002:a05:6402:210d:b0:5c2:5f24:98bd with SMTP id
 4fb4d7f45d1cf-5c3dc78b665mr18465692a12.10.1726049976913; Wed, 11 Sep 2024
 03:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
 <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
 <CA+1FSigqsAx_s+-_eP0GtSi7Qq6Vcou12gHcGZwqPk1hhnXXwg@mail.gmail.com>
 <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com>
 <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
 <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com>
 <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
 <CA+1FSih+6cHb5c9pA-79ZP1Qvd=xTTNuVZm+Q66be3NuM8gCJQ@mail.gmail.com>
 <CA+1FSiitCXFhbdWH15razOYyXp7xAY5ScmV3ZRCePqrZ_FdaNg@mail.gmail.com> <CA+1FSihfdrfth=+5xgmmsr_4uOEgm-hhB7i6_8mMeby4OKbC7w@mail.gmail.com>
In-Reply-To: <CA+1FSihfdrfth=+5xgmmsr_4uOEgm-hhB7i6_8mMeby4OKbC7w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2024 11:19:25 +0100
Message-ID: <CAFEAcA9rHJLqi7CxhNkAz+wwFmkKnmVUCHJmkp_8Vnu=OQh=Rg@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Mario Marietto <marietto2008@gmail.com>
Cc: alex.bennee@linaro.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
	qemu-discuss@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: nLVMTN5gQie0

On Wed, 11 Sept 2024 at 01:02, Mario Marietto <marietto2008@gmail.com> wrote:
>
> Hello to everyone.

(Please trim your quoted text and don't top-post: it makes emails
a pain to read.)

> qemu-system-aarch64-headless: Unable to determine GIC version supported by host

This suggests your host kernel is either too old or does not have the
VGIC support compiled into it. (QEMU produces this message if it
asks the host kernel "please create a vGICv3" and that fails and
then it asks "please create a vGICv2" and that also fails.)

-- PMM
