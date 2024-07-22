Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1858321njc;
        Mon, 22 Jul 2024 04:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWWDJulbbaLJxbbvpp12JG3cqCsUcZhMFwyKAhD/HvhKQ/nhjrYeV4pKh8qtCyoS/1zuNpE23hIj9q4C90sO4EXNIhjuK7
X-Received: by 2002:a05:600c:5012:b0:426:5dd0:a1fc with SMTP id 5b1f17b1804b1-427daa67bdbmr51407135e9.34.1721648833397;
        Mon, 22 Jul 2024 04:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721648833; cv=none;
        d=google.com; s=arc-20160816;
        b=0fqwBDCgPvwJtJvsGZCOcWaZqQvSDg5o3E8hknwf94/2dhj2gC8e5MXAOB70qb7I38
         +EV81UezzDdcQrTnom2F2u4F+XaHPSZGGSjIKgjZhHHVCs0vIUpa7B8RyE+IysZ1afHU
         zdKxpCAUta3CV0A9F8YRwg14Lr5g5+j1/TqH3hZ13a51rM3R0xzzMEldzR202DHzOwyI
         do5hvVJpLLyPUD0M6Yv2odXDs7ftMlG0knded432zhzwTQNYxJpL9Bc870KNrnxhV5IC
         9KomrI0BEIiUrUz52+1UMnc7KsPaphrYYwck11EiV5HcJf1bi6T6vSLIao92c+eS45wr
         LMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zJWII8p1HGH5CGdFfESiYUa2TDJwq31vVH6rzS5Rckw=;
        fh=lknfZe5I8I1pdlzdMH325vEKMFGlH1S3tAgn7hDsqXc=;
        b=hM846fl75oXmh18Ztlmg/6sI8vI1o/DnfipO+bwbUtxBwUBSrUpti5QGQk1l5OOCkS
         G/GlmeCfI81WdVkPEEbreK4zaL9fIcv1fDJB1WiodtE+B5v3doT2JDx3iM29Gl7TXOWv
         /HAroYNelpMaY23XdxVY4TCKwsRWlAteBF0H2Li3QPhy/QnnGiV3etjAnvA8EF4XKrkk
         rtyqUsuf52vnFgDCWIDzDBYrv9S3TonjBMfmo3pqRmegN+DdTqju+NCYWIdLBH2OHnO6
         ZbROiy73TbFvFnOYBmoviG4uOPTdCY2qmyEqABlp7kZClYHk5lYOr35Og6V3DBhjxLmB
         m8Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SeR42lnG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ffb728sor19243915e9.8.2024.07.22.04.47.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 04:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SeR42lnG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721648833; x=1722253633; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJWII8p1HGH5CGdFfESiYUa2TDJwq31vVH6rzS5Rckw=;
        b=SeR42lnGfkGxRH9cVcf5qfFyT010xqo3M9cG+gDcV5T0BW8eHYh2rTKvCGEYydXBN1
         uL3Rv2woQ/Tj/ahoPjj09a3yVdaffE9cf3Q5YBj0PztoBBLG/NFw0KX6l61rae4mhinU
         OCSmKeMOZQzENOyV22x+bB5kn8726YgsPxXz41vZRXFZkcRvd/yw2AEO8ifn3tT+l8Rv
         0E1rjmFsI2w2WgRLbODzUezmN40T2+pV9/21l7IicOUcHMc/YmWZ+OYt4oi1oLYifEW8
         SB+crsDTQYELsFJCvHcRlIgFzwAvb2WR3G4eO+SEHpUof8fnmeb9V7JipcnR7dBzsLAO
         rHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648833; x=1722253633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJWII8p1HGH5CGdFfESiYUa2TDJwq31vVH6rzS5Rckw=;
        b=Y3No170i0AA7Rr4QdmvVJ1Ka8NZfCciGgCJ/PsUGgE2HAgO4LSoGLnta192GOzaE2P
         g71YCQZLvLjexrJxYozNNjZox6z9kYoP6bUoED12/36Y0xiwumI9+SPLNCpdP747Ewmv
         lV9lQ1wq/ZbA0bu+9+leSs7tIow36Kk1upZf++em40gNE9SnuWkjsQeutwKGAFFPX62e
         KfS44jlSzKNkT4/3RTuUpNVoSz7ZGdv1jJ6k0bjGZupQ8plMdj01WNQWOJ6GDS8MJKUb
         1VnZsGQbZbu3VH1R+lXtm7VRXhnoz9nIpXHNVOGFMtwwuynJCTT6/a2fp4qtBR2HZSuC
         gMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpWaTp72QTGz2/sMbJZKSOY4ucHqBoxU1coC3/c1x/fglNXlbVb/rDPocjEm9yGw6B8txbb47UjvvugmO0aXOSgaPllvC8
