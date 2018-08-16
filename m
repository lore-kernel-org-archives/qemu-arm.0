Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1619466wru;
        Thu, 16 Aug 2018 02:10:44 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzPCppk+5nMkIkyrccrpZ9qDkdrxqgwYHriwNKQ9HNpVtC+lXtneeEVZv5mbGWDS22VdY48
X-Received: by 2002:a37:209:: with SMTP id 9-v6mr27160575qkc.267.1534410644898;
        Thu, 16 Aug 2018 02:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534410644; cv=none;
        d=google.com; s=arc-20160816;
        b=R5L3p+nDoz1S/kk0NYzvsxd22lFwc+ERebSI82oV4hvifJ7kV1Zgrrw0/83a3+YVYP
         ausAdzi/zZWG2IeJIXG9RtG5cltYpHQeknRNREYPVackk87Tv75T4jXDt9QNBH8/y3O5
         DUsW7o5IthkRgNV3ru9d73UvkgvaEzUP2Hqqrv6pPqAR7xZsbkBf5oaJvbT4fDH1ukxB
         FHu7IqtcuUt9pYbjqzMEyhBIf5tevbIA36+Q6lc0cHfU6jmuOROBSoAD+NjCixKPECWf
         Tc5FfTqeSVptDSduTL6zEUTEXTBMrsyOja2srxDANIyUdZXFvkQPYdnDuuGxldTg2EVh
         Xndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xeV1Hsh6RVU51Ru5JF9WCrgiF0T5xynYuJEapKB7WPo=;
        b=oBcVG1Vrra5JcYXK9JgiSatd7lDNB6pSt5pyRsndoo15Nz814kUCdDQVw+LPbHnw0P
         wwH+RaETo73r0mAd6o8yRFYPicu0mQzT50jn/O4CHagNCvBvvROC+eJ+23kOQBfeL5ey
         O4EaCaYyJkIwJ/yssbE06iQNdvcpjOpsuncQalRMCcZ4OliD/BXTg/ASLszqOMDJIIQO
         tG63Y8nbEcQaVJDhLIGeLew+MRiydCwmZwsVuNSeqX+buSTECZ1/MAYnQAOkx/9Mn1LJ
         Z6u8TgXe99h6b3Xy/pVdnl9HhqSd7mv7ZiofYRQ6vXXVSVMCj6uSRtZmQoysvNFZUDo7
         pyrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wi4OaENw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y55-v6si3374148qtj.89.2018.08.16.02.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 02:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wi4OaENw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqEIm-0005ls-Bq
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 05:10:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqEBZ-00066P-CH
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 05:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqEBY-0002rT-L0
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 05:03:17 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:38774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqEBY-0002rD-Du
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 05:03:16 -0400
Received: by mail-oi0-x244.google.com with SMTP id v8-v6so6773961oie.5
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xeV1Hsh6RVU51Ru5JF9WCrgiF0T5xynYuJEapKB7WPo=;
	b=Wi4OaENwRHQe6LaqEAQjKY7nDq12cCQCCT0KKfQWVPXu5ebLJZbA006UIF7I9QQPvJ
	UIGH8kgvlwFZDVVo3eD2dgKcdchkIYwc0DidIDRtkxxDbtSB2Y0kOenmFUGwLeSZweXD
	UFcVQwHYqhX7khxM46aGvim4QG5f+m8fYleRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xeV1Hsh6RVU51Ru5JF9WCrgiF0T5xynYuJEapKB7WPo=;
	b=i/cthvYsk95xqSH7Y3qcnHIFPuITnkEv3RvM4CgfCPWrxFTpaJhMngxYk/eI2Yqro6
	siRS98m+LGy9kwqz8fulqXHVbITeg6qVtXoiDT3N/fBRm1Mqlda8q2Jqqw2UsvtTTKI8
	Sp7D352QCCgihFneAkQSCCEGAq7Ea69dUdIDOOJlB7qVUapsVQib5PSQEtfnqnvNkIQ3
	KhIY6wfnPRDPm17QSoamnNhQeyFfnvzOo5g982tq1ray3Zzs8yu7jMZtVUEFp/Gk6B/s
	wix2cO7b7IczdDwc8lxUfh9FaBRKq4q664wvstzfgWSRvt3AYrHE33MzPPKdFbNKNgKm
	Vwbg==
X-Gm-Message-State: AOUpUlHqCBtKepJ8st0gfrQsXHQOmDsznNLh1Nj0HNkq3c1UIgUI54oj
	v6Qch/gbq9Bx/uJrOHck/y7q9TmyZV/O7U7+A71+MA==
X-Received: by 2002:aca:ac54:: with SMTP id
	v81-v6mr28649604oie.1.1534410195700; 
	Thu, 16 Aug 2018 02:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 02:02:55
	-0700 (PDT)
In-Reply-To: <669fdbe5-4cac-7866-e227-300e55eb1285@greensocs.com>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-6-peter.maydell@linaro.org>
	<669fdbe5-4cac-7866-e227-300e55eb1285@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 10:02:55 +0100
Message-ID: <CAFEAcA9ZysRpEqWbd8Vzth22nwohWtwqL12hxXJ1j1AaC9DnCQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH 05/10] target/arm: Implement AArch32 HCR
 and HCR2
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
Cc: Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vDPeO9F8cL4a

On 16 August 2018 at 09:55, Luc Michel <luc.michel@greensocs.com> wrote:
> On 8/14/18 2:42 PM, Peter Maydell wrote:
>> The AArch32 HCR and HCR2 registers alias HCR_EL2
>> bits [31:0] and [63:32]; implement them.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++----
>>  1 file changed, 35 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index b6412fe9d1f..9701e413859 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -3754,11 +3754,15 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>>        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
>>        .access = PL2_RW,
>>        .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
>> -    { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
>> +    { .name = "HCR_EL2", .state = ARM_CP_STATE_BOTH,
>>        .type = ARM_CP_NO_RAW,
>>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>>        .access = PL2_RW,
>> -      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
>> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>> +    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
>> +      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
>> +      .access = PL2_RW,
>> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> As for HACTLR2, shouldn't we avoid defining HCR2 for ARMv7?

Yes. I was working off the v8 register list and should have
cross-checked what was present in v7.

thanks
-- PMM
