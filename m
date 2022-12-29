Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4142092ejb;
        Thu, 29 Dec 2022 01:35:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/j/ZumIlqD0EE4OgEcNCdlqIzkN24Un8qbA6B7ia+1fTKeWM0ILZ8SJ0ss1Y5DymNyjAE
X-Received: by 2002:a0c:fe42:0:b0:509:9799:16bb with SMTP id u2-20020a0cfe42000000b00509979916bbmr51526541qvs.27.1672306501111;
        Thu, 29 Dec 2022 01:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672306501; cv=none;
        d=google.com; s=arc-20160816;
        b=LooP05CyHnCCqs5C9Klsq1ABNR951YFowNA5BOljNUvsfJzq5KgS5rFUBNaeRYtZT9
         /DbiWKOeydxu7Lg8l1/Wr9uiGkV0UR0FzfhWV5BdedA7PE9JL9w20hDFCthM1UFtuG9k
         dOAg/thfqugWL5xbauQcCZ8+tV2lVvXftyUlf6WN/PoGpMGDx0EznU/DAVfEsVXdphHw
         YqDpxyyFLwrjYUJsVsVFMqC9Q5Yn/9oLjAe0Oq3PKY3NsZeGnMJhz1YkptGCpMq/JvMN
         /bafk1PflRzEwUDy5xqbE10njuDkinFQaibe/zKCz18akvda+kt0ohR0+OKzXKRBD9Wa
         WnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
        b=KZ3TNOul8CBurnbSrcpgPyxX3zGV5x0h6HCMunwqNwOmouXotSR17SDr7grnUHAFVl
         /KamVtLU/pALQ9KmbjblXGWc7EPa5xquVBRvEQ8nwd0dJeriUFlSLvxirlJzzv8tcjfi
         MeHWreAPJT/iKr5Mg0qzaAgH5QNRIdAT3QAjDe9jax31U4X7m1iPHKxoDop5gKkQd8R0
         NxvZoW8/96EaMG1/dOav2BzpBuDPBYL/16ks1S2Rtd5Ku+rMBhzcsZGcgR033uElBRC+
         yVe/I7LutpFIv43dMtlpHyoLnBHQhPQ9fyDkl+oYyeQQsJafHdoWFlcAJqZuJEI4kv9O
         rTmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FD1UutTf;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c3-20020a056214224300b00530303b4083si7532344qvc.9.2022.12.29.01.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 01:35:01 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FD1UutTf;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672306500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
	b=FD1UutTfUwx/dg4BHcjGWseevYcHzo1WmR2/IyamOQ2OvGw4eU2g/RBOQJlMQqoRdmmyNK
	odWTG0bkNTMPYdBza0u3YB0CocIbRv5FjzfUepgB/5/nBVNp6xQacuFKv+CHnotdEf0DTt
	0BnluI4MZ4IRoIgdhSU/Uoi6npRjh/A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-j_-ya8VvOHyMx1Az6Cdjcw-1; Thu, 29 Dec 2022 04:34:59 -0500
X-MC-Unique: j_-ya8VvOHyMx1Az6Cdjcw-1
Received: by mail-wm1-f71.google.com with SMTP id bg10-20020a05600c3c8a00b003d9717d882eso8834297wmb.2
        for <alex.bennee@linaro.org>; Thu, 29 Dec 2022 01:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
        b=oLHEDF7Vs4WjtUwj6/HcDVZj61uV8czLoz2Yoeow297lpM2jUFATNGlucwlz0fZ/Ua
         ukc0uqbPcyP+Qk1GMmNYp3Ga2YojdLtRSbMcWN5A8w0HpNjv7EQW/S37TB6ZRw5+aVbJ
         O6K89bR4GcBzCLwHqUQB5zGs4VEtQah2DSiQLW38BTQ91m/1H7LwbimcWjvNhAsQHU93
         eCxeJhmRg6xjK/LUdb2YXUkNgOfH4jH05pGApNK4tal7eINhxPjIf+Kj3gPVENVNuU+V
         0y3z8RdcfMmlNMM45Dn10xKPzKntnf4LCei4R3fDVJRjk7VY85V4QN9GzwmnDplrbgNY
         uuag==
X-Gm-Message-State: AFqh2kqvXdreR3Q2d5M4wsm/E3CYdFF0+YII/vHxPgckNp290gI3F4TS
	ph2xR4LBxfuihQiFUSoad5EOrzGBExUnGJA2gcnt6CE7155mVzgoUtcfO3MTAxt1gcuXjwOdCI7
	NdBT8CAZzTFglJu79
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id t17-20020a05600c41d100b003d23d7b6118mr19542859wmh.24.1672306498380;
        Thu, 29 Dec 2022 01:34:58 -0800 (PST)
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id t17-20020a05600c41d100b003d23d7b6118mr19542844wmh.24.1672306498196;
        Thu, 29 Dec 2022 01:34:58 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de. [109.42.113.203])
        by smtp.gmail.com with ESMTPSA id m185-20020a1c26c2000000b003c6f1732f65sm28144375wmm.38.2022.12.29.01.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 01:34:57 -0800 (PST)
Message-ID: <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
Date: Thu, 29 Dec 2022 10:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/6] tests: add G_GNUC_PRINTF for various functions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221219130205.687815-6-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6QYYN/ubJ0qh

On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/ahci-test.c           |  3 +++
>   tests/qtest/arm-cpu-features.c    |  1 +
>   tests/qtest/erst-test.c           |  2 +-
>   tests/qtest/ide-test.c            |  3 ++-
>   tests/qtest/ivshmem-test.c        |  4 ++--
>   tests/qtest/libqmp.c              |  2 +-
>   tests/qtest/libqos/libqos-pc.h    |  6 ++++--
>   tests/qtest/libqos/libqos-spapr.h |  6 ++++--
>   tests/qtest/libqos/libqos.h       |  6 ++++--
>   tests/qtest/libqos/virtio-9p.c    |  1 +
>   tests/qtest/migration-helpers.h   |  1 +
>   tests/qtest/rtas-test.c           |  2 +-
>   tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
>   tests/unit/test-qmp-cmds.c        | 13 +++++++++----
>   14 files changed, 36 insertions(+), 18 deletions(-)
...
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 2373cd64cb..6d52b4e5d8 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
>   }
>   
>   
> +G_GNUC_PRINTF(2, 3)
>   static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>   {
>       va_list ap;
> @@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>       return ret;
>   }
>   
> +G_GNUC_PRINTF(3, 4)
>   static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
>                                     const char *template, ...)
>   {
> @@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
>   
>   static void test_dispatch_cmd_deprecated(void)
>   {
> -    const char *cmd = "{ 'execute': 'test-command-features1' }";
> +    #define cmd "{ 'execute': 'test-command-features1' }"
>       QDict *ret;

That looks weird, why is this required?

  Thomas
