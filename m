Received: by 10.223.159.74 with SMTP id f10csp6452191wrg;
        Thu, 14 Dec 2017 07:32:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBotJgnkh7o/fnwzM3iPojCiBQQ5Oodv87ZSS7dHpRXBH3rXyokkhMUZulta+3Jissp5iUNai
X-Received: by 10.37.19.69 with SMTP id 66mr801106ybt.77.1513265573235;
        Thu, 14 Dec 2017 07:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513265573; cv=none;
        d=google.com; s=arc-20160816;
        b=bRCYI/a/Z1QbeCH+GRuwZVN6M9iS/rahChvA9SNLsGRhoqfslKIetMqNLq7ugwZ/1A
         UdUIe8L0SIdOs/aqxeLnSaJMwHsYAOeJ23yoEL9NSlMEkEHF4yigzBadMNudcToaqsKx
         nR1yPeogwYyHuqiHtuEutIFHcDDR9WXh85xJDhQ7zyM4WmSVTjtTs9gXYOvnxppUxLCS
         Dpikc471zRp3uAXXrT6SaGGKTgj1zZsFnPgYI50uuOLQbmSaW8Z5LdjlWeAWLnElblQK
         qCr/62bn9/m4CYBJ4cg78hb35NVHGm8cyfVnjITwhAVaqcKfR7pu33Pae14GZo8dQJ47
         HzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VguaM2y0EMiTBrqWI3ZWRRFvooLmepY5R88LmV7C9/k=;
        b=0/KApzA9pTuCRfRbxGv9RBsjtDpDvuPOIe+cTuGjJuv1QmnZxLFWhzdu9kIuudDubO
         hVsLfJijaufmr1DdctKUZ+wdP1eT+4vxVz4mjdZKhl1/PSuWklT2PLSHd1DfoDVSog6h
         wI0Pa5aR/5fRT0WXm6FdQUvhvXcKVrK+AdO2zsA2QbjWQDqkih/7JTUmfCL0TviHY7cy
         G5hPa9cftm1RJokUHasHfpb9lgphUOZTsRcZvuAlgyu3kor5gjQCTea2c9J/EFFTkWHp
         m+OppTubrpwNdMBjSCagEo/LSyHpIyR6LwVkzHvnOZu6cUOjQEy1hExOQiKBp5XXeNSY
         hwPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kjw/MsPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q125si860986ywf.620.2017.12.14.07.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 07:32:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kjw/MsPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePVVE-0000cn-LU
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 10:32:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePVV2-0000Z9-Mh
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 10:32:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePVV1-0005N3-Sa
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 10:32:40 -0500
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:34777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePVUx-0005Kh-Ap; Thu, 14 Dec 2017 10:32:35 -0500
Received: by mail-qt0-x231.google.com with SMTP id 33so8448842qtv.1;
	Thu, 14 Dec 2017 07:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VguaM2y0EMiTBrqWI3ZWRRFvooLmepY5R88LmV7C9/k=;
	b=Kjw/MsPAD2CgWGArrdl/mG0NgFwPxsJzRTHu7LHZSDEiEq0kDqI2pEUWkXlSxMB0Bz
	MFKkCkGYjFx6bR17jyiYqhc3qut6JMLk4SyGG7ReVEj+KJsIEi8ts3OAUsfAN7E83DVH
	0vAfel9UJxEu8etdjgi0uLduKcSbzxfZ3R49/YtSx3wDcK3KfCsZ/Q0MdPzpYr8JuGU8
	mhj0AqMZMiaJb28PEwDhEpiljJBU14azga5zn/Z8E0rFMaJYCUXlkV8cX5qHW5EW/pvx
	gFrb8wk2I/4XQBsrbt71YK1b7qfUkqK9GvtK0+uPvJ7tp4eUZv6ZFVHP7x6DcS3GIpys
	uQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VguaM2y0EMiTBrqWI3ZWRRFvooLmepY5R88LmV7C9/k=;
	b=qFWTbeT8BkuoI8qq53/as6H1HERE9p9/7jSV/7BsLHWULAt9bdhTW2v21B3QubFilD
	EtUXfS1Y5K2nroq7fV+3Dcc7YRA1erGyKEyqsIZhZ8MpMyitdUPVfYgYjcypd+vlwbAt
	9lqgKOcIVm6TypKPZCoswgT6tn6LIIXCshqYhGIqlDnGWBJhgFAgNZYMoOCAZn5sfaiE
	J8jAtmwh+pWKmJtuBirSeCsAWBZKpUmpdtfcl+PEibVlYojz6ItJ53jvzQpVKD35Woau
	23rHLtC566Phk8gFPDDJVZH7CPtCC2uuCwfoV7n+DApt13RGEPYZUVHgUPp42RPQF0BK
	OujA==
X-Gm-Message-State: AKGB3mJ/zl88ByigOvRUpvoHH9I7ZykCNauWrxg7YIAsTcc0+WmO9tjk
	vtdcxaNDFPAyZkrFi1TYba0=
X-Received: by 10.200.27.129 with SMTP id z1mr17533093qtj.259.1513265554742;
	Thu, 14 Dec 2017 07:32:34 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	z17sm2537361qti.59.2017.12.14.07.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 07:32:33 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-13-andrew.smirnov@gmail.com>
	<CAFEAcA_6R61208pZ5rchSG0Oy4c_2eSGD+dO-LQs3Dncjnpf-Q@mail.gmail.com>
	<CAHQ1cqHhN=hLun2mzqvg0N3NkxEbPpBU1iEf5-mAdnHqEs3KYg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d56f5ba0-29d9-d5b4-7137-28e312e15a02@amsat.org>
Date: Thu, 14 Dec 2017 12:32:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqHhN=hLun2mzqvg0N3NkxEbPpBU1iEf5-mAdnHqEs3KYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [PATCH 12/13] sdhci: Add i.MX specific subtype of
 SDHCI
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
X-TUID: WIGeINILxzDB

Hi Andrey,

On 12/14/2017 11:03 AM, Andrey Smirnov wrote:
> On Tue, Dec 12, 2017 at 9:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 11 December 2017 at 21:30, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
[...]
>>> +    case ESDHC_DLL_CTRL:
>>> +    case ESDHC_TUNE_CTRL_STATUS:
>>> +    case 0x6c:
>>
>> Isn't there a name we can give 0x6c ?
>>
> 
> Unfortunately, not that I know of. It's a mystery register not listed
> in RM and the only place I can found it being mentioned is in Linux
> driver as a part of errata ESDHC_FLAG_ERR004536 fix, where it is used
> nameless as well.

This sets the SD CLK/RCLK frequency (10-bit) for the 104MB/sec bus speed
(UHS-I mode).

The "Sampling Clock Tuning Procedure" figure in the Spec v3 is helpful.

In my tree (where I work on UHS-I/II) I have:

#define SDHC_PRESET_SDR104              0x6c
FIELD(SDHC_PRESET_SDR104, CLKFREQ,           0, 10); /* since v3 */
FIELD(SDHC_PRESET_SDR104, CLKGEN,           10,  1); /* since v3 */
FIELD(SDHC_PRESET_SDR104, DRIVE_STRENGTH,   14,  2); /* since v3 (UHS-I
only) */

Regards,

Phil.
