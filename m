Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2583882wru;
        Mon, 1 Jul 2019 05:13:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzd41gFNqcg2NXEs0G8GDnWk9E9CjGK1LvrzqxtfvfTdvrn5PD5jryX41Z5mzG0Z8JVKplo
X-Received: by 2002:a17:906:b216:: with SMTP id p22mr23178618ejz.273.1561983202788;
        Mon, 01 Jul 2019 05:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561983202; cv=none;
        d=google.com; s=arc-20160816;
        b=l1OHCXbI2Efu7oDOYLxy0aHAvfVEP/fySmQDwA8NVQvJ3RYL8bBo7VY/X95I0sv+km
         6TI32zyZvkshcQbrc9wb8BoxndVJeFPLtoZx9linpKybFIArUEqbke4GcCoXxo1IT4hF
         LE1whwhV14oY1NRI3zb3ocRYg9uOQkvK1lz04UkhAIwz1xseM6GXcZ/0eGiVwu8xa/Ho
         +i/mwqhzZwYTme8+kcxbuPYhGf1U1cCbSV9ZxopQUiKWdKTf0NicZ62dOqPYeuvzWQJY
         qJPdB1ZWR8N7gRBMjDk0I7q3txvS7W26++L9eFTRxCuw6YNAVKCELk/MzdgNW8a1ACCB
         SGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ojpK5Vnj35c3sG9gS1mYZguUk7VTk5K4mIty05dreN0=;
        b=tVoZCr29Hy1tX/FGB/cinz/QzeCCMdG8EQkrEWijI8P7v5PvXX8gbXF1czUAPEZLVB
         lW7n5mj+bHi38LUhL9Y2sJc4peIq/5zggT1WJg5CKCq+3O0p5v6pWoD7wh8EcKsygqAg
         EFVTlJV2QmqwMUeVcAA0oa43xknUFdyDbAedfAFxzw/nvB0wEP70ijcx5JqFWAxHN2dD
         Bl471Ed3kriiIw3HNXk8RyTzy6Hu+uIZ7iusm/DpzBDnRIBpDX0wxunm4CsxJeTLjy2g
         jzA2SY4eJ7HANn3app/SGRV3ppcS1YPkCiYrgv3F1fHvma0O5Z24chpPRm8TPiSZ5xBl
         YTig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UgZW08Yz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si2659997eju.13.2019.07.01.05.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UgZW08Yz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvBR-0007rg-TA
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhvB2-0007pI-LB
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhvB0-000182-6e
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:12:55 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhvB0-00015a-1u
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:12:54 -0400
Received: by mail-oi1-x242.google.com with SMTP id 65so9721883oid.13
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojpK5Vnj35c3sG9gS1mYZguUk7VTk5K4mIty05dreN0=;
 b=UgZW08YzIXK3CMkGPV5Og1YG/luvYh9bvQ+TZz5PAuyodIZKnbvevblySyY6XSCrJK
 3zlp8gtEtv1AaY3T5fLjSuprzl5MUl1tbAjIXRIMKVOjvWWL/Fuey3iZpuMoUvzfx0nM
 QIM+41MLDbxGKAYJYvXhdL1hEYMyDImEWQnT7IuZOTs96gQ5n8B+iTrUCOR1n+864h6w
 aRLQt3loF+unEpQAJOdeB8Wc708OFBH9+N7N4hSCn0jOGaVBsse8YGWtHQ825Tkbot4h
 Y9Iv1RyzFiyIb9W9TlIXnmxKLOqujcnHgOSfzq5BODsgkq/yohgbC+yM4SW/zy1WbyaJ
 lfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojpK5Vnj35c3sG9gS1mYZguUk7VTk5K4mIty05dreN0=;
 b=Dn05xM/VPzyhRIO9wsL//qWj2J/0TOa0CgVmRSeQhYIwvMPBUQHQSvYexPc7vmwB9l
 sJpiBc2CPy0vOyqx0alOK2Yf2Ds8LHnrpJ5XZTPjsqXoouVn9qO2optLkJgfXhQ2KPHP
 Nu4w0z2vPoJVf0cOJ0fZP6SksVZUJD6vMM3BuMnUp9NgUuQFaN6NV2/dSi5DnpBSfy0z
 SE1lyjVzrnejpkWAROsKsfsAUkwZnswKNCmEn7AsfYsvNNdkzJ7SIA6xdNEsip63schY
 LSw0hBYGF1pzwIzB3Hq4OuhiUeNI6RRVSsw38K0bSuNcd8H/GPU19ZunKQtxAgcmAPTj
 gNuA==
X-Gm-Message-State: APjAAAWSV3UI4FcPr+lIn96W5VQVy13dHQY3WNUjXoQNpvw9266aIIEn
 aHnFsyFV4ImrB4uls+HxzTUEWT4yQePWD5IEvSTLaQ==
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr6713435oic.170.1561983172849; 
 Mon, 01 Jul 2019 05:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <CAHQ1cqE5RZVYB1N2+CxGKNDb5NrtBOiQANhruZ6_6EbOThNwiw@mail.gmail.com>
In-Reply-To: <CAHQ1cqE5RZVYB1N2+CxGKNDb5NrtBOiQANhruZ6_6EbOThNwiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 13:12:42 +0100
Message-ID: <CAFEAcA9_UV+7p3HSEz8AZ84f7VEC8CTez2D7GSGWxcAbyXZ1=A@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 0/5] Various i.MX7 fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +2YUMR5R5yQL

On Tue, 18 Jun 2019 at 01:27, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> On Mon, Apr 15, 2019 at 6:39 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> >
> > Everyone:
> >
> > I recently revisited my i.MX7 work and this series contains all of the
> > fixes I had to make to get it to work with latest (5.1-rc1) Linux
> > kernel again as well as fixes for genuine bugs that I somehow missed
> > during original submission ("pci: designware" patches). Hopefully each
> > patch is self-explanatory.
> >
> > Feedback is welcome!
> >
>
> Is there any changes necessary for this to go in?

Oops, sorry we missed this (for future patches you can feel free
to ping them after a couple of weeks of no response).

If you could reply to Philippe's query on patch 1 about the
correct value for FSL_IMX7_DMA_APBH_SIZE that would be great,
but since that's a very minor issue and we have softfreeze
for the next release tomorrow, I'm going to take these patches
into target-arm.next as they stand. We can fix the size value
with a followup patch if necessary.

thanks
-- PMM
