Received: by 10.25.21.156 with SMTP id 28csp182644lfv;
        Fri, 12 Aug 2016 07:18:13 -0700 (PDT)
X-Received: by 10.55.19.33 with SMTP id d33mr18555895qkh.225.1471011493202;
        Fri, 12 Aug 2016 07:18:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si3386196qke.294.2016.08.12.07.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 07:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDHo-0001Vo-Gw
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 10:18:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bYDFI-00006P-2A
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bYDEy-0004It-FW
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:15:37 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bYDEy-0004I3-7z; Fri, 12 Aug 2016 10:15:16 -0400
Received: by mail-wm0-x243.google.com with SMTP id i5so3100780wmg.2;
	Fri, 12 Aug 2016 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Y0Walu8VgDMAGscpyqPqbLAt6EZB9nvRY8GDcZ5YYak=;
	b=eoBBw37SsKkpN5XwErHZF2xEvs2XCywiBfqGOQuus5RHcNt856LKJjP0oZPM7sGqG5
	JTa/B+rqx3Q4F0YeyrCfFu3MwLaeFdASJQ/nACHoM5DxmYW7mlQkmkH1bG8lPBKzxrNj
	x8NKfjxnEzXa022/mk0PT8R+42NiRFl8KudaI3AGjP5bC0EKgL4V3y8hly4PttIxb6HR
	lEygkl2mJPeVVQaYtezOPBzhYSB0UQmYF3NRgiyY5YgeVuH36JZYL83HBzsCTE3GPQP1
	I+KsyHThJAs1Gq1aA1qZggO+56XRnb2Ce1vWvaBOMDcZXDLERhUlp9itpY6UIXDmvVdP
	5jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Y0Walu8VgDMAGscpyqPqbLAt6EZB9nvRY8GDcZ5YYak=;
	b=A4J+4RZqcLB519d3hMy/FOrMZ8pcQCgxr7v4HHPwIcz18EA2byg4VU6lavx8sW70Iu
	PQ6c7BfOovZtRMuG9gZOjpOKWrjevYqJ+oXbth64YtkQUR0Ynci9H/nIBtzYemGCJ1oz
	otf35Sea2hwnpFON3eofXMEaL5IgNgZ9MqqiJY5PPD2PBhO01TLojGMT1WlMIlwXqCt1
	3RqHqiE6ofmk5uesTplZyMU/QNEMbNVzzu3DusAru+QJLpRCjKsaor5+CZUFjMZA1ol+
	fVrkOXR6D5BdvJrjtd11r5d63vT92FFZf76hKImr7wTj6aRtpj6CQLNFZSHfefuEEpcD
	X0DQ==
X-Gm-Message-State: AEkooutwQ9aFvHDEI/yn4zSl6fZ3x3wMENxzd4VTpKr/PFSCdOxO+2Jnukp9xK4YRPxbzQ==
X-Received: by 10.28.145.20 with SMTP id t20mr3016875wmd.74.1471008045645;
	Fri, 12 Aug 2016 06:20:45 -0700 (PDT)
Received: from bigtime.twiddle.net ([195.70.95.61])
	by smtp.googlemail.com with ESMTPSA id
	wc3sm7514336wjc.47.2016.08.12.06.20.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 06:20:44 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-3-git-send-email-vijay.kilari@gmail.com>
	<540c4c1d-1590-4c64-116a-e6b41bd3475e@twiddle.net>
	<CALicx6so0YyDumHm3VX0WiUCdkKQx1MQHXEzTzbMyUHXT+Z4AQ@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a043438c-25a3-4a50-d105-78ee91ba032e@twiddle.net>
Date: Fri, 12 Aug 2016 14:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CALicx6so0YyDumHm3VX0WiUCdkKQx1MQHXEzTzbMyUHXT+Z4AQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [RFC PATCH v1 2/2] utils: Add prefetch for
 Thunderx platform
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +G3diu9A3MS2

On 08/12/2016 12:32 PM, Vijay Kilari wrote:
> On Sat, Aug 6, 2016 at 3:47 PM, Richard Henderson <rth@twiddle.net> wrote:
>> On 08/02/2016 03:50 PM, vijay.kilari@gmail.com wrote:
>>>
>>> +#define VEC_PREFETCH(base, index) \
>>> +        asm volatile ("prfm pldl1strm, [%x[a]]\n" : :
>>> [a]"r"(&base[(index)]))
>>
>>
>> Is this not __builtin_prefetch(base + index) ?
>>
>> I.e. you can defined this generically for all targets.
>
> __builtin_prefetch() is available only in gcc 5.3 for arm64.

So?  You can't really defend the position that you care about aarch64 code 
quality if you're using gcc 4.x.  Essentially all of the performance work has 
been done for later versions.

>> I'll note that you're also prefetching too much, off the end of the block,
>> and that you're probably not prefetching far enough.  You'd need to break
>> off the last iteration(s) of the loop.
>>
>> I'll note that you're also prefetching too close.  The loop operates on
>> 8*vecsize units.  In the case of aarch64, 128 byte units.  Both i+32 and
>
> 128 unit is specific to thunder. I will move this to thunder
> specific function

No, you misunderstand.

While it's true that thunderx is unique within other aarch64 implementations in 
having a 128-byte cacheline size, the "128" I mention above has nothing to do 
with that.

The loop is operating on BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR bytes, which 
is defined above as 8 * sizeof(vector), which happens to be 128.


r~
