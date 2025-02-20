Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp34327njk;
        Thu, 20 Feb 2025 04:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrslPvbcU+6ml+0w2aSMZv28k0623OaVrS/5wx1NUzMGIphTV3TLHJ1rlOGEyaVACahrRG+YP9+ZfgXg==@linaro.org
X-Google-Smtp-Source: AGHT+IEutFlTJTba6XbntwHTzcVCkRBTrnIdNtB/ZIxIyiKleenDvr+nN7B7NRCD6gCsHEkaLBaz
X-Received: by 2002:a05:620a:2451:b0:7c0:b685:1bb0 with SMTP id af79cd13be357-7c0b6851ea6mr857704385a.17.1740055480914;
        Thu, 20 Feb 2025 04:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740055480; cv=none;
        d=google.com; s=arc-20240605;
        b=MmC3HbhdC4TP+M2yvmA0Ek6gqr/as8mhejv6jzb1GWL1PJWe9aB+M4se/V/lxesG4a
         I66ABWgDaoPT+pKYTGd55ftKyn1xL34lQrAC7MRjitE7n7RfJfEza0Qb+ftK8uOiTEPB
         rfVGHGwLYKKp3RR08dRv7beMVPsZrEAy/N27flDH83ch6j4hAS+j+UofkIA73ITVYnJG
         LDztU1OxBWXMfCQ1IoZYAbOPsYyoW4x0qFJwCzdQ0BkoeR0Rbum7ery1IQBQXQ4nofkq
         5n97G9PGNBsixFRuet8jNJGFSaWBQHj5M8UlSi1STaeqw6igSJ+7+rvwyn5clRhaCfd7
         +85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3N+6yuA28M7s6c57t8EizrNFZ6i9s62eFI+syvkNaN4=;
        fh=6VGrfyY7T8wSSJsdxl80PaFT5YaIXTh8xRrZUUaC/HQ=;
        b=jP65GwYW5Lo5fp7IfhgZoEvdtjS8HPtnBXA4MwKB07wJD9SX4/y0z7i1GJyWENnFmA
         R6UtjWajmOIdkZXvAKcQD7uZFqrOSqbpE7aKe8FxaAojc4+0CQzy1ZmGr2Qo/eyuE4Rx
         22aQlwOhUJuG3WFDjcw+EiZYkkEyO4z5Mz0Ld+nSc0wV58tq0JE2L0uhxg9E82MHKwWB
         /BTGoJu4REUXDov6E0NKGnsXZlh7IVos1POewyifYSo1qEg2LxJe+2gO4igfKD3iFgYr
         8fdKrJMd+s2uOdp2PmpI1lNo8vMvPS6peUtz5ypTyzqA+exGvGVaK8IZ6wrv+n6sejV/
         1/XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+HBi1gR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b3bee1dasi379053685a.341.2025.02.20.04.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 04:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+HBi1gR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl5uR-0002we-J7; Thu, 20 Feb 2025 07:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1tl5uK-0002wE-S2
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 07:44:01 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1tl5uJ-0001N6-0E
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 07:44:00 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6f4434b5305so6726707b3.3
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 04:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740055437; x=1740660237; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3N+6yuA28M7s6c57t8EizrNFZ6i9s62eFI+syvkNaN4=;
 b=C+HBi1gR0xW8ZUOwrCpbJq7tiExLMTOPPJP8fEcy0ZwInQWrEkThtmFbKNJG4p8L5O
 5fTaRkVj2CEh/lkXxYUlOy+1g2WoYdX0Ou70hK2eIJ2L6yttv1bxrJ8BjhNDbcvALvhJ
 byeI0bzGd9nT0wluRetNxrKBIp/vSf8XLQnYAgoo/EeqcjJW4n0r0uOGmrKZZYseDo8t
 HtgTTRn2qnebxqxwdawFXBFGhMw6dXhonPv/4RCRNIA9RgEfy0kJzfi8rWmc1d1k7pEo
 TQSCjGKepFgiXcMQUA7CJutfgM6PwnCgyJqexfOPevNBr33iII/xG5ivjX0qi8qjXmiK
 y7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740055437; x=1740660237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3N+6yuA28M7s6c57t8EizrNFZ6i9s62eFI+syvkNaN4=;
 b=ASBkWAJ+SvimgaI5JkeKi1buQOEG3UyZOJkJWsPNysWdz2Or7Z2f86jkI/VkxMNlXU
 HUxyiZbXkw7pOcsRYY21cwANG2Ra2WZMDHLBFOauQAchtIBVubGu1/rZhwOKtQ0Ac2UN
 3WuiYi7OhggCkNys6h93YpkaiEPnRSSC2IFgWXvhEEwmQ7+cvxhGpScG+P2FVd13chqN
 9kiqcboy7mwDk+kdZWWiPR65uztQhG8x6fBmKGUWojwRRLCJOws2xafnnwW1848/9pSe
 rWZ2IaN3WzuqHJuOchc0pydaItqoGuFYSregANCRJ/B35g/+GyoHTO0Ex3KkuT0vHoX5
 iXMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB84aWMnN3O1xDwKIPXX7DG44dXyxGpKmtOAV0m0QOIAqKP4k5aEwGJGVW6caxwDIFi7DQlip/RA==@nongnu.org
