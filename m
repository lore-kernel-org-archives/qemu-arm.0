Received: by 10.25.0.198 with SMTP id 189csp1048078lfa;
        Sun, 7 May 2017 11:17:50 -0700 (PDT)
X-Received: by 10.55.80.194 with SMTP id e185mr4947024qkb.128.1494181070419;
        Sun, 07 May 2017 11:17:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si10033330qkd.110.2017.05.07.11.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 11:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7Qkf-0000ZU-Rp
	for alex.bennee@linaro.org; Sun, 07 May 2017 14:17:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7Qj7-0007iR-Jc
	for qemu-devel@nongnu.org; Sun, 07 May 2017 14:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7Qj4-00078V-Fo
	for qemu-devel@nongnu.org; Sun, 07 May 2017 14:16:13 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7Qj4-00078J-BZ; Sun, 07 May 2017 14:16:10 -0400
Received: by mail-qk0-x243.google.com with SMTP id o85so7412470qkh.0;
	Sun, 07 May 2017 11:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ID6aB4Q+7VKbLEu/URlpbod50EZfAEia3ZQxpfhSlmw=;
	b=u2ee5F0Cp92XOHofBbReZy1NVxK6qa5B0v4Z9kYOQJRXbUyLZmvZIWdsMrXRV5DOh6
	M9b8szzkzv4g3iVYSnBu/RGSjyQ6xh6DGBtJfwd3sPU8YA+30fYwk27NGgOJ36kk5LH1
	b2Ie7tT7c0qdMu4kA1phZXajAsrt9Y6f2i9bgULIvOD/6ianRJt3dJttssMH2yH0hGZ/
	aEyNMJAeUlPGvJI+uZ5LsR2Li2RYraOWkfTNgsYjdJqIavPsriFZEmqjMiMLGDLqCvla
	IPEVvWwMGxrosamNnC+47qOrwJtvc8tfr9cKJWsbJxzonThZRxCp/BukpXN6eskg/mfF
	aVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ID6aB4Q+7VKbLEu/URlpbod50EZfAEia3ZQxpfhSlmw=;
	b=qN8X3AEgCJGD8KfpReY2QAZ2OFHIFOfkxb6pke/wNsG3UVTbZ9uLtAj9U2ycDh/5rK
	gXWF41yG8ZiX0COraOY2fZFio0EOlGUzTr/bdyqQqHm1/I5FC9PIEQeaHBFg3cYDwyQW
	qCEVOnvkl5S+Jqa7P0jcaiSSyGMdaaINwBOS0bxp06xrt3zRhxusnyOzMoZIVZbjJcJv
	pJCiAto1F2VNxyHYbceJ9MOq1TmAVhAb1/R6DEj28788un3Lk3LqWml8i8qhQfVcvK49
	Iwm+17LMv4nMvU2LYVCjZn+XTnPw8jWOb8CizKJ9TG5ywmO2bSoVALrIyhA0cC0WqKI0
	UmQA==
X-Gm-Message-State: AN3rC/6I3lTQLRgVn/+2uGKt9L9+QyAXMcuBt1acqk7fXXR2xjc13ft6
	zQLe9aERK0FYqw==
X-Received: by 10.55.119.5 with SMTP id s5mr21967968qkc.32.1494180969555;
	Sun, 07 May 2017 11:16:09 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z63sm7823988qkc.6.2017.05.07.11.16.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 May 2017 11:16:08 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170507113540.8687-1-krzk@kernel.org>
	<20170507113540.8687-2-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <49ff1573-a503-e9f8-d1be-c346290f1eb9@amsat.org>
Date: Sun, 7 May 2017 15:16:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170507113540.8687-2-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Use type
 define instead of hard-coded a9mpcore_priv string
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HL0PqKs6lrc

On 05/07/2017 08:35 AM, Krzysztof Kozlowski wrote:
> Use a define for a9mpcore_priv device type name instead of hard-coded
> string.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/exynos4210.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 034fc8be9d76..a9e221c5b7fe 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -26,6 +26,7 @@
>  #include "qemu-common.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
> +#include "hw/cpu/a9mpcore.h"
>  #include "hw/boards.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
> @@ -212,7 +213,7 @@ static void exynos4210_init(Object *obj)
>      }
>
>      /* Private memory region and Internal GIC */
> -    dev = qdev_create(NULL, "a9mpcore_priv");
> +    dev = qdev_create(NULL, TYPE_A9MPCORE_PRIV);
>      qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
>      qdev_init_nofail(dev);
>      busdev = SYS_BUS_DEVICE(dev);
>
