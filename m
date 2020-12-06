Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2514033lfb;
        Sun, 6 Dec 2020 11:23:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzICTQ0Acf8O5XUkKNxH3AaMaWTlkVHCJ5DFtNcFF5Ln1rK7O2UPnb6wIBYsIIIjS5tw/9F
X-Received: by 2002:a5d:6782:: with SMTP id v2mr4004606wru.384.1607282636076;
        Sun, 06 Dec 2020 11:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607282636; cv=none;
        d=google.com; s=arc-20160816;
        b=IdUJTp6ecOZlVh9SHNPtBMDHV5nio5pdA2CwAmCBkzMmmyFMFUYifrBee3KbFelpdW
         MmmRA08dT255RRRakZ8TZ9Tpdz6vEL8xX4ANprTu0GfAXmr46aBUP6rxSnOrWG1Pwju0
         OUJ+iLu1nxXsS3+tABDWhF4lq4MmalYTPqFfPqZkjURCfrNjsTpoNfcbNteX4Thl+WFp
         7sRfIi4Yh+Z4q8DOBMUyK4NHRZt+XTWh4mnqtWIN7ti6GEtIVqQMKUeyoBB8Jha1m/Tv
         AjDl5jm3xhvYhcfPCru+1Mt/uteWNbjM5GRa35JaoB8zuve+QtEstmW/8/fqX4sHjWAk
         nG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=RnaLw0xJg7I/FZDY9J7iJ66DF/qBt3ZTOpL0YCZrmDs=;
        b=vkX1FCx0+Cy/ova2arZGthCgiIWsTxCx61NETg4hdB8Wv6c99MXQ1zyXWfc6nGJVMr
         qCcbfBUaLY/ZnXlCZAwmrqlyvPKTVjm7gCz5K3jdXPZKx4jNdBu8UlVRPYz7+T/BVbT9
         vdA6yJ2k2cvAxzkEzk12aCmFxWl0TivDfILQFjFvPxnB6hE9j0LKq88BEZkUyWBkQuJc
         WegbdUvGuxm/SZcGafEIxnme9McHvWN/UxekfGcUnPKnuu9M8kFZJLdrPeF9FEtBcjdp
         smYqpjiasAXDLSYDe0knilDWcbmYpJeXQkhROx1/dEzX+fJwR/ZiK8ktnZF0VKMqSJXI
         BG1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id f10si12126358wrc.92.2020.12.06.11.23.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 11:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 63E26AC90;
	Sun,  6 Dec 2020 19:23:55 +0000 (UTC)
Subject: Re: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-3-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
Date: Sun, 6 Dec 2020 20:23:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hHzyKyvJNDpQ

On 12/6/20 7:55 PM, Philippe Mathieu-Daudé wrote:
> Introduce a job template to cross-build accelerator specific
> jobs (enable a specific accelerator, disabling the others).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 099949aaef3..be63b209c5b 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -13,6 +13,18 @@
>            xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build
>  
> +.cross_accel_build_job:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  timeout: 30m
> +  script:
> +    - mkdir build
> +    - cd build
> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
> +    - make -j$(expr $(nproc) + 1) all check-build
> +
>  .cross_user_build_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> 

Hi Philippe,

probably I just don't understand how this works, but
where is the "disabling the others" part?

I see the --enable-${ACCEL:-kvm}, but I would expect some --disable-XXX ?

I am probably just missing something..

Thanks,

Ciao,

Claudio
