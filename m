Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5323712lfg;
        Wed, 12 May 2021 12:49:27 -0700 (PDT)
X-Received: by 2002:a05:6830:15d2:: with SMTP id j18mr32259352otr.89.1620848967105;
        Wed, 12 May 2021 12:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620848967; cv=none;
        d=google.com; s=arc-20160816;
        b=qJ/+nnkoI+haHpx8/jdn9kknCbabyIkvmMnHgkGkYhoSYpCSIoEOyhaBjyHIg76AVg
         2jse4etgaf65y1krmJujnAQ0ozOXXuHBfVQlwKC3VK1rWiAyOGBuDgJHpqHmLC/x5yKa
         6cR2Oti27QnPXq37MziNZvOW7XboL+rOEKnJVzSc8Xzr0hgqfkEHc6dXQ/NXtRdY8E+e
         h5RmiApqRBSnBzv/Z5AxMOSB5DvS25tVQL9yXVJVFOmaVmBXeLX7ydGFSP9Pn3sklxQC
         Cgw22csge0v221IfPUu0x1i/aJ5YuXoVPX+wZF7EabUtQstfKcsDLcUA0aP7R26+NG7j
         5rJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=YluWeJRgWFZw3gq/0rankOlgnBZOT9VWouGONBhX1ZI=;
        b=oeBsY44dD7c1MThE2fUkTSpkzVJ8VR6ZWg9Bkty1+raPkUHbdRYZt9ZxHnPco07OTV
         GE0VLa1Bq0Mrd4vpF5K1qILBPUW1zS17wSp/K0TqeWg8UEclOxkQf/XXp0TVKTXoqeEa
         AV/xu7Y2AmUPbrrAxfRVBfLi4WBTfifQNEi3xoLFigdntSdIo7YmiR/4P/PNlKurQobQ
         1eFUwqE36kMMwUdx/WFX7SuRSiZzO5GDOBBJuTOFomN/L21fvlIcmldMVrAKMo32A7sD
         OfbBbC7bUbHuRsvYl/fkoANhPYNHz7bJ3eAAy/SDCWItM5n0nzSgz9uecP3nYOwT79Ip
         rXtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=W6J7zB95;
       spf=pass (google.com: domain of rebecca@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=rebecca@nuviainc.com
Return-Path: <rebecca@nuviainc.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i6sor186491oth.107.2021.05.12.12.49.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 12 May 2021 12:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of rebecca@nuviainc.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=W6J7zB95;
       spf=pass (google.com: domain of rebecca@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=rebecca@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YluWeJRgWFZw3gq/0rankOlgnBZOT9VWouGONBhX1ZI=;
        b=W6J7zB95M7MNUeRogI+JCA5EME1n4vslpvqeobTN97nr+E8DqCaykhHnZAj7hvLo2B
         FELlLKj3Rvj1ss873Y8Wm/qXXeTvHrYuftcGtqHqr4xcGW0aZQaAVpCWlEJ1uWT+ReRV
         m0Zo/AoHU93qW36r3CWXa7+O5dVNYtaN1Sm8qmKnZ5wEfhtoNJMd6kmpKnHje78UkbpE
         X4+kIh0zJc9hh+D3m93AB+LDmQnIMNFKiw8cB2/pZ/8rPDDeyqJg4pjTuELSjSgvX/5W
         guKwMNfWS8PUKxilLRjaPnLHEEv084Vd7CDvNE8pNXZ16X2B3SFcdlaXV3Go4ikBzCEt
         nKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YluWeJRgWFZw3gq/0rankOlgnBZOT9VWouGONBhX1ZI=;
        b=IxmonSeV3chGLf3G7Emy28n1tP6Y7Se61pjqXypNcF+9N/UpLWTZs11lNh5+Kisxd6
         g4/N9Gr1WTw3pq228R5a7+hTP+sap4QVYez5BOBhyaIDY9KSMNlURY2vOh+jydMzbiSk
         gWHj1G2+UilF8AsMSctuq+glrDrYzI9fIOQaVSncKsaoxo+ulH4NiMnbpCHiIUD9BpGM
         vt984+Z1ZNphOJKhJaXoOeroMNuQ0eG4JSgoHJelHWO3f8q2vUU+EhnpaUe7II6bVJWj
         6kvhmEXw+0RsjCyih0bNvUs+qOTemuE8RdTCklGMrZEcHibq9PI2drXzNY1JnLD47VVc
         u+wg==
X-Gm-Message-State: AOAM5323VXLPvPH5ffPFJ+xovd68xI2U9dUn8aDasNTNctqc7Oy26OEz
	qEsghfcoEWp9ffFYv3ImLkfCbA==
X-Google-Smtp-Source: ABdhPJxVgJ1+FSb0agm7E9/6uE7m7cu2IvwHBohdkTu4jutsVkCs0lieH2VUv0K8OPA6WNRGHyAuKA==
X-Received: by 2002:a9d:6c86:: with SMTP id c6mr13689322otr.9.1620848966689;
        Wed, 12 May 2021 12:49:26 -0700 (PDT)
Return-Path: <rebecca@nuviainc.com>
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net. [174.52.16.57])
        by smtp.gmail.com with ESMTPSA id l131sm181853oia.0.2021.05.12.12.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 12:49:26 -0700 (PDT)
Subject: Re: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org
References: <20210512182337.18563-1-rebecca@nuviainc.com>
 <875yzng318.fsf@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <d78ebe03-e10a-a080-9bb6-279e333c408b@nuviainc.com>
Date: Wed, 12 May 2021 13:49:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <875yzng318.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jjfKNwIvUlMh

On 5/12/21 1:32 PM, Alex Bennée wrote:

> But it's needed right? It's perfectly fine to pull someone elses patch
> into your series if it's needed for the review. The alternative is to
> add a "Based-on" tag to your cover letter so it's easy to find the patch
> or series we need to apply before yours.
> 

Yes, it's needed. Sorry, I didn't realize there was an established 
process for this.

 From previous patches, I see the line should be:

Based-on: 20210508201640.1045808-1-richard.henderson@linaro.org


-- 
Rebecca Cran
