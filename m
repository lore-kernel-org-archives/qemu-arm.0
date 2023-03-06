Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4419726ejc;
        Mon, 6 Mar 2023 01:19:27 -0800 (PST)
X-Received: by 2002:adf:fe86:0:b0:2c7:a9ec:12 with SMTP id l6-20020adffe86000000b002c7a9ec0012mr7172104wrr.11.1678094366936;
        Mon, 06 Mar 2023 01:19:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678094366; cv=none;
        d=google.com; s=arc-20160816;
        b=qOQNtXWoSZUiY68kJUig5zENgkzj7J4vnr4aTYNX+k/MOJk51wmDLgScefn1cj5Apc
         ljt964Vvv9+R9tCl0xLVDBXFcjkhAcp3J8FsbjG94A0MMrRofwETF7HRmHuuSk2xRqhg
         WiX2ph/EP8mdKvarLJS+sNpZdRBJL/tEoDE/UMDZTDktqBXEcm88UoPQBnWh0eN1X9tX
         UO3ukgZaGq3Zd2SV2+i/TFZc97At2EL2fDbssklb7P2CvnUrH8DqglpBo5+TN3I1UUnA
         aUtlutHwGRXeliNsPGUu8FJwCJoQrJ0tjYPQcuyfRXTDYs80WpQH2zLq2pQJKmGROzhb
         reuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
        b=E59IBNDz3LRDpOVITXbQNP1613cdH27imXEBMrvrrvPQa9G4/VVkO/LSl+RhhID01V
         oUTphGRZKyaBjXAREhZKLGDtQKis0Z7GVwWMimN7MY7b+g/UCF007bkuqSb5Njrc4DqJ
         1piPukpdYS2quxkH3X4oZlenaqZHj2m7xik2ZkVcdZAUxxF31HOMiUeZMJuI4rzTLxr6
         hQGXQnqU4BxPt0P0zz51XYdCaaZMjEsSziIlTz2CqSE7oWOJEnk+0zuI0ZwCKQUSsN3x
         VvKg7hclyFs139qZ49fSlfUZjjgcV4ufeEcV00k3Lweb1xKfeCeYvABK+TbK5R2uNwWv
         iJvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DoGQQJZd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5-20020a5d6785000000b002c57de47797sor2933546wru.2.2023.03.06.01.19.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Mar 2023 01:19:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DoGQQJZd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
        b=DoGQQJZdoqFHDOtbxQ73NJqmi02v273gLkXN0yjk+YT/7zY8EqBGtqRcik5T9ez3Nc
         nmJtaAIbHFQJTvGfQOvEa4PBZcuRsqvDJEWjmo2Y2XEDY16FoZoRKjBVKMuwsn9W2ywc
         YBsAIbZM+gzVtaF08BtiIgi6Wri99eR0o0L3Gfc80PI6IOY0c0tXBZL4iJnxqqEz+ljs
         fHix0JKHzhM9mKZLmzeQqzCO/ilr8EOL3K0jV27w82Hi5T8ODkqWcls6gAkKAlVW2ZrW
         k9pIh2xOiSlXwjQf6pZkO4zbxCy4efHY34YrfeAPfSnZa1/5gBxIM2LWwk+zlD6lxx1k
         VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
        b=iJrbXemaExhYy5OaVqljvzl6IRxZAaSmWoz92MSO66NMlo6B68XMj4bLmkiMMkTNHc
         PI1TCLk0Q1Hs0SqGsoOAMHYZqRUZ/PwHZ7MNHMdQbKhzNhGrRjfyPWRR/zUXe6nexFke
         3uiK6kYZIToFpRaixK0UcU+tg3RUcz1PRpKVwjh8efuJwA7Q9QmNw+Lg94Zz7FjrNvrM
         WD0qbSbyMOq326zT0/WpFTDtBigxbtSbFYyLb/Itj2WuNisXa2mjFJ19dWxq2vbs9npa
         uIo4ICLXZFyQW+kzVpWlelHf4ozqQnm9L9VpqQ/w1VdX5x96VPXeNlkLhmcpbUjHGAuE
         lLMg==
X-Gm-Message-State: AO0yUKU8hmkfdp0+uFml0ItFI7kM7i8dMg75dpSpWupq345T0L+Ql9A+
	ZY+MzR6ZlR8BI69OH0sugxSVdACM
X-Google-Smtp-Source: AK7set+jsAty6DpV+HYFXiTVVgLiQ5rrjzNYIewz64rQR7F0LEGTSV6+QptEOtlt0IcQBtu54VHDqA==
X-Received: by 2002:a5d:664e:0:b0:2cd:defe:cfd3 with SMTP id f14-20020a5d664e000000b002cddefecfd3mr6817401wrw.30.1678094366348;
        Mon, 06 Mar 2023 01:19:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f9-20020adfdb49000000b002c59c6abc10sm9449418wrj.115.2023.03.06.01.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 01:19:25 -0800 (PST)
Message-ID: <e2af415a-79dc-f4ef-6c10-5f6454c11b58@linaro.org>
Date: Mon, 6 Mar 2023 10:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] gitlab-ci.d/crossbuilds: Drop the i386 system
 emulation job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306084658.29709-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DDtTbGlhRQDT

On 6/3/23 09:46, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU with
> full system emulation, so let's stop wasting our scarce CI minutes with
> this job.
> 
> (There are still the 32-bit MinGW and TCI jobs around for having
> some compile test coverage on 32-bit)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
