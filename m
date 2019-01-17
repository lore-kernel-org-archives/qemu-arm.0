Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2149906wrt;
        Thu, 17 Jan 2019 10:43:32 -0800 (PST)
X-Received: by 2002:aca:aa81:: with SMTP id t123mr8724495oie.218.1547750612825;
        Thu, 17 Jan 2019 10:43:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547750612; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqCu++khlwLKAI8DmRBU6RO8PSDqVKQVp1mZl3eIkpgjIciN9E85Yxp4sMzwUF8H+I
         KYR2f4m66y8M0T9dBYeNlpIPlY0fJpFFuPToZ74aG/CVlr/3cbSo7NNIfnNq22qPiebk
         N7IUqkihWZmwS0hE+qLxj+kdXQeMIVgxLSBwudeuuwWiNsEPdjK3wg9V28DOdHosFG5H
         rOBffTvsJ+2bJlu9ZgYcA5V2CLk1pkm/C2hX9m5QLCkGQxU3W4k/nvI/P2FHS+3OOEBC
         H1fJYJOnZpIjhm+pv4Waie6K4/NJsW3GUdurakMM+/Ad/P1o9mOFXmjl/FrTy+PtqJ2M
         xUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+3NC05mo4a39ZI45zeaorf9hA9zb+j5sNllbwJ50wlQ=;
        b=B9hComxM+iv+CteALK3GZQk9OAFK+8QLGweKo1TyXQFU17viaLr3B2ROC/yEnsu77Y
         C3oWyXOiEm4PX4Ukzy+HpU9Ph5dIe/tqsGXXlY7xb6fqMklMA55+X12QlNayyVUKI46B
         2jIfTOQNp89afDwZQOowPqoCE87kKgMC9VlbcM+ZXX94msNsZZKlsdh0RXTWSoMWpyHq
         dblVd7xPgHb4PabiX31+VYbBq1q6UUrrhYBNQ1nxoyOeKcCwKUHEffw7oBVqbbxIBipD
         7q0MKFlQnkBKIFt0S/XYtOktHRZfwtfO/PnfvZvyubfOPQI4iNAM+oj24rMsk7bF1BmY
         j/1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vxe0le5U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q20sor1188814otl.111.2019.01.17.10.43.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Jan 2019 10:43:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vxe0le5U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3NC05mo4a39ZI45zeaorf9hA9zb+j5sNllbwJ50wlQ=;
        b=Vxe0le5UgjQ27oevLiO9BI56CaPOH0KoUvY8AHxGb5JH+xE+jC2QLi2D9nsc7rUgbY
         xQptXlCMzWpT20DK7oCFA5pFQWlKqRehbTM8r94EKVAzRZtbyBb/3jnkYtg0LPlP5P13
         lhQHu5k9o3netkT90uWLm9uab7GK//QqckGQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3NC05mo4a39ZI45zeaorf9hA9zb+j5sNllbwJ50wlQ=;
        b=r/bVvXNWwWa09fzNSR6iHeprtedjOZCvsRSgraeYY9UF+o6G4lu9+ddBJHt5PycIKA
         DRcPuHOcVWww88BYSl7stPBH7NAGhaaOall1v0MuErIvsUW1iGMdR5qRPf5yaEPvfG6t
         k9YZKyzN1TR1WMVHZZZgS7wmBh3BUiiqF1+MrekgeRLTSXAoLQRwFTMmWW3+DjfUbqPO
         hxTmx8JZh9/BbFNU8rnagb+Mljj0o9zpiPXkayibxE+WfKBvolqNiWbdZplc/caLJicg
         j4Gg/i0u4fnlVxO+Nudd71KHh18/KnWV+wykKTq4obICl+OsyUpllwozTDhYpqBiVIgc
         kLTQ==
X-Gm-Message-State: AJcUukfPk5ycyMHe7xFJXyG8VK6CBUwABL3L6Gxyjv7QWG1+G6UAUmqR
	rsevdookLHeOnxb13H0kv60pnAOy1gXicwsiwo6Ob0mOdjo=
X-Google-Smtp-Source: ALg8bN6MhsoSeEWCGSKOrhaFZb39l1d3KYUKHlIZ0c3XenTFOIQLf3sbRavAde971iAEOCaRTfxM5Jm7ITBlnlrq8oo=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr8825718oti.151.1547750612400;
 Thu, 17 Jan 2019 10:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20190109152430.32359-1-agraf@suse.de> <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
 <CAFEAcA8Xzi8GjzUtzxbFzxdCS4kn0Cps+_bF70ZS0KnH0W8SvQ@mail.gmail.com>
 <92dba7da-f3fc-b7dc-6896-cf8d58cc7f17@suse.de> <CAFEAcA_sxvfHG6ryA4xHMfbwhDaRrF_+6xaef_0RqqH-7JESzQ@mail.gmail.com>
 <0673d8c0-16f0-49e7-f002-06491353cc6c@suse.de> <CAFEAcA-duBwj2-DG=dQLo-448ca--+C6Fu54avwEFQ5D-bwy8A@mail.gmail.com>
In-Reply-To: <CAFEAcA-duBwj2-DG=dQLo-448ca--+C6Fu54avwEFQ5D-bwy8A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jan 2019 18:43:20 +0000
Message-ID: <CAFEAcA8UxBW1JCp4ky-OxsAV1ip_rkRp1ZCb=bK5nwG5ickStQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on AArch32
To: Alexander Graf <agraf@suse.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, Tom Rini <trini@konsulko.com>, 
	Michal Simek <michal.simek@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: w+uFXfvE5E8A

On Thu, 10 Jan 2019 at 10:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 10 Jan 2019 at 06:43, Alexander Graf <agraf@suse.de> wrote:
> >
> >
> >
> > On 10.01.19 00:08, Peter Maydell wrote:
> > > On Wed, 9 Jan 2019 at 17:14, Alexander Graf <agraf@suse.de> wrote:
> > >>
> > >> On 01/09/2019 05:59 PM, Peter Maydell wrote:
> > >>> On Wed, 9 Jan 2019 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >>>> On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
> > >>>>> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> > >>>>> HYP mode. This dance seems to work ok (hence it's there in the code
> > >>>>> base), but breaks with current QEMU.
> > >>> PS: it would be helpful if the commit message said how u-boot
> > >>> is trying to go from Mon to Hyp -- some ways to try to do
> > >>> this are OK, and some are not, so whether it's supposed to
> > >>> work or not depends on what u-boot is actually doing...
> > >>
> > >> I don't fully understand all of it to be honest :). But the code is here:
> > >>
> > >> http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/nonsec_virt.S
> > >>
> > >> What I managed to understand so far is that it goes to MON using the smc
> > >> #0 call and then changes SPSR so that on return (movs pc) the mode will
> > >> be different.
> > >
> > > Thanks -- yes, that's an exception return so it's the
> > > expected way to go from Mon to Hyp.
> >
> > That was my understanding, yes. Do you still want me to change the
> > commit message to mention that or will you just do it when applying?
>
> I'll add a note when I apply it; thanks.

Now applied to target-arm.next with a rewritten commit message; thanks.

-- PMM
