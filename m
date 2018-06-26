Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4843373wrq;
        Tue, 26 Jun 2018 03:30:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfQc9gpDls8VlckYZ/b4AqEZ/IBingM9sWwjHhCdtDifFzFCvuaTgJg3shrizrEo/JFXr9Z
X-Received: by 2002:ac8:7107:: with SMTP id z7-v6mr759112qto.41.1530009013004;
        Tue, 26 Jun 2018 03:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530009012; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ1cO2soE3OHqHWGryyy+X1BY7vQx11XANEgtT6fysC7e/QC5AvPdxiSc41FOE6Gcq
         XysQ0QKNCOaFtpU/gUaGaDi0Ce4f3ssl1DwLTvz3S1DcBzezu62DufpfznVxSfFiEGpN
         +6IDe45f5il6vn+pu2yWVUEYyauEIMcUq7kKHPqCTQR81JQI3HUljwcAH/suTAJ/CYyx
         knNbV27ayeEgGN3hjvJI6Q9gFLsm2siLxyEp6+EPzfggn43jU2xNwulGrDCcwGpWgBiO
         2MFV7DYbfpwQcIdmg7qCh9kZRRcp1fA2yGUYjtn9Uo93hFi78VOv9fKXf7B7S4zGe0cl
         2pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:references:to:from
         :arc-authentication-results;
        bh=eKZlTRoFxiTuMPBMa0BfIfqvoWsoEliuxv7fOnBgqg8=;
        b=tLBOxz19I/pBctlp2chUwyVGhrxW218Z2Kj8JIr2C0Bg+PnB2TdztYejqqfJi2BXDS
         xqW+rEwcI8Rub9GwiRYcsj54e/cozRr9nu3UyJYiJ/n+rNMHoiBlFXHFe8ScAICpHXwW
         4wTASWNr7dRdPGHrFh8GfmIM/GzQhP2BhXjE3woNIpf9QOkxSUhVq9RPnLco5S0Js/R7
         I0MF8n+jSO+sfS0tjvUUDOZUwD58vUDfwQBqBcF0F3JXrSbCRz+uOKqzVVLL/ttIgidr
         b2/yTksUW1E4TbKG3SDZhBjwSF/dkJFzS0CcWOo6taTzmSlRXGD2Ma2WlVrjAog30fzi
         Rl/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d192-v6si1174642qkb.390.2018.06.26.03.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 03:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXlEi-00087l-HY
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 06:30:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fXlEa-00087A-95
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 06:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fXlEV-0007ue-7w
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 06:30:04 -0400
Received: from mout.web.de ([212.227.17.12]:58659)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1fXlEU-0007u2-Ua; Tue, 26 Jun 2018 06:29:59 -0400
Received: from [139.25.68.37] ([95.157.57.47]) by smtp.web.de (mrweb102
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0Lcxxc-1fyKXY0ZGq-00i9U3;
	Tue, 26 Jun 2018 12:29:52 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<d3c05355-4eda-f501-8f04-d808f416393a@web.de>
	<3c8fa899-e420-15a0-a2af-8d92ca390a85@greensocs.com>
	<d86380b6-cee8-301c-45a1-b696acf2eeea@web.de>
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
Message-ID: <3ee0f02e-d4a3-d4f1-837b-8201fe3fc787@web.de>
Date: Tue, 26 Jun 2018 12:29:46 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <d86380b6-cee8-301c-45a1-b696acf2eeea@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:UT2vpCoXm8OTPcn0iHRqKIbDlg5y4g+9UzWkqgqNq7TDbJ1lR+3
	vDs2T7F4heH8eHBCysB2xFyrdGpz4jpKAl/rWA+nFAjDlOC1kN5W8/Qm286E1mMSFiD+qJ+
	ksSuBwjnHUtgljTek4TjFbKAI35d5HNhfF5nSvV5ELEVf6BLuCIwDEYvbUj5NhXwWc2q8/z
	3CsSO1pBruelgNri2Qrvw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ru2lNUaxOiY=:bOHzzPgfcwt8C5XUayXMxF
	4L5f/KxTI8W+3QSwkfY5gxNp+SRQI+wZt3bKjNdaQbz84NDbD6aY7TuV3V+vv2YjNj/X/DyHJ
	7HDINYF4N1N8HBmZm6nEKMlVz6ga9MJC2Q3mr02G99FZy3b5ZsBjgMH6ZRX1Q5VcAfUr2r5mp
	zsvTm1QeQp1zFhlt3Lic41sgGrL6OyyyLf1zc8J8rtRAB02v8bXOGIkbcyEpSE3cPkFX9Jmkg
	Q4q2uWDVUfYJNLbbSC4d27ap+lG9i2szqcBXvZeTyFNSAB7/j4sMmgXQ7Hq1SiiTGbFzrLugQ
	FnR+N2cHbUEZgnJTgHJVOQM7KID8MY7Kmv26hDfrTnRxGlsBAOXNE4WuJPCnS4ORFzlEtUNqX
	2f5w0R+1jwEritPBdTYFs6GFGk5uIfGdX0S6Z9AtF4sM7hmjwjOD5NCK3Ij0IMPPsjEgGqNTj
	KW8DF2l2sQq4PHWHycP5WMbLzAWT/8ChcYkaGVUW83I7ySHw2e2otMYxzGGlNxph4+H4k0XCk
	7V16mlvGkjll99bxz9Sr7ipAAvVwG948xSAGnRXGrDzPJdJLSQsSdC5IEv+JdYBdbscFpXhvS
	cSIT/fSOfPXdMzPwuv+ZvLT/5RInvPV06dh36+n6dJCvaoJLpAKDs2S2ukMTr8EDj4ByV2ZWm
	pjCk0DJsEM3rxESCdWwNnduZi/Ao3MbAWzpebYJq8IpLiuxV1RyTbrLhm8ZSFLNkzYYQv4Vkd
	4YuI+8jvjAD8hRfrbZdkW4whdchBePPDoflEYEqxFZzBz0lBJSfihofxgkcDvSlmkjPQ5U904
	brEd6Zj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.12
Subject: Re: [Qemu-arm] [PATCH v2 0/7] arm_gic: add virtualization
 extensions support
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
Cc: saipava@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	edgari@xilinx.com, qemu-arm@nongnu.org, mark.burton@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsXlr+EJczRO

On 2018-06-26 12:22, Jan Kiszka wrote:
> On 2018-06-26 11:24, Luc Michel wrote:
>>
>>
>> On 06/25/2018 06:55 AM, Jan Kiszka wrote:
>>> On 2018-06-19 11:31, luc.michel@greensocs.com wrote:
>>>> From: Luc MICHEL <luc.michel@greensocs.com>
>>>>
>>>> This patch series add support for the virtualization extensions in the
>>>> ARM GICv2 interrupt controller.
>>>>
>>>> The first two commits do some refactoring to prepare for the
>>>> implementation. Commits 3 and 4 are the actual implementation. The last
>>>> commit updates the ZynqMP implementation to support virtualization.
>>>
>>> Is it enabled for the virt machine as well? Seems we are missing some
>>> mapping of GICV and GICH there.
>>>
>>> And what is the recommended way to get the ZynqMP model running? I've a
>>> kernel that works on a ZCU102, but just passing it via -kernel to the
>>> QEMU model seems insufficient.
>> Hum, I think it should be enough. This is the way I run my tests with Xen:
>> qemu-system-aarch64 -M xlnx-zcu102,secure=on,virtualization=on \
>>                     -m 1024 \
>>                     -kernel xen-kernel -nographic -smp 1
>>
> 
> Just debugged this further a bit, and it seems my kernel is not getting
> any device tree from qemu:
> 
> (gdb) bt
> #0  cpu_relax () at ../arch/arm64/include/asm/processor.h:203
> #1  setup_machine_fdt (dt_phys=256) at ../arch/arm64/kernel/setup.c:194
> #2  setup_arch (cmdline_p=<optimized out>) at ../arch/arm64/kernel/setup.c:258
> #3  0xffffff8008e30bc4 in start_kernel () at ../init/main.c:552
> #4  0x0000000000000000 in ?? ()
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> (gdb) lx-dmesg 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 4.17.0-00033-g67c2a9a37d59 (jan@md1f2u6c) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #17 SMP Tue Jun 26 12:16:56 CEST 2018
> (gdb) l setup_machine_fdt
> 178                     pr_warn("Large number of MPIDR hash buckets detected\n");
> 179     }
> 180
> 181     static void __init setup_machine_fdt(phys_addr_t dt_phys)
> 182     {
> 183             void *dt_virt = fixmap_remap_fdt(dt_phys);
> 184             const char *name;
> 185
> 186             if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> 187                     pr_crit("\n"
> 188                             "Error: invalid device tree blob at physical address %pa (virtual address 0x%p)\n"
> 189                             "The dtb must be 8-byte aligned and must not exceed 2 MB in size\n"
> 190                             "\nPlease check your bootloader.",
> 191                             &dt_phys, dt_virt);
> 192
> 193                     while (true)
> 194                             cpu_relax();
> [...]
> (gdb) p dt_virt
> $1 = (void *) 0x0
> 
> Jan
> 

OK, feeding in -dtb arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb
and setting the console to ttyPS0 gives now some output. Looks like this
can take me closer towards a testable setup.

Jan
