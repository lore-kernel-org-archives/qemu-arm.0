Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp840587wme;
        Mon, 21 May 2018 16:55:19 -0700 (PDT)
X-Received: by 2002:a63:b144:: with SMTP id g4-v6mr17174094pgp.253.1526946919342;
        Mon, 21 May 2018 16:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526946919; cv=none;
        d=google.com; s=arc-20160816;
        b=CNgVpkoV6bO5Wzp4CSuncmsBfJVZircYKnPMvi8Dk5Mm8Bh0UhmMnIDt9pwSnT5Tzw
         F9P7UCB5epvHGdSZ9vXevBHXARYmBJOydBTc5rzxUY+BAy/1LH1v51QaPgSWu2cmOdQd
         Xau4WuJiWNWU81JeHdsAuOZ0rbLacdZdDa2OqKpFvVQ3RDjb8Vw6IEgd5DmvnFaTALVW
         y+i8UfAwRhHgwjGLprZLia1QZd67D3LXqNNUqCvrhO7aRlqSRpqfyLcWwyHPgMbadXf5
         /HC0kjUcJc2JlkRbg+iXsZzFG1DzSNef8FsHQC2oquyN3cTqFC5OXYieJSXnl0EDRQSG
         cOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=1tn9ONzg00xjW2t6Fu+JtPNv5nDPe54TMg9z9XPUQhk=;
        b=qsjNwXJqGoXNUnf9rbkALfArLSmmpIpM3E0VvWY7ZZkrWKujtZzmx/Ysr8jFxb2kFE
         jvhxG2jh1Gti2X0YYHOwOS8c0S4qCMfNere3YGMukecGMEevLs13hrJMSVT+OYPSdweS
         TH4uETOTsrY+aHihXnqECChj/qb2kcAWIn5amWvTpdRpqxjhXKrkvDnSt8al6xaBVfM2
         i3wgaqvRCfU9/XCitENvvNw8GnDjDnSeDx+Xn9t3ffjbdwzeHkZA6BycCpdkeSPAODBF
         W6aqIRvS9tMltpQEDCMG8qQuNeKK7NtCzdXtkLzEj8fZg38y1g8IsxCxQDzjTmSUpMha
         rZEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uk6/ME4y;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d13-v6sor6148732pfn.23.2018.05.21.16.55.19
        (Google Transport Security);
        Mon, 21 May 2018 16:55:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uk6/ME4y;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1tn9ONzg00xjW2t6Fu+JtPNv5nDPe54TMg9z9XPUQhk=;
        b=uk6/ME4yhLBNqNL9FvJ3RuRRI8CUhtOqejSacLRRSerJGtgEaLBHfdQpduHtFBax+V
         mL36QIkYNbUgizO6Dd2/M7J/7fLWA4WF2YRAJ0OOcKUjyBuDTKVDge3j/vyAKU3mQHrF
         Glbnst2V1MSGaOaWV9p1JGu0a7PjpIDuZ36UqW9X/i7HJ6dsNTBIbruSK/9d8MjhCFQb
         ezIyibQ2eInmiVcTiVR9lyMXerQLZNJrB07hpztpqEca0OfaepNKjMX0ShvcHU8CkQZl
         9gIbPrOXwpOYHEusAHyZ4y9QMjeufJxd/JEeZf8YSbk8pjBFsEV8U0uQAfo6ckJmFfDi
         FWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1tn9ONzg00xjW2t6Fu+JtPNv5nDPe54TMg9z9XPUQhk=;
        b=BPcEGaFKOkddevS6gdJpKbF9Qt1PrvsonIbUSSY92r3WIFT9ritHfe7uh9zTAXwl7Y
         q3VUP1xwf4e5pUfAUrZNjrpShNF8zxIc/jBJ/mJR2uN/koCh8t3IGhpWJbVuDS/D1Hgx
         /eBP7x0hJQSwPpUfPhJqUj3VXHjR6u3LNI52YJ9mUR1iQenMfdLcKxBe7WZRGDxZYL6o
         wQBJbwUzI3Wj3xI/2FKIcS8Bz5ghssGaOulXU0sKiiYv6If2ESqmjjNJsi0r4Ix3lqEI
         g4NHjWmA5XPWbXQPn8RgPXyu79ZsPRtiFSBa/m1eYZ7p95aPF+OfXzY/dHmXa4keNHEi
         x7HA==
X-Gm-Message-State: ALKqPwcxtDU68mSK5+XC7a3KFtJptrCoMedMbC1f1uM+1MS7vZO8wD0o
	2/wsQdXfLQjMbzkDv0tKbiuRbPgW
X-Google-Smtp-Source: AB8JxZqS/FX6nw0hb9IcpGXctyrWuyMHtycv6yzDBPnI/HV0zTBL/4BA8jc3xoXDb0uNgr0u4PaA3w==
X-Received: by 2002:a62:f20d:: with SMTP id m13-v6mr22075198pfh.170.1526946918530;
        Mon, 21 May 2018 16:55:18 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id f17-v6sm19077373pgt.71.2018.05.21.16.54.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 May 2018 16:55:17 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 02/27] Make tb_invalidate_phys_addr() take a MemTxAttrs
 argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-3-peter.maydell@linaro.org>
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
Message-ID: <25be9567-a5b2-4d46-0869-43160dff418f@twiddle.net>
Date: Mon, 21 May 2018 16:54:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: KBw96NEZ/QIj

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to tb_invalidate_phys_addr().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
