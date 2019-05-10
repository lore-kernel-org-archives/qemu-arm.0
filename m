Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1753117wrh;
        Fri, 10 May 2019 01:30:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoZSmBWSJGX9Xf/C2Q2RNCj3geD21ppUEZnXj3y8jBoyNgtlM+rYY/D6qd9kMTVBUwUe+h
X-Received: by 2002:a5d:50c2:: with SMTP id f2mr6736807wrt.253.1557477046956;
        Fri, 10 May 2019 01:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557477046; cv=none;
        d=google.com; s=arc-20160816;
        b=Yq+t/JxgNMnY7PhBKBEZr20J/bqXX4EQwmD2CwoR7KmMQra9+zv9krqT2t031JSoro
         dh6EVA9X2vzmQxj99TH8z7euhjVPKRC17bnQvfnthOw6iqp/PMMiE/TwG04t7kYsOQ0u
         ePgX9u8X0UaiwNCPd9Shf0EJsDxlsdhBj9cZCtOpTd6qwTgTZFx2bL1Xcg0yWIAprw76
         xce/19gp+2NLXfv9iwgpd/jKdK/Bb15imetbfFKCoG34/3VWr6uSkjSm4XW6mBaPMQgm
         cYa7TSr58+xXhnjXtlb1tEnpj945k4RN+AOsPDZ9rbKPGMEmJV+cMRAVHmuSxRwjyRXI
         RikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=JrgLOTWtOoOgB6RtRdEMgPuN1crPygMdAksxdN68mV4=;
        b=Wd6K+lnTG2JrRP2NAfdcZ5m4g7WC61OJnPk/uBLncr3NrXvoeoTb+9CT3GDp74YBdl
         1SNS/hcxdxNsvyxdSJsHX1iYPR6/DzYvjmvcHWsursR45055Ws5BWTsRm+QP4ayofbjX
         oADwO4D9VGIqO5vDINM1drRzRAIre0hRyluDyOl4qMNxd7UaAmhn90vo0+7Gj+TKhPT8
         Lks1Xn33PdI6aQVTNLY4DC2rjjTf8txa4YwDGNjXa0MJHAAOM0R4XSN1V0kTfwZfi3ht
         xpcEH6jja8pmhLW6yknINOVVblSZYtcGxBWhZOaD4kq0IXcvdhzoiqu6VfVpGArYhegH
         45eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si3580567wrs.255.2019.05.10.01.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 01:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hP0vW-0006YJ-1a
	for alex.bennee@linaro.org; Fri, 10 May 2019 04:30:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hP0vK-0006Y2-2f
	for qemu-arm@nongnu.org; Fri, 10 May 2019 04:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hP0vJ-0005Dn-4c
	for qemu-arm@nongnu.org; Fri, 10 May 2019 04:30:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hP0vI-0005CP-TE; Fri, 10 May 2019 04:30:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D57308FC20;
	Fri, 10 May 2019 08:30:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-72.ams2.redhat.com [10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5941360C81;
	Fri, 10 May 2019 08:30:25 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
	<CAFEAcA8RoJ-ZSsn3Lhzj5hd3oYOE7Uxy8MvUUWrzhNfBmD=AWQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <11e209d5-047a-d066-5995-18f46ff5382e@redhat.com>
Date: Fri, 10 May 2019 10:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8RoJ-ZSsn3Lhzj5hd3oYOE7Uxy8MvUUWrzhNfBmD=AWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 10 May 2019 08:30:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2FqHmJJD0KQ+

On 09/05/2019 18.54, Peter Maydell wrote:
> On Wed, 8 May 2019 at 16:33, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 08/05/2019 17.09, Peter Maydell wrote:
>>> On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
>>>> ----------------------------------------------------------------
>>>> Kconfig settings for the Arm machines
>>>> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
>>>> ----------------------------------------------------------------
>>>
>>> Hi -- this is still failing in the build test where I 'make clean'
>>
>> Very weird. What is running before the "make clean"? Could you provide
>> me with the content of i386-softmmu/config-devices.mak please?
> 
> Nothing runs before make clean -- my scripts effectively just do
> a git merge, then make clean, then make, then make check.

By the way, I think you should do "make clean" first, before the merge,
in case something changed in the "clean" rules.

> Further, if I "touch hw/i386/Kconfig" and then run make, nothing
> is rebuilt at all, so something seems to be wrong with our
> makefile dependencies somewhere.

I've sent a patch now, please have a look at "Makefile: Fix inclusion of
the config-devices.mak.d Kconfig dependencies".

 Thomas
