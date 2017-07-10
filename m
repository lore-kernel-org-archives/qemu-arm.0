Received: by 10.25.44.15 with SMTP id s15csp3485777lfs;
        Mon, 10 Jul 2017 07:35:55 -0700 (PDT)
X-Received: by 10.28.30.138 with SMTP id e132mr8035893wme.43.1499697355074;
        Mon, 10 Jul 2017 07:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499697355; cv=none;
        d=google.com; s=arc-20160816;
        b=tFCi3WOTv4QyDmzvMQF9pVO2L6WC+q3hTeNxnWczmbIIw+zXBEtHspD7GOVpdFNIoJ
         wNYiKDqLqmke+bV6e+sBK8cpc10THXTUMfGcoasdz7K7aUij9wu11sDcusb9LOrSkZ7F
         IWYDJ+vuoVFTrY3irxGwNDqnbfIZFA1dt1aaG5cSpFDE1gmpIUAOsXa2TrBeqDwO7vex
         p5qfXVN+gUkoWvqxLvLD1TuCcqvcftHUwAQM9klWUIB8NeTUM42GTgJYR8WLzN0OFSTF
         l8QlHBwZzBr24k8Xf4ZBZUVOEc3AII6uzA4a9qo0KuxCqzXTCsvalxDd/MLhQ+YaXfEu
         06Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mDYlEfMYTyYBnwQHRwSJUthp/bb70MKdnb03LAWt9ug=;
        b=LaUNshwvapihGLebeTSAEp/lASb9B//x+gbLyPHA7rnS/y2C+gSW4Pc2kXlM3KfFo6
         p1BfMIUgtqVO74GZacklcqE/iBRLALygxccwJJnQVCgsyEWKeFc4Y+49PxJE6esIrUwZ
         a/9gTT8mezjhxgo5o0LEFt7tVWpu+RiQEgaxMgdTqJ427p6oLMB1dmH5ZqP3yghuw9uY
         +d3tvHvJGlSAJhMDWc3e3BFlGcqDxlot24v2NAP81wUot2Bzarg9a5etIV3t+IYAGBMC
         7z9zo6M05YEDQtrPVAW88+LJWOQl76f3noPRLG9TNmuLGrzzFdHdozwcwB3cghjnXHLp
         D37A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=AqAnJq+Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x231.google.com (mail-wr0-x231.google.com. [2a00:1450:400c:c0c::231])
        by mx.google.com with ESMTPS id v67si6698461wme.80.2017.07.10.07.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 07:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) client-ip=2a00:1450:400c:c0c::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=AqAnJq+Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x231.google.com with SMTP id 77so141370435wrb.1
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mDYlEfMYTyYBnwQHRwSJUthp/bb70MKdnb03LAWt9ug=;
        b=AqAnJq+Y4Td8uUW54bv3w5Twnp3YpVYMYAd/4pieObpvPpm2z7/9EDFSko/L0mFgzS
         rK4bzrl5K05kU4FiwRuCByqT9ptAKKBrY3HTxsUYmn56mVOmA11oswKgqVxO+Ivf+Oyf
         rrByb9Ep3vne5XYQF2Xp0HDr+yOdnt44MrRS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mDYlEfMYTyYBnwQHRwSJUthp/bb70MKdnb03LAWt9ug=;
        b=c9t1nIkD7cm7EfawzWd2CbC8tmvT49mIeYRF9op4jTg36Flqm8R8li8nZHt7c/epO+
         kIRSQsCh58tn8EhDZHQTRjYhfLjDCH8VF9tiujJj/xJzT9T0/bni/7wiGYWmTbogNa1H
         wSJEuCoPbiO0mFuHyESzW+YczS2vqZKpgqk23oFGLgZJci1Hjt6omoxWX5JTkGJP9RFb
         bTjP1WS+H3SU842LYvksksgZtKywEU4LnE/6G35YJfTgSVw3GX0rfmOkibAki+XufIyr
         jyaMNIauWwu+sqEZJovfN1Nq3ysSilx78Hxxz4rmKE6XnIkf4vkjomjaHHbbQ2+/ySgc
         kwfw==
X-Gm-Message-State: AIVw111TDS6pv1HxehVyAjX/QmUgKjDWPjJ1gr/xOk7kh+ZnfGo57nUn
	1s5SuX7M6afuKyX+HMoB9EVpAb3vY8v7AI6DFQ==
X-Received: by 10.28.129.205 with SMTP id c196mr8048547wmd.120.1499697354508;
 Mon, 10 Jul 2017 07:35:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 07:35:34 -0700 (PDT)
In-Reply-To: <20170710142850.10468-1-alex.bennee@linaro.org>
References: <20170710142850.10468-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 15:35:34 +0100
Message-ID: <CAFEAcA-eLe6b-0pKkoam1TBQD680W0nunARrSFxQTgUkoqug+w@mail.gmail.com>
Subject: Re: [RFC PATCH] include/exec/cpu-defs.h: try and make SoftMMU page
 size match target
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Pranith Kumar <bobby.prani@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: XB7VC4ptdZQB

On 10 July 2017 at 15:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> While the SoftMMU is not emulating the target MMU of a system there is
> a relationship between its page size and that of the target. If the
> target MMU is full featured the functions called to re-fill the
> entries in the SoftMMU entries start moving up the perf profiles. If
> we can we should try and prevent too much thrashing around by having
> the page sizes the same.
>
> Ideally we should use TARGET_PAGE_BITS_MIN but that potentially
> involves a fair bit of #include re-jigging so I went for 10 bits (1k
> pages) which I think is the smallest of all our emulated systems.

The figures certainly show an improvement, but it's not clear
to me why this is related to the target's page size rather than
just being a "bigger is better" kind of thing?

thanks
-- PMM