X-Gm-Message-State: AOJu0Yztt+ZAqqqQvCLftpeIBHtFG5XC9Ohf/CfJXuO09rHgkndoOlUV
	ev15qx2dmuzZCbjlB36AfcBYIeULf4TDQDtJJhC5vlpSC2ldFlfhMpZlqCvPP1nBYZcmAXTtUrs
	PCXI=
X-Google-Smtp-Source: AGHT+IE9OgVYg8k0WxAaAsIzetXsx9CrTAohvFCYIJCcvs2QAVyCNmsLT4XTfZqwMmJQnAK8oMV/yg==
X-Received: by 2002:a05:600c:4f88:b0:426:6220:cb57 with SMTP id 5b1f17b1804b1-427daa622b3mr42804105e9.25.1721648832796;
        Mon, 22 Jul 2024 04:47:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6929976sm125043835e9.29.2024.07.22.04.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 04:47:12 -0700 (PDT)
Message-ID: <96679d63-c6b7-4d49-8555-8ecb89b0f994@linaro.org>
Date: Mon, 22 Jul 2024 13:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 16/16] hw/char/pl011: Implement TX FIFO
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Tong Ho <tong.ho@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
 <20240719181041.49545-17-philmd@linaro.org>
 <4e6b616f-3acc-4130-9b92-1af7fed540da@ilande.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4e6b616f-3acc-4130-9b92-1af7fed540da@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: usCzWISU4X6J

On 19/7/24 23:25, Mark Cave-Ayland wrote:
> On 19/07/2024 19:10, Philippe Mathieu-Daudé wrote:
> 
>> If the UART back-end chardev doesn't drain data as fast as stdout
>> does or blocks, buffer in the TX FIFO to try again later.
>>
>> This avoids having the IO-thread busy waiting on chardev back-ends,
>> reported recently when testing the Trusted Reference Stack and
>> using the socket backend.
>>
>> Implement registering a front-end 'watch' callback on back-end
>> events, so we can resume transmitting when the back-end is writable
>> again, not blocking the main loop.
>>
>> Similarly to the RX FIFO path, FIFO level selection is not
>> implemented (interrupt is triggered when a single byte is available
>> in the FIFO).
>>
>> Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC: Something is still broken, some characters are emitted async...

[*]

>> ---
>>   hw/char/pl011.c      | 60 ++++++++++++++++++++++++++++++++++++--------
>>   hw/char/trace-events |  1 +
>>   2 files changed, 51 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index cfa3fd3da4..9f72b6a765 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -240,7 +240,9 @@ static gboolean pl011_xmit(void *do_not_use, 
>> GIOCondition cond, void *opaque)
>>   {
>>       PL011State *s = opaque;
>>       int bytes_consumed;
>> -    uint8_t data;
>> +    const uint8_t *buf;
>> +    uint32_t buflen;
>> +    uint32_t count;
>>       if (!(s->cr & CR_UARTEN)) {
>>           qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to 
>> disabled UART\n");
>> @@ -249,25 +251,40 @@ static gboolean pl011_xmit(void *do_not_use, 
>> GIOCondition cond, void *opaque)
>>           qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to 
>> disabled TX UART\n");
>>       }
>> +    count = fifo8_num_used(&s->xmit_fifo);
>> +    if (count < 1) {
>> +        /* FIFO empty */
>> +        return G_SOURCE_REMOVE;
>> +    }
>> +
>>       if (!qemu_chr_fe_backend_connected(&s->chr)) {
>>           /* Instant drain the fifo when there's no back-end. */
>>           pl011_drain_tx(s);
>>           return G_SOURCE_REMOVE;
>>       }
>> -    data = fifo8_pop(&s->xmit_fifo);
>> -    bytes_consumed = 1;
>> +    buf = fifo8_peek_buf(&s->xmit_fifo, count, &buflen);
>> -    /*
>> -     * XXX this blocks entire thread. Rewrite to use
>> -     * qemu_chr_fe_write and background I/O callbacks
>> -     */
>> -    qemu_chr_fe_write_all(&s->chr, &data, bytes_consumed);
>> +    /* Transmit as much data as we can. */
>> +    bytes_consumed = qemu_chr_fe_write(&s->chr, buf, buflen);
>>       trace_pl011_fifo_tx_xmit(bytes_consumed);
>> +    if (bytes_consumed < 0) {
>> +        /* Error in back-end: drain the fifo. */
>> +        pl011_drain_tx(s);
>> +        return G_SOURCE_REMOVE;
>> +    }
>> +
>> +    /* Pop the data we could transmit. */
>> +    fifo8_pop_buf(&s->xmit_fifo, bytes_consumed, NULL);
>>       s->int_level |= INT_TX;
>>       pl011_update(s);
> 
> One of the gotchas with Fifo8 is that whilst fifo8_push(), fifo8_pop() 
> and fifo8_push_all() will wrap the FIFO buffer, fifo8_{peek,pop}_buf() 
> do not. For example fifo8_num_used() could return 15, but if 
> xmit_fifo->head is set to 15 then fifo8_{peek_pop}_buf() would return 1 
> leaving 14 characters in the FIFO at the end of pl011_xmit().

Wow, indeed this is the problem [*] I was facing :) <3

