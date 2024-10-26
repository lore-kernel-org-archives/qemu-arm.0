Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp602961njf;
        Sat, 26 Oct 2024 13:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE40kcaKt8qR4N1gSnmrk0S8fWGLCBqFpgHihp1ZD4ioBKNjdtv5KsoU76FcEEjKBM+qCu9
X-Received: by 2002:adf:cc11:0:b0:374:c84d:1cfe with SMTP id ffacd0b85a97d-3806112184dmr2598456f8f.21.1729972869465;
        Sat, 26 Oct 2024 13:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729972869; cv=none;
        d=google.com; s=arc-20240605;
        b=iXC6S85SFgh6+ve8k1+Qwm1kFlGTY/mIQdR1dMHn5Fah80Vxz+LiKmFit/ZddgEWVr
         1/d5W6cefQYDpwHMKX+7tunH1bDRlP6jE2UNVz9kdkRHznNFKktNdEVM3698Tf8k8DEo
         opcJLDI6SKk3S3NigLZ8ulvrp5qOOMW1o2JYjc5Nk3H2WTJ9G0i3x1e768vlHLWcRSAU
         W7cWzy41KUOIOh6M4QccnEDuQcovwzaxhfadOCj/triflyFImCIgtt3hSe5QXRNYKiXk
         usL8BBblRxgpyFkIfEh/YSQjaNmcTIfHiF2XG65GV0vIFOHfMTb1QfwoE2uIssDPiYdz
         Mm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=E/K6g/UnWol/Tfafqcvo6OLbBoUuCPzVXMXHAGAC4V0=;
        fh=kHj95EMLYt0HmBKY1zw/09ZoHwM0PIxcDXDUuI4kyDI=;
        b=UNz/KofrTIZjkYhkHmIFGb8GOgCp3eowI2NgpSkXtkEAQqVUjzR1/XCjczPAVEns74
         q8azL32Uzr33reiFK7zA+A4/BiRRvBVJ1PO6zXS868jdW2l3tQAQxcdmTdJ06egYG+Rv
         dOgnIsM7ZcEs/XJL1tlV18AL1VlzqMdCy8Sg/6BhyI44IqhHBL9yv9JTKQH9vNPdzn71
         x9sPdydUmGmEcMxZrJfK8erRJiCqjtyMAygVGGLs0HHabPrfwbiYFbE4eoYPMxgFT/Xg
         Xzk/J9AykG1eYRyWednhsssAiJ/Bjw/jjuP/fiM6kZHiEv6s1BbjsvSk7HQL6lSjuPbG
         GDpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=NO27lUNq;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38058b66536si2569191f8f.442.2024.10.26.13.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=NO27lUNq;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=E/K6g/UnWol/Tfafqcvo6OLbBoUuCPzVXMXHAGAC4V0=; b=NO27lUNqkFRVLYwcZH4JGIiPko
	QnhOmFZeUBAwsEcGHY/tnZgO2SRwRum4f6WKDfhzKbYFc+Ixb4YftvC+BRzXjPJC29l9Jdn0mao/T
	8lVwwAm3NorawB7hUQ/h7jcX3qEiF3wWon1YBnmw1By2VKpY/9RDL6MpamlLKJyE+nvvt+9I+tdO5
	BgbM/qZ3qLuqpdzJvQOtHdwangNsrE32U9CfKoCfjLrclQuH+uKMl1TwvorWe4YNz+cCh8KQqLjIy
	DtzpxCs+V71zRDjUOflMev6WZdUBg7thQwY3KS+UuTA5NDWikwoUPkxMZAn4zlsSHoRpJYOn9CI4q
	wb3z4Jl+IVbu9yjz87M6JzLj6Rn3/BuV9Frr1a6DaxdH2oZc/IF4s9j4uEonh0FBcIkVeRE9Z66ye
	dR9DiYSnX8+EmSJnZN33vp9mknldQfdn2vI/pdcxYhLn/TDT39dIJYliDV5GqqtA+PoU8rIvAC+5t
	8bg2AAeQeBr8y4BXWU34LRNhGN2+EKQC7RXhMCHSpiWKCw8Jw3ea4vAzOs4uPyX6M/3cRzX9Id8KE
	IGNdGRIlQShFIFawq7gUk69LgQpvYAHd5d2eN14GElzpFjszwYRq2B1/wPawkXZWCJxNAIroLze4y
	XBEWY/6a7BkHQYQuVNXkstWwjKqqYQ/nNJQHAcXSk=;
Received: from [2a00:23c4:8bb8:f600:4f5e:5d86:d4a2:613d]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1t4mxn-000Aq6-OZ; Sat, 26 Oct 2024 21:00:47 +0100
Message-ID: <24876f04-1642-4bf4-a103-bf66ddb59a98@ilande.co.uk>
Date: Sat, 26 Oct 2024 21:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-12-peter.maydell@linaro.org>
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
In-Reply-To: <20241025141254.2141506-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb8:f600:4f5e:5d86:d4a2:613d
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH 11/21] target/sparc: Move cpu_put_fsr(env, 0) call to
 reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: WI6JYvukSNSA

On 25/10/2024 15:12, Peter Maydell wrote:

> Currently we call cpu_put_fsr(0) in sparc_cpu_realizefn(), which
> initializes various fields in the CPU struct:
>   * fsr_cexc_ftt
>   * fcc[]
>   * fsr_qne
>   * fsr
> It also sets the rounding mode in env->fp_status.
> 
> This is largely pointless, because when we later reset the CPU
> this will zero out all the fields up until the "end_reset_fields"
> label, which includes all of these (but not fp_status!)
> 
> Move the cpu_put_fsr(env, 0) call to reset, because that expresses
> the logical requirement: we want to reset FSR to 0 on every reset.
> This isn't a behaviour change because the fields are all zero anyway.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/sparc/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 54cb269e0af..e7f4068a162 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -76,6 +76,7 @@ static void sparc_cpu_reset_hold(Object *obj, ResetType type)
>       env->npc = env->pc + 4;
>   #endif
>       env->cache_control = 0;
> +    cpu_put_fsr(env, 0);
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -805,7 +806,6 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
>       env->version |= env->def.maxtl << 8;
>       env->version |= env->def.nwindows - 1;
>   #endif
> -    cpu_put_fsr(env, 0);
>   
>       cpu_exec_realizefn(cs, &local_err);
>       if (local_err != NULL) {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.
