Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp753569wrp;
        Thu, 14 Feb 2019 01:29:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZvbSdaS4RKh8z7wpqU1IdQhQ4N7qCGD5prm2OxKfC7SCZcsPHTAEfHggkzpE1g2EzGHEMg
X-Received: by 2002:a0d:e896:: with SMTP id r144mr2192393ywe.348.1550136563443;
        Thu, 14 Feb 2019 01:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550136563; cv=none;
        d=google.com; s=arc-20160816;
        b=PNbqDzdykmwyPT5nsejyWZygPoFVhkgtaLprn3M+/SytFquY4q6LMN5zEE/59UHejA
         gXqfq33u0gHg4xnQGO0jy/1CjR2aUve0+ZhthGO3bLXaSxKASWwLrWQBGfNFuR5qTX2Y
         J6AWh0OSDJciGEk9QAMlbLK5v1puddPek/lG+qBzF8EMTGH7wsbOdAO5ZyCq61d/bD3N
         cKp4nujxNNmGrIjl4A7T1pnzn/ff/qyalxFmIZ6jJRIMeW/zivLTjvKRHLkzEjqsteOo
         YfUBnISiFjIgnU51cWdiO+rIW6SyJMuxyTNnbxpNl9aDXzxsT0zujUQYJRAntN1fXiGr
         2QQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=gnv/lmwiTEDbVHmPQlK0Tde9lj1bw8BHm/f8YlCwMKg=;
        b=KsV4CvZNKpjcLVtFei40C0fq4RRrDRwCo47v30ywNsgrC+uWPARWK6mgrNupCBLwgE
         iEl2ZC5FF2aTI83dBrxrUORfqP/HU2mJdXvko7ljQ/LdRJofY272nZ0Fzh2fsTwrlBwX
         oIjPBBPo/jbzPt8JLhOeGhpjR4NJQBM8g9KT9gPuY4jkayxC99Tjs76b/oMPiw9A31/8
         Ke24zTyGmw07GzXm77uEoIk3+o18eE/6Pyw3vaPIHXShvlJHiwx9Dc6B4ig/glY6+TVu
         ObHxOHZuspB1R0g32B9GtgD7x7HsKs8Elgl0iSLMFxFFftACpeTSQbebA36zKA6WEMJD
         eqew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b83si1078764ywb.306.2019.02.14.01.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 01:29:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:44224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guDKc-0001uc-Ri
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 04:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDKC-0001pS-Ac
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 04:28:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDGf-0003lg-Fo
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 04:25:18 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49665)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDGe-0003hs-Fj; Thu, 14 Feb 2019 04:25:16 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MpUMc-1hQD1K10aC-00pwuU; Thu, 14 Feb 2019 10:25:14 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190212074840.13542-1-richard.henderson@linaro.org>
	<20190212074840.13542-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <eea1959f-5cac-515e-1d1b-eae2c66ffe55@vivier.eu>
Date: Thu, 14 Feb 2019 10:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212074840.13542-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZieJVe8WtGb6HYB+OMjc2nbRL+r2UXM38Ym95GUNbPsTB32ipXf
	vpcCv6sxzO0dkEj5quAh2fdOPLglKJm30BDkLoEfwBCEE7QDVtc32rR7XIqApwuzFN7u+XF
	ivlesehxNC4Pq0htKq7aCBRnY3d63ozf7qZqnY1wN82y2cFcUgwJo7YSdv5lQGwTm+NUNc4
	w2dqhoDHjaG0Z/zsKC95w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iianBMudAXY=:h2cipnI8CIYJkdpumqltqS
	7ZWFrdkJyaCLzqbZVLywZX31B9rohgt6XnYN0QUhccc2rzTTGv0WVlcGlrC6KIxDxfQlcYfWU
	Ldt7yh8NGUAF4GAExhaaZWusuLWpialTpaNWjjm6jgUaFkOh0TVFQufgRIPaET1v7/mh++NAK
	OJL0AGUKAQTdK5iIG5qmxSt5BhNn/TVA4xk5KrxN8Mx67pIiwfOV9ugNxkFFg7KuHORRH8+Oe
	WCqrIjcuqVPETMvvbcjmG2GSpYAgJX4JI8p7gEd8Gac7wRgFWXf4TlO8Xm/VJkoJoYbEGFS1B
	XN2H9DnQ8slEJMnryVx9+eTIK0c3Xij8yb3uhW6lqrEPMeqbl5NfFskcl+ypntayLeUnR6LtO
	TybTGhpx3zI6a2S1aB/kOP06w6zWNqHPJQVWrG7byPw15iBfEey4vg6Ui3lPTE4lWWq+4GBIQ
	jibXvHyjUy7SlCduqiXALthYZAgoi2/UD4Mb1V1Qa80qZ5ehaqzmmbI3eF2B2f/W0zLkKq8OH
	Tk0MQxfSo5yDzP7Qdj/dCI5Q0tZIYDcdsRO/JAiICIyZN2VK8LD9qEKFmA9rvnqhPKwEXhHlL
	KQsdLnuA5KIeseGxDjt3tVRI+HXKAxNEsQsY01mN1SaLGsETymAJaTGl2L3OkSkacKLjI8pUa
	zI5mmoB9KjLG+hBcB94aK/6OhpnJqdzZ0/2AVNoZV96cHnL+5iFt6Fg1+YGwboUd1b+mPO1PQ
	PcOBfdpfBn/N4tTyzsDvcu+fgwCJip+ztgBNDcDpkna0sEqbIKjd6yIt5Gg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] linux-user: Fix
 ELF_PLATFORM for aarch64_be-linux-user
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HH71nOG6omHs

On 12/02/2019 08:48, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index d796d51ec6..5aa0628ae9 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -537,7 +537,11 @@ static const char *get_elf_platform(void)
>  
>  #define ELF_ARCH        EM_AARCH64
>  #define ELF_CLASS       ELFCLASS64
> -#define ELF_PLATFORM    "aarch64"
> +#ifdef TARGET_WORDS_BIGENDIAN
> +# define ELF_PLATFORM    "aarch64_be"
> +#else
> +# define ELF_PLATFORM    "aarch64"
> +#endif
>  
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> 

Applied to my linux-user branch.

Thanks,
Laurent
