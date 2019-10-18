Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1027193wrm;
        Fri, 18 Oct 2019 07:57:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3ee2fIWNqxJCxdPLrpZ/ht4g9Cdqw6KX5XE/pXojHBPVF+F182n2kTLKwnYgKp8NZFVI4
X-Received: by 2002:a37:9202:: with SMTP id u2mr9171066qkd.8.1571410627024;
        Fri, 18 Oct 2019 07:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571410627; cv=none;
        d=google.com; s=arc-20160816;
        b=sYc+If77wAEwylRq/il5NP6uIaQ8//Nem06Rjqnhv+VDmWV9Un4Xn9FUidh7w5WC8z
         6F3GPNthQ/RBgp9lBrfHkfHnHpJm0a4cPQn0f+zJ6qLY5qzCshpTwWQxv/gX+AtmCuBS
         YgcCdHDpMvVnsDPso9t6ajBn8YMqpQbo736+kJQcFJ93sejhMouyJi43NeiaoyvKiLre
         9cdvk66yOzf+G2HXAsjWx4sL13cl8hYl8MkbH0ok4K7keGvek4T+3eShcQ6hRoCYr/LY
         kFwbBHje1zbQX+xv5rjF3DQYVjK+mtnfjVwCJzIfVm9MX8ds5OGlYFLw2Bx3HRw8riLo
         q+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jf0iD0Uy01XhbMi090dz1RGh1Cj6ASQdG9bTgwlfeCA=;
        b=CERhAijBWjGyGNqcFYzjF2z+RXYzMHMGZGU/Xhn3lp4+tw/4/hiF0a7EhZgfDB0b9i
         F3k7+7SjfcFehf1OzmbNifYnFdH0lNyki1x9eAl682rXsoocujMrKIgwDTpKUso9wlcZ
         6Sjc1Ru9afnj6wquGdmWI8C9A2oBql6nf7lBt8wyl4SaAl25JbmOkNatMsz7/J85rcPI
         DJD6cTFOsTLKyXlyNaWoX3gfVqcjvGgkWrQvT01MyuAOEYkIB3T1YlDvi1gDUnHUoMwi
         /PadViQ9afwFTvAWYbg6+gd4lTkYwb9NyZmH6toO2vWZKLNKQdBFM0Q7hUZIyUrV4A09
         3OQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uyap7VId;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f57si6454076qvh.44.2019.10.18.07.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uyap7VId;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTgf-0007Rg-NR
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTfO-0005xe-Le
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTfN-00050R-G6
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:55:46 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35689)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLTfN-0004zl-9a
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:55:45 -0400
Received: by mail-ot1-x343.google.com with SMTP id z6so5214174otb.2
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jf0iD0Uy01XhbMi090dz1RGh1Cj6ASQdG9bTgwlfeCA=;
 b=uyap7VIdyhvAbA1h0uyEzHfgED7ZBsAqhh+Tv5gAU9Jfzo7t+DaJ9A5TeoPrxtw0eN
 QDG2FBpLgsEZS9/flyLmG7VXz0CNIxDkOMPhdzRyNREvDri/9RJyzm9K3qfwvKzYzsuD
 ewKhQNX/aoTXQ7DwwxXd3ae/z6ilPUV8V6a7nbQ6pr4eem3FwwOC3hJ55S9dE6E4DH95
 6gsyhBPuYSkpVf6k8ygi4XZlrGTssJzROe7Egle5dkvAt8wFaoKT65vOXz/+DJA69CUx
 BzpcgvQ/DgkIrByxNTKBLEwt7r2oGyGy7UIi9n6zySCGL58JOHfC3u2mjoqfH31xH/nx
 PkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jf0iD0Uy01XhbMi090dz1RGh1Cj6ASQdG9bTgwlfeCA=;
 b=CTM7tmbW1czC9c+KmvyxZlyt4p+is9/GLNUisCzsZWexKA4pGf9qTUHo/082/PItwz
 +kmSqdvzR5mp9SKjzlBu7+tr0eZ40cZglRcgi36zTyrvWHztz/m6sAK0BwcgYcXsmaPk
 g2K2a66dxLigN8KLxN6eQNnjwO7OeERAnnP/mOP7PL00cxOtXQzBEKCEKK5wRpSLRaZa
 OEn90ZPRpePq2FEmWwjkg+d0Ss9fz5h2fGctZQRvXyZUnsjUrBpqpzJOKhLRUBpjL32x
 1lcIOo8BamMSUJKp2S0ohJFbGSsr8wWvs4LnlYiezGt4xC1bgdUcvYg9I3n6ISQZn0QP
 Tdeg==
X-Gm-Message-State: APjAAAWEFrl/vNDoYEajGSFH6bt+2GYjwxQK20iGPojGuL0/lUYqUIm4
 0nDi+TC4VmIHelN+7i5G1vCRjsocQWje5BU1Mtvmyw==
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr8183098otg.91.1571410544166;
 Fri, 18 Oct 2019 07:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-20-richard.henderson@linaro.org>
 <CAFEAcA9oJ0P-g87caLKyT1mS2k7YhtNXAOhSgXuMy0bCGwX0WA@mail.gmail.com>
 <aa753ee9-40ce-d6c8-801f-eda74d76fd3d@linaro.org>
 <CAFEAcA--tmMXeFauHRAFeeLr+MXmQq4qcsoxpx1vOVM7ZuLoAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA--tmMXeFauHRAFeeLr+MXmQq4qcsoxpx1vOVM7ZuLoAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 15:55:33 +0100
Message-ID: <CAFEAcA9hzEvmvopeY=nLhFNObxVx4ZVOXjGPs8_u8ySO45Hzpg@mail.gmail.com>
Subject: Re: [PATCH v7 19/20] target/arm: Rebuild hflags for M-profile.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GfVYGOkpO5/j

On Fri, 18 Oct 2019 at 15:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 18 Oct 2019 at 15:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 10/18/19 5:25 AM, Peter Maydell wrote:
> > > This seems fragile -- we have to remember to add in
> > > a call to arm_rebuild_hflags() for every individual
> > > case of a memory-mapped system register that we choose
> > > to cache in tb flags. It doesn't seem consistent with
> > > the choice for A-profile to rebuild hflags for pretty
> > > much any sysreg write. Maybe it would be better to just
> > > always rebuild hflags at the end of nvic_sysreg_write() ?
> >
> > I thought about that, but there were too many returns out of the middle.  I
> > suppose a wrapper function would take care of that.
>
> I hadn't noticed the early returns from nvic_sysreg_write().
> You could just turn all the 'return MEMTX_OK's into a
> goto exit_ok and have that do the update.

PS: just for clarity, nvic_sysreg_write(), not nvic_writel().

thanks
-- PMM
