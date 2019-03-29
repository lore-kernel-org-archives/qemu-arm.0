Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1619435wrx;
        Fri, 29 Mar 2019 02:19:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6YQEDP7cPnry0+6HOZH+HjfecsXxorjibR5EfaRAyP+sq4Sy3MdgF5fntI5yc1sUqCO+d
X-Received: by 2002:adf:f48f:: with SMTP id l15mr29672749wro.248.1553851143716;
        Fri, 29 Mar 2019 02:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553851143; cv=none;
        d=google.com; s=arc-20160816;
        b=SU4g4ANAgpkSPpo2v/snd0jwiPxOR1ks9L9SJqpQpEasEuu22k00R9JHP6/Wi7I0lR
         1Py3y8ZUfPvQI/7xAS3X7NZky0D8FdzyYk17XDfuSJ44Yfu1rpdmCaMLqpjQ0SMdOzHR
         y7ByfQbMbQAYmiZRXlSjIKJx1HKwjpeqdTC+z9bFbEvuxa4nf5/k4NoZtWLZy86o82nx
         aTeYHT4IL49aHm/toy0thCFaumwf/0c7DjwLrhbOXvP+kUN2CsUh9j+rKRSUNJtVnz2H
         nT6GSx6137DswYXn8XQcLNfczud5exl5NuFqI3AKNzI8oOJKo1XpHreOmhePbL6VUl4x
         8x5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i49epHaXCfPZ2OdQ44awi2mn6RJqxoQx6gxJMXwcPSw=;
        b=ux6ZXYj637JjRyGyfug/JtwEtJQShsm+ZShYYi5A9M7mM+6GazD75it+oiwgb/mLu/
         Uvlhes2fXZFQ0XMk0yubfJcbYQ9fqqYdjKZxDGDgwoecwiK5xccBz5O+CHKDN4Kn1iKd
         ZWMIV0is4SvEBT1c2UfgYQ7MzRc8ojP5zXnrFmtATwpqszfoB/c3WgH7IOUVvbaOnIvh
         tpdk9iAMkaEpB8/Mdyh0GcN/frfM+cD4G5O6yCv2o5V5wXYqDiVG9INSYyur6+Fev4VM
         alrMAusyL7CTz3v/QVap8m2zdGIB1kotbtIkYjWkSs2deYikm3a5Iv17pkAkQhoxbrNY
         LPsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cBvZjUK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si912939wrq.120.2019.03.29.02.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 02:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cBvZjUK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9nfC-0007k7-PQ
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 05:19:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9nf1-0007jm-33
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9nez-0000jv-5v
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:18:50 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9nex-0000hY-1P
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:18:47 -0400
Received: by mail-oi1-x242.google.com with SMTP id l203so465306oia.3
	for <qemu-arm@nongnu.org>; Fri, 29 Mar 2019 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i49epHaXCfPZ2OdQ44awi2mn6RJqxoQx6gxJMXwcPSw=;
	b=cBvZjUK97t2OIP5dsnO3VeAF+0VZ2L88N7pRXfDv2pygjUIUuuVs7VCu9HC+bi9gS2
	s1w94V4ps6ih8ECVGh1U6EGEVYbb98mpfiduWa04tDymyeWUwVOBOnDZH6uLOoq/EUaW
	nbvbsaYLEkWpr1k+CqC2aScOpcm++Og7YzmNckZtYa7YTmxWvzDBZ6hWwe3nWBM+WQQt
	REfcXiMQSQwtxRDjD6ntdSpLMS1eHSgC3/tFI86dqMJUpcHDhYBSIBpeogHmVXALzUJa
	tCU050RnZI2HJNs8sAnDAuHgBVhpFCJE7ZeTJUe+S3dZrjK73P9WI2NChp0vkKL0IBnd
	F/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i49epHaXCfPZ2OdQ44awi2mn6RJqxoQx6gxJMXwcPSw=;
	b=BBN0RVlcJo4mBtcfvHe4gJkfAPGy5ut7QZE9A0ilVV8T3UancBamvT77siaXZRh79P
	FO8LYlP1uNqC+JMrdreZ0pq+gbi/OflZtNM8154ZohQO1xDHp7H19QvA7WnZsDVlzs+r
	hPtuz7KkcQY8HjD2lxe/C8grNil2QW48SDiweUxGhpm/m60CxHNBNmPlyAkcUtsZ7+MX
	Uy2aks8X2223JxQ89D5IvyfEDTxEf1R9HS/Z51TFQ5alEyH+lkAEgrVhSfDkQ0IP1CQT
	9gXppsrMFx3GnjT3tzcn8EY3EA/X8CBfAwOoVt0f8huZUi9P3a374O6UAEyrfqG23z7Y
	XwLg==
X-Gm-Message-State: APjAAAU92VA2zU5cCjad9GyIqyQ3kcL0wM64v5ezs7K2CsAjQhi+I/AL
	94QGviftyO4m3iod3pqvQHuP+Uu9ckeyzUGiSDJofw==
X-Received: by 2002:aca:c1c1:: with SMTP id r184mr2849315oif.146.1553851125314;
	Fri, 29 Mar 2019 02:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190328143003.16702-1-peter.maydell@linaro.org>
	<121a87be-4322-399b-4d5e-c4fb8580794c@linaro.org>
In-Reply-To: <121a87be-4322-399b-4d5e-c4fb8580794c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Mar 2019 09:18:34 +0000
Message-ID: <CAFEAcA-mXgNzWz7i75JkjzjcwM5TfeW7Zn9oCbsxmAOfpmjmGQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] target/arm: Stop using
 variable length array in dc_zva
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: voxnTz29914c

On Thu, 28 Mar 2019 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/28/19 7:30 AM, Peter Maydell wrote:
> > -        void *hostaddr[maxidx];
> > +        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
>
> A very fancy way of writing "2".

Yes, but I thought this made the relationship between the constant
size and what maxidx a little clearer.
>
> >          int try, i;
> >          unsigned mmu_idx = cpu_mmu_index(env, false);
> >          TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
> >
> > +        assert(maxidx <= sizeof(hostaddr));
>
> ARRAY_SIZE(hostaddr).

Oops, yes.

thanks
-- PMM
