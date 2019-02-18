Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2755619wrx;
        Mon, 18 Feb 2019 14:19:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZdxjuxX5JJZ6enkqvmS2yPsPafzbCPNYHWS5ZjWz5WxSNG8qcOhv4XP1jQrZC8SD99VvGQ
X-Received: by 2002:a81:8d4d:: with SMTP id w13mr20619282ywj.152.1550528381305;
        Mon, 18 Feb 2019 14:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550528381; cv=none;
        d=google.com; s=arc-20160816;
        b=qVb1lXu5I/z5szqwu7tDZ1QJuZzLUw5mOgsVZm6OD6ARPa2twgNKhqOpQSlSdzGGoJ
         n/i848N61zNqbR00gaconr7yKqbOQ0+y5qkbod9VB57sMJLrgHjZUEnmdExEzetVLoJe
         bJk+sBsRSH3gJihUiUgn2sF6oMU8sJA5XwuDkgTz0Gn5ni11b3cNm41/WLQ1QruAVj+G
         AmUwmpUCrP27nxditOV+g3KenhjAYkdOOrRjLyTmOip+bl+MwmBdqQ/I7OmDfgGErGsp
         sQ/ZvfQOmDy69kNEhSiHVqQ+MGV/ToXl8PAqDxRGcir+uot9KQ6UzD1PhrvOfevUXOj4
         cN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=qqgudw7Qz5p/pXWeoZMU/IZY4nsx6A8ko64BxowX6GQ=;
        b=B/gKvFGt/DalPALM2bmMjeS5ZlN9/rKJ0NCQ5/eyR3GZqgPAYfqu3nPkPWGOQkryBY
         9au61tUpzpThD4mW25rMI7i3EgXcdea30BM9DNiW1rNnrJuh4uujacwBjXLY7oUojuys
         D5u2VkWVOXk0WKNzmYehL4I2tUeQAJbzgM8aoUQkEwoKsr7y7E1QWi7nkLXiQQSFJgF6
         ryIZro3XsVvhfK3m8n949j8K7EmVBNeFgQhIX0b25CIn04gL6OHKVf2TNgdhPemHpd03
         we+wGEwUqJvynkNvAK3QkoKxG/zCva/APM3+c5F67L6nfFrSnEd0gP1Ot+RXNIMN8l1e
         Mlkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si8760077ywi.7.2019.02.18.14.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 14:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvrGG-000131-KZ
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 17:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvrB7-0005eE-Rp
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 17:14:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvqxz-0006BL-Lr
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 17:00:48 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gvqxx-0005kK-5H
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 17:00:45 -0500
Received: by mail-wm1-f68.google.com with SMTP id x7so566995wmj.0
	for <qemu-arm@nongnu.org>; Mon, 18 Feb 2019 14:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qqgudw7Qz5p/pXWeoZMU/IZY4nsx6A8ko64BxowX6GQ=;
	b=Gi0lat4m98Lz2DYDtG7bgveGvTVO6fS31yb86senPxtUxQdsVVQiERk/54gPz/Ogcr
	ZsRdpIkHDE7UzGBia0FZEoKr2qfgY13Hn0ZhJKwbS3Yvc4Pvk7HzohL4Cw5AujGGmeaf
	oMDouWcgkaa0HcTKOH4/RxbtEuE6fxl2MQebzBuHT2go7VTOsVwa6bvHZtrLTm9RoHlh
	jaG2xCVeS+i1Ixr4qZT0lTTEKEjKxQIJGkv96kyF5X7jdTFfTrlrx0ZTCIIfTS7SKZFP
	Pfd3stDCQCwgM+JN+xdZFxQ0V3lT5uFzlF2t8rTmOHuquGQxBNRqDbry3ElHnMzF6eIk
	L8gg==
X-Gm-Message-State: AHQUAuYFTMdH3wCzNWiqS0W/xIGNNr3G6dSg5K3qOe/tL18gg/eBcT1o
	GOWnLE2LPqFCsL8THsCJQiAJJg==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr510551wmh.153.1550527226714;
	Mon, 18 Feb 2019 14:00:26 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109])
	by smtp.gmail.com with ESMTPSA id z8sm664239wmi.28.2019.02.18.14.00.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 14:00:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1d552313-760c-da28-056b-6e8c65ff1688@redhat.com>
Date: Mon, 18 Feb 2019 23:00:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/14] hw/char/pl011: Use '0x'
 prefix when logging hex numbers
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4EJVFjJAqM1

On 2/14/19 1:51 PM, Peter Maydell wrote:
> The pl011 logs when the guest makes a bad access. It prints
> the address offset in hex but confusingly omits the '0x'
> prefix; add it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/char/pl011.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 29f4e5eb224..e5dd448f854 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -143,7 +143,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
>          break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "pl011_read: Bad offset %x\n", (int)offset);
> +                      "pl011_read: Bad offset 0x%x\n", (int)offset);
>          r = 0;
>          break;
>      }
> @@ -232,7 +232,7 @@ static void pl011_write(void *opaque, hwaddr offset,
>          break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "pl011_write: Bad offset %x\n", (int)offset);
> +                      "pl011_write: Bad offset 0x%x\n", (int)offset);
>      }
>  }
>  
> 
