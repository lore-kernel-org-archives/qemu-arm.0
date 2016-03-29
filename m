Received: by 10.25.208.211 with SMTP id h202csp1905920lfg;
        Tue, 29 Mar 2016 01:31:47 -0700 (PDT)
X-Received: by 10.25.89.199 with SMTP id n190mr542224lfb.16.1459240307740;
        Tue, 29 Mar 2016 01:31:47 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x229.google.com (mail-lf0-x229.google.com. [2a00:1450:4010:c07::229])
        by mx.google.com with ESMTPS id f65si16271187lfb.67.2016.03.29.01.31.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Mar 2016 01:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::229 as permitted sender) client-ip=2a00:1450:4010:c07::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::229 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x229.google.com with SMTP id k79so6264667lfb.2;
        Tue, 29 Mar 2016 01:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=S8Of8xP5cld65oGRPA9t+uGvk2QpDSxn4iMhLhFDEcU=;
        b=qj3sFCwhX6Gi6YG/gQLDMObH7fjmCqvSRBBUIPUvCmcVh3qEXwb9CHrMr8R6n5sZZh
         /Szs08LhPd8Uy2eq0ZdYS56LUxyfQy6++QzrWH2Kx8YqylzJjfK3ZHG/jBQFnH4pprTo
         JUam1SstiegRzxjRTFbljQHhcSOmQA6fzLtMeHLGgNtmFJ2PZ2EiET8ZYwlsoEcfnxvK
         kph04dWBzvNiWTrC5rfNCqOxUwMy7lM7nZs/DaOXa10TgsZs7NzcTF3Rx3nhDWWOl60L
         MCFg+0ZZOo+zxkugeZdzdjHLPFqfZUx/wLnFx/1YVGwb0DFkvRpIULzXdFXcQNFQ1djp
         dzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=S8Of8xP5cld65oGRPA9t+uGvk2QpDSxn4iMhLhFDEcU=;
        b=HbXJ/ujiU/DjaT0IgjgdemRrOqh6FTejLiXWfcShdO6wzcZjA1xdXL/8d5U7m6CSj4
         43kkyIoXUuCa7/IfPkZPcEKqZd0oROzQV0x948KQed/tsFJsipcskAeJU69BORs/x66Y
         e6+Y8hSsX9CF+qaZBDvlh8L/qa8FbTkvHgzlWcSziI2ZgRF2GxthvPHDlebm8HvLRB9D
         xZL0uXvHwQTj4Ka75QqlBcW3opMu2Yo8DVOHlQzYjziaALsBc8UMZx3crsunXXljeL1z
         uZA3dw0MPlVmPPVzJh1GjUAAWZnFBNJVdFPEwfCttLqdb0xYfDNBm7G5+Kk+XYpTdk6m
         sMlQ==
X-Gm-Message-State: AD7BkJIl18nwhpFSWJ562kYsRu3SH/AEuWSX1jSEP35LSKR+/xKKSDQ5F1CsNwICm/q0FA==
X-Received: by 10.25.34.213 with SMTP id i204mr523384lfi.120.1459240307484;
        Tue, 29 Mar 2016 01:31:47 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.119] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id yb8sm52955lbc.33.2016.03.29.01.31.46
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 29 Mar 2016 01:31:46 -0700 (PDT)
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
 <56F9AC4E.4070304@twiddle.net>
Cc: sergey.fedorov@linaro.org, qemu-devel@nongnu.org,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56FA3D71.2010505@gmail.com>
Date: Tue, 29 Mar 2016 11:31:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56F9AC4E.4070304@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: CIQFnip6qGFi

On 29/03/16 01:12, Richard Henderson wrote:
> On 03/24/2016 08:11 AM, Paolo Bonzini wrote:
>> There is also a case where a TB jumps to itself; it then appears twice
>> in the list with different values in the low bits, such as this:
>>
>>      tb->jmp_list_first = tb | 0;
>>       .--------------------'   |
>>       |                .-------'
>>      tb->jmp_list_next[0] = tb | 2;
>
> Of course, it begs the question of why TB would be in its own list,
> even if it does jump to itself.  We only need the points-to list in
> order to invalidate a TB and unlink it.  But if TB is being
> invalidated, we don't need to reset the jump within TB itself.

If we're going to move tb_phys_invalidate() outside of tb_lock, we
probably need to reset all jumps to the TB, even if it jumps to itself,
so that it eventually finish its execution.

Kind regards,
Sergey
