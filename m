Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2202424ejm;
        Sun, 23 Apr 2023 03:50:26 -0700 (PDT)
X-Received: by 2002:a5d:4645:0:b0:2cf:efa5:5322 with SMTP id j5-20020a5d4645000000b002cfefa55322mr11656738wrs.14.1682247026329;
        Sun, 23 Apr 2023 03:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682247026; cv=none;
        d=google.com; s=arc-20160816;
        b=ca8GhauPFpXDSSV0B7tO0zIbpAbuzTJjc8l98CwA451VH0a2QbFOYeMTCLDfp7NnPg
         WGEuGTnNPttEysLywEg+fvQFoCQZ05AM2jJfYbWPLgMkV+xDLlgnET2Yxbt36ebzgjrF
         WAoEOpqzjkj+w1fKaPpMZVg0fl+QfxUWzxxiUT9getsvoX+b+ER77e+68OX50B6dqrRL
         KYR9lCSa+J2V7iAlKmDUSDrlUIHVn6S2dobMH9sAtc3Gcl9N/Qv1W2f5mp/nuhaMJ2dq
         aHIi/4FKugzhHh0T4dWvhIZEODAIqqYY+B9tSnntWAtm5/987QTS7Fh7bOovDhqUy8Z+
         mJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OHMLCnP2qSgbk8dC2YujUSAdxCMOF5nyakmToRBHWPI=;
        b=f+SwW4yGZMrgFbJvLveBF+kWSM9zSM6lS/VS+qrxbNJbNFNCvQYvAYiSUsI7gGkOgE
         e/L4KW9zTbD3w4ObTb+SFY2RocBN80lzz6BTRQUe6szvfkJXWmQhos/hMrEZviZsRlAo
         POqnRTn0YBegJV4NgJDXLwPIwrEDmt/kNAmIbe1vcFboQvl/1/dfjDV5q5Tg1r4SaN96
         bzxqQmJCIX2q5ROt8uYpggEfWcSZ8ONEb2ls8oXvRdUSgZa9vtCsWsB9m4UAoRBjd620
         Is7r3iVTx8XBFuJ5Gy07j3fYSVrYsA+dSFUqV2dp6CH7Q+fFCmm2Sg8QgSXy2E7IfPgz
         KuHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fC0hcaFS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f18-20020a5d50d2000000b0030411c924fbsor1704004wrt.43.2023.04.23.03.50.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Apr 2023 03:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fC0hcaFS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682247026; x=1684839026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHMLCnP2qSgbk8dC2YujUSAdxCMOF5nyakmToRBHWPI=;
        b=fC0hcaFSpRGseRDsoU1FtV0ZIaecE2iLO/cb0GITVHUs+AI8ZbZa25ajRAhgoR/GIL
         VFG8VAZrRQ5iqozT1xpJQbOccZeyyVXdTAP+Ou24joazB2deMZFKMdvwVGzZihN1q8Ux
         UpFqlR1Er/7yTK0bssv5CUYpcFw49HhjsWbhdO1jTk8V6vFzJhi0obgzR+/xGTkd/3K9
         jqf+Xmn+bErlud/9W1VSToVxkBOmNadBgXIWyGbgqlQMth74RKEYv/TAQFcamHC2Z15L
         7eWXOLX6p07r3Tc/ECdeAP+t9YOeEu11HikFqE0YD/dBtzE4o6XKRZfDYwLy+mI6yqoo
         9Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682247026; x=1684839026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHMLCnP2qSgbk8dC2YujUSAdxCMOF5nyakmToRBHWPI=;
        b=B7RPyJKNMVEei4nFd5SuZu5qbUYXNxI7VV6jeJEDbL6mdG8OP53tX3eHc7o8zncyur
         EbqeurpZ00xuuRQKUsC1bc5fPcZOLRPOLu7oRrPPCgGQ2kOBKtzHqYl7ef6TAtfJ17IQ
         H39+VNRLdMJ/xMzU3KpqViD92Z2Xw/vcGqxlooogH7DNuk8xB+kNQZHB7aBaLSfrsOE2
         JADVW7yOINNdTpUfeN01lUjwmfA8Ekc9H9cAuPYUSjYWreDT0J21MCiNZyfIzDjNhOT1
         rDJ6i0OC2lU/6hSXg5YJ9ZQd6nTqeGnZpWeBVdImdzSEEAGvJ1j0puBZMeIZ8/TXFW9m
         jacA==
X-Gm-Message-State: AAQBX9c+XhsGl0iZCIiGL8TVsdY1VZ7XT0PYoAfvs0fn7d6PTdhe4uuB
	3drlFwROEZkI51+xANvGzzh+b+R5
X-Google-Smtp-Source: AKy350aD3xsY0xML8J+sMfY9glF2LMaZzch02CsRKWQFyVk+AYRz2nEwbf7Wtb+xSqKWvRx9A+zwKQ==
X-Received: by 2002:a5d:6702:0:b0:2f2:7e53:db65 with SMTP id o2-20020a5d6702000000b002f27e53db65mr7880999wru.7.1682247026108;
        Sun, 23 Apr 2023 03:50:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4410000000b002fb0c5a0458sm8378600wrq.91.2023.04.23.03.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 03:50:25 -0700 (PDT)
Message-ID: <4d744ee9-372b-c1f1-0d0f-be06b4b63c6f@linaro.org>
Date: Sun, 23 Apr 2023 11:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 04/11] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412121829.14452-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KxuTNeaIE0pk

On 4/12/23 13:18, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
