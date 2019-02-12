Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp469157wrp;
        Tue, 12 Feb 2019 00:33:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib5d2XB0JkKWUYW13eLajNC8F/DWU95NXHQJ7YRDNwZo2Sx77vLPkeMjWfxZcnkOASgAGW1
X-Received: by 2002:a81:a691:: with SMTP id d139mr1948028ywh.278.1549960427568;
        Tue, 12 Feb 2019 00:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549960427; cv=none;
        d=google.com; s=arc-20160816;
        b=oIl6Z1jD8MyQZcJHMSLGiRR86QDYDPcfrCtlzWID6Hoi6YWAQfnWJerL85Ejeuxirt
         w6ReKnLJLJyyrYR0yYSMw8aVGCvLG/BsCbqpICUxRsFjhuUYMuB6ZOvBbxojPzUN2JQb
         xjtTt4VQkeKuOqp/yuSrYAkVeq3eBOuj+lHBa8HG2GGSWf/9jwLnALYdqOK9Y3nsqW1O
         QSWcwMxyobplrGyl4s0ccsJgqTGfqZgxdch9mVnJUoCWbiDosSu5ZYSSXHaL1hrApHOI
         ySlRd6CqsNt/33tSM41H0xzYXRO1s7ugMpEPvtUH/+GyO6l6eXicwsYMR4H7VPxlbYHE
         e6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=Vyt20LN/GUAhHXaYWXpRwMi6N15hownW9KX6XVthY0E=;
        b=eqNlhpszPT8YKjYazA1wXtvw8ZVGgigSNiodzRvLek3b6R9GCbd/rVtrgv3gNgb2C2
         kE0MLmWgzclvc8AeXVX9HfauqQyyCSZrAe1Es3fLZ9vlSzSVx90aZsm6FkM9zXY42gaI
         0TaUMBaTW3BvGpc+av9aM9dhTqTbcuDCv1hEcUwHYiPwmVw8kll1SP3fRTP5VSaIs65L
         LY769xKvzetl2Rc7TT2vQTOEgJ+qpRyNEuNmJ3jDmh+zH1haK0Os+khtnsaZWVZOxwYV
         M4aGPYT1/Kr9OZBf+Rzh7/cLgPfQWEgzNuHRF5wY2NKOaw71O9Y7ln3bWvxTAr8evnP0
         ZKfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r132si2657942ywb.210.2019.02.12.00.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 00:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtTVj-00047K-0s
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 03:33:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gtTUu-0003cP-Rj
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 03:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gtTTn-0003X3-Ra
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 03:31:51 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34487)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gtTTa-0003EJ-AQ; Tue, 12 Feb 2019 03:31:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MMGVE-1gcUYO3VvK-00JHD3; Tue, 12 Feb 2019 09:31:23 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190212074840.13542-1-richard.henderson@linaro.org>
	<20190212074840.13542-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <dc08d748-eb29-ccb1-ae1b-62b7ad0d6ffd@vivier.eu>
Date: Tue, 12 Feb 2019 09:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212074840.13542-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:R8T41xf+nx9S7dev5mnnXbmHizWzRvn4+E/BLILmBo7gajwEBAl
	tW+Lvb1opei9m7DYnd/cflE6LLCJSbyA5z9A5LXUhnzx9SW8fKrOtvh2vO5CjxUBLqKh30N
	W6kO1HKITyrqi1xR/d04rCid7w3oW+q5Ep2nhcY2jiTrl4jTDK8EsgOmxHfgvYkl0xHS0fO
	g+ZEbAYagXNekUJ8kt7+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ee1Nt+QpjjA=:huVsXm1wItAxWL7/eOLOpG
	Up0+58k8jjN6HY/1Q+6vEcO/YC/OKJFNx0gTVyoBvyhi68yx5m80PdMY08PVyAxStbYxBm8aj
	wmMlSps0XjkbFncfwcU1GJclSxtXQI7pfH8napnJuyc16RUe68dGTf4NZKa+eX89y7WCXeDGC
	Ank21CFpszTpFdMgcHKXH0sIMWJFcXmZoBWHjN2eyrmqA5E00gp8/b90mqQ3ww0G5WvRMDw68
	0AeGd2LtS/daWX6VPypBItGSIFAA8deAH0aFjHgy6lju8RTald2E1vA19MJCucNeLFEC6q54v
	97bB6XgBzo05buHV5ba1vmStqJNqNWqsba0clIvVazVqJz6eYCKv4p8ukEUAtH3HSn5qAusth
	hquyJyou4rdT6Ky8V4CwAXESHTlH5gCl6uQQwfkLgFzEVT5BNdX7GXdyqM201oKBJHVvSdyrL
	yhlax0TmftVGfTO97afQq/R0nYv9hcLw3QPpBdejhkQkBLixfC1os4AlyfFr84C6OimMfrsF/
	d1RPMPBzsw6WY/i5vVllEK6ueSo5Vy7JI0+l2hYukmhk1KEo5xWg4pGXhTc2cRMtX2kgp4e7p
	cIe9EZuSHNhjAZTV7qwJEYgB/NsoBb+oJdywyaPJBuybfU4+Owx8+9luHPD/oamQ9VolpTRNE
	Pq5koqGTlXMExD1nviHR7TTobMA2QqyqVQL0zLU3t/eKgj+oSqmx86vyxk15A0arTLNdcOvMt
	lOfislq+W81FgWi0I06TSmDDhN4MYjcxEVLwIsXhhEn5Fpyj5oFp2Yi+PsQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-arm] [PATCH v2 1/2] linux-user: Add ELF_PLATFORM for arm
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
X-TUID: z/bCJx4kTixH

On 12/02/2019 08:48, Richard Henderson wrote:
> The 32-bit kernel has strings for v4, v5, v6, v7, v7m.
> The 64-bit kernel, in compat mode, has strings for v8.
> 
> Fixes: https://bugs.launchpad.net/bugs/1813034
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Include v8.
> ---
>  linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 775a36ccdd..d796d51ec6 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -500,6 +500,37 @@ static uint32_t get_elf_hwcap2(void)
>  #undef GET_FEATURE
>  #undef GET_FEATURE_ID
>  
> +#define ELF_PLATFORM get_elf_platform()
> +
> +static const char *get_elf_platform(void)
> +{
> +    CPUARMState *env = thread_cpu->env_ptr;
> +
> +#ifdef TARGET_WORDS_BIGENDIAN
> +# define END  "b"
> +#else
> +# define END  "l"
> +#endif
> +
> +    if (arm_feature(env, ARM_FEATURE_V8)) {
> +        return "v8" END;
> +    } else if (arm_feature(env, ARM_FEATURE_V7)) {
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            return "v7m" END;
> +        } else {
> +            return "v7" END;
> +        }
> +    } else if (arm_feature(env, ARM_FEATURE_V6)) {
> +        return "v6" END;
> +    } else if (arm_feature(env, ARM_FEATURE_V5)) {
> +        return "v5" END;
> +    } else {
> +        return "v4" END;
> +    }

I know nothing about ARM, but in kernel we have also a "v5t"
(cpu_elf_name) and in QEMU we have a ARM_FEATURE_V4T which is set with
ARM_FEATURE_V5. Is it related?

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent



