Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1710549wme;
        Tue, 22 May 2018 09:33:03 -0700 (PDT)
X-Received: by 2002:a17:902:bd0a:: with SMTP id p10-v6mr25681340pls.69.1527006783140;
        Tue, 22 May 2018 09:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527006783; cv=none;
        d=google.com; s=arc-20160816;
        b=tbgq9G/0prGnYAFLdGaYWJyasro+VnmzNJmMa2CwhWdA9JLn7FaGZ8LtJmitjxJGzX
         S6ndG8XKljmyT/FmDpPpiqUs4abQmaYZNNY1bclY5AcCM03GrYXSriwKidYHWXKo+qGZ
         TNU4HmZQLHCZmIceHswQo80jT0z9eadkKO2Cm3s6+Rs0AvQaqOUccz2jS+ryxt+ghFzV
         xdURMRle4UT7fLonwX63HjGrXtBWqTM2+IIShtoJDj5YEld952YeycLJVpVt85AdTTe6
         NzFX+oL6OVF/mNKFZ9Sc2zOrDYN/Ldjy4BT/tZV2K6+tT/53DmVWWJnTFvFm+wnZhO1G
         RBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=ecTDH7igiwayc/9sv1n3mFzd+4hyV2eeeAdpBBKMbag=;
        b=O2Gc4sxu7FTq4Kfvh7QnMx4ALl26w/xcA81nD7m+S8gf136trcs4tMfiSxps/JSPVj
         7Zv2axIpq+YmBSJ0q83FimWklfPbXkcQRmCs8owTgXNVEIoekt3MsRhllNRe584WAv7H
         f7/Ap5vrHqrs4tq6xtHU3cHgUNdW81zznZc46oUqtOg84vDsdup1hl7FQG+TWvox0yQi
         72N4h6EKkjf9XNUjbpgisZ6rERIHhzWX+hYcjG6Jw2/sORf929MMoMa+/mt9zaUqLdJE
         fu2BVwQJUbFtexOCAx2Hplzukdh7Be7D5RFWnLIjyVFzt0hNR+FgR7vgRP/YLphq8p/x
         jbpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSKQWJGX;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k185-v6sor1248647pgc.140.2018.05.22.09.33.02
        (Google Transport Security);
        Tue, 22 May 2018 09:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSKQWJGX;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ecTDH7igiwayc/9sv1n3mFzd+4hyV2eeeAdpBBKMbag=;
        b=KSKQWJGXiGFdl9oYYe4ybJ/BbArS9atNSAof+p6izxz8jd5ybtFEIOwgIb2LXkq9DZ
         L4GE7ge/QmShaNzm6zDJlTefIF0UmCF20nzTvDVsq6QCN5JM+VyaojSWsJqO4bWCsLaF
         dDZCs8PiuCZ+YG/VH22nqGedyljDfBEmS7dYfMyk9IOx+8yRTmMNppCC5uwi5vtDK0rY
         069BsTNfn6mbyKY22XQ665E3GN6InYRRhdCm83aeusrwjiy6qeVbU4AlRRQeRMWdn5bo
         qPurLXBYqIagIuciWFD1abg+81Ejkh/TjgQVM75U5K3+GhXDvZq+9PzerKq31eWkrQkx
         l7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ecTDH7igiwayc/9sv1n3mFzd+4hyV2eeeAdpBBKMbag=;
        b=lcQvt+QMs2gyg+qTvcP3B6doKOLl/7QIalydLWGfeg1VKRzqF5OPrL90im4QF+ua2f
         9s67WJXoVAVSe0y/hEWE8g7FdT+NGRbQEPaLd8A0CNAY5o3UjV7wcStBXLVTvRHBteBO
         MO+8DQf5A2OGhXwjGGRuXAQxSturCjML+zWvZ+R51ZDbHg2iEkCXmsD7W+3pggxvgrTp
         JD5ugVcqSBaMO0xnXHiBJFQdF3xoi4pZNhYwodKeXh+CO9Vmpl2oXoltoc65W3Jo8k0M
         l+U6OZcM5GbjrLLMpd04G/Us7LBkN0YHp6vkXrte7TiTTZU9hn7J0jGw7vBf1A9yJaBU
         1qZQ==
X-Gm-Message-State: ALKqPwdugzqzhl+XjknB/rDh8gWBp/ZLVlvJL5+GEplTW2zTh0Tp97dV
	CM8czAcoFRWexS7Dezj6RVuLR7mY
X-Google-Smtp-Source: AB8JxZpZ5HpPgALejCnGxtmdBhIFE7zUGFtOTANGKqU/WUzsOBYoZrggHemysn4JEbwWXgYpaDu95g==
X-Received: by 2002:a63:734f:: with SMTP id d15-v6mr8643105pgn.149.1527006782363;
        Tue, 22 May 2018 09:33:02 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id 23-v6sm38498523pfs.147.2018.05.22.09.33.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:33:01 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 09/27] Make flatview_access_valid() take a MemTxAttrs
 argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-10-peter.maydell@linaro.org>
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
Message-ID: <d022028c-624d-ed88-9ba6-d0fe88d8adcf@twiddle.net>
Date: Tue, 22 May 2018 09:33:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: AzLVF/CJAjSu

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_access_valid().
> Its callers now all have an attrs value to hand, so we can
> correct our earlier temporary use of MEMTXATTRS_UNSPECIFIED.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>              /* When our callers all have attrs we'll pass them through here */
> -            if (!memory_region_access_valid(mr, xlat, l, is_write,
> -                                            MEMTXATTRS_UNSPECIFIED)) {
> +            if (!memory_region_access_valid(mr, xlat, l, is_write, attrs)) {

Kill the temporary comment too.


r~
