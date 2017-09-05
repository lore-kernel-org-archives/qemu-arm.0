Received: by 10.223.172.38 with SMTP id v35csp1251547wrc;
        Tue, 5 Sep 2017 03:44:37 -0700 (PDT)
X-Received: by 10.55.159.81 with SMTP id i78mr4744006qke.81.1504608277117;
        Tue, 05 Sep 2017 03:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504608277; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4sNa9lugO2tdcpBFp/IP9afUNu9Zs8pFL/cHr5LR5IsZwt+zEc6WiGsnKRfZ0YobL
         OOLdgPw2XAEEVa+/sEC4M5bpHyW6upATxOX/Qti5FDh4KHyukoKQ4w835DAnMmY6K5n/
         BasBIQbEzz9w4KmZxE4jz2ezhJOyZkbD4UptKcVvgN7jtsk5l72XREZSEdTGsE8ZQ6kz
         5bLrJMTLr4Nkps7D6hnds63wQTpbfsAay2ODdCqAvI67Zvs6e2b/LsrMSirUx0i5cAiJ
         c7CBZJAbrw4s9nmTmGfnA2ztpCixjVn1orgY3KfP9GDlBjRyxHTMHxGTR24QIqz+8Nt2
         hOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=J5MWr3WUxpj+eD1QXWFOd7WZyUbydZXb4GF328IumI0=;
        b=ND/UIwT6BkL6+qx13ISb0pjp2KDTo7LwwMtDmqEJDo0fGvtlpn2NxakYxdIVKirTZH
         2Oomg/j3cu0H/wfAQFrjAflDKowKCZ0BuPbQRIfs1Wqh4xs5UI6KSIam2nmNA0tucWZR
         MtUXA6uB0y6fTcErszXoVVRv/8dSdeLRBTOzbfuHC9eMOmjjb4kIYleXxREdTRO/1p8+
         T9/SGXrpImtjT7U+4ixPRkD75uQB0bAET5pCJ2jqTHE+J3VQ1xq94J0XhkCdw8Yh8fqJ
         EmtRknPn1eLh+yNF1syaHiqpYioFHVAbh3JhEo8w6ii1tknTpXw8OTBge7fvlG9okdmh
         sYAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SRi1uCGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si321857qtd.471.2017.09.05.03.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 03:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SRi1uCGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpBL6-0001vP-CN
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 06:44:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpBKM-0001P8-Ab
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 06:43:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpBKH-0000nJ-0W
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 06:43:30 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:38673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpBKG-0000mB-QJ
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 06:43:24 -0400
Received: by mail-wr0-x22a.google.com with SMTP id 108so7713741wra.5
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J5MWr3WUxpj+eD1QXWFOd7WZyUbydZXb4GF328IumI0=;
	b=SRi1uCGtW3RpDReDoBj2WkdIdQo5zFhTYwZNmabvCn47qY9rrfNXu+3S0QvFrMZPIj
	bvSQkSOpQjtbOgB/budMj5pCAqv98RV6Qc3u94IG/DVUXH33jge27FYbh/AaSJP8xK3I
	RK5VOX+2Lb1hw3QJMRB2hDbxZcJp+x9c7C8e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J5MWr3WUxpj+eD1QXWFOd7WZyUbydZXb4GF328IumI0=;
	b=YWunU9XcJkyQxsdgOUkhYJzzZ1BPl2UMHTA+I3gMe+V/JhIMneELbqVP9Bc50bVAXP
	CqL2/U2aNY1Rq10K5D3ucP9Mt2gKSNdqTBPkNRNMWQQGlHwOc51jp6B23hq1ABg6M5Ao
	nKy+Pd1Tm5JsXVuRwMWQDmQKc36yCj70sdRTC/TrWNTNQYAH1fQCIG/Wo0CfvLZEzFNV
	sgmJvxFy4n5C1QN9tIdvXtisPv6FfUAYZcVmSA37otXmcMIocDhbe2JKLOOn6GvxStzZ
	LgT6RA/6T4F8TMbUxCQIt9PGdInUDoIHIO4HsV+RBZ/A3S8wF9RZJbu+r1LMPyD5MzFB
	AzTA==
X-Gm-Message-State: AHPjjUi4leGzQlZwbJTe+cXehUFN8xfIQ+2kY2aEmDzM9Q6pcT08nbc9
	0wIkN9Mnz+IObuMDOXZFvGIIFkGBoKxD
X-Google-Smtp-Source: ADKCNb7FfTleANLbArX1gjgo9yYSEctDeBc08udP26cgkgyoCkCIQqsHcOQLyRhIa4pHF+/MkkDqn1qlC4G/Bf/j/is=
X-Received: by 10.223.130.21 with SMTP id 21mr1980822wrb.196.1504608203556;
	Tue, 05 Sep 2017 03:43:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 03:43:03 -0700 (PDT)
In-Reply-To: <20170905033501.GS22515@lemon.lan>
References: <20170717023824.18796-1-famz@redhat.com>
	<20170905033501.GS22515@lemon.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 11:43:03 +0100
Message-ID: <CAFEAcA9bDh7c5WtUb+2qCFk0baj+=M2VvkYr1HW+1w=jqFRN=A@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/6] arm: Make use of
 DEFINE_PROP_LINK
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ayPGzZPCCQva

On 5 September 2017 at 04:35, Fam Zheng <famz@redhat.com> wrote:
> Hi,
>
> Ping for 2.11.
>
> Peter, what do you think?
>
> On Mon, 07/17 10:38, Fam Zheng wrote:
>> This is the arm part that was left out from:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04006.html
>>
>> Make use of the new DEFINE_PROP_LINK, in favor of open coded the
>> object_property_add_link. The advantage of it is the property now get reflected
>> in the info qtree output, for a bit more introspectability.
>>
>> Fam Zheng (6):
>>   armv7m: Convert bitband.source-mamory to DEFINE_PROP_LINK
>>   armv7m: Convert armv7m.memory to DEFINE_PROP_LINK
>>   gicv3: Convert to DEFINE_PROP_LINK
>>   xlnx_zynqmp: Convert to DEFINE_PROP_LINK
>>   xilinx_axienet: Convert to DEFINE_PROP_LINK
>>   xilinx_axidma: Convert to DEFINE_PROP_LINK

These look OK, but they've fallen out of the 'patches' cache.
There's a typo in the subject of the bitband one: should
be "memory", not "mamory". Can you fix that, add the reviewed-bys
and resend the series, please, and I'll put it in my queue?

thanks
-- PMM
