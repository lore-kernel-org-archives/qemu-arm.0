Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3300767wru;
        Mon, 1 Jul 2019 19:54:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwm77yWyMnR2sD7xpv2sK4bKPy2SVNV4oFVYQiyQpuQxu8yO0j7zZQcc4w4FvAFhDX8JEK7
X-Received: by 2002:ae9:f019:: with SMTP id l25mr24060935qkg.473.1562036095403;
        Mon, 01 Jul 2019 19:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562036095; cv=none;
        d=google.com; s=arc-20160816;
        b=ROx9uRpJ5XAQteW6lL5pTezDnbHkVTlKb2Rr7s07MCNf9zMCK8IJ5+wMvosSYldA29
         zr3n+y7QZPoR/j7RnJT1i0OfimDVrbiynu5TqYXrOpXX9LxcIwc11zCSehL+4FSjCIas
         F9qjz/zCtvK4TekKeCEzlqAI5t/OJ8JnhsBpoD9GMEFavbnkhwxXJzukoOql4dyEFoGu
         jFxCcJlzO2xyYSi+Ax6JmwwxQx8+N1Mqf2B4ecEPLF6EDhzBrycpCMF8CI4NTVkRWSlF
         iIuesnyVCH+YMf2pwx1bNLrI/ayA96pLVDFA1atH7ZsACMtGpl1zOBd+2MqCBYh0RsQW
         4agg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=ECWaIFMBbKmrzlwVYNNZpME6DiIXSPD2yC0lWLwIiOM=;
        b=Xlzt3x/RuKmITLReb7SePYUVVMK0Qnwme3cRUSWn9dSRfcIDartTS947wO+ggpvcuD
         pym+BTJ7wYpwg2mnRc2KSnWiF+F4d+Se9J9uC4YmWdwLDOnoUeyBseCvVsG4dSg/71BC
         oURLgZNAYhAwieQhddGHpOWfkbEvErbMy2H9dZ9QY4SNnw2gLljZmPKiqr4aSvOrHXr1
         HjlyH/wBD4rO49tfFvitumROwYnxoIkCTwQNm/cN4mMIk5PHsciqIfD3bb/4h+6Tw77x
         WLP4oaIUc9j7qfSNxJH10aw7r48Lc8KE+HDOzWdUPK6qMovG6efqee5c842kKqlszTyu
         x2Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t64si9356253qke.110.2019.07.01.19.54.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 19:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C29F3086201;
	Tue,  2 Jul 2019 02:54:54 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63DD86085B;
	Tue,  2 Jul 2019 02:54:43 +0000 (UTC)
Subject: Re: [PATCH v2 2/9] hw/block/pflash_cfi01: Use the correct READ_ARRAY
 value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>,
 Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-3-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a94c7f00-51ad-8d60-02d2-2e85850ab4e4@redhat.com>
Date: Mon, 1 Jul 2019 22:54:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702001301.4768-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 02 Jul 2019 02:54:54 +0000 (UTC)
X-TUID: Y6gTO75rSeK/



On 7/1/19 8:12 PM, Philippe Mathieu-Daudé wrote:
> In the "Read Array Flowchart" the command has a value of 0xFF.
> 
> In the document [*] the "Read Array Flowchart", the READ_ARRAY
> command has a value of 0xff.
> 
> Use the correct value in the pflash model.
> 
> There is no change of behavior in the guest, because:
> - when the guest were sending 0xFF, the reset_flash label
>   was setting the command value as 0x00
> - 0x00 was used internally for READ_ARRAY
> 
> [*] "Common Flash Interface (CFI) and Command Sets"
>     (Intel Application Note 646)
>     Appendix B "Basic Command Set"
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I'm assuming you tested a guest and saw it sending 0xFF; and based
entirely on the assumption that you tested this and it is not now worse:

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  hw/block/pflash_cfi01.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index dcc9885bf0..743b5d5794 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -280,10 +280,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
>          /* This should never happen : reset state & treat it as a read */
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
>          pfl->wcycle = 0;
> -        pfl->cmd = 0;
> +        pfl->cmd = 0xff;
>          /* fall through to read code */
> -    case 0x00:
> -        /* Flash area read */
> +    case 0xff: /* Read Array */
>          ret = pflash_data_read(pfl, offset, width, be);
>          break;
>      case 0x10: /* Single byte program */
> @@ -449,8 +448,6 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>      case 0:
>          /* read mode */
>          switch (cmd) {
> -        case 0x00: /* ??? */
> -            goto reset_flash;
>          case 0x10: /* Single Byte Program */
>          case 0x40: /* Single Byte Program */
>              DPRINTF("%s: Single Byte Program\n", __func__);
> @@ -527,7 +524,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>              if (cmd == 0xd0) { /* confirm */
>                  pfl->wcycle = 0;
>                  pfl->status |= 0x80;
> -            } else if (cmd == 0xff) { /* read array mode */
> +            } else if (cmd == 0xff) { /* Read Array */
>                  goto reset_flash;
>              } else
>                  goto error_flash;
> @@ -554,7 +551,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>              } else if (cmd == 0x01) {
>                  pfl->wcycle = 0;
>                  pfl->status |= 0x80;
> -            } else if (cmd == 0xff) {
> +            } else if (cmd == 0xff) { /* read array mode */
>                  goto reset_flash;
>              } else {
>                  DPRINTF("%s: Unknown (un)locking command\n", __func__);
> @@ -646,7 +643,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>      trace_pflash_reset();
>      memory_region_rom_device_set_romd(&pfl->mem, true);
>      pfl->wcycle = 0;
> -    pfl->cmd = 0;
> +    pfl->cmd = 0xff;
>  }
>  
>  
> @@ -762,7 +759,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>      }
>  
>      pfl->wcycle = 0;
> -    pfl->cmd = 0;
> +    pfl->cmd = 0xff;
>      pfl->status = 0;
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
> 

-- 
—js
