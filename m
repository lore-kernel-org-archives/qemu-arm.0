Received: by 10.25.208.211 with SMTP id h202csp2117504lfg;
        Tue, 29 Mar 2016 08:37:58 -0700 (PDT)
X-Received: by 10.159.36.150 with SMTP id 22mr1702095uar.11.1459265878446;
        Tue, 29 Mar 2016 08:37:58 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qg0-x243.google.com (mail-qg0-x243.google.com. [2607:f8b0:400d:c04::243])
        by mx.google.com with ESMTPS id 23si8804380uaj.97.2016.03.29.08.37.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Mar 2016 08:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c04::243 as permitted sender) client-ip=2607:f8b0:400d:c04::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c04::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qg0-x243.google.com with SMTP id j35so1900215qge.1;
        Tue, 29 Mar 2016 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=QgupPlgo0I5Igne7QO8xQJpz+gBuAf9xSqDysUIl/eE=;
        b=zi1cjCANBEfDQjwWsA0SlLeEsOIKFuwgmqlf3fBG4YzaNCdMG7Vz5mWgNfM3WSoqaS
         0tqJ7K9HFIDazN3t6ZA+tFnK+eGAO/GUUOJH41BhFXdJEomx8gOqhTXn82GddCMCAP19
         YLwvLYMw957zH2izuFXTa3uP9BEl/lt0PpK0Cx7fDSfqr0laOzpJlOAUST11ApgixFna
         yG3gKlCeNmCFx7zZAV+gNUP1VhKOgUe5jCioqCbpASg5h3AbF4adfSVK2AGHc0aYbFf5
         IEHY/qtd/Hz82c8R1woLvfkP0NeLH55sdZPixEe/Ilh6SdMvNPZePWopsTe9jeLB8rfB
         DK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=QgupPlgo0I5Igne7QO8xQJpz+gBuAf9xSqDysUIl/eE=;
        b=WxXs9dVgPmO5ARTVmLyZWWT7nS2tNohFUoSmLLpGvUUFxvh1bwmHDVw3bIQ/rMNd3B
         ioUVBwqHDbnbWCStJvAk+VJVQMjavWDGk0hnLOPDN0lgjz7G32FdKOvGg19k25vrD4A6
         oCdphL/5hk3dNT2ekDt1oIKIfLWrfwcgIATiTDgL773cHVhthaVr5iGWGX9SoU1nZWCQ
         +vFZ4uyngd4dpekIwmDh65YZUMsnOKPz3YLCyU7/IQUbRsY3UsBMfvnBtrLz8V8EAqvr
         8jB8Xh2AOhSsm3k1fXaULh14/B2hQWXX7U+fVEUJ4JB3jw+7thUNIscllqsVvDoizQWS
         yatg==
X-Gm-Message-State: AD7BkJJx9+Op9i9iUFnsePZdus5n6JKf2RjQOqIpZh+iOgp4OzJ+ORAU2rCW2hq/WV7FmA==
X-Received: by 10.140.107.118 with SMTP id g109mr3602058qgf.89.1459265877896;
        Tue, 29 Mar 2016 08:37:57 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net (50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
        by smtp.googlemail.com with ESMTPSA id x189sm14013742qhb.43.2016.03.29.08.37.55
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 29 Mar 2016 08:37:57 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
 <56F9AC4E.4070304@twiddle.net> <56FA3D71.2010505@gmail.com>
Cc: sergey.fedorov@linaro.org, qemu-devel@nongnu.org,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56FAA151.8050807@twiddle.net>
Date: Tue, 29 Mar 2016 08:37:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56FA3D71.2010505@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: 4KmFXxTYv8/b

On 03/29/2016 01:31 AM, Sergey Fedorov wrote:
> On 29/03/16 01:12, Richard Henderson wrote:
>> On 03/24/2016 08:11 AM, Paolo Bonzini wrote:
>>> There is also a case where a TB jumps to itself; it then appears twice
>>> in the list with different values in the low bits, such as this:
>>>
>>>      tb->jmp_list_first = tb | 0;
>>>       .--------------------'   |
>>>       |                .-------'
>>>      tb->jmp_list_next[0] = tb | 2;
>>
>> Of course, it begs the question of why TB would be in its own list,
>> even if it does jump to itself.  We only need the points-to list in
>> order to invalidate a TB and unlink it.  But if TB is being
>> invalidated, we don't need to reset the jump within TB itself.
> 
> If we're going to move tb_phys_invalidate() outside of tb_lock, we
> probably need to reset all jumps to the TB, even if it jumps to itself,
> so that it eventually finish its execution.

Ah, interesting point.  Very true.


r~