X-Gm-Message-State: AOJu0Yy66EP3oCpqmT//+Mj9MuVEH84SUc+J+XW3wcO39dNG4D8IlV2e
 20ciEdO+xt71WBFaef+dXQHHwPZmrilxYt7p2ENJPr/P4aPcKgKpQxY7sbwuYodrQczuGeAxXP8
 4d6lWLpltrGGyWThZ3mEj+AiiVTjz0XaT7CnMFA==
X-Gm-Gg: ASbGncve2B/m7dtMroWz2HRJV2p1lv/PXtc/dWslnx4nkEsUvM5W3Z0CkFNnBP/6FBT
 8Tax/neobJFw0E5N5gtRaqLNAaXMhge9t9dYMsH3ukSuSGGMOy/XegolD5Q7+hhbqxqk3ecrCag
 ==
X-Received: by 2002:a05:690c:7305:b0:6fb:a376:3848 with SMTP id
 00721157ae682-6fba37640ddmr81976137b3.34.1740055437223; Thu, 20 Feb 2025
 04:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20250211092324.965440-1-kraxel@redhat.com>
 <CAMj1kXE289FkzV=GZSUARF7TFUyRuxYVX-090ic06Erb_RLGrg@mail.gmail.com>
 <cc41f19c-5778-4376-a1a1-762a92c8584c@amazon.com>
 <CAMj1kXFaoZCnXpAsq+i5nzpCOjcrsN4QA2r6Z=F6UUwcUe_qJA@mail.gmail.com>
In-Reply-To: <CAMj1kXFaoZCnXpAsq+i5nzpCOjcrsN4QA2r6Z=F6UUwcUe_qJA@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 20 Feb 2025 14:43:21 +0200
X-Gm-Features: AWEUYZnTlr-A1I-DiZeEgvoZs27SOWRVjgKDye9_lKOfKPY-Xyn4Y7NDn08Whsg
Message-ID: <CAC_iWj+eGFOTBUAgStAcN+UMH6fjbivgKAcm-i8qaGap1GPAOQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] hw/uefi: add uefi variable service
To: Ard Biesheuvel <ardb@kernel.org>, Alexander Graf <graf@amazon.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=ilias.apalodimas@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tw0saOLEeMwy

Hi Alex, Ard, Gerd,

Thanks for roping me in,

On Thu, 13 Feb 2025 at 12:13, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 13 Feb 2025 at 11:11, Alexander Graf <graf@amazon.com> wrote:
> >
> >
> > On 13.02.25 10:41, Ard Biesheuvel wrote:
> > > On Tue, 11 Feb 2025 at 10:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >> This patch adds a virtual device to qemu which the uefi firmware can use
> > >> to store variables.  This moves the UEFI variable management from
> > >> privileged guest code (managing vars in pflash) to the host.  Main
> > >> advantage is that the need to have privilege separation in the guest
> > >> goes away.
> > >>
> > >> On x86 privileged guest code runs in SMM.  It's supported by kvm, but
> > >> not liked much by various stakeholders in cloud space due to the
> > >> complexity SMM emulation brings.
> > >>
> > >> On arm privileged guest code runs in el3 (aka secure world).  This is
> > >> not supported by kvm, which is unlikely to change anytime soon given
> > >> that even el2 support (nested virt) is being worked on for years and is
> > >> not yet in mainline.
> > >>
> > > The secure counterpart of this would never execute at EL3 on ARM, but
> > > at secure EL1 (or potentially at secure EL2 on more recent CPUs). But
> > > the general point that this is difficult to virtualize stands; I've
> > > contemplated doing something similar to SMM emulation using non-secure
> > > EL1 in a separate VM to provide an execution context that could those
> > > the secure EL1 payload (using standalone MM) but I never found the
> > > time to work on this.
> >
> >
> > Sounds very similar to what Ilias built a few years ago?
> >
> > https://lore.kernel.org/all/20200511085205.GD73895@apalos.home/T/
> >
> > Which reminds me: How similar is the protocol in this patch set to the
> > one implemented in U-Boot? No need to reinvent the wheel over and over
> > again.
> >
>
> Identical afaik

I don't know what I can do to help here but I'll explain what we have
in case we can figure something out .
The idea is very close indeed and in fact it works on QEMU with some
hacks for arm(7/8). [0]. Since QEMU doesn't have an RPMB emulation I
am providing one in software in U-Boot. That's obviously useless in
real use usecases, since the memory backend disappears when we leave
the firmware, but still useful for testing.

I also have a blog explaining the arm specific bits here [1].

The TL;DR is that we set up everything StMM needs inside OP-TEE and
execute it in S-EL1. For storage, we have a 'special' StMM driver that
sends requests to OP-TEE and uses its RPMB support to write sensitive
data on the device.

[0] https://git.linaro.org/people/ilias.apalodimas/efi_optee_variables.git/
[1] https://old.linaro.org/blog/protected-uefi-variables-with-u-boot/

Let me know if you need anything else

Cheers
/Ilias
