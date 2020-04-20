Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3492713lfm;
        Sun, 19 Apr 2020 23:48:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypK67bCk6fxWGXKRnmJmasZXADwnsAnYtAPTlH1Xw+ion+5JeQj5ihArsrvX4xajOeg38RX4
X-Received: by 2002:ac8:514d:: with SMTP id h13mr14916935qtn.226.1587365309738;
        Sun, 19 Apr 2020 23:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587365309; cv=none;
        d=google.com; s=arc-20160816;
        b=oLjEf/SSEAdFTjyJtqjWgLNre9w3YmA8T+aC1G8cdCWtfOUjJJEbELW6QvRnj5CujX
         JLyt7ifg5IwuVQ+rRFB8RZ+ZeWk0jwOWsOlJoV9SX7RKZhAz8mEItggt3F/i2kjbIp/B
         2YbT9UxrL/yM4X+6v/NSmfcOSlpfCKOFC1IugfaVmZsxyEdXwawfwyMjTVmOtgbLjByS
         /eHbREgn/CgKd1x1/UkyDLAgqrv8mEHJHjp+SC6h8t8FQhZrHMTz0zkVHgro/EyIHm6I
         8MUTekgVam0mDYaTJKfU+8HQXtLugskcAwDAYwDkQ//7QzZNOBh6jH0IoXI5nZA6Ngo1
         IoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=Y+elNH9UOqsLoxVoBcJ1OsX/EFngxxl6oFsmcqeECEs=;
        b=AfDoLfA7zMbtm2VYeKA0azStewblrby3tGKH0EhOiYo01EHELa/3VLSvirU2tb4RXd
         CRfc7vqtTaHuPOfkAzc7EHxypAjgvMFqxAyMjKIg3IOi8DxKJJnY9iJV87YQIz4p1vg/
         2Aj2N4lufuwpS+GpIeFXd/o3s4Xq3kTjao5bdqgVGkBzjkTIoM+tW8Lm6kOJkbggJyNC
         KBA0CLFMGmAQU7u8BiYLeYGHcfzyvpeKk1UJtJ8/iMWB6lx4WP7eQF/8nXYWTDgH0Wme
         JrrS1+FYxPKfLjCNysOX02aHudof0RoTk5ydCoHpsmr+OhoHyukolJu6sYn5CUzFl9rw
         ZQhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LZbTr2ip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si66466qkk.246.2020.04.19.23.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 23:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LZbTr2ip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQQEH-0000po-42
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 02:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQQDr-0000pL-7M
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 02:48:03 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQQDq-0004Ae-MM
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 02:48:02 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:39497)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQQDq-00046a-8v; Mon, 20 Apr 2020 02:48:02 -0400
Received: by mail-ed1-x543.google.com with SMTP id k22so2144741eds.6;
 Sun, 19 Apr 2020 23:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y+elNH9UOqsLoxVoBcJ1OsX/EFngxxl6oFsmcqeECEs=;
 b=LZbTr2ip8DIvBjvk72+37eOITUkmmatZOQ+Eo4qS36ZfYu6fDsayrsL2umHpMu4TuR
 P6OtxhF9pvWlgK2a8mPobEa1CYRrg5imlWKE/tObSDU6TyGZuvtMzVK9w3L+N49WKH1H
 nvEpCiZM9I0pKB1oXRfgbwbvbHdllY3GoJaEiudwswythgsk1PRnrAgppH0HzR7wMm4I
 TER6ZJ+eCkd0GVqpq25BrTNXH/Egz5N6XL6gTPI2h12E1Jrmdq+wjuk3GR3soiy1XNtd
 TjWmjgzu/EMW6U4i0ksm6Kq0Yrme1Z9lep0A5icVh5YFJlM5RMchsZag69elIPyo0KP6
 qQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y+elNH9UOqsLoxVoBcJ1OsX/EFngxxl6oFsmcqeECEs=;
 b=KjM5CfaxiP+6u7ap2jswOCXoFTS49etZx4kTRykaQz4QhjMUm+eKKOUDos8rCsz0ya
 n0600rrCRRqSW2CZpJLPSDTkalcIDNLNV/hJP46U91FZ4qUQXDUQmGH26qtIMEl4m2mW
 eQxt+U/moNrkOA8+QUaSoi1gNhUEhxHr7f8u8bkfj5QWIIsH+hELkoeBZjxH49GQ/2Eg
 Hyz9wXcKBv5BOlck8TJsgq/U0mYeSaM60mBR7/vqsxVcT4Y2qP4EodFMUyBknIrf7J2l
 9Op2EyasQp0u2a2WFxlR0iGAdezor8RSWWqmtpR25AJQ5/EGv2EoSyPVviYkK3Lt3HKi
 U15Q==
X-Gm-Message-State: AGi0PuY/2VKbSk5k1PkA3Rh1txmWpnvrqk4S1aDJo0EA9F79AxqWwJHD
 4akhLw2h9pi6pgbMEEs1Ung=
X-Received: by 2002:a50:8a03:: with SMTP id i3mr12894910edi.121.1587365279762; 
 Sun, 19 Apr 2020 23:47:59 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f13sm23922ejd.2.2020.04.19.23.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 23:47:58 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] hw/arm: xlnx-zcu102: Move arm_boot_info into
 XlnxZCU102
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200419162727.19148-1-edgar.iglesias@gmail.com>
 <20200419162727.19148-3-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <0f4e47cd-d362-c79e-0522-7e6077c6640d@amsat.org>
Date: Mon, 20 Apr 2020 08:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200419162727.19148-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::543
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OAfS3nYB2Okk

On 4/19/20 6:27 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Move arm_boot_info into XlnxZCU102.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-zcu102.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index bd645ad818..4eb117c755 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -31,13 +31,14 @@ typedef struct XlnxZCU102 {
>  
>      bool secure;
>      bool virt;
> +
> +    struct arm_boot_info binfo;
>  } XlnxZCU102;
>  
>  #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
>  #define ZCU102_MACHINE(obj) \
>      OBJECT_CHECK(XlnxZCU102, (obj), TYPE_ZCU102_MACHINE)
>  
> -static struct arm_boot_info xlnx_zcu102_binfo;
>  
>  static bool zcu102_get_secure(Object *obj, Error **errp)
>  {
> @@ -166,9 +167,9 @@ static void xlnx_zcu102_init(MachineState *machine)
>  
>      /* TODO create and connect IDE devices for ide_drive_get() */
>  
> -    xlnx_zcu102_binfo.ram_size = ram_size;
> -    xlnx_zcu102_binfo.loader_start = 0;
> -    arm_load_kernel(s->soc.boot_cpu_ptr, machine, &xlnx_zcu102_binfo);
> +    s->binfo.ram_size = ram_size;
> +    s->binfo.loader_start = 0;
> +    arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
>  }
>  
>  static void xlnx_zcu102_machine_instance_init(Object *obj)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
