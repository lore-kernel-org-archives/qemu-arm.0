Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp251709ejq;
        Fri, 5 May 2023 01:18:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NLBLRhP+56xZrQxdD3q9CRbgxm3hLBPXLHOStcI7mkH67f6tW5+R5J6vQ5AZPOz/Y6Izi
X-Received: by 2002:ad4:5cce:0:b0:5e8:979f:2e49 with SMTP id iu14-20020ad45cce000000b005e8979f2e49mr894955qvb.41.1683274713188;
        Fri, 05 May 2023 01:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683274713; cv=none;
        d=google.com; s=arc-20160816;
        b=N5w989Y1ZUaB0nqFwMcFwyOLB1hJmID+3+bpwIX4qQfckgjQstAATivHgSd6SmrlrU
         3GjblWOo0qSavkrmr6k6o5UDwA7BQBCGnHDikqJYLmw/gfGFFE8S0fF+tqTtPdhivSa6
         xkxHxxuknouVBuMyh9G08FoEgcFPyXOrcdxsm/TOnazBhZ/vYOskUrfiy+QlGaFH6x1f
         6E+vogX8Zgh6kMz8fiDea82bXpEqQSX8lo0Z/29PEgQCbcTqDKuXkon18FXwYbEQuVrz
         qkXAJiFKGma9/dvup+JS7XQByEMJh9SMbQfw0P9ElVb+3OYUPMvfbInDM9GreCRAAGat
         u1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yQqauCR4oeB9iJr7KlIXvJS9JCYwMo5ayMoqT5CXjPM=;
        b=H3L9K6WCDxA8xhb7lfPGwY4LOYXJsVRkdv/KHkVcnkTJbkzxWtNrDcTtIUv59JpW5G
         3aRg9ufqtPmwdmKwxpkR8FylTmAgU7wP5l70n4V/gwsULig/nQg6J+lCzLAx6Q6TrqHi
         COOd80B/uwMzZFhydpRKg6ZKpv67IxtFToooxqnmTlrqvUt8bgBmEKBWOARa51uS4CRg
         bhonxIL2k/EOGvtqpAA016/39CnCQJIUGyY9EeJOivg/h9G1VasNhX9vxuu9D2ZcyE47
         yq9IlqqTZRth22RDSk1mN0Ee6cVdOjk6+8BPb7WA6diPKEZW5Db3m5NLlgObyySGkSW6
         Hevw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G/OMej7p";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gw1-20020a0562140f0100b00570bc9840e7si433754qvb.236.2023.05.05.01.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 01:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G/OMej7p";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683274712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQqauCR4oeB9iJr7KlIXvJS9JCYwMo5ayMoqT5CXjPM=;
	b=G/OMej7pR/ksJ+1Asy0Wz697F9IvWRenWS/4rNE7ntiJG9/otrDpLqsl7+iFNZXl5zg4bO
	qcZlkO6PyyVBAE+S4JKKtx9hQPH0GSioIb0CFkxtFCGWB1QOZQWRo85BOrM2J5qukx9N6F
	3XeGFnLUVYN94Sb5jWPnQsmN+p5e8ks=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-ve7CITxEP6Wfisnsqq4wqA-1; Fri, 05 May 2023 04:18:31 -0400
X-MC-Unique: ve7CITxEP6Wfisnsqq4wqA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50bc6c6b9dbso11166166a12.0
        for <alex.bennee@linaro.org>; Fri, 05 May 2023 01:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683274710; x=1685866710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQqauCR4oeB9iJr7KlIXvJS9JCYwMo5ayMoqT5CXjPM=;
        b=CtNHxm+lbQiRz4npAWQLE6VUosI1ZuZsBrvBisuPf+SjQ5nKOUdSRCBu8z1aAbijRk
         tgXjqL6DwqkeFjMBtn4B+EVfPeCiYC7j606Uer2KPlY9vZeJcAPenDc9JQXxT2OWKAET
         JjxVD1UJAsKdDfA2pFy5wnNvKDV/2ybMeqG5hN7E9r5YqseGGEoVHGbuw2LZCbZUOoaI
         q3bA5I3ctXXPvZs11L7xtEoS0eygSfDP7zyrBsV1Lt+5+CFjIITrSYdswequ7MWaQlI1
         VJsPEMaHDHb+ViEAXb3yhSj98DE667fTSjHGQniBr8lCI4jephdP/v95BsRxOG2QgeO0
         CZow==
X-Gm-Message-State: AC+VfDzRNiYnSNL6AbVbCZaZcwxn938qiCwFPrGg7NA0z4WBQrblu5Y1
	Ioz1HpyYNLAAOrc2AMdnd1GfMTr/6XbiflYM3iY6MDM6Q2Hr1w/5iHnarR8EKGsPyc9Wl2gzcI3
	K59pdf3HYCrgjm3Ah
X-Received: by 2002:a17:907:704:b0:95f:969e:dc5a with SMTP id xb4-20020a170907070400b0095f969edc5amr1071679ejb.30.1683274710526;
        Fri, 05 May 2023 01:18:30 -0700 (PDT)
X-Received: by 2002:a17:907:704:b0:95f:969e:dc5a with SMTP id xb4-20020a170907070400b0095f969edc5amr1071664ejb.30.1683274710124;
        Fri, 05 May 2023 01:18:30 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id jt21-20020a170906ca1500b0095707b7dd04sm635250ejb.42.2023.05.05.01.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 01:18:29 -0700 (PDT)
Message-ID: <cbae8ce4-675f-6ffb-dd19-7011f2535fed@redhat.com>
Date: Fri, 5 May 2023 10:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for
 semihosting
To: Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
 <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
 <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
 <875y98cktj.fsf@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875y98cktj.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xMf6xCtXXhYo

On 5/4/23 15:01, Fabiano Rosas wrote:
> ...
> # This config exists just so we can make SEMIHOSTING default when TCG
> # is selected without also changing it for other architectures.
> config ARM_SEMIHOSTING
>      bool
>      default y if TCG && ARM
>      select ARM_COMPATIBLE_SEMIHOSTING

This can be replaced by "imply ARM_COMPATIBLE_SEMIHOSTING if TCG" placed 
under "config ARM" (and also RISCV32/RISCV64)".

Paolo
