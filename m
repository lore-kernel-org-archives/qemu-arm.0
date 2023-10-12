Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp794885ejc;
        Thu, 12 Oct 2023 06:07:18 -0700 (PDT)
X-Received: by 2002:a17:906:3116:b0:9a9:e4ba:2da7 with SMTP id 22-20020a170906311600b009a9e4ba2da7mr22016059ejx.49.1697116038402;
        Thu, 12 Oct 2023 06:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697116038; cv=none;
        d=google.com; s=arc-20160816;
        b=za4Ghtq/SKWN7Imr2hj1OAS85M+SX/juvC2UTHqHeW0hoOA2VWf7LiF9XFguuYfM4L
         Sp/4CM7svDJym16PjP7RBtotKpZ8LDbjgNZWrIAP/nTmvR76DPWzEe+KSOFPcYyUYVJS
         ang5suFj2+VH2rtXWMtfyGH4bWRh0Zak8H8WTkfZHqMdG7aD1kuDHRsvwo1PoNX7girI
         H2H1zn3xO4mWftbJhKuFETHLUxG64FxZgEG4ah/RXHKP6JMqeg9p1VpgEwZznTpcFCtc
         Ar1aCoFG9S1CE8v7DldgR6szHFfu38cSZQ5nn0Q+aEgvVbmdhQFaElTaYeP6sZLiRgu+
         CSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uElxi2HlcdsKIdLCnnj5Iek8ftyU5xtffELgvgr3cFw=;
        fh=t1Ji07xgYgopWOgYSzd1++xm9ncTuyyBDwhGClNmAZ0=;
        b=TkOfiVTbYq26BvnOQvmVBk4HF3Ln6KspOa/pVM8dPsX4j52OVl2c1AfcNmm9y3qyr+
         0+i35Pn+t1ANljsuz5OnD6veOwa1G8dpik1bWiW+IuNtaaYzKZ75hIBVtnj+BeeBGWje
         7vKZZQaMgYmXPvUOOc5bSSiOB7icnVD6FJnvwCU79ymfXRvR5t8mQx5fcuWstZcBS1Po
         HAx1q9J9eByN3/1sop5F9gc4RQOv+JzyGVwPxbB8KUEEt99D3ZWilomIAxJhhJRioAOS
         NTjQxm/jvQp/iL8CN1uUI4wZiGrtkJdmmKgmPmSJoceejGH0Av1zAZGf++sdf1sPImV1
         zDfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rDzjh3ca;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d11-20020a170906304b00b009ba065e7512sor4600775ejd.19.2023.10.12.06.07.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 06:07:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rDzjh3ca;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697116038; x=1697720838; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uElxi2HlcdsKIdLCnnj5Iek8ftyU5xtffELgvgr3cFw=;
        b=rDzjh3ca0BIrOVkd/Thtys1Zq4w2TQdG24fKIDodQBkhfauEfinGWBNU1WNWDVHcCq
         /MqdSwp31izJaqDaTavtn+9Q1l+KE0RvPlPXReZWUEMqS0P0vo6j8tVsZeJHQm5ZKmrV
         n7ltrrlVolhfKkybhRuXh+XnPo/5Ju26OTu6xIAvhmBReCisEd3n2PL6NuSl/rdt9B4U
         ZYFrOdNEygi5oWXdW4AcwtlWxsUics7RPRIKz9uTcaXfgixRUyHkBpFNKo2mmYdVZdwX
         AGKyha46enbySwPWicCXTinUiVgY+TKa0pQ4Uw+MocJ/L+NOgf3R/AMAJ2wfrCfMP+8d
         mGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697116038; x=1697720838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uElxi2HlcdsKIdLCnnj5Iek8ftyU5xtffELgvgr3cFw=;
        b=H9RCWSPaPws+ed559TdIQNn871aVWhBIJfBS/E/mcOSTXe/caHGbmet6S9/0jDNwbD
         UwsPJbBdfNBWfyINokWdFG4TwaT1w4AsoO6Ajk1i6gw4WywUr7382HoHBpnn13m0ybEA
         Co9E9utEiZyvykX3sgkwuwgLiUmneuYRQij245WKDuORXQvSBf4fv60UMfeG2q91U3yD
         /Q6G+h2UzpgoCMs25mqNTi59gGJKUg/iEeNZ2sPtPDbAssLhvSeFKMKodvi5RhxegYZ2
         sumQGO5QZvg3I89G3yWBuqI+Z3RVWVKwDJXzx0VyNYh3le95JtrFFVUqJO5YwVocxGYk
         oFuQ==
X-Gm-Message-State: AOJu0YytIiIPtZ4kP3u5g6iFiVi5FHWtg1vvbzTKqQL7QpW0+HJ+0MFq
	8REIehOQ9dCAffYLROEAbx+XqG9A
X-Google-Smtp-Source: AGHT+IEIkexhI37EGGJmyUtUoVkqSOBvDhgJYggwPOEXpYfeb9lEhiYNSWzoaPtXIswYw7Qweec21Q==
X-Received: by 2002:a05:6402:b18:b0:531:1875:bbc8 with SMTP id bm24-20020a0564020b1800b005311875bbc8mr21096447edb.19.1697116037908;
        Thu, 12 Oct 2023 06:07:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr. [176.131.211.232])
        by smtp.gmail.com with ESMTPSA id i34-20020a0564020f2200b0053dec545c8fsm1667629eda.3.2023.10.12.06.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:07:17 -0700 (PDT)
Message-ID: <39fb2593-2184-560b-3d67-51f9203f078a@linaro.org>
Date: Thu, 12 Oct 2023 15:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/11] hw/char/pl011: Extract pl011_write_txdata() from
 pl011_write()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-7-philmd@linaro.org>
 <49918fad-56fc-150e-bb9c-bd00dc67df05@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <49918fad-56fc-150e-bb9c-bd00dc67df05@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wg2ZxNh98ovj

On 14/7/23 08:58, Richard Henderson wrote:
> On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
>> +static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int 
>> length)
>> +{
>> +    /* ??? Check if transmitter is enabled.  */
>> +
>> +    /* XXX this blocks entire thread. Rewrite to use
>> +     * qemu_chr_fe_write and background I/O callbacks */
>> +    qemu_chr_fe_write_all(&s->chr, buf, 1);
> 
> Not using length?

This is a simple "code extract" patch. Length is used when
we switch to FIFO in the last patch.

>> +        pl011_write_txdata(s, (uint8_t *) &value, 1);
> 
> Host endianness error.  Copy to local uint8_t first.

Oops, good catch, thanks.
