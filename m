Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1792305wme;
        Tue, 22 May 2018 10:52:50 -0700 (PDT)
X-Received: by 2002:a17:902:22a:: with SMTP id 39-v6mr25576382plc.146.1527011569943;
        Tue, 22 May 2018 10:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527011569; cv=none;
        d=google.com; s=arc-20160816;
        b=rgb6xvdqYcn2e6vyINhiSuAWkMo7xyssPQDXIcZgQ2E2bjPvRTiaf5ViFQS0M8dcCL
         u7Ymxi0PqwTfZv8jo94lgKd6jlEQph842LsreJ3AzzmWRUZbCPtdF3R0J0TiylggJgoB
         e5x4fJos9cJ8D4K27inE70Uw1gIHy2KkJkJMFqVnrBF25oeY4x/jMBdJ07t62nChW/eJ
         4F0frjM/s89O6CEQDtBa+kcNd1gZONRxRlJWeVUJleaWK2dTOb+l/q4QoK2HvIpZsaGo
         KMWFvMJp8WekIRTxVDoYyg1DMVF+jwNFAKA/s7zOEmWmrTEYzoHMawKLuX8W5+w/Uu/c
         dWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=wcbqY2226DMbVLM+sivOuHF3yN/FkFBzhMI3pZOwRaU=;
        b=c/k6I5kWT+HcYjJEjTINMs9G0CkzE6mhfLW3V/WNplkdJHE9omROQNuVG8ek7r+8gh
         3Paz+oocQMnpW5OnQjCIT984Q+lWp5gLOxeRvlsyCpFwX7CdhULCIWyD6cGYub1wbI2E
         nPao1olpXlr05UK5+wUS+7EVWgpRQ6XonsK3eoEyeojvh3m6CtQvfPftoR0sPC3dH368
         Tv7Zq/+fYiwAFmXsmEEsTfTMoMKvivDpYad8exAWxxU6HPjvodMR6cTlMhjbgxCmIM+e
         S+g5iO1k1bHhpzCGWVUBfwND5FCcas6KDhUYMP+Hl7dc2vfYJRaOH3HI3jnsJuIzrSWv
         3ELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l54SmvAz;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 97-v6sor7397269plm.90.2018.05.22.10.52.49
        (Google Transport Security);
        Tue, 22 May 2018 10:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l54SmvAz;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wcbqY2226DMbVLM+sivOuHF3yN/FkFBzhMI3pZOwRaU=;
        b=l54SmvAzsTbuqz/rTDixxpmPN1ZDbj/YS72igPRd3Vw+zVOsYoKYR05GA+jsTXaW+k
         vlKAI2yYnD3FDl/VqCu6zltDFzODJ0pWMJkVhdjVynGNPHm6sHR2N0q5Vsc3mkcpS4cg
         3FIOD31CDoZ4J3fe7//Knt29vMhbT6vngjcGBqR2I2EIgeflW9chZjelJNrbf9qK5mmO
         3BE1LOh8Qx0ioWxZX2aFPGMsPAhlMuOoDid40zpUuoDUgRoRnjYmLZT+h+xwaA4Yyr8G
         uLFEzvYm+IgnYkCI6OKxULDyL4rQjsW5LJf9cNRoBEdhQxnSg+3bUjVJIObJe061QOmr
         mevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wcbqY2226DMbVLM+sivOuHF3yN/FkFBzhMI3pZOwRaU=;
        b=qUMOidveppT2aQ62MEoUgRdzGYUzjM/ox2W3atlKdxOjVpAgLnYzc2v/im+ZPsHJnL
         I9u2zp4djlNtIba+m5k2YRRqDhtT0Yd7NRoT+xIOfxZXVwsLSE+QNyV485c08HyR4Edq
         xaDnlwAg9FOhPjoqSDdLt2fETPRPD9qkTH1dQHzgNwl20mNlrcy93GZ6zW7D0F3EEUfy
         fljlSFvrWFEc3FEZZJcygLZQmPfadL9pyhZqeuOHjQ6cGhDSq87jtk0sTw7w7/y4tbY0
         mmfWq2qymCJ59HhnV0IVSwEGsCFqOadv3j6mr0B2MGE0/KQfA6H6RzuqRbqG7QXJrL+r
         Nt0g==
X-Gm-Message-State: ALKqPwdx5qywzpgjlKx08XPt510dUiJarKnf8FdrIg93sJ+nwfG40l9k
	LN0oqpwDWsmIPGQxuF342vxJI1Q6
X-Google-Smtp-Source: AB8JxZojmtkzSyfZnoO7xT5D7VWENahS3zXr6TvbbixbZfANHsZYbfa38dP9obGexDaBwPkrIIx1yA==
X-Received: by 2002:a17:902:bcc4:: with SMTP id o4-v6mr17579876pls.308.1527011569308;
        Tue, 22 May 2018 10:52:49 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id s88-v6sm40441338pfe.43.2018.05.22.10.52.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 10:52:48 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 14/27] iommu: Add IOMMU index concept to IOMMU API
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
 <5655dec4-6d82-a02c-2155-300c4baf1adf@twiddle.net>
 <CAFEAcA-Cb2sLTz1RNiiPLm=+92poENNF9WHuJrgLe1VGHnPV8A@mail.gmail.com>
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
Message-ID: <7c4c3d1f-d83f-cac4-adb7-a677a60dff07@twiddle.net>
Date: Tue, 22 May 2018 10:52:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Cb2sLTz1RNiiPLm=+92poENNF9WHuJrgLe1VGHnPV8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: gLOC9HWM7om1

On 05/22/2018 10:51 AM, Peter Maydell wrote:
> That wouldn't allow for multiple instances of the same class where the
> answer is different (eg "my_iommu->has_trustzone_support ? 2 : 1" where
> the answer depends on how the instance is configured via QOM properties).

Ah.  I had somehow been assuming those would be different classes.
Ok then,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

