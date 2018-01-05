Received: by 10.28.173.206 with SMTP id w197csp657434wme;
        Fri, 5 Jan 2018 04:34:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBouHUdpKnQpdrdyFGNVhxRAq6tN4chlE1aGPq+SLNPv0u6DUugY0L46ZChm3r05qDAznMYai
X-Received: by 10.37.212.208 with SMTP id m199mr2662854ybf.7.1515155697731;
        Fri, 05 Jan 2018 04:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515155697; cv=none;
        d=google.com; s=arc-20160816;
        b=z8a1VmXOZae6dY7YYeN3KOcLCzVn3uuj5Vhf3lBsaJAqRn4y/uDgsoYUEyJX13Ahwu
         3pp0Fewt2KW5W5XZn/wBn6kP6Ne24oZAceNjH5NjGIagYpdoAiPTs3M4TxoVUXbHvPVH
         tCbhjBmIsdja/DR/vZ0oDovpI6EauNtlSEVI6OY+jc7bFiMCQIYi0AZUMo+q8uGCTFEe
         bocJNXCVbmTzp1SMCuB7462vjbkr9vg7TwHkdsVq4H3e4osEUAM0y7Ignj+38wwJ6FrV
         Sjz5S7ObNm1FjTVIHIV6QQ0uEwdZFA/Y+vBqIrYXSVtavrsVDC118kUPNJxlAnZTT9Uz
         pSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Dsh8X+LHraTl8XKUu+HDCYmtOl70jXbVmzFDu5Bl/G0=;
        b=fTLiczxJX+1U20sATUG3rCNq9VqHeq+W1CeZHrvCZLqztnm188uGLawWtzBHENK2LL
         2lXoE8iixLiQ1DyXjl1TS/j2PREuudaHjA/DT2GhtcvVGTq+n6+osdP+tjwE8Zl5hr7/
         AfeW5cc6CA+VhCdWbqlwx8s9kFwuNYszCK/l7sYXxkQy3ASkNccSacrWvf2iXIMqORkO
         bmgMCAXnkiTMMT1JUw2nRWThbjOtxAWY7U2y/8oVLmxdErMShM8KDhXCQ4NwigFAeYvu
         /bvUShp5/fANlbUjUhLQd1GxByWeYGsz941v6rAn0YqnfvvUHf7BFxkQB8Ad6HbXY+K2
         aQOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E1KePu8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si1189054ywf.102.2018.01.05.04.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 04:34:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E1KePu8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXRD7-0007Yy-7O
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 07:34:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eXRCu-0007Yo-Ej
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 07:34:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eXRCr-0007Ci-B8
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 07:34:44 -0500
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:44572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eXRCr-0007Bw-6L; Fri, 05 Jan 2018 07:34:41 -0500
Received: by mail-qt0-x22a.google.com with SMTP id m59so5503056qte.11;
	Fri, 05 Jan 2018 04:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Dsh8X+LHraTl8XKUu+HDCYmtOl70jXbVmzFDu5Bl/G0=;
	b=E1KePu8ine7fqKJwn1Zietxh97UWLpHuWy/t3VpYg8q0oV6taLEr1JhDAOb6gqqKux
	RUddhOeopxNrUaAN4VLUNHNMcIp6W+44S9HyoDH0r7qSjDTPDySfACsulS5WPLNgKfsP
	ejr32DCqiKlpleHTa7fmpdFZ1gzaPWXFiGqvOPVoOjpTsG0W72knO/gAY18jy15QIX56
	WaAp7ca8eIhlocgcVNvutJ70BGO+Vp9rNgo/8TTzWiZbdH8pB/ZF26Iw5OFAnLBdf2P7
	UFabEXPGog9666fH6zqgdRUp4nCS1sc6fjAj+U2m/1C4lryh5j7UzosxR1fVhoSDtbic
	bOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Dsh8X+LHraTl8XKUu+HDCYmtOl70jXbVmzFDu5Bl/G0=;
	b=fd1LbQ67Z07X1+T8pTIGjq6HjuaDZPR4YMTQYo2Nq5faUpbTW10gRa0SpvHDqMrfzo
	+JqgyI0NuB/cCHGORP48vsy299AVfFXUsqaTqjAAGMXdEI4ROjVPn0h4/KAyoH2ljskv
	JM3wpgeGRhnt+yYXI0VUwzcMZZN7N6RohUu/Lawl6RMv7mooZpDc+mqYvV5cjLWxVXHg
	8by4Uwpk9fzeuzotQCNylVL7jXbHTTOQNmQcpqxyMrzyIpk0KampiT0/A1GrOE9pqDAs
	tEZi/FQvlgx2NB7v3wDjG1jHlvxRwjA3jEu3g4O6zxQoS/qMyL/RpbFXNd/K0x7C+jVV
	Tvig==
X-Gm-Message-State: AKwxytfvGrg5Nq1Oc+7a1MOuix8YlxroG74RzlaKz9ssb4bY8FAnedfx
	/k37sBJjp+AxGWHmvE8TF6npPQRf
X-Received: by 10.237.42.66 with SMTP id k2mr4048317qtf.283.1515155680283;
	Fri, 05 Jan 2018 04:34:40 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	d123sm3616712qkf.67.2018.01.05.04.34.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jan 2018 04:34:39 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5ffb2419-86a9-6954-0e35-31da0cc97d61@amsat.org>
Date: Fri, 5 Jan 2018 09:34:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180103162400.10396-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/sd/milkymist-memcard: use
 qemu_log_mask()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JN7dXcyYKG8e

I'm too comfortable with the 'log' trace backend and again forgot to add
the "qemu/log.h" dependency ...

/home/travis/build/philmd/qemu/hw/sd/milkymist-memcard.c:141:17: error:
implicit declaration of function ‘qemu_log_mask’
[-Werror=implicit-function-declaration]
                 qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
                 ^
hw/sd/milkymist-memcard.c:141:31: error: ‘LOG_GUEST_ERROR’ undeclared
(first use in this function)
                 qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
                               ^
hw/sd/milkymist-memcard.c:166:23: error: ‘LOG_UNIMP’ undeclared (first
use in this function)
         qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
                       ^

On 01/03/2018 01:23 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/milkymist-memcard.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 4008c81002..5de3e00e2f 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -26,7 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
> -#include "qemu/error-report.h"
> +#include "include/qapi/error.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "hw/sd/sd.h"
> @@ -138,8 +138,8 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
>          } else {
>              r = s->response[s->response_read_ptr++];
>              if (s->response_read_ptr > s->response_len) {
> -                error_report("milkymist_memcard: "
> -                        "read more cmd bytes than available. Clipping.");
> +                qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
> +                              "read more cmd bytes than available. Clipping.");
>                  s->response_read_ptr = 0;
>              }
>          }
> @@ -163,8 +163,9 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
>          break;
>  
>      default:
> -        error_report("milkymist_memcard: read access to unknown register 0x"
> -                TARGET_FMT_plx, addr << 2);
> +        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
> +                      "read access to unknown register 0x%" HWADDR_PRIx "\n",
> +                      addr << 2);
>          break;
>      }
>  
> @@ -220,8 +221,9 @@ static void memcard_write(void *opaque, hwaddr addr, uint64_t value,
>          break;
>  
>      default:
> -        error_report("milkymist_memcard: write access to unknown register 0x"
> -                TARGET_FMT_plx, addr << 2);
> +        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
> +                      "write access to unknown register 0x%" HWADDR_PRIx " "
> +                      "(value 0x%" PRIx64 ")\n", addr << 2, value);
>          break;
>      }
>  }
> 
