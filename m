Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp186491ejy;
        Fri, 23 Sep 2022 02:02:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77XpgJX0QNW/jDPs7wttOAeic6t5wr2Y96kFBOILKQQbbex62k8oHLELfQmRgVTI4F5lyC
X-Received: by 2002:a50:cc07:0:b0:453:4427:a918 with SMTP id m7-20020a50cc07000000b004534427a918mr7473636edi.121.1663923729202;
        Fri, 23 Sep 2022 02:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663923729; cv=none;
        d=google.com; s=arc-20160816;
        b=t5QMfimSmF+8p33cZuNeht60/M3QTzXEZIBwlKovy64wBS4IUiVxY9RbPiyAlw4Q/a
         C8mz/d39x/OVvxSyjeCbrb+8bSLGBk3rarkCCM1q8PZpCYrePQZUmZ0JM6Xlxo2GlH3K
         lK6+QseL1s/gh3nvPrTHpKo+HPmPeLzmzop2nyjuyL/iyoyVHO6751//LEGhQiRi49Ez
         TnIX53eh6QFj8wffKeO//QkCjySSsFTMNUgcNgM4HeMiFWYwKysXjCVy/d9MFdCS8Oy+
         itL0cC7Ud4JKxXPPDnaYj8pZ6rofdIYDLwMnHeYq+Av4mq8dy1ztjxWVHozAyyvfEDgx
         21zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Mtg7wIJVP3tDp/hmYXraAcpbKfaq+ogDJgtY9EHsnE4=;
        b=YE0BttsYSs2LKDmpNW/lIIJnUq4WajuRlG7YABzLC6rTrgecOuedycZAyaa/zsT7Fm
         TKYEfoJ0k4Z02m+qCU12zSyawTRqfAw4tBiB4PFVoIYmY9PO4DoXlo6ML4MvOmL0+ZVN
         4QIlwWuLDBDKy+t6ddusav7X0ec4jFCHORQAh04IT34lx84kGfMLlDqh0BmvETEuRbUn
         52Ne5avMchG/qoULM/gQPovPKzxmYRipEMtYWIw/9MX1peak0hmmD4XHNVJi54vMvXY+
         Rpfu0NYmU0qXB9XJTQsNSpryjD1P8Qp3BjdDSQXIsas6YZKpMVgwFualWk1G90C9uJKW
         Q5sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SMKGD+DG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w8-20020a17090649c800b0073305fd2278si6308205ejv.864.2022.09.23.02.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:02:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SMKGD+DG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663923728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mtg7wIJVP3tDp/hmYXraAcpbKfaq+ogDJgtY9EHsnE4=;
	b=SMKGD+DGO3I1Ke2Ey9VHPvHPyUZIm7G9nfllF+7xgwI1yNZs97WQ4PCwez8D+rTSCfuyfS
	q3JzFbefWiq7uZ4JHRKpMU69xYhG3mfJq523EedmKEr/m/H+HwPdMS+OJWBHGLDMPUYvPX
	+POUKeWYIUNEDbQSzPF19oAE3MsEMWI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-84CmehnTNEKFPvt5rwMZ9Q-1; Fri, 23 Sep 2022 05:02:07 -0400
X-MC-Unique: 84CmehnTNEKFPvt5rwMZ9Q-1
Received: by mail-wm1-f69.google.com with SMTP id b5-20020a05600c4e0500b003b499f99aceso2431957wmq.1
        for <alex.bennee@linaro.org>; Fri, 23 Sep 2022 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Mtg7wIJVP3tDp/hmYXraAcpbKfaq+ogDJgtY9EHsnE4=;
        b=RblOsb6/Fwqv7DDXACTFkgf4UBYvKNG5QQtw28w9n4lQLuOPmTbB1VC4oQJNF3XOzw
         LOvNRqAy0h8KE8NEf2xRqtltbdxcXdGijhzorNJVXx2jZGTo8PffprSA6EjUgS/TskBs
         hlakeolbm1DG1LKpBSkMbkjwVyVm7vhHZlVUcH7UtIb64gBBUheAoGxumfEjzTU327B2
         LLry8fHS46rm8fljn8TENXWeJ6IfofxfGyDW6uyO1cJeAOH/M7LkF92j/9z/IJyVBsV5
         GkLvp+WZPoqyI+J5zth8OpBZ2g3QmpZ3ta8coBO79mwWobeY9DfMAlJnocuTemoUM2Zh
         /wSw==
X-Gm-Message-State: ACrzQf0ckn3P5JiJyjJIMQd+wWczEeQwfrBNwZ8ZxZY4vtjtrWsaQnt1
	jSX2PBXjweT4CtAWYE6LL3u3kEBVS1MJWTXFercT4Rb6bKKQneCtWsGw+THl0p3YhoYAJeTDUyv
	L98Oco90Eep8JVrBj
X-Received: by 2002:a05:600c:2181:b0:3b4:74e4:16f8 with SMTP id e1-20020a05600c218100b003b474e416f8mr4911275wme.174.1663923726008;
        Fri, 23 Sep 2022 02:02:06 -0700 (PDT)
X-Received: by 2002:a05:600c:2181:b0:3b4:74e4:16f8 with SMTP id e1-20020a05600c218100b003b474e416f8mr4911262wme.174.1663923725840;
        Fri, 23 Sep 2022 02:02:05 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de. [109.43.179.37])
        by smtp.gmail.com with ESMTPSA id z10-20020adfec8a000000b0022afe4fb459sm6888963wrn.51.2022.09.23.02.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:02:05 -0700 (PDT)
Message-ID: <4c0cbccf-0c1c-3ce3-04dd-534b11d9b62f@redhat.com>
Date: Fri, 23 Sep 2022 11:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on
 buildroot
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220923084803.498337-1-clg@kaod.org>
 <20220923084803.498337-2-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220923084803.498337-2-clg@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: v2fgi4PrAPVI

On 23/09/2022 10.47, Cédric Le Goater wrote:
> Replace 'buidroot' and 'builroot' by 'buildroot'.
> 
> Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   tests/avocado/machine_aspeed.py | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
