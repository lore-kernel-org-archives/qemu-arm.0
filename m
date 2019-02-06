Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6033791wrt;
        Wed, 6 Feb 2019 06:57:38 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYIUmZ8laBGwtTqjM61hJ6t1lMCrYCWBRynmLJJmuVPHjTYy8bAuS1TgKhhb4T7Oquat1iT
X-Received: by 2002:a81:1491:: with SMTP id 139mr8937681ywu.476.1549465057926;
        Wed, 06 Feb 2019 06:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549465057; cv=none;
        d=google.com; s=arc-20160816;
        b=dlxCY5BFtz37aPVKMTX0BrPqfmUP5gL8rPBkuwXAdzlRkZm3EZvnW8Wydk2WShVYMg
         iT6YmLKbu8HusZdCxUpnQ83guJGfDUi7GQ5kVH/b0B8oFZg6URSUNLUq5RdHTwMAdhyk
         b8SwMkxSoX+t8Pxe1DFy2U00xRxD7Td3NLRAR46jiBxMIlFtygHJKeGVGBhzAoM38kSN
         EiYQBvIBLHiHP7DDonp6ykjDl8pyYksgNGq5qV3OdyxmTVeXsho/6elWgC22txVnSCbr
         3BK8bJmRNUq/g6RIqaSEs0e6Gk0zdfdj+rYoop4R1Z9dFTC101wlHhkYffvYDJaT1Gs/
         Mkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=uuChI0H2tl0c2EEfAwIZhKCXYJ82T74i+SnLzS7VeGQ=;
        b=OEnBWv094AXHsakqNQ8ieNaGzd/4tAHIlYMJ3hVM4woOxtUr/9VE6fAvkTk09vGI8s
         GXjIdAjDH/+8aXkupz6Elmg28DGKKZZ9iCsQNAdJ4GSMn09d/ESjN32NrNKlQhy0uyAV
         YaDbdjF8Tz5mNHTN2wDPslDVAgKZdFMgL2fd+x57R7C8h182ktjyLIGIEs9id+qg6yii
         iXOhJbxeyqU7zQ2SeoW6vX9rdc7MYdGZdzgH5Qy+7rcUyfpDiotNy45N3g77Z4TiJ3XE
         BQlA7GJPQeEtChPSmVUukuO9UkZYyD/B806RiKpRa9aN+isk24Tn2HjPE9fogCgcv4zH
         ijUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l64si260227ywg.157.2019.02.06.06.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 06:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grOdt-0006YW-C7
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 09:57:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOdh-0006XF-DC
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 09:57:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOdg-0007jr-Hj
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 09:57:25 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45703)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOdg-0007j4-8s; Wed, 06 Feb 2019 09:57:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MmkjY-1hZlkG0W0c-00jqlD; Wed, 06 Feb 2019 15:57:18 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190204204517.23698-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3448f4d1-da76-ef9c-bc87-dfab59a5415b@vivier.eu>
Date: Wed, 6 Feb 2019 15:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190204204517.23698-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BJN9v8qb0SYSLwyiIptj8SMggLtViFnuQH25pBc9l/e1Ncvc0HI
	3UadxJscLVEQknKmd+BLfqcdfJk0lQRFscAu4x/D5uHi8k7CWcEygNz1do5SMIkvOD/ProY
	0LTzV/CIeRV7bZrW0bvM3FQ9uLL7/8kjmbZGjM5YuwlD1fYukOe+tMwmSv49LIfANE3r3XI
	6KkpQx8dTmSh0yPjRYbFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xNoMlBwY4EU=:r1uLej0U62vpeJxbCWMeSQ
	qr5SvkDA2tSKpUJr9d8SXhXorXxs9o9OdQXdGBDmlGUvbPuY+b5viD5YKm27JyzE10i9FRgET
	IPlw4cqMFUCprdWcAxs9ULM3t6sdNPuBTRdNTp0hQ4AsVeUEZpjQ1UI/4Oe/AWbTk59zbffKJ
	P7kFOyaaLs9o/CdmoCDXvTnlRXtGq1VEpVPi8uC8SmNCSanz0E7Sg6WlcaM75a3dWFZ8DuYl+
	Kz07cKG4vryvwTYUMFvHrKfABuG44u8lLWeunXd7JOAeE8hTIx4RiKdqNcKyMh8fwkIiWk8LZ
	sKcsYnd8qdDhKOosxzI9h0eem1ke4C0zGDDXTCC5iwSg1OavOydBWhq37pzdxsjCu5cYADNOL
	EPKaTrjgv7j+ckB23S2MXirZYCv+uHjtZaOdAA3RK3MXgx4j/mIcLVdWxSSA7UT9hFMUj2cdW
	8kMIR2Cm79MXdlzgaOJEl2CNvl4vg1MDoCkgzTo6XFTfrA+DZvgM5q9crMfB84adkwYHtWRui
	o/pj7XUmaNeScb2Ke7KtPin8DjuBVjl0Mt1ooktxUJ3GFnON7aT2WOyfvy35QEUYNUUZ2k7ne
	Ing0GmKmpcg6+l2epsG1ZzoSoOd+uO5+mHnrFwjMUqziYAtd420SDmklQ6/NvO/KBUFRd5qH9
	Elm18jFLVCcKe+169ZwGuI/jTSyioQ5WMtEsrEof/1QF7stij5TMF2RIjraqsgkopXR1p9DA0
	gOnUjV7Q7JTEsAVjgtsTowq1/6gQt3xTARIEmvoYXlIkGUYujw3Vx/i3ruE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH] hw/input/tsc210x: Fix
 building with no verbosity
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jJDLkvOBk003

