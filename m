Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp860952ejs;
        Tue, 9 Jan 2024 23:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM5EXOcFQx1qAI8o7A+IXzTNT5++QTQD9WUOiqsP5DKrtjytpD2mqJpqbysrl1TXf/Z0WI
X-Received: by 2002:a05:600c:1e89:b0:40e:5059:9c4e with SMTP id be9-20020a05600c1e8900b0040e50599c4emr275761wmb.65.1704870304654;
        Tue, 09 Jan 2024 23:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704870304; cv=none;
        d=google.com; s=arc-20160816;
        b=fr4sIjpM852N1c/cPUJTPipGD242ZJMotth2/sANtUtfNMRNbDu0e8ehjshurBts6F
         XfHv1vw3Hz4YXTibEtxfNcfHDvPDoaaOtNkym6A3wHE9W6OnfMCfmX+jT0UxqTWSm6vP
         jJErju7Ty1uwI1naPMpuHVm1dD8/6woO1Y5r0MbtKOCBysBCsDmJiHgwgWjBZ5voDT+A
         iRB2DDFDaMGvckkZvnmv+qdk+SnFHUIlKZowuyB2WF+HvSfjQGSkA2V6f5d1yjd4k47A
         AyjWwUp8trq4YtnT8/OtB6adAhJlNdKs0WAsLc9mP0lW1YLX1bGXtMnBLcXP1gLa5yO+
         wHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:references
         :cc:to:from:content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mWov6SjLzOWE5RpHEnMMvpt0uuKxigxvA15kPD+FN8Q=;
        fh=iAm5A4zWGUYFq3Jtozfiktm/oazx9RljWkTzR1zwPVI=;
        b=pAg/cgFUzQizdB1PVBVhqnzZvTOeRTyRdxcthJ8cUzuS2MR3ibzv57MRKC2mU/Ot7L
         I3ur6mnWbBEB0OyCK4XrrJHLMxc0DViDtMOSPQM0nSwsm2L3LAtVNuEiFG7UifJ/FbqW
         rOnS6kwnBEVBc+IhswBuTYcf1N47oddcqa+146bCePzosUhZzDH1tf9eFGJ9rMjOGEY0
         XIAi1+76TxSDtGL0tNspY9zg9pESdbimgjDDxAN9FWW/TkyHAT9VfIriWbQLrJTjavuu
         ap5TjSwPPO5fMPFESxzkhHmaADWid+FEBYBU81fvsPkLuQF65N0uOdHUMdF6AjIVFAkG
         fgiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="dv/urBvp";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id bp21-20020a5d5a95000000b003362a448482si1780834wrb.0.2024.01.09.23.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 23:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="dv/urBvp";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mWov6SjLzOWE5RpHEnMMvpt0uuKxigxvA15kPD+FN8Q=; b=dv/urBvpQm+O3BJVQA7w56aoRc
	MPFP1kSpeQCRD5cVYocUVOPqFG3hxic0yWKzSFAXGN6jK/g5HplQaBsHcjOgUALuv4ilM9GdzgBfM
	wBuER6LXmhha7+Fj+U1Ni/NXXtZEANkD/usQaziTKOONcYNvhEcbFIrJdf0EOZgD6u+nFbAAtRkFp
	Wp8RlULdtbBvfjBIO8kmu9w2IO4w4EHZPC32ICJCn8Kp/ylEq7u+S2pf1AExoQ30j7HNXuDjqxDQ/
	w6Bwqjl4XgPEDFPKUbEYGcoIwOspU/26JSza6RJ3MvrxPs4E+dOssfqn9k1PzXF7fnx6zK4FEidxB
	hUjnFuPKJVKKP5ARMWnsI/nfJArQeg6V2zTGzNWxEl7wdvfMEMBoCahugD7ySMjgclPAhStTRu2dj
	fGw0lv27ZvrWf5r3BiAV26JsrqmlBnmB3oOBH3pbvJMyXUFQccProZEfaxs6/7tkSEP2lYp3+N1u0
	S+zNh1W/yJUezX2zq73m+hYa3SEuHZAKqZspV4nIXlfxbGNblXcspombBQNOETh/e25I5aeXZ9Axi
	6NzEjO+SLbvIcXWnc1zA04sUfhOe9XjaaY8ZvxHly8O8pzQwK2+l1K2evoEKjIHqZfGMaEpjAjrQ3
	QSSDLJmTUWjEUJBVAaNb6RzbpmB+m6EPT7Vfo1EVc=;
Received: from [2a00:23c4:8bb1:9800:b804:1635:e423:adbd]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rNSde-0001WG-1V; Wed, 10 Jan 2024 07:04:34 +0000
Message-ID: <3a1ba17f-2bfe-4639-8527-a69c13290f3b@ilande.co.uk>
Date: Wed, 10 Jan 2024 07:05:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
 <525885a8-59f0-44e1-b210-0b4bcbbe4258@ilande.co.uk>
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
In-Reply-To: <525885a8-59f0-44e1-b210-0b4bcbbe4258@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb1:9800:b804:1635:e423:adbd
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
X-TUID: tZKovduDRxi8

On 05/01/2024 07:50, Mark Cave-Ayland wrote:

> On 09/11/2023 19:28, Philippe Mathieu-Daudé wrote:
> 
>> Missing review: #10
>>
>> Hi,
>>
>> This series add support for (async) FIFO on the transmit path
>> of the PL011 UART.
>>
>> Since v3:
>> - Document migration bits (Alex, Richard)
>> - Just check FIFO is not empty in pl011_xmit_fifo_state_needed (rth)
>> - In pl011_xmit check TX enabled first, and ignore < 8-bit TX (rth)
>>
>> Since v2:
>> - Added R-b tags
>> - Addressed Richard comments on migration
>>
>> Since v1:
>> - Restrict pl011_ops[] impl access_size,
>> - Do not check transmitter is enabled (Peter),
>> - Addressed Alex's review comments,
>> - Simplified migration trying to care about backward compat,
>>    but still unsure...
>>
>> Philippe Mathieu-Daudé (10):
>>    util/fifo8: Allow fifo8_pop_buf() to not populate popped length
>>    util/fifo8: Introduce fifo8_peek_buf()
>>    hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
>>    hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
>>    hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
>>    hw/char/pl011: Warn when using disabled transmitter
>>    hw/char/pl011: Check if receiver is enabled
>>    hw/char/pl011: Rename RX FIFO methods
>>    hw/char/pl011: Add transmit FIFO to PL011State
>>    hw/char/pl011: Implement TX FIFO
>>
>>   include/hw/char/pl011.h |   2 +
>>   include/qemu/fifo8.h    |  37 ++++++-
>>   hw/char/pl011.c         | 239 +++++++++++++++++++++++++++++++++-------
>>   util/fifo8.c            |  28 ++++-
>>   hw/char/trace-events    |   8 +-
>>   5 files changed, 263 insertions(+), 51 deletions(-)
> 
> Hi Phil,
> 
> Happy New Year! Are there plans to queue this series for 9.0 soon? I'm particularly 
> interested in the first 2 patches as I've made use of the new fifo8_peek_buf() 
> function as part of my latest ESP updates.

I've spoken to Phil, and as patches 1 and 2 implementing fifo8_peek_buf() have R-B 
tags he is happy for me to take them separately via my qemu-sparc branch. I'll send a 
PR with those patches shortly.


ATB,

Mark.
