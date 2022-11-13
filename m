Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2341324ejx;
        Sun, 13 Nov 2022 11:43:09 -0800 (PST)
X-Received: by 2002:a05:600c:3b03:b0:3cf:b49e:1638 with SMTP id m3-20020a05600c3b0300b003cfb49e1638mr6165080wms.50.1668368589056;
        Sun, 13 Nov 2022 11:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668368589; cv=none;
        d=google.com; s=arc-20160816;
        b=yCXr2IgWTA0zhFbxAum+rcx5W0itYRRGRuJetKGSTAIpbrUofIsk1iNBtKUjA3bSI/
         TvZltETGykQOruXnKOzYY2uG5GjtzDrCjMhATY8s/bVbAhmifYvqYWoRYoyUrmbJiKIF
         4wGidq608gg5SMKZkVKISwnISwjrXvYANRyKmEYhDAdGu2IjCjkz7uG3rwH2X2MrJMdc
         McWJSRVwZLW9h4cFI70hBG4gPhPFFy5znRrS+GlWPBbMz/lf3q3ltyCBiR9k85ixSRm6
         oFOWhiJEZ/3HS4sn5ToGS6TdvhEDz1GnQLmv+bO9SJSzABeiZMJ6vW+qL6GlqYA19OCr
         /GjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6L9jPYcz7ct8alLyJuxfORWnDzbFO03+CMn7zI/QyvQ=;
        b=Pb0VcnYvhLQy5lp67gB6hXJvheNedcCmmSWly+OFjkIL2rIulop7934QZPe27HPSr3
         1OSTG3rg38V0Tz8aFnIihwFpWbXRusrt73HCwxsuXkgRYHpwgH39cLC9aGj0JH00DeQr
         o93FPQLJI71zTvroi3MQY5DLfO8DrJ41/a6zxKytgRf5r86QKCQLNPvFGZIqUZ1kqF8U
         Qr2KImZR8SpRj0n66+NBbBERUIcT4WZmJCWp+co4pe2Dbg/aYeAX4E3cgb9NxwLYXLMr
         jVzIEaS9vd4b2AwFCJfogspgx3VboX1Jx3IGFwHY+FHAntcPYSqACJxiROkxM0SNo8Ze
         bhbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxq8DKOR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c12-20020a056000184c00b00236b52b19dbsor3283664wri.40.2022.11.13.11.43.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 13 Nov 2022 11:43:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxq8DKOR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6L9jPYcz7ct8alLyJuxfORWnDzbFO03+CMn7zI/QyvQ=;
        b=vxq8DKORJrOWTw7xsAduMLfKii8CMJHHUvMRt6USZEfjHwChqcAH659rArQnc0tMR1
         Mu5P1mWjn6+jYcn+DUhxQLMTm1pqFcnhyrvmRij00/lBWZgAvcyX1K1XaGot5Vox4oSv
         S+MQMXOb19gLYizz8suTL0JxmpWY3ilaYk7IcHKTxBXo8QD9bTEzotusOlfAgkZkKuzh
         b3vPbEvWfr530LIk0kFtUKs3TA7eTjkkQ+0JSrPp4H3DdEjxgPTHn+nG7P5wAA/evOJ5
         OwvjqM95P3whwxiAX0b1RDwsWgdapnjOOji8RD5nukDrhRZxYY837jqz230YUoz0GbmN
         s3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6L9jPYcz7ct8alLyJuxfORWnDzbFO03+CMn7zI/QyvQ=;
        b=Wu6RiTX84A+QPyRPWvIV79Wztp4VlwgqOZw9Hk08L6GNFUVnMOZmMqf4OH5SV+zket
         8qxZg4TxCZPNqF2mkuirt1dX7iDpRuTmnwLhGTulu9PXwxNxabN1aBkDpskaDo8bokyX
         xidvecyTm3AA7+xQ30dPPjnC1D75JPq9zedjlF5N9SRBpWQtNush1RIWB/veqeFmdH41
         ItWIqJAsoaC9dpqRV6R018FETXMWhp+45Z1/vhy12Y+U7P5Ij2bFAsKBjOoEH6xbF8ja
         oJ6J5lNuecodLNdarT30qgx297b919ecfnjEpQScUzTRO5EnJLOfNy/uiSkU+yzdgO7P
         JfEQ==
X-Gm-Message-State: ANoB5pnhzzjAQbtT+7P/FLgipdo5btuEGvMokw2z+KD4osXBjNtPc5n+
	9bHIa18hypztU3mqBF29SFbvampzRD9SMuIkW94=
X-Google-Smtp-Source: AA0mqf4aesVuJ5L/Ev/ZKMy+Gf/W3Y04MQHW8aAxVj8OlhPr2GXnHf1N0KqhrNKZw3hQo7EhVZtg9Q==
X-Received: by 2002:a5d:4809:0:b0:238:3fd0:dbe2 with SMTP id l9-20020a5d4809000000b002383fd0dbe2mr5703991wrq.347.1668368588520;
        Sun, 13 Nov 2022 11:43:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id z15-20020a056000110f00b0022a3a887ceasm7572816wrw.49.2022.11.13.11.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 11:43:07 -0800 (PST)
Message-ID: <d45cf92b-06bc-ab47-51e9-55a0126edbea@linaro.org>
Date: Sun, 13 Nov 2022 20:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 09/20] hw/arm: remove current_cpu hack from pxa2xx
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:PXA2XX" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111182535.64844-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SL/pC5RSMHgQ

On 11/11/22 19:25, Alex Bennée wrote:
> We can derive the correct CPU from CPUARMState so lets not rely on
> current_cpu.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/arm/pxa2xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
