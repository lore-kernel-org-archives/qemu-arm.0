Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp251020ejb;
        Wed, 15 Feb 2023 23:55:41 -0800 (PST)
X-Google-Smtp-Source: AK7set84p+pmKOGo9r+bv6iuO8n6AZpZONEmi6GOmt9uXqjK6NbMbB/kxs23A3gNVT4guahMGXYK
X-Received: by 2002:a0d:f243:0:b0:533:4b0:1a15 with SMTP id b64-20020a0df243000000b0053304b01a15mr1413185ywf.45.1676534141230;
        Wed, 15 Feb 2023 23:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676534141; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQ4Ws/OO9Dz9rLpp45auEAKIinypPynv/mJ/hvr6uQlOqfhcjzpuOZ/8ngdp/BQmRp
         r3O+VTFY1y5cW/XVqV4fWV1JdO3kyw62c9GtmKK+aNGEP5HknbGJ2LREOHXU5ltTZ5bY
         qpNoDoode3QCqd2/60T87LSQjzBOn/TdtGsCTqKn67ofjsoKQ8GL3Hikv1Dy92kzoi+v
         cOF9qOC1AjsfrS1LJAA9OOpsleHUt6gW0XKfW9VJ5sA/RPUv611WC4AqSNftjsy4V582
         OqYfDfBDIoibsswdUhCuKT2RB+alv2YEjR5dKYYvcAWgEjjPm1nwMex0V5lzeWzudLo0
         OB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XP5lTNS9M/3hu499TdM2vrS4F1Z+ZwVJAD2BS995kX0=;
        b=uuyULxzAisA/ctzmgbCjulamkaMxH4POftT0QjQ5Cou4n57SMzXpfCwTWML65qsEyQ
         yTny66tB1PEL18pSYf/ykXy+CaxCpI7AlvOC5CP32dM+kxhKShsBBHnYLuSqZUDglIK4
         q26RiMLVpkzAgTgArdvXqBMwglgroiUT8KwKPi9ZTFnhf7lidDE4AsrZO2xqiVC1roCI
         fvjwVcvgxuFDZh9OVSHzylyUOToyNB43PzcmZQfpTSoE6hFdnK6PQAtMVMV0vtd+1xIh
         Ij5rTaOAKeQUQf6c8aW7gioJe0BBEqE4rW3CvRrCnQTdgFcZvy6NZentm9GEPierns4N
         mO0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HstIW1dC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i4-20020a819104000000b00510285bdef1si1139219ywg.359.2023.02.15.23.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HstIW1dC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676534140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP5lTNS9M/3hu499TdM2vrS4F1Z+ZwVJAD2BS995kX0=;
	b=HstIW1dC+dsCnd3JmkJhKCo7tC0BDcQuU5ze1nO09FitU5QUhCtV17qSxZlQ78ihY80c0b
	T6j5g847vQwKIAGFkJH99c8qvE1l+9Ky24hBEl11NtqGYKFLJTS2ZAo0gqSEiz6L+txTpH
	ZKAXLbvnNOQa7HM4ApA251lBDj4oblk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-nRbIsO5-M5WZXQIAo8tU3Q-1; Thu, 16 Feb 2023 02:55:38 -0500
X-MC-Unique: nRbIsO5-M5WZXQIAo8tU3Q-1
Received: by mail-qt1-f197.google.com with SMTP id g9-20020ac80709000000b003ba266c0c2bso799938qth.5
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2023 23:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XP5lTNS9M/3hu499TdM2vrS4F1Z+ZwVJAD2BS995kX0=;
        b=dlv8T0/bkej40Rh4r0jLmYWCdgu+x8gT1oGrvv4oEiPeuMtiA83iG9R8fmqcaNQ5d/
         7W36B3YB0YCavVNz9SmSIo1hc0c+efRoBkW9baHI4AJObhnfhf/wYWqvn8/dSCQ8REya
         Umw/impSEFTBiJvqZrwrf11izSU/rCyEy6ANIanzgs0iL8VExPu/jjXFJfxvs+gpwi64
         La/ywYY8iFCrTVSUuPwo58+5czDS1unZdp6sMS+nLhQaq9g5cNJsMsGLWR5kWqxjSjdH
         WssQLLUxrDCuK3xgOPcOidVXq+SxvDmLrs0220sdsOhOo8tPwqzOnim4UhS08FkSjgT8
         hP0g==
X-Gm-Message-State: AO0yUKWfiWskbtE/+9SIO1fPOAWH13AcUKp0T7hTlSdlznnIhOEUtB0x
	a6JmBpKLFTU36pWO3JeIyxi64/sq3j6EzPLc6geEa0QK6YDs41BWq71p7EKJoAiM1CJd0Jet2AA
	idGeyv8nQVp/b+NplQ0ZG1uEr/l84KKjSI5vRxXNofUlc4hZI4psS9HLvfHywLsaAj3w/xvXP
X-Received: by 2002:a05:6214:d84:b0:56e:b13f:fea0 with SMTP id e4-20020a0562140d8400b0056eb13ffea0mr8532157qve.46.1676534138312;
        Wed, 15 Feb 2023 23:55:38 -0800 (PST)
X-Received: by 2002:a05:6214:d84:b0:56e:b13f:fea0 with SMTP id e4-20020a0562140d8400b0056eb13ffea0mr8532112qve.46.1676534137946;
        Wed, 15 Feb 2023 23:55:37 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id o185-20020a375ac2000000b007339c5114a9sm686881qkb.103.2023.02.15.23.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:55:37 -0800 (PST)
Message-ID: <3f0d1adf-369b-2ccb-b13f-e9e5670c8c32@redhat.com>
Date: Thu, 16 Feb 2023 08:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JssyJzB0Ghhg

On 15/02/2023 20.25, Alex Bennée wrote:
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                        |  4 ++--
>   .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
>   .gitlab-ci.d/containers.yml                   |  4 ++--
>   .../{ubuntu2004.docker => ubuntu2204.docker}  | 16 +++++---------
>   tests/docker/test-tsan                        |  2 +-
>   tests/lcitool/refresh                         | 10 +--------
>   6 files changed, 23 insertions(+), 35 deletions(-)
>   rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

Reviewed-by: Thomas Huth <thuth@redhat.com>
