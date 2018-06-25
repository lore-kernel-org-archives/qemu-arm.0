Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3391932wrq;
        Sun, 24 Jun 2018 21:55:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeuMBBl0AWXb/Q7go+XK5n8me80gh02fKR8txFFJPPvZbqSVd9/V3CAZ4YzjNjLKlpwLemt
X-Received: by 2002:a37:d1d0:: with SMTP id o77-v6mr9013971qkl.185.1529902556694;
        Sun, 24 Jun 2018 21:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529902556; cv=none;
        d=google.com; s=arc-20160816;
        b=bcvzoy2Cxuu0myz66TaEcIqPyp9p0gQXWjpl4XPMRCGAooo/XR2ZTptXUMX8eqj4uo
         SbY2lv+AJ68nau6KfqaAw0W8R0pWNhfyEJxAjkpdr6T+R8viiSvqQKT/3srYeBxqliRP
         dUWGcdrI7jNmoMrqRPpDzflWLKGcDTeOk1duEgslMmpLjzuzdFVKQN71HaUJLwVDGQl2
         tfOAy5y1WTG+ybh1zfReZllcvlXGBz4uq3JzoaCBPm+QUZeVKR5j2q62kJd4Fe5F4ENA
         Jc8KeIOigSlKswOfMbXvL0DJ/ACo/y0FXeIwTAba++dwFOXMGqbVjKB4lMfJPWDDipP1
         4zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=AFXXp/o064fNNh2rIoXuZW/nDdrHP9bvA+a3gtYSS5E=;
        b=pAUhtoMb1nkPZ8c8HtsNsXvEVbEmxUdRj9WbubQ9rGac7PTlNFpEoLk2S3/V6Uv0F2
         kEUaGXEKtEXQVM9lSr/FdE3hglE8n6XlTqCbnhf/eFZvxb6Dxjq/l0WOD2bG9LUTpQLl
         UMMAK7nzS3xwQpeE5V/dmRhB6Dst3cf1DWwz3aLMaEyS/rronre+I3UqhnA/NJ9Y8t2v
         W6Jue/P0e2JqsdZBqY9fvTMnVB6SCV5I2Boj5b+Dthnzp2lcGkyDaECyGUlKFbPsWTEL
         kRqmj35ZjA3o6SoDg+gnKuJPp+JDJ80lm+JED0nCGTW1C0fgd5jopq/srEuX6FgxUSbN
         nfcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f101-v6si7320385qki.323.2018.06.24.21.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 21:55:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXJXg-0003R4-6z
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 00:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fXJXa-0003Qw-Dz
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 00:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fXJXX-0000ia-AC
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 00:55:50 -0400
Received: from mout.web.de ([212.227.15.4]:39739)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1fXJXW-0000hq-Vb; Mon, 25 Jun 2018 00:55:47 -0400
Received: from [192.168.1.10] ([95.157.57.47]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0M4Um4-1gN49E2Lq0-00yirO;
	Mon, 25 Jun 2018 06:55:36 +0200
To: luc.michel@greensocs.com, qemu-devel@nongnu.org
References: <20180619093124.24011-1-luc.michel@greensocs.com>
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
Message-ID: <d3c05355-4eda-f501-8f04-d808f416393a@web.de>
Date: Mon, 25 Jun 2018 06:55:34 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20180619093124.24011-1-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:wSqMd+sw5gylBzEJbpkZW08cK9of8G9csYzS68h2Cge0ndNFMe+
	ftMUqrReG8qwCcCuA6+noQau8lDz1n6cGsOqkbXW/roOa2CWuYSzbqYpIMqw20d2M9QhtXD
	IOLzF1BrpkkfvvR0ngamoJf9dDU+ZBjLFw3oEC0MnHZIKkWhwo9WUxnyN96jrCt+NJoqSKr
	KEqghV13Gje1R/3g0D6fg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:bG3HBL2o40Q=:8imQnU48PYFROypuawUaIG
	YJszvH6Mdz/b5FQv92YclMSW5Z3CIlmySXzC1N8OV6InbGnAip+n9xKvFRBa32hgFHMTVydyw
	0Ig8ZF8gwrcXy9O8l7IiKd6VhEqgtG7jmKKeqkPBijVeaba0XfuDQhoVIMIoyn4YqdIDwBPqY
	iTLRjIoV01S3nIoos0OU41K1b6d7lxiL6k+AgE9/gQ53zADJiUHx1jEmcz4XHZa+vsbA2IWyx
	0GOWzqJ9xoRE++CDD8zyTDfk7NnVWSgFHN2Vg1s+dag6l6slXdYMOJsMI+TszP6Arj4Rm2Ehh
	QJw3fzWGyRJqDsj1grkCiLJ/oIZaZPYBpZMzA69eAJBW1YLLsLZCrzUiTYF6W4DLc/TAJTZpA
	csZV5kwMMujggn5DYqw25dLESrcUkw9ndjd7IKYlTPCm4WJr2cmqWXmamP+yrY3m2+ggsSxVy
	ZpV4LpKrWNSjhXvBGsEASbLpM5SX6kegJVw0ByCPZG1s+RW240S6Dswy/zo8iP3yu5VG4L5+K
	4PYfG26gJGhFc116M8gIw3Yrw2iDl2TZYXlE8nUMQ0i21nRKAD0Ou2hIwJdzZYvu+htNfuy4Z
	b/uEYRYqxNmif6j7bobNa80Qj7v+yx1XFNGeNJpBksMJdC9c7zJVpaMw9b6674abR1b4Dbfch
	PWn9B5waGTub5vEMgtxj2jsntw6Jfabv8osOThEQe67vRqsLgYpaIyESII8C6pzthr2uOQcOE
	C/yOZi75ZEg0E1C4bQ2NNHjKuT7ZenGQAC9j7uhxpTh/4IU4R8Vv0uQSkG8aOhUsUC1LoR0dT
	X9XEMtc
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
X-TUID: TW6Kwt2AsClw

On 2018-06-19 11:31, luc.michel@greensocs.com wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
> 
> This patch series add support for the virtualization extensions in the
> ARM GICv2 interrupt controller.
> 
> The first two commits do some refactoring to prepare for the
> implementation. Commits 3 and 4 are the actual implementation. The last
> commit updates the ZynqMP implementation to support virtualization.

Is it enabled for the virt machine as well? Seems we are missing some
mapping of GICV and GICH there.

And what is the recommended way to get the ZynqMP model running? I've a
kernel that works on a ZCU102, but just passing it via -kernel to the
QEMU model seems insufficient.

Jan
