Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5325037wrq;
        Tue, 26 Jun 2018 11:19:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcz9PX73bKn5AaoEjfElPXR/gdQN+jHN70rbs+8Pe2KMF1IYSzInSA6kcgnQKE/jls/S/7N
X-Received: by 2002:aed:3ccf:: with SMTP id e15-v6mr2586706qtf.59.1530037169771;
        Tue, 26 Jun 2018 11:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530037169; cv=none;
        d=google.com; s=arc-20160816;
        b=LkT1x8oMlQAsE70QJ42U4axUsawb9YEeYSPIsMFH8nuoiyxFKxqmeUswpZSiLO8b60
         NYXsCXSv+fM06cPcVHbgV8mKx5cm1sJhn+NVIfAh2nSqw/387DiB88VbmHbXWuhzMcn/
         swX8BKqEUzblMX+IAfh5XxR1nmfIqTcfPAoylhxAHAmO2LO7e4qAWx2PfMY4mBEUkiID
         tidBxaOzC+vmEjYIc5abG2XpMg8Jl6MVml3im/Fl6s3x7W1xElIWXao/KvwFszAHXo2d
         Mygtkx2OGB67+RUQcsiijoijSo8DEiArTz6AVyDuFs/Ghs7Dz++ycO85HP9aJmMbUJLO
         ADow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7IdVGS2PdMKp5ROiK0T4PnRFmaFsy6YicnSmKOG7Lqc=;
        b=C4COumfZu9TBqmRHce4Rbh/q/1QSvBuOV3tFrlk/hKmFwKzjD/Ot5TvqgnP8QN8ymr
         meSGgWgi0EqdnFXvU3+QztbgsiB7E5seG9HrBH2y78K2M4zabjEqgjRuAQmSCThiYR6V
         epdodbU/8qlnhJUntttyw+Lk4nYxf4MKQoWWc+WbFP+VC/y7ozkogh58x2+w6f9cqs9q
         IPWWxPSahIIChBX+7ySQEAUTF1szZRUWRffI0E0/Yzh26vlT9woIgx65zhd0Xo6wttRB
         SSHs8B0du6NGMslFenYTlHhsWsgen9iNmbHKUOETvNL/UqWQoX2YZQRgojDvXjOLV8Ej
         HNVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MI/GvdyF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 143-v6si2162915qkd.164.2018.06.26.11.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 11:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MI/GvdyF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXsYr-0002ma-2o
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 14:19:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXsYg-0002l9-RK
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXsYf-0001cs-Sa
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:19:18 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:41269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXsYf-0001ch-Ee
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:19:17 -0400
Received: by mail-oi0-x244.google.com with SMTP id 21-v6so6238157oip.8
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7IdVGS2PdMKp5ROiK0T4PnRFmaFsy6YicnSmKOG7Lqc=;
	b=MI/GvdyFQrZ/hwQmIUej32ZYEByuYm8rRC9G00b2Tv1szLgl2Q/VoOuDWs6lyZEAuN
	VmS5+46IQe3KVfjap1pkrPhOEMzyqm6AspKoPOsAio4Z3d4cgKlKJF7pRGb9stYUUHfH
	o6aeRMm0ZrRijkZrxFjz389g010s2bnB8sZIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7IdVGS2PdMKp5ROiK0T4PnRFmaFsy6YicnSmKOG7Lqc=;
	b=fitasbwcUkMVE+4W3sFeNnor5CGbkNWdsblVRfyEz1jp0XNfWGDIGJLPbkUlv0wQb8
	7s8pQCCdsazhwbVsMMffCFO+ZWu6Aj+UX9rkJCf/gxsgg8AkYElbDDoKkrn7xGKCR5md
	UMWhqqrfMeSonU0IU0Q5Wr1/YmJVVjqmSfEtz94vYjkXmJDDXmQyLNr9VIp49BYYfjpS
	9I/OA0cxmazvNFgkTqIRPj8aamgMKM1QBNKsluYPEnYE7NXXCyKXMxRVf4+sXy7+Fbu1
	xVaf7Ct1u9zHpURTQaCYaE+IWT2XucDvLlEQgj7y7CE/6jcnA8fbctsYaPZrEvrZ8xwh
	iw4A==
X-Gm-Message-State: APt69E2FDw2aqi3OqlpYHL62uRZGltqG4PSbZDxNlVXTzhYhCs41INw0
	+QL1OWKpHOLdCGQnJQsc0LuPEH7jI8CO6l+dlvnvKQ==
X-Received: by 2002:aca:743:: with SMTP id 64-v6mr1377650oih.164.1530037156792;
	Tue, 26 Jun 2018 11:19:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 11:18:56 -0700 (PDT)
In-Reply-To: <a49d3e03-a6aa-b627-c2e3-2b3c4bddf74d@redhat.com>
References: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9Pg3C+XD7WuLyNr5RfifRCvXB6t01YuLiK9Cs15v-Dpg@mail.gmail.com>
	<a49d3e03-a6aa-b627-c2e3-2b3c4bddf74d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 19:18:56 +0100
Message-ID: <CAFEAcA9GViOphcM6jarzyOwU3gjSp-BfgR5J-krqUXcP2czgZw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 0/3] ARM virt: Silence dtc warnings
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
Cc: Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f0/Jwl90cNX1

On 26 June 2018 at 18:15, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/26/2018 07:06 PM, Peter Maydell wrote:
>> On 22 June 2018 at 14:22, Eric Auger <eric.auger@redhat.com> wrote:
>>> When running dtc on the guest /proc/device-tree, we get the
>>> following warnings: "Warning (unit_address_vs_reg): Node <name>
>>> has a reg or ranges property, but no unit name", with name:
>>> /intc, /intc/its, /intc/v2m, /memory.
>>>
>>> This series removes those warnings by adding the unit address to
>>> the corresponding node names.
>>
>> This didn't apply to my target-arm.next tree. Once I've
>> applied my on-list arm pullreq to master, could you
>> rebase it, please?
>
> Sure

Thanks. I'm being a bit lazy because the fixup probably isn't
very complicated. The pullreq is now in master, so you can
just rebase on that.

thanks
-- PMM