On 04/02/2019 21:45, Philippe Mathieu-Daudé wrote:
> When building with TSC_VERBOSE not defined, we get:
>       CC      arm-softmmu/hw/input/tsc210x.o
>     hw/input/tsc210x.c: In function ‘tsc2102_data_register_write’:
>     hw/input/tsc210x.c:554:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_control_register_write’:
>     hw/input/tsc210x.c:638:5: error: label at end of compound statement
>          bad_reg:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_audio_register_write’:
>     hw/input/tsc210x.c:766:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1
> 
> Fix this by replacing the culprit fprintf(stderr) calls by a more
> recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
> are left untouched.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/tsc210x.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
> index ded0db9351..2eb3cb9518 100644
> --- a/hw/input/tsc210x.c
> +++ b/hw/input/tsc210x.c
> @@ -552,10 +552,8 @@ static void tsc2102_data_register_write(
>          return;
>  
>      default:
> -#ifdef TSC_VERBOSE
> -        fprintf(stderr, "tsc2102_data_register_write: "
> -                        "no such register: 0x%02x\n", reg);
> -#endif
> +        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_data_register_write: "
> +                                       "no such register: 0x%02x\n", reg);
>      }
>  }
>  
> @@ -636,10 +634,8 @@ static void tsc2102_control_register_write(
>  
>      default:
>      bad_reg:
> -#ifdef TSC_VERBOSE
> -        fprintf(stderr, "tsc2102_control_register_write: "
> -                        "no such register: 0x%02x\n", reg);
> -#endif
> +        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_control_register_write: "
> +                                       "no such register: 0x%02x\n", reg);
>      }
>  }
>  
> @@ -764,10 +760,8 @@ static void tsc2102_audio_register_write(
>          return;
>  
>      default:
> -#ifdef TSC_VERBOSE
> -        fprintf(stderr, "tsc2102_audio_register_write: "
> -                        "no such register: 0x%02x\n", reg);
> -#endif
> +        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_audio_register_write: "
> +                                       "no such register: 0x%02x\n", reg);
>      }
>  }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
