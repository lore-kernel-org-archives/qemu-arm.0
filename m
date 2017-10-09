Received: by 10.223.197.9 with SMTP id q9csp2657127wrf;
        Mon, 9 Oct 2017 10:05:31 -0700 (PDT)
X-Received: by 10.55.51.205 with SMTP id z196mr9940754qkz.316.1507568731037;
        Mon, 09 Oct 2017 10:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507568731; cv=none;
        d=google.com; s=arc-20160816;
        b=P+nBNTas+ufuvU8FisKPXjqFHLNU656P8uyCJ1ep7oyuL8Ahygf5ZWoiY0UFtDCmte
         DT10PtkNvtS8bv091FMgkt3LUhgY1vNxdgw6euglcxFoFozjLTRBgySBTQSO5gnokz8v
         nq4CAQVwHAqXsCLFag5VfW+9PrRbhag1hEYJd1lxq81LAPwNbnmugGaagfq2j+kxa4U9
         4a45wtRACRTIVvNxLXzgttPLnPwFpwe2ew4spIgwQza54BuqUhMfld56aNoRlm+mg53+
         LLuaE8/re4xtC4kNRmmOlwhK/wB6WkH+yGwb3WIf+wW1JvRGXMHfceQ3wqsBIvAVPPSL
         omVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MzcuXMST5kx+rL1+qQtZ/+xVVVGn1IORbAnPEf3laRM=;
        b=LYJiNDoUY0WlKdfh3Tzkaw9j2M+pHPgX0FLHrH1NTPV4oDqK+DtFSTvklfXFE/SGOU
         vH7cpbLdzOq05dnlWi5TmsDjIXaiLe2H3YyfzwFxRAiknQJDvn7w66dNdxuSg+YoOgUL
         t0cv97XKDIhfiHspbI57AWWoGdbbIT3QDQLJuM7knFrvcxIrtOvtuB9xWg3wDcvlbPge
         /IPaXivjQL0e5OV6RYaURLjWfaCeT6F2VGN0sS2p3XGYcaQJvaSpHZzoJKAlRR+xWdTm
         xnqBzHvOmel/LJinhg7pdCTwErN+AbQ/yCSc6gGq17wIQ6wMhMWSJoaCSSYTiqwc38Hd
         7hAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MQJD5WOk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si5631787qtb.128.2017.10.09.10.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MQJD5WOk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1bUg-0008Nw-K4
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:05:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bT9-0007PW-5F
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bT8-0000f6-Gd
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:03:55 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:45339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bT8-0000eR-Al
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:03:54 -0400
Received: by mail-wm0-x232.google.com with SMTP id q124so24418100wmb.0
	for <qemu-devel@nongnu.org>; Mon, 09 Oct 2017 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MzcuXMST5kx+rL1+qQtZ/+xVVVGn1IORbAnPEf3laRM=;
	b=MQJD5WOkXYSD0EQjg6MHI2+SOBarPtOUpHERq0leiRHDkmGVpcddU4hxBGz6vIq5wh
	Jy/gWRf1iwx2TEIlu5uxh3A6sJt/sZ1Iu1dzpXJB0ckqH7W0GtpJ8cT0hdxnwXcu3lIw
	YBu0VL90kLHS5D/U3n/LfLFeC0SrWr5fQdg/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MzcuXMST5kx+rL1+qQtZ/+xVVVGn1IORbAnPEf3laRM=;
	b=jzs3Eh+dbBOtTDGZHUkDlkK4vGTMPbeoOUBEc2fUwsGSGaUdZz3n1ZNycInjc/rJCz
	ynIafFhKYJE0yUoRMjGS0zrCNhrxt6Xn3+RAf92V9W2ykB07z+GHozSzFJefbwUbL7eV
	t6sT63v77jlqH+eg/SJpjokLW9OK7NN80TioU9NEuOi223cKa1/mIEJvQZXponYVeg3h
	MIhSYsLR4ZGaxoeWMO5nIiW7ITPoNrQwKIonWlEg6sWP48DhYZMvULaV5YptU1/pyyAd
	7W5NmXy4sKC9WNUvmlOiZqEniM3Yo/AD/Lis+VaRqFg0OtCqJGQNspIWhWsXHiHVL05W
	y3YA==
X-Gm-Message-State: AMCzsaULTEWU6/DeMnaGDL8O2oYjJrgj+zWshuRQS29ElYI/HmYNTyrG
	9gCkNyvCpp1H+0hM7lFqvUH+cR5uJUqlNpG1675cxxEw
X-Google-Smtp-Source: AOwi7QAJ3bERVzNgjJB6GTE3uZAxMbHWIt0ETgu78c8lOVkgJJXgKBaht3VeC6iKo+UEIrhL3sJfzhvZMXCJIqukVJQ=
X-Received: by 10.28.22.66 with SMTP id 63mr8541609wmw.11.1507568633293; Mon,
	09 Oct 2017 10:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:03:32 -0700 (PDT)
In-Reply-To: <CAHQ1cqEQpgr1Qgwr9rUnpiUXs_=jKSnzpJFQ=Q6GK+5vpT-x6A@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-3-andrew.smirnov@gmail.com>
	<CAFEAcA9M9ZpcAHB4eZ2zh9jA6YSWpLoEPiAznnL2-SSdJoW+Mw@mail.gmail.com>
	<CAHQ1cqEQpgr1Qgwr9rUnpiUXs_=jKSnzpJFQ=Q6GK+5vpT-x6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:03:32 +0100
Message-ID: <CAFEAcA8eLWXNDiLEYQez-rknah86sdduGxUZy__UtDWS+VyGSQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-devel] [PATCH 02/17] imx_fec: Do not calculate FEC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RgL83/fIbJ8L

On 9 October 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Fri, Oct 6, 2017 at 6:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This looks a bit odd. Doesn't the hardware calculate the CRC here?
>>
>
> It does, it just seemed to me that since the hardware also has a "CRC
> error" bit in its status register, there would be few if any users of
> the actual calculated CRC value. Given how eTSEC emulation layer gets
> away without calculating CRC I thought that it might be possible to
> have this optimization here as well.

As a general rule QEMU should just emulate what the hardware does
(even if the usual guest software doesn't happen to care about
that corner of the specification).

thanks
-- PMM
