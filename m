Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36679njj;
        Mon, 28 Oct 2024 23:10:52 -0700 (PDT)
X-Received: by 2002:a05:600c:a69d:b0:42f:8ac6:4f34 with SMTP id 5b1f17b1804b1-431aa80274fmr40783265e9.35.1730182251843;
        Mon, 28 Oct 2024 23:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182251; cv=none;
        d=google.com; s=arc-20240605;
        b=fIkVaYol+ged42zsHS5imYGO3hOSZeL4yqjNcS5z+bn3t1FJhdtGkVtt1PLPeOne7H
         ZoCu+v3ZrxdPmq+HPtcfO0JzIx7nJHH3T4QG/XNId/yY6EIGn2k2nCM4xkwJ9wiRCFox
         +Q19s1PNx2aaHvrtW7y5g8lcIe7qG/7VI+KVeCrqo6t+KFEn2FaDlH+kW/8qaC3jFHoJ
         IE6fSDZ/eEktWji+4uH8ydDXjRTWpI25QKRrI64cHSKEExD3QMp4hv4uMxznH4uYt7a7
         awBT5VjC42XqRTs9cdOuWI4XN2kOiKQy4zNFGCzXNLgsCeYN/j9FzeX3kppxiBr2cbmU
         xkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1F1wQfyGlx2dTe0Op+HmZFdGoAZYpgptW9U5JoHUQ6Q=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=HX3EQPm1VscNGNRo3QoQefF4iywn35LnYwthmdexB61o4QsSjo2T61zsNyarPLaIZ4
         Dx7VvwnITrNrFcjcEMMTnIlp7aBDu6q/UKMFDeOhzVGjizX3seK6ndaX2+cHmhXCbeM7
         HNFgzjqgJzcjtK9SQG9CTBoh6/yA8TdXnJ2sfq/8mhwIca8Ib+T8D3/G0H5Ikej3Z+4y
         CiS83c1JB6JkD/lz+FCiqVMhNhhjY3p730DN78MJFT2R7l7erS0dyLmk/vPjtVzMkFtj
         TueCXoFGDeu0eglfb2XrXU96brQ9xX+4QbfNHX3iJHj3GCHBQf7PKpr/A7MZv1Xz7i+x
         sZFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T8fvEj4c;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397045bsor35003725e9.9.2024.10.28.23.10.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T8fvEj4c;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182251; x=1730787051; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1F1wQfyGlx2dTe0Op+HmZFdGoAZYpgptW9U5JoHUQ6Q=;
        b=T8fvEj4chh6PcQuY0NuxuozfovFonyLa3gfry9pVNlvVEsCaWADA8MmzLxiPSKUX6F
         M4dHbC2/Ppz4hhgZzK4qXOqNKSAIYOsQE09D2d7gRCe1X/55klaVQo3QWOxPFZLYLku8
         bFtbT6YwJUGzeK5HcCt4Lhy036zVbwr5WUo/myg8Rf+FAGzilVG5lf06qG/0J7xGbThp
         g35LPdg11cvHAhX8lh4bRB3Vo2lt47uwdAF40eAj9G8AY7Pz4c43qVbTXkI50Cr9w+Yt
         lmO9HxxPva3Lp331GGTdNMXpaxBV8FgydR+hClzwIdHJORwMNkMbb2o6OFSVrqieBLnh
         D9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182251; x=1730787051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1F1wQfyGlx2dTe0Op+HmZFdGoAZYpgptW9U5JoHUQ6Q=;
        b=Pt7Bemx6AsJ09zYOk7g4A+bezSW6CCDpY73RABRruREFk4bCcoQ7oZsCp5Pwyr4Y2/
         xAbx6Kp1o+QvJEfLBX+6P41GZ3djOof71Hptli2G4Wl2zBsCNhSkDKzthDwVROfwJ4qm
         BT9D7EyHrMpor9XeiGBVqqFyBKQBrBCCEtVScIrvDC7ymFzIzrp+UChyhSbD4+s0iIOa
         DQMSTGYp28QbPE+yZgWkPWRV9fHTNH6ddbnV7dlKM3i3L5jUfPeVK/TOsNZ4ukyCAGNP
         t2Srh+OEpMfSfFCTT3UUNTId+fszAGqpG5yo3my4I1tmLdnaes6ClfY7vRk2jhgGITN4
         9Zvw==
X-Gm-Message-State: AOJu0YzJpePMvV0y4nn9RQi6prrlAI4k4KMzSSaREZd5XjJ4DBGxpCg4
	mbqxXFhK1Wm1C5CgRQ33/vbK26mZjFKezSasrvSv31vGgNJkhf3jn14SHmm1hhFllg==
X-Google-Smtp-Source: AGHT+IF/XEB3t8rDOX9R8wrFa9AB5OgvhKOca5YZ5ZgPCiex9iqGl6fRuzz5nlT11jaQr2JRP8bScQ==
X-Received: by 2002:a05:600c:4fcb:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-4319acad048mr72454495e9.18.1730182251258;
        Mon, 28 Oct 2024 23:10:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f5e1sm165298915e9.14.2024.10.28.23.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:50 -0700 (PDT)
Message-ID: <797f110c-8615-4e43-aec6-62564a654c47@linaro.org>
Date: Mon, 28 Oct 2024 12:20:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] target/sparc: Move cpu_put_fsr(env, 0) call to
 reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-12-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mWrXwZRZhafM

On 10/25/24 15:12, Peter Maydell wrote:
> Currently we call cpu_put_fsr(0) in sparc_cpu_realizefn(), which
> initializes various fields in the CPU struct:
>   * fsr_cexc_ftt
>   * fcc[]
>   * fsr_qne
>   * fsr
> It also sets the rounding mode in env->fp_status.
> 
> This is largely pointless, because when we later reset the CPU
> this will zero out all the fields up until the "end_reset_fields"
> label, which includes all of these (but not fp_status!)
> 
> Move the cpu_put_fsr(env, 0) call to reset, because that expresses
> the logical requirement: we want to reset FSR to 0 on every reset.
> This isn't a behaviour change because the fields are all zero anyway.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
