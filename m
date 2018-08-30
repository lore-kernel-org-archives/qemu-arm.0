Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2007815wrd;
        Thu, 30 Aug 2018 09:43:30 -0700 (PDT)
X-Received: by 2002:a02:5c46:: with SMTP id q67-v6mr10064790jab.85.1535647410557;
        Thu, 30 Aug 2018 09:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535647410; cv=none;
        d=google.com; s=arc-20160816;
        b=fxDqsZOjJTyzqmQ5em4yNF14SVV7wiurGK6bRxgY7mYrTMuzRXarPQ4yllPRKOxvg7
         7QYps7xQ3VDzMKiuneL7Ut9bW9dbrrvILKd+LiPOcU+qzjNq27NzOmfBqcND+U1lI/cn
         3zFlr7nRweyYYeYh7XjV84Yu0+fgopLiT27xzxhJibsXYn36jjFtf1Odg7dO6OW+bBSd
         Fxf39SqF8cBfOWwwmeLL3k+AZz1uYAEpVQumxGZ33CyjeM+zMfV+aLLYyJjn5czfNao5
         xZjrSdKOOXjfaX39KfUyHuDt+fbkZTaG4/KgvvCZGFXgHWSN8nb24cmTX3DfzBpEfP6G
         7IdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=4vy+S6sxPYl0pdyaKTHjYTS/wth9J9vGNT/q961StUo=;
        b=CE+sZN1nJMx8kBYQjVPYdtPYv58nB0/9yII7bjtQhGKHQmblzJ5189FRQjDLLXZM2q
         mgqhqumrNek2U7MN6XYw2LsiJHs2caXXA22qmvdmUqhdTWKw/G/lS5zL4Lhf4Cgx9bu6
         WyT6DYuYaMWxwBE4OGwSbj1v4BfJMEm2kvE5Tw7iiKSXoEGrsvzVHVHtwuXmAAZUg3d3
         QWm860M7rH+aYEbBTwsNyY9jXwBwLI/DiHjy8cP2jQY+S/fzFUWj/xRsDx2BfFnKFheh
         u67xzMCelmKzqMTw1ROj3sZPW2tmOCP96maiK248OFKM8RgQXsoou3os7NjWOySQ2fS0
         dPew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e2MKFsoI;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b82-v6sor233215ioa.253.2018.08.30.09.43.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 09:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e2MKFsoI;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4vy+S6sxPYl0pdyaKTHjYTS/wth9J9vGNT/q961StUo=;
        b=e2MKFsoIa5ct2uc/Nj8tkeL7f+eqRCtsp7eb6saiObDLPBl1FcjVeDYxmcHZXrfmht
         RJI1mr7KWN55+ckOE/+pxv4vRkFinTFCBCVpNnAlM+n7Tpuxz2v/iM+ESD7RWJM1uQjZ
         WvdmcTo46sMTlFI8ExDBkSrAgeTLr2Y0VoFAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=4vy+S6sxPYl0pdyaKTHjYTS/wth9J9vGNT/q961StUo=;
        b=G7xsP0QjVG28x0h5YSPFuuZeG722vQgOimMXJbO51IVkq5dyw1R5p5wpKZBll/ZYf5
         JaB7p4UYFnKL5Vsc3vXq9Y4XWWO/YVL1uz1Lpi3gX+KjgQIPsUdMoFKw04YcbZj6Tjcf
         M8J3GducHg8/BVf6QilOGe4ZyYZFPKOk+2ez1Mr5Zmr4thZz/c3Yt+xktagPNpDBAQO4
         GYuXQ8JSK5Nj72cLpG+BSwxORBaqc1nhRcTajOk+cF6+ZEvwFkA7R1N5szBlhlIdr1is
         lM45SOw1zy/UX0yw636v/nAqY1sAdWqX7EJu8f9a/+vNsvNgK9+RaqFN2JMoH75IUcXt
         9ohA==
X-Gm-Message-State: APzg51BFCXvdRp27CttrjAosUP4AWkBKPRIavIL3FEGP7Mzpb8y9gPli
	xlkagUc4gm56CDr1iVs2KhDpMCM2JP+ZlLEUHOKNdrtJ
X-Google-Smtp-Source: ANB0VdaTCAjWzkZtpTgJ83NiG2PAPP3PXOSkvlppSUXv+2HSScrHxChOrfz3VWOrjYS5zA7iaPIXfCrmPDlCXfooyqo=
X-Received: by 2002:a6b:be83:: with SMTP id o125-v6mr9666268iof.173.1535647410227;
 Thu, 30 Aug 2018 09:43:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 09:43:29
 -0700 (PDT)
In-Reply-To: <CAFEAcA-83-mQAbAvsypXBjFRD9h_St5Sjy+ntAc-jyZ7uDssAg@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net> <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
 <CAFEAcA-83-mQAbAvsypXBjFRD9h_St5Sjy+ntAc-jyZ7uDssAg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 30 Aug 2018 18:43:29 +0200
Message-ID: <CAKv+Gu9SLMLrG1fQhF_qFpLWqa4dDn4DrXNqVvNbhi_UnSJTZQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vXblzM4v4Fk9

On 30 August 2018 at 18:36, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 August 2018 at 14:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> How exactly the firmware figures out how many CPUs and how much memory
>> we are running with is out of scope for this, and so I don't think
>> there is a need to build something from scratch here: DT will do just
>> fine, given that both EDK2 and ARM-TF have working DT code for these
>> things.
>>
>> fw_cfg, on the other hand, is unsuitable for us. Generating ACPI
>> tables in a different way from actual bare metal is not a good idea,
>> given that things like RAS interact with ACPI as well, and fw_cfg is
>> also exposed to the OS in the default mach-virt configuration. So we
>> could tweak fw_cfg to be more suitable, but I think that does not
>> improve the usefulness of our prototype at all.
>
> fw_cfg is an entirely generic transport for passing named
> data blobs from QEMU to the other end. You don't have to
> pass ACPI table fragments over it the way we do for
> virt and the x86 PC platforms if you don't want that.

Sure. But the point is that fw_cfg does not really describe anything
that is useful to us. The information that we need in ARM-TF, and
-directly or indirectly- in UEFI is currently provided via the DT that
is passed in memory, and at the moment, I don't see a reason to change
that since it doesn't conflict with the goals we have for this
prototype. Relying on an emulated device which should never exist on
actual hardware does.

> It's true that it's visible to the OS in the sense that it's
> a physical device in the system, but so is a hardware connection
> to an SCP.
>

Such a connection would not be exposed to the OS on a arm64 server system.
