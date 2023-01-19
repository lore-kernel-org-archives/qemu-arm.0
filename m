Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp434640ejc;
        Thu, 19 Jan 2023 07:58:46 -0800 (PST)
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id v1-20020a05600c4d8100b003d06c60b4d1mr11359875wmp.6.1674143926150;
        Thu, 19 Jan 2023 07:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674143926; cv=none;
        d=google.com; s=arc-20160816;
        b=izfT+H/vJumSij5aiG0bJ5mSet4dPSB4sAQ/MjyEUtFT6BKXa25I5tICo2szm2eEY/
         oO7m7/nisxmp0vNJIYHspr0ZHtv3jycG/Onv7lj6JD2nhulRIAGOOSRl2WGmtYIVoiSc
         z6FiMXofNnf18CfALmBZznhavHb4ZEjxB7zpvD1mGvePeR7B3KGzDvZmw+0QO6ems4jl
         WwpW0iY//KJyAqYHCAqy9E5y9pfC3lm/JHtULJ7/JqLjSQkcAUdtlazA4AmszE+BYH6s
         rcAnLOe7wiyp8+TtXdyekSkiqyTC5L+JchymEiudHjd6pPYk2IBStj2iCdfHi22U4Ygz
         kdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9SQ0gKFhoh0Bayl5xDYaBRSPn/XqltG1Rgc2CgzJoX4=;
        b=Borx7I+jbnyxq3vhaXmAdDaaNwAHFwGsyBZFvObRGAzP57TSVDBrGAmOrFYnrDp+28
         XUQ9wuhPLUSRI+znxwPQn6efk/U/FblnH2hQsWA2wnsnsuowN/ObyzCEhnb8nvKNEn0l
         dFRFph6H+mqMqEcxdVRCz0jNf1q7fRQw/+5WIM9RnYsLkPLS2g1AgXJPkmXcDaXyozzD
         s5nfOttOquH2ncM1/FOlGnty1G9uYtJDmpeX7vQhus957UgvsntUVX0kK2Wjekmbbsa4
         Yy6TBCaxypFMiPLFJ4ep/aBNxaiEBNZCsudJ/7QnQ0HRiSUS+caXKPMYo4S2daY7Kc+m
         cQGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fv/M/snN";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hn30-20020a05600ca39e00b003db063463absor1835493wmb.31.2023.01.19.07.58.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 07:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fv/M/snN";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9SQ0gKFhoh0Bayl5xDYaBRSPn/XqltG1Rgc2CgzJoX4=;
        b=fv/M/snN3i9dfRvEuDBcUgDo51B3Aw/KdlIGYnV2b3mXyGvLZovPeLlqGfeUxV1fs1
         u+NShF3JsO5uKnJidUNsdW8Ovw3sAfB6orUj1xk3C2UTxf6d/n9hg9tx3K2OFEe67yGu
         9igVamrPBOYnczdQUD+nlDVpxs8Wr1Jt6UHVKHcc1hTYCBrTa1t52wALd7nDVhRkVLrp
         s8z2XBmCcT22iPPR9LK48KIrE8/L4iczNMXWo8vlJOQl5RQr0GW4v5I1R6fSk5S9zFjB
         n3jrdRZWDKovtyTl7glCI2CKMi9Y0W8Z+AetG7bW6cV6Bh75GMpuQkCe7ikN8bXd7LcT
         NqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SQ0gKFhoh0Bayl5xDYaBRSPn/XqltG1Rgc2CgzJoX4=;
        b=vd6rADjhquAXn5s8TSakCRHWar8ojd4+7/QnrKJJEbZHGwakCgEl7FmBnyH3tg9sm4
         mPWIRbWwpMqFI9kjKn6LAEfgJCd6QFEc9EdByXc0EgB85IWeViN/HKUpvw0tAP7o11Y1
         /VLbgnJ4XOSAY1uLatA5jn/nxDsA67+LWMg9ArND/0pfLXhFLv8J0BVgPWOSFYQU21R3
         nFfUv11isTdG3rHgaSbdKtamvrd2VXjzkLUZk0NTWiJsyGuioF7Nt+HhMbzgKHJWN/i+
         d7rfQQCSaBdQMJ8TtJaUCTJqlc5khEgEryICSB4B1JOqPbE4I1nG90/QgrVCeXLgMTNf
         90Wg==
X-Gm-Message-State: AFqh2kpznU0ThWC8gPAmTO6Qg53mjqrU3YxBwPpYCqY51gGJSKS2+Lkg
	0BkDAlIkL9rNIfVyZCNLCLT16yDQ
X-Google-Smtp-Source: AMrXdXs7g2DL04CZ22fAZAFOZJZk7yPcdzIqG8+jYOYvzDKeDpG//A1BPDHmHP4aCpvitgx/RJt7ug==
X-Received: by 2002:a05:600c:348f:b0:3db:742:cfe9 with SMTP id a15-20020a05600c348f00b003db0742cfe9mr10413965wmq.34.1674143925932;
        Thu, 19 Jan 2023 07:58:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t2-20020a1c7702000000b003d995a704fdsm5077872wmi.33.2023.01.19.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 07:58:45 -0800 (PST)
Message-ID: <5d40fb61-c71a-cce4-0731-5cc5f48c594c@linaro.org>
Date: Thu, 19 Jan 2023 16:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: nH1N30gI+RWb

On 18/1/23 20:34, Fabiano Rosas wrote:
> These are the already reviewed patches from the first half of my
> previous series:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
> 
> This unbreaks the --disable-tcg build, but there are issues in runtime
> that are still being hashed out in the other series.
> 
> For the build _with_ TCG, this should behave the same as master.

If you respin, please include this build-only CI test to avoid your
work to bitrot until the rest is merged:

https://lore.kernel.org/qemu-devel/20230119155646.50503-1-philmd@linaro.org/

Peter, if this is good enough for you please consider the CI patch
on top of this series.

Regards,

Phil.
