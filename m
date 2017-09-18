Received: by 10.223.172.38 with SMTP id v35csp3764154wrc;
        Mon, 18 Sep 2017 06:37:44 -0700 (PDT)
X-Received: by 10.55.39.22 with SMTP id n22mr21144535qkn.293.1505741864691;
        Mon, 18 Sep 2017 06:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505741864; cv=none;
        d=google.com; s=arc-20160816;
        b=J/YtLtECLnUfRvpS0T3ztXSRmGyWLzo6V3mXoti0n8KGC42BHaUzEgJpNH/4iHwjIP
         bUQN+EOBAeyTyamVFBKt9/7KR7FifEvDae66kg8PQgoM9xCFV4KEGSs9tmkpmj+evN3a
         CB1P1/vWKr46JJ9afv9AcZG7BDH4chHl8wubV43gikThec2yJRhJ0F7+WKbHELsf9w5q
         /DdL1Ji79ggNzjX0DKnTDEbSt9R2bIEPk+tpRhq3xPhQtIkJsiphVhSSih0lfvz9JH9E
         pVonvn5naeCgM9LpSxp94xUdMWYgeX3CvcfKUSOyF4KuVPyNdDYe/4JoB9EHRy+NWGrI
         T17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Hf5RclMcj7iqc/1sK8lpa9wH+BLwvgtHjMmeFN3O6Qs=;
        b=iCKkXNxw9G8mA4f/4gf/4T5iJH98uY8p496KF25UYb83aT/Dh9WHSjJazD7HVy3Blk
         aaU2twO7G0FHR83adPwq7S9p23fZHwPpBezW/vAt6YBLtaObqLWd0G80Se+8gP6N0YYX
         5/3KVbuPczhFt6rLelEmHGcE5rAVQFewUIou4FW0uaMZlhIpwoQUlAIKAwnrWG5Myps6
         AE8sGH4LIF+1xZ8Iuh44N+A8HQAfiObPikHeN8z+ubQH4YOao98r9ZVsyWMiERaPOK7x
         v0A4TcCS8cmObYrZLcrzIFvVTHp9+KAuCzp2GzQO4vly/8ba/sYSlO0feGJGnbRCC0iO
         m9kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kukxe3bk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si778384qtf.119.2017.09.18.06.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 06:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kukxe3bk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtwF4-0001MN-FZ
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 09:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dtwEA-00011h-36
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 09:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dtwE9-00059W-9R
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 09:36:46 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:43707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dtwE9-00058d-35
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 09:36:45 -0400
Received: by mail-wm0-x22f.google.com with SMTP id a137so13238492wma.0
	for <qemu-devel@nongnu.org>; Mon, 18 Sep 2017 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Hf5RclMcj7iqc/1sK8lpa9wH+BLwvgtHjMmeFN3O6Qs=;
	b=kukxe3bk5yK6c+xOl/STufZRNShu5bx1zguLdlpLoEXPQFN35PgZKfFzSXQfd6aSSH
	psAxVU97wLQW0sQkl1QsUbpDpYGmODpFQDC8Jrrc9zFwuPowIgwqgZeFFLSOW9mGZ5mb
	d8woyrqVflN9JyOGOLPiwzXXWu3ypJX7bELro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Hf5RclMcj7iqc/1sK8lpa9wH+BLwvgtHjMmeFN3O6Qs=;
	b=pj1GwUk11GDBvcPT2IV2KGmk9HzrxgnwgOjgdJugec0Sz/SJielXQgIFq/ZekDZR9A
	XV5V5IGk/0nCajQCzl8rvshpropx+vskVS4+TXbMr63qRTEY5dildeT5eTAIExvZS24e
	kdQLZ5kqCAYKw9Pz4khzWWcs8kGZIkXYknXOAxb1wa7FX/VYYdeU2Nj8eeyZO8Zngt01
	bXzIjkAOmD0/3z9YX5KXwVaQhmQXBdkXZqrrEJYWGFNO8xpsMt6mfTkvpj842g42hfal
	tign1sbOlK2WGUxXpUSr2EjCoWWNbjbFOUvSb5eNJd+wNtLkt3OWCwQU1Lnaqn8p1JWc
	BR1A==
X-Gm-Message-State: AHPjjUi3trYYZh3UIwaWBgpbmOywV1p62QTNn/dIF6q7G6P7On8tQdBo
	VIFk0kNusN+IzqcWskpzBIMavYzP/hgu2JZvwtgysA==
X-Google-Smtp-Source: AOwi7QB+M46741AB33Cg3JIEK6nvYLnv+wUHsVxdnhTAt6Z0cP4/rQcDGtfiDGjmSMIanJ7hwi65uCDOs3kWUvv3Ckk=
X-Received: by 10.28.43.129 with SMTP id r123mr8780796wmr.101.1505741804000;
	Mon, 18 Sep 2017 06:36:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 18 Sep 2017 06:36:23 -0700 (PDT)
In-Reply-To: <CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
	<CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2017 14:36:23 +0100
Message-ID: <CAFEAcA-BQ=ognSsb3Kxx5ThJ5Q_GA_sFFFofpKY1=XnRS4-WTA@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0BnjoQJ2lPPN

On 18 September 2017 at 14:27, sundeep subbaraya <sundeep.lkml@gmail.com> w=
rote:
> Hi Peter,
>
> On Mon, Sep 18, 2017 at 3:47 PM, sundeep subbaraya <sundeep.lkml@gmail.co=
m>
> wrote:
>>
>> Hi Philippe,
>>
>> On Mon, Sep 18, 2017 at 6:31 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
>> wrote:
>>>
>>> Hi Sundeep, Peter,
>>>
>>>
>>> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>>>>
>>>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>>> +                          uint64_t val, unsigned size)
>>>> +{
>>>> +    MSF2SysregState *s =3D opaque;
>>>> +    uint32_t newval =3D val;
>>>> +
>>>> +    offset >>=3D 2;
>>>> +
>>>> +    switch (offset) {
>>>> +    case MSSDDR_PLL_STATUS:
>>>> +        trace_msf2_sysreg_write_pll_status();
>>>> +        break;
>>>> +
>>>> +    case ESRAM_CR:
>>>> +    case DDR_CR:
>>>> +    case ENVM_REMAP_BASE_CR:
>>>> +        if (newval !=3D s->regs[offset]) {
>>>> +            qemu_log_mask(LOG_UNIMP,
>>>> +                       TYPE_MSF2_SYSREG": remapping not supported\n")=
;
>>>
>>>
>>> I'd rather exit here than continue with inconsistent cpu, Peter what do
>>> you recommend?
>
>
> Could you please suggest.

We shouldn't exit QEMU for something the guest can provoke. If
the functionality isn't implemented then just LOG_UNIMP it.

thanks
-- PMM
