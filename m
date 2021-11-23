Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp8738064lfk;
        Tue, 23 Nov 2021 06:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNbhkV6oZy/Fs8/kkufwsHAoqVwn6dMXrPyZqASKOZdiwULvwAvCZebZA5nITwwhuti36M
X-Received: by 2002:a05:6000:181:: with SMTP id p1mr7608964wrx.292.1637676028394;
        Tue, 23 Nov 2021 06:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637676028; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ6cFVTS9lWhTeQuXRRivu+Q+FxDKRzTvStey0J+7jQnuT2JvgPq6YvcMbnXRUZE1m
         e69yIlGu3wcdvy1NP3F49z6XzAVMO7skUCgLbkb00jO8hninQVVqf/AckuOyhYNSk734
         exWkTk6tZZKjEB6tuplcvSnG93DJjjc+Cxv4iRuE16EOxfAF/TqBKHTq0ctlwBLS3WIZ
         giNMwZfKiHc5xqDLqtu91Hge7si8YcdeXiaZ9HfjfV+z+vGK7l9OLfz+I43M9tYCBzCn
         gYnbwALAaG1jlWXEqrexfmbTcpIxdA4FQyUQ6si/98X/2kFsTWx83HzVr0nfvcZNnwVE
         NCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Z1qpUZcowPzxZB+lwhdLG1mpM16ZjVRF+x0KoR0SvgM=;
        b=ZFsvzVdXi8+vF5218LLaLOtrT+4xZV3Ev/zSeMRe5ZWj6+zvtXPArzUIBOf1M3T4H9
         u9qbaV8ewkvBhTS7Fap4Lf5t/YkB0F29HGF+GDhrIIfRhER7NGx6yO77TrpYQvo6bcqx
         WVl4H0HebZTTIyv9VX7gIborTiSc7FzW7hYmvyUG25pbCo28WoPE9wDwqv7vy5eI/f9c
         zjdy/zrn2+JZToBr094s8gL+x+rxM4kiR5A3VvhinYzn6IGlDM/ayqGieunYpmlr8mP2
         pizKDmOC6Lf5rnVUsYbeI0cjKri9PN2H8TfzHrFQc1ISmnfnUPcnS9L7Cq06wyvCWHeW
         paGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id j18si2889168wmq.3.2021.11.23.06.00.27;
        Tue, 23 Nov 2021 06:00:28 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [192.168.24.189] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
	by csgraf.de (Postfix) with ESMTPSA id 9632B6080235;
	Tue, 23 Nov 2021 15:00:26 +0100 (CET)
Message-ID: <5c36aaa3-158b-815f-3e71-badfe2d12632@csgraf.de>
Date: Tue, 23 Nov 2021 15:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 saar amar <saaramar5@gmail.com>
References: <20211123122859.22452-1-agraf@csgraf.de>
 <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CjU6TDQg+nb4


On 23.11.21 13:34, Peter Maydell wrote:
> On Tue, 23 Nov 2021 at 12:29, Alexander Graf <agraf@csgraf.de> wrote:
>> The virt machine has properties to enable MTE and Nested Virtualization
>> support. However, its check to ensure the backing accel implementation
>> supports it today only looks for KVM and bails out if it finds it.
>>
>> Extend the checks to HVF as well as it does not support either today.
>>
>> Reported-by: saar amar <saaramar5@gmail.com>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Without this check, what happens if you try to enable
> both eg virtualization and hvf? Crash, unhelpful error
> message, something else?


The guest just never gets either feature enabled. No crash, no error 
message.


Alex

