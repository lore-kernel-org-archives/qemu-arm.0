Received: by 10.28.71.27 with SMTP id u27csp3928585wma;
        Tue, 23 Jan 2018 03:23:52 -0800 (PST)
X-Google-Smtp-Source: AH8x226rXLR/Tq87FH7MLDpRoYLyOXwOXSS2/NuUBaJ8wuVSjq85GU5tHmasosxkVz/GN6pkE431
X-Received: by 10.37.135.18 with SMTP id a18mr2104374ybl.442.1516706632536;
        Tue, 23 Jan 2018 03:23:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516706632; cv=none;
        d=google.com; s=arc-20160816;
        b=i+7q7z7yjYAZawfNSAheoN3D+M9sZco1kfFTuWFZ6RQTfiOp3oy13NLe6M9lOf0I1j
         fdmhqT+A2ZJ1hWe3qv70GGHD9ermtaGFE+2y91z2l2kb14czSDpPIY2FSgRkMtbvEw+q
         uQjJF+xVv4ps7CO4wNgaZSpmnoqTNCUmj3l0B5accRdF+W+u3Hj9waHfif1Y4joJkZSN
         zn8EI5RXj/F/JYK14WYnFcFnAh6pnX44ICgsLw/1Bs0XGy0ptMUclUq1F/tA975lNxeM
         BuLn7K3egDUOmBXEqCXwLsdbZXkN/KsuIQn0Y8Obemv8DcmYiJ4TbxbEaE+fo5lyoCiJ
         a15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YqxCKSKEnXG1RLRXIarr9bdB6yDQTP02/W+UQsDp3U0=;
        b=lEnrvIpmk93SSMoxC4BXpNxdPzWr5EFCqUWtaVrc+FzhjyokHLhT3F0UKjmBSX0sCQ
         nZhIt3F/MCsuKhDgfwa86Ym5hr8OBi8dAPXotUWLPg+QFs5Ie5MnWEvKSprA6kKFE/7C
         +p8fMiTGKuvQCw+JLXEZxLMLSKPxHp/XG9NzPUd3AAWgNpZzgfH5gqDdchBrAMdhrmNI
         IdqVJ1q+WlN0jzFtUhv0bt+VlCb+nMt6Il5LBSytU+X283CKFIYB/KEAe1GFJauUH/W+
         HHRuQJK50yYDUZR2x8h6n0PzlDJnPvsOqecowp+ooqGA19PfFessr811UvMupk/rWJ43
         9/3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jxezqfDx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t92si2391944ybi.251.2018.01.23.03.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 03:23:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jxezqfDx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edwgB-0001oG-VC
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 06:23:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edwet-0000qw-9m
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:22:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edwes-00006p-HW
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:22:31 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1edwes-000064-Do
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:22:30 -0500
Received: by mail-oi0-x243.google.com with SMTP id m83so77325oik.8
	for <qemu-arm@nongnu.org>; Tue, 23 Jan 2018 03:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YqxCKSKEnXG1RLRXIarr9bdB6yDQTP02/W+UQsDp3U0=;
	b=jxezqfDxA8/KZElEE4gxU8rNed31LBOE6eN01KKPvTTTKGZM+NNNfcsRsCJTJteWCN
	3IGS1QTTF4AOQZJcHDTaQN2MyqaEhj7poNMbSj0u+d2vkdDcJyA6GuNtDZHVWOQUt4wP
	eWSu4mZNBjthi+mpRICZGCCkE3Ix2h6AKGXSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YqxCKSKEnXG1RLRXIarr9bdB6yDQTP02/W+UQsDp3U0=;
	b=ZtCFPRYC9+qQ7+vWFggK7eV6lQC2IZmQpQZdQ0roIdgYWgkLCQJZ7AFHZDK6pNpsqG
	bAJ2XEQyTfMrwpebVSIcOSMXGJpY8R9gd65Xan2MCmxGg3c9gNrJyfeBdVmxg2fELIN4
	LNmxWxgTRAcuzEK/dS19F35S7h7fLFCMa7/G+e8IN4ykrCS3Bc0JZS/asZo/EJie+7m3
	YfRW7O34VU68yKPMJXokO5HjkfrSw+V4TMK37ltXoOTya/Y0WZuf7k+hvRv+WuVlZguu
	WLGlMsnTsIrdhWs1SHPw6ZrTS2PbxRL7p9xNSMez/SQQbso+p8Nok3eCkLh9pZ/XrdjB
	nPGA==
X-Gm-Message-State: AKwxytdFiOS9WWrPP6d8NpdqpK5iPn2egjzwuQgEOuowFZSi9Z19Rflp
	ZdhfNVAazByAv1Tqla2XGiOXrvH9iuv6PXaAC/A6DQ==
X-Received: by 10.202.180.69 with SMTP id d66mr6263458oif.63.1516706549485;
	Tue, 23 Jan 2018 03:22:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Tue, 23 Jan 2018 03:22:09 -0800 (PST)
In-Reply-To: <CADYoBw3qjq_CJpp3dQvpHvAgfx-FjhPvPgZ4xTpSBt4LEGiiOw@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
	<CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
	<alpine.BSF.2.21.1801221224400.67089@zero.eik.bme.hu>
	<CADYoBw3qjq_CJpp3dQvpHvAgfx-FjhPvPgZ4xTpSBt4LEGiiOw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 11:22:09 +0000
Message-ID: <CAFEAcA-uedKpcQGXb1UY_orGpD65Xra3aBpUpwb2RxFo3hB4Kw@mail.gmail.com>
To: bzt bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wvuy6CKp+9fI

On 23 January 2018 at 11:13, bzt bzt <bztemail@gmail.com> wrote:
> There's a huge misunderstanding here. I have a working qemu for about half a
> year now, and I don't need it merged. It's not my goal to submit a patch to
> qemu in any way, I just did that because I had modified an Open Source
> software and wanted to share it with the community. If you don't merge my
> patch, I don't care. Other users will.

Unfortunately we legally can't merge your patch (even if somebody
else is willing to do the work of cleaning it up) because you
haven't provided a signed-off-by line...

thanks
-- PMM
