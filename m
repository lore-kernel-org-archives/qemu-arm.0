Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp179451ejm;
        Fri, 28 Apr 2023 15:38:29 -0700 (PDT)
X-Received: by 2002:adf:fe83:0:b0:2fb:7099:6070 with SMTP id l3-20020adffe83000000b002fb70996070mr5231852wrr.47.1682721509373;
        Fri, 28 Apr 2023 15:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682721509; cv=none;
        d=google.com; s=arc-20160816;
        b=nGqK4m6VZyuEjJ0X9D7uTgbY2YJtHBYcqv+k8BluqKkPvg8uWClicIWp26Ge4+jG0w
         V3w9hgcMEPxPfdWZj2M9qfy90gjTorOT7dRbJDhY0ccN93D9OU8YipCA/m5r/tCjyfgk
         SQK6LGBRniBTJkqwQc1sjbSabgkKBHtsoMlEPwwl/WWwrf/GNw8Zd+JW52v9LZ92zuXT
         EQec9J3OgIwWgrfl5cLHk4gok3Phzfe8Xlr6cXjDMyMMPUtBZrflhG4lOLYur6N3BIsB
         /42qGmVgabNUeMYCBoATXbOS2kBYx5ObhpViPZJ9bEiEpHOBtgkKMFGcVlbPr/7Vvv3H
         v0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AuzxP35MrbKy3jQb0AgKA3eB+v0ygkrGtM0eA2b2OUs=;
        b=ftK7SuKxOVDmsEauMT9hylhozdy0XdQg8A60oKj1fCdU1+Jl/56WcLLc3/QzDz/l96
         lgp8JB7zUeuPPJWV4LBG5abL+uGEzw3kPkCMxpkRSEtd6ZNdt8Ks5IzfrmHOI+K3ysr2
         yiO++H8O6M+yUl9xPtc2ibHFEFCbozV3uyEBxcfYLIUZI2gL60tbL9ycCPaTNG4ZynJL
         3jHUWpf254SCW6ieheakn2o2g4bxKa9j2DRbSzPdKpAJN8LkervRyf0L1iEVEHBfwwtK
         H6OxNyK7JvLS+GTowcD8KNGn/zaHZRfsZ0/ZnDR/Gx+Gn3w1+T9RUweRR0Lrbs2OnCnA
         JgxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7vYmBbc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14-20020adff34e000000b002fa210a35edsor9282159wrp.76.2023.04.28.15.38.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Apr 2023 15:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7vYmBbc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682721509; x=1685313509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuzxP35MrbKy3jQb0AgKA3eB+v0ygkrGtM0eA2b2OUs=;
        b=B7vYmBbc5wswEloQgyXjjcIPffwQAdGiux9k4rhpToZSf7VXyz6Z1jqa9puxUHthuW
         7x7dazH+0e/fgy2mt8h+f1Jl9VIwBnb2M5RcN+J5HM/FIn3oBwxv1zQhzFj0mifKuKFu
         k/D23KunY0VV2dh5z0+yHZWTxsB2D8PqS1gJHarmlyjJQ69K7L/qk3U4FLnQh1vyzml6
         2blEI5legF4QAQy6XrJYpmbqV06gwlvFtn1gT1Qkt7oAxJIStW03yAFL61JPMdOMkWU4
         UqY0P8KRohcyJOWHV/8Wo72zY0dkbwPqpBo1CSVT3FmFyva5RkUQhmyyZcoHx8TLnzqf
         FK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682721509; x=1685313509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuzxP35MrbKy3jQb0AgKA3eB+v0ygkrGtM0eA2b2OUs=;
        b=e922mhp3mgzTV1zRNWrYemI6GIGOvR7kkpCKTaWovRZvnC5R9+YmbOum//gxUmirEh
         IfXQa+UFZvzONJ0nhno9ZMfExwZUh+WBlJV2GVRT84XiM3X5eO3jeESGVCV7Bf7I8RsP
         Z4UtBX80kiOnBWorrj4uIAD+XNSzBxhOFap/k6ldAYN6gW0IHuSPUU/0OLQTHO62Tssb
         FG0RF9SN54CPT1+FjJ9fT7SdmmJOKd/sZ/kNccqft+d68X7pOvJj24atSN5GL+dV3+9j
         0ezkzCt4+02WAE3QPLNYlqAhgKIN473pdmb862rj3gQD6zkrwlfH4K/wTxF6eZzvKR78
         oZEQ==
X-Gm-Message-State: AC+VfDyaYxRZJnhcyBTu6g4IcnYWwnIDfXYJVUWHQUHc8c16z+FujxYO
	304Ve5Hb5zfllzOQfimXVNS45biY
X-Google-Smtp-Source: ACHHUZ7OeMSUugrGJCjS7oR+SwWHbI50l7agy8nmY6Y1GQvqpEGbq4BlfphtecVWmmV+hJtRC3JSvg==
X-Received: by 2002:adf:de07:0:b0:304:7ff3:9b2 with SMTP id b7-20020adfde07000000b003047ff309b2mr5580538wrm.39.1682721508997;
        Fri, 28 Apr 2023 15:38:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net. [88.28.19.47])
        by smtp.gmail.com with ESMTPSA id w6-20020adfee46000000b002f0442a2d3asm22080474wro.48.2023.04.28.15.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 15:38:28 -0700 (PDT)
Message-ID: <14f6f77b-e816-567b-eac9-f5d678c7edf7@linaro.org>
Date: Fri, 28 Apr 2023 23:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 05/13] target/arm: Move 64-bit TCG CPUs into tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-6-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: st0sO4hAZgVk

On 26/4/23 20:00, Fabiano Rosas wrote:
> Move the 64-bit CPUs that are TCG-only:
> - cortex-a35
> - cortex-a55
> - cortex-a72
> - cortex-a76
> - a64fx
> - neoverse-n1
> 
> Keep the CPUs that can be used with KVM:
> - cortex-a57
> - cortex-a53
> - max
> - host
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/virt.c              |   6 +-
>   target/arm/cpu64.c         | 687 +----------------------------------
>   target/arm/internals.h     |   4 +
>   target/arm/tcg/cpu64.c     | 723 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |   1 +
>   5 files changed, 735 insertions(+), 686 deletions(-)
>   create mode 100644 target/arm/tcg/cpu64.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
