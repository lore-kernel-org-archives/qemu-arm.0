Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3107618lfb;
        Sun, 8 Nov 2020 14:00:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq4DznBBUbF3IFuUbupBn7upNrGay11VEUfVgWyzmd7uEW/IvGlM6vQxkMJKnudWt5Jnud
X-Received: by 2002:a25:558b:: with SMTP id j133mr15729079ybb.224.1604872837295;
        Sun, 08 Nov 2020 14:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604872837; cv=none;
        d=google.com; s=arc-20160816;
        b=rf4slGUGVdBiiEbRxgsg4TZw42ZfL7OTD1VE6lYvGSsRwHB1pj05afswrRPNjiB1st
         A8dj87Lp8lrnLn+wUln6O/51av/Ki056EIufeoGFzc4/YXolB03KbUDO38cQ4prFbZjg
         W72XhKzumUCnqBGqn0IIH5xYf7UWlFreRI+ihqnt1A6Iy1Skajt6P8qWGd9ueZM0BV10
         bsQqzyisZJlFSYeeGikG3+QfKjotj018f5Axl3Bnu5kTkTCV4cgN37dbcAKrKtMXzvxM
         Yt7c+2Qw+QmKLr8BPXvZsktPpE1igCme+NZfoR7u1CHasC0STgfI4edVTqqFvfoPniUt
         auRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UFPY0cQ/Jorg5vSPE+0tEmA6/5gFXK6WA5ifFlgle7c=;
        b=By7WUBsDt3JQdoixK4gaTGVCJh7z3RRdgBrcAojd1a3QOb3kLErOygIRW7KyEJO8a6
         pIp+2YhLbPaMq43ZvPoJoEOw9MV/IAjDUoe3h3dgM9rRuqn8/QiW87+do9BBTMIuc2Zt
         FuwP6Qdpz+QnW97UMvIWT7QzDCcQmvaooAihVO+u0BE8sxBaXPTlLQhHkAMtTgGO7vm5
         Gf1alovNAzKaDAqtEChHRBBdVFfEG5B0nqojewkwlWY6H5S61D774fgnWlPqjNa5z7Td
         2XpbEat1IJEkgBeOOSMA5OGFserrlclOWJ3PRFmASXyTeyiYdv7n2vTQlnHpl5TpThCQ
         pJXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WSV1tUsR;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id a13si7356557ybp.357.2020.11.08.14.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 14:00:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WSV1tUsR;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604872836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFPY0cQ/Jorg5vSPE+0tEmA6/5gFXK6WA5ifFlgle7c=;
	b=WSV1tUsRd9xmE9stLEOYdBkkN2r47z8bUFOt7n+WfDo2dOtlOqH2dbyuS4EI1inTqLNSSG
	k5DxMKNDYpJJj1SMHp/nfA6HbZPgvh43kBlXzmn3svmyUCvJvbPHOKmeEyY4vmO+chgAqq
	280ulPNZPjpI5dxV2dhmGMq6W9VkeTU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352--F0IfPWqPJ2UJJ2QxZVeZg-1; Sun, 08 Nov 2020 17:00:35 -0500
X-MC-Unique: -F0IfPWqPJ2UJJ2QxZVeZg-1
Received: by mail-wr1-f71.google.com with SMTP id r16so3424761wrw.22
        for <alex.bennee@linaro.org>; Sun, 08 Nov 2020 14:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UFPY0cQ/Jorg5vSPE+0tEmA6/5gFXK6WA5ifFlgle7c=;
        b=KydvnKu1q0A2oDZnrzmdsd//rdJEUnh+1qZZfMeVi8lZ9GJrVgbioeN5FdwLsbQtwP
         iRqhhZcOfLC7dyS7VCxgYFusXug7lkpqKJL7EhMj/p29kYnLHsOA5gNBxV7o/JRaNg0A
         /VXXvEltEtcFus43qF/HMVyUxh9en60RtyiVQOV7VyPKp4TZ3rnSBGR92eLBpx2wa6XZ
         vDYEZKdBeidYbyFMtHpY/UCBv9XowfmwJfc0YLCOzOkFGD7yXZLR0r1n4TmQKBRhhTm1
         S9+5YAzOlSVz7XuuCSof3ImsMOwdCYHhn7jpQOepIYwqWtwzXXRyA/tT/0frlVz38uFg
         jmLA==
X-Gm-Message-State: AOAM531qzAWtQnsMFngJcyw1yFq7Zdbk6S74QkRjimylqQUnJC33SRiM
	U0jU3kf/JLA6vv0qtRnz9DT42OiPHjhYqiQ2nL3Lfs3ouuTK8QIq1O6UgmijnfWVnnARWdneeK5
	c2QABq4fuM8a4vi+d
X-Received: by 2002:adf:e28c:: with SMTP id v12mr14354251wri.230.1604872833926;
        Sun, 08 Nov 2020 14:00:33 -0800 (PST)
X-Received: by 2002:adf:e28c:: with SMTP id v12mr14354238wri.230.1604872833743;
        Sun, 08 Nov 2020 14:00:33 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id h4sm10865916wrp.52.2020.11.08.14.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 14:00:33 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v4 16/17] gitlab-ci: Make some ARM 32-bit jobs
 optional
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Igor Mammedov
 <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <rth@twiddle.net>, Fam Zheng <fam@euphon.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-17-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <901a30ce-1a72-90a5-dea7-f9eab9fac7fb@redhat.com>
Date: Sun, 8 Nov 2020 23:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-17-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CgVldmWQ61+v

On 11/8/20 9:45 PM, Philippe Mathieu-Daudé wrote:
> The armel/armhf targets have a lot in common. Instead of
> testing both user/system emulation on each target, test
> each one once. Mark the other combination optional, so
> user can still run the tests manually.
> 
> We now test system-mode emulation on armel target, and
> user-mode emulation to armhf target:
> 
> - armel-system          Yes
> - armel-user            Optional
> - armhf-system          Optional
> - armhf-user            Yes
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: qemu-arm@nongnu.org
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 03ebfabb3fa..e4526e98232 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -32,11 +32,17 @@ cross-armel-user:
>    <<: *cross_user_build_job_definition
>    variables:
>      IMAGE: debian-armel-cross
> +  rules:

As I only want to restrict this to push events, I'll add:

       - if: '$CI_PIPELINE_SOURCE != "push"'
         when: always

So all other events (merge request, pipeline triggered via WebUI)
the job is automatically executed.

> +    - when: manual
> +      allow_failure: true
>  
>  cross-armhf-system:
>    <<: *cross_system_build_job_definition
>    variables:
>      IMAGE: debian-armhf-cross
> +  rules:
> +    - when: manual
> +      allow_failure: true

Ditto (and in the MIPS job in next patch).

>  
>  cross-armhf-user:
>    <<: *cross_user_build_job_definition
> 
