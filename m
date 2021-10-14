Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4017976lfc;
        Thu, 14 Oct 2021 06:02:10 -0700 (PDT)
X-Received: by 2002:a2e:9891:: with SMTP id b17mr6010169ljj.391.1634216530464;
        Thu, 14 Oct 2021 06:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634216530; cv=none;
        d=google.com; s=arc-20160816;
        b=PCHNDTkz2loUH5o2srBdqWzPlqQ2iaiM+RNmx4SIuYMy4vWabk7ByqRq96YjIgv6xd
         VzpBpDpBXezQplgJumEGE7IYdsOn3aKmz8saq/7rHzSwi/cdzlTa++3IpVwWmKI6xp5i
         4lKQJJkRUi+1rKEHAFFpCHEgQqRYA/KKNYGKxbxqQSDBMJM11Nyl0cs6dpEckUe/cGS+
         6Q1FA9wqKWWpjZmivYevZz08mH6ZlQdhiNQPoZepEN5vuEzKWdRR3FHqrX+Ow1bt5qqZ
         91iuCW4Z8gNbcn5yB77Rp3CHAtcMevvrUH+0tUmKP6pnBVoUeBtFnrXFbrduj0LUX0ww
         jJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVv/5E+aGIy7AtFpmIH2uJcBNUgX7AvHJrI1vISAJQ4=;
        b=Qsr4Eck6CTe30BEeBAG6qfO4+bj07To/Ar+b8lUBpfjxnDu3iKY6vzBwArYz9+amVF
         xwgW9q5eOjOzUExMVpm420adVdwbqXYXTTdy0MgUBH64btjziZIoGHjQJ+nMNg5tEUNg
         21elElnpbkd74HmsuKwtMp9OU64egpQMXmOwj8Yibk1/pQGuDvOFznU+EF9cISYw23WY
         Ls0nZPJoZIh/EUfB/+rFhplu9UI9sDqc6Fwqnm1g7t9+C3l7LcHjCCgjZ/piPIee745o
         ZazL+86uZLtbWyRaJ7qyW/ZoUo3BYs7gO8LujRlLwIU7Iqx2h0BbTSiWbJd+WqiccDmv
         yqFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AawzyBoX;
       spf=pass (google.com: domain of assad.hashmi@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=assad.hashmi@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <assad.hashmi@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w11sor634093lfu.64.2021.10.14.06.02.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Oct 2021 06:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of assad.hashmi@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AawzyBoX;
       spf=pass (google.com: domain of assad.hashmi@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=assad.hashmi@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DVv/5E+aGIy7AtFpmIH2uJcBNUgX7AvHJrI1vISAJQ4=;
        b=AawzyBoXwnxZRATY4FZrrBaoUqGl1qAMVsssxpTfh8HJ1JGaN+jbkw7NDhj86xtMfV
         8hOGjP0xdxMV72EYRxibmhGZCNFInNzBBCrovzmlViXlHPygHHvpI3pccHxmPmW0JSi9
         q1p9M67aUZ8SxMJLa5h0aHYP4c7fnPOMCnSXhp3Bd1URiByQAkjihA3TGcJdMb6k6Oex
         0yDfAXHxdh0EHfxQQjRehM9jngy8LT30URRQ/h/GDRxXIMa+Pd3r83GqvdrbByaie1bJ
         Fhd+02AQD6iEw3tMPskaJ9Ryytnpl42bo7rE65yp7jpXbNWvRxaRBfgz2k+rjFQ3DYvl
         KiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DVv/5E+aGIy7AtFpmIH2uJcBNUgX7AvHJrI1vISAJQ4=;
        b=ZesDjdNeUeoCbqQgIFEBpAPOJaOq2OkW/YNzFC7TT7BNX9oJ8PYz0mBrOjOUNn1Uip
         KjsXalEmj4eSyz/lTotFT32nTZCoaFE2PU2j7eGAo//vEwC9NDlIMkMQ0Vbs9mrHIPEN
         YphlLYFZeywgTu+CFOky4gXCZ0/YLsQWb4dapE4zpOc2AtzjTQdrcCOrylmtOr2dp7Nk
         eIYATispPNX4h3+xDeUsFZ4DSmXznqZkweJ71TSdHvDe6a0e0qWqnmZLC5AfoqGEDaoX
         Gi9yyTJ5X7E0LT9F2YwlLLEkmt8T5RZAUIQTNdGZjKGjJP9EbFIbqaPPY0bMMVUclA57
         BM/g==
X-Gm-Message-State: AOAM532EMOCT/C7ALmnieM1KPJPYiB4XGFiHCBjNilHp4zq7G6dIfGne
	syBV6LpoOfQkz1BoBUcmkYjops1mcFBf6/5fJdVrsRaeI/JSIFMZ
X-Google-Smtp-Source: ABdhPJy8mwveF/2DHNm6VyEjPrUPiH4yoO614RysIeySIGgaNYGVLHoaBKxpiQSHkKjmjfLNF5rExS3OY9D5ENJYp5M=
X-Received: by 2002:ac2:41c8:: with SMTP id d8mr4879121lfi.616.1634216527104;
 Thu, 14 Oct 2021 06:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org> <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
 <87lf33dc58.fsf@linaro.org>
In-Reply-To: <87lf33dc58.fsf@linaro.org>
From: Assad Hashmi <assad.hashmi@linaro.org>
Date: Thu, 14 Oct 2021 14:01:56 +0100
Message-ID: <CAEVS6HrENq-J4q5H20VMK02zNNsSkQ4M5o2ntv4OHNG83wgAOA@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Laurent Vivier <laurent@vivier.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2HxNfD3gbVe/

> ARM's armie takes a different approach with the trap and emulate of
> SIGILL instructions. This works well for the occasional "new"
> instruction but will be less efficient overall if your instruction
> stream is entirely novel.

To clarify: earlier versions of armie did use the SIGILL trap-and-emulate
method, which was limited. Recent versions, including the latest release ar=
e
based on the DynamoRIO platform which enables full emulation and
instrumentation (https://dynamorio.org). By default, DynamoRIO and by exten=
sion
armie, follow all child processes, see
https://dynamorio.org/page_deploy.html#op_children.

As new Arm architecture features are added to QEMU, e.g. SVE, SVE2, SME etc=
.
there is an expectation in the Arm community that QEMU can run large Arm
user-space applications on Arm hardware, making lack of same-on-same execve=
 a
not insignificant blocker.

AIUI, given the open-source licensing of QEMU and DynamoRIO, there would be=
 no
legal reason for QEMU not to borrow from DynamoRIO.


On Fri, 8 Oct 2021 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
> > On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>
> >> I came across a use-case this week for ARM although this may be also
> >> applicable to architectures where QEMU's emulation is ahead of the
> >> hardware currently widely available - for example if you want to
> >> exercise SVE code on AArch64. When the linux-user architecture is not
> >> the same as the host architecture then binfmt_misc works perfectly fin=
e.
> >>
> >> However in the case you are running same-on-same you can't use
> >> binfmt_misc to redirect execution to using QEMU because any attempt to
> >> trap native binaries will cause your userspace to hang as binfmt_misc
> >> will be invoked to run the QEMU binary needed to run your application
> >> and a deadlock ensues.
> >
> > Can you clarify how the code would run in this case? Does qemu-user
> > still emulate every single instruction, both the compatible and the inc=
ompatible
> > ones, or is the idea here to run as much as possible natively and only
> > emulate the instructions that are not available natively, using either
> > SIGILL or searching through the object code for those instructions?
>
> qemu-user only every does a complete translation. The hope is of course
> our translator is "fairly efficient" so for example integer SVE
> operations should get unrolled into a series of AdvSIMD instructions on
> the backend.
>
> ARM's armie takes a different approach with the trap and emulate of
> SIGILL instructions. This works well for the occasional "new"
> instruction but will be less efficient overall if your instruction
> stream is entirely novel.
>
> >> Trap execve in QEMU linux-user
> >> ------------------------------
> >>
> >> We could add a flag to QEMU so at the point of execve it manually
> >> invokes the new process with QEMU, passing on the flag to persist this
> >> behaviour.
> >
> > This sounds like the obvious approach if you already do a full
> > instruction emulation. You'd still need to run the parent process
> > by calling qemu-user manually, but I suppose you need to do
> > something like this in any case.
> >
> >> Add path mask to binfmt_misc
> >> ----------------------------
> >>
> >> The other option would be to extend binfmt_misc to have a path mask so
> >> it only applies it's alternative execution scheme to binaries in a
> >> particular section of the file-system (or maybe some sort of pattern?)=
.
> >
> > The main downside I see here is that it requires kernel modification, s=
o
> > it would not work for old kernels.
> >
> >> Are there any other approaches you could take? Which do you think has
> >> the most merit?
> >
> > If we modify binfmt_misc in the kernel, it might be helpful to do it
> > by extending it with namespace support, so it could be constrained
> > to a single container without having to do the emulation outside.
> > Unfortunately that does not solve the problem of preventing the
> > qemu-user binary from triggering the binfmt_misc lookup.
>
> I wonder how that would interact with the persistent ("P") mode of
> binfmt_misc. The backend is identified at the start and gets re-used
> rather than looked up each time.
>
> >
> >        Arnd
>
>
> --
> Alex Benn=C3=A9e
