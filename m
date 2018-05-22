Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1769439wme;
        Tue, 22 May 2018 10:29:18 -0700 (PDT)
X-Received: by 2002:a17:902:8a87:: with SMTP id p7-v6mr25203523plo.278.1527010157898;
        Tue, 22 May 2018 10:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527010157; cv=none;
        d=google.com; s=arc-20160816;
        b=DqXkcnrtqUFd9P/IZdwfPiK1jZzngdoYQno8HPri51nmnNbWQto01wxa8zvlY+zVC9
         ZtPYv1FG783vmRwBrgoOP7vTIZEABQgq7v2l4+kXHL4LyC7KntjTfnuSpU0WMckvEjQi
         zLxGYqlHeTPM8uR+qpe4XzGzcXDni81ZenZ0Z0M2kooDj9cPWFlgKZ/t3tFABcvBuUSK
         DIdwJlMcZMnvgIgntYxbEwhjsLSikofNNtU16ggPYLX5UXYOhJaYXzjSkPHI4ZOM8om4
         3tR77416Ai/XVYQP2SzVIirPtJAWZh7fF+N+xWGpcLEH3O1kmTDCv0QkW58OBDVb4vFB
         DmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=1a1LtIy0QGPqjSEo5KVxsT76PwMAD5F6pzQP6aiIxDM=;
        b=qzfi4n6QrbSci3KmqkngC2hjIyPnbpXo2FzLBSf5YB7VDVRUvrpPXApCSzbzTdGT7m
         z49ff86Gz45vT4NjPUocGt+9MT1lHeEW1aWie769/oxxHxdLDV93799lCFS0x9+9/36w
         Y5YyHXLGnj9qfnEOH/ds2uKJpAPcg3bOMeOdru1o4KGfJ+VaO87ksoFtXanTD2eUUdtu
         W+PP0pRA0tKkKQ+0qkXXJ8SGJ0HS9NdojeGQJAEGOeKqa2dagADo5Q2Qw+qTTHfKGQmh
         Jf87olsyoWGpccVPxO37Wi2S2kjDWzrpMzxH2J4BrMZYGFY/ZyCkOLtk4yyvfrSmCSMC
         fpYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r4VWR1bZ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c1-v6sor6809453plz.138.2018.05.22.10.29.17
        (Google Transport Security);
        Tue, 22 May 2018 10:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r4VWR1bZ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1a1LtIy0QGPqjSEo5KVxsT76PwMAD5F6pzQP6aiIxDM=;
        b=r4VWR1bZztBHJH0THF9TkI/pwp2eykEPgZocNce/vGybTa/ujKKmdq4LwxT1A1j2eu
         VTNbK0XVyLuBjr+jkmFOZXne7IkIgVULiHySrJ1REVI7Qw6HWEIksrkb21/02wDK7Dte
         l/uXovOdV25nNYPZHglrW9IxDsMlaRuiU0FtBi+oc/CTNBBgpWQLi/aU2PDR1qg0hFKP
         gFtaRGN9/kAbdS5xDCSFLYbw87ahZHhbIXMDs6JnSbzMvevn34f8Rn2LgmbTK/DxHbSe
         6egPnaGLVG1l+vVg8byX/hYhYsrbpqur+pWNOHC4ak4mmuBgt/psG4B0xk7LcqFYbzQW
         V1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1a1LtIy0QGPqjSEo5KVxsT76PwMAD5F6pzQP6aiIxDM=;
        b=VmWS7ySCiaoK7RalpK8pGI0v603O20XP4j3p2a8RQZ1tXpXV8PiK0yefIZ6E2A3Veb
         C7GA41rq5nv0vi8XgKJ+Nc9lwFEWo0Nxw6fck+Q1JZhs1sKOhTdD7wuKJGDNPqntCali
         X6kkr/064C23KvqRDX8kJojS1y5bIVnQ/fxU8VhgzBZCZ6WmrBwIen0f1u/1ZAU03Lci
         L84CilAh+FXSAfh2Tdw7+Hf7hf+wqsOLqXO3HEbbTtXq75x3gHfVgU5oEhZeCUv7XPXv
         KeZSqqQaMIhUYXARfWvgM43RdO9u7QV4aGt7HoritMvXeqrW4wIALmweW2C9OZ6t9p5R
         y/xQ==
X-Gm-Message-State: ALKqPwdXp+Krts7CO9rvXC3uNhqjhl3/l9WZbeB1r4QJEJI1bbCkutgH
	BTNirwKcenHKyUv5Yj7bGPhOuzn4
X-Google-Smtp-Source: AB8JxZrqbhl24pryEYWqY1lXT+78toPZcs6kQX3c8ccyP83LkvJmJhJ3ThDLgURyRf0xY3ZltZro8A==
X-Received: by 2002:a17:902:a582:: with SMTP id az2-v6mr25138134plb.98.1527010157165;
        Tue, 22 May 2018 10:29:17 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id a28-v6sm36294909pfl.86.2018.05.22.10.29.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 10:29:16 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 11/27] Make address_space_get_iotlb_entry() take a
 MemTxAttrs argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-12-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <d8effd2b-e480-6125-b06b-8568d46587fa@twiddle.net>
Date: Tue, 22 May 2018 10:29:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: uZ3IXQQI5fLM

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_get_iotlb_entry().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
