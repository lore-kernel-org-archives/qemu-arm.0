Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1770652wme;
        Tue, 22 May 2018 10:30:27 -0700 (PDT)
X-Received: by 2002:a17:902:a717:: with SMTP id w23-v6mr25533746plq.130.1527010227256;
        Tue, 22 May 2018 10:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527010227; cv=none;
        d=google.com; s=arc-20160816;
        b=H3UxYz6RtMPAkTpQ+T1G2f8CrCykos4t4brkqELmW0S3ni/fyTKP98Zn6Vpz/+2q9j
         +0lO+A98KN6+3ElrODFHFzUK+34ohblw7ZnZ6ugqoorv5nADG02FMFH8XbiRIDfyft44
         EbGVjQxy04DrcKj2QRJEvOdjPAfum4wpW23YGW0zFZCNa6E3UTDWv9H/Az9B65FrHonx
         bkwimd5lkD5R7gARBXqjB3ZimQvzdz4X2J3d1c0ZnZBMIYVcJkUDt7RV1/NmkN/sh5OV
         fyvtfIZv8dq4Lr4JtCEOi/R5jfernwRRpVDQaUa+zI0+fREHezs1E8XJud6UYgu758wX
         XKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=c1ugl8LuwnojklsjgaBeH+LAgNPYyffccuOYjHiSBj8=;
        b=odn8jaMSOkxvnVEbhdwTan4Zq8EYL+W+CjpvMhAKn+22ptKtpEMIggSK/4HrfD0Baj
         w9ELBEHQmcTDxNV1CBSPpdYlk8XzkEASuRi+wxczRFPqlZoVZvwosS/zVxPyBpaMJ5RM
         JNvlWWCi/HwHu4bZdvMVWP7U3p1Nviy93EPXbqNxy+yLh6BHX6L9EV+57oaBtbEXbTXM
         yc5XbQX8pZLkWE3wlmjEgUw4OQ6QWZZkdv/zQqgcPEaS9u/bwvPQ4bNANE3yUvyCEIH/
         nUCYsC6hciLH3PhPks6dia79oS5ZKexKoBUy5nvM8DcANzD8E46MiES+BGgXqaiZ5/Ln
         Pwfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mBVQX5EO;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e87-v6sor6735374pfl.135.2018.05.22.10.30.27
        (Google Transport Security);
        Tue, 22 May 2018 10:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mBVQX5EO;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c1ugl8LuwnojklsjgaBeH+LAgNPYyffccuOYjHiSBj8=;
        b=mBVQX5EOK1WwFUvFWwAZU/0TMqmjT+0kvy5GMhQ4gOiqglOjJgrdh+IZQ7clvAAEr/
         4TIbQNIaJUjDzA8SjLDGC7R/x1ozoL0J0DNdxi47Fj6iWEtVG4r4Hh1xJbQ1lb5wIzDh
         zqjwuiTSZ40wg8yq6A3MQFRzamqzMQvLepAsXwT8l4HB2QmoZKVYMXv4apyLXzjOuH24
         NRs5ovIJuJCIFAdpMfQaccJU0ByPJjNWVcLxYQxBnI84YxecdBVT2iimCaO2I7wnMXJn
         GcWcRzrmdHzDIML8Ovh/y/aMb/CRm8JrYTrZicQ8Dy4DM2rF9MUSyB3FmRK3jj5IbWtz
         OcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c1ugl8LuwnojklsjgaBeH+LAgNPYyffccuOYjHiSBj8=;
        b=DsrQ1jKdXXixfRopAaGNZYSkxWO/T8CGicDoCDgA9y0qf+j/x17iuima2gCFuB7vkZ
         ruIvG5SILMHeWe6QyAXgvucnHhbGWf2PIQIs+7HI3tlLH0jBYuOUj1N96wgPW0ub4Hbe
         TMKQkZtaA4bL5Bjpxu+PRMGEzX6hf93/QPPOhr7qG26uA955Tk3YEGF8htXvVSosNnYX
         5S95LJ+luQujqyHe/aKGog5L6X+SbbuJfEhpfxPP6DkjFMYKw/oVF6SOR1iNO+KNFCv0
         8SmzF9l03zRhnk6/rT3zNxBUrqyWzO0mBlw+x7rCLx3udnVC4zzanGLzleSM7l6o5Bzr
         e9VQ==
X-Gm-Message-State: ALKqPwc+p5TGFDEq7nmMBoiNIrAkN8ChtdPX2uzxVRZtsUM+glBJoEsG
	HOA5VkhJM57Jn9Xp7ZuWN/mNEKMf
X-Google-Smtp-Source: AB8JxZqgcjEybEjnHuJzJ6nHvNCwNCt9vDnK/MFthQ150T5Dt/iguhGTTVuo9PAQLpRFp4I+VR95Tg==
X-Received: by 2002:aa7:80c6:: with SMTP id a6-v6mr25046265pfn.120.1527010226189;
        Tue, 22 May 2018 10:30:26 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id 73-v6sm37814771pfo.153.2018.05.22.10.30.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 10:30:26 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 13/27] Make address_space_translate_iommu take a
 MemTxAttrs argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-14-peter.maydell@linaro.org>
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
Message-ID: <a8bcf03c-3132-127d-741f-fcb6472b0bc9@twiddle.net>
Date: Tue, 22 May 2018 10:30:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: NGzbx4c/psFW

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_translate_iommu().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
