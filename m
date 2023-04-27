Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp208401ejm;
        Thu, 27 Apr 2023 00:01:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ogfyWbFgTM1k2JHjUnVMsh80dq9birHCkF2o1neMupVbGUxj3Sn43plh+kprUQ+IP/mZz
X-Received: by 2002:a05:6214:411e:b0:5ef:8c35:296c with SMTP id kc30-20020a056214411e00b005ef8c35296cmr343949qvb.44.1682578864333;
        Thu, 27 Apr 2023 00:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682578864; cv=none;
        d=google.com; s=arc-20160816;
        b=mr31V0hDfSHht0sw2sjoaz3tu2/kHcoWgLd14Cy1kAdrZyTWTpVz3QU8X6RVrGAcET
         8QYXoLuaCLlvFR9Ob4yp++pjHemszUj+lwc+OIS/7B0meF4q88O7VZMYqF4W7XVGhLnl
         CSlCeh81IUszPWR7HZytNhiXIR81ZjGsBclRY16XIn+DFQhYHeMCWFFIEftTi7hhdN9C
         bvUAbNxjLQvcl+qdxHRRo8WgFn3J2w2ZrkSnmuI7eFhGw49wHgjGtBQ+SaTjcLyCDurR
         0/js9qN0BVfQhrFDumWnq7vzkjruhIiSiBjNpHqkw4zgoQczLpnAn3Gk9IWhUkuRg5Ez
         oT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o42cPEIlL5hq6xgU1iacDO8RC2/CLSL+hygcefRcB30=;
        b=HLU1OXIKh9vce6n9deHoyPjMBe2O1rR11FnthRSIqa8owO+nFJcvFUzXoVy1YeJMJt
         T8iyE8kir3oPYOYqavd3TnbZ7NPwxvaeYK126wBi8IosA13o/DbQ6+aiEtWjlv7Bkhq5
         9kb5/g/lZpgkS4uG94Df8J1kEaIOzFDX8QOrXLin+kUrcGv2r+o/16HvLTWnAjbglUXg
         Hs8CK9pkVJuWUP7wLrFL//41gPMIAs56UIo+Pes4XRfeojXYbv5CZYfehuuIkmSqBDsJ
         94l1RDb5MM8v7ubxTVP1WUk88QVUS3od4Jk4r+pHML7UHblr7vMSp+paaSg621OW0Vyj
         jdoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NhMFteZt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u8-20020a05622a14c800b003e43016c09esi4982233qtx.52.2023.04.27.00.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NhMFteZt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682578863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o42cPEIlL5hq6xgU1iacDO8RC2/CLSL+hygcefRcB30=;
	b=NhMFteZtc5YZVH0EGmFTCGvjmIqAKrqkDt3t7lCe7LcZX8GN3Fi1mI/RqAN5tsLyMJ0Rji
	Mk8fNI39cKQmeGCG8ZOzJPy4wE/1mEiQL79jVb7OIEvbqRi4xCaAu/LysUc6HpYzsDZxOk
	ROuyx/kaMhTIS/aVc6EgoMmz8/Q6P/k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-wbgi9YaxOEidGlW8ckoUKQ-1; Thu, 27 Apr 2023 03:01:02 -0400
X-MC-Unique: wbgi9YaxOEidGlW8ckoUKQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f175a24fd1so46139445e9.1
        for <alex.bennee@linaro.org>; Thu, 27 Apr 2023 00:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682578861; x=1685170861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o42cPEIlL5hq6xgU1iacDO8RC2/CLSL+hygcefRcB30=;
        b=a6EcB6psO6xsfGwUINchT5SSncmNnFf1m0G9C34hKJyKUtOOXt3IFAHsx4B7IrxfQX
         OzZJeDF2G8Rg1z+GMSBhOUO6tJag3LwOaVkBDvLj6ZOG9swxGzSbb/gb5UAHhO9o4VDv
         g6yKztOCdsvT8fpE/WfBZy99Cn9RZHecc8Tg/w7zqWz2UrL6GY5euzsyEGG05Un05/8Z
         t1XOXY+pIvcx8YAT7pHF+t862R8FIB77QD7OoJe4u3o8A3obCF+CFaut/gv1qHd+xL00
         bSwETvYvfcFCrzC134ei620saUWu2j08rOBtbu6Vv/OfOswSk7IZ0znSr3GJ8PcJfp97
         nzMQ==
X-Gm-Message-State: AC+VfDySJxsLrIH4PmGMYnIw2Abr5MwFBds/mUQIMiL57QXrJlfm56j+
	eKA9VPWubgjYvdcxMldRv4BOEVmGDiAVGZ2tOl8mVvqcZ/z8Dk5LJ9vmcTChvJ7/LdvEYTnT4r0
	W8G2/89+5mmW2b31O
X-Received: by 2002:adf:e90f:0:b0:2fc:b3be:7436 with SMTP id f15-20020adfe90f000000b002fcb3be7436mr406923wrm.25.1682578861539;
        Thu, 27 Apr 2023 00:01:01 -0700 (PDT)
X-Received: by 2002:adf:e90f:0:b0:2fc:b3be:7436 with SMTP id f15-20020adfe90f000000b002fcb3be7436mr406903wrm.25.1682578861160;
        Thu, 27 Apr 2023 00:01:01 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe10f000000b00304832cd960sm7751355wrz.10.2023.04.27.00.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 00:01:00 -0700 (PDT)
Message-ID: <f96890a3-0491-7fd7-3ce0-d4f873e64f03@redhat.com>
Date: Thu, 27 Apr 2023 09:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v11 12/13] tests/qtest: Restrict tpm-tis-i2c-test to
 CONFIG_TCG
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-13-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426180013.14814-13-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AzDVryJp3Hqm

On 26/04/2023 20.00, Fabiano Rosas wrote:
> The test set -accel tcg, so restrict it to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index cfc66ade6f..48cd35b5b2 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -213,7 +213,8 @@ qtests_aarch64 = \
>       ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all.has_key('CONFIG_TCG') and                                            \
> +   config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',

Reviewed-by: Thomas Huth <thuth@redhat.com>
