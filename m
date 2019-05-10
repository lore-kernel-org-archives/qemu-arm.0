Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2125604wrh;
        Fri, 10 May 2019 07:58:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4OpiZjKHKUuPwp4PrB5ZvqjtONRYjgur+H6t3yQQmY4WwSV3BuiL5gAtgsbBjOe8k0IDx
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr7327821wmj.139.1557500287227;
        Fri, 10 May 2019 07:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557500287; cv=none;
        d=google.com; s=arc-20160816;
        b=p6t3zSy2BlOByiuqY1+O4qdAG4SCyVsJoGvT+za3Om1ekyoWtI0ndjuTV0KJjGQ+fF
         TJzoVR6XgDs8wE5s1erhVs5OBBiBXTWcz7lhWMYuROl52HTA+ArKMcNEBOXKIpw7nahm
         8rCrhsxDiEBH7LvxffXjXvCvgdnkA0nVa+ZD95M96AlXQyWu+3bhZioLfMF7LrtdMBnX
         Uz7Jx4mZfJg3rtf4y2KCscN2boXd6nvsAsKsKSpwDx98g2U/bTk0EGekGTV+GCm3XJb0
         6Y8AW0ykhh5p9Vjj6qeuAC3tY1qGnsJOjJkegOXEpyhNnK5h91xd6JB+CIjpZzOletkG
         oPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:cc:to;
        bh=twjt1nHU6pcp9UhD2kGiEgOEqfamfCOWKpyivIErHxY=;
        b=P1dvViOMNRwu0+y4whlj+Vlw8Zyj1LrmtGuduxJyKNIV49UiUzz+O2Uzf4haU2Tspa
         f5h2xHkFoisJqGStw+RLEYV4MTDM7Evoa2QKkGLck0eZdZ4JSUWIPICxrcY2sVMHko9l
         AVPxfKVsIBy+o5lA8DpF6wNiXGe55gmBckITPYhYmYK02yi1sHQhgR9TEBcgpM+s8N6t
         mf4jzXJK4/qTsKkHg/C5pjJ7m0ljHfK93H8KLaLzbqTjaAJlA/ntDbf1kGM/J/r21H0f
         I/uwHjhOXfn1baRsAm/oOMOgdOmRRxuTytU2oKlN6qNGODH7cJT3RA4wgzqY9/3aJSIe
         JrRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk. [46.43.2.167])
        by mx.google.com with ESMTPS id c193si3771218wma.194.2019.05.10.07.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 07:58:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) client-ip=46.43.2.167;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk
Received: from host109-147-184-225.range109-147.btcentralplus.com ([109.147.184.225] helo=[192.168.1.65])
	by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hP6vZ-0000gq-89; Fri, 10 May 2019 15:55:13 +0100
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <87muju4mvi.fsf@zen.linaroharston>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <98b34bae-c62f-8195-df93-80422ae2e58d@ilande.co.uk>
Date: Fri, 10 May 2019 15:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87muju4mvi.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.147.184.225
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [Qemu-devel] [PATCH v5 00/15] demacro softmmu (plus
 tests/coverage)
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-TUID: X0qmq/+LxlmB

On 10/05/2019 11:36, Alex Bennée wrote:

> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Hi,
>>
>> This is the latest iteration of the softmmu demacro series. The main
>> changes from the last submission are some updates from Richard.
> 
> Ping Emilio/Mark
> 
> Would you be able to re-run your tests to check there are no other
> regressions? I can then get the PR prepared for merging ;-)

Hi Alex,

Sorry for the delay - I've run this through my complete set of PPC/SPARC32/SPARC64
test images and no regressions as far as I can see with this latest version.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.
