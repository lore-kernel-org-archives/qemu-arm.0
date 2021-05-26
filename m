Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5515863lfm;
        Wed, 26 May 2021 08:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw23eUcYpU3sZCpRb/E8bxR1Q1AgaE2h/ucSAtX+J2Ae6mOC9fwXIpplEciA1+xoVu3zJA
X-Received: by 2002:a17:906:4a5a:: with SMTP id a26mr32649153ejv.548.1622041569143;
        Wed, 26 May 2021 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622041569; cv=none;
        d=google.com; s=arc-20160816;
        b=yfXdFgNSjMlg/nNiOYFcMjm0nlthRZQNLoujjwjcYLjPJ67MRS6c/2wgKE8Z+9G78r
         v5S1IfbyQTCMPjMSbBI4ib++Mli8o5RzDQGMY/9521hlxCub3p0VIfnWHlGhyG51/L47
         Ia7EDwBS12fDVaX/eRdAZumm3tLKovcInAObPm4JrMqg4QmPY/6J3a4VNgl3Fp2yVviv
         u1tXIEHManjBIGGj+omMh4pmWqsKVk5QJqiqySxz60A3UwqmJl9pmyLK/fwUj/PIjvrj
         qs7oZSM7cEZzquzjAOCO9Nm6u34r8KIFx7uSSio6Acl8myDEcmHosPcBYOs/AyAkAPgw
         dfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EJpel+uDhX/kgRZr6JWUBJGv5HNhK9aHa7tgJEuNYsY=;
        b=oxA9F7ZdG5y9KXCWtZJ/Hu1fGxVxQSLNBVpLgELKj1qN9G7DoPHqbjwAVtWU11adzM
         CDpxcNUsRir3P1oKocuF9CarSAXp1y1YPEJeR9lc7wjZRlmN7O5bv1K8pVuZbodUPL7F
         pZFRiVpfE4jc8DLnvH+JIItboeCmaIZMn37iWP0T3MlU0zz+RLocdTwKJa6Gc83rWjd9
         ybLyFzufrEcijaCe4NVug/+eoJqz9Y0FISeEeCopCqi6Oon+ussUUqrD4kA+aLbi9uJr
         C7sgnu+mkzWWjvXX7vk8QHSgsqbT3xtxrwV9SCY0vL6G05wA/1woDYMO1JdA4XHr/FBq
         lzrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f/fcy9tg";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f12si20159364edx.227.2021.05.26.08.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 08:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f/fcy9tg";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622041568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJpel+uDhX/kgRZr6JWUBJGv5HNhK9aHa7tgJEuNYsY=;
	b=f/fcy9tgKmMYznZMRfrmT+mik6MN7g9eT94rGqfK6pworNVaPWN9vJRcExzQHiH8x9ZtYW
	Bwvd3WAc+Ma4STRaDP/4X5KnbJyOeckA2PZaWRSvu46m+pV7a3wb+ngfxYyK52O0rNxqaI
	A4yjuXjI34Eqv2eFh2rrHT06+o3YDi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-jKsLJlvwPX2JMs75ZUlJ5Q-1; Wed, 26 May 2021 11:06:06 -0400
X-MC-Unique: jKsLJlvwPX2JMs75ZUlJ5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AD44800D62;
	Wed, 26 May 2021 15:06:03 +0000 (UTC)
Received: from [10.36.112.15] (ovpn-112-15.ams2.redhat.com [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C9A136F5;
	Wed, 26 May 2021 15:06:00 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 3/4] arm64: enable its-migration tests
 for TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org, alexandru.elisei@arm.com, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com, maz@kernel.org
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-4-alex.bennee@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <32ada1c7-bc49-db4f-c9cd-64839ffe93c9@redhat.com>
Date: Wed, 26 May 2021 17:05:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210525172628.2088-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-TUID: khZTY94mmmnm

Hi Alex,

On 5/25/21 7:26 PM, Alex Bennée wrote:
> With the support for TCG emulated GIC we can also test these now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  arm/unittests.cfg | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index f776b66..1a39428 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -194,7 +194,6 @@ arch = arm64
>  [its-migration]
>  file = gic.flat
>  smp = $MAX_SMP
> -accel = kvm
>  extra_params = -machine gic-version=3 -append 'its-migration'
>  groups = its migration
>  arch = arm64
> @@ -202,7 +201,6 @@ arch = arm64
>  [its-pending-migration]
>  file = gic.flat
>  smp = $MAX_SMP
> -accel = kvm
>  extra_params = -machine gic-version=3 -append 'its-pending-migration'
>  groups = its migration
>  arch = arm64
> 
