Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8158773lff;
        Thu, 16 Jan 2020 02:05:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKj5aSynS4fJh4YUMlCRBK9uoNRu+8NXASRFXKesUvW9dRSTguHKsdN7WYpMseAz00vl+w
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr5284198wmb.162.1579169159418;
        Thu, 16 Jan 2020 02:05:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579169159; cv=pass;
        d=google.com; s=arc-20160816;
        b=nEhfAsFwk3Pav4Vj2R0UwFCFMluv9nA8yMo2C8Ln3pWG+o87E/t2Go6GBCgnXr8Sms
         wwCLnKEzvRcw3usl6zFvpomSJsOjX8aFzZSLJM5gAXLK1NHordKeQ87DIQu5t3M9AO2x
         OoGrodNDKZm2LKt5mZEb8EurYjvSo6+UkSz7Z7QpMUzshNM2kaNiFXQIrU/szO5W9FSv
         cu+uSpiveKX5bBpPTfU/WojCFcLrL9IZOOb+zu72k5YP1bPHMbdkt8Hbo7qwzI+yxIgk
         s5I6wcs2AKVSDu37gn5gMslZ72MRPvREgKvLLQgi2+HWlAJCIJdp9EN/fkJ+kVZ4g/VR
         hplA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=O4hZuZViVzqK2EGV64oYWVx94KmetHRPNAceptOPVIk=;
        b=juNhiaF5cX8J/6VBBzwMei+Vijgp+ADJmJzx/JCtIlM42IWkRISRF8zczDIzJ8G9kA
         Ug6+TkHmNbxA82PTWgfsvugEfvmgTR1y87jdPbAlnQw1IDkZxjxs5LjuYAP2Jf1PX87C
         PWL4tYJHM2iJJDf8m3UZdZAGakE9JoMH5338nILT8dn/IlfksgAwIPBeRZj+e/NGjklP
         thHK73jGvGjCn08Zvq34yOQvyECdDAEt3tNtJGNGggoCQqIGl2GyYlhHNNFlK8K+u+4v
         C+z2ViYANvReZSY1VICn31y6IYzz9r5WY7/FAKNzNYvZZOb8kblErpnCyXNNPf08FYsQ
         SBBg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=KO1j7I49;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id l10si18285777wro.375.2020.01.16.02.05.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 02:05:59 -0800 (PST)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=KO1j7I49;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 5EF8B96EF0;
	Thu, 16 Jan 2020 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1579169158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4hZuZViVzqK2EGV64oYWVx94KmetHRPNAceptOPVIk=;
	b=KO1j7I49TqTJcTnscT/tDUqFuJSxTNDPnwPEtzSmRabaZ8PB12Lzj0RT39ZyKCKtK/oez6
	TPM8nct6roY1c2rI2sAgtJfN3hs8RHwZunuRGKnscTq/6sc3yw9RhSHV9dE4GrXrwvH1Mu
	k7s6NPSJ2AzwDleetgrPotj6Y9uZ0QQ=
Subject: Re: [PATCH v5 02/22] gdbstub: stop passing GDBState * around and use
 global
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-3-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <3a12e209-2854-9fb2-f310-1670e6b1f56e@greensocs.com>
Date: Thu, 16 Jan 2020 11:05:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1579169158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4hZuZViVzqK2EGV64oYWVx94KmetHRPNAceptOPVIk=;
	b=XIY4wLshh7KWlccb4IZbweRBTf1Zb4HgcW1UZl1EHTFOu9/BsBmJ7ku0C/NVldHPyvoAsO
	J+4Eu79eKgSusv/AUrYRYYSkN9ceai3uryprXG2a+WEv6Ia0wsj/yPQFG4akfd0xOD5UIX
	xkV6M4Npwv/sg+m5eTzS6AJQ0Pof7SQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579169158; a=rsa-sha256;
	cv=none;
	b=T7azZzJh01lkap2w1TSV5AlKiukdx5BLFGmFjHasQeZ4O7ghfuF3sQxTT3eYfhS50yFUSh
	x+T724Xypci7eMdAk7Z7IEYeeB4sNPQpM0sFcv4Z4CYkIBRnQarjx+GHcVjjbD/70AzBBp
	YEAsiGf9glMKQ1x44Ps4CoAtZGBFlko=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: sVRadPJxOzno



On 1/14/20 4:09 PM, Alex Bennée wrote:
> We only have one GDBState which should be allocated at the time we
> process any commands. This will make further clean-up a bit easier.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v3
>   - remove final *s paramters from function calls
> v4
>   - a few fixups for coding style
> ---
>  gdbstub.c | 561 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 278 insertions(+), 283 deletions(-)
> 

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

--
Damien
