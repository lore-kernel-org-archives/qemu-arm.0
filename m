Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1846661wre;
        Thu, 24 May 2018 06:11:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqEXwr9ZtSAgwmdMCZ0Jkyf9n8kyIyTeVeRxEhsddaSLqJmKp7Z88Kk8aqmoOCzWhFvBvZg
X-Received: by 2002:a37:338f:: with SMTP id z137-v6mr6192962qkz.233.1527167467307;
        Thu, 24 May 2018 06:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527167467; cv=none;
        d=google.com; s=arc-20160816;
        b=uBqqdGbCgytmPDtlZbkVdTbVOBuFiYq/fWLy41NF9G46ALz4uFXPOeGOGmDQqfZD5B
         0se4bWgMdh+HSnlNIXpv9krtkXf8hX+TP/G703kZJpYKx/b7qR/jnzB4dhqSovu/feJw
         V9PNn1OCWR2fG7CiQecE4M1S9jMLXyrr1Y7T3Romk4GbyF6yUFgdy6qIBq3yjYnjKOxo
         WLGT5psQqkXvqcQASUaydq70ZDI9nwW8jdDZZjswLToeRKtHcIG5r+BoEnTrZIvKQWWS
         mAuDkwJeHXwh5x/iDFmXjUmI6XvZTyfF2f5ifA32I4PyxHbwDyvjsjLtkOpEvnnHquAV
         zIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=wgZkJlxBdTagtK+3Go8xLHiKxQBZ7Z+Kb6mAlDMxgXY=;
        b=SH1uWjGJu1tdPJv50z2vJVGLzBrL3Ow1jS7y+FqeUG9g4qQRdmMr+BQc/U3FVE9C3b
         k2B3+0v56CqUJHtsUlxcABQxTte4OigQhz4+rbb2xOphHRYUZpjc0fIgaxZV1/rR4Ek8
         lpO9VMQ9n1Owdz/vu84Ky7qlc07GbHYw5gkVIAJwFRuujT4A3obDDY+6pq0J6ymNMzhz
         oM+Ccmmi+T2pOxHLMB9cu+lpNkANsIjB53m7QhA/+1djrPmzO7KfmJedeu5N51+Z84Cd
         SdfV7uxsOs7m8l5iC8lXfxOZoAti5eshhO4RJGEbZE8TeLGPrHtpSIVOE2kiSoz0Uw2U
         R0Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14-v6si4307160qkc.48.2018.05.24.06.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLq1K-0005CP-Pc
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:11:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLq1A-00059u-Ex
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLq11-0004jO-6M
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:10:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56386 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLq11-0004j5-10; Thu, 24 May 2018 09:10:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23740819028F;
	Thu, 24 May 2018 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61FE9ED154;
	Thu, 24 May 2018 13:10:42 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
	<CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8a2e04d2-68a8-5ea6-b0a6-6df4b6c029e2@redhat.com>
Date: Thu, 24 May 2018 15:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 24 May 2018 13:10:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 24 May 2018 13:10:46 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mErFnzcScnTn

Hi Peter, Laszlo,

On 05/24/2018 03:07 PM, Peter Maydell wrote:
> On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 05/24/18 11:11, Peter Maydell wrote:
>>> Won't it also break a guest which is just Linux loaded not via
>>> firmware which is an aarch32 kernel without LPAE support?
>>
>> Does such a thing exist? (I honestly have no clue.)
> 
> Yes, it does; LPAE isn't a mandatory kernel config option.
> This is why we have the machine 'highmem' option, so that
> we can run on those kernels by not putting anything above
> the 4G boundary. Looking back at the history on that, we
> opted at the time for "default to highmem on, and if you're
> running an non-lpae kernel you need to turn it off manually".
> So we can handle those kernels by just not putting ECAM
> above 4G if highmem is false.

Actually that's what my series does. If highmem=off then we use the
legacy ECAM.

Thanks

Eric
> 
> thanks
> -- PMM
> 
