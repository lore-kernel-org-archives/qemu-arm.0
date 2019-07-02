Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3305208wru;
        Mon, 1 Jul 2019 20:01:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1CC767Br3QIt9cYq429p/iZGY3qEW8wyPfq+2DWCHUx5ao5f61GCBpYWiJH62oT6Z+4q7
X-Received: by 2002:ac8:6898:: with SMTP id m24mr23331771qtq.362.1562036510601;
        Mon, 01 Jul 2019 20:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562036510; cv=none;
        d=google.com; s=arc-20160816;
        b=VN0QNgZ4UzKrb1tfD0kt4I8/+MG0/uxsmH7I2jj8bsR9jm0Eiis0HaLQ5eY4Kl4TWR
         U2b4vtVQkRLDTdzYTm4khAsNQxsObz7D1SQRFP7tiZ1ydkgeX5O9PxwTYyIHzM4t1g5f
         EvTzhx8zq153OX37niuxmmHQAfHm1PS/CxJYzvO1proKarN6olJnKsmGc9dybEdmCuVY
         V40JZTpKk5SjH1p0enWXp4T9upKPbJb24dW4Y0XkA2+8nPR2s9kUfsvmK7HYjUATHjkY
         Y641qYJJRJUfEYLsznSvdW5C8qC+/oBULZ8rHbLFkPiCmEgc/RnudjDJEUY6nSQBKDKb
         1YrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=DgnUbdzZT4bwSwEQZcv3LTOYN4lAIDnpumfYxIQIvvE=;
        b=IfqUxthV6FwQWBAulu5vV8U/J2WrLbMV8QnLF2XIcbqSLL+SCIPsANlaqE0cZwagBj
         ogxo8rsBEULuDkPcEGQ1zy1Hby99N+jlmbDl0/7h3PMjx4OfYp/yGUT6ntUJ50ulRTCH
         Hesa03ND6uD4KW6dk5F2KqI2HGOs/NH8y/kPEUtfPHqP0P0lib+dZNOZ5iAa7SGdXUd6
         6/veTpy+FB7wY9Nvzd4A3xehuxAVIb7x0qILGZnWAfuN+acejPynvUVNOB31Obr+nLXw
         pfwxLnea3iYR7f7duTMTd6b2BBD9nYVTdSt6rIkG1FozH3Kr3ebAVGgxGKQz9LP4bkyO
         MXAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a21si8889585qkl.269.2019.07.01.20.01.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 20:01:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCF54309266B;
	Tue,  2 Jul 2019 03:01:46 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC356085B;
	Tue,  2 Jul 2019 03:01:33 +0000 (UTC)
Subject: Re: [PATCH v2 3/9] hw/block/pflash_cfi01: Extract
 pflash_mode_read_array()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, Richard Henderson
 <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-4-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <41845226-0211-3a52-dc40-9b3d209b1698@redhat.com>
Date: Mon, 1 Jul 2019 23:01:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702001301.4768-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 02 Jul 2019 03:01:47 +0000 (UTC)
X-TUID: C8zrDs479I+0



On 7/1/19 8:12 PM, Philippe Mathieu-Daudé wrote:
> The same pattern is used when setting the flash in READ_ARRAY mode:
> - Set the state machine command to READ_ARRAY
> - Reset the write_cycle counter
> - Reset the memory region in ROMD
> 
> Refactor the current code by extracting this pattern.
> It is used twice:
> - On a write access (on command failure, error, or explicitly asked)
> - When the device is initialized. Here the ROMD mode is hidden
>   by the memory_region_init_rom_device() call.
> 
> Rename the 'reset_flash' as 'mode_read_array' to make explicit we
> do not reset the device, we simply set its internal state machine
> in the READ_ARRAY mode. We do not reset the status register error
> bits, as a device reset would do.
> 

The rename does make it less confusing; but as of this patch it doesn't
seem obvious why you need this as a function, it's only really used
about "1.5 times" as of yet -- the realize call as you mention doesn't
quite exactly utilize it.

