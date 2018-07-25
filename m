Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp479485wru;
        Wed, 25 Jul 2018 02:17:57 -0700 (PDT)
X-Received: by 2002:a6b:b955:: with SMTP id j82-v6mr15867002iof.158.1532510277562;
        Wed, 25 Jul 2018 02:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532510277; cv=none;
        d=google.com; s=arc-20160816;
        b=WhwWvzMaLsVNMb95FwXrllmSHRdkYT9a/b38HDVtKDR/HeYHPMCrJIoOjuSHAe/4sa
         VWIi4wZTgaQxlmb4NQ9HE4+DjZflK51Od7ZOehzXoRd6ct9N7M+JQP91wk3mS3FH9Rp3
         VVTFeY3SofxiAptCDKu07BIpjo+ggAPCHy/tUp/M+FAHd6M685c+8sMMNDEI2b96FkHI
         toK5AuCwXtUppk0lmPmvrIxy1VplE6rRrLpXJT/4MD1effoImpvIuc/VBwQrsf+hTJyg
         E/f2fIFY72gX8Jvxc/9+UKbM2GQK4WVt6V7YgSEASO5denHBkWXcq9sSt7fephGLfS0A
         j9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iohBJMzhbOdWbxc3R5jhoWATL+z2BD/3WRgqAX0EC7U=;
        b=J+wZGxCTj00acxTCfTJlgbmmnCvtqkrxG5z9TlKJVNUAZ0lfA/L3eJbEL4hVFfKyex
         u0pC0zpUr3tHE/hLcFyCx9yMBeiwbYPrsuIDy+nOW24vIJi1gXee6LA0otUZFl0Eh3x3
         r0BSc3BNfmY8VSYUJfk1/hqmOshdvCFWul4F7F65exbENFZNBmcA7LX9bsxaBptodIO1
         T9/B+wM7i10htUK3TjRstshXbKFHO0hxM6mCleDA9RhzcPC8DUzPkZBgMSeHooFgOqrt
         EX3TAeKIuftmYiuSIEdG851fviGDto31HMgk2XZiGC+1R00AVnbv9fqGSa5SZxHsP4Jr
         rQgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVjwLcUV;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c98-v6sor5666589jai.24.2018.07.25.02.17.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVjwLcUV;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iohBJMzhbOdWbxc3R5jhoWATL+z2BD/3WRgqAX0EC7U=;
        b=WVjwLcUVM/MGpoqJb4wXtyrPzYyrhSVJCosvFxX9wIWXWtblLpRbaw4EwbRwCQ7tB0
         NyrEkarDMHixAWPrJkRWNrgnjHedsGKZOC1MYp/RXyjnSXbisDmecOxlcVkweYll81/F
         S8Pei3JceyrjMXdVOhy2emUw/qR74/H04Bu44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iohBJMzhbOdWbxc3R5jhoWATL+z2BD/3WRgqAX0EC7U=;
        b=bMgk+1GU/N7trFJ79HsRE744QOyEZgF86SuXhRz7uUp4F+zN7KhW7qJ6UAWkkXlicx
         trp3dajgcFqHTOHCRiulMd4xDUfZPHHxqRbEcRpwuOJTtneBABIho26V4zaxCoo78ZI7
         QvNH76GfLuztIdfTpjRbloulB4D4DWYQndPp4bUOF468aYEuXe3KG/n9oKgdul2CFun4
         7Ozq1wGXe8c4ezm7+kjMxMUZPDB9wa357ZTeX6M3o7LEnd9wVYoUkExUwuzLCHPdA+ke
         sUexEGRzR8DmMdNVCS9q+lePuYjz2e+JY/tMWbDdJKm+07WpRWaYj8H4V0mSCSl8YBwv
         JcwQ==
X-Gm-Message-State: AOUpUlHVpelmqclGqJLPeXU49OEsioFVp9gebCijyxlbXEp9VooelI0O
	JWc0+RCLKEFsVKN35mFyjJz5R6JBi4fakWIp3QEr1BJMb6XUjSrx
X-Google-Smtp-Source: AAOMgpcrMKQI94EifbAwSrmqbqFCkyJysw3niBdwqteyW4JijE195+8mytX/Omw9OBaYCl2qa0dMdmLrdCXlp29itHE=
X-Received: by 2002:a02:b804:: with SMTP id o4-v6mr19592306jam.12.1532510277209;
 Wed, 25 Jul 2018 02:17:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:17:56
 -0700 (PDT)
In-Reply-To: <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com> <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 17:17:56 +0800
Message-ID: <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: K3vlO9G4rEjZ

On 25 July 2018 at 17:13, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org> wro=
te:
>>> On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>>>>> For the Aarch64, there is one machine 'virt', it is primarily meant t=
o
>>>>> run on KVM and execute virtualization workloads, but we need an
>>>>> environment as faithful as possible to physical hardware, for support=
ing
>>>>> firmware and OS development for pysical Aarch64 machines.
>>>>>
>>>>> This patch introduces new machine type 'Enterprise' with main feature=
s:
>>>>
>>>> The 'enterprise' name is really awful - this is essentially a marketin=
g
>>>> term completely devoid of any useful meaning.
>>>>
>>>> You had previously called this "sbsa" which IIUC was related to a real
>>>> world hardware specification that it was based on. IOW, I think this o=
ld
>>>> name was preferrable to calling it "enterprise".
>>>>
>>>
>>> I couldn't agree more. However, IIUC this change was made at the
>>> request of one of the reviewers, although I wasn't part of the
>>> discussion at that point, so I'm not sure who it was.
>>>
>>> Hongbo, could you please share a link to that discussion?
>>>
>>> Thanks,
>>> Ard.
>>>
>>
>> V1 discussion here:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
>>
>
> So who asked for the sbsa -> enterprise change?

Actually nobody, but it was argued that sbsa does not require ehci and
ahci etc, then we should find a name fitting for this platform better.
