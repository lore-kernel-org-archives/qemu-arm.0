Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp293347ejc;
        Thu, 5 Oct 2023 06:00:38 -0700 (PDT)
X-Received: by 2002:a05:6870:968c:b0:1bf:a44:364d with SMTP id o12-20020a056870968c00b001bf0a44364dmr1439800oaq.24.1696510838503;
        Thu, 05 Oct 2023 06:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696510838; cv=none;
        d=google.com; s=arc-20160816;
        b=z/hpFazkGTZIKu7wKmu6VNF2SCE1DdM8fA18UDaI7lmYKbvXeWuIAtMU3pt/xpXNpo
         8pWQ7qUsPLO9E/PtAbLUjYEbJ5Tq7R77PUwsLLbC2QVcoi4U1G39dpBGCPJ0lY0h4RsZ
         InkN5o/CDkkEMXkV9AAgjgP4/VK0jvanLxh4YdSlZ8pCVgwfS/QUshtw3sSm2VdirmKJ
         afsfUUKO8aTEQtknKy6gUz+2rtftZpBNJ/O3LiQqo16adfoyMbTSf1ixRClxwqhoKtFC
         BQsz/z3DcSYL32EA32rUtQFUt33TNwFsTEqo3oATavswmTVQE1sIYMMVC9KNRo2jZQXt
         YMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/hry7yvsrUX9AY9lc7Ad7j6izjLZyOCwqbTVZ9IttW8=;
        fh=oa0D9yREG4fCUQWS8RBJVKyn94cvfBk+K+sXubDVypc=;
        b=WwLi1flu6yLvgPPluSeDD34/+EgOf5Ype73AEQ6Z1Mk2TU5V59wkNOmsQT60ILGgPK
         P6Wp51q+DbqeRnnuUS2MzRQDVc/oNDEtJ2IiNETKHFv4RolpioHfXCmTTrv3X/6s93/8
         SBDx+rlOKrzpEYh7waX1WDafXUG1N7d7Ngw2+t7i7NxHFR8E6s31cSbllkjE6GzreuMe
         AKgvxywSgwMbjvyhikoP8rH9lOQKoo+kX0Ktvte5TUrosaYjZt91oeUPTDFWNQUo2b/5
         jY2BhxKKe1/Yzmqv2SWQccI1jFGAxy9sAcQN5alZhv4J0ceg2h0/o5ENQuC+hH7sT20D
         kcAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=f14x3vG4;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kz19-20020a056871409300b001dd947281d5sor1524775oab.0.2023.10.05.06.00.20
        (Google Transport Security);
        Thu, 05 Oct 2023 06:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=f14x3vG4;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696510820; x=1697115620; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hry7yvsrUX9AY9lc7Ad7j6izjLZyOCwqbTVZ9IttW8=;
        b=f14x3vG4bnpntsSA1ft5+LZyaiyJnet/mILdPiHuHcM4caxAmxncDyl610oN9XPz1o
         OpCr3i/8d33ODPDncrwPt6ELOM4/ufP89Vsr7E/lP2VTZ1/M/Fi9L0QXTwQTm8Ujg1dI
         4WSS0919osGaDp2QcWRjWbWuPb7vwTerBeb2mNkygwqWPdawwvepV6RWlyAWgxhC3AMi
         kXKmEwVv0cl4ZwDYxxDv33Mew+ZpCe32Fk/gqGr+dwoerqUaCKWFkbzxwRScQZAExEQX
         o8r/Y1ao8xQyciUBZP3cYUTKaMJQX6wXtT42bstVf18gFwW/GH8iygBthQivUDHoDjNm
         Kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696510820; x=1697115620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hry7yvsrUX9AY9lc7Ad7j6izjLZyOCwqbTVZ9IttW8=;
        b=oJ2jrTPdC7TQJ/8taStUqS1TTouQtqbA+CgN4SobZnigYS2qeGWdB1/UmRuwXRoDRu
         sl9CbCdJqUpsQgpYXxK6bYMcAK1rMO5y1igdUCdjn7JiO01ZhBs17RKJqlPCMYGn5n1S
         Dt92mH/LZhMLTSMAuY2UGYKzLGZN/xBBwovgvdLKCCXdt73LDq4vngTWRfxjM3Xod1L2
         ydkQ9sct3fDJKJ7QqtpcAndKl2VUk9hrAIMdOH9B5b/lGWAWINU6BCI4NI6bN5/Tjz7t
         A5dXT5FLN3Y8nP+9sIgkRuuOLE+6ztUHxuwX6Jwsw6QZU2Bg0Df2dVl72q6VE9VN6Xdg
         s5vw==
X-Gm-Message-State: AOJu0YyqwSwzuu/dqgf3aph4gMxKcVYmMdI5/vPbqH4gU/Q/PXUvYNXW
	12cIRmJx01JbGHqtSyfN2i5kEOSDjduHtbKQGtr+FRQm9B4=
X-Google-Smtp-Source: AGHT+IGmaFr+QMQU5ZEENrMaJ3T3MYfr5AxPq5UnmExBjnkMtHGqpPqdxWkFZoQJkvjbY5ljpubLq7dUTGV/D97fjJw=
X-Received: by 2002:a05:6870:2195:b0:1dd:611e:d404 with SMTP id
 l21-20020a056870219500b001dd611ed404mr671355oae.21.1696510820195; Thu, 05 Oct
 2023 06:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231004194613.2900323-1-jsnow@redhat.com> <3984cd72-931b-fa9b-e7ac-3d60487ac442@linaro.org>
In-Reply-To: <3984cd72-931b-fa9b-e7ac-3d60487ac442@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 5 Oct 2023 09:00:08 -0400
Message-ID: <CAJSP0QUYd58Q03Ugm2ULh=aiA8jUni2XM0aZAvxE1CoYbaW5cQ@mail.gmail.com>
Subject: Re: [PULL 0/9] Python patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Hanna Reitz <hreitz@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, Thomas Huth <thuth@redhat.com>, 
	Eric Blake <eblake@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WxpM+uZDD5ev

On Thu, 5 Oct 2023 at 00:49, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi John,
>
> On 4/10/23 21:46, John Snow wrote:
> > The following changes since commit da1034094d375afe9e3d8ec8980550ea0f06=
f7e0:
> >
> >    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into sta=
ging (2023-10-03 07:43:44 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> >
> > for you to fetch changes up to 4d7a663cbe8343e884b88e44bd88d37dd0a470e5=
:
> >
> >    Python: test Python 3.12 (2023-10-04 15:19:00 -0400)
> >
> > ----------------------------------------------------------------
> > Python pullreq
> >
> > Buffering improvements for qemu machine, minor changes to support the
> > newly released Python 3.12
> >
> > ----------------------------------------------------------------
> >
> > John Snow (9):
> >    Python/iotests: Add type hint for nbd module
> >    python/machine: move socket setup out of _base_args property
> >    python/machine: close sock_pair in cleanup path
> >    python/console_socket: accept existing FD in initializer
> >    python/machine: use socketpair() for console connections
> >    python/machine: use socketpair() for qtest connection
> >    python/machine: remove unused sock_dir argument
> >    python/qmp: remove Server.wait_closed() call for Python 3.12
> >    Python: test Python 3.12
>
> Is that a pull request or a patch series to be reviewed?

Strange, some of the patches have Reviewed-by tags but others do not.
I could not find a "Add type hint for nbd module" patch on the mailing
list before this pull request, so I guess it hasn't been reviewed.

I'll hold off from merging this series for now.

John: Please make sure all patches have been on the mailing list for
review before sending a pull request.

Stefan
