Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1156578wrt;
        Tue, 27 Nov 2018 03:45:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vvanfu+508u7FME5fwa+bmiUgNm3FSSBRpU1SY/lKbPeQOTjm1YTWi5LK/aPab+qUR0KsQ
X-Received: by 2002:a25:220a:: with SMTP id i10-v6mr32222612ybi.185.1543319139105;
        Tue, 27 Nov 2018 03:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543319139; cv=none;
        d=google.com; s=arc-20160816;
        b=XTc1iyLCI26iSgIFdPLIYPumAPfcbyH9qyX+yhXX2euZ2JPIxAdhzbmDwdw3EMMsEI
         Xrjbz685cPzD4eyWg9/AZonrdo2wolgJ6VvRHF4nuvq+eWyWLN8Rmhh1R0irXMfkKrN7
         djXADOCygr8ERF/KycUZ9xKaskdsnPiqxozep8DAuaaHFtM8ixlLd1YqrWlOg/R2DVwu
         TEhDqGC9IEFA4mzhR3UTjphOMCqnwUWZpXnK/oWFcSQpR62R5ascxk6HwEoQoq2z06ff
         LsC2oafr4QSjI73E0Yz3EhD3wUUdq+A1JO92O4KoIdG1TnaFi2CbMDZq1C2y4EILXuhK
         7DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=6B57lzkzcTGKnJRmfzVMrZl3QvKBvGnqzHxwvhaQbf0=;
        b=L7rr9KUivVh61S+3cqv3To7L0ZazBCOm+SzHlDV3pL/7AG13oAEEKq878gEFb3osLz
         m4SyWEoHnep0ROe7UxakADWL+/7T9521MAKODgAoWBGXw0ugyKaa/hMXuAzt4Lj+gHro
         GIrM00LaqbnbqQ0mWuc7xuylT9qOOpp8GTcz9qpYrA6ORrvda0Jweg5ftTPxH+3aKrUu
         L6lyYlvmbi7XeN3HtQM1jecVSWrC4xtJTb9HWkduCWZgeI3h/dWxNAePSTtdxA9uBPDv
         0N1yc+2dMc6eDliduFHqxP73adRkZKUKAHcmIb6/aGJJ245ZCAgobO7uYGX1+buCXkCL
         WnaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5-v6si2473466yba.391.2018.11.27.03.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 03:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRboA-0001DV-HX
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 06:45:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbo0-0001BM-JK
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbnw-00025S-KR
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:45:28 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59913)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbnw-00024x-BK; Tue, 27 Nov 2018 06:45:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MpUQk-1fc1JL0xqu-00prVv; Tue, 27 Nov 2018 12:45:19 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-16-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8d624826-9dc0-472b-0b1a-d0695ef507d8@vivier.eu>
Date: Tue, 27 Nov 2018 12:45:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-16-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VbVm4USnYpS6xw6rLqnxvR0/Av4C1j7YF/qTXxld9QKDzZQgc+M
	LoO0d4LkZSuwoPfLi5ecqrcrUKL3mwUvnnJ+sPhTZPBdYqYUc6Gz+cuCZUgoMhmN5MIetqa
	xT22P3po/Z/v6IWCDXInBWynFbE6dHzNbQBQjQnVNcLz5dIeou74cF+2DGUwjtS98rI7zQD
	YXIN7iwj6mLbdPX3coS3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XzZ16+lbDxg=:EtxCNwLWzEWa0EPNyVk9/B
	xBm9o/8Si+r/4W3buDPnKL4kRh3tHjNMbplwj/T9cok8iFpFH9MjRl7UapHhYBBNDKJV54CD5
	eJKN0ds6cbSy4e1T6Z+sjkRi06O23s9KGPAASMydmAEVlqR+hxUL36vX6HYHZaOC9m0lTSutG
	sKMxXaMIFC0P1wu0DIJkNF97bQtqOMdiL2k6OM3yOAdcwOyczVbyh0Z+2raxG5dw8DUnJwm/Z
	D3qroXYfVylkZVwdevKRztLMvFuun0EzMbRbFeo9dInUNlzc2F2QU7KI3L133uVgzUNSYb8c8
	GxSEO5uRRSK3IAoZMIeqFYvFOE7M9tgXNz3xzFr7EIp0Wq8DJ2NqHtcTnk1TVn3tGxT9W3Icb
	gA3pUV++nLcxrGZVSNrhjzpOn8kRmF8P6a4ff5zcjgNJtd4RWoYtErBERSsJWyEq3mLjZA+F5
	WI3F/cqzmifxxy2ZPxTVKBR9DAmT/SN/0C87FKOlTjqYINP7IIcjieEn4pwKeNf5agS30fZYN
	ihc/k/HbTayBjmiqsg9ClNurU/Bj3rgi/7jx2xyAcTmqJ3HxSBvy7FcFX5nudy84aaACl1GRX
	2JVVPcA9raWSGvt8DpXJMWIt1CPcgw1XDwV7rRl0tUlKT0mLeKW8hVzHDqnneVAtHU7R/mNnS
	7pYekHxK+5aiBtO4xRUTrHPlGg0VJ5TdUsZZdZfth0Z22ofd/DX0KPNE5M8dj+YhVzq/TqWq0
	jS3haUS/jmYTR8gZYqBvfG6qoH4NnGTO+54IhkuTjjTe+2HUCxITGX8IpYOObOetX5Kt9+oXX
	rVMoD5PPiRQXkWb7gCHQ79ZGLv3E9SZaPhOhIY2rNuWtXjla48VQGKONNfZ8eF7YyhDbl/Vww
	xTwJNA8PLEpT6fs1D6Xvfm7sjrf/YuDLAWYUw6bG4+AxI/JaBuPDdxmxjW0nxxvZRx4gH5CZC
	ZIrnkYP4lQEkzOriDHHVHfwBFZa3IRDgdUzzA5IgEBtjAL1K8tTKMLhV3W9qJ+eTsfIH8IsCa
	0Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH for-3.1 15/25] MAINTAINERS:
 Add missing entries for the Canon DIGIC machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0expAUnu4wgM

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> This pattern now also matches:
> - include/hw/timer/digic-timer.h
> - include/hw/char/digic-uart.h
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eab0fb9742..e04f2f1a44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -527,6 +527,7 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: include/hw/arm/digic.h
>  F: hw/*/digic*
> +F: include/hw/*/digic*
>  
>  Gumstix
>  M: Peter Maydell <peter.maydell@linaro.org>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
