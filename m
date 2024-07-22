Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2170223njc;
        Mon, 22 Jul 2024 15:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuIpzV0o1mFScrtXysA80RyTqdzEY13Vo2fWrw21SB3v22MGrUHVxDCDMh7JqVqfHcEDnFI49FItg4gBLuQu1qEM2NqKJR
X-Google-Smtp-Source: AGHT+IHaI+7fof/pk74WR/0Usmb+h+h7Mhl6Pbbb1jbkbtoA82kdn4RhUZa9FTQZZ4SMkeyI+s5E
X-Received: by 2002:a05:600c:3148:b0:426:6eb9:db07 with SMTP id 5b1f17b1804b1-427dc51d3ecmr53320285e9.13.1721687037793;
        Mon, 22 Jul 2024 15:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721687037; cv=none;
        d=google.com; s=arc-20160816;
        b=qpM1jN86WyXFQARq52IniFnm7ZqfCXmGvXKRsRnOgdLddDloAKEhCiwEMw0yojpMt9
         tVDni6sd9Mq45QMFw1J2u42fwVM470YljRUSpx9j4I6GzZTWsVi3GGkGXAMLh00U+3JW
         4445Bn2CctSnMwUGUOCLU3Ta/8PrVPTlgGOJZrvdHOZGbiKobhxDDzFeuNnJPpCIne9n
         QZh4CmGSt6ed2CLpv/vYbAyOljt8ftRoWGsq8HeKU/CF3iaHx1AhdyOxZU9bNGlGoi2s
         y/5xxiTvxLdcnMiRD2Mu/qqpzEPylH4Zm+DFc3F3+L6yMEaw6Z8/F+9IXHOQgsx2GrDy
         oECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=spjUBKFS6QaWhZsVpAytuVz/tRWNcLBDro2q2YDUItc=;
        fh=68S9+Kdsh8o88VoK6xqmpRIkDdLleQOpmgVVrH8ervI=;
        b=w+oNJgToGTHf4TtqKQeKdiq3hYS3/b8AzVny6woVqDRKiiEQdRx8knd97u3bxaG1TK
         TbXQEDobPNV6i1nqurfmjCaYsoHUUs/C66Wu0Ac2hMR0dCBqwcDJW0jZDvHXozH9OMRv
         Kzm2IJG9pAOIY96JQCIpmBQvuvGs1C42U9DesSyDpIRXqyc5uzbveI/PgWB5bp6pwVAt
         xW8lbUIGKZ9NsES5BAb4P6dF1SrEmi3bPHZEZooGKGqPWicuqSGKE+sGkBy6TUxvkyCk
         mf591F0OLcDolcXSQrgeEzkz/FEF5GsqqAXiFZAz5qiPsevkdj7g2RCpvehzx22ayS2o
         2/LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=GuxpFaHM;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-427d2a639cesi42766185e9.74.2024.07.22.15.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=GuxpFaHM;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=spjUBKFS6QaWhZsVpAytuVz/tRWNcLBDro2q2YDUItc=; b=GuxpFaHMS1Er3WCNJ4P3s6Yptm
	1Apf11XJwHppfMj6Wz/25Adcf0MkBEdIAsR02/VoXz0J5y2UcAIrrCsV8QbKrGRATHt3iUlbcFHT/
	fCZ8HKclqAOdJYfF16VL6oNo00SsaUTj8FhLYu/lU09GkySop3XvylZH3DgbxOShx2Zxo8waNlVjz
	GlIYsasMrjL+XXQZOzUv1/wp+qFKIgrnQda4gkGI9/dsDzrIDI87YAcuRP5I4YJuqlvzSohfebF9S
	6Z5ISADcHSuKLR6yGtPBE8b6ZWJ879h67/Ec+wrYDa3vWgPrWQieUtNBTzBgwJTLkf1TkSgW2SJCE
	Pty5gDcyrwRuxL4obVN1B01bhSTSfzBWLQnJNXqXf8+eCDnMsgBA9qJuyOKqW0PQ7mKSemnSQjYeY
	iNuDHz4X/HmO1mYY7aKskFQNS+LW7q5wm2zgfslK5Z5w7dDGCOZ8/s5EXJqlxwDfqXD7VyIa7qDUf
	P69O4UsTAjWm9hCWh4QqGsqaGCJ8Ow8ayo55XiQHWJziAcvzH/Iq6/zthXAXvb4lwVm3wya95jizn
	aNYWn5bSiuVDXMob9IUufyuiObhTDQGO8LwDPKJa5gxzLa8oC5tA4l3WWHfQWwI0XYzevmd9gcnz6
	JesO7n2haOmHERrgun4AZjm4H94wBt4I9cPioucgo=;
