Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp764708lff;
        Wed, 4 Dec 2019 07:11:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbGQja5TBr00mzHEEvUFdhG12QVsIdC5NqQhmIBoCNMu+MaKeTgOsfdv1bLxU0VLFnJMir
X-Received: by 2002:a05:6214:902:: with SMTP id dj2mr2957840qvb.133.1575472315845;
        Wed, 04 Dec 2019 07:11:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575472315; cv=none;
        d=google.com; s=arc-20160816;
        b=0upew46Ugacpj9rlMDMvQc9PaVhKvkmGzhAQCi4uoUtidqKrFk2R86cyss6VbK84wx
         4M6A3Xb7nBnCzd2TZ9fk44RPpIsZcUGxMHzBtmsqjkRB0ZX1KkQFrmcFLxzLR08l/CCA
         HrUPfJLqDFaoff7s4Gk/CPOYSSUsgKevYAg5OfIWTYheLT7G7vPLvOxz3WN83DjCe4/q
         lwFwAj2ekCCSbSDHoXHsyjwveoXSqxTneqUK32ur1kBr90hT38uV4as63f32Bqlpqwg8
         sQ0Rx6R7ooKUbkGbNebcyKoSSxLTxpwXyqBM0Zphr/yj/mOdFHnvwJq2lstt5SFnQiaz
         g2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4/Qwt0GouNX9aM/smKfTqvCUQpZ3KJlj3iVgRiG22vk=;
        b=xeSkPIg2ppexburodPuSFUIORBdbLT+pFmFZmIo6DvIouk+L3ZkgKahHhZdBQNQ+cy
         3UXs06fzQFe6JOPZytzG+jIPETVjDMttdQPKtvJ5tIHjpWs7FS5uRqdSVxBkk9SclsKS
         PGjq6aQQINKvk97VORZSw2C63PgPN/0VZWA9BlIVca7huA7TULSTbLQ1WB2lEPZB/8Je
         2NKIpqZFXOa90oDoderR3zm+LCWIIs/4lIWPAag0HOmJAy2PBeHXmRuyF8IFxgVM1ewx
         +IGoRbZ4is0VgC5X/aYUluD5YmKSb+a+HIwbyolnnmmZDAjnoAk4CB36Rboh7zOMmbTR
         AZNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=txot3Llf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si4182428qvl.116.2019.12.04.07.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 07:11:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=txot3Llf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icWJn-0008HL-8m
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 10:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icWJe-0008Gz-Jh
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 10:11:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icWJd-0003Ay-CQ
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 10:11:46 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icWJd-0003AN-3Q
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 10:11:45 -0500
Received: by mail-ot1-x341.google.com with SMTP id 59so6565645otp.12
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2019 07:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4/Qwt0GouNX9aM/smKfTqvCUQpZ3KJlj3iVgRiG22vk=;
 b=txot3LlfUrdPFV8xcn0ktczbFaWdRP1NcTfchRBQkBGqH90l52P+tEJFZXMzQ+rolk
 TbQuZu0N6AHmidT+gG5Hh4cIc6xy2uumCVA1ZSUryVZNcRYTjBtGrfyO795gtClyltA9
 LNlLVIRMtFRGx4nIxvtXa6Re2lcf0yplU2TAmlLlfnWNpdg8BpxFpumnHqo6aQE40oEy
 7H1gWQ3u08m+kGhL6YTImwX9jcmtWkEF7iOiDACu5hVbRbDALgiv+hF7u6a6uG6NgcQ4
 b830G/n6nL7SqOeaqbgBDQtUwKAGG2HkrdVthEpQ+UWPquAFmPE2mTNArofaqyL+6yqZ
 SWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4/Qwt0GouNX9aM/smKfTqvCUQpZ3KJlj3iVgRiG22vk=;
 b=b1m/TnqkjC1uTeYI7IxOpdnwCAEMob1339CKYeI3zIK3YudZ+wPrh8v7XoYHX3M0Xt
 pdE/fn5rCEWZDUTc4I9O9Mi7qGTvEhwwMRwnzSdT+B142fQDQqwqusaUGM+BYXhzNh+w
 DquTgQkX5kWs6JBHVwfyZ2R5sYjJRGJ+iaDRp9qNvEv9XftH7F8eMBRWqnKwopxYKBoi
 7zars7bZwp06KrxYGwVO6kbSE4xqSjlefFQ6Nqi2jbGp52hsSHxZAW0HeF9cz9WMFyGW
 /65FqFOP/v5a/a6r6blTxEHBhZMXB1Mb7/mI3te5i+wJWv/5IQi2k3rT9PSnmhYkt+19
 8agA==
