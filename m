Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp563356ejo;
        Thu, 4 Jan 2024 23:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEH4WX0uRwFr1nDaaZb2pI9rmrr6/+//frxu4MBa3HPDbi03GZoeuWCqxJWrzT+HQJPDouj
X-Received: by 2002:a05:600c:acd:b0:40d:592d:3a93 with SMTP id c13-20020a05600c0acd00b0040d592d3a93mr847201wmr.155.1704441012782;
        Thu, 04 Jan 2024 23:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704441012; cv=none;
        d=google.com; s=arc-20160816;
        b=UmSYuNNRuNgK0UUTfpZaRdOwKmE2oXWddStwWryoV9o5x71HPFf98oeJIo87EmUDlc
         jYYcya1/0AadNmBSG9bvlR0Ly5YI4Q/XFAw/JaELmAlfDEeGAV/zxUV+lW5Oc9Mya15L
         WM2xd3j4n+iDJoR/c6l4+VH52iAlQQG/qFovakWxVL0pIBhAQlZTectk+aM6TjDzeHhe
         RMjEhw0dfB4HwpmGXwIGCkse/PkFVbvLx7YiA0RhWMsJ7SyInfHSMSXySBd8Y/1bzFG8
         IYC06bBsJrawBxCJqgrgOdDKS7eVUEroHO9QEQxsQQmmWhcpNwFCaPlkK5JalVjDBOkp
         tadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ItHxcJHt/ybbZgZG9SSUK6DBvg6n/Sd5s8ugtIjRNIU=;
        fh=iAm5A4zWGUYFq3Jtozfiktm/oazx9RljWkTzR1zwPVI=;
        b=CZMKkEd1RD+aja8dBw1U02+MQnWCWo1CAfOitoCPaugGfds6sC/mDoAEODGSe/tzte
         Bt+6cKvnA2adlCoyUCSAY6QvhT2SmUY3RGrOjKgoiCyD5KbGcno8BRFnkp7ktDieYjDn
         pw54VqpyNh7L5uWvTky6z3pM6kPYk3fUdiOXsjbeX9W8lmK2RJXo4Dn/8H8bnz1Y8BJQ
         T7RMlLrDtjx1yZircqrXBtBN//mZ6xgrHZbgO1vLcXAyb3Ni6UqxBorqZs+b4x5tGkuA
         MTLFK3NWEemhUKZZFCRFQXiIt6E/kolvVZ+3mWRAmNFkBpHuAn6qxb5dcRvD9k8HfJTT
         guGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="DRrc86/G";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id e7-20020a05600c438700b0040d8afebf54si234379wmn.10.2024.01.04.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 23:50:12 -0800 (PST)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="DRrc86/G";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ItHxcJHt/ybbZgZG9SSUK6DBvg6n/Sd5s8ugtIjRNIU=; b=DRrc86/GWhzksneDa+7Lvt7KLW
	WytNqGiiEXclBIF+94SJCjXq4az8JO4anJocDmcrwUpBw5zfC3pWruEU/BAR3WbRKkqi06LrLlRaB
	r4zugRa2gNMs1E+OjIM6nYyAf20yPJxGMhG3gJrAhAawv6fvdcBRjdFyIsm7I2zG4acpUK1BFUpNB
	sMvlzoNkFawCcm9xyCZ62EJjFfmgwxVfMoItyic9Rb1JMygVjtlBSW97tRgbyRBwXwtR85mzmv+HY
	Qsx/miF8BAPSglHBjWVvA7h/fuMD4dM05AAH3tSY7Cz//o/yM+ez/OL8VLsJ1vhOa1Mx68/C4A4N4
	ZjGSBymDhLg+FmWI1KOpWLJUEJSWXGXR2wIrPSy4AnZy47SWKiV4FT747Be/0u1qpqs4X1yaJSVQi
	P4dJhzZwn8qREX3xCeglpvXUMGopFb7dgjn/Rf9VI34epuK83X9FOVkA1fZzjpy6r5Z77vCFbZ5yT
	gFh46a9gBWslP42p+DVJWK9QNfviB1gFcwmPvIz5ikfj/bSwrrrAyK0AEvk01YcghSN04hIpXE0OP
	CTBn+YPwC2Sq4iSFQO2Hl32uvoZSIUyZOWj2rFECJptMbWhFBdYeAl5BDBM4bh18GXKswIhZ2VkfJ
	IbYjZqyYKYjcfswIDtwiJy+Du4oF7QjOEbkuMoLc0=;
Received: from [2a00:23c4:8bb1:9800:2afe:393f:f9d8:dd75]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rLexb-0008xK-HG; Fri, 05 Jan 2024 07:49:43 +0000
Message-ID: <525885a8-59f0-44e1-b210-0b4bcbbe4258@ilande.co.uk>
Date: Fri, 5 Jan 2024 07:50:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
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
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb1:9800:2afe:393f:f9d8:dd75
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async) FIFO
 to avoid blocking the main loop
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: SkvccZKnj9a7

On 09/11/2023 19:28, Philippe Mathieu-Daudé wrote:

> Missing review: #10
> 
> Hi,
> 
> This series add support for (async) FIFO on the transmit path
> of the PL011 UART.
> 
> Since v3:
> - Document migration bits (Alex, Richard)
> - Just check FIFO is not empty in pl011_xmit_fifo_state_needed (rth)
> - In pl011_xmit check TX enabled first, and ignore < 8-bit TX (rth)
> 
> Since v2:
> - Added R-b tags
> - Addressed Richard comments on migration
> 
> Since v1:
> - Restrict pl011_ops[] impl access_size,
> - Do not check transmitter is enabled (Peter),
> - Addressed Alex's review comments,
> - Simplified migration trying to care about backward compat,
>    but still unsure...
> 
> Philippe Mathieu-Daudé (10):
>    util/fifo8: Allow fifo8_pop_buf() to not populate popped length
>    util/fifo8: Introduce fifo8_peek_buf()
>    hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
>    hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
>    hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
>    hw/char/pl011: Warn when using disabled transmitter
>    hw/char/pl011: Check if receiver is enabled
>    hw/char/pl011: Rename RX FIFO methods
>    hw/char/pl011: Add transmit FIFO to PL011State
>    hw/char/pl011: Implement TX FIFO
> 
>   include/hw/char/pl011.h |   2 +
>   include/qemu/fifo8.h    |  37 ++++++-
>   hw/char/pl011.c         | 239 +++++++++++++++++++++++++++++++++-------
>   util/fifo8.c            |  28 ++++-
>   hw/char/trace-events    |   8 +-
>   5 files changed, 263 insertions(+), 51 deletions(-)

Hi Phil,

Happy New Year! Are there plans to queue this series for 9.0 soon? I'm particularly 
interested in the first 2 patches as I've made use of the new fifo8_peek_buf() 
function as part of my latest ESP updates.


ATB,

Mark.
