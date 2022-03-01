Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2735433lfq;
        Tue, 1 Mar 2022 08:16:36 -0800 (PST)
X-Received: by 2002:a81:8984:0:b0:2db:6b04:be0c with SMTP id z126-20020a818984000000b002db6b04be0cmr12447639ywf.2.1646151396750;
        Tue, 01 Mar 2022 08:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646151396; cv=none;
        d=google.com; s=arc-20160816;
        b=YlsUsyT4vLvBVFC63LsZC7EtCUEF2w5+7f5HXAic7dmN0S5CmD2euv55UJw9PFsG+q
         Pj+KQV1NOR1sflUj9HiTR6Q88RD3bqGfuGXKEne855/W/ppXjs40zQMdR75EbGq4kj7+
         7QdWrwz57oPR2r8mQdLRf/sX1bTwcjQ7kLWfF0m4gkcyisYbVguCweB0pCoeie20a6a4
         lbncPx9tQ85gsSAwKN1F4i4zDhYHDFFxPPBi3WM0OUyH8t3OK5FL/xRzpYhj3p68fB04
         ag8emjsZsWvk/qqVmvRBXyZRQIIEt1GObv3pFpAvoOLVBBn9yA/Y7qx0zGsPXNY3L3yQ
         AI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zsHRSNxqly4NfNg54gzio1uw/874qQqD7wYTqL70B2U=;
        b=XsJZt38gx1ZcUQREq1vtkb6zkWxxqBtsD6BL/BTdOEol4OUUMibR0JA/ZF8k4roXAq
         a9AoAJLN+BLo7aXIHDhjzrAcWDZQvflHDTeVwbruYn7/V+5QTN5OtYktmXgh6wI+fA7M
         NYW5/jnFJk0g1BYJOw2B0EnMIrL7Ejm+QG889MyQNqvpQEIG9fhpQcZVWXTDWIZSLFqq
         drDjN/yZgxFRhwBjyfB5goWDfraGl+vlUK4vnOvQO9IjHPJlZ3yxa6tBVA5ZYcl9WSIH
         P7PyXRVIXvEXxtwc+CsO6WLtXw3ZaI4VARpyxSkpTQZ+vyxhhQnxmit/yQp/AlAx8LF9
         GXfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQGoDnIh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j7-20020a05690212c700b00624a5b8064asor6936610ybu.88.2022.03.01.08.16.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 08:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQGoDnIh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zsHRSNxqly4NfNg54gzio1uw/874qQqD7wYTqL70B2U=;
        b=OQGoDnIhwadbtSxcIR7F4n8Ay0a527gd3cuhdMAJdxQ4Wp2lpcmiWAkadXqO+cAEHa
         cv3UFFwZ3bROOUdqrzXioTyvBOlrnrEFFou9Xgd2wfKu+rPGF/n6kWr7+4GsY0LL2Bwj
         V426n8kLEiZ6dNXflsFWGaPceDXzRHcjeg1wMhkTr1Lx8mMJPmJ9zg6diK+2X1GbhEgx
         z+4UfuOSd8HDPyqlTBZMXvSpwYOqui8TLDgM611MOZv73CrMPu/QNUpTpjWWleN63b2E
         LM2Nkbwqz+XZMFReviDotnVS7KFpWW2WMgnQwe+RbaO8djeCVrRGi4neOW5quY0lk1TO
         zLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zsHRSNxqly4NfNg54gzio1uw/874qQqD7wYTqL70B2U=;
        b=6oA0iH2lEjOs1WsBr99ApwhCXz8elyJ4QPvoIRPYNr9SVP+GHgUki+G89+yWprtkeW
         uq/CzCU9SF1CBJvxpD0jSTl7hQfmXLr33th3dz6YXITiYbpJ09Ujvn+KxLV5cJCa75xB
         1bdvtuwcKk8dELRfd1oIsUa5llp96JdnTog5mE0L0wW10EatzQ50FMb5GNzjLOPneb/m
         iDUG1kmoiXSf2ztXD82QNPSDWkbz5fMU/ZddyphEjQ5YH1E5rDmre9tqK+lg8GCMnzzt
         IlsNULmTLoCf2ipNu0JkqMg+jzwrfAUcdY+TytIFWXVjwkQ+sko4MvsjZL1SM+D9pwF8
         AvqQ==
X-Gm-Message-State: AOAM532DMAMwCOwskhiUsip9Fpv0rErUoOs5b986yQ7Et5G/uUivQwet
	SsVmEqTTorLnM6YM32QtdoT3wT7EYHXcMgaqhNBoh9vt8LHrvw==
X-Google-Smtp-Source: ABdhPJypz9WOAWBKh4qDBhve2h5MbUoFpjpED6RTfglgKCrw+SN9qFNEzY11oJ6esmV7CGs65xgt5PJE3WkjcxceRSI=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr24856928ybk.193.1646151396416; Tue, 01
 Mar 2022 08:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20220223223137.114264-1-richard.henderson@linaro.org> <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
In-Reply-To: <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 16:16:25 +0000
Message-ID: <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: MloBXeHmtKQx

On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v3:
> >   * Update emulation.rst.
> >   * Split out separate update to ID_AA64MMFR0.
> >   * Hack for avocado.
> >
> > If the avocado hack isn't acceptable, perhaps just drop the
> > last two patches for now?
>
> I think that given that there are Linux kernels out there
> that won't boot if LPA2 is enabled, we should probably have
> a -cpu command line option to disable it. Otherwise we might
> get a bunch of "why did my kernel stop booting" bug reports.

...and should using a versioned machine type also default
-cpu max to not enabling that? Not sure what x86 or other
precedent is there.

-- PMM
