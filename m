Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp548129lfc;
        Tue, 19 Nov 2019 05:44:22 -0800 (PST)
X-Received: by 2002:a05:6830:14d6:: with SMTP id t22mr3652699otq.326.1574171062074;
        Tue, 19 Nov 2019 05:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574171062; cv=none;
        d=google.com; s=arc-20160816;
        b=cDftxXKRfiuEgBz0fU5TXSSaGbau9L5WYElCHTEKav2uaiAOEL2+kQ0FRo/FZEtSOd
         l+J5tCIeC/gRaZkD3cgq/Mj6oF0iyUrKQ9CiCNweTSGhZEkfDKOkGZfxbxao2QoRx1F7
         3HZ9/8Ktix4H3yYR+TUlWSGnDOJOdyP3yp+4ZaI6WSovE/i0xWVFWsYVgyRgGAy+YDQc
         2OxHyFD+ZJZHcT4nuzVVc0aY/zEfjZY887ovUWNYBKjFlq/WvhJHG3JWsNZKhUweWjg7
         AuSy9ic1xkwMjVlPWT9imKnzN+xG47IvibDb3pTXon/V4ir4dKzgXwkI0K09k/wJpeBK
         0AMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cF6s7xOGPRCBiWKruItyVajaDcuOUTOJ0DCY2qToMWY=;
        b=RerLLtITQ3o6AYV0T+4bXqRnZ/oc1LJkGKElyvPyZr9z1UtF0LtRUKSBsVxhEA46j6
         bkEVz6J5qouTfoaUEYxXBSfE4Au/gbHT6xh9bXW2+eEsTNZqWCY8RpZoOabrFavArwT1
         pglXCSQ5kdJyc3D5U2EcaZt6/YsDrzUGxSt707kyt/kXvbekIGtYOUUaF0lV1g5FGRz5
         6Tl1sqqfTkL/kW4b/BxnQfDKEvikCg4t7xibLl8xAHPH+d7SDjmrvv/NnWO1ttTRMyEj
         7byrmuUEsOufEGx245D85eEXK3gs5QjA7BzbC/Ct84T/Vz9dLBsGlrfYRRjfvnzpDVEx
         CjIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKXcbswJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u11sor11661823oth.117.2019.11.19.05.44.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Nov 2019 05:44:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKXcbswJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cF6s7xOGPRCBiWKruItyVajaDcuOUTOJ0DCY2qToMWY=;
        b=jKXcbswJ9xjHv6nLSil+Tk2pyFegYw06rmgF4JIApDjWxfoPpZzH8V4dG1EIy5n4Dr
         YgHvEEZ6g9WchWu5ekJB+nyXySSXie/4bLvBpbohV1Py50akjC7Y0c/dw5yDWnoirTQU
         iM2YNU3DBV7H9WDra94o1Jdaw2oEu26kb2OQfSkZzjexS1AfQWyVW6ANqxvR8ch/P091
         agcmdvYRg6QzGG1VVQJfPmWgbwh5nt5acndZnbRAWPrglOME6kc63seFP4Ap0K1O+gOP
         fRvK0MDXUziABMVhs71epGLikEu8wvwHYnDrQjerJnpoG6blc1HChKpMwLKp+nSTcF3N
         T21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cF6s7xOGPRCBiWKruItyVajaDcuOUTOJ0DCY2qToMWY=;
        b=h3m84W8gIQmefxUPwPVDrNvAsMGhdhlHaTJTtQsQSGokD4xBuHXgRj2uZoiLOKvoSl
         76vNExgyfBm+ovg9XQ/915uI/wq0urOc0TxojPB0uJDiNnL29BMtWMBYWx1iE5LnBWdB
         Eq+eOOLKk6Rc9kAgUyOYbZn3fnmOAbo2A/CVzLvwWP5KugHMtI6g9wwclg9LXE9MrEMY
         1i5wXjszuKa9ch2usjspsR3GNIOq9sxLUd9d5DGEqj61JrLo16VIoOharizDiX49YsQy
         5LypafoyJdxexBnHqAQT5MXKC+ksyQFESHuE/DXJDNqe/DnhAz0jEcCdwHNKwgrVABrt
         V3Kg==
X-Gm-Message-State: APjAAAVYC1KqNsewDRsQ9QfkmwaZB8Sl8WsK5+wvMnePe0WkhJcPnsBg
	dFypQH4A9roFTZdIUGxJsPlqFejpQC53rZg9qFtrIj23AIt/Ow==
X-Google-Smtp-Source: APXvYqxM7G30uAfAQmkpnLNBlNR+ok7yGPUxbJSK0SNZNM6G49V6oQGWdTbug5YLR3xJLmZtMH8NTUCOUQYXnc3vhso=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr3556749otq.221.1574171061592;
 Tue, 19 Nov 2019 05:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20191113221301.8768-1-joel@jms.id.au> <CAFEAcA8AL6865u8KaY3HjRH19mTP=JUJ3FAgf9VezJYPOEbmBg@mail.gmail.com>
 <3dbfb0eb-4ecb-35b4-9c8d-dec3fd6f083f@kaod.org>
In-Reply-To: <3dbfb0eb-4ecb-35b4-9c8d-dec3fd6f083f@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Nov 2019 13:44:10 +0000
Message-ID: <CAFEAcA82Nf=2tEyfgX5=_pi19C7PC8YODX2XCC=NafT6SUP38Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] arm/aspeed: Watchdog and SDRAM fixes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: P0Aq6pbBhQH3

On Thu, 14 Nov 2019 at 14:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> We are preparing, and reviewing, the initial 5.0 patchset
> which will contain the I2C pool buffer model plus the fixes
> Joel and I sent.

OK. I currently have in my 'maybe I should do something with this'
list these patchsets:
aspeed/i2c: Add support for pool and DMA transfer modes
arm/aspeed: Watchdog and SDRAM fixes
aspeed: AST2600 SMC fixes and tacoma-bmc machine
aspeed: rework inter model link properties

(I had a quick scan through and there's nothing in any of
them that looked odd to me, though I haven't done a detailed
review). Should I just assume that you'll send out a rollup
patchset with all of those once 5.0 is out ? Alternatively
I could apply them to the target-arm.for-5.0 branch I'm
currently keeping, which will become the first target-arm
pullreq once 5.0 reopens, if you prefer (and if you've
got on-list reviewed-by tags for them all).

thanks
-- PMM
