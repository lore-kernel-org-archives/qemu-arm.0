Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp371484wme;
        Tue, 15 May 2018 07:54:00 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZptud+dGSsvMb/ykLp/6fzBf1P8iqRiGCEfl7kkrWUuTtzy1ppui+NWIt8uAum5WjKzmzFh
X-Received: by 2002:ac8:108d:: with SMTP id a13-v6mr14288053qtj.214.1526396040626;
        Tue, 15 May 2018 07:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526396040; cv=none;
        d=google.com; s=arc-20160816;
        b=jLXAbtvzARFKI+q6Z7gvjRU6xgG27Mrf4m5yt932VXv8uzh8Z2240S/cD9SukAf5jY
         7r41tXU2COL9p4R9Fg2lGk02t1yX+Gr2KhOwnWdOuVJMOFQ3ADkBu21YBkyCAfbl474Q
         28pUuNNKincCNv982FQA1TYN3ZHgWI7/TQZMu/i2JWNS0GC3OD1Aafp5VTeW4wS3AeOU
         mudlVzG3QAo0y1XniHZpkCM6t7bTMQ5bFSdZPHV/fgkLWK9XoyLnRwG0UQLN6VZZbV7G
         Nss2hNhvrkpaLaPwQbE0r27Xv5wQTtvKcUJkYS1e1kHBUbVdWUzNC4Mig3NDritRusjH
         JpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=WblDzjtC/WQD0qv0L4bRcTKtq8hgD337epbfV/8WFSI=;
        b=DlvvZqA/O2D7CQ2KQJZDHofyz9tdR7FWpfj5oMqVxcEbpNoxeY+CEPy4e4DIFgx/hz
         GP0DX2y6Y8wLWofez6V+qYnoYgoY6BU/UwIs8ybfvBpPvi7jx+im3om7o7ayY+qkxK56
         RjRgPXjTSlcj+A6TiXC7TTR774jrjG1ma3otUitUN7tMSPJCcsShXQS3SznUHta2BA1Y
         o5igz/t5og60EYCZDeCiKfoWRNXr7A0paMQAWQmki3Let15Ynp0+A99S3gShU/ws+eDX
         ECq5VjQh8J/+w4RA4WVAydvBjC5sLZCTOo7G6dYZyHkRvqF7H2MObJX34U8vY6f22LDD
         Wz7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hdtTG7E0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t126-v6si232032qkc.131.2018.05.15.07.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 May 2018 07:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hdtTG7E0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIbKy-0008Hp-4f
	for alex.bennee@linaro.org; Tue, 15 May 2018 10:54:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIbJ7-0007FR-Ha
	for qemu-devel@nongnu.org; Tue, 15 May 2018 10:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIbJ6-0008QO-Mc
	for qemu-devel@nongnu.org; Tue, 15 May 2018 10:52:05 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:41043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fIbJ6-0008Pl-Hn
	for qemu-devel@nongnu.org; Tue, 15 May 2018 10:52:04 -0400
Received: by mail-ot0-x243.google.com with SMTP id t1-v6so495986oth.8
	for <qemu-devel@nongnu.org>; Tue, 15 May 2018 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WblDzjtC/WQD0qv0L4bRcTKtq8hgD337epbfV/8WFSI=;
	b=hdtTG7E05bV0Mtz37ttEKnW0lJNPrffU3RMfyYEtmeZME2hLON5xavnoFZmf3vYQs6
	TvSJuPUJWYOAVmzHnE8+vy8JNVe7NbC3o7JuIwmcGE/aeMWvXTjMCDFR06nc+TNvCe93
	Muao31H8GMenprbwupmn1ZZ8zatbGIrC7tJeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WblDzjtC/WQD0qv0L4bRcTKtq8hgD337epbfV/8WFSI=;
	b=XOielPq/o0+OB6n5A/Pnm4NxklMYki7a6Raa++j6He4+Ur/Fr7ZinNQp6zmkpJ1DL1
	bh/lrAutncu/kQM2mNI7Y6Yxi+2XVy+b8E3ptp5vopgWQVZZYAlepciSeLgb6BmfDMjs
	f0n6Zacm54CQGd4qP/b5o85PdvVyLuKvyeuyKYKZEvyC4fO1oZR9lLoCWg0hwlr5PP8z
	L9x55OQ7QMb/XL0PvOXScfItPs8+LsT3a55hUmn4LGPpnDROt1B42aKa8xGbi3ZGIbZz
	ZVmmSI9kwupPFLSHek4kcaLcmDnmv+wqHpoP5l4mEalTiXV8hkTV7lxE5t7BlH2ee7ds
	77ew==
X-Gm-Message-State: ALKqPwczsDZ03sUEOEQMSafBcj6E4cR4POZGGsldfcCdPncwq5LDBGo5
	yLgctLsSi189FM5ZHLTbKA78I7sp7nGMEg1N4eHxvw==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr11480329otd.210.1526395923431; 
	Tue, 15 May 2018 07:52:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 15 May 2018 07:51:42
	-0700 (PDT)
In-Reply-To: <291b8b6f-1692-a5ee-f44c-4f8c4dd614fa@twiddle.net>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
	<99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
	<CAFEAcA81y1r5N2zi5fPoV5iZ9dd0YBeThcX=qXdJXdNSNO8nsA@mail.gmail.com>
	<291b8b6f-1692-a5ee-f44c-4f8c4dd614fa@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 May 2018 15:51:42 +0100
Message-ID: <CAFEAcA_WPidxh81a9vgCTm2fe3G_zKybNTfA0PFGYn=UKFfxGg@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GcvzKjOpvLU3

On 15 May 2018 at 15:46, Richard Henderson <rth@twiddle.net> wrote:
> On 05/15/2018 06:25 AM, Peter Maydell wrote:
>> I guess that having the compiler check is better than finding them
>> later with coverity. It's a shame gcc doesn't support the standard
>> mechanism of using /* fallthrough */ to mark these, though.
>
> It does.  Apparently not by default anymore, however:
>
> @item @option{-Wimplicit-fallthrough=0} disables the warning altogether.
>
> @item @option{-Wimplicit-fallthrough=1} matches @code{.*} regular
> expression, any comment is used as fallthrough comment.
>
> @item @option{-Wimplicit-fallthrough=2} case insensitively matches
> @code{.*falls?[ \t-]*thr(ough|u).*} regular expression.
>
> @item @option{-Wimplicit-fallthrough=3} case sensitively matches one of the
> following regular expressions:
> ...
>
> I think either =2 or =1 would work for us in QEMU.

1 sounds too broad, we don't want any old comment to count.
2 is probably what we want.

thanks
-- PMM
