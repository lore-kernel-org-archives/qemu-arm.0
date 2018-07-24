Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6821057wru;
        Tue, 24 Jul 2018 06:30:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdzDqWg64TxEHIjt3cvuWNjVKXw7/+n6KAUnNtBwRaTQeGfy7NHUrKFga3hXOKpUnN3C0/L
X-Received: by 2002:a37:1845:: with SMTP id j66-v6mr14905272qkh.408.1532439009878;
        Tue, 24 Jul 2018 06:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532439009; cv=none;
        d=google.com; s=arc-20160816;
        b=INuxhauUPAjbOtnhfzqCZHFTkWftMlU+7rfY5ENY8Yv2rYU2xGUN0zrONVcJMwet48
         JciHMZ6DXfNmsrCJ2+cH6JK9Zw+DYRzRxTf8CLe1l25nyAQr56BiktkZ6uPHf7rlRoec
         eI1A5zJbhiwtFR1jQFKrAxoDW1qIo0tUFYRVMIKT3st97jQQ1DcJKnLFGOpWtY7EkFqm
         yzZERvk31vGrTcmiEZlldguYNPnvucVM7boKlQ7qE6d/AFHIcHkL4IpLUWv8UvN/5sEf
         pcpzVb3DrGRFtteZCPfWTDvk438+bIGiJNc3WlM51KX7rMIK+8uUKgeXN7euuhcFcVNr
         831A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=j4baYZjHtNjLHHhB1hiuuzg4WB7HQ+Uc9GCNC1NRTBY=;
        b=oQHW1gc91HcRqszO5Xnv3csNwnsD1edHvMWSf/j/sfKpPoCrKNe1mCsv6eLGP5+8cR
         K9mtCPiG+bVbsETydr9A4cZI2dS3TZR/z+DqWL0RGEDQkxXFxTDHD6zTllwA673ltOYL
         73gbbNu0f6uuUX4jlv0bEGzA+EmNNyWQIg2sTAkWUdkV2p89XNcPO0PBEpE7Gmn7WvGM
         EQNSFtLNgherIk+fyWSpl4zh/gP46bSRTUDlbO0mRaxn+V8soC3x896diveDzprZtr0K
         6mNQSKy0XDbwEUMgcSuZ1WCpLOf5XoDoGfFOTiI4BD93tyFikmzD5LVsGNA0NWBZXKTt
         i9MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Ew/6tOc9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p31-v6si3875456qtg.145.2018.07.24.06.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 06:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Ew/6tOc9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhxOC-00044A-FA
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 09:30:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fhxNl-00042r-Tb
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 09:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fhxNl-0005JN-2m
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 09:29:41 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:44568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fhxNk-0005Ie-SB; Tue, 24 Jul 2018 09:29:41 -0400
Received: by mail-pl0-x242.google.com with SMTP id m16-v6so1777064pls.11;
	Tue, 24 Jul 2018 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j4baYZjHtNjLHHhB1hiuuzg4WB7HQ+Uc9GCNC1NRTBY=;
	b=Ew/6tOc9rxzurzxGGRdMMV8o4m0oLeRgFa/iamPOGMBBrRtsCEga17Uf7bxPXA+X9h
	WlS2MMe6yUXIFDn7dSCSr77XuUXkg/cSF0W/VnHkZU86+w/YgEPOml0x09fqxdhGc5e8
	QSagvJTsZqCuHDRI/SMRNQwfFgqecMsCniHSdTEMNXT6T/9QusksIAOYh2SUUcXiP6VF
	6U81Uc3mGRKLKQy5txWruUFRmEM3DXre+HiIGwKKcYxob+L527Peg/lmMhq3IgBWv1Xw
	CorcH8cSpSwfrzTcFSbfMnShxATPBzZoGznCQ6qNwFExX6AjtKQ+sJc1q05kXnhk75s6
	aoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=j4baYZjHtNjLHHhB1hiuuzg4WB7HQ+Uc9GCNC1NRTBY=;
	b=GpgFSk0LTELCfeZZC5zBhz+W9mzTXabOB4zLg26Zg0Ev2kcTcMzWFfmkUT1SfQIhco
	C5+VR6vT1i2Fh6DesS4P1pSCxKbytKsqICb/cZnHqrNnc38VqZTjLK4IPpnEyMZN+lGR
	GIgrJsFAsV1iEpRCa7S4UyPugKlvCcC96DiWEVxqEnNayYdypXhCrnaYyyWYzhqCVShL
	lOAqwysJLlASC+hNaaLSJoCgfgqcQ/ILFMwz1dyQAFGE1aZaiUZpWtxMZT5QtW2sSnBw
	6MhXMDJ8Z+ifqOZTmL939yqV1dbHw3J/Ko+x/K7kAN25G9FMLcGDJaU7JYyGuclKZ6tQ
	Fskg==
X-Gm-Message-State: AOUpUlESVKiw2CGAvKNBIoGo2g/cTKtIbijXBWvdMDvE4WvDFb+kawGt
	h8CdIHLQ+jKBiIwZe8iZKck=
X-Received: by 2002:a17:902:342:: with SMTP id
	60-v6mr132418pld.15.1532438979893; 
	Tue, 24 Jul 2018 06:29:39 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.googlemail.com with ESMTPSA id
	t12-v6sm16672243pgg.72.2018.07.24.06.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 06:29:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180713150945.12348-1-peter.maydell@linaro.org>
	<5c3ec438-2265-94b4-4f35-71a79d838518@twiddle.net>
	<CAFEAcA8fFxKEbwC=rfp28cTMUT2eQVzGS8qc5tLowK3XYwEvrg@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <4b9f5913-ded1-c71f-9e57-70ad4f9f554b@twiddle.net>
Date: Tue, 24 Jul 2018 06:29:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8fFxKEbwC=rfp28cTMUT2eQVzGS8qc5tLowK3XYwEvrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-devel] [PATCH] accel/tcg: Check whether TLB entry is RAM
 consistently with how we set it up
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 72sCpel0F9Y4

On 07/24/2018 05:26 AM, Peter Maydell wrote:
> On 15 July 2018 at 01:37, Richard Henderson <rth@twiddle.net> wrote:
>> On 07/13/2018 10:09 AM, Peter Maydell wrote:
>>> @@ -939,29 +935,21 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>>>          }
>>>          assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>>>      }
>>> +    assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>>
>> Don't duplicate the assert; just move it.  Otherwise,
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I propose to put this patch into my target-arm.for-3.1 branch
> (with the duplicated assert deleted), unless you have another
> preference.

That's fine by me.


r~
