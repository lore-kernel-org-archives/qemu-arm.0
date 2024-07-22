Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2148123njc;
        Mon, 22 Jul 2024 14:22:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXbgv4D8uriLtXOzpyP2VSC7C6r5k0Rgldw9MUuj2rvpaPpiHsTr/w14+hC1Bd7pi6deFMcS9E/7A8Nvk6iKFKx0HQchm6
X-Google-Smtp-Source: AGHT+IHSOfT74KpCzmqh/aVNgrWoWA8c8N4y0uuEfx6Y5g904gQxzgOxt7SNh3f0bL4pBAmSCBUo
X-Received: by 2002:a5d:630d:0:b0:368:4da3:a3ac with SMTP id ffacd0b85a97d-369dec1e7d9mr765812f8f.40.1721683359110;
        Mon, 22 Jul 2024 14:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721683359; cv=none;
        d=google.com; s=arc-20160816;
        b=X7umLUIFqYTcLksMEMEAuWu1sssYCph9nB03G4K1Do6ImnRLDvs4tSEZfcpGhPvgBg
         zXENA3byb3Xgl8PbxjavMMXShvWE+VMSWko10FQm3D5JdX8u906jm//ZEbBqo08QvqSm
         PZxO//b089yG9k4CsOOHbQytkt8BpxzGeiX6cVGsJrWOTGRcpgnHq2jJpGyTYO9RtCIq
         46goq321y8kIHgAOOUMfMyVYuxtsfwHqvvjRsLEb61FMxWdExTsQtd89B//enkiJT3VC
         0+73EcXq7gLylb+g2UmdduUPDHaO62EzsnHV/e173s9r+lSa89OGwesgwPZQ1yYOw27U
         4GCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=15zjVRzzQM4RNGMD7kZW2TgrPbMVnxGbZNw8r8ckHcE=;
        fh=68S9+Kdsh8o88VoK6xqmpRIkDdLleQOpmgVVrH8ervI=;
        b=T9zWLpuEpGx99Szipi4m6Y8Ohsk4AmoJyi4sPpC4ykpwbh3NMmjxgjzBRjcqtfVNII
         qeoOAjH0A/JBQy6kF8MoKikr5bynwe4DhzxEaDOdhBreO9JyvqfueskMyQ21zanRR/y+
         xdv7SqFaoam2/vfmWEORV073SvFajZL0EWNr/JvMl1nxaeyykRspnH4VUX99dddUq0Qz
         nIERAHnEeusLwtu2MjrXbdLTpJJf4LgoKu38wq7lcZwP28oi2miRs4wai26tQjwC/ne5
         YDviCDeTGQ7lDZzL7wQ1a97ATAVJADdNAl5AyWku2mr8dIhZqj2eOrykbE6CI7W3G1DP
         Fv0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=IUa3hbTM;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id ffacd0b85a97d-369e3819b6asi67393f8f.633.2024.07.22.14.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=IUa3hbTM;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=15zjVRzzQM4RNGMD7kZW2TgrPbMVnxGbZNw8r8ckHcE=; b=IUa3hbTMP46Ew23WXPHH+QNrtu
	sbTAG1lz2w4V5+7rynSWpwDV8Pvwnlu2fITgXd04AD3SRwo01jFRIxjv7T/JllD+1no2EYfHX+Zs+
	Ww4C1jGkU6Z8hBPrw4lsqq4vCrcIBu1tbUKaqwU5mkwdiXn0749lAn7/TF2+5q77in255IQ7jVJA5
	bBoAzdAXhE9apaYPPRlpETKkb4Eul+/WINzJOMV3Qsf0VrYeLF7YyMde6jDO11RqjZt6i0R+m+RI2
	TlT5aOzpU+t1gKR1Pw6/S1SD3kNU+nde/vn4Lta9XwVafnyzhrhzPgxDosKrst4TMcAv1kPn3Oq/R
	HGdwJvvMrH4msTjqLnIbutWhcbzHIt6naSN6GcfcrXqHFPY0olEF0peLbSMc/4MobqC6XuCLfLH8J
	uwZulqcTqh+rGp0fSOO0kClxWhGatVNdBr+9Iays0z0y70OXHiagE9C7XMERz+DWTwqu+o8JunAtk
	UDqxaGe2vVa2JPEvL9WvSF+8RW8uVdrMXgM88OzwjoAqjlgajDqDWChHDqWr+MMp49bCrwiMRdzS6
	LP69dN7/EcpLiGucGDnC3tMIWi7rzuz7hyFD1VimNuE/jFKml+m3lC6FIgkjQGs0T4I9QU3JtrlC0
	fqUjuqS82XGF4E9br2vZrPb2nsMp9tJ8lZ1Ex9S4k=;
Received: from [2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1sW0St-0003Mk-4K; Mon, 22 Jul 2024 22:21:07 +0100
Message-ID: <6775bf69-c6e9-445b-b2b2-da4e4ef789b3@ilande.co.uk>
Date: Mon, 22 Jul 2024 22:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-5-philmd@linaro.org>
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
In-Reply-To: <20240722160745.67904-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 4/7] util/fifo8: Rename fifo8_peek_buf() ->
 fifo8_peek_constbuf()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: eHJ694anwArN

On 22/07/2024 17:07, Philippe Mathieu-Daudé wrote:

> Since fifo8_peek_buf() return a const buffer (which points
> directly into the FIFO backing store), rename it using the
> 'constbuf' suffix. This will help differentiate with methods
> *copying* the FIFO data.

Perhaps fifo8_peek_bufptr() is a better reflection that it is a pointer to the 
internal buffer that is being returned here?

Still:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/fifo8.h | 4 ++--
>   hw/scsi/esp.c        | 2 +-
>   util/fifo8.c         | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index 2692d6bfda..79450f4583 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -89,7 +89,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>   const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>   
>   /**
> - * fifo8_peek_buf: read upto max bytes from the fifo
> + * fifo8_peek_constbuf: read upto max bytes from the fifo
>    * @fifo: FIFO to read from
>    * @max: maximum number of bytes to peek
>    * @numptr: pointer filled with number of bytes returned (can be NULL)
> @@ -113,7 +113,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>    *
>    * Returns: A pointer to peekable data.
>    */
> -const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
> +const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>   
>   /**
>    * fifo8_reset:
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 8504dd30a0..526ed91bef 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -486,7 +486,7 @@ static bool esp_cdb_ready(ESPState *s)
>           return false;
>       }
>   
> -    pbuf = fifo8_peek_buf(&s->cmdfifo, len, &n);
> +    pbuf = fifo8_peek_constbuf(&s->cmdfifo, len, &n);
>       if (n < len) {
>           /*
>            * In normal use the cmdfifo should never wrap, but include this check
> diff --git a/util/fifo8.c b/util/fifo8.c
> index 2925fe5611..21943c6032 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -92,7 +92,7 @@ static const uint8_t *fifo8_peekpop_buf(Fifo8 *fifo, uint32_t max,
>       return ret;
>   }
>   
> -const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
> +const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
>   {
>       return fifo8_peekpop_buf(fifo, max, numptr, false);
>   }
