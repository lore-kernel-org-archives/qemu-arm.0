Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1376191wrt;
        Thu, 13 Dec 2018 14:52:17 -0800 (PST)
X-Received: by 2002:a9d:69d7:: with SMTP id v23mr545086oto.96.1544741537816;
        Thu, 13 Dec 2018 14:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544741537; cv=none;
        d=google.com; s=arc-20160816;
        b=bqvsuK2WIHh5vCM70vqzwsW+pJb1VqDvSXaaYORHICeFJtnrA6Zh2BzntsynaFs0+D
         g/GLach6KDCDBX1agMblhI6q4aQL+fkxfe22Yb6LA+BV5tZTfHkJeP7xKD1eLlgvxAX5
         bG/DBPe0IQc3N01INHXukpue5l3H+IRGqatL7p9hmaUSAQmam3nB8dDXUAjamLuEajQp
         WTEWlGOFdi6GJPALUOv8iySw2xXA2CaoDToDVw+FV9ZJ1fQ3DUkkDMjL4dLngt8+RJLE
         +MJ1uLhIcdPFYdNHQqswkSA2XOqHC3bfrjYMjABbul2lTOV1f9+ScD/TA+u8oSTEcJki
         fTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=kDXQ33LeLJk0bGNo+/dJiH8gmsvKyX5bw+SpjMlsZNA=;
        b=UUgKVPuGPmiQv5NnSjRhrSrKy/Kj2EaNgChxyWmwNjD3Z3d+PZLQY8S3rrtxBh0jRq
         B7bUfwt0NQxBNhXqKaoeV4qypObSiK1J7iVeky3Nugm6tjPDAwA/WGheGVU99sDV/aV8
         WuWmXai/i14HMoHbYqq8U7cqTKpMfydsKHciyETeIsSPCu7T/j8LxgfGBnqLI872d8ZS
         tDXsV3x+UeV4lnMt12Q2Giod59i4dmDODDwKexQsHDUMd9Lqgb51AZuW/ppGfMiVF79C
         G2joB3d56KNaUN3g5qzLhoFfafQGVE88KHfxqzuKwa9DAvolb38hJPXDUpWFbwYVOrVk
         M+ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=I6nBoUKH;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x206sor1576991oig.63.2018.12.13.14.52.17
        (Google Transport Security);
        Thu, 13 Dec 2018 14:52:17 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=I6nBoUKH;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kDXQ33LeLJk0bGNo+/dJiH8gmsvKyX5bw+SpjMlsZNA=;
        b=I6nBoUKHQsYZRlbDYW7waP8NQBnDRY3JOJ1OirsXDnzLhMQsnWsNheIjIxX4vIzOFy
         48sofkvQbYPIr3GZMuusplnrshk2NaV6K1r+z2VpaCl/wwZGsBPs/7qrAixhSnzLDfCF
         ZQogmH01MizxNdamzMXgHPRkS0C39PEk4d2iG52C8hDUxFJ6RWnw6ykOb1npN6YLF7j3
         3MQW5Z/QWWP7W64zp6qi6oRmxmuXF8A8XB0xmhX4lykYd9xos26OPTevvRmHCnFPipjW
         9Syl5Q9QHHS4llCsjQGiuPD1e4/WxSA9bNrjdzK6WKjkg52egRMMZiiTEqW8IbENPCKF
         Wv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kDXQ33LeLJk0bGNo+/dJiH8gmsvKyX5bw+SpjMlsZNA=;
        b=Js80SK5TIccF3gqps2G0uCwwXWhPAU7ieULmjH1Od/Ki5w9+raQbJXTsMXlmDS3+CG
         HjiaY+OO7I+FiUq7gRdSkYj/kJiQJ2i5dLA+z5t1PLEA2RW7bgbmGEZzdoLWH7qdqSSD
         xF8j2NOR3JPHfBpP3+cVner6lfwcrFaKjyuyKg+0v4ilQtb0GpqormT7ZnCDIfBVtzVO
         ugiB/QsNtkf7E88s9HoXUc8go00OZx/4wcBwuu0NQr2g96nldoKfk1GxhqdVeLPIR5EW
         wKmn2PGH5GSy/IVbtyNetn4k28RJQ6MJ2H6rvx/CXQqZvdrhDheMG+cgU5kmxoGyjz56
         Oj5Q==
X-Gm-Message-State: AA+aEWZSCnl+MNDt3kpjR6oEC3h9XT04IHenkn+jYnaa38De7wH4kgun
	wk/lehaxBzccHYDiiAE1Dx0=
X-Google-Smtp-Source: AFSGD/VwH3KqxcGJXWC56xrUQJX66hlXiuFfYYDYuT6j/EJNrUE90+ARFRUakk4F3MrhbLMamt7MRA==
X-Received: by 2002:aca:ad53:: with SMTP id w80mr422680oie.148.1544741537371;
        Thu, 13 Dec 2018 14:52:17 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net ([187.217.227.243])
        by smtp.googlemail.com with ESMTPSA id 52sm4561655oti.30.2018.12.13.14.52.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 14:52:16 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a few
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Stefan Markovic <smarkovic@wavecomp.com>, Jason Wang <jasowang@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Fam Zheng <famz@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "open list:bochs" <qemu-block@nongnu.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVuQENBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAGJASUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <36c3564c-76f4-b306-e74f-234f16e62aa2@twiddle.net>
Date: Thu, 13 Dec 2018 16:52:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 5T9w08y+g4tM

On 12/13/18 4:37 PM, Paolo Bonzini wrote:
> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.


Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
