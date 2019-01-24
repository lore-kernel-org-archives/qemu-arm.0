Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1798567wrt;
        Thu, 24 Jan 2019 03:12:16 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6exo0IXX97oCc9LbbPQDvtsjDml/v4CX2HInttnhB0jT2dI9ELr5T02wQrQfQbBRc26pzL
X-Received: by 2002:a1c:d752:: with SMTP id o79mr2328742wmg.100.1548328336498;
        Thu, 24 Jan 2019 03:12:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548328336; cv=none;
        d=google.com; s=arc-20160816;
        b=uchHuU5NxqWPmGeJ2zgdKlh02/s3heiUqEsISU4flDNaww8xPRf4/LS41a5b8M96j/
         LeLQotk/42rT4k1xKIznDhOHdTNWyZqZmD/9G8dft41Vlv6aTajvGuNuL4YtLYUESPpL
         7eqQKUcHvNGIL4Qs+bTPEAZ21DWlcLWrsjZOLGs7tFVRZrx6h++hZCwurwGte2Ua0ucn
         82mk2P//fZf7Po0l1F9CVNhurUqb99FPV66XNd77pNYtV+HmxcFNNJtYiI/D8kanQ166
         MBeA+GnH2hY0g9q72MrUH4Ve5Jbbc34iBu77bJFIFIQiTQ1/CISYp8ByHDiLfIl9Rl7w
         xiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=YOOWgCxW67005RfdgrbMrQa229XiwjebbK0kWfkLOOU=;
        b=btaRA05ympc8GA6A4YmhSvIO4S+aMYlpq4cp0ua+XuzIT/A/WGj5qew70oTcDR8cq2
         BDhjQ1whHVNtMfC5sEjRknKQuvj9Z/ZZT4Hg8z5hAhPeEvDGOO51R95PJOsGHCGvzAu+
         ah82RPN7X2sK8IIQIn7xdGgb6H19OmCq5ah7PznGyoGNIwWyPn6LKI1f/fs+T8hU7IDn
         sN8eKDqQ9N+LIGLjW+vrsE3vAJBo0alkatlRA/JPMaFhjI8+H4pNI2Fuuy/MVAUNZWT0
         8NS6fk/QCV4mLXEG2whtylFLjIaNNZz9fhNm0G+9YssHO0/eUc6DUxnCN3FKsRPcrBqZ
         kIOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si36891165wmj.80.2019.01.24.03.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 03:12:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmcvf-0006Gs-FQ
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 06:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gmcvQ-0006FE-Iv
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 06:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gmcvO-0001oZ-L1
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 06:11:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gmcvO-0001mN-Cp
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 06:11:58 -0500
Received: by mail-wr1-f67.google.com with SMTP id r10so5979649wrs.10
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 03:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YOOWgCxW67005RfdgrbMrQa229XiwjebbK0kWfkLOOU=;
	b=mFt5bxTejiG6+V7IvHn+c+/UZ0wZb2aKn7HW0R3+dPiO5splkm9HbQS4cNI3GImOl1
	J30DdTI1awvr4npIziwzAT9UCpqaC9Dqgf+XxFBjkTmNSTZV7CsLu4PqdL7TNfI5e+dh
	SyT//blHFA7Kt6rC9bing9ngq+jMTXIXCvARQ0SW64e4QJcot4X3JFBQut8wYsgwkNSm
	5wLCSUFTyai7gSqp+m3FYRFD9Js2ndykHMZ5c/bdLsXCscpougB28iX8H+s9tSMw3m96
	MfqZYcZ95e8KUSw9nzHgQONeEvG+bCSREshrg+AJMLGQkWQjpt1m3pXVjbEQGXCLY6UH
	DvUw==
X-Gm-Message-State: AJcUukcDo0wcJLYfbfWnYH3wTunRfFfqT7nO/c4vTOvHk+p7XJ+0Jt4/
	/z+11k6vyNk2XfCROyih9sZg/Q==
X-Received: by 2002:adf:b608:: with SMTP id f8mr6592460wre.120.1548328317221; 
	Thu, 24 Jan 2019 03:11:57 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	k135sm63644225wmd.42.2019.01.24.03.11.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 03:11:56 -0800 (PST)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190123212234.32068-1-stefanha@redhat.com>
	<20190123212234.32068-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
Date: Thu, 24 Jan 2019 12:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123212234.32068-3-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/5] pflash: flush rom device
 memory region
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, jusual@mail.ru,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m0bD3KosYo1M

Hi Stefan,

On 1/23/19 10:22 PM, Stefan Hajnoczi wrote:
> pflash devices should mark the memory region dirty and invalidate TBs
> after directly writing to the RAM backing the ROM device.
> 
> Note that pflash_cfi01_get_memory() is used by several machine types to
> populate ROM contents directly.  Callers are untouched by this patch
> because they only modify memory before the guest is started.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 5 +++++
>  hw/block/pflash_cfi02.c | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index bffb4c40e7..5301c11c18 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -446,6 +446,7 @@ static inline void pflash_data_write(pflash_t *pfl, hwaddr offset,
>          break;
>      }
>  
> +    memory_region_flush_rom_device(&pfl->mem, offset, width);
>  }
>  
>  static void pflash_write(pflash_t *pfl, hwaddr offset,
> @@ -482,6 +483,8 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
>              if (!pfl->ro) {
>                  memset(p + offset, 0xff, pfl->sector_len);
>                  pflash_update(pfl, offset, pfl->sector_len);
> +                memory_region_flush_rom_device(&pfl->mem, offset,
> +                                               pfl->sector_len);
>              } else {
>                  pfl->status |= 0x20; /* Block erase error */
>              }
> @@ -763,6 +766,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>              error_setg(errp, "failed to read the initial flash content");
>              return;
>          }
> +
> +        memory_region_flush_rom_device(&pfl->mem, 0, total_len);

The device realize() is also executed before the guest is started, is
this call really necessary?

>      }
>  
>      /* Default to devices being used at their maximum device width. This was
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 0f8b7b8c7b..d04572eca4 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -378,6 +378,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>                      pflash_update(pfl, offset, 4);
>                      break;
>                  }
> +
> +                memory_region_flush_rom_device(&pfl->orig_mem, offset, width);
>              }
>              pfl->status = 0x00 | ~(value & 0x80);
>              /* Let's pretend write is immediate */
> @@ -426,6 +428,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              if (!pfl->ro) {
>                  memset(pfl->storage, 0xFF, pfl->chip_len);
>                  pflash_update(pfl, 0, pfl->chip_len);
> +                memory_region_flush_rom_device(&pfl->orig_mem, 0,
> +                                               pfl->chip_len);
>              }
>              pfl->status = 0x00;
>              /* Let's wait 5 seconds before chip erase is done */
> @@ -441,6 +445,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              if (!pfl->ro) {
>                  memset(p + offset, 0xFF, pfl->sector_len);
>                  pflash_update(pfl, offset, pfl->sector_len);
> +                memory_region_flush_rom_device(&pfl->orig_mem, offset,
> +                                               pfl->sector_len);
>              }
>              pfl->status = 0x00;
>              /* Let's wait 1/2 second before sector erase is done */
> @@ -590,6 +596,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
>              error_setg(errp, "failed to read the initial flash content");
>              return;
>          }
> +
> +        memory_region_flush_rom_device(&pfl->orig_mem, 0, chip_len);

Ditto.

>      }
>  
>      pflash_setup_mappings(pfl);
> 
