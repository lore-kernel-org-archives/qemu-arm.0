Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1782312wme;
        Tue, 22 May 2018 10:42:24 -0700 (PDT)
X-Received: by 2002:a63:91c4:: with SMTP id l187-v6mr19809652pge.261.1527010944682;
        Tue, 22 May 2018 10:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527010944; cv=none;
        d=google.com; s=arc-20160816;
        b=jVAmc+eUrnVxzsUyOQfuibX8a0wjxj98P6iORqlZO6o2E1uDbtbaH4d/cTw4MphfuK
         T1RLu5bXaEc9PmKT5KFZURER2TNhJb/oEUPvYW8QqGH3QiFCwMQu+jn6ydrE7sMWS2jn
         BpQoMWrhMb63JuvCENasJfcE4f5YEWDNYCXEy4/MzJEk7q08U+hYoCea6ebz/RVmkEA6
         9NETjRG/n+PTiFR5Ms96R3KosKePz9dIPZFqqZZlN46+HBozreS7QpGwTMhZvivsqzA6
         Kj5yGlwgl0NuSSonDABGIX4gCR8PBxjjfnNE2AtVbm1+sx5fh4QMfINCQK2a81C7zy5O
         ugNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=8YGO+IQnbC6ZhclzEWExqafQn9wCQkfgR7bVsd6yKoQ=;
        b=d2MtakupnOk3UtakJOyGoX8Jd1iYNk1lKkl73eNCyCmFWE/kYlxq9onz6F3NlwXTEB
         /MpvtyXgZ8wLm/UcthshKqQnVyVivzdPveBhEtsvK6V8UWeKDCOf5qEKFEG9aQRYxQHs
         ne8fsxI0MASBKXFmyqXAIKx+YXxsrG8e/jPGe3PuOfDUESxd3+o0rmsxR+W+3d1Yp2yD
         WdSswpQq0g7G2+MwvHFtkjLmLTNx9po8y31JKy7uImqy60cLCgg17izpq1rtmBDfjf+1
         Wd9MVKVGQBkbqhaoqLITtFLu/VyzEPA2oixeU6PuZJwmyQYMwVmdjWkGmwAGINVNtG8K
         CvgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m/2JAUTQ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d8-v6sor4629513pgv.72.2018.05.22.10.42.24
        (Google Transport Security);
        Tue, 22 May 2018 10:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m/2JAUTQ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8YGO+IQnbC6ZhclzEWExqafQn9wCQkfgR7bVsd6yKoQ=;
        b=m/2JAUTQt18RK4tK/SjbunRvlcT1KlEePe6Ffk3xN8TAYNkS2IyUql3l+Y7scBdC/E
         wGdcY4W1YY2TtoAnq48WAfGVL4/ZIXmUsJxGRzi7o8K3WhQV8jvSE80iFNnQpGPATj5N
         dIdBq3hx2CItN/E5A88ZgUm5ge4XDTLGsoDLg4xnYEaAlmt/5DV7e+mjIyy+oPmWIkFT
         7/nIu8HjNxho4m14NlK9+PUZx0JBgg/e5owdqvw3Z1GdTBfGYO9kmoXBYSX1uAaMjnZW
         lOgMvAQd+aYF0KUCDCTPaTbcuSAz42mZL2Od2gpixeRaT4/5NVDvQa5544MNWmoBK0Or
         HA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8YGO+IQnbC6ZhclzEWExqafQn9wCQkfgR7bVsd6yKoQ=;
        b=cCtf1lWVL33JSL/qeUKTO6YsK++JXh6RzuUzdsbkGCM4n32QevLxwR5lK7/dmMZLhA
         KbFK/OuRjX754P9CxBUWPa4+qbjGMbvWKTwKQHYIw7+dZIrTGgZlEcvF9j7RksV9hv9a
         tjttVNErFP11Nn70n1Hz8Q6VVUR1oUhUJ9bI33FOAuP9znN2eZ3/Yqb6GdmBA6wRSdOV
         PbCIT8ts9aX9O6sZe5Xi9x4Va7nTG5UE2cf7xpfG/Ur6ZJFRyQea9fCWkN2xrR8GTXhb
         ZurkT+uu5NhluJloQ24+G7vrm4etaIec+poXtfiToqQY9IT8sUDGbLjV9MNAfnIfEjUW
         tWiA==
X-Gm-Message-State: ALKqPweZpDQIAk0ZSJfj8nyCTGo9aUVCspnAjU6dG/iJf024NC+UiuhS
	aKYrHMd4dQKbh00x4oTZp2TvkHpt
X-Google-Smtp-Source: AB8JxZqyvxX8CrxV346+MUDxSu+KGW2GGqUKJvzSERswahu3pVU15jF9/6zcHMG/9YJJAAYhmp1QKQ==
X-Received: by 2002:a63:2d83:: with SMTP id t125-v6mr19879672pgt.336.1527010943638;
        Tue, 22 May 2018 10:42:23 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id l9-v6sm39024118pfg.146.2018.05.22.10.42.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 10:42:22 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 14/27] iommu: Add IOMMU index concept to IOMMU API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
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
Message-ID: <5655dec4-6d82-a02c-2155-300c4baf1adf@twiddle.net>
Date: Tue, 22 May 2018 10:42:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: cWVh+qXT/DYa

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> +    /* Return the IOMMU index to use for a given set of transaction attributes.
> +     *
> +     * Optional method: if an IOMMU only supports a single IOMMU index then
> +     * the default implementation of memory_region_iommu_attrs_to_index()
> +     * will return 0.
> +     *
> +     * The indexes supported by an IOMMU must be contiguous, starting at 0.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
> +     * @attrs: memory transaction attributes
> +     */
> +    int (*attrs_to_index)(IOMMUMemoryRegion *iommu, MemTxAttrs attrs);
> +
> +    /* Return the number of IOMMU indexes this IOMMU supports.
> +     *
> +     * Optional method: if this method is not provided, then
> +     * memory_region_iommu_num_indexes() will return 1, indicating that
> +     * only a single IOMMU index is supported.
> +     */

The mispatched callback has been discussed, but would it be equally useful to
simply have a variable here instead of a callback?  Perhaps max_index instead
of num_indexes so that zero-initialization of the structure does the right
thing for existing iommu's.


r~