> Possible solutions could be to use a loop to send one character at a 
> time similar to:
> 
>      while (fifo8_num_used(&s->xmit_fifo)) {
>          uint8_t c = fifo8_pop(&s->xmit_fifo);
> 
>          if (qemu_chr_fe_write(&s->chr, &c, 1) == -1) {
>              fifo8_push(&s->xmit_fifo, c);
>              break;
>          }
>      }
> 
> Or else use a solution similar to the one I used for ESP at 
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/scsi/esp.c?ref_type=heads#L200. I did think about whether it was worth adding a function similar to the one used for ESP to the Fifo8 API, but wasn't sure it was worth it at the time.

Yeah clearly this DTRT. I'll extract this method.

> 
>> +    if (!fifo8_is_empty(&s->xmit_fifo)) {
>> +        /* Reschedule another transmission if we couldn't transmit 
>> all. */
>> +        return G_SOURCE_CONTINUE;
>> +    }
>> +
>>       return G_SOURCE_REMOVE;
>>   }
>> @@ -290,6 +307,10 @@ static void pl011_write_txdata(PL011State *s, 
>> uint8_t data)
>>       trace_pl011_fifo_tx_put(data);
>>       pl011_loopback_tx(s, data);
>>       fifo8_push(&s->xmit_fifo, data);
>> +    if (fifo8_is_full(&s->xmit_fifo)) {
>> +        s->flags |= PL011_FLAG_TXFF;
>> +    }
>> +
>>       pl011_xmit(NULL, G_IO_OUT, s);
>>   }
>> @@ -488,10 +509,24 @@ static void pl011_write(void *opaque, hwaddr 
>> offset,
>>           pl011_trace_baudrate_change(s);
>>           break;
>>       case 11: /* UARTLCR_H */
>> -        /* Reset the FIFO state on FIFO enable or disable */
>>           if ((s->lcr ^ value) & LCR_FEN) {
>> -            pl011_reset_rx_fifo(s);
>> +            bool fifo_enabled = value & LCR_FEN;
>> +
>> +            trace_pl011_fifo_enable(fifo_enabled);
>> +            if (fifo_enabled) {
>> +                /* Transmit and receive FIFO buffers are enabled 
>> (FIFO mode). */
>> +                fifo8_change_capacity(&s->xmit_fifo, PL011_FIFO_DEPTH);
>> +            } else {
>> +                /*
>> +                 * FIFOs are disabled (character mode) that is, the 
>> FIFOs
>> +                 * become 1-byte-deep holding registers.
>> +                 */
>> +                pl011_drain_tx(s);
>> +                fifo8_change_capacity(&s->xmit_fifo, 1);
>> +            }
> 
> Presumably this is the part where fifo8_change_capacity() is required: 
> what does changing the FIFO size to 1 do here? Is it possible to move 
> the fifo_enabled check into pl011_read() and pop/clear the buffer there 
> instead of changing the FIFO size?

Again I tried to stay close to the datasheet description:

   3.3.7 Line Control Register, UARTLCR_H

     Bit FEN: Enable FIFOs

       0 = FIFOs are disabled (character mode) that is,
       the FIFOs become 1-byte-deep holding registers

       1 = transmit and receive FIFO buffers are enabled
       (FIFO mode).

But indeed it could be clearer to handle the FEN bit and do FIFO
enabled check elsewhere, I'll have a look.

Many thanks for your review!!

>> +            /* Reset the FIFO state on FIFO enable or disable */
>>               pl011_reset_tx_fifo(s);
>> +            pl011_reset_rx_fifo(s);
>>           }
>>           if ((s->lcr ^ value) & LCR_BRK) {
>>               int break_enable = value & LCR_BRK;
>> @@ -636,6 +671,11 @@ static int pl011_post_load(void *opaque, int 
>> version_id)
>>           s->read_pos = 0;
>>       }
>> +    if (!fifo8_is_empty(&s->xmit_fifo)) {
>> +        /* Reschedule another transmission */
>> +        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, 
>> pl011_xmit, s);
>> +    }
