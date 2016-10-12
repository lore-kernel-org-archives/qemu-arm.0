Received: by 10.80.166.35 with SMTP id d32csp287742edc;
        Tue, 11 Oct 2016 18:35:13 -0700 (PDT)
X-Received: by 10.55.80.135 with SMTP id e129mr6881598qkb.74.1476236113713;
        Tue, 11 Oct 2016 18:35:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j59si2765034qtb.16.2016.10.11.18.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 18:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu8Rt-00012c-2q
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 21:35:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bu8Rp-0000ya-44
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 21:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bu8Rn-0000Ba-Ao
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 21:35:08 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34874)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bu8Rg-000061-Sk; Tue, 11 Oct 2016 21:35:01 -0400
Received: by mail-pf0-x244.google.com with SMTP id s8so1607491pfj.2;
	Tue, 11 Oct 2016 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HR28pSC/H3GtNCgJleXQxD6W0ZJhYVL/gUKQ+vxGSAY=;
	b=sw2ZjTYsoI8r130MBJNb7a28vxf0Oj40SckrrY+9z/rfZLczsWzOdDpZRCCgeDz7x5
	xjvSurnuCmQMpxNYNGHOZ+BM+Gp1IshsIxnN9O4bG73OmC23k6kRuvB+jxJgcCUEShqS
	QvokCSln9qyiJad4ViWnb1WJCTV+ZSXvqYdc/QNxEaUpHq75EdwLdu9XttMkBp/GYQYC
	d2z7SdpSkIpqWHZm9ePsherh93CfGsj9ykslktTH1bnzmz28VKScn66weIjPG3WeUw/g
	cP8oLKOADTG/t3Up2pmcCd0W8sLU5JB85sgGrGopOTlC/YXumnpwzPCr7cg5jzROBvlx
	RtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HR28pSC/H3GtNCgJleXQxD6W0ZJhYVL/gUKQ+vxGSAY=;
	b=hE9AvNVIIiWeuVidj5YsYLG0u5R7ykjaTtRfwstkBEkzeQUNpOFepSmlBUmuFZWTWk
	dWqBD+t7dzAJB8aXXeIHHjrXt1sYkW0Vr1b9hvhdH0nm+h9qTuhHXrY6Lu/oLYBLS6OB
	TGyTPhYTuiComX37RxePmHwjLyNiuMwTUb484R5pHacgKtHdmwFCBBhLeqA9Aq/mv831
	l3aa88esusZbpEvRAfoovWx0mUxCEFJPzS0AQP+immo0HwpopOVmHk6CdgBl1KpCpGsh
	vf78S11dHOQoJQfaCVuuPGNFFiOmFyDcQfh+zaqAGvmK9gFPFIUT/y9j/jAr4Zk0Q1V7
	wPdA==
X-Gm-Message-State: AA6/9Rmvcy/RH7hM1BFHaYU4NFP0obrHGvjIGesctKRBI820FK8dHWoJk6mg/+lnNNfcQQ==
X-Received: by 10.99.106.6 with SMTP id f6mr5400289pgc.27.1476236100048;
	Tue, 11 Oct 2016 18:35:00 -0700 (PDT)
Received: from bigtime.twiddle.net ([187.217.227.243])
	by smtp.googlemail.com with ESMTPSA id
	j6sm7188782paa.44.2016.10.11.18.34.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Oct 2016 18:34:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
	<20039503-ebed-fe18-be17-78d39643c9af@twiddle.net>
	<CAFEAcA9s-mWFzqFdo81YOEJ=eU3oRtw8SA4QbkZ3kOKuNPcfhQ@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <bec612f6-2f03-67f2-ee79-73f0f388360a@twiddle.net>
Date: Tue, 11 Oct 2016 20:34:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9s-mWFzqFdo81YOEJ=eU3oRtw8SA4QbkZ3kOKuNPcfhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [PATCH v3 0/7] Runtime pagesize computation
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
Cc: Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hr+wGMFRvkxj

On 10/11/2016 03:18 PM, Peter Maydell wrote:
> On 11 October 2016 at 12:20, Richard Henderson <rth@twiddle.net> wrote:
>> On 10/11/2016 12:08 PM, Peter Maydell wrote:
>>> I would ideally have liked to finalize things much later, but
>>> this is in practice hugely difficult because so many things
>>> (in particular all the address space/memory system code)
>>> assume the target page size is known.
>
>> Unfortunate.  I suppose that 4k is still better than 1k, but
>> I was hoping to get 16k or 64k (or higher) when the OS is
>> configured to use such.  I.e. totally dynamically configurable
>> upon write to the appropriate cpu register.
>
> I think that would run into problems with migration:
> the migration stream all works in guest-pages of ram and
> a mismatch means migration doesn't work.

Perhaps migration should use definitions based off of TARGET_PAGE_BITS_MIN? 
Dunno how big of a job that would be...

> The trouble is that all the data structures work in terms
> of page sizes (even though we support sub-page allocations
> those are still done by carving up a page-size chunk).
> It could probably be done but it looked like a gargantuan
> task so I decided this was a better compromise.

Fair enough.  This is still an improvement for an interesting guest.


r~

