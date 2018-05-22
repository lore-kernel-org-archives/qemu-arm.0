Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1711413wme;
        Tue, 22 May 2018 09:33:54 -0700 (PDT)
X-Received: by 2002:a62:59d1:: with SMTP id k78-v6mr24909770pfj.54.1527006834870;
        Tue, 22 May 2018 09:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527006834; cv=none;
        d=google.com; s=arc-20160816;
        b=d+tdVrequ2JWpGR1UFr1RxmeUuaolh0T7Abdj/Mq2PoLDVpAb0sIEsBQuOadEAA34B
         jpRZyy+zYxDvbRp5hnHvZpB6t53SOHSn3k8SEY1pHTrdfXUBJoZ11SDE3UcLdxrNLQLu
         vILocEPQnCsVFu+W3y9Dhjcl8ZqwwsxWC3y0SfdRkfpB+DcA9Gb49g2LwyXl4uj+KLtS
         /otDKtXrGF2BBBECQvfWhFogaQYXh0ab1sormhMoYpHr+YFvXyTqoCKOSIw0a2ge8kvX
         toEHRGFJxcT49E8+YfwJ3ei/xwOFMn70lEqMk1drudXXwpL+k0F8SSFEwDADF3dgcgnw
         jppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=ty2mxfx8LooXmeZTMoCwcngfKCil7A+T/degErN9LGM=;
        b=bwptzpmEbmfdca5j/dgGSX33ZyD3F3Jm/WTNfHbqhrnXM8E3HbElitV8d5pb5FlPJ8
         bIYwIc7NUDOD7h4oIZXBsYGiQhYMiT4EhLsN7H+00rT7rHVY40W+nQyQluRl5EcfqLwq
         y/pqT86Qlm8sPnjTbQy/1+G4kjnbHcahce//WPbARnS3vJy8ECh29CwkojYbsChs7ryW
         XFVq0rdidfNamp871wsp/j8gHcXRNvhzRgnEfU5eW13HvIoow47Y/BMuKu7UW7UWKHJK
         UDYn/j6ZOk60HRObaWJMzAIVGIs8nUIyCHAsjMUyi9T0Sxf/68960RbXqBk6zxZC6pqB
         Kofw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GFUPdAhA;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k124-v6sor1960854pgc.267.2018.05.22.09.33.54
        (Google Transport Security);
        Tue, 22 May 2018 09:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GFUPdAhA;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ty2mxfx8LooXmeZTMoCwcngfKCil7A+T/degErN9LGM=;
        b=GFUPdAhAc2CnH1NQulnl1zSdmFHkRHG/dkNr6lUBRdTU6f4xX5hB3YefAGmR1FNpY/
         t/K2ms25oRtDHE77+8IsoJ7iy76K98s+hDreoazANrEJg2H7RR2mffuDwp3cMgHKyXtN
         IgAOFuqdKKvD7aQiANKnG7g3RVbKmFtpN09tj15ezBbSfbP4wab0AXTji7dVF/YT5ppB
         fghVpX65MjpgkmbSjpntr5KE855AUoMXq4FBT7PtZ2iRwD4Z8XLHUmAB9LOQUaSxQ5Mg
         WT3PR7xO8Vu/daRJrhH123i5M8KctZtZQiLzHIS4/U9CmouXEgQ33h+2vYQZn92n/gL7
         fXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ty2mxfx8LooXmeZTMoCwcngfKCil7A+T/degErN9LGM=;
        b=AqAjpWq46RVgY2fI0Wp1NR985+z/UBhV3UvEh5qB8CrNr7m6RDQ+WXYgEnyiGJ8bIu
         3VGCgVlk9jqX/iFcvilfXWJJm6J5FqEYR5+hlN0ilKVEh7sZ+AQExgaOPNQ3blyCU/pJ
         PCsnwY8p8+o30rLx28XSyOaCgEcYTYYpC2flI+j6ye7tWTZap5YcM7WqCcyW3kBfRid7
         3A7VJLZ5sv1ICBGxqg6faNTUS5ZjAxOeIKsDIhHGXDDPEY6w3tuU3r0FZ7/tXX0W/IEq
         objQvzx/X5eqhtf+fFuCej6PVVcf6oQh74ELjvhIa3J8491HpSVJTI1rBCrdrT5OOdmm
         o1GA==
X-Gm-Message-State: ALKqPwdmYDHWFUkHygcjQyicqCW6btdgJodL5iPaGruevqqVZyHD20l8
	k6v/qtxqfrgOKx0cEmelwUhaWosP
X-Google-Smtp-Source: AB8JxZrGhR1zJzcIBKidnRRca2zMHQiHmhNwPcQh//EzxDINAi/YFTiSq1l7wJpfo55O7mSemrXagQ==
X-Received: by 2002:a63:6d87:: with SMTP id i129-v6mr17672559pgc.217.1527006834232;
        Tue, 22 May 2018 09:33:54 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id t1-v6sm22064971pgu.41.2018.05.22.09.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:33:53 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 10/27] Make flatview_translate() take a MemTxAttrs
 argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-11-peter.maydell@linaro.org>
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
Message-ID: <2a4bb406-4e0d-24a8-612a-b166f3b8b2b7@twiddle.net>
Date: Tue, 22 May 2018 09:33:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: +IK+/uy6YkjU

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_translate(); all its
> callers now have attrs available.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
