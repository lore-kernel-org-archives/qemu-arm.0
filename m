Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp746098lfm;
        Fri, 1 May 2020 07:47:18 -0700 (PDT)
X-Received: by 2002:a9d:6c13:: with SMTP id f19mr4045662otq.308.1588344438112;
        Fri, 01 May 2020 07:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588344438; cv=none;
        d=google.com; s=arc-20160816;
        b=PMM1CpgTCjLEJaurJZEpi8TL2wkfDygkPBW5YVUzNgkwg+KEP5kr3fonPF/BitlEUa
         mPc33xfKEweDXgulEA9t+HjKAb1LDGzw4qBuJoYSxIIVfdjLjDJjdkquTiuRPYrFoqn4
         H6lmhr2dfvWrJVHavkW4a4ZGpfCssydJ4XxzOIAyBp93M0RbhHX6Ou85Mapfs/Etdhil
         8HHjhDr7pc1/aNUmpSVtdxAOwuwe2SipEpDI4Dw7JGJszj8wgRc2hZoVgS9dpVKlXb3o
         eS4uuWNc/MolOnZ+gifpBLB4tgN05UB/pe6KESbLpujwV5iBm3jbD34S7BBSOb52WmBw
         keiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=x3E54y2PVlDhAR4yBul4/Faq9ev2hdo62vxMpqDhulQ=;
        b=oKTi93F80iuaOic35nLQalY6gbuxNLAbeWhfI5Y5eqnullhljvFX+s/GntZRyy/SO5
         ZbW5et3Q/EvZkpAiFugbvcZQ0YtNWE5QABE++EMtxBZ2D5gKjnhLm2gAfN9Yxcz71QRg
         y1+YeV5KzIzPtSWfZYa9YkXgyCoywOdQ8lDXvu5EZsWqabEa6ItvW6MEqS3HcUUiyZfP
         l2E6RJ2lsGhYajDJovVN4mrub6AfeWzcwxIY26F48tscrnD37p3ZU5gkMrtt1edqH4pC
         CAiN/u1NnkOUrQNFP5eu85mS73IAtp2wViAscaeg7Iyyj/upmcUzzIn0ZFcfQFMPKtBb
         yEPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UbyLahzf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a198sor2901667oii.142.2020.05.01.07.47.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 May 2020 07:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UbyLahzf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x3E54y2PVlDhAR4yBul4/Faq9ev2hdo62vxMpqDhulQ=;
        b=UbyLahzfCoLBOt2ZhfYRAwXkEiyW+MRJRNwpmXxNckiAJ1FwACoXgXiQkWn+QnoejI
         4QpsHz6zy1zUBTlv2jrSllhBcRhmRwMpcI3FXyRFMQOM4POze8mhX126x84PaV9R1eT9
         jeeo6H3rFqroVVuuNANo7P2fNjIWV7wD3trNKkzxKqvG+MaaegxSqVorJGQELMqEKlOx
         Ny1XQpuppCEXRfs6lDglYFMieillGk3hueygeRB1eQJ/XfABj/vMTWsZmTVGWdklfBlD
         lYA8E2GqMDwZ4BDKB1Xe3jCVxINH952Eyitw1u3FhBvUQKtuGQ1x1sxDGU0gz5c2Zfa/
         jcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x3E54y2PVlDhAR4yBul4/Faq9ev2hdo62vxMpqDhulQ=;
        b=R8xLpInfQeSCPKZ0UUmttvG6pHZPEBAvKhFyAIg6y9KNUlLj+tk8pllOsxHKKjRGDi
         ZfcQaAsMRlzszcFd5bO4M1+WDmZkqiuvkkYaoxueEY2natlpEuzUYScGnxvg7qIPS51u
         WrOIV/zcxM+WIGxjgZcBhkHOzXZ3uWn1YNPLdo478tVvncV9DrqorwGzkwtTCC2qpmQ4
         azy7KQFAPM452jvmDN5/p2m25wFVt6rHFTeHlGgDpRUe7yA6Z6RerlFAwvkCp3QTkyWr
         F0ZAeNZg+AmLHR1+YkKGuBEu4iJDTGuCLclH6UsWVMEY5l8owzjEd5IP1H9RBQmLdk8/
         ieLA==
X-Gm-Message-State: AGi0PuavZoarXXngUqitqzCgPxVvwpRIqvoep4cuUY3ZwE/LaC8Jc7hT
	oQTovoLC8wUpEp1BBBuZcQ6amZNB
X-Google-Smtp-Source: APiQypI+6Buoijg+bAXNRy4429A/cC+vwuMZjyg0pOyqhIeiSWqXLKZ5W1lgPG17w34MHwSNCcZVow==
X-Received: by 2002:a63:683:: with SMTP id 125mr4343983pgg.45.1588344437691;
        Fri, 01 May 2020 07:47:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
        by smtp.gmail.com with ESMTPSA id c14sm2267622pgb.50.2020.05.01.07.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 07:47:17 -0700 (PDT)
Subject: Re: [PATCH v1 8/9] tests/tcg: add a multiarch linux-user gdb test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20200430190122.4592-1-alex.bennee@linaro.org>
 <20200430190122.4592-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f767f68-3de4-8185-07a2-efccbfdf5499@linaro.org>
Date: Fri, 1 May 2020 07:47:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430190122.4592-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: YyLY/EYt1y2u

On 4/30/20 12:01 PM, Alex Bennée wrote:
> When the gdbstub code was converted to the new API we missed a few
> snafus in the various guests. Add a simple gdb test script which can
> be used on all our linux-user guests to check for obvious failures.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - use EXTRA_RUNS to queue the tests so as not to break plugins
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
