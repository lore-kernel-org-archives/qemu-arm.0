Received: by 10.25.221.202 with SMTP id w71csp1496610lfi;
        Fri, 11 Aug 2017 16:23:25 -0700 (PDT)
X-Received: by 10.55.9.9 with SMTP id 9mr20847281qkj.53.1502493805059;
        Fri, 11 Aug 2017 16:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502493805; cv=none;
        d=google.com; s=arc-20160816;
        b=YCufSRISExH4v9LBvmCHNvX+4J7niUMQa4DHdcaXnknua5jkwrAUjJ1A4ClU5F/r/1
         0hFdj/4+sGbE//i/YXUgTfK5G4GSIpNeUERcnprbCn9U2RdkJmrKGihD5fB9kVcMbbKY
         gBtnhLRfb+CCDOn9mIlQVLWoRENHcc9EyYgymiCZ0fVLLOslV8seCKByM9ARVhCAipDD
         RBdwU5DoFvae0mDz0xtoe2mKilT9k14lKvNbEdQa9vUDHYpokSssLDJtM8xRqPZJePRf
         UPtVV8ToG2IrH2CBzmWlhpUWXvFLP6mZCdl83uCSKqAdPEaVE51B9f8qh6OLOqCWRMzL
         QKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2mBWWA3BaatHOtIft07HPTA8jNa7r50mNbKZ/mgAcFY=;
        b=ZqP813Ymx46m+AkenjCBCvZSjoUNiUYXA3PskbUVMMdmpaXsUHK7RNjhXva8hqgkQk
         8mXJ8E5CVI+fcQ4QIXcIolxDbp3YC1Jp9qEtEu1vQU4CX1bwfHzGqjy1yFYCsCbP0x/O
         +Qf1+vaau7uwJKkT8LBiDI5cH2GFZ/dkWNjfcNDBiJKLgK7ayC989ZltfiPZmT7QZSVp
         pJUYORnvjBjdHHwgcpaPEvbhHHi8MwIsRW87z0rcJdTP6GOKHAQa4yAUtT4QPvcf94YO
         lrNuB8d+QtfYj3RZKxhLCgWzxy4RLy+vi3huWMhsob5bhBX/Wu7BVg5G/UzhcCM0kGsw
         C+SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uJOrNy6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si1653150qkh.480.2017.08.11.16.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 16:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uJOrNy6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgJH0-0006wk-Ct
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 19:23:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgJGw-0006vM-63
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 19:23:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgJGv-0001KJ-74
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 19:23:18 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:38722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgJGs-0001JS-IK; Fri, 11 Aug 2017 19:23:14 -0400
Received: by mail-wm0-x244.google.com with SMTP id y206so7957724wmd.5;
	Fri, 11 Aug 2017 16:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=2mBWWA3BaatHOtIft07HPTA8jNa7r50mNbKZ/mgAcFY=;
	b=uJOrNy6SGXHzo2PXiGvM2QYH9LDq97qh+3V0IKRLhuA7mcD3PFkMT0wiG9TgsquWBk
	j+zBgULcrEZcRcmzp1V4qFNd3CjWP8V+tG6X9NCjQyWVdaVzV7Af/zYUgwh4d2UIRNhi
	K1BwOUhGZ4CsmvwEy1m5N1YbVeNQfbKV/sp12+67RKGZtmJquK1m/9ayjKSVL7h+xA1T
	tieI3iTT2TKaW4xcjY9T+LZUWSTkUJHdu/R63pWYim8zyXkspSGrtbigRlJfLdUywPuZ
	CXgVwkNr+CR6lDAidj8k5yjyq4CKza6+SjvhMtOYEBGTCqTdSZ7/84jWZ+a5+Ddu5itl
	eZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=2mBWWA3BaatHOtIft07HPTA8jNa7r50mNbKZ/mgAcFY=;
	b=fqW8o8SxUG5TRB4bcyjWFkAAMTv9zAinLG5kqFvTcPE1CoKheTI9FPHq3FvSauF2q7
	Sjz6aQS0nvBMRbdp1l59LJs9tdtQ78gVquf4QkjQnwza/GyYYsx02mUJUkOvK/7LgowT
	PGHDSYkaeUV5TXL0WWw3h4eWhfk9ZZRLsqN3dme2AUcUXYDaTE0vq8FPiGGnl0X05Vjl
	l/FOV7SbkYGHCVoY5jh/HS7StGBl9lcB+gd6jmkUY4wZTZi0AztCBYmY3MSI/ce4ysm2
	6XgNHFNqh2G+kt/hdDZL5sq46tsBeIw6mFqCJU3xRHxzanmfOfj04yMW9wrLSULUUABZ
	PKBQ==
X-Gm-Message-State: AHYfb5i8Mha4D0CR0wK99yp8IqV8u87YtjbEzfARGHeVhLJ+gnSbzZae
	sUmgVvRNXuDH71EUAzpA0W0jaCzqPA==
X-Received: by 10.28.207.10 with SMTP id f10mr119591wmg.159.1502493793512;
	Fri, 11 Aug 2017 16:23:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 11 Aug 2017 16:22:42 -0700 (PDT)
In-Reply-To: <CAKmqyKPe8_205KZ5x++cdZ0BR950tQiaQvPstRzcKrwArgpMOw@mail.gmail.com>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<CAKmqyKPe8_205KZ5x++cdZ0BR950tQiaQvPstRzcKrwArgpMOw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 11 Aug 2017 16:22:42 -0700
X-Google-Sender-Auth: vN-gdF5HWvjwn_LdKmm3_2ygJs8
Message-ID: <CAKmqyKOHX-==ZX5B0K_2dZ+D09XfGU6yfoo5mckkgms_6hevJw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>, portia.stephens@xilinx.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH v1 0/3] Fixup exclusive store logic
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FvhLbSycG6mF

On Fri, Aug 11, 2017 at 4:21 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Aug 11, 2017 at 3:17 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> I found some issues with the way exclusive store was working. This patch
>> series seems to fix the test cases that were failing for me.
>>
>> The first patch is just a simple adjustment.
>>
>> The third patch fixes the main bug I was seeing.
>>
>> The second patch is left over from the RFC that seems like it is still a
>> good idea.

+ Portia from fuzzy testing team.

>
> After working with the internal fuzzy testing team I have a test case
> where exclusive operations are failing on master but working on top of
> this patch series.
>
> Thanks,
> Alistair
>
>>
>> Changes from RFC:
>>  - Rewrite the third patch to correctly fix the issue.
>>
>> Alistair Francis (3):
>>   target/arm: Update the memops for exclusive load
>>   tcg/tcg-op: Expose the tcg_gen_ext_i* functions
>>   target/arm: Correct exclusive store cmpxchg memop mask
>>
>>  target/arm/translate-a64.c | 4 ++--
>>  tcg/tcg-op.c               | 4 ++--
>>  tcg/tcg-op.h               | 2 ++
>>  3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> --
>> 2.11.0
>>
