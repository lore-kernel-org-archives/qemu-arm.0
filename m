Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp983263wrp;
        Wed, 4 Sep 2019 10:18:53 -0700 (PDT)
X-Received: by 2002:a65:6102:: with SMTP id z2mr35844534pgu.391.1567617533265;
        Wed, 04 Sep 2019 10:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617533; cv=none;
        d=google.com; s=arc-20160816;
        b=Mxg6R8nJ96PicAiK2niunBETXQ26wWfnhz94yh1AHj35D+kmB2yzmjNMX0U0Oa4u5K
         gVUmL3k/ACBefRWUKVEA7iC2g+xTfw1y9hJRD5YHf21GY3bv0h4grNopbfQRdU4phWmB
         efTcMf+AztnM6BrfEkFSiF2+xrd+EJ99ti4ryAoD+ILZcfCDPXbasbNNj8VE8ZwP2Pca
         BroGlNHIjQ5bZZothsLRyWerWcoFtaVCuVBE+TckAZW0tQTyQiwAEABavstDjtSsSK7x
         Y4/V2JDSbsIKT7XgSj9e5fgsGUngHtQR/bYVvI3uQVp2uEoQhFUC0D5FiNzkHs996usx
         OYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=HZKykcNZxXcY3cKLw/MppXmJdweuYpGmfcth7o7jcFE=;
        b=AaFhBriyF/zrq395VMw0rvOLVWiYPt6maZ9CuyJyLvydjARUevH6XYLuHZvZa7nQ1f
         aVgUkNitJMlRGkqy/JJqB3XiAegY8Lgf3wHmjV4Bsqol3j2ODCYUgszdc1VeW3HewdZ5
         4hBMw8Qdw8hBCpP0p0KH287tVW3wNAZTvPeefygGIo71p83kLv7kTeD0eVfK4y7D4DdR
         3wvJeZGOFDvGmecGTlmM1JJZAVWwSl3PaZC+Kfqw8XOQCge1VimPK/Td4624npnPRgQJ
         anfSfuBGxTZ8dG8II34KY+VWyjMcU9lFh4xwjwBQhhnvd4GG4XebhWU1Kl0KlpHJcF8a
         Htqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Re0RZQrR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j65sor17853819pgc.28.2019.09.04.10.18.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Sep 2019 10:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Re0RZQrR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HZKykcNZxXcY3cKLw/MppXmJdweuYpGmfcth7o7jcFE=;
        b=Re0RZQrR6zoxR1qI+8kAh8RKYAxLFdvXZJ7a5YQuQmp2eWuJosY27Hw7zUjK2h7asy
         Fu4P9/lpwpgD9FQsfDIiQvrmx1drl++/WUOdLGyzug3k4Kms3sk1uzaluAHqlelp3pXs
         RXv7CuSv2bonUOrDiRNvyunFtcMy5imRLGtXi+5sJko1jRFhI8gtLlHvkLl+ZC29DnGs
         u1cSzEzphXEQwFHb5kTvCwgr6ObiogU+y+kLQPdmJzHfdNIVBsHPKVUa6ckt9NhaljHD
         TYdl8SIVFYeUVH9hrAcElA2hq2B0u42pQqAv+/fv95WM43YfGkgsB6pKXjDu20Dia3Ip
         2H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HZKykcNZxXcY3cKLw/MppXmJdweuYpGmfcth7o7jcFE=;
        b=U45nGy+DB6kv5M6szk5L42MhCKqZeLiHYjl+rBYEnY0hi8FKtyrj0HGNtN+wwSqtT/
         CKrS5HtfVjXldNyZEvFvAUY2VBSjF91ecnTSYHhZAK3gsq3xI3HVEkD20BXiWsUsCvkl
         PqV3M8WJ6w0fmm4ge4dDguIkv7obZRFMCpVoDpe14hHQrOvrKQGxrTftb5c8L8ZKRaVA
         SqVND237vBacpCZHfzd/FZNubRSCBbvaWFFo57UoC2tfizEaahSU1gb9PGYf+gms6PvR
         UDoCak+f6bwPIlkWaYcc5M+cSXqS/bM1MeOr9/1J4V9aLApRdWi1M/m/m/QUWHrsl8IR
         /FYg==
X-Gm-Message-State: APjAAAU9qMRqC/sNcdBHRjzQAyWc9V3zuZj8hFudwKy9daI2IjBZIaus
	BzF4aClJoxhRu8ObHC3FggSjSQ/a
X-Google-Smtp-Source: APXvYqxIeKOZbkxswBYBSyjqd+mecnqQEsV+L7Odq50C6WUm9Nxyg7EboiMzBCN/Z2RwcYCiLcyCBQ==
X-Received: by 2002:a63:5550:: with SMTP id f16mr37481886pgm.426.1567617532681;
        Wed, 04 Sep 2019 10:18:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q21sm10276337pfh.18.2019.09.04.10.18.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 10:18:51 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] HACK: Centralize sve property checks
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190810013112.28732-1-richard.henderson@linaro.org>
 <20190904083252.7pmmjvbynik7dk33@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <727fa9aa-762a-432f-a183-7cade2266f70@linaro.org>
Date: Wed, 4 Sep 2019 10:18:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904083252.7pmmjvbynik7dk33@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: WANw4Bgu9HpP

On 9/4/19 1:32 AM, Andrew Jones wrote:
> Should we already introduce a function that will collect all
> finalizers together now, rather than sprinkling around 
> arm_cpu_sve_finalize() calls? Something like
> 
> void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> {
>   arm_cpu_sve_finalize(cpu, errp);
> }
> 
> Of course we can introduce it when/if we add other finalizers
> later, but I guess the vfp-neon finalizer should be coming
> soon anyway.

That sounds reasonable.


r~
