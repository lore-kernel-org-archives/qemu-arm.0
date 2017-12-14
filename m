Received: by 10.223.159.74 with SMTP id f10csp5785102wrg;
        Wed, 13 Dec 2017 18:09:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBosP9Jw6z70FFcyVUDgvRY4hZJuXEitXgHBWx+LfAGYbc3GdN+pTGIjEXI1w24zvZpHyikHX
X-Received: by 10.37.130.68 with SMTP id d4mr3380586ybn.249.1513217387059;
        Wed, 13 Dec 2017 18:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513217387; cv=none;
        d=google.com; s=arc-20160816;
        b=d8yUUgYZUdcMDptdMOv6/1yVbO5y13zCs9Kwpn0QwUIlKERNp+HL0xujLL5t7/wPnr
         HuS+boY1ZNb5qRghRyxYjCFdRyZd1BuQb5XTMu52hU7S+gS6bpuApRb4Cfyg1gqcMZ/j
         2YDF3HiYsOMsl2AL+nBdaWt9D4Gh+jaQ1vgqen4mOuhPx5p08/AGIy8jIU5wxyxwmr8S
         wctybe3t3ffzI2bIK+IVWcJnC2vZ4IJXGvRkOtF/+0FQOCYTmN0v2MYKn4h2kutve7fM
         +wRflbY7t99SNoZy9A4AGU9NvRNDNtxk53+vkEGrCV219hcFh/Ji4ZKuaf94IoFp3OD6
         jnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=YiWKQIBDjkg39m395IyUm6srVk2hirfDI2dQNki+uv4=;
        b=LTvSqK6HyPJpNkFB/CPLErkyg+uYtvg26dPu6YR3mKW8fbHtcQGHJuR2pFQylcAkSh
         o6JCxpeHAX87Gtn+kgw8DQRKEnDNJQPD7zpZgAvau6EQBMg/vOZE241J2Dn+ya0ZkrVk
         xBGnV7GzZqshbSdvP4kwgXsQ3O1z1ozUWPwZWylgxCgh+l3eDMddsZFfcEpTXqr1l8Fd
         g2M7T6ZIF0M1t/PtQwbQv4HPIGvSAP29n94NiLHnK7qIw2pdmPWTtcp6ImZiZpMPMz+y
         twKWgKffA7xMkl8GVCbh1FGfYPblZFlktCwIoFgrDPo5aIxyfCczRj398LpMqfOLb0aW
         iiPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nqnUM+UX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z189si118784ywe.398.2017.12.13.18.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 18:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nqnUM+UX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePIy2-0003G9-FC
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 21:09:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIxr-0003ES-RF
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:09:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIxr-0000sr-1a
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:09:35 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIxm-0000oi-O0; Wed, 13 Dec 2017 21:09:30 -0500
Received: by mail-qk0-x243.google.com with SMTP id 8so4514937qkj.3;
	Wed, 13 Dec 2017 18:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YiWKQIBDjkg39m395IyUm6srVk2hirfDI2dQNki+uv4=;
	b=nqnUM+UXtezbdB80qxEPotHBqphLanV+gEHAMW2wyhGpXqfkQqY3Ii8F0EsP9QH8mT
	qRjUNteM+sTW4wVyTepw6IyA+6I1/02Wga8Oh3wljH9YjgJYSTnerNPKsXHIyMlJ1t+W
	R3RtakYolQS1ySUtPG1yC/1Ia0y0XhR0aiz7slidlJy9gsGngnYzrgRjHWprbsvweMnU
	eyUTBncW9qpL+OrPZ5Yvcv8WJx3iOp+Rqo8TAzC29Ko6ST3UPlF8WIxkqSFX3gP8HR3t
	0V2kVrPYE/N0N+oaN9fCqqBs/rpodhFTzs6Os9/5DpHjtSVVcBxFwvGC2oe9xQmE/hg3
	Xzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=YiWKQIBDjkg39m395IyUm6srVk2hirfDI2dQNki+uv4=;
	b=Pc9M4BK96eKaZGAF37u9KdcDmICfJJqdKoZfy/KG6Nzxa1ATKCQqFYjvmzDD79/nMJ
	cwhFFV67tFuuEy+TayTrAnPmX2kfWd9hl2aYXAC9XBwMiFYmt6aJ6uwKwzo5SvZY4zXG
	kYCv9TSQUA6izmC0jY6/tj6719RzpS8zNL+6/++zjbE8d/A6rarnpM+OrbVlBzk3YoVs
	zvt8elPgVx7UhY2D5NVIoEW+84SoAUu374IUz3yf+UcOLLEWo8ld8AqZikrqE4Yav1dv
	scQRSoE5EkgkpQ8kOJr5aoYdVWRJa08IuO3enE5vsKyG5t8q1p/LjmTUJ4rXcNglP3/2
	dcGA==
X-Gm-Message-State: AKGB3mKsThcLPkVFzZf4ymVZsz3n7kzIw66fk4/P4M/1DHjeNhuGpjwO
	V9e1rMjaaqzz+lSpGf8Y7pc=
X-Received: by 10.55.41.206 with SMTP id p75mr12982273qkp.207.1513217369993;
	Wed, 13 Dec 2017 18:09:29 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id p8sm1911934qtj.70.2017.12.13.18.09.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:09:21 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<CAFEAcA-gEjU+rBWSL8V4d520DOVheZoJZ76p5=9hmkXk3NqeOw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <af0b2841-feb6-cf3b-ac7f-4b681916ee10@amsat.org>
Date: Wed, 13 Dec 2017 23:09:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gEjU+rBWSL8V4d520DOVheZoJZ76p5=9hmkXk3NqeOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 00/13] i.MX FEC and SD changes
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OLZXNxhnUak9

Hi Andrey, Peter,

On 12/12/2017 02:40 PM, Peter Maydell wrote:
> On 11 December 2017 at 21:29, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Hi everyone,
>>
>> This patchset is a spin-off from original i.MX7 support submission
>> found here [1], containing all of the patchest that are more or less
>> agreed upon and are ready (hopefully!) for inclusion.
[...]
> Incidentally we should use the new i.MX SDHCI controller in the
> imx6: coincidentally somebody ran into this bug recently:
> https://stackoverflow.com/questions/47538951/qemu-freescale-i-mx6-duallite-sabre-root-filesystem-does-not-mount/47552596
> 
> I'll retest that this patchset works with my imx6 image, and
> send a patch to sit on top of it to switch imx6 over to TYPE_IMX_USDHC.

If you don't mind, I'd like to take the patches 12/13 (SDHCI) and adapt
them to the SDHCI series I'm working on, to avoid a big diverge/clash.

Regards,

Phil.
