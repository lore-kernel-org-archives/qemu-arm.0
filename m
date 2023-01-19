Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp287113ejc;
        Thu, 19 Jan 2023 04:22:35 -0800 (PST)
X-Received: by 2002:a05:600c:539a:b0:3db:419:8d3b with SMTP id hg26-20020a05600c539a00b003db04198d3bmr10315101wmb.39.1674130955033;
        Thu, 19 Jan 2023 04:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674130955; cv=none;
        d=google.com; s=arc-20160816;
        b=UsJvA08G192yBjiRd5mEXg6VuHKc/yaSTPA8xGIsaEVRwm/zac2h8wmJeW+cd2hOGA
         9tXpGEmwyK9alHF5lsWs0iYCuwCdb2rpOl/y6EpGhVhRlavnNpGZ13NZYJyxboqK7GgH
         GbniU11GviFFI6zZlq+Hh2B0CFGe9daeSoldyx9Pl9y+2PlNaY8pi6p1x8OdyDnyJpZO
         mAFn9nRZk9y6EH1ruz20fYa2WEEpxcgwm+BRYC63iCHCrvwSUy3y12isJl9A3Njaxw+x
         jUoUkFfpZ5BnuAONxQRumZ1mHT4hAnIWhpWbQBgwE/4g6rpC+FIKqZ0Pn6qWODzoRj9C
         Ynwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hHr68YNLjgrtVPNFsAmzWVYBfNgozAi0f+DBujXAI4Q=;
        b=Jm+WjAfBft1Q7Dlj98Zn+V7BWJoiTrgEOg7GNquLeeK4abQB27a7W2mZfR+4Jr1SrJ
         FBf6IQVK22/5sLm0LjvsyiGo9Mae5DbKZA9LsuS5qAOtpUH94oTMaqE/xuq7+754v5PK
         Q5Txqo3TgeJIpCiv+GcJMtJR18xDXPTKip2SWBUVoNJqqE5XXF9NLx7lnpTTrSEHAgkm
         ck1hMkzE7hYqw9ra7WClMPAJbx5nhiSivNbRdzgu3A57kN+6NWYGB3IuDTj71WSa03Fw
         HBlATaBwnl8ayRoWjwsiRtpasqm8N4i+oIS84XTvqcjnVvdBDfGn9FkOD18OvJF5OrzE
         uWIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8EWq2e3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 1-20020a05600c230100b003dafd2b2b18sor1680063wmo.25.2023.01.19.04.22.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 04:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8EWq2e3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHr68YNLjgrtVPNFsAmzWVYBfNgozAi0f+DBujXAI4Q=;
        b=L8EWq2e3aFm1O8HNSjDsk7BBQDLi6vvVAXhLY5Yqv5ZD+slaDci9KNU1OndqCt5eNU
         R2s5bcUEbSW3o1YdNpiuFS6OzZUk3lVcBK/iHU46dZgA5Iyz+LmKtA+79i/BTMlhjUAe
         Nn133UhHuHxXdZSF17ww7DVnaudqaxC25zRfgBn8rXAM1oDC1L18EmW5mnevLLY0PQyY
         ocKzyZcRDrTUmNVjsgNBfVLnKSDsSo1eHPp6WxL1cRiN1Sgjyop/zxGVqkmBLj3uI1Iq
         9rcAiPXNA0fYAHp7d4AY35yjysyeF76GOM8dhrGSPz/woQWWFp/5UvvuQersRlZ0jGLj
         Xe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHr68YNLjgrtVPNFsAmzWVYBfNgozAi0f+DBujXAI4Q=;
        b=T4+tU936LHnuhNDGx93tJ/Pu28yL8UfyyrJ17s3JrS3J2xzT+lSMsvP8oJ3LM185CB
         /0EsvqNahOqJcLslz4WOU9JY+C6GRlNCI6N1dmtOYTaojjmfCJhSl+kEC/ISBPETXcJd
         gawN08QQL1cpvAzBCZPFX42HGK685k+ncI5/HsIjxFqlmTj/yKm40jJD3yiELnnwZWrv
         UeahRu5jNfb0iOIIPgP+a90B9a6MMEStNE5+9nOAa8v/LIKdaT4KD+BaslMDh3pumGA1
         ko6ClaaRUUYLB3ewmGfM6a6k+Io6401PnShNC5xtAQsjn8A3DZkXlxMv6KCeJ0tLDR+K
         ZU9g==
X-Gm-Message-State: AFqh2kr2iMHAIVt1U+TT+Gnzet1OqBtwTW44Xr9foqWGwrC/IAhLFW0f
	t+xcc0cjOdYl6PT43X3H/8JFsmL/
X-Google-Smtp-Source: AMrXdXsyWFJO3483+d56KHH3FUH+83DYcst8R4lL17U4hgXmogN+U+wWudDdIGQ9Q5yO6MuFQ0DYNw==
X-Received: by 2002:a05:600c:314b:b0:3d2:3ca2:2d4f with SMTP id h11-20020a05600c314b00b003d23ca22d4fmr10379663wmo.36.1674130954807;
        Thu, 19 Jan 2023 04:22:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id bh25-20020a05600c3d1900b003c65c9a36dfsm4861626wmb.48.2023.01.19.04.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 04:22:34 -0800 (PST)
Message-ID: <3a96fae2-8734-b55d-748a-27b08bed35c0@linaro.org>
Date: Thu, 19 Jan 2023 13:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Language: en-US
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: l9EsP5niTgZE

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>
>> For the build _with_ TCG, this should behave the same as master.

> Testing on Darwin:

> 17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test         
> qemu-system-aarch64: unknown type 'arm-gicv3'

> Reproducers:

> $ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
> qemu-system-aarch64: unknown type 'arm-gicv3'
> Abort trap: 6
> 
>      frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
>      frame #3: 0x00000001003d32e8 
> qemu-system-aarch64`qdev_new(name="arm-gicv3") at qdev.c:164:9
>      frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init 
> [inlined] create_gic(sms=0x0000000103ff0d10) at sbsa-ref.c:405:16
>      frame #5: 0x00000001002f30a0 
> qemu-system-aarch64`sbsa_ref_init(machine=0x0000000103ff0d10) at 
> sbsa-ref.c:773:5
>      frame #6: 0x00000001000905c0 
> qemu-system-aarch64`machine_run_board_init(machine=0x0000000103ff0d10, 
> mem_path=<unavailable>, errp=<unavailable>) at machine.c:1404:5

For this one, I *think* the sbsa-ref create_gic() should follow
what the virt machine does to select the gic, generalizing Alex's
changes from
https://lore.kernel.org/qemu-devel/20221223090107.98888-1-agraf@csgraf.de/
