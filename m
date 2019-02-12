Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp469969wrp;
        Tue, 12 Feb 2019 00:34:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IatTHmsLANdtmEw/S6ctKdE8UlTEZN1kUBIlk95WNvo5L2EjeRNuCy00iin9MxQILdhAeOV
X-Received: by 2002:a25:6110:: with SMTP id v16mr2001889ybb.4.1549960497583;
        Tue, 12 Feb 2019 00:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549960497; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz5xKHtNrDa0rpoUUxmVoFywSU411TFTGtQUohuL4fa8zLD33l2ufYDiq9s9mLJctA
         RcNYHZ8Go3FpveRc0yCNgAAcIBhmlX6sfIBnrqdTJOf3mfjNVTekg8y1y8nzls8s7ycr
         Zt35yXRHW6oBmdGvNKftry1MRTtWZ7LddgQVhFu3JxCkQcABpGuhJIr2euEfW7HlrO5c
         pIFWepp2WkRIuAvSCC9IdjExZ51ykq9yypacH00o8S1yz+IHgQ0nK9IYZEdVkh7tkfPc
         VtaZ8AS3ER4AlUszyRBe4MQ3nZVazucxHKBjJ35Lt8hr4dk64Zhm4fvC97kdWS/q1733
         rFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=R4aqvxAwFEyV6dk+dyS884LYxDDwWllej+8pPWrZm0w=;
        b=L/ztlkmVizEZh1u3yCM3AwQMzyLuwapK+yCHP3d+G6UtA8gCCk+JsKIaNQSdgKk77n
         WWsHNdbd+ysxSpz21Gk3gOSmnekaYPuyj7uVvE3re1ZEaJQaPiddRRZDJ0yqNBcRfyX4
         wdSzfiydbtlOFKS3wXygZqzSRs7a59VfxTJo6xTvMlBK5ZXOzfLcsklhfJePpXujrIhG
         SopjJheALDBN/vD/wGhGCHOu7eMOh7kOsKz6mGrYFxsr2Sjafds8O7smPza1B+DK6ln3
         AjFG4zJP0aHIjTSuICdMY8tznSbQUDrbMrNj7EhsQZbUM549VYM8zidtw1ZY3wkx3BVY
         IoCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si617396ybk.264.2019.02.12.00.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 00:34:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtTWr-0004mt-2u
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 03:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gtTUy-0003gk-B0
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 03:33:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gtTPc-0007eH-Un
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 03:27:34 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52211)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gtTPW-0007Ss-8M; Tue, 12 Feb 2019 03:27:22 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MREqy-1ghSq70fi8-00N86F; Tue, 12 Feb 2019 09:27:15 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190212074840.13542-1-richard.henderson@linaro.org>
	<20190212074840.13542-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <6de87786-3e4e-0d83-3699-ea073fa7bd7d@vivier.eu>
Date: Tue, 12 Feb 2019 09:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212074840.13542-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:m8VaLEbtclgyf58MZSm6KUBsWB6jCNm8L0fBDO3rDirMusat5cb
	2q1wA6ghFIdHrhaOEu8Bo80e6gMIC6QSlJ9ibvKJ/D7d8ZTm43+VurclHN6gEAJWAg8dT3b
	rFqww0gj90CmA4Uo1OOLveH4DR4/Q9fX1rTffRS5L0vTcZQ5Joqn4NMRVtipmNuNS/Y/YWW
	uqjEnBTqiX37o2GHSk2cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:40bM/LCFi64=:mNgcFzk0tDUa/91Lark2mU
	tVFXNm/cMGZGOW69M1E5+qrEwMdsn2iveUW0r+zkR8o0htMcu5QnO7C0QDLQdrck4MeSJVdKt
	/RKIqE7x+277mt2dEcLIVqkd4FSZ+mljE3VuABOZ4vJLVq41L2yuy82c3EC2dP3MlVIGAX7bc
	WOWjbX6jNVg/Ny8Bn5pfOFXnZ2RnURJ0AEO3jIx0OWnhLhduAJvHulUzlwIiBUGmsxRQIMS8s
	dlroPNYw4CRlfYOcTIp0ZdTMpklwT5/o8E4gbiD/HxjM/EgyA581mYvrODnOp9gTHRj7rdImC
	2l/7f/bYRzmMZyTYyz+H0KfjqKjGc56gXQn9yUtvK/hGw40SkxrAr4WGIplWsGDSr56y1/0k3
	zz7f+zgz76E3mt1FDhPnEA08W2NYQ+e+bGRmv6n4Ke8BO8UMS3H1G+zHtBpdaSD9rhBdE5+z/
	nyHzb22CZXZ1JLRfP+vcx1rkeji7dZCYdMY3r4Fc2sjDPLWbJxenTMcMlUU5wCMUQrTS+Rx0i
	cPjf9AGW4HSAANuDpobkmULW4RcoXZKGI+0tEGBtdeHVq29UUImfP+AAYELfqa89yV+iaKiLP
	E67umGlu19StCOxJ82QovkvmEWrG5nSQDOfHRLxTLvTxNHLFhMP7P1H4uFQmTmcif9S734KsI
	J6xcKPs/SgFnSx4c1FdVkeFiaXKvVNq/9yrsSNG3cVxXcrS0Qb6rm2gRjuzfr0VXuruSGwExU
	tqg0ZGJ/29Krl7UvbSplNXIlFO47YcWBICZbj3oKDoWmBKkZN+UoziGa1oc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-devel] [PATCH v2 2/2] linux-user: Fix ELF_PLATFORM for
 aarch64_be-linux-user
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLkHf+p5EGxB

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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

