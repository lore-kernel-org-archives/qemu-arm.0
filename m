Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48282nji;
        Tue, 10 Sep 2024 23:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXDVNPlBoMVU1MHCtGVaHlRjIlNtPlBtUjDu6eYYYkO9PI852R82EEWJrPLugNf+qGNXHv+OGOJKq/YA==@linaro.org
X-Received: by 2002:a05:6512:3352:b0:536:73ce:99bf with SMTP id 2adb3069b0e04-53673ce9ba1mr1028494e87.46.1726035194042;
        Tue, 10 Sep 2024 23:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035194; cv=none;
        d=google.com; s=arc-20160816;
        b=t4rqQgVFZ4hEJ6yBWEzF7xLPpycKBydh1blHBSOAkDlwlXw4vvH4SNffKxXjfKo+Gq
         0hx+krfs0Qz2BvsTGJIa9lZkW3+m+46VqU8JU92zOm0oAPs4A+Va9sUwviukJVdOrHIq
         ZinsZwMRcjgSXjLoTGgFgqUM1jX2U1URO2CLOZ7lVHLcbb0wH2oZiCXDWfsp1qbNAclB
         FQ2/iSQydDLRUB2vO9FUegoX1ohUYr8UqlIHdDWRt/KwOqBZKHJS7b4jFXuCoWju+xmB
         fEFTII48smPQrOFTsWIBY8uvI+ffhudIGKQxg+ZlyHIfNREIVm6qYqcqXiWGB2MDCcrJ
         cmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J7LpRf93BAnXiOmKt/ZSNjq40Q0BcySlR1uVQMFuyR0=;
        fh=B4/RQ9G2kOAGeSvEy38U2PZrU+oMpsgaDT2ItVWkSA0=;
        b=GV0xpVIdHzYeOh1RpB6eIX4PvBlCNRkKKsIiZIfvsGkb4XgCJqoGDyqmMzg/UI3Isy
         2W4HM4jCO+667iOddUxrIo5jLHtJj6P6AJJbv163TochNIwW3Eel+CvNaD35ITDai6s2
         E3fr4/5uMxwqMA+gyO5Kanlag0EZOT64bBhqLKqvgGwHrAqMgmx1wNGZv06OynW5yBy+
         l4JgppxAbi6LskjY0FtjOCBi5h40/Nl7DcGFPeCrHUEUvcKqTJ8kJY3CFwcwA8wWH9vz
         EzYRslk9NBYMpO3tQjg7OhhcGN8dpmxzCvRQuBVJgz7Bo0roscJ1UvKSRFGgyQipv6WS
         Qk2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7pW75xB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5365f86fa85sor2662298e87.11.2024.09.10.23.13.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7pW75xB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035193; x=1726639993; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7LpRf93BAnXiOmKt/ZSNjq40Q0BcySlR1uVQMFuyR0=;
        b=x7pW75xBn/XLz3bMGSIaQOukh77bmIcyMnOUhGhjy5SGjStFr6jKDboP8MRDv3nsvf
         5buVH7pBGMGG/5j0kEFAXZO1EEES7y5Z4eA4lAB2u1TrCt+OQh6V2eecxK6xeEdCpwfE
         f/kPQuUWxNf9HSTVjNT8aeb9XPO0eXMGtICdeAKQuPe5rFD+Tj+4MRtgN410OQlEV7m+
         E3c8AUWKfmnqAtdNnFhFPXpIISNUusV/ZhaPvVTLk6xf1yNi/mgnBjAJK2m1Fv0ow3FT
         +nKOZtmlLk7c7bg9qPFU0RELGwamNxGSknI2Bcy5FWelx4HqFXPSgKPBcKcWSOlaM/iV
         17Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035193; x=1726639993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7LpRf93BAnXiOmKt/ZSNjq40Q0BcySlR1uVQMFuyR0=;
        b=UygxBRFBBrVfPoyFFNYloIQUxkgRCR9Acea7bZcmKXQ6vlXAyPhdayLsd7BmrZQaoX
         RiKycptE5IYoFwtrEm95mCgcVd+zTUNEyMnPLaOwW3xg5gVaefDzQNWb6v2vAqaqcDs8
         YSAfZIlDH8tIF9LDkl9QZcDRzmbRkKG53yXeJ99WJz/zJD6V4A/a2aUzow9XokKMzb1C
         jm0QK8tr1crEAvk419QD0BUJ7U3j9ETuq4y/EgP5uTzQkL2Ikv9FdEH1cesy2dcuJnuA
         sNRwMTmLV29oEVRnaVH5luhrzk+2RsuVyR5YxrevZ7KHxAuZJWHcmVCD13jvg630i6Rb
         vFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWotovPk+6rP5IAmxZreso5kvmKlCOycfqnmOn452xHourCcRpxFAtmOWyyKLdImMofwmJOpF0ahs/dAA==@linaro.org
X-Gm-Message-State: AOJu0YysMqtxNBvS534ImlVgpc1boBZ8qWSPzqqg9n3nGdWepQ1kn9H8
	aWsaXYB76OCPqhbFhWi3sq4eYMc/X+tQAeSWhciHB6rHNPmSt6oGCaVhwDIN/1RT0Q==
X-Google-Smtp-Source: AGHT+IGgGKQ0AEU6HNcJt5DsM3mDmTwInbpRDGWNVq2w7Th+CmIVLvrwWJibFdq1qjuzb4izFD22Gw==
X-Received: by 2002:a05:6512:1048:b0:533:4620:ebec with SMTP id 2adb3069b0e04-536587a6885mr16134873e87.3.1726035193184;
        Tue, 10 Sep 2024 23:13:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25979e90sm573426166b.72.2024.09.10.23.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:13:12 -0700 (PDT)
Message-ID: <6efcf085-2118-4d70-b31c-56536179c615@linaro.org>
Date: Wed, 11 Sep 2024 08:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/39] hw/misc: remove break after g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-29-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-29-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: s86Zxxk5pp8T

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/misc/imx6_ccm.c | 1 -
>   hw/misc/mac_via.c  | 2 --
>   2 files changed, 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
