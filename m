Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2158355njc;
        Mon, 22 Jul 2024 14:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoKEJ9pDt/NY2CLmj/9JFUWXm88N0stE3VGAJk1dnvTgD7cmi7XSt5mmS0/6TSy8nKPd1XCKfCXCZEURAB8pKBBtNHxcMf
X-Google-Smtp-Source: AGHT+IE+f17pbOdqjDwyZfBWX+jMMLgc5uFQgzcQaee+GCC4qdPk+Uzh6HB6rVcVKXVSQv265ZSu
X-Received: by 2002:a5d:59a3:0:b0:368:460b:4f8e with SMTP id ffacd0b85a97d-369bae231a6mr5659867f8f.13.1721685157452;
        Mon, 22 Jul 2024 14:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721685157; cv=none;
        d=google.com; s=arc-20160816;
        b=tj0M+yxpMlc6faVU7Eq7JxWCzuMSHp2DxxoviyK6FfSOtgaeqvvPpycHXd1iD9b36E
         zr4FMJQP5kP38GlJCOdD/ofeFq20W+5SVBSDDhiukyvtl2jNxuXaNEsXP6LszTEAU1wQ
         CR938IZoj/BZ281r0VAzTqFC194aTm6GzYzn0ANecW2xnpBrnmRzgxr5tbfQKIPVrWAd
         sMloFIPDwhSuNrefefeeFSaTTSzda86SAhvS2t69MROz3oz1QGLC6Z2n1NCoZHerBkJf
         tet2ldAWgg+2hZWHf2z340hBJB8c+ylvZyj3mQ/hfELV/8OankKw00ZxM/PZFOsAp7L/
         6q+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=XepnVg65KwyCpB7+meenRPSjAOC6clLq+R6BdmsXNbA=;
        fh=68S9+Kdsh8o88VoK6xqmpRIkDdLleQOpmgVVrH8ervI=;
        b=hMmRufxwrExZNA00wIA/1iEF+lORQ1wHDw6/IasS3K94VREsYCKQxhU3r2IBeT4eE2
         LdkygRtgPVG6ltoWEVAQteslRNDcjMFjsOPGt3bYXs3l+9wdg/bDeSq5rpFzLAFsww5S
         3d9NDzTDYoSrp2/pxVjvA1/ckebL4d8FSTV6QyNm9uHKOqstN2iOssrwF7Jay8z3D4By
         SlSpzgbi1gm7bU7llFFM1ok72ejI4iQEotEVKKjBthaN5MFIHU+JiBTEIPzPvTYbANKq
         EpxKFxHNZJxBD8/8Pk5kaGIcRna+2xvY6eWIVMMQwiZYEoA81tGa2YQcDOhbvmBclcQM
         YpQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="0o/eOWZV";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id ffacd0b85a97d-369e384c149si83404f8f.955.2024.07.22.14.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="0o/eOWZV";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XepnVg65KwyCpB7+meenRPSjAOC6clLq+R6BdmsXNbA=; b=0o/eOWZVUgD/DPC9BlqzfocLhD
	AZ66ioqdcCLwhp5qACBuqqmTsrbujbouOqv01VDb1+YPqLSJrwriHTrJMHGCeBjV9IFZz582PQ49m
	X9RQdhtEXgFNZW4f8lWhcJGVY6bSfRtIjsTiHIG4rZKkJ68kY+7cueZFygpj8GBxzHCgAm5ZW8tXp
	9xSS9bZrGp8vjdHdifKGOdb47Mhwp7l+ts5MnM6J2g3upL/9YHC/t9nv+2lDtJiE321oc8XguG0EG
	r+Sp6XzGa5/ehz5SSwd1mcWQ5Zm8bNRYq1hoxMmG3UmqMI7OWvfujeukR9CQ2NZDcmz4V7xlQiXY7
	xP5cWikI/i4TcYa/jgvy25HU7IRna03xMvPpAKROJTonSt+hMmxRYwQQtpWqJLa9rhi8CLaTc184Z
	IY9DMf3qxvncR3D1MHQzT38Cau4o6KBPVat0EqFdWj6qh8rUq4uyAbpWs/PTL7JW3AY7cMaign5ls
	nIR5y/oCcl+Q7bX7REo9LEHMNZm/iKJN54Yy/77NT6TGxF39R77/QcXwhcVG/+zo6JPLOLTOPdBvx
	03pMiR8hR8a1IdLpoEFyeurfZTVaMJm/3VyzFnIGJgt+5G6QkCEmq5ScRS3bY+b6wJ3tEkXNjc7ZM
	2eKobHbyOsebvBv4L9ryKAQuit6XPlU2BkDsfL+GA=;
Received: from [2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1sW0vt-0003Yd-Ct; Mon, 22 Jul 2024 22:51:05 +0100
Message-ID: <1ac01868-6d0e-4a47-8239-4e2d3acb36d0@ilande.co.uk>
Date: Mon, 22 Jul 2024 22:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-8-philmd@linaro.org>
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
In-Reply-To: <20240722160745.67904-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 7/7] util/fifo8: Introduce fifo8_discard()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: qWyo0/NrjkiW

On 22/07/2024 17:07, Philippe Mathieu-Daudé wrote:

> Add the fifo8_discard() helper for clarity.
> It is a simple wrapper over fifo8_pop_buf().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/fifo8.h | 8 ++++++++
>   hw/scsi/esp.c        | 2 +-
>   util/fifo8.c         | 6 ++++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index 21c7a22937..53bafabd25 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -129,6 +129,14 @@ const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>    */
>   const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>   
> +/**
> + * fifo8_discard:
> + * @fifo: FIFO to consume bytes
> + *

Missing a reference to len in the comment above?

> + * Discard (consume) bytes from a FIFO.
> + */
> +void fifo8_discard(Fifo8 *fifo, uint32_t len);

Perhaps fifo8_drop() is a more descriptive name here? Regardless:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

>   /**
>    * fifo8_reset:
>    * @fifo: FIFO to reset
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index cec847b54a..c703fa7351 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -351,7 +351,7 @@ static void do_message_phase(ESPState *s)
>       /* Ignore extended messages for now */
>       if (s->cmdfifo_cdb_offset) {
>           int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
> -        fifo8_pop_buf(&s->cmdfifo, NULL, len);
> +        fifo8_discard(&s->cmdfifo, len);
>           s->cmdfifo_cdb_offset = 0;
>       }
>   }
> diff --git a/util/fifo8.c b/util/fifo8.c
> index 6610b79182..ea39ca2552 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -131,6 +131,12 @@ uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
>       return n1 + n2;
>   }
>   
> +void fifo8_consume(Fifo8 *fifo, uint32_t len)
> +{
> +    len -= fifo8_pop_buf(fifo, NULL, len);
> +    assert(len == 0);
> +}
> +
>   bool fifo8_is_empty(Fifo8 *fifo)
>   {
>       return (fifo->num == 0);
