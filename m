Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp120041ejq;
        Thu, 4 May 2023 00:21:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7uLZcNHARxbfqVvWOuT+JCHEotKb9k14YGybFUTZ85952Nk9KYdof1CdOUSjyIyxHNc1Cy
X-Received: by 2002:ac8:57c8:0:b0:3ef:3ff5:ce28 with SMTP id w8-20020ac857c8000000b003ef3ff5ce28mr3988034qta.39.1683184900770;
        Thu, 04 May 2023 00:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683184900; cv=none;
        d=google.com; s=arc-20160816;
        b=d2nhexD4H2ta6C4fh+eSNtqcBSiWULXKrvG7M1y3QHl7mS9IqgSsYhAIe5XPEftBsj
         K5+2jdWnd2ftt9+tbpTxrmHwsr3l/NmPysFbGMkG3/L0XXYokV3wiwi2Dbi/qHOB4bU1
         rLyeVRELQ4GuVmqsOnw+b1ZFyCrMy/Fn7xnlXFQOOYoSMjgC4MaJ/Vy1MPGKaTOaodlQ
         GRLBzArd/u97yClPPvRjh6P0pz4hdqUFopQQjQtz6XJxRrlDa9gdzD6x4l8/651i6kRa
         nkWYrtmlHxkNFeWp3C4sRWfO5sTReepH78MjVIJQSv7H05IW90HxkKa9JSndJkSCWqZA
         Nhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uEIJAhPmVBaFq2zXLz4mDps4gZ9jRqa3EL5mhn/V6Mk=;
        b=RkhJOmXhDd73YiNPhN4YwaLaVK7xIsFbQ8oZnbU9pPZ4qC/myq9cZ+ln9MG9Vtkfjk
         YWWnmUwQA2U8vpwAZsYNTuX+dCowjAicsNJOv4cf0p+1b2ej9vxtsldYMuYnEJfkbN+s
         qfGohYWDgOFD+mf6XHZavtkZ+cgdyV5wNno1WCGmgIlmIFyM+Iz8vHQKrTmjQCx0pIe2
         aePkPquXr9Ir1PBjFq6h/8OQfKUOerHeCAqaKaBZ6+XwqWEJWwMGalGcQVHif+7cfdqi
         fY74V0dK9zhktkGx2jEyLlCkzneOwMCthO2PpU76bdl7t6yo+tO05L0MoACtdLW3+M1G
         4Kvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNkHB3XY;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id br14-20020a05620a460e00b007220d6ca34esi19640679qkb.748.2023.05.04.00.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNkHB3XY;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683184900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEIJAhPmVBaFq2zXLz4mDps4gZ9jRqa3EL5mhn/V6Mk=;
	b=XNkHB3XYDr8Sw24pkGUGm5eIfaaTwktHy2FpJZXV/CB9Zihvx+D3L+2EjHkwfrYatViz5R
	2/k23lrD9eCrxzyAtSVwbU4+LfL9RRhQPd3NbdnUqAhO6FmenZhvJ3lAjydEbP48GlnVZ5
	1R+zd71vwhwmBgB2n3t96w5ClB2UG4Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-8pZQ2AkjPp2FcvMZ6PtKtQ-1; Thu, 04 May 2023 03:21:39 -0400
X-MC-Unique: 8pZQ2AkjPp2FcvMZ6PtKtQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a348facbbso16113966b.1
        for <alex.bennee@linaro.org>; Thu, 04 May 2023 00:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683184898; x=1685776898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEIJAhPmVBaFq2zXLz4mDps4gZ9jRqa3EL5mhn/V6Mk=;
        b=jNc8X4jfgfq+2258lsDNsBxSGGFuoG7xQ3UX0vRK4JYbl88cH574aFYpzww7nuAHj4
         ZHwPpTr1rhIEDyQXfgSb+BfjQEyyDGFNtPegXf/REZiGQ0hx0GlorcbOHBGdQPwxHSBs
         jRTYjIFeCZoJdp+sOY/WOrp03wcWYpazj4UPoTuwKjUuJX7f2xi5RehC9sla4dFv1VzK
         MsC1aQHynQpsZ/UgLJYfEeNulcLbyrOTugR+U+OqqFk7MjHGtICM0eFjnqRcZ4VMbMRI
         CqJOaeKeO5O2uISz+4v3Q9Fv1MR5YyZC7r8VS6codRi6Zk14uZsOsKrhvV9h2FCXERUX
         O3GA==
X-Gm-Message-State: AC+VfDzIqX4d22CRezfg6twxUYaE6JgUfXq7sFfSdeBs+g/qTk1A2eI7
	gNZ1VgLVBvVquhbbKT7ZpGw4Vr9esml5cqG1ymssLmFVuOM7suT+jMJiMrv7shyfqOovGx5rX9n
	SvziZ1SfBquhWQacC
X-Received: by 2002:a17:907:948a:b0:8b1:3467:d71b with SMTP id dm10-20020a170907948a00b008b13467d71bmr5675399ejc.48.1683184898118;
        Thu, 04 May 2023 00:21:38 -0700 (PDT)
X-Received: by 2002:a17:907:948a:b0:8b1:3467:d71b with SMTP id dm10-20020a170907948a00b008b13467d71bmr5675390ejc.48.1683184897844;
        Thu, 04 May 2023 00:21:37 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id s25-20020a170906779900b0094a52b041dasm18495451ejm.112.2023.05.04.00.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:21:37 -0700 (PDT)
Message-ID: <98c2213b-ea26-c994-c8c8-825f2387081d@redhat.com>
Date: Thu, 4 May 2023 09:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] target/arm: Add CONFIG_ARM_V7M back to default.mak
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-3-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503193833.29047-3-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: uQcxwwhxXZiC

On 5/3/23 21:38, Fabiano Rosas wrote:
> We cannot allow this config to be disabled at the moment as not all of
> the relevant code is protected by it.
> 
> Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
> KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
> is now possible that nothing selects ARM_V7M (e.g. when doing a
> --without-default-devices build).
> 
> Return the CONFIG_ARM_V7M entry to default.mak while we don't enable
> the compilation without it. Note that this goes against the intention
> of commit cd43648a44 ("hw/arm: move CONFIG_V7M out of
> default-devices"), but at this point this is the smallest change we
> can do.

If this is a dependency of target/arm/tcg/translate.c on ARM_V7M, it 
should be written as

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b23..498bdba1e139 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,5 +1,6 @@
  config ARM
      bool
+    select ARM_V7M if TCG

  config AARCH64
      bool


Paolo

> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configs/devices/arm-softmmu/default.mak | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 647fbce88d..0c2b24d6bb 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -4,3 +4,4 @@
>   # CONFIG_TEST_DEVICES=n
>   
>   CONFIG_ARM_VIRT=y
> +CONFIG_ARM_V7M=y
