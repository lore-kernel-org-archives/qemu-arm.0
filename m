Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4837095wrq;
        Tue, 26 Jun 2018 03:22:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfIU5bvQR9h8jDitVLrSukl5zNg3ls0D/EM1YCgWohcfCIqyL21hgwFybPZAA9wuyJnY8WY
X-Received: by 2002:ac8:25ac:: with SMTP id e41-v6mr778027qte.66.1530008549458;
        Tue, 26 Jun 2018 03:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530008549; cv=none;
        d=google.com; s=arc-20160816;
        b=FC2IwIJWPIr1/QsuYp+UvW/wjr7dvvX/Ad2zwUF9eWSXXma2pO1UPKmiPXQaHEoDuM
         eIc5yOMIFCW3NHLGg5gI2lGdH7gUpkH7d9NbBpvM0Kn12SbW7YqD/2wGjfX23ycMPEoP
         4AJBNGnfKIrBJ2mommgg+TxcrlL/8t2g+yN26LxPylAuTZLp5mrxlm/4Xh10HBel9rWP
         7u63NMF9TCuMtv7yuRl4ORpghD0fk2xLQlAr6WHNfwL9DgKKGKazt7VNaEOSx3CkL2Wv
         KX28u5bgh4YxHM4/bSYuI52st/cvbJ9VdS1XovYkpI/d67eLq15KXGxd0oRCJi4d5mZv
         l//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=G5ZBabmPTJVPhGwuxT5n+CblT6Kp7mm7bD58ZKnAdq4=;
        b=v7kn4GRKBGLKKx8Zo985i1omLjXoJn9OuIm68v4w3KEXQR094TrLzEBiBlvj2shLfc
         1ENFC/BQefkbqWPhufa0HCvzDAl1x+z69QC7k0cjwLcrVyh9PV+5d7uCBdXr6Cgz0F1f
         Fzq6DLz675M1/JeNWo0I0Jc5SMXIEWXoGph0CaWh2iIWMSzLNACd/z/a4SzwDtAdRgpf
         Ahb0/xHx5dwT6nWsMyZH7qHIJZRlKaM/3fzeF5WTxAi/5N1vk5loks2joauNMxgVLW2U
         THBE6NXcrLEC/ENMU2px00846xGEEYgNqJqdt8dwePsfqdiU7aqgDwEXMdX7/0XZ1j9v
         IKnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q188-v6si1202922qkd.210.2018.06.26.03.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 03:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXl7E-0005Aq-Vc
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 06:22:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fXl79-0005Al-2F
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 06:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fXl74-0003E9-0P
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 06:22:23 -0400
Received: from mout.web.de ([212.227.15.4]:38063)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1fXl73-0003D5-M0; Tue, 26 Jun 2018 06:22:17 -0400
Received: from [139.25.68.37] ([95.157.57.47]) by smtp.web.de (mrweb002
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MMFB7-1fWvd91VRV-00845Q;
	Tue, 26 Jun 2018 12:22:10 +0200
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<d3c05355-4eda-f501-8f04-d808f416393a@web.de>
	<3c8fa899-e420-15a0-a2af-8d92ca390a85@greensocs.com>
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
Message-ID: <d86380b6-cee8-301c-45a1-b696acf2eeea@web.de>
Date: Tue, 26 Jun 2018 12:22:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <3c8fa899-e420-15a0-a2af-8d92ca390a85@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:AxgQZvzGRbdePV+kbBb90zIEGIp/+W1oSayUtxovzIhW05s3QjX
	QUvz+CvRK5s7SZK7rWsEdbq5rlBdWRwpHNf6uFfmHu02/X5+4cml3QOurfN3PRXP3fqm5S5
	olVbTwgHLl+sTNZRZ6lKLULOZN3dGO6zCUbUvNGSVYw//6RPcebZpCnD5IBKmKI9ZeVAkOk
	BmTU8RECIydOapyIWw11Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:1RkQk9roJfQ=:ZFFDvCM01MnE0Vm3pVJdWm
	fp2HsXIZQTI/5h9/5xixMIZyy0rAN1iH+pgWQa8FNFuRMyOWWGv16QpjeegAhzKSl3cxuZnnB
	1SOnHyYiq/OSsMg1U0GWK5VWiKGDLyHuzwvh4TZI1eKJGFCJv31+UN0BHWgOLXidEQIeLnQ2s
	SF3e5FSlF2lYIUVA4psNnaXZ/8f41k+3LtDFJzyuY2S0dYQckc2dA8xlJimw5jCr4CyUSjD9i
	IVEz453pG/mrUdP88IitRbDmVIOBQvxb0dZrJi7govXE/Rd2++Z3lVzSCF/dDdeTvy1cBmuZd
	kjFHwWPWz4DQcEKIlfB9gdwAPDL/t4F1ALV8L9j0cmg6EhT4kYaJWM51X6RZ0n08FV96ixJIc
	AnidlfrPE44JjU5+DXfbQMQPmcgZFDWZnqnpTDRISXLiHUSdgvPHRtXgEsapS6OmQKNxf9MJE
	BhY8agPo6SMQvXIIB8pAGtwpZTO+KxI56cUeyUMu6Ev7P68MV1tcryjrZzymR73+m9ItjQn61
	XnilOENBn/w6sDqcf7LZZaVtT4r9rLuYg5Lo9dbFJKRor3+GY1oSvxZ2z0jOWOj/CV9062GUM
	Q+Uqj3QizS8OabYM+Nz6c3pJWdsfM98lNRPF+d++XdeVQo5KO05iwZRAj5kWNFmQgafPXMWAn
	Hrp2sKLqed8KaHMoVgOzQLGoMCT9HQQdYtVFNIvM/V57DQ+o4GS6+CG+ZJhDeBJo0j7v4NDn+
	tsNS+IbYE+5E0RfjZDV6fjiFwiFBjU15/dOkT+om3KhattuXl8YHPw9a0tGlc6DBkIX6KuXmI
	m2HaIfI
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.4
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
X-TUID: 9p5oqNVywh5M

On 2018-06-26 11:24, Luc Michel wrote:
> 
> 
> On 06/25/2018 06:55 AM, Jan Kiszka wrote:
>> On 2018-06-19 11:31, luc.michel@greensocs.com wrote:
>>> From: Luc MICHEL <luc.michel@greensocs.com>
>>>
>>> This patch series add support for the virtualization extensions in the
>>> ARM GICv2 interrupt controller.
>>>
>>> The first two commits do some refactoring to prepare for the
>>> implementation. Commits 3 and 4 are the actual implementation. The last
>>> commit updates the ZynqMP implementation to support virtualization.
>>
>> Is it enabled for the virt machine as well? Seems we are missing some
>> mapping of GICV and GICH there.
>>
>> And what is the recommended way to get the ZynqMP model running? I've a
>> kernel that works on a ZCU102, but just passing it via -kernel to the
>> QEMU model seems insufficient.
> Hum, I think it should be enough. This is the way I run my tests with Xen:
> qemu-system-aarch64 -M xlnx-zcu102,secure=on,virtualization=on \
>                     -m 1024 \
>                     -kernel xen-kernel -nographic -smp 1
> 

Just debugged this further a bit, and it seems my kernel is not getting
any device tree from qemu:

(gdb) bt
#0  cpu_relax () at ../arch/arm64/include/asm/processor.h:203
#1  setup_machine_fdt (dt_phys=256) at ../arch/arm64/kernel/setup.c:194
#2  setup_arch (cmdline_p=<optimized out>) at ../arch/arm64/kernel/setup.c:258
#3  0xffffff8008e30bc4 in start_kernel () at ../init/main.c:552
#4  0x0000000000000000 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) lx-dmesg 
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 4.17.0-00033-g67c2a9a37d59 (jan@md1f2u6c) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #17 SMP Tue Jun 26 12:16:56 CEST 2018
(gdb) l setup_machine_fdt
178                     pr_warn("Large number of MPIDR hash buckets detected\n");
179     }
180
181     static void __init setup_machine_fdt(phys_addr_t dt_phys)
182     {
183             void *dt_virt = fixmap_remap_fdt(dt_phys);
184             const char *name;
185
186             if (!dt_virt || !early_init_dt_scan(dt_virt)) {
187                     pr_crit("\n"
188                             "Error: invalid device tree blob at physical address %pa (virtual address 0x%p)\n"
189                             "The dtb must be 8-byte aligned and must not exceed 2 MB in size\n"
190                             "\nPlease check your bootloader.",
191                             &dt_phys, dt_virt);
192
193                     while (true)
194                             cpu_relax();
[...]
(gdb) p dt_virt
$1 = (void *) 0x0

Jan
