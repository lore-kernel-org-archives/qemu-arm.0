Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5229736lfg;
        Wed, 3 Mar 2021 02:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxmljnPa1HTdVj2puGL//bWzNsvsXw2sz0ZDHNO4VXqqAIuTVN+XFPHO7xV9Co3kBB1Ayc
X-Received: by 2002:a05:6402:3c7:: with SMTP id t7mr9515322edw.196.1614766753911;
        Wed, 03 Mar 2021 02:19:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614766753; cv=none;
        d=google.com; s=arc-20160816;
        b=vTwcc6j5z8X3oW26ZNrEPA+L8Yti5ydIYuSSeLjLbhtV9N2xliSicVv69bax82mHuW
         Wn1RFYY0wn7cmMh2bD9MLHJ15La5CqMAfcYp56T/r/dTNkT5GAeS/4T4jjfseAB/y4a5
         g1Ws/GG5oNnB9UWDp7iXBePMYrIZbBRRqyI50JeJxuSvl07/8yOiKVzi2yUEE05MdWgG
         1uBJQ58oPNa6S7msDn8q3MC14agFOb1gfc72aoXzc6nvXsbStd8iM78aoJ5KvZC+p2Bw
         vTLLyO3qGk1eDTtoAaeWYVzoX6rWZMbXnULm+y61q0ftpNztEID/faGm5JAfggrE1jqv
         k8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=7WTncgmWojbh518l+W1nUuduXTehsXJZFemrq8qzzbM=;
        b=cbuuno1/cGDgFQXPkVUib3MONl+i0atKUTjiDCvF7XXQAKsgDNfDIYPAFMx1jNVpa3
         ECrlPTkbpgC/4h1H6uUIsBKG+Za+IyxbklB/jYCpAL5L1GInBfBxoWah6vM5tAUUA9KQ
         PCKc7ZkWm63Sc+B7u2csRcKm9fAv3g7dDMI0ZV4nyxdcAj25hmmn49f7P7KRsmCHhZH5
         V8nv8X+n+NsnfA5NT0wW2UMZtC6OsUyzrfPDsQP85YMHCqRJEhxt6o3z+40MSrnxGsRe
         hgxNvaWpSv7hPtXogCSIIW+loxGgl7Tfex0/37F2UccYaOJIpmRj6YvhfqFv/4mxBWFv
         uvGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HhCbeJ9a;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v10si5819506ejq.299.2021.03.03.02.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 02:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HhCbeJ9a;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614766752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7WTncgmWojbh518l+W1nUuduXTehsXJZFemrq8qzzbM=;
	b=HhCbeJ9ayP+TKy3+QpUa7DMn/pqNvgH4VN2k00ezsj7r3VTU8WK3AGaiZ93qWgihct008X
	kfI3F/LmviGZRLasG2wXoR+hOSTnxMh3m+mVAkZfCoDUF5u+k+qPzH52KC18vVUFBHdvGF
	8hjNqL2ebgvqOjryYH+iMIkKAD6Dqck=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-lVBJyhMBPtaaPk5GMzJUMA-1; Wed, 03 Mar 2021 05:19:11 -0500
X-MC-Unique: lVBJyhMBPtaaPk5GMzJUMA-1
Received: by mail-ed1-f69.google.com with SMTP id p12so11875943edw.9
        for <alex.bennee@linaro.org>; Wed, 03 Mar 2021 02:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7WTncgmWojbh518l+W1nUuduXTehsXJZFemrq8qzzbM=;
        b=DkmVUoFgVOqiuyf2Ud+8aMkNbYExgMY5LbmBIbeKTRoSLrSfTV19OWmckWTAWdOdC5
         dccMcVs/gHwJJ9BHZwlHijycOszlySjEA8Jy02miTWjQdhgntJvhBgyZ2FJS39TUwFDJ
         Vhq4nH97/0Fs0HyT24p25srRC7fNRw3CX06tqRihmKuMYkj7kx7OCUJATutM0DdJiJYJ
         4E+zpi6oUaZeNB984T1AokfoAby+8z7y/F/Qi8qS05kd48nIz4cuzJcILAyLDn2OCmC/
         pb55oLa4MYdiCwod3zl6rhOemB1ZCYnFcbtXHQyV409gMDcLEeN60QFZVkh3hh8lJVPx
         7mbA==
X-Gm-Message-State: AOAM533qM5GXzxK3r9kv7ZFELJqmfRjShtHI6B7EGcdf1C7PKAYEwaAx
	yVCNv8uyx8r9gZZPp5MUch6cGG8PrT0IBpLJYFnekTm9i7laFssJQP2ff5PjcmUcOun2gQIk3HV
	oiDRd6v6KGotuTHPKJJxqwf/sZD+z2vZZmfn/gHBPobdxtnM0Jdqncjg50F0Dau1lTg==
X-Received: by 2002:a05:6402:12cf:: with SMTP id k15mr6242720edx.192.1614766748466;
        Wed, 03 Mar 2021 02:19:08 -0800 (PST)
X-Received: by 2002:a05:6402:12cf:: with SMTP id k15mr6242708edx.192.1614766748310;
        Wed, 03 Mar 2021 02:19:08 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i13sm20800731ejj.2.2021.03.03.02.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 02:19:07 -0800 (PST)
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-2-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
Date: Wed, 3 Mar 2021 11:19:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303012217.637737-2-joel@jms.id.au>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: kEisye0pRSs0

On 3/3/21 2:22 AM, Joel Stanley wrote:
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
> 
> The images are fetched from OpenBMC's release directory on github.

You need to justify here why this is safe to run that
on anyone workstation, or use AVOCADO_ALLOW_UNTRUSTED_CODE.

> 
> Co-developed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb012867997f..2f46a08fdc10 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1048,6 +1048,52 @@ def test_arm_vexpressa9(self):
>          self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
>          self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
>  
> +    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:palmetto-bmc
> +        """
> +
> +        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
> +                     'obmc-phosphor-image-palmetto.static.mtd')
> +        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
> +        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                      algorithm='sha256')
> +
> +        self.do_test_arm_aspeed(image_path)
