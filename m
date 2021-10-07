Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1571730lfp;
        Thu, 7 Oct 2021 09:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAqPQnIHMurQirsW4A3ACcd91WNWOuYqz3Pp6VnQeyzhzYnkXRUl7HH9Pm0hwBwQ0y6K4w
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr5724491wmd.156.1633624104016;
        Thu, 07 Oct 2021 09:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633624104; cv=none;
        d=google.com; s=arc-20160816;
        b=NSPjzPd61HK/V+IQnbvJ0JOCEbZpFdABJANZkw2XVwkiIOmQHaJVyHMgek9U8yxsdD
         2VGmb3154nkzBXpELcbeimGcXeepeO7BtKETBeJgf8DnqATilucnoNSb/TBjxZmIpTS7
         1jYGKqHHiT0cbObVbfQ8USCoDyqpi6LFQpNaPuAAfxfdsmTNw8HHi/x/JGq8czEThs7z
         RsorSy2hkh/bSz4hHzjKzAe0LGyzo49FYTHh5rC3FWfnm+ymGeeZ2yH/J0CMi1szmrHq
         zUQJJzQSkgOgo1KsH4ZbmyiGhKm6SML+kcPHNVy3NbJ5vaAN6gp41XOr0+eME8LaVXDM
         Wo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=OKWZiJ/YLPCaQ5fAPYAC7lX9yvWUh7d5o5+k85W+ul0=;
        b=bI/aPuz03OCrneuYBELT8DtGAuuPqzxUXieskrHtYJ1Y1PU/jafYsPWZxOXmZGntVN
         rPGb6libFckPIO9a7vh5z8zunAKl2TpL/ufW0cLvdLCMA4lJNwnuh4FKLp7bY8jHFnnX
         OTuR9AYD9zoB6gLqnDPtyHa99Bd9LjNqgO8kmFDK+aHmed5STyYvZEg+g7DVMlKKz/TB
         U76QPpGlCewFjjTKnAKfwW/eE4gS122B4pYjd8kIBLCzNQsFpOsrDB7q/5jSv6xKcZFZ
         XOwgl67sSNNXnd9iw0ibCRJJhqByG32dT2eCarhkbzMeIKbCm+dzZ1+htXdPSzqwpbZu
         /vMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
Return-Path: <arnd@arndb.de>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.75])
        by mx.google.com with ESMTPS id a9si208488wri.365.2021.10.07.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:28:23 -0700 (PDT)
Received-SPF: neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) client-ip=217.72.192.75;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7hrw-1mu9y90jLe-014nNA; Thu, 07 Oct 2021 18:28:23 +0200
Received: by mail-wr1-f49.google.com with SMTP id o20so20789737wro.3;
        Thu, 07 Oct 2021 09:28:23 -0700 (PDT)
X-Gm-Message-State: AOAM532ymCLMfrmo58pJ51jsFhbjWjJ1VzjSQ1dn1boAck/tbByXra0B
	R4n097Y1+qrqwi/ggm3LoHP07rJsqhviOeyetxQ=
X-Received: by 2002:a05:6000:1561:: with SMTP id 1mr6490031wrz.369.1633624102697;
 Thu, 07 Oct 2021 09:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
In-Reply-To: <877deoevj8.fsf@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Oct 2021 18:28:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
Message-ID: <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, assad.hashmi@linaro.org, 
	"Eric W. Biederman" <ebiederm@xmission.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vK98dCcsw9nXEZePXSN6Zg9xQGF3aEtSKCQkwCgzOsE2iyVbaOK
 S0VWEu3tKhglJH83gkIyWohJWSdDL3kWLhpzYeEDtckYHcPSisbbUu+0BuWZto7cfYFN6B/
 GCj9AqI7Hz2v8C3/zOUHGAXzaNAC3NCDRa63NprgjnFSfldB4Viua7NMy9KCnkNhu6WhL50
 a4o3UUE1Z0TqfJmoFyygA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:feTJHqLHFKo=:QbVxgNXfADYOZPWtBYju+P
 jV3U7bo45CrVvoUqquKMAd6Qy8yMsFIPoeJxl2QNgwr2ESDgUnDNgJmay3CupQJ3bLMcmuSXd
 4iO2CeOqpaoBnqH9JA4PdcVOSGPiFq0zhj9R319ZSHW19gGIaXMAAcoHCGjh4XWE0Ntelb3A4
 HuEu4Fuy8bVx0vOgGQ2hhQ0ejkoxFnff6t3QiY4Dm2wJXz4D9JgzZFNE3zZUlQ35VffadRjGD
 +3rhtVSGTrBcGENhvIu1NHxLjjVY6YxabhoYpR51JpL5QpHVpvhyGqDOS9q9cyq8IyKgaPmsS
 ofwrSdc2TkmjWSJerV662oVoeFDBkYZK2AqNKIcABgk2fYQa4zLCyk9OmmDijLn3XKrZjQO07
 rooHminuHYcvCNbqTxdry9BD5zEY0sWrbOdz2ZUcbPfKWsWLrTtX2v/Jb4G74lltTmFUOvjMh
 Fykdg18mGDHb9eC/FbGWsVVOkWBvrZTHcyQpLB4HUYQYgG1dg9J8RkHGqYG2f7SxRKGcTFVke
 UvSUza8xgju2nAzc1gasQmisiFWsAdiZnoN2OiukTHtRsGgYPx5I3UbHqNccU+aYCqDqdzP3P
 loIRvUWCNB34s9czF0FDzJ+fSTHMq9KBJs+qU/EBb4jZ8MT4eF6HkD/USHr/WhmWmQW1qVX4N
 edJ6G5uLnP9J2d6a+Fiu5O+PjSVoV6HQ7Kl7NkjIOvJ/BCPGjYDljweYGxsXBg0J9HSJYaLkN
 QwQAJpkjwJgAok4LQl5Pq6WyV45UgVpJtTcMqQ==
X-TUID: aRER8Q3jCsCd

On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
>
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.

Can you clarify how the code would run in this case? Does qemu-user
still emulate every single instruction, both the compatible and the incompa=
tible
ones, or is the idea here to run as much as possible natively and only
emulate the instructions that are not available natively, using either
SIGILL or searching through the object code for those instructions?

> Trap execve in QEMU linux-user
> ------------------------------
>
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.

This sounds like the obvious approach if you already do a full
instruction emulation. You'd still need to run the parent process
by calling qemu-user manually, but I suppose you need to do
something like this in any case.

> Add path mask to binfmt_misc
> ----------------------------
>
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).

The main downside I see here is that it requires kernel modification, so
it would not work for old kernels.

> Are there any other approaches you could take? Which do you think has
> the most merit?

If we modify binfmt_misc in the kernel, it might be helpful to do it
by extending it with namespace support, so it could be constrained
to a single container without having to do the emulation outside.
Unfortunately that does not solve the problem of preventing the
qemu-user binary from triggering the binfmt_misc lookup.

       Arnd