X-Gm-Message-State: APjAAAXdrBJ6H5NoYwgVC/d3UlDiudR9yVm78t0tXAJ5Dtz7eO6gFhg0
 /KgwHzlOEc7wrN9w7As0A0Dr4emjkko76TO+ke0pMw==
X-Received: by 2002:a9d:6745:: with SMTP id w5mr2733664otm.221.1575472303955; 
 Wed, 04 Dec 2019 07:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20191129150508.24404-1-bilalwasim676@gmail.com>
 <afe9efde-7ac1-8607-446a-8fbf10accece@redhat.com>
 <8c956ae31e8f44a2b831a5030b2448b4@SVR-IES-MBX-03.mgc.mentorg.com>
 <CAP+75-X_POJfTO=gOUu1zCPtcfnQ5yemQo0hqB_s3jy_C17o9g@mail.gmail.com>
 <db2c5074-307c-d20e-73f2-9c2b44612d6f@redhat.com>
In-Reply-To: <db2c5074-307c-d20e-73f2-9c2b44612d6f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Dec 2019 15:11:32 +0000
Message-ID: <CAFEAcA89Zw+MUJzhwSx39qVv8cRVNgRf7fe1K1oLYVjZfur9Wg@mail.gmail.com>
Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support loopback
 mode.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "aa1ronham@gmail.com" <aa1ronham@gmail.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wasim,
 Bilal" <Bilal_Wasim@mentor.com>,
 "bilalwasim676@gmail.com" <bilalwasim676@gmail.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGCHDVOl6vG+

On Wed, 4 Dec 2019 at 02:15, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2019/11/30 =E4=B8=8A=E5=8D=8812:04, Philippe Mathieu-Daud=C3=A9 wrote:
> > On Fri, Nov 29, 2019 at 4:59 PM Wasim, Bilal <Bilal_Wasim@mentor.com> w=
rote:
> >> Thanks for the pointers philippe.. Is the patch okay to be merged with=
out it or do I need to do a re-submission with the updated username ?
> > If there are no review comments on your patch, I think the maintainer
> > taking your patch can fix this details directly, no need to resend.
> >
> >> -----Original Message-----
> >> From: Philippe Mathieu-Daud=C3=A9 [mailto:philmd@redhat.com]
> >> Sent: Friday, November 29, 2019 8:38 PM
> >> To: bilalwasim676@gmail.com; qemu-devel@nongnu.org
> >> Cc: peter.maydell@linaro.org; aa1ronham@gmail.com; jcd@tribudubois.net=
; qemu-arm@nongnu.org; Wasim, Bilal <Bilal_Wasim@mentor.com>; linux@roeck-u=
s.net; Jason Wang <jasowang@redhat.com>
> >> Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support l=
oopback mode.
> >>
> >> Hi Bilal,
> >>
> >> Cc'ing Jason, the maintainer of network devices.
> >>
> >> On 11/29/19 4:05 PM, bilalwasim676@gmail.com wrote:
> >>> From: bwasim <bilal_wasim@mentor.com>
> >> Your git setup misses your 'user.name', you could fix it running:
> >>
> >>     git config user.name "Bilal Wasim"
> >>
> >> (eventually with the --global option).
> >>
> >> The patch looks good otherwise.
> >>
> >> Thanks!
>
>
> Applied with the fix for user.name.

Could you fix up the non-standard block comment formatting too?

thanks
-- PMM
