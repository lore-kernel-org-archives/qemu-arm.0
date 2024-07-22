Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2149455njc;
        Mon, 22 Jul 2024 14:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTTa17O+nVDFGlPxuoVmxkyDOQtEcGo8BNpyv4ReS7WIAz/kMUQsGs1iIJjELGRR5MOcACAnZbJyLpD/DcKi/B2kDJ4njY
X-Google-Smtp-Source: AGHT+IH7IGQ1WoUjMKKhHnrRrNzFM9zyyBYdDjTFDtHm8bhJCgTeJzRpb+SuL3ZBqOViKZ+GhzJv
X-Received: by 2002:adf:ee41:0:b0:368:7883:d14a with SMTP id ffacd0b85a97d-369bae51e87mr4377233f8f.33.1721683617019;
        Mon, 22 Jul 2024 14:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721683617; cv=none;
        d=google.com; s=arc-20160816;
        b=bqsrddpweJ4ddmJLB5SeqQJdXyZVvfPUWkRP12Om5LHNUcU572a1N0rfb/559Y9EUL
         shZ415DZwIHF2GJXP7+cbL2PtAEi1mrHhTk1FK33kGSVojvo/dvaxOmP08uB4R7pNUyW
         XdN9US1hOvNUhNTh01znOCa2xPDQOYwU7A/g8h1/QHUj6nlctqU07EQQWG35dOoTJqWt
         zgQgOIWgBo/Sgrd7uaFp/w935fTKGkt1tTtasF7IAvAdlNnHP7QLywZ+RDU7QPWCn7Pi
         Bc69UYHEmhGqVjopjPdVCRWzWKGItJowq7N3QA3pecAmmM2zzlppyc8KbWI6TdbarC9r
         ve/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ekp8nZSyGbF4baG0fwetw0q1NFHANeINpXRceYAnmRM=;
        fh=68S9+Kdsh8o88VoK6xqmpRIkDdLleQOpmgVVrH8ervI=;
        b=p6Kbm/NNeVmEron/+QHxUdd0K1qjf1O4LsCI8GiA9Jbf9Hx27PVJhKxhGqXRQe26Pg
         p5jY8ZyTiUPv4XBEiirFqyoimxSIyMJiDZDsrwRv0WuWpq+SkvLxQumIQJOAXrcPihVa
         oBx6FEs97sHI+duoqCxFnncLb6crX6o1qPTVBrYXk3L0u1shXsUBLVIDBm3Wr70bZGz1
         Fz5p3I3GcJO68EbM2LOTRFZetNyWYcOaJurI327TdukQnOzoYQ9eRaVnak/QJBpUVqv3
         KKqwt0NvE97pJ55xcEctA3XNE2VC4AzBj7nuMWV1TeXjl97Y0CLWAAcABuZSc6HXFPKP
         TwAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=f421mLsQ;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id ffacd0b85a97d-369e3849942si73137f8f.929.2024.07.22.14.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=f421mLsQ;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ekp8nZSyGbF4baG0fwetw0q1NFHANeINpXRceYAnmRM=; b=f421mLsQVpf8L1UKZzSRT6WxyY
	/8onrYJ6JVLKV4B3NOD7qgENC+veOHrUlviIxfyt3WoPcLMLsOgpvsa6qiAMFGN2qV/Cq+eT8xK/T
	fSCVdSeFEGd/1VZcKb7tbToG5/Npz0xLgl6LFHDL898w+Pze6uOUkDarRX1YZnyX0bGE/QAy7yCwy
	S+UwSdropLh5JkUxv4ehKMMUf1hIDurE5cx5pPa6vPtMiygBd/xVBPMo3QYvLaOjlECD3UDCTbULV
	sPiaHPDGwfHAAbJpURmmKTvh7rRp79OO/zO8pY61g+3RuMSFrazBJKo63cgYhJKfR1vy6EwUMsSoK
	bASPwWdPpvGGJRS+jUCt7L6sngnwNiSNauSv++rPSVWMwHJeMN8lkc+5Iw07g0yEHb29dsoMkqT6y
	AreetfgHtDPtfYCte3kljQUBV825xl27E26O8q0wxG87jABQV3OBh9oF19lV+ZfkFnhyG/X4wM5ia
	qHEGZ0AT0gSwp9EpTkbMtwB+I3UlkWpM+EsDWm6alpHCDLrGCGnno5kTB2MZwqZkinZ7g0sZffUk2
	WNcVAiD7QISryYtHS3wTpyYaqNhsSTaHf8qw6TxFXkIqnF+ou8CPiGwg9OagApREU9jAqe1xLg0Kn
	HjN5cLEEBj9ooYisjRpRpj7T8mU0pOUDdKHFZsupE=;
Received: from [2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1sW0X3-0003Oo-2v; Mon, 22 Jul 2024 22:25:25 +0100
Message-ID: <7e222b69-49e6-4d0c-9b44-45c42e18cfb2@ilande.co.uk>
Date: Mon, 22 Jul 2024 22:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-7-philmd@linaro.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20240722160745.67904-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 6/7] util/fifo8: Expose fifo8_pop_buf()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: 6SNjqpk9y4L8

