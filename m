Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5632108wrp;
        Tue, 17 Sep 2019 12:26:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxz45Glqb1Ax/sRIODAYQgRQf6OA4kHlAUbIaWbmi2SYfK6Qfy2O+NTTj1z8AuSaRSTP1qC
X-Received: by 2002:a37:b704:: with SMTP id h4mr7515qkf.373.1568748367955;
        Tue, 17 Sep 2019 12:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568748367; cv=none;
        d=google.com; s=arc-20160816;
        b=dGP1kHkuFERJ1B9v+g7ZcX4z2QRRhISoV6IIkihvlCm5jK2RfWTGMvaxwKqHYPR30d
         3xlgp5Np+0Yy1GO3U2PMKxnXWOHPeOAkux4Ya/QkX1V5m+W/sKDGQ6RxBGzXkkaG/9GR
         1Pt45LiKLSCc2rVDg+qnsGA2zd1ILd3M/ep62WbGIGRrNxSUiUkdx/GvtL2sKcAuBUA5
         NakasosfLzdo9fQmE3v5aRtq8cdwa763T3R3nDCB5a+4y7qL+6NBXcnw900chDYuL1MZ
         n6Rtb2TCgGSunqI9+GI+1zxR27px8FY1EMmETJxHdkD5P31KNskLIRgunUCpkSRPtpQK
         tm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Yvt3VeLmQWfbl/zRgCN5EnY7/IpEzSBYY1kapUJvzZY=;
        b=TTjuZR8ZkbiNJkB4OeknzsN/8V94qtUuygMsBAdlGk7pXqGU2sJzP632/lfKm6CIp3
         QVGQJ/kvlguCndCN2lOsEdWX58MxNLs1eUjJaUClqmVIfbjWVmQr9rVvr1j9a1+bRt78
         cZIpsaCa5c4HgeuDE7+qVJ3ofzsrVa8Pax9MyiB8ggaVKQ9g1ACHZ+U9arhMLvB0Liss
         do7cKwiPu90MRYs9KMOXYnxh+JIb9krQ2S1K/pFzooUCKPBJItWtw6yV81MZvhNh+82X
         U7nZIcBRwDUPp4vCVvjVr96psF2VkUGiWfOwSUEqte+VSDZyo5PLyDHa1eRfzoc3qTUp
         C/zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="WrLN/JAr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si2414656qvc.123.2019.09.17.12.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 12:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="WrLN/JAr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAJ71-00034q-95
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 15:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iAJ6p-00033T-B9
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 15:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iAJ6o-0006VE-5l
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 15:25:55 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iAJ6n-0006Uo-Ph
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 15:25:54 -0400
Received: by mail-pf1-x443.google.com with SMTP id q7so2720431pfh.8
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 12:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yvt3VeLmQWfbl/zRgCN5EnY7/IpEzSBYY1kapUJvzZY=;
 b=WrLN/JArXjsqWROzGe5Lg8uNvvY6a6urcPPh7fdoG0OL9etKmbpJubU2fQ0bcurK6G
 3AEQRD913nn5f8QSsQnX409Y9/LPmH6yArxbiLxuc7QIX9if9RyLynkDE378g9M5sKz3
 AyKfnzEPBCQGQLM6speYtEGMaaifrPcUdyy4Wzf76hG4TwEbfs/3io3621Y4FnKztBEq
 a8iOmICpB5z9C0NuzLKlCar3MrCWp5ctSL4b2drwzj4PerlvhBCgxWNwK+GWZ70J+Qt+
 uyvJ95euexd850xViwVNb6AzUFDxxpppCGmBcmoxE8364/6psJPinJ7aL0Dx9D6/Nh8M
 4RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yvt3VeLmQWfbl/zRgCN5EnY7/IpEzSBYY1kapUJvzZY=;
 b=JctWPimFdeM+5qnFbyEeu8a4zFMZqu/sm+NPMujR2sxjC+Pte3ktYav7RctB3GkBLE
 ijJnNCf/WuefQDuapwgHNc1n6VKuS1+I9MvpAKpaTyO/3AL8wtPmYWjzorFyGRyzuyBw
 3NBpXKk+7boSc6O0nH7DfsQgvZUy8o7j7Kx0dlnulJfgBveIap2FdnRWeJewN78yZfew
 cnofwpQuXP1Dv6qTlI55k/KNTPy1OZlJ1Ocrn5dvQO+rbXP5eAKl1XGSVTTMplk4ASJc
 LNrr8i7xvwX5PNEUwkkcIKls9qiMIqGB2vp0zUVUt7XHi07Gg5vqm5/RdDrf30tH//zj
 gUkw==
X-Gm-Message-State: APjAAAXofHlgqgOeYGzsp/s8Y/nCBrxj8KQlncEozL4BFjRvoIZxn5iD
 bxAZffFCiyegYKeZN8boTp7I+g==
X-Received: by 2002:a17:90a:178d:: with SMTP id
 q13mr6725873pja.134.1568748352605; 
 Tue, 17 Sep 2019 12:25:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g1sm2883687pgg.27.2019.09.17.12.25.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 12:25:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
References: <20190912065631.12473-1-andrew@aj.id.au>
 <CAFEAcA_h80VQVC0jE7v8kmsuXU=16+KXSKQ-qhuRNTct7X6X7g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c9f58ca3-36ee-e8bb-a350-29729f4f24df@linaro.org>
Date: Tue, 17 Sep 2019 12:25:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_h80VQVC0jE7v8kmsuXU=16+KXSKQ-qhuRNTct7X6X7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5] target-arm: Make the counter
 tick relative to cntfrq
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JmkE6+qG05f1

On 9/17/19 12:14 PM, Peter Maydell wrote:
>> +static Property arm_cpu_gt_cntfrq_property =
>> +            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq,
>> +                               (1000 * 1000 * 1000) / GTIMER_SCALE);
> I think it would be helpful to have a comment saynig what units
> this property is in.
> 

Should this be NANOSECONDS_PER_SECOND?
It's certainly a suspicious use of 1e9 otherwise.


r~
