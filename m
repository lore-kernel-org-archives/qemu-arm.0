Received: by 10.223.197.9 with SMTP id q9csp1671014wrf;
        Fri, 6 Oct 2017 06:49:41 -0700 (PDT)
X-Received: by 10.55.163.23 with SMTP id m23mr13347046qke.304.1507297781118;
        Fri, 06 Oct 2017 06:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507297781; cv=none;
        d=google.com; s=arc-20160816;
        b=snMHxYI+GKNVLHUJL1ibSuzsmTNuwbax3P59atiKjHt4kiP2w551FISjUDXkqu412V
         YAgvNttPyFk/pLuvka9UXVHHBa3F4Q6Mb0z8CNjZaBSfSZUTmD9njTj63EfTpbVt5GFa
         rNP3KH4jXoGCYN0FaOOIInCUNapVbXiqIk1VB1x0aPKiHBF4zb8I1HxIVL5CVWrInbJE
         5JQPRhR7AeCiYhA2sm785DjrS2UlesHXh+MtEf5fqYOSVHlDHrwU3zFiNYG52TwxGfKH
         O3N/b19TpLswu9hGSk6FgF39lyI0dSV58a5t7U7845BelWR4+6/867AxHziEiDAUkSrv
         XTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EZZhD6FL8L+s2Zpq5w8+ar49wcfyTv/1Z2BbuD23PSg=;
        b=jogdCsFSM0x+bGrQJgjtUGo17OOlMRIzk8ZoR3UDu+uceJhnRMrocFHAhkhn3ga7Xy
         yGYlucZDnnaF0INdUSfjXpfIDRIJ+2693jSiA8CsuS40k3oVNUIEBwzkd1alMLjYbRqU
         7IONTuCuL2YESCg8V8jeYKenw2Te5W13zYQb/RRM9c+c3XNBiNOGsVZX+iT1VrkgrmYI
         +D0aC3JlzVdmniXi/Ch7ZghqdPBImQ6uP5+arr4BRLqO+sy7YYjnuwvQ4+K/ufhjVBBz
         pmygLoE1C5nSIZFzHKwoEoBJyNMmGmY4el6bTTrUVBo81kTEcbUlmKKlAbjp3ooBgfT8
         61GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pht0WewS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z26si1345580qtz.116.2017.10.06.06.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pht0WewS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0T0W-0001bA-Iq
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:49:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0T0I-0001Z4-J5
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0T0H-00063V-Tx
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:49:26 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:56635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0T0H-00062J-NJ
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:49:25 -0400
Received: by mail-wr0-x22e.google.com with SMTP id r79so7726477wrb.13
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EZZhD6FL8L+s2Zpq5w8+ar49wcfyTv/1Z2BbuD23PSg=;
	b=Pht0WewSKFA65fztnXT/41iXdabXkoE+KaO+WFhBYlKGI+VoUEuOUb/IIPHASirdje
	zkWWU1fQVi+VageVyxxJvc7FQNsASwW8xZgE7cfALKTEJVGZJKU3PbT1eeMcSk4TueXA
	8AW79sVtNVVrX2RIsdj0uwgdu1ZOBpnEexUt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EZZhD6FL8L+s2Zpq5w8+ar49wcfyTv/1Z2BbuD23PSg=;
	b=lDmgXMIghuiSvJ5Hvyok6quClzWEL7O1hJaNyyZ5aaiUX5whuZzPxxp/RZ9q5r/zQw
	hfyGf6J46xB60kXMfaWBEi6wpSG970DBDHKUJLmvNeqSTO5UfqRwU6Q64mIyI7Jec/3p
	B7ppnsJY0laqkzbnVST38vms2vt31In7rH4nSCJNbfHivkzJ+nDE/rLXIMHwh/10cEg4
	iyRDFMI8Se4Y2Lbx6VS7+37QIWbTZHsQNMMBk4ft3PmkDgT7njeEpTduYxD9o0DrTGK0
	XYsFeoH2uG6XfU0pIKCY5WGJyM8rYaLkHBeDpOFg/qH4NEyKRg8hBUfzC3KIG1jctNeg
	gtFw==
X-Gm-Message-State: AMCzsaV2/I8B+3TDhLoP8Jsd0vgYE0pkWjtaxI0U0mIG6pWwJt/7Qxlx
	N/v9YrtBhw1Dp78/v8cKLrBjf2RhxEj78Gv4TOL4iA==
X-Google-Smtp-Source: AOwi7QCjdhPcT84w7R+AeIHFUAKIxLDPuCf4Zn7CfmoPvptMckd4w42KD935VTh2ddv1L1r6OMXI1mCO083cxdGTvxM=
X-Received: by 10.223.186.201 with SMTP id w9mr2094876wrg.230.1507297764645;
	Fri, 06 Oct 2017 06:49:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 06:49:04 -0700 (PDT)
In-Reply-To: <20170918195100.17593-4-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-4-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 14:49:04 +0100
Message-ID: <CAFEAcA9zZqG1m5h4FP9NpXYES6uSz3uMwbmNx3XpLYsS6tQp2g@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] [PATCH 03/17] imx_fec: Refactor imx_eth_enable_rx()
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
X-TUID: DUa6pUyrF/HH

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Refactor imx_eth_enable_rx() to have more meaningfull variable name
> than 'tmp' and to reduce number of logical negations done.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
