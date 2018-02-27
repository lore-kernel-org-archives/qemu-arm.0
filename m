Received: by 10.28.71.27 with SMTP id u27csp4648602wma;
        Tue, 27 Feb 2018 02:12:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELujjhkLJOT6w5YpmCiy2RsEPTraJw74SGLfTMBdww48qAS34K+yesVh0pXwHGV48+axmQpP
X-Received: by 2002:a25:8e10:: with SMTP id p16-v6mr9424088ybl.210.1519726338802;
        Tue, 27 Feb 2018 02:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519726338; cv=none;
        d=google.com; s=arc-20160816;
        b=R13idcbcsaq8blw9GRdx0z+fNNCv7rWoCNqSYfsHT/PanmQLjoMXeTC64ojRpH2pSX
         aMGV3Nskdj4XGOqhMfVyjLt89i2JIK2DuXe5Fh3Md+Q1GsprW+dKuD3HHdR8xmjWuYiW
         bTfCUaRWr0dVAKl+sefmO2MmCDAriCT26Aw8Bv9zDVlf5oE6NVFAaHNOh3uUJLMu+S2Z
         9PXKKhElVWXcyDR1+44Ce7M5QtrbJiQf5WgLDSvwmqF1HDf3eihzOSWs19Bobexsn5zF
         pD/tFrlK7N1bG3BTtQpvCMgx4AWbH1120xwviwbb6K8/QUqp4kqkRRtS4kodWZm/FNbR
         V2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=eK7jBiiQSLnR+tO/1kiDVK6SBbtCpfWUUWrrPK2XrF8=;
        b=stl5TweD84tQM8uIkahSbdDHcfbZ+Xofg8DTCnB/uX4R68iOQC7SCMYWB1hZbDMsGN
         P+/QXTBk4tUDcfIsOGT3t008qTko/VdiRFYXz/G8L/Hi+EOfQzMBjnwU0lRGiA0mbr0P
         d4l6O87Mm5mzAePwv8/K2aL1BOO3xzQBDWZIoTWSx6Ra5FT28Kdg17YNazTx1yX0JDAV
         SJpLmVAntSEckq6TISvscvru8Lu9e3dQ90Bv+hQ0K0ozmAlFrF71izYwOQ+4MgpP9Qzo
         VRF0oXel9p34HbUwtEF9pJOEOl8ikJYlxZlSBJUxCA+JHBpKvZE/IieMntNHdxkgjMdR
         OK+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UIqUDA7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3-v6si1858200ybn.643.2018.02.27.02.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UIqUDA7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcF8-0001mp-3t
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:12:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqcD3-0008Pt-Fb
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqcCx-00042f-JF
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:10:09 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:35191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqcCx-00042J-DC
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:10:03 -0500
Received: by mail-ot0-x243.google.com with SMTP id w2so705981otg.2
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 02:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eK7jBiiQSLnR+tO/1kiDVK6SBbtCpfWUUWrrPK2XrF8=;
	b=UIqUDA7cRw8SXI/lq+AcGPiR9+G7mIphHFfbLeoISKYlvRHGOApFgEjar9uT3Q4BfX
	L3xCL3d+7aNQa3F4KhfOCJtpxwXW1HpgCLkUVr5OWUgqfyaYlqfNheJe5mdwwtsR9SbC
	K/MFI74fmKCtTbttSUpRj1/jPKYVhpDl5MYjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eK7jBiiQSLnR+tO/1kiDVK6SBbtCpfWUUWrrPK2XrF8=;
	b=EjeWIWXdub5GcG3coHgHpoPC5ydIQeI5ROal2dhKK6DVghCYPrx6b+0P/b6YrG7FkI
	DZC2ye20YObp6YX42dzZ5zuKFMqEJGypDpW70qd4Fu3aC8R8fEQxUB5kOo2+CXvOF5pd
	zhDvkHhYuw66rJCj2xdJA35LjEbRUYKyCOBNoTRv4eQ+oD05q0cS4yfdrtAmOvVgzZG0
	vqg/y3pYz9i2xHb5dYzfMVLTkAK/z4a1qy7d6LWuUDnPpr8/wsXMULnNRodYlMnk19eq
	f6N3Xceu5yodJMN7hrYCTGSBVw5Jmh0q7ZNLKzdcPndlS3npOAjgPi8sCYJKlCfvA3Hi
	i6Aw==
X-Gm-Message-State: APf1xPBvY2m5z5KVUrxj/Nfngrg4ecFBU5/3fxxCcIJtHwqfIhjdvVs6
	sYEstzuepIK1qWtcg0NrU9jR8I+4HSo6B9JaZi8dqw==
X-Received: by 10.157.72.231 with SMTP id a36mr10161871otj.308.1519726202790; 
	Tue, 27 Feb 2018 02:10:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 02:09:42 -0800 (PST)
In-Reply-To: <CACRpkdZLwbVr2O5__GpHt+y0pqpk3-j_AXD_qv5JQc3JZNRm7A@mail.gmail.com>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
	<eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
	<CACRpkdZLwbVr2O5__GpHt+y0pqpk3-j_AXD_qv5JQc3JZNRm7A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 10:09:42 +0000
Message-ID: <CAFEAcA-jqgBxoEprjTPed0k_vZFGrAVd87Gj5nAfFysau4WrSw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon
 Image SII9022
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sibTyfGbDJE5

On 27 February 2018 at 07:41, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Sat, Feb 17, 2018 at 7:32 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
>
>> [Me]
>>> +#define DEBUG_SII9022 0
>>> +
>>> +#define DPRINTF(fmt, ...) \
>>> +    do { \
>>> +        if (DEBUG_SII9022) { \
>>> +            printf("sii9022: " fmt, ## __VA_ARGS__); \
>>> +        } \
>>> +    } while (0)
>>
>> Can you replace DPRINTF() by trace events?
>
> Absolutely but which ones?
>
> I do not feel senior enough to also invent new trace events
> for displays or I2C devices...

Just put a trace event where you've put DPRINTF debug statements.

thanks
-- PMM
