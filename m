Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1455972lfk;
        Sun, 23 Jan 2022 14:02:52 -0800 (PST)
X-Received: by 2002:a05:6000:1184:: with SMTP id g4mr12256174wrx.278.1642975372726;
        Sun, 23 Jan 2022 14:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642975372; cv=none;
        d=google.com; s=arc-20160816;
        b=eR1WtWGhBB8phrADnoCT0v+R8pHBXy9sFP+1YS7555nrMwA/9/oI/b6esDJvLXXN2c
         FKeEZfvKbNRSZY21e51QnILpQ72Qm7pR/JMzC04Iy9oywvNKpwCuhdlM3Y37DI0wivPx
         pB/2uM596J7vnEbo51x7h7S5KaJgSypLx9U0o+9eWupcqbWDdL7JhbwYLXmluM1tq+mu
         pYCQVtjqZ6YUoR4pbLorz++6kH5ZIGnKos4byiQxAE97klIc4Fx0wPpGTNCFqhqX8XFd
         kfw8hCAN5cNludVukHLPO5tmkX5AQs8ma+H5MM6F2PWrw3xNxlE89cenwUuGCLbhoQ5W
         U41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=paYB/Q6sHWbMlBy+KJX/aC9uubIuJQ3S5lxm3HXEaVA=;
        b=llXfwBTOkyHUUJXCUQXws7VD+dR+EtnkV/7Of5aKPZWeWyNuQZlLuWrreDW4bT9twG
         tiltTrXEWTr4tjVAIexEI8MzPVgWd1IwmnZ2okmjRsFdPDIAztug/DLsWZqVR80/vAJj
         E2nKididNmf7wZJzRAwnYjq5X5mNS+Tjh2sIWJ0ySAfVgaCNb3fYUTZ1/3OI84VvaN5A
         ZdrlZ0kmJhmYsSBI5yAX21WVW9SaWFWZEI43zbcLYjCrYqtjNmuOsOfpDei1MHt90+2g
         AbFVvMphDU9JyokHqJNVpw8qiTgDjbwoxAFUNbOnKq0HKSfdYsPsKf7+Q0LFCPCQLYNw
         Ru7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Wo/R2WR4";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r22sor1598799wrc.38.2022.01.23.14.02.52
        (Google Transport Security);
        Sun, 23 Jan 2022 14:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Wo/R2WR4";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=paYB/Q6sHWbMlBy+KJX/aC9uubIuJQ3S5lxm3HXEaVA=;
        b=Wo/R2WR4RXXpZ1+fcFEHtR2TwknREtgo4wh1XKi1msmh1tqgqECeVANs0pd+XHb+cX
         3vDUx12+T6bIDcMlAVXlvZhgVOxnPJvN4MxPqc26UloaHm/b9j/Htd9v/sZescyYcFTj
         lBkaH00fllJy49Ov0nOmizUgTx1sy1X4xYN8HxKmUv0LlnshYCappq0PemfM0gcE8Ytn
         1gES6xSBeJnaL11kB8AVcyzEya5jzuhBVh3PYW3gVaMGUorMzQ9/1KJwTQ0AUxWhE/Q8
         5tcquOOU1evhDyIfbOQkqwvFzzudrDqXR+wVVj/O2tW9UPHU24jWsNE0mETeVfYQ11QP
         cs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=paYB/Q6sHWbMlBy+KJX/aC9uubIuJQ3S5lxm3HXEaVA=;
        b=joqlw+6B5lOz23D/vo899V6f10VlfKJ5CRxAlBtfKNdyqYYfs0GIEl89bCOTSJGoCt
         +HadaQ2Eg3ShEC5IImpZnKpQhXwfkXMD2uanjMdwVw0iezKQlWYxHVG783waFDPVrbTX
         E3Nb1qlr2emdTDcnUiiWQYK2N2LOin3nfCzfLtjzF6mpTS+mge39yz1Un6I9nJhk7G6Z
         OARy+Hx6tA9vZdKgtp9ZuQMk9SBpxSWwOIZmOmkdO3KDko6uuTojK3xCcRbTC/IH47Da
         egDz1Smwjl/Y+ZJC/R6atgJnyNnCauALUJ/IYNrvMXLwIE/Wxgdpdm4CMpVL3MpmvWcR
         Ys0A==
X-Gm-Message-State: AOAM531PFU3GBCR+QKU2R+BzYhQ5jQzXmFjyDUr+fbLcGP2MpcHtIncU
	AwQgcKUkesb0IeC+kpSG9h1GLCYrXAU=
X-Google-Smtp-Source: ABdhPJzL9zSAcEXm4mYos6QD9+2YiqhSHQDMHYFpOfkW3G5QjBjIjlPm1cU6IUUxxWQjs5gnSXRhJA==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr12500828wri.695.1642975372188;
        Sun, 23 Jan 2022 14:02:52 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id r8sm12511102wrx.2.2022.01.23.14.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 14:02:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <781ffad4-5e25-73bc-64b2-1e66ae5adba8@amsat.org>
Date: Sun, 23 Jan 2022 23:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 07/14] hw/intc/arm_gicv3_its: Sort ITS command list into
 numeric order
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220122182444.724087-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1/8voOw15U1Z

On 22/1/22 19:24, Peter Maydell wrote:
> The list of #defines for the ITS command packet numbers is neither
> in alphabetical nor numeric order. Sort it into numeric order.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