Received: from [2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1sW1QD-0003kj-Gq; Mon, 22 Jul 2024 23:22:25 +0100
Message-ID: <d5ada7c0-eac8-483c-901d-172fd16a2c4b@ilande.co.uk>
Date: Mon, 22 Jul 2024 23:23:51 +0100
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
 <7e222b69-49e6-4d0c-9b44-45c42e18cfb2@ilande.co.uk>
 <8fcc1b96-3b8e-4d5e-9154-3abf9b6f730b@linaro.org>
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
In-Reply-To: <8fcc1b96-3b8e-4d5e-9154-3abf9b6f730b@linaro.org>
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
X-TUID: IWi+TZXqcZw2

On 22/07/2024 22:39, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> On 22/7/24 23:26, Mark Cave-Ayland wrote:
>> On 22/07/2024 17:07, Philippe Mathieu-Daudé wrote:
>>
>>> Extract fifo8_pop_buf() from hw/scsi/esp.c and expose
>>> it as part of the <qemu/fifo8.h> API. This function takes
>>> care of non-contiguous (wrapped) FIFO buffer (which is an
>>> implementation detail).
>>
>> I wonder if it is also worth updating the comment for fifo8_pop_bufptr() indicating 
>> that it returns a pointer to the internal buffer without checking for overflow,
> 
> We document:
> 
>   * The function may return fewer bytes than requested when the data wraps
>   * around in the ring buffer; in this case only a contiguous part of the data
>   * is returned.
> 
> but I'll try to reword a bit.
> 
>> and that in general fifo8_pop_buf() is recommended instead?
> 
> Yes, this was my first motivation but then I forgot to write it :)
> 
> BTW I now see fifo8_pop/peek_bufptr() as dangerous API and am thinking
> of deprecating them (after release). AFAICT the difference is a pair of
> memcpy(), when I expect to not be that important performance wise.

Funny - I had exactly the same thought ;)

>> Otherwise:
>>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Thanks!
> 
> BTW I'll respin this series including the fifo8_peek_buf() patch that
> I forgot and is the one I need in PL011. Preview:
> 
> +uint32_t fifo8_peek_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
> +{
> +    uint32_t tail_count, head_count = 0;
> +
> +    if (destlen == 0) {
> +        return 0;
> +    }
> +
> +    destlen = MIN(destlen, fifo->num);
> +    tail_count = MIN(fifo->capacity - fifo->head, destlen);
> +
> +    if (dest) {
> +        memcpy(dest, &fifo->data[fifo->head], tail_count);
> +    }
> +
> +    /* Add FIFO wraparound if needed */
> +    destlen -= tail_count;
> +    head_count = MIN(destlen, fifo->head);
> +    if (head_count && dest) {
> +        memcpy(&dest[tail_count], &fifo->data[0], head_count);
> +    }
> +
> +    return tail_count + head_count;
> +}

Looks good at first glance, although it's getting late here now. If you're looking at 
making a few more changes before a respin, is it worth considering to add a new file 
with qtests for the updated Fifo8 implementation?


ATB,

Mark.
