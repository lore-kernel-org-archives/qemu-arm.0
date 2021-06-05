Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2126452lfa;
        Sat, 5 Jun 2021 09:24:35 -0700 (PDT)
X-Received: by 2002:a62:190e:0:b029:2e3:3522:2232 with SMTP id 14-20020a62190e0000b02902e335222232mr9913277pfz.4.1622910275553;
        Sat, 05 Jun 2021 09:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622910275; cv=none;
        d=google.com; s=arc-20160816;
        b=Epx46kVNDE8jrovP5sK3sMVewEZGNUWTxDWnpkPmoGGS1AUR6zqM5g0TWoEXn8SPsH
         uu2gN+s+kIlNt0a/+pJZeyck8J3LnReN8DYpBMDJyh1u0+Y2yV/WVSDQhRtGOZmVeVY8
         bYCjJyOR5lLaxo2112ci51CKbrtaTm4i/oeL2VX7+phjzzPK5N14KJGumiqyEZbdqe3h
         Aff07pl0qbCku91m1SSjG1PPJGDRRv11ApYDq1Ga0WND8i3S7K5Y8a3vSH9hX6sd9gZT
         fkLUYKfh2y1BLNs+3gQIorLbZad2oHzgDHWwJzOiPqOOoYoXqq9rl+KPvfzVBymIZx+y
         mOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SNG8ngesPIxj4WmDTXPwZou71DnjwbHocoNlS18paFI=;
        b=UgM7VpdvG1IsPKz3w7vxUw9fmswdxAmnyMfWsS6ddDZYpc5zut42h37YBLe8ILWmxX
         z0O5SbP0Wj19GvFzlwjosSd85OkGjLge9QvmvbScrefJmzLf1V9i4bd9wmbbgkn9qXYf
         spD/K0i+QNfFPfKz0mYB4bHRMMq0t3tkjBbsM6yImBoCy7SjU38bgBY9WGN5qVsluuyL
         0W2byeOwBhLjAPKy462ZpGAic8ZWyY4a7MZLib2xv3D8MWfF6ycdn9nDMNpxEc/+dJ7B
         LNYEbFRK56/IkGUfRgzKlEanzfhmmP0YjDmlCCc+FGmZFL96UapFs7oxs5c6D6HBY4Cs
         xUNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYkL0VqE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e11sor3464390pjl.6.2021.06.05.09.24.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 09:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYkL0VqE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SNG8ngesPIxj4WmDTXPwZou71DnjwbHocoNlS18paFI=;
        b=wYkL0VqEGJWRZwwzz2ES48mfwW61PNW4rVqH+11ajfd6iWszUa08c56bHuyqCanEgt
         JfjzAaHFbfb+qXV4pKYBLar8jNxlRHRtigdg7owTgSbQvWnRk6bOKO7fmuN/ZzxwK1aS
         gmBpSUddhll+hNErtKVOjeKCkX8pK9CZyj6XV0wpcaPmhUJ7jkynmRiEzM8HMkljuh72
         iEx2NeAgooxbMu7QlOmnZfpKbEaGfKkrjegX3krZDtF8m9UTEMpAXR064AP+uAvEgtCu
         O6XCNzC+tRtdilM/lGO9oz+nPY6sSxXf96rU+2S2EB3/WBix8tYWSAIWGXvAKsMCKk8Z
         XxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SNG8ngesPIxj4WmDTXPwZou71DnjwbHocoNlS18paFI=;
        b=Yfvfkz0kFDVLIAnRq6MRfQvhSHXTQBhQEhbLoKWWsCGOzKJ2M7mNyLSfYKTRl9i95j
         WD7QEbpLKAxitVL8loCXswOscCckXh9EliKrL4BFk52VpBybP++vumQcy8NbDEYbCZVQ
         wXM1eZb2R5J7nRSqiENYuq4mI/ybT7fMAIf4vhwYhuAmq5uoueg6DRniSmEHpa/v0Gb3
         Os9cwzD0ZX48mT5s0TRVgOQai/uDabNb89uprRVK9WzasejvFcuxmOGjZDCqcsv4N9dp
         cnidXMYydtGzGc+wi4h9y1swWXb/+0Xp85hkBDKG7hirPBTFgNo1zxtwPoP/dEnNSBG7
         mXtA==
X-Gm-Message-State: AOAM53090XHhM6aCYeXVTdX5805Ghs+AJw/CLIYUpdntBwg+IOPSZOVs
	raVzJiCeJfa451xUH+is5VfubXwU
X-Google-Smtp-Source: ABdhPJw00utj2uEHjlxni8z/2qhht9cYgH6mrRm3ThWwsBo3HSuQMO2y5Rz6iJox+fFOpnnC/Ov5wA==
X-Received: by 2002:a17:90a:f317:: with SMTP id ca23mr11366904pjb.174.1622910275035;
        Sat, 05 Jun 2021 09:24:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id f7sm4283527pfk.191.2021.06.05.09.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 09:24:34 -0700 (PDT)
Subject: Re: [PATCH v16 63/99] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-64-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24538cd3-0e17-7c32-4b71-8ca994f5cdc9@linaro.org>
Date: Sat, 5 Jun 2021 09:24:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-64-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: B8KPqbtfAp+v

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> test is TCG-only.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/bios-tables-test.c | 7 +++++++
>   1 file changed, 7 insertions(+)

The new qtest_has_accel should be used instead of an ifdef.


r~
