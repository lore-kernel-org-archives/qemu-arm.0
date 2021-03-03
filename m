Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5724237lfg;
        Wed, 3 Mar 2021 14:18:04 -0800 (PST)
X-Received: by 2002:a17:902:82c7:b029:e4:74ad:9450 with SMTP id u7-20020a17090282c7b02900e474ad9450mr1139004plz.58.1614809884037;
        Wed, 03 Mar 2021 14:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614809884; cv=none;
        d=google.com; s=arc-20160816;
        b=li2QGHrZZ2vGA5x0Pchgm58ALYdAWC5V+s0AgmzoZWAZXawb1UV+VpAdS0jXBTa12r
         bVwsOshuCCPAcRxvHDdd/kWl20o9bBsvWNZ2VOajQ3tbaZ83aXkN9HbfXRGGHzAATGy9
         LPnZFtK2QrAncz9M/Q9sAqgn12Ic8TRxAydESY5fu8mr+PFtZ1pyktQQDJ7CC79PvLYQ
         IS1gfWKnaYNNa/BjbN6LPlGX2bha5J5TDBjac8ENqygjIBemDxshv+cJFgtE46TAHUgV
         7NryYpjCbL6mrqsw+P291Wl+/4bnYQrMpUJu76xPh9ejclcfbx1t6A75SUECi6hnrR24
         GLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Sd1KQrE+7PvLj8DeQlRirIEkM8G2zEYBVS8Kcun2mjU=;
        b=J4k7Psv/+xlyzJjqj33G0rmN/Bqur9ax01nJBPdea61wKqtK0wjqOEmfhmHx37o2od
         kyf2R56j+z88cOxD00Ep98BU5xTcqkSFd3+DDoOwdHMI7CAY8C5/hV1UplYGjEJAWatl
         Bbrs8NSDlnrPM3pb/CvulPGuivb3bErLaONSUp34EmHDrarepuCftd30ivk88zGeofx2
         LQz5PCc5pDBXM5vE6p5HAcLeydDVOrXchuiuI7XX0S4v1sLeqM8xRAkmeq0YUUfV+Gb+
         F9BcOSnPQt9gnXJN8agslKBJt1WR2QYAVPTcxy8uf5C3Kk5gAvCpqsqJfQlFIQGTuwQw
         7qEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtlRbNiH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k20sor4315849pji.41.2021.03.03.14.18.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Mar 2021 14:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtlRbNiH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sd1KQrE+7PvLj8DeQlRirIEkM8G2zEYBVS8Kcun2mjU=;
        b=wtlRbNiHy8VA+9nOcytXmidMFpSZZ2PR8xQ+X0sLQobkOwr0Hi0UCXWEwcD7nGvSbC
         iq3N8RS3IiwL5izYaiicesMphwZii+Jd2p8uMSZjA7fGtgFFVKdWwkjTmI8I0nsF34eE
         RKhWhASk671Ll0vgoVDDMwC5t1GV//w9hJZWl+PAWca2XOHpfrhW+TuEv2l7L7UNOT93
         OyuOI3AEEkuCILc20c/j2v1Y1jvnJSGeJPI+M9x0o2DRlQA1ipqqMYNnTnoW1w79pAk7
         KU8uPrb4wjmKc8/7IwsgJFzQt5lS0RvWTGPoPp95lk7dgleRCw4fLWOxXwXatDr2+R2l
         6PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sd1KQrE+7PvLj8DeQlRirIEkM8G2zEYBVS8Kcun2mjU=;
        b=AOcXHtNa+FrGsENpo/t0Y/LbtPgl0DoaJRvTEbgjlsA5Xu5JKZEbxPBhCG1cHA8Dc+
         DRWhbuF35xvm6/LoqBPhrKFg27O+7KmxXvfeVRMMelIV3nQVcoOW/pFVEH9WEI2Syy5d
         s8C+sQ4FpP34/xavqh7W/Pu8FXJcdyzDajGfe0ssmwoZPJtjJnXGs/LuhWtjCwOy3QVv
         SsBvQ1zJBxQBA6ga/lSHJnbIMvwz0VkkrnVddQna6CVtKtPZaaWOjx6oPddhtI1qwW68
         MaS1Iudza6JX1ixFIJcKVrL0OHNi58qz+jMs4CyBDxyD1lYuQCJ5SwyhtFbAQc4o1Pyk
         dcNg==
X-Gm-Message-State: AOAM531QKo2XiCemIH4uUQhonz403C3nAfgtGc3BlWhCTwmfSQBCsVwk
	gKDCLWH2j7P9lcY6OnW90WZHks/+
X-Google-Smtp-Source: ABdhPJzu9VMeod8BFMV6zWo1oxqtazlBfKPZy9VUJWk08OqNc5BxBkvtiYDtHWN+cl4jCl6K7IaIyA==
X-Received: by 2002:a17:90a:8:: with SMTP id 8mr1240847pja.6.1614809883533;
        Wed, 03 Mar 2021 14:18:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
        by smtp.gmail.com with ESMTPSA id h7sm389711pfo.45.2021.03.03.14.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 14:18:03 -0800 (PST)
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
 <20210303171059-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d17a5ae7-2b71-6b53-f7c3-df2406a001f2@linaro.org>
Date: Wed, 3 Mar 2021 14:18:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303171059-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bfeDLVNTdqK1

On 3/3/21 2:15 PM, Michael S. Tsirkin wrote:
> On Wed, Mar 03, 2021 at 05:08:36PM -0500, Michael S. Tsirkin wrote:
>> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
>>> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
>>> calling CPUClass internal virtio_is_big_endian() one.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Using virtio in the name here probably because virtio wants this?
>> That doesn't sound like a good naming strategy, name should
>> tell us what function does not how it's used.
> 
> On a more concrete proposal, how about using this change
> to rename the virtio_is_big_endian field to guest_is_big_endian(),
> and put the wrapper somewhere in a virtio header instead?

We already one for normal guest endianness.  This one is for when virtio 
specifically differs from that.


r~
