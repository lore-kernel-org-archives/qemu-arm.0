Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2254361lfa;
        Sat, 17 Oct 2020 02:21:34 -0700 (PDT)
X-Received: by 2002:adf:92e4:: with SMTP id 91mr4228261wrn.230.1602926494832;
        Sat, 17 Oct 2020 02:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602926494; cv=none;
        d=google.com; s=arc-20160816;
        b=XSptbNNv1s+Nv4+bC3+ZLeQqp37zqy0A5Z8ucwomeYnXzXHF0IzrO+7seSw0MQ0OA+
         cDzKGy4WHPf1v6Skfg+Q54Vi1ZfWVQ7qmkrMAs/jIVm9mFd3cas0OrYIEi253F2FxaPF
         ygQ3ciVJ+RWwzDLnq0SU5YRbBUpQUnjGO1uGfNbpKF9C4Kko3KuFPATf3mMZjKTTaSq2
         XFj/54mDnQ1ikhOkMTNbC+8vkgl1rMP7Y6rPUZKKtRgebygq/ggam4v/MwES+Frd1Znc
         7L/gyqxi//woxvyJ5xuI0j0t168fV1HkzPDfOoCy4mpNg1doCIu2KTicVVcu0vM32js6
         bKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=IFCxnRxJ2KVtRrrQGtS0TCnpi38BVuwKqO1E+T6rN3c=;
        b=xX6lAcqU7ZxMFLYhCr6tHeEglJWu1cSYh4NhzrF+3nAK5KbxgD13uDMf7t/zcQTBoj
         CbNd9GTGlVRuXk0gsouPnm/HJ0Ll705R06KZavQE0ljf0Wv6PJ4PIVuYbHldf2jNtxQA
         H8A/1pAUESZD1qfH7jGa0ZqkBP5Zpbm9IweWn9UQUP3aIKS8Dd9SoE+HthBvCfHfrHBD
         ePj8cXb9o99tz5c3bwKBkL8NkIKX2+jMASwoHTDEfeuT9882ztqdl/4TItxj8zWwZ5cX
         wD6wF+PIXAmFOLh7XdJuPYXNKtfnH9qk1vTRURhVzZhpN5r2RFs1j9l/nx9UESBG20Y6
         kYUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=okecpkY8;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v14sor2643263wrw.65.2020.10.17.02.21.34
        (Google Transport Security);
        Sat, 17 Oct 2020 02:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=okecpkY8;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IFCxnRxJ2KVtRrrQGtS0TCnpi38BVuwKqO1E+T6rN3c=;
        b=okecpkY8gfg5fHpSRVDEDfPZ93aKBNFwrfxAOJzZbu2IuAqB+74cs7fSBc8yhqf1nH
         8DKzzxrOCO4tDyHw0Wm/XfSls5rFu2fdS2V0/pDSaDVWaGX+x2KGHuCWX2o8cxfa25Kv
         0NbCHxDW8M0ge4XnxNPTJDFev46iyvFLfQLFwDu6YqVWplj31NXP/eHifW0esF8xhC6K
         pjRwbgjyqr5k/mvKnDmLsyLt7z0VA8yjrQi3PYymF8HoLFhTJRnqRBH7JGegtjI8KUA+
         xvqqihHYn5ZhSAo/C8fsLUTDvnHUgf5xiB70pnKIUB2WyKhzB3px/bCNW+U9GesEkIEH
         DVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IFCxnRxJ2KVtRrrQGtS0TCnpi38BVuwKqO1E+T6rN3c=;
        b=HRQEpFuCaC124LE76IVUYIb0B7lYVJ+w9mfRtCDNnct2o5PzneZvLLYJPjFAbT4EJ4
         3CWirwTX84mtQntAF36cmJJkjPrdS2DKDouT5txfy2qsI4FutyoOHsjQxa/Vc/iqAvN4
         +ymz0Bt7vpwVrWRQkRLe3rJ3/pKKGKCQ7xnucgNgZ87H7TJquegqZZS1jSaGMmPC5jIp
         mN7HovmizTgk3ruBwtINPBHaxTPI3AiWREGUn+22L8fVHxToBUx2l/5z01CphcIeFN7b
         7Oy5ZtSuPr7xHlNhH7dqJRWX9bOplalyK6ZLXWTQ4Dr+nVOWTONcIm198nZkWOIw/N74
         QfAQ==
X-Gm-Message-State: AOAM533deXSO/FAKM5dKy0WQqRn5Mjm7M2bXJaWuXin66qktsRIp2Jnk
	ID6bUQ8qWICiTw6O3SuZ4u9cYcB0ikc=
X-Google-Smtp-Source: ABdhPJyHzMQOPPQ4QCh0uQHRWBw8HWJPd5Vi6yhCO6qmTlB8hkNFg1LkCeWq8F2b7hw2zJreA0c4dw==
X-Received: by 2002:adf:c045:: with SMTP id c5mr9066795wrf.405.1602926494437;
        Sat, 17 Oct 2020 02:21:34 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
        by smtp.gmail.com with ESMTPSA id m14sm7781294wro.43.2020.10.17.02.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 02:21:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v11 08/12] linux-user/elfload: Use Error for
 load_elf_image
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 laurent@vivier.eu
References: <20201016184207.786698-1-richard.henderson@linaro.org>
 <20201016184207.786698-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a49da314-d0e2-279c-a3cc-061d755a47c4@amsat.org>
Date: Sat, 17 Oct 2020 11:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016184207.786698-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Id4h2AUGOx4E

On 10/16/20 8:42 PM, Richard Henderson wrote:
> This is a bit clearer than open-coding some of this
> with a bare c string.

c -> C?

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 37 ++++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
