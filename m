Received: by 10.223.197.9 with SMTP id q9csp1597482wrf;
        Sat, 14 Oct 2017 02:58:04 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD0o4DmT3QJnGB7UVMN4seJC+z+Oe1VzzLUEtwP9WnZLwUbS9Sfpuj7EHd67KxGrkihyLH0
X-Received: by 10.223.198.130 with SMTP id j2mr3756929wrg.52.1507975084857;
        Sat, 14 Oct 2017 02:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507975084; cv=none;
        d=google.com; s=arc-20160816;
        b=JTjz0QjT7HrrqDEtJqEJy/Yxc595tG9kQnaBWi3+e1+0shR3WQLYlkBK2z8H9VSvFc
         aYdI9G6xobqGUituGx0xRoaMog2obxr/1++kRRg1Wcb92PoC6sFp9Zr7Pttq38LAOaQw
         7nycRijdp9qVDDQSuQQZ3zT3qrJChe6ALT6oevOuB854+ZvuIGAHX2+fS5QFM9Kq6z6v
         7DMRsoMdik01iQ60hJ70rMaIgIzB3zUrG9Ex9ieswXQiS9utg2h1DmqotH422/ZPbRz9
         94o4Ilep3kLsxIe9wSu8SmyA/ozis1peQrJzY7UH9YJxhWhVflLbMsaUxkRdq3TR8NKv
         2yVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=G1IcksUDf8hNG7x+f0+8ZFYhZPjGyHSy5zpIay7/pWQ=;
        b=TKf2yTmeeDIThGU22eu5PcRxNN2a+8qgGm9DL5xgFagMMvcxv+db6bMhHXmOfXLLtg
         kFtIk1+Vu1RMGeifpKslSvyrxfajF0yMaxHgtk3d/+IUkWWWpX8qfjiulCqcvSEN78iu
         c3jb433Rgqw349abCAh7kYUZcBmiEv+N7Am7o1wLPWs9G03wDmsSKl81S5r6HCPNxZAv
         TdX2gvTqUw3HtI1EV/jSisnnFwpMoTHpgEHG1nN3ksNhMZgGnpmPu/CtRGfvSjROfH97
         M0idzGeIW+JZ1XOMdrGw03YZgifTSzxwu24LRfKX5aRe2vb/4Xqtb4r4R13JIj1a3BSs
         Rg8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id a12si2209704wmi.204.2017.10.14.02.58.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Oct 2017 02:58:04 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue006 [212.227.15.167]) with ESMTPSA (Nemesis) id
 0LZYSm-1dOUjP3IZ2-00lUUz; Sat, 14 Oct 2017 11:58:03 +0200
Subject: Re: [RFC PATCH 01/30] linux-user/main: support dfilter
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-2-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c0988952-236b-a31b-5d63-bd1f0642f8dd@vivier.eu>
Date: Sat, 14 Oct 2017 11:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:YIJp7vTjqb41YfYGkf03yPfLNAsYfJfXYf8vRAlPG0Russ9ka+M
 W4DDvoQpYjCIkTWkgoD/v9Gq0sO7D/zEIfFTkOXCeZIMkLd33Za6Y1mo6OhpTR9DvL2pTJM
 qqqEpYT0DErQTeRvyq34Xm2AbF7xg8N/nRSZ4PRmtQQ/6LHEPAXIAYCV5NBwTAHA3li1yeo
 nDcEEAgZ00livGhkH5m0g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:1xe6hOuf85s=:i65uOvcJgEyQyqsCPLkAEa
 sock/oMUPsc95re+XBIOhu/HIk+kt8zQVfe4Eko8yfSbxO3A8vCKkbUFeDnUyqix7y7gu3dGu
 UbN/sCMzpolJoaMFgWnL+nbGf3quKP/KWMb7ceObeF97YNh6uycUBp6iLuLmABMJsveD69lGp
 /iH/hfLeXenSfxezT26JalDhDj5Yp6vnyMK7JEl0hKNPa3W8xeTTkQDaERKKreEBODIF1zJG3
 Q0IQkKPZGXeUh2hrPtAmElBbagidJ4uNiLnjuCuRYG2qxsbhfsJgNjfvfEr06kYD5FIVukyji
 6d8E++ksyH/kWP3w92TXbvzgM3TJBOo38phyhupNgKWvR4MXG/X9UD2Pxr10OD0OEGre0v67k
 shsFJZ20y7too3T2OESlGOxnW5EGg7ADevilvxSah7CZmm/TXe60asdmfRieimKPoi6OsFmq6
 +4kGSPOMlcolT41WBBxxIipUR0F2R6Kqm5ji9mySp4h+RITQHcylYVsMNa6Yt67KOL8hrNcTT
 nDhzlXUvbv/KjZS/jDhHIFgVy2Bh9IED90QhiV22u9sUsDoikfqaUfHKMX7gCQ6xQDZfNZY8/
 o/yitNHo05OBq19KGipoSslym69+S0OTUxUEj9MVqg629CuhUB1gK6mo1HjFOALbWDLsc4gcb
 56roErn/Vlf1WU5SmlZt8ZLqfvvRYGU9u8RY9p6ypyelpSN86+85Nty2xoTG5RXRU5jdc/x0Q
 /RvaMRX6oF2MrwaXhyHUlcRrQDzLr5LQRUxt09w33N3wocW9CUZmybNOWXY=
X-TUID: oqzv7fGllGKc

Le 13/10/2017 à 18:24, Alex Bennée a écrit :
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 829f974662..5072aa855b 100644

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