I will assume this comes in handy later, so:

Reviewed-by: John Snow <jsnow@redhat.com>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 36 ++++++++++++++++++++----------------
>  hw/block/trace-events   |  1 +
>  2 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 743b5d5794..33c77f6569 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -112,6 +112,14 @@ static const VMStateDescription vmstate_pflash = {
>      }
>  };
>  
> +static void pflash_mode_read_array(PFlashCFI01 *pfl)
> +{
> +    trace_pflash_mode_read_array();
> +    pfl->cmd = 0xff; /* Read Array */
> +    pfl->wcycle = 0;
> +    memory_region_rom_device_set_romd(&pfl->mem, true);
> +}
> +
>  /* Perform a CFI query based on the bank width of the flash.
>   * If this code is called we know we have a device_width set for
>   * this flash.
> @@ -470,7 +478,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>          case 0x50: /* Clear status bits */
>              DPRINTF("%s: Clear status bits\n", __func__);
>              pfl->status = 0x0;
> -            goto reset_flash;
> +            goto mode_read_array;
>          case 0x60: /* Block (un)lock */
>              DPRINTF("%s: Block unlock\n", __func__);
>              break;
> @@ -495,10 +503,10 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>              break;
>          case 0xf0: /* Probe for AMD flash */
>              DPRINTF("%s: Probe for AMD flash\n", __func__);
> -            goto reset_flash;
> +            goto mode_read_array;
>          case 0xff: /* Read array mode */
>              DPRINTF("%s: Read array mode\n", __func__);
> -            goto reset_flash;
> +            goto mode_read_array;
>          default:
>              goto error_flash;
>          }
> @@ -525,7 +533,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>                  pfl->wcycle = 0;
>                  pfl->status |= 0x80;
>              } else if (cmd == 0xff) { /* Read Array */
> -                goto reset_flash;
> +                goto mode_read_array;
>              } else
>                  goto error_flash;
>  
> @@ -552,15 +560,15 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>                  pfl->wcycle = 0;
>                  pfl->status |= 0x80;
>              } else if (cmd == 0xff) { /* read array mode */
> -                goto reset_flash;
> +                goto mode_read_array;
>              } else {
>                  DPRINTF("%s: Unknown (un)locking command\n", __func__);
> -                goto reset_flash;
> +                goto mode_read_array;
>              }
>              break;
>          case 0x98:
>              if (cmd == 0xff) {
> -                goto reset_flash;
> +                goto mode_read_array;
>              } else {
>                  DPRINTF("%s: leaving query mode\n", __func__);
>              }
> @@ -620,7 +628,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>                      " the data is already written to storage!\n"
>                      "Flash device reset into READ mode.\n",
>                      __func__);
> -                goto reset_flash;
> +                goto mode_read_array;
>              }
>              break;
>          default:
> @@ -630,7 +638,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>      default:
>          /* Should never happen */
>          DPRINTF("%s: invalid write state\n",  __func__);
> -        goto reset_flash;
> +        goto mode_read_array;
>      }
>      return;
>  
> @@ -639,11 +647,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>                    "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)"
>                    "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
>  
> - reset_flash:
> -    trace_pflash_reset();
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> -    pfl->wcycle = 0;
> -    pfl->cmd = 0xff;
> + mode_read_array:
> +    pflash_mode_read_array(pfl);
>  }
>  
>  
> @@ -758,8 +763,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>          pfl->max_device_width = pfl->device_width;
>      }
>  
> -    pfl->wcycle = 0;
> -    pfl->cmd = 0xff;
> +    pflash_mode_read_array(pfl);
>      pfl->status = 0;
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 97a17838ed..d627cfc3f5 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -7,6 +7,7 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
>  # pflash_cfi02.c
>  # pflash_cfi01.c
>  pflash_reset(void) "reset"
> +pflash_mode_read_array(void) "mode: read array"
>  pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "offset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
>  pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle) "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
>  pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
> 

