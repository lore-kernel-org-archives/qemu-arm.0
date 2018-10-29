Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4268495wro;
        Mon, 29 Oct 2018 07:11:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d/jC2dB5J5YvVvuzc8HxbtmwvCrg1vzcikUXlcglRR80+G7a7wPIwZLG8uFeo6LDUKQwm9
X-Received: by 2002:a0c:a912:: with SMTP id y18mr12992215qva.39.1540822309396;
        Mon, 29 Oct 2018 07:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540822309; cv=none;
        d=google.com; s=arc-20160816;
        b=gGGbQ9ltOuOXo1IoQUxfQWE+TNX4tAk6K3xh0VIG9sLd7+Lvv/6uIVSEFNMrf7P7rr
         xLZIxfVUPfV94ZI8ss6nFGZsvv512RXnGKlLddmlTsEAfdIBU8zcRGGRQRy0ce6Ite5X
         TPq52VZlJlr/4nVvjEKEc/Ps2Cj6w9KAgIZ/ffKRUKRwPjOtBYuqFfJvNWK4TVV4UgfQ
         gcZhDZkFqD6/DkYNrKZ5NclUqVSp3cAJ3owfLlZGsEWPU1IsYoN3VE51o1js3Jnfx5tb
         asqOqr/J06JVVvz+E4hjVcVVcvwVVwSXKXGMVOiQBdzGHzkRWAiy+60IJXwji4ly96lW
         3ecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=lk+Quu4wKHVdvR07NNWqZYtaZxBwFqaxgPkwitEOg9U=;
        b=VZ3iOoNH6uP5+7DBYp1wUkj7148lses/UIgZE/UreHbQRRa5f+WsnDQwqhwdG7h7zy
         ArI4vFdWZcFZ2nvDiKsQkUnPs4zQMj5rd+HwbNe+hVfitXizv30dlWt9kKHTw+s/bS8X
         /wJI68Y9XfEru9tRjJCponkNX+/ZElV3EwxyXZkKYhsI3O3IfLrj3TJ1I9d2ZUIdJgu8
         ErWxL/3vCjThvhMhyJUepqwgQWA3J0bC4q3PtL3mCPayinp7Tr0y1Wq4jPvmbQmyaE9K
         XE983htU37KIw/YMV0nekRRkAoseZ7SIZkcPgrUhMpcT1dgz9b2JnGX4JJS9EUbJxezO
         H2+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I0sslUl9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si9144422qvb.119.2018.10.29.07.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 07:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I0sslUl9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH8Gi-0006pU-Sh
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 10:11:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gH8Ej-0005lX-Qs
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 10:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gH8Ei-0004mf-Gv
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 10:09:45 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gH8Ei-0004b5-3F; Mon, 29 Oct 2018 10:09:44 -0400
Received: by mail-pf1-x441.google.com with SMTP id a15-v6so4094635pfn.0;
	Mon, 29 Oct 2018 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lk+Quu4wKHVdvR07NNWqZYtaZxBwFqaxgPkwitEOg9U=;
	b=I0sslUl9zmkF+QV17Cnua8wBEV6/NjJ0lWu2pXhrAtoS1gVeiHeMpIUi9fbCHRyPJY
	LPahAjFQ8El/N4YcOf1kxQNMluEMFYbV4AGnzHRODNzbqbWlwrDSDN+x2C2Tx9AarFbw
	i3Gx+79l6fP8Etyqwhh3nYSV3+8uai5jAbhxrCiE8jO3GEXilOTtO3X0X3hZtVORSN1K
	4heCYDKmuxWPIjvARm1a3RVyd4mQj7kSWq1QH06s6SJzGhx+NJw7T5Au6esZolzmo8fv
	NqbHOnwXrBpIVdXgYfs8SD1b9Hs6ZXQxBsrT7wzAeBfj4FZUBzOirOSLV32PdSnhK5/C
	7PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lk+Quu4wKHVdvR07NNWqZYtaZxBwFqaxgPkwitEOg9U=;
	b=H9Cxr3EgNz+HsiyXjWUXWGLu6dfHp1XF4AGc387oj+Zi+myvWKZegDlBpfocHMJAqq
	DRnilNYqC/GtOn0zG9f1TvsEqlDHXGbcghTNP1SH4P19KIxOq9nL+C3OOVDgCbIxiubR
	JEoLVHckNQgceUwdDCh70Y5cPm0xnlpq9aBuGyResgG0whNID+0BFD66U2jUl2fzy1FH
	iD7bES9vDR/F/J8M2vS3+MwUSB1AItbtITvwArPth+4TWXpzhtYfyuOPtcDAfnSW9mpi
	RH+QwW+qfr0RT9TXE3X1PokwkEXwIprmFLJPsm3fuFM2RzzjMGlO2lSYiieDL9jtMzGy
	opZw==
X-Gm-Message-State: AGRZ1gLZBieo2Wu1Qfnp+DcoZgu8CllonTb09OhG/RZkgoJ4D4cXshjS
	ewjWa2TN86fciz7r1PxkXKY=
X-Received: by 2002:a63:db04:: with SMTP id
	e4-v6mr14028655pgg.280.1540822171099; 
	Mon, 29 Oct 2018 07:09:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	x23-v6sm21785895pfh.56.2018.10.29.07.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 07:09:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
	<CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net>
Date: Mon, 29 Oct 2018 07:09:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 0/2] Deprecate the "collie" machine and
 Strongarm devices
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iYclD8OZRvI8

On 10/29/18 6:24 AM, Peter Maydell wrote:
> On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 10/26/18 3:12 AM, Peter Maydell wrote:
>>> Hi Guenter; there's a proposal here to deprecate (and eventually
>>> remove) the 'collie' board (strongarm) from QEMU. Is that one of
>>> the ones you're currently using in your automated testing of Linux
>>> kernels on QEMU?
>>>
>>
>> Yes. I can run the test with older versions of qemu, so it is ok for me
>> if it is removed (as long as that removal is not backported).
> 
> Mmm, but if we have an active user who's testing them then they
> probably shouldn't be in the frontline of boards to remove.
> Which other boards do you test with mainline QEMU?
> 

For arm:

akita
ast2500-evb
beagle
beaglexm
borzoi
collie
cubieboard
imx25-pdk
integratorcp
kzm
mainstone
midway
mps2-an385
overo
palmetto-bmc
raspi2
realview-eb
realview-eb-mpcore
realview-pb-a8
realview-pbx-a9
romulus-bmc
sabrelite
smdkc210
spitz
terrier
tosa
versatileab
versatilepb
vexpress-a15
vexpress-a15-a7
vexpress-a9
witherspoon-bmc
xilinx-zynq-a9
z2

Though not all of them are supported by upstream qemu. For some of them I carry local patches,
for others I use out-of-tree versions of qemu (beagle/beaglexm).

Guenter