On 22/07/2024 17:07, Philippe Mathieu-Daudé wrote:

> Extract fifo8_pop_buf() from hw/scsi/esp.c and expose
> it as part of the <qemu/fifo8.h> API. This function takes
> care of non-contiguous (wrapped) FIFO buffer (which is an
> implementation detail).

I wonder if it is also worth updating the comment for fifo8_pop_bufptr() indicating 
that it returns a pointer to the internal buffer without checking for overflow, and 
that in general fifo8_pop_buf() is recommended instead? Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/fifo8.h | 14 ++++++++++++++
>   hw/scsi/esp.c        | 36 +++---------------------------------
>   util/fifo8.c         | 29 +++++++++++++++++++++++++++++
>   3 files changed, 46 insertions(+), 33 deletions(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index 686918a3a4..21c7a22937 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -62,6 +62,20 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
>    */
>   uint8_t fifo8_pop(Fifo8 *fifo);
>   
> +/**
> + * fifo8_pop_buf:
> + * @fifo: FIFO to pop from
> + * @dest: the buffer to write the data into (can be NULL)
> + * @destlen: size of @dest and maximum number of bytes to pop
> + *
> + * Pop a number of elements from the FIFO up to a maximum of @destlen.
> + * The popped data is copied into the @dest buffer.
> + * Care is taken when the data wraps around in the ring buffer.
> + *
> + * Returns: number of bytes popped.
> + */
> +uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen);
> +
>   /**
>    * fifo8_pop_constbuf:
>    * @fifo: FIFO to pop from
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 64384f9b0e..cec847b54a 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -197,39 +197,9 @@ static uint8_t esp_fifo_pop(ESPState *s)
>       return val;
>   }
>   
> -static uint32_t esp_fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
> -{
> -    const uint8_t *buf;
> -    uint32_t n, n2;
> -    int len;
> -
> -    if (maxlen == 0) {
> -        return 0;
> -    }
> -
> -    len = maxlen;
> -    buf = fifo8_pop_constbuf(fifo, len, &n);
> -    if (dest) {
> -        memcpy(dest, buf, n);
> -    }
> -
> -    /* Add FIFO wraparound if needed */
> -    len -= n;
> -    len = MIN(len, fifo8_num_used(fifo));
> -    if (len) {
> -        buf = fifo8_pop_constbuf(fifo, len, &n2);
> -        if (dest) {
> -            memcpy(&dest[n], buf, n2);
> -        }
> -        n += n2;
> -    }
> -
> -    return n;
> -}
> -
>   static uint32_t esp_fifo_pop_buf(ESPState *s, uint8_t *dest, int maxlen)
>   {
> -    uint32_t len = esp_fifo8_pop_buf(&s->fifo, dest, maxlen);
> +    uint32_t len = fifo8_pop_buf(&s->fifo, dest, maxlen);
>   
>       esp_update_drq(s);
>       return len;
> @@ -335,7 +305,7 @@ static void do_command_phase(ESPState *s)
>       if (!cmdlen || !s->current_dev) {
>           return;
>       }
> -    esp_fifo8_pop_buf(&s->cmdfifo, buf, cmdlen);
> +    fifo8_pop_buf(&s->cmdfifo, buf, cmdlen);
>   
>       current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, s->lun);
>       if (!current_lun) {
> @@ -381,7 +351,7 @@ static void do_message_phase(ESPState *s)
>       /* Ignore extended messages for now */
>       if (s->cmdfifo_cdb_offset) {
>           int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
> -        esp_fifo8_pop_buf(&s->cmdfifo, NULL, len);
> +        fifo8_pop_buf(&s->cmdfifo, NULL, len);
>           s->cmdfifo_cdb_offset = 0;
>       }
>   }
> diff --git a/util/fifo8.c b/util/fifo8.c
> index 31f0d34c0c..6610b79182 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -102,6 +102,35 @@ const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
>       return fifo8_peekpop_buf(fifo, max, numptr, true);
>   }
>   
> +uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
> +{
> +    const uint8_t *buf;
> +    uint32_t n1, n2 = 0;
> +    uint32_t len;
> +
> +    if (destlen == 0) {
> +        return 0;
> +    }
> +
> +    len = destlen;
> +    buf = fifo8_pop_constbuf(fifo, len, &n1);
> +    if (dest) {
> +        memcpy(dest, buf, n1);
> +    }
> +
> +    /* Add FIFO wraparound if needed */
> +    len -= n1;
> +    len = MIN(len, fifo8_num_used(fifo));
> +    if (len) {
> +        buf = fifo8_pop_constbuf(fifo, len, &n2);
> +        if (dest) {
> +            memcpy(&dest[n1], buf, n2);
> +        }
> +    }
> +
> +    return n1 + n2;
> +}
> +
>   bool fifo8_is_empty(Fifo8 *fifo)
>   {
>       return (fifo->num == 0);
