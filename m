Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp667066wrq;
        Wed, 6 Jun 2018 04:02:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJXILmvG5IfG3yXhp6PFp2Kg300oIXR14EsGj0/6pYNLq+UDqIIx0NpsIHpen3UxRSKZaDq
X-Received: by 2002:aed:234a:: with SMTP id i10-v6mr2178612qtc.263.1528282973649;
        Wed, 06 Jun 2018 04:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528282973; cv=none;
        d=google.com; s=arc-20160816;
        b=k56Nm0S/wI22u1jOJ1wZKyTAiQ+6hFuKyLtoGx402KD2AoemAg8Xq+iG1M71DVEWIl
         9G0IkrkwrdvRDjDXq32l0ITubliEVEY0c/f3DwYrgp1YlTib1mhU3yCHD5Y9dHntvwx/
         EpQfD75URZGr6flUwVj20jt9DKuSsRn+CpbsJPDIHa/DDLFrfqzgm2LsE6QAZFiWNOXG
         hAPl6cjmjU0/TD+jzXIbN8pf3hcouJSXl5SOq6PypKT4aPZE3r/8ETN2ovE65PIBkddi
         NGDPqVLsaj7ohlUKWivos2N7nJ3yEYgr3sOxM82g7T4lUcBcY32atrnYvQa5TL3yTjUQ
         SUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=7juRqXARGeErmj48M9Y/ySU7y4YmA3i611RjXo1+gHE=;
        b=k0VmxenGx9EBN7iIZHvl1zUtiCVgmaVlwCkDbzrpWwHeg9QDOLO5RDRp/5O8Vzt6pB
         s6hwzP6bjQii846U53C1YZAK4P/rU1qYYR1JLnKAGFeMT81nn1J7DDToKU+fDsnRovYQ
         8p+kjnWCYogHWl3sB5D5Qdo5hGaZkLNAXPbLknRizA2bcrQneY0KdA92gBrZaXWeF7T2
         WTx/4PGgXi07Y8HrHN8XOuLpAGuBGZ4l91yiR0uFzoFM9IZ48uy6puvYBBHzbQjTeny6
         KfBW3FimwjzowKF+P0XJuYGsbVnGrAnutiERR4DPiFxG+/cj78QN4RvccEeaCF3gal6c
         VnXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v15-v6si5307080qth.399.2018.06.06.04.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 04:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQWDN-0000Se-8Q
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 07:02:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fQWCy-0000Qp-Lj
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 07:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fQWCx-0004jo-R5
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 07:02:28 -0400
Received: from mout.web.de ([212.227.15.3]:39163)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1fQWCt-0004gU-8P; Wed, 06 Jun 2018 07:02:23 -0400
Received: from [139.25.68.37] ([95.157.57.47]) by smtp.web.de (mrweb001
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MHpOP-1fRKUF3Ui5-003fiA;
	Wed, 06 Jun 2018 13:02:15 +0200
To: luc.michel@greensocs.com, qemu-devel@nongnu.org
References: <20180606093101.30518-1-luc.michel@greensocs.com>
From: Jan Kiszka <jan.kiszka@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=jan.kiszka@web.de; prefer-encrypt=mutual; keydata=
	xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
	KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
	Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
	/2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
	44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
	YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
	HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
	9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
	IDxqYW4ua2lzemthQHdlYi5kZT7CYwQTEQIAIwIbIwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
	BQJOpoNtAhkBAAoJEIrUrG965ecUOPUAoK+Rh12KgCjplHAS0AoiGKwGOuq7AKDEVnBtRAoy
	VRvp3lOlOx+P2Ay56M7BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepK
	vIfiM8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+
	bgvMOsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hncls
	Z/IYhXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVOR
	TOtzFK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5
	gz88SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI
	3KCT67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdI
	vttwzG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPx
	bRea9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zp
	q61toNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+N
	K8JJBBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wH
	AJ46S16yab+OxNkvOeoOEX0EnHVHaA==
Message-ID: <3c53fcca-0bf1-affc-6778-94a493e3fc08@web.de>
Date: Wed, 6 Jun 2018 13:02:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20180606093101.30518-1-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DExN9uHI/K6dT2hdsjHSovNtws80t42cnKFKVluYrPbqk+9akct
	DOE5Sk7iyUN9eqY7OKU0X4ir6Xff4+aq4IfHSgex5hkhxvDD5L2B4FpK0nMme3TiWEydwuB
	vMV2j/LyUeOE9v2dWnB5DzwYpYqCMV5iYHBuTt+uOWLywleGqC4quQ+yoTc2KhR6sC84GSq
	15QoGeWy1mO5KdvK4wTGg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9c7GI4XJ+WI=:VG7iJ6UpKT0hrs9012AuE1
	QQjWtB++7hjPBIZxP6ofhIk5YxWd/jnzOFShW5sigLli9sPdSLZxTjm7Mr2RDhAm6NG539Y9q
	ZC/kM5GlU1axTL6GC4H9Ns1QxUwmpX00ZMifFV0Sgf+a5AqbHznmllXaqua8QQHBDj3mf2NAo
	e3EnbX8aSk8LHnDQDOV7IrsNjOvLOCkMetKTtiT26WfBcR3l9/G0tnOsMrRNxjw23e9D8rCzg
	VUnroBClB6FD55v9kEoLTz5u1FcewColGaSBbC8yRnbuAnZMtmoBm5uqJOQJJHteKIDSjWY5+
	KjeNCUMIruepARD400bbsre4qKGx0BMGz1tJEtmwluzUcgPaUStaajW7XHDijTZeQAdRZamkJ
	jyXh69BhAy+ddL/HML7Rx3YTyGvAvLVJFi3LbB1TYR3e17gCEUzN1oKG8AdPWKRYBD967acNs
	XJr3dgazmS+7d8aJF636WTFy6elgJPpY7NZCtSruDDbXzSfLKjNrSM20a99g6mUFrDzHixiBu
	Wpyv4YvJLJLjkNg+SFEz5rNf0Ys/3yCo5g/F7jRZgOzeVX5QF1/c52zMaixD31JLX4VMNgeF/
	Dd0oDxQkS4JpUDHzvO+gu095DfFQIO+eAEDi7xIF4015WRWNLcKCGM5wZ3UEWWbT8yQRhXXLC
	lDCRj47ziT9Ts+YdYkX+Ds8/0hzjWX6Y2ydJH+5e3ztEWiU+v2ouNb2zSBs5u9TRLBu0tZp8T
	dZUJkUd0g/kB+8ZhUAZ/CwIJg1tyEUpKtnYiVlFFiBCawcdWewyGaubBdf7Mz2/nB3a3/OCv9
	DAg8Umg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.3
Subject: Re: [Qemu-devel] [PATCH 0/6] arm_gic: add virtualization extensions
 support
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
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BDQW4YP5cW2T

On 2018-06-06 11:30, luc.michel@greensocs.com wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
> 
> This patch series add support for the virtualization extensions in the
> ARM GICv2 interrupt controller.
> 
> The first two commits do some refactoring to prepare for the
> implementation. Commits 3 and 4 are the actual implementation. The last
> commit updates the ZynqMP implementation to support virtualization.
> 
> The current state allows to boot Xen (tested with 4.8 and 4.10) with
> Linux Dom0 guest properly.
> 
> I also tested in SMP. It does not work directly because Xen expects to
> find CPU IDs in the GIC ITARGETSR0 register. This behavior is not
> documented in the GICv2 specification, and is not implemented in QEMU.
> By hacking this register, I was able to get the whole thing to boot in
> SMP properly. This hack is not part of those patches though.
> 
> I also tested migration, it works fine AFAIK. I had to add the HYP and
> SEC timers in the ARM CPU VMState though (Xen uses the HYP one) (not
> part of those patches).
> 
> I want to thanks the Xilinx's QEMU team who sponsored this work for
> their collaboration.
> 
> Luc MICHEL (6):
>   intc/arm_gic: Refactor operations on the distributor
>   intc/arm_gic: Remove some dead code and put some functions static
>   intc/arm_gic: Add the virtualization extensions to the GIC state
>   intc/arm_gic: Add virtualization extensions logic
>   intc/arm_gic: Improve traces
>   xlnx-zynqmp: Improve GIC wiring and MMIO mapping
> 
>  hw/arm/xlnx-zynqmp.c             |  92 +++-
>  hw/intc/arm_gic.c                | 768 ++++++++++++++++++++++++-------
>  hw/intc/arm_gic_common.c         | 159 +++++--
>  hw/intc/arm_gic_kvm.c            |  31 +-
>  hw/intc/gic_internal.h           | 258 +++++++++--
>  hw/intc/trace-events             |  12 +-
>  include/hw/arm/xlnx-zynqmp.h     |   4 +-
>  include/hw/intc/arm_gic_common.h |  52 ++-
>  8 files changed, 1128 insertions(+), 248 deletions(-)
> 
> --
> 2.17.0
> 

Cool! We will give this a try with Jailhouse as well.

Jan
