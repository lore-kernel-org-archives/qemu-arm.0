Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp921485ejc;
        Fri, 20 Jan 2023 00:29:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtqrOX+s3xzp20Efu/9rL5VxJxdeZKXmcX4E16dZIG8B1yWGN7CwNhgzG9f7drckNZ5g7H7
X-Received: by 2002:a05:6214:598d:b0:532:2501:c1fb with SMTP id ll13-20020a056214598d00b005322501c1fbmr24331317qvb.20.1674203365479;
        Fri, 20 Jan 2023 00:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203365; cv=none;
        d=google.com; s=arc-20160816;
        b=HMsAMpaEg9sUUVshTiKUjOFAA3pyg9Wj/1yDQuQ6Tef5HO8yo265SOTl2nCMVMSvdL
         Lno0FXDc7aqn7kYIHDZuExfYzrZ/ZcfHRQ93lw7E36gClxpwJXmbH4m8a2cyUHJeMMwR
         LPag3rLNo5fdaTTjpbVrFYK4KD63FM/Y8A0syvc+Jwi9TKw0scT9D5R1F70QGChxNmuY
         v8x1s9qJxFJL+bAukgPv83Gm6kfo02T32VDTTVxJo99egidakXco2Z2xVHFtNOJxOhqn
         DUZF/hpTUQe5P2fhEVyOc9ssTHUZuLUvLK+HzEq3MPk+excFQ2b9LTi95Q3WVehuBUlM
         4aVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JRyBmUb0kmG0Q27J3jrlahQU/nwgXi87B8CD4lN3CR0=;
        b=i52oAICGIb3Xjoa6GxAPF1MACcTE74t8bzhqGpIfNOlW4QYQWh19ktkYUGuo1bPFM0
         O7tf4wC8Fa6bYScOA/eJhLuortl/kdgrReD6+CmtHJxumMshKVAdM5p4YMB3sw0GpZve
         zHJ+jDko1SAghTHNyeZeFErZpLs73Q7Ej0eSSVt4ZKxOm19yF5if7o7tEl0QyuyIe9aF
         u68KyANqe+axncSmsz+gY5n5iWzyk5CytJwkmt27jaUNHVyfkqCurtq12XBlVXs/us16
         bfOB5s6sEwxt1nxREtl9DWZFCBGw5nvx7+PmbKm8Cbqi04Iq2G5sAalt21NZbsv6UXZi
         f9Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Akzu9YPH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e2-20020a0562141d0200b0053519a161d5si9872129qvd.555.2023.01.20.00.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:29:25 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Akzu9YPH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674203365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRyBmUb0kmG0Q27J3jrlahQU/nwgXi87B8CD4lN3CR0=;
	b=Akzu9YPHbkTljimMs5AD/QJEscCf1l53vgkk1MjTFGC49f0h3KLQit1kGJ+AhWrDFIpJhw
	pV8NV8MZQQILVz39G24D8mgzTS6GiCASJV4lz9P3xnpIH7l6LAlpOsP0dL4mgpMT9kjLFs
	zcHOPJ88y1TsGYnl6Wq/KI6fuAa7XCw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-wS4jOLCnMR2-jcOh7DOz-A-1; Fri, 20 Jan 2023 03:29:23 -0500
X-MC-Unique: wS4jOLCnMR2-jcOh7DOz-A-1
Received: by mail-qt1-f199.google.com with SMTP id r24-20020ac85e98000000b003b68b691996so2140749qtx.13
        for <alex.bennee@linaro.org>; Fri, 20 Jan 2023 00:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRyBmUb0kmG0Q27J3jrlahQU/nwgXi87B8CD4lN3CR0=;
        b=JbOklhiPEJOUcEiwqaTkY5jqWtnkxhLWB4h1Rc2NA+AV6Zhd3japEvqVM1HaVBRm1E
         RdDJ+WM0h81HZ8RvKyIY92J4Z3d3vvsbE0tBSdm/ImgoPEgbfv+hy5SWfgGjoX7oyHDw
         NkVV8KlsN0r640Md5GSQUoKD8agrXuW1ZgZWkW1V0Ez1Vg7XPn0mrDXFBPfHh6gQbdxm
         9jSA3gGvq7We07ZOf0VbPqBMZAOUd1YF8M5LC7zuYLZOK+GDvF1hso4Xon9TP9yXzflP
         f9+KT3n0WIC53y9oiNiCZ8Mt6/YElBF1fYcZLuOC5Pivm2DVcTmMq4jTGkrT9Iz+vYq8
         LRfg==
X-Gm-Message-State: AFqh2koGfjFaczsewRPplhlwnWYlaTbY2LbT9b4kSQ4qLUPhZNJMg9sR
	oEjixW/mc4+dm5RV3bqCQwo6FEKy4DMz8lk9y+5j1xermFcOUzg4C9Ldj/ye8lKp9qLpHzpO3R9
	o9u1RSqzX3exWi4dY
X-Received: by 2002:ac8:6b02:0:b0:3b4:752e:246b with SMTP id w2-20020ac86b02000000b003b4752e246bmr19695480qts.7.1674203363036;
        Fri, 20 Jan 2023 00:29:23 -0800 (PST)
X-Received: by 2002:ac8:6b02:0:b0:3b4:752e:246b with SMTP id w2-20020ac86b02000000b003b4752e246bmr19695468qts.7.1674203362812;
        Fri, 20 Jan 2023 00:29:22 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de. [109.43.177.118])
        by smtp.gmail.com with ESMTPSA id q3-20020ac87343000000b003b6464eda40sm4005587qtp.25.2023.01.20.00.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:29:22 -0800 (PST)
Message-ID: <3cc1367b-d47b-5d58-14ff-fa880ddaf52a@redhat.com>
Date: Fri, 20 Jan 2023 09:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] gitlab-ci: Check building KVM-only aarch64 target
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230120082548.60144-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230120082548.60144-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Gy1mZ+TMO6Yh

On 20/01/2023 09.25, Philippe Mathieu-Daudé wrote:
> Add a manual new job to cross-build the aarch64 target with
> only the KVM accelerator enabled (in particular, no TCG).
> 
> Re-enable running the similar job on the project Aarch64
> custom runner.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20230118193518.26433-1-farosas@suse.de>
>            target/arm: CONFIG_TCG=n part 1
> 
> Successful job:
>    https://gitlab.com/philmd/qemu/-/jobs/3630178191
>    Duration: 15 minutes 25 seconds
> 
> Since v1:
> - mark job as manual (Alex)
> - re-enable on custom runner
> ---
>   .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
>   2 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
