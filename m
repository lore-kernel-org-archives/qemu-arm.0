Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2600059wru;
        Thu, 9 Aug 2018 20:39:46 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw0uKUihMmmY/AvC/9Zad4fg4pTKtsZeZeVmtRUEQIWWiw9GiaHpvgM+gt2Fu/XCNh/s6qh
X-Received: by 2002:ac8:1779:: with SMTP id u54-v6mr4822079qtk.285.1533872386069;
        Thu, 09 Aug 2018 20:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533872386; cv=none;
        d=google.com; s=arc-20160816;
        b=eVhPxbIzqKuEfOCle5yFd8oBLKw9OwoYFlUeY6HskewqrpvzAMNHEsH3t5DY2oHdHb
         H+FBepK42lHN0QMqzZPOnyWGMTvMhYvqBAxPwBGBHvHvJIamDlBcOIxJsPDAjYQzaTWd
         ERp/zYQApJoOP4RTknSemGuozMoEOKPSZLySyO67Fyu/a0SQrAYkAGl9fR/Gnhn1bE1P
         lnjUTBOG3MOo8iEvlMGnguyk3XqLPzlDvGoINcpqV6BcD3UNbQmojNVzIdi7aXW+zVMt
         cUb8tBUtyavcpfUw10vDlVWq5gP66kbmzSCmusqlURvi68c5j4AbegJjWuM0+TC17Su0
         GkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=MmDS61xRMz4xXB8mOtdO+OdhkYz8M58ZTmOO4UR63Kg=;
        b=fxPL9LrzmI3p7mVCfN98aWPNbXvyUxp0pFldhuG4LILhT4ThZgPEarbXgcXXp+ywS7
         rm3wGJyhBbX7p+pC45TuhXI41O5kvs+LM6dKKAHujHg+ZI8NCwNeKRfQbYzCxJGdC97G
         xvJFf88IdCftAtrGNr/I8Qpy1LrseR2KsbARhbgGiU93Vyhkojl0crarAqo8yt39utoF
         ITcWbulPMj9J8UGRU6Phv29tLyDo2YOt1aQj1kxayFg1/hU+Is5uA3CyEPVsKioAmwhc
         Clz83to6u9+mLuU3H4GdCchExDSXPVj4EnGZ6bZpJa2ubD1BOLpHts6RQELpiZvD2XMm
         KAvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n3uw2fM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q77-v6si8280462qki.306.2018.08.09.20.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 20:39:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n3uw2fM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnyHB-0007Xa-BF
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 23:39:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyGz-0007VV-Qy
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyGy-00052D-Fp
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:39:33 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:39719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyGy-00051V-AC; Thu, 09 Aug 2018 23:39:32 -0400
Received: by mail-ua1-x943.google.com with SMTP id g18-v6so499755uam.6;
	Thu, 09 Aug 2018 20:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MmDS61xRMz4xXB8mOtdO+OdhkYz8M58ZTmOO4UR63Kg=;
	b=n3uw2fM9mkCfzr0aZwIlqD8fiEb/khXNd4W/VUZiW47qy1LucAVLp7pNCtwuR0BG7R
	UqRXgWPLVxDtdj5V0Zd954QIGRYrJmI3gEm/03iFOIDWZuT1EGdVpYJcnq1b6Th7qAr7
	XDkybbWWVP0RakncWFkRQUsvMCdFnP2ZqUJ5qvt013srhGLJfwjQwjaRYVREHzAGDTQW
	j5AUwnUIesxLRcsn3JKUfSCkWofq4fYD5IpY3KtE63U+/LJtEE//1PcUlhp1Lbo/l3eY
	wPcP3BJ/ugs7Xo3mULu4AL0KR/ElWlDN1CQ99YCFw5FH+9HrPb4e0BBEoF6mHyDpObgZ
	P0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MmDS61xRMz4xXB8mOtdO+OdhkYz8M58ZTmOO4UR63Kg=;
	b=VH2yN88e6qM6LU5GzjNaHKCdUPgXBRJkLozT8uVwWcG8yxhLkEV2x2411fPRemMen/
	e7K9E2elyjoS37l2YPTxfQe0tCDh1e9kpSjFiG7rPfqfyoGiJNAf++PGsNSqMWKIRRt6
	jeYjMcwdasIBuAGtoVKNQjVIfzunwvOSSylfdvqx2OZF9H4CNPfc1i4uDM+4wD5UUqcE
	lZPwi21CP96eWb3w7ILMRxxxnBuv/l8vO1txYSTQTFJtyHMPtwfzgRc/nx1vJ/BDg6ir
	GDU6oB30VWNhNJcmUsPuC7XJDTSOq41ucWcmcIUFOB+cXqdXo66YtJPptkPyOGi2Q+V/
	ODPg==
X-Gm-Message-State: AOUpUlGtDLNjh4Q1ZjU7R2b07HQYd8k1TLGaLo4qJzonmaDOgXZPhNTU
	xzpE8bKjikN/tKWmYSkAEXY=
X-Received: by 2002:ab0:330:: with SMTP id 45-v6mr3248877uat.125.1533872371579;
	Thu, 09 Aug 2018 20:39:31 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	y6-v6sm1280729ual.12.2018.08.09.20.39.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 20:39:31 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
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
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <d62dda7f-0427-3d01-85f7-eaf6aaa25005@amsat.org>
Date: Fri, 10 Aug 2018 00:39:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803144721.17036-4-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::943
Subject: Re: [Qemu-arm] [PATCH v4 3/6] loader: extract rom_free() function
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G2Kc0zQkF3Bj

On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> The next patch will need to free a rom.  There is already code to do
> this in rom_add_file().
> 
> Note that rom_add_file() uses:
> 
>   rom = g_malloc0(sizeof(*rom));
>   ...
>   if (rom->fw_dir) {
>       g_free(rom->fw_dir);
>       g_free(rom->fw_file);
>   }
> 
> The conditional is unnecessary since g_free(NULL) is a no-op.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/core/loader.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index bbb6e65bb5..0c72e7c05a 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -847,6 +847,17 @@ struct Rom {
>  static FWCfgState *fw_cfg;
>  static QTAILQ_HEAD(, Rom) roms = QTAILQ_HEAD_INITIALIZER(roms);
>  
> +/* rom->data must be heap-allocated (do not use with rom_add_elf_program()) */
> +static void rom_free(Rom *rom)
> +{
> +    g_free(rom->data);
> +    g_free(rom->path);
> +    g_free(rom->name);
> +    g_free(rom->fw_dir);
> +    g_free(rom->fw_file);
> +    g_free(rom);
> +}
> +
>  static inline bool rom_order_compare(Rom *rom, Rom *item)
>  {
>      return ((uintptr_t)(void *)rom->as > (uintptr_t)(void *)item->as) ||
> @@ -995,15 +1006,7 @@ err:
>      if (fd != -1)
>          close(fd);
>  
> -    g_free(rom->data);
> -    g_free(rom->path);
> -    g_free(rom->name);
> -    if (fw_dir) {
> -        g_free(rom->fw_dir);
> -        g_free(rom->fw_file);
> -    }
> -    g_free(rom);
> -
> +    rom_free(rom);
>      return -1;
>  }
>  
> 
