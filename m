Received: by 10.28.91.67 with SMTP id p64csp871133wmb;
        Mon, 12 Mar 2018 08:06:36 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsNilunuGzdiDxigzZ+5a/NGQOC4OqrDYXclX0pIO7fVQKOl3S8u7y+VAgMh7it6iE2qiEf
X-Received: by 10.129.208.12 with SMTP id v12mr4781695ywi.304.1520867196630;
        Mon, 12 Mar 2018 08:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520867196; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgVXP+6upzJGxNO7oMADJqV28SgtnRI2YV3D9ucYFrH6hf3uWePcWQN9UKoYjy82rs
         W4toknLJ6WTya6FYdOLo7QQWMUcYUAEuplPaAn2swQ4Xu7jTR/OWxNsIvaJbc4XLx9D7
         FCxuKpMiNtJHBI0BxnOnfER90B49M/XKOGUuI0hHS1BryRjZ+M+jjvfNWDn2jFPV4rEe
         xOh+mZfpsmqGJmQUCTt4JjPwZNOWdYjMo8M8DeM253Ax1tIxOYVbVz0ReHjUsKGgPyGh
         Dt0848Rr1ZZ+2K4Tm1VNGxPDQYJorXp5GGvSDX6aTRTxsGU+TkfYcNF88JH5T16PhH+K
         NwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=awMELAwtfHR73ARUOzoYZm9A+W2xnmdSfFGBb5AOALs=;
        b=kFZAv1YWShXW+CLIlTeVtLmQ5tjxaVfPiATupstNYjwYf7wzhcA37jGylv26W73g14
         znNmSvPVH5OZHSulgwh7b01tgwwONQ68P0DIBSnDnwPxkGVeEFUW2NIRQfh/DQzHGwLh
         DESAys3gk1kjoTI05LDob00E/GJW/6IT9P5+4MXxz+3HELcw1FwHlcfrQZrneQusMJhI
         7dU2gjAGWC0TglxMSboOXmvs6xE/RHD/2l70a5BsVLP/3KFMBVwxVyPzKkM7+lTKwov5
         JOiqvRjM+QbLy8RCwtsAMeDen7nbXSreklWMoNS4cM8acR6YgX2DknU9el0Cugi+vQPP
         SSlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VtQr6BLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u201si1249828ywf.33.2018.03.12.08.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 08:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VtQr6BLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evP24-0007xu-0u
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 11:06:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evP1p-0007v6-3p
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evP1h-0005vj-Ef
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:06:21 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evP1h-0005v3-8m
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:06:13 -0400
Received: by mail-ot0-x241.google.com with SMTP id l5so15546413otf.9
	for <qemu-arm@nongnu.org>; Mon, 12 Mar 2018 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=awMELAwtfHR73ARUOzoYZm9A+W2xnmdSfFGBb5AOALs=;
	b=VtQr6BLRhzbD9ptadyY18P60HMIaxC9h00Z9j2jZh7CMzarAnIYJI+IVycNIJmQ3YI
	+bB4eQO2qWFWGTrMf+xT7YQOkDTNhXCQnL6vUs4g7axXcZK6YrJi1jq34mNBJGGs6d91
	+k9YMI9LTDcojsFNPTwAaxc+gXOb+7hV6A8lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=awMELAwtfHR73ARUOzoYZm9A+W2xnmdSfFGBb5AOALs=;
	b=Uh5Yp099KNeu6nRqJw8nUZP+xm2RStxyfVSMslYmLfY2ID/d3WLXne/DY2P6wOpDf9
	zFa5BFHxA7s0w0/X9LdP2tqchCfeBz6Lp9/91aS5gfz++i9mScZA4U510K0pjD2odxwX
	uDv1Wj7CSX+2rib7AbecZnLA276Zn/nf4Lv1ceNwG5MUQHqEPjgGmMNH6GdWyhUvFkTB
	um1/EiBZPl1gZeFs1/J7Du18Fc/Mv+Z1BkVBQUPoRB0BnILRxGIPj+h4/Qz6rqOV4hvp
	m4+dl1RPS98jUksjQJFOvZtFLCCqkY+Bq2GZKS7cPgLIlQXwTI9I7JfCDgd93gacliyf
	JMqQ==
X-Gm-Message-State: AElRT7FnTAEzanpzguqff/oltqdDOzxm9w/THDvOBF2iILElF5HPg8W8
	sT2He/uUh5utJjrOA6c5a3lqJsPm1RgiQeqhfbjHqQ==
X-Received: by 10.157.23.34 with SMTP id i34mr6069955ota.210.1520867172548;
	Mon, 12 Mar 2018 08:06:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 08:05:52
	-0700 (PDT)
In-Reply-To: <f22e252d-463e-78ed-f405-6164b0c8d566@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-13-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-BZ=wcpEKVQnX0dBh7tZVPNfHRm1E39DYEMZ=UStEamA@mail.gmail.com>
	<f22e252d-463e-78ed-f405-6164b0c8d566@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 15:05:52 +0000
Message-ID: <CAFEAcA8W66ZorjHp_C4-DvZhn2V+sLyAecRhv4pJ833BriWv-Q@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 12/14] hw/arm/virt: Add
 SMMUv3 to the virt board
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5pV7aLBHxoTl

On 12 March 2018 at 15:01, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 12/03/18 13:46, Peter Maydell wrote:
>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> +    qemu_fdt_setprop(vms->fdt, node, "dma-coherent", NULL, 0);
>>
>> Is this definitely the right setting for dma-coherent? My (possibly
>> naive) thought is that for an emulated SMMU our page-table walks are
>> going to be coherent with the CPU's view.
>
> Indeed we add the dma-capable property to make the DMA ops of the SMMU
> cache coherent with the CPU. We pass NULL/O since there is just
> dma-coherent in the dt property. What am I missing?

My mistake, I thought this was the equivalent of "dma-coherent = 0;".

thanks
-- PMM
