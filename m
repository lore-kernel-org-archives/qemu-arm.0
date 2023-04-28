Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp178372ejm;
        Fri, 28 Apr 2023 15:35:33 -0700 (PDT)
X-Received: by 2002:a7b:c4c1:0:b0:3f0:5519:9049 with SMTP id g1-20020a7bc4c1000000b003f055199049mr5860241wmk.8.1682721332822;
        Fri, 28 Apr 2023 15:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682721332; cv=none;
        d=google.com; s=arc-20160816;
        b=HStuUTy0UvukqjWK+lJxNrW+I2ClbO6cJn6YyR80EPdBDZSCv0LknVSGi1MrIBIWf3
         2c0D8QFosQcKdxNCkPFLZU4Gj2eS/kTPD8QOcTyai9o2bcFfEJ1UyiGyUzz5ikW2FaY8
         APEaLJKpntbY5PUzA02D/mpSrJ5Ouf7iQn1uG6Ew7Io6Zp8YfpMD7MSeQrVMuWAEw/xJ
         gCvPVtW/NZgZBZRqApDpMfqkes54U4X7hEQBd0oMAfZA5K7AAycsV08ki9JBfV2nxCrE
         FTGQSyY6yJVv08NJjyTj6363QplZ+1RFXIqyQgfEh0G8uElYCSAVg9QPxq0XwarvkCSu
         ehSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wcIcBWFparvJl9zqBu6UosahOTUhgE1Q8VQ2JrL7r1c=;
        b=Yy/XbKcDkqRKl8iRdZTxXJ+OkEk/cYyFuU6TmVUks/IjF4DkjIlc+j3U2I2NAjeL7F
         LfI52H5hOTG6BpTqTBZI2nVo/XknJc2dG4N/obbokknmuHqj6LSV53iXoROyATEaLhLg
         ppkVFTL3yM1ksDh9v0L5hg9Kk2RoeLrrqOo2GZULwPV7CVLWF6ZkTSCnQpbBhOCRcIIw
         Ogh2NF0sU9txHQF02LAayqReu4jsTqtpeJB2PRMZ8XaUWoa7xGxaVhPj24Cip14ZF5oI
         3vfqgrGyn+BdUBmDy0Unk6E97+4MTtuyIYVVJKfd4IgWMaRsyL12s8d2E5bOZh/eiSXK
         tgJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h0zvG2Er;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t9-20020a7bc3c9000000b003f195ea933bsor5541478wmj.15.2023.04.28.15.35.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Apr 2023 15:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h0zvG2Er;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682721332; x=1685313332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcIcBWFparvJl9zqBu6UosahOTUhgE1Q8VQ2JrL7r1c=;
        b=h0zvG2ErzE498WaaLtzM5msQ1hQOwdvg4YQdrVO6/pQ7xdebj6msM5rK/xGim0B67s
         aigUvr3z6noQV9OvYjuMmsfAaxw3D5pTpF9OmqPYwc3BIsnXqZLZC6rLhVSptVgpZvw3
         8/L2/eXIGj7vRuLLActbH/e+vrGKO6o9HX7oqmtZoUe1t9wIeOqE+QmGtrxsuzsoaTT6
         41/S/+AgutJJz1PXqfUK8BXQFXYhaLpUYJJXJgXG22TqunX4IsTBPKGsQpP+rZVD4IR8
         OOvD9hGwMjC0Iv2n5LvRaSSEl3S3tPygBRC2VWJax7EJ6X08brV73/Ph1Sc7DR2tOeyw
         Hi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682721332; x=1685313332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcIcBWFparvJl9zqBu6UosahOTUhgE1Q8VQ2JrL7r1c=;
        b=D9SkFosD8KHwTCdaxVNqQZZUhP8TVWHmJIN4ir+Mr6u7AwAY0sduMjn2g8ni+wHrsg
         7tkDRAJrmBCcTXj7zmyZcpLy50chZvTrBk5nCdNvYad81DuJjzb00vEZlv+pLLk2Dxe6
         uHds1Vm25FILb+OxeLFP7PqfD7JKh2hGkRZmE4pP9xFx4YNWvnMB6nH9ZotWE5LtMHey
         OHRF4o4VIffrnKS/tGuhS8rabOySV6d+Q2hBFNh4kCE5DDlUavI09PAIWEcB0X7kFaJ2
         yAfVuSH8ehfm/SsXdBGOtpJdxJsFYmETP6NiBett4lgndnZ82uFHgLAos/uLw5Rl77bO
         3Q+w==
X-Gm-Message-State: AC+VfDzmyZCiIg9za/D+RBRIYrICsQ2Evb6r2ScooDUwC4CYEYF50EjB
	9v3htzmg500ozDGAhpKOv3dSiKkD
X-Google-Smtp-Source: ACHHUZ4K/N5RGajbgM73CYvMYLQxmJvdftGBFgXdn23xZL0I3jg2UbKLZeC/cxvAPC/NxuYuPyAjOg==
X-Received: by 2002:a1c:7417:0:b0:3f1:8ff5:b773 with SMTP id p23-20020a1c7417000000b003f18ff5b773mr4867855wmc.6.1682721332496;
        Fri, 28 Apr 2023 15:35:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net. [88.28.19.47])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c00d300b003f17eaae2c9sm25640380wmm.1.2023.04.28.15.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 15:35:32 -0700 (PDT)
Message-ID: <2270f306-5857-5f17-f8e1-fe2f15151da0@linaro.org>
Date: Fri, 28 Apr 2023 23:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 04/13] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-5-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HISlaaLe0RDc

On 26/4/23 20:00, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

https://lore.kernel.org/qemu-devel/ae65d59f-5e16-24bb-aece-ccdd504fe75e@linaro.org/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

https://lore.kernel.org/qemu-devel/4d744ee9-372b-c1f1-0d0f-be06b4b63c6f@linaro.org/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
