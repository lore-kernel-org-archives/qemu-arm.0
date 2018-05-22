Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1697222wme;
        Tue, 22 May 2018 09:20:20 -0700 (PDT)
X-Received: by 2002:a65:4348:: with SMTP id k8-v6mr18943260pgq.395.1527006020300;
        Tue, 22 May 2018 09:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527006020; cv=none;
        d=google.com; s=arc-20160816;
        b=uYp5X6RgImLCxXbTVrYbbs6OdHp0laO2Av7R2r6mZlGnCiz7RqF+vH089AEQqfCyHS
         1U6iHgWEU51k+YDgdYm5gpVGRjbw19C2VdrH0D80V6XcdDTgZC3PLieaDsAdWv6auc5Z
         VWkqh82Fr0ZdMbgd33x7au+88zYdTpsc1SQ9AvAxkV5qbCeRJelIyhbAj3mrPV7iRkff
         oKS3t3WB522WtBKY79OabnnMKHMSy3fhtzsSYQMv2GhFLgQ0tPGQbrImmgM0xpiGIKUJ
         dzTA8r9RgowS30mkhlQLaSi9PCwrmbS6+dxbuWc3hi/kXnVuGoUAMDKLwmvQw9J9/hsh
         rrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=kLY3Tzn3zsL2vgWeoxZECILm5textmEQwvP/77c0t1s=;
        b=H9/29/4wXGoULCAzN3yaqATRNhZo5QCdbVe5gSG/T1jUZp+4jWjiBwuwk/Fhm1WQM3
         NVg8I0OJmBcXC5Q48Fh1DJGDN+LQXA7ilv36NMey1R5+SbqgZjxwZbxrhR76Eu4v6oI1
         sxkvLfnFXu/xPKaKJ47qC1ja+QttYULCltlEyMLrtO2PMTJ/teuksRux/41xGTFBF0u6
         WQrbXe5HyCRFJ8P2+3Q2GsMZcInEni3eWONzQs6W0/bvjozw+t9fcbhpjET99h1hyjSG
         g8gQZdMYaliQWFela7nmW8MljIm/9/nNTxujMrL4a9jwjvnqRinYw2vXwFyttB5yCozQ
         qLrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CU5zaJkV;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o33-v6sor7371059pld.107.2018.05.22.09.20.20
        (Google Transport Security);
        Tue, 22 May 2018 09:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CU5zaJkV;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kLY3Tzn3zsL2vgWeoxZECILm5textmEQwvP/77c0t1s=;
        b=CU5zaJkVcQ6kLnEAb2f0Lunu4V0BUo8NE5eTrRPtdT04rYOdc9Zv26VXwXzMI0Uvcp
         7wNemGEpbIKUp5RsRs/72a4UzWe2SnPuZer4Z+j7QXmDT9U9099mji7PwBBVFSjbR52H
         9ZSmcmPBEVr8lf+QLj89O5wI2bhLT/R520P2/KHVr2K0h9+uQxhOaHlgANmoxSzWYvDh
         sVB4ClsxabWD42LbEjAX16tWgJd0u8258sJewiJYXq1ZAcC5VZ/wJPXEVp3TX36sKFpH
         iJSBCHejpq9ORot62saPSI99tE4jOJU4w0xS6yjGJQcoF8f2NEvGi5xyMSBfJ4gU1N4Y
         +ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kLY3Tzn3zsL2vgWeoxZECILm5textmEQwvP/77c0t1s=;
        b=LND68jOdc1GnW7ETxUHr+EQmlvo2/HyIH4kduu8YMuYiFHEUjoXRuRLKZL7hynT2lJ
         HjzmHuhx7d73hubxBQcZJQIKeG+nBUGP/J81AoGuhw8L6f9QpJVBUL+d6BlskmXanlkt
         hk2r3Tf1x99RDNHbkFxuXrgVwvPsx2RbDF8uBXWkdJuANjKa7RIqDbsucdxNssGm6E7I
         u75bsF4TDw4BjTb+zrgErPbCSNh1ipRfvEXho1tDdPmvQNEw6FMtk0VV0muAKtnyGKBr
         5ACyqGVaK4bF+8sTBfnY587lF8bPDYA4v/rTMq4qadGfnOQA3NDojuNNNd39mZIG0hA7
         GXLQ==
X-Gm-Message-State: ALKqPwdA/CsytiacTuK7dVdt5fPZ4c3bHfwS2pE5EIsNIYloiWpPwyHl
	aU10GbFGft85WnxuRpUcsJxYLAL9
X-Google-Smtp-Source: AB8JxZpqyQAEgenQq248xHGdroFXwb8fJQJ1XoKPjaepslLP7u4miX+7W5b0tlIwUufYn6FKwbzlCg==
X-Received: by 2002:a17:902:3181:: with SMTP id x1-v6mr25664790plb.198.1527006019600;
        Tue, 22 May 2018 09:20:19 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id u8-v6sm29335768pgq.7.2018.05.22.09.20.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:20:19 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 08/27] Make MemoryRegion valid.accepts callback take a
 MemTxAttrs argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-9-peter.maydell@linaro.org>
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
Message-ID: <7433b2e8-9ca0-47fa-250c-8f5fe5ccd7ee@twiddle.net>
Date: Tue, 22 May 2018 09:20:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 2d1SSQuVC6r3

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to the MemoryRegion valid.accepts
> callback. We'll need this for subpage_accepts().
> 
> We could take the approach we used with the read and write
> callbacks and add new a new _with_attrs version, but since there
> are so few implementations of the accepts hook we just change
> them all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
