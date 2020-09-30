Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5489999lfq;
        Wed, 30 Sep 2020 05:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygw8qMOUEudWFjUAbdo5qv+dE0w73eDVXt/pGUJqr21l2zfM7OqRY4ScE0U2v0jTpD+kRP
X-Received: by 2002:a5d:5261:: with SMTP id l1mr2945456wrc.193.1601470235788;
        Wed, 30 Sep 2020 05:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601470235; cv=none;
        d=google.com; s=arc-20160816;
        b=tO+b9pUZKJlf1T01f8n6E/RqRr12GV1ca9hazh+evwvH8aCfbaNRuWyrNfIYbwJsCP
         v04divvaOeji8YsAs0GJqi1pO/DYt0zJMCoVDzWBVOcy83b9o5vEMBWizJTYnNqImoJd
         mHm7Eax2yzQ6k/eVQ3VOKHBP38/IN88b1vaf3eaITZSxx2nakms5WB3ftfIcYJNSNQ0q
         WjwMAhQHHugZ3gtK5JHdXmFoKl14kZOrxTjVfUgBy29bKi3Vvc0aY2moo7xx6gyT8ZmQ
         wttWfmqoclxpU83QNccUJ0J2rq+MsPzSNxHE9Y95z35JMCf0Y0/bUypmP6GrDQAmQB3+
         liKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=F9gcnRDLE89CjtY84guRHWpQh+L+GwxyRN6AlmhRgLU=;
        b=tKjyvuYvETy9HDolyOiFMIYWMjd0eRBN4c1Ha1SWabXJUfoSR8OVwz1sjwIHB9TFC+
         HjGOju7XUED2Cj/ihcFEGWXUOZOa6LRLOcPSSt0PXygvritTsKvYmV2/0f7Z8qnppxr3
         /Kxr49YA3tecueGqsRmny0NJlWvWTdYSHqwq4HKW/zCtS7EiGIg0cQ0MsHzYD34TxF6p
         E6UZffVFacl15S3GD54UGKMFgFwDULSCXEFgmr0Xmz2jNFZ9fVP07e9j0hiz/l4l/ScX
         Qfrp4dBGRcbLtA/Dr6iM6CkLelDPGGphSTA725bUD+weCc86UjV268YPQOCheeY4AHrO
         ovwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id y8si1649018wmj.102.2020.09.30.05.50.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 05:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 29CA0AF26;
	Wed, 30 Sep 2020 12:50:35 +0000 (UTC)
Subject: Re: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-3-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <19b1318a-f9be-5808-760b-ba7748d48267@suse.de>
Date: Wed, 30 Sep 2020 14:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: aDrsWLXY5+wC

On 9/30/20 12:43 AM, Philippe Mathieu-Daudé wrote:
> Extend the generic Meson script to pass optional target Kconfig
> file to the minikconf script.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> We could use fs.exists() but is_file() is more specific
> (can not be a directory).
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> ---
>  meson.build | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index d36dd085b5..9ab5d514d7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -529,6 +529,7 @@ kconfig_external_symbols = [
>  ]
>  ignored = ['TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_DIRS']
>  
> +fs = import('fs')
>  foreach target : target_dirs
>    config_target = keyval.load(meson.current_build_dir() / target / 'config-target.mak')
>  
> @@ -569,8 +570,13 @@ foreach target : target_dirs
>      endforeach
>  
>      config_devices_mak = target + '-config-devices.mak'
> +    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
> +    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
> +    if fs.is_file(target_kconfig)
> +      minikconf_input += [target_kconfig]
> +    endif
>      config_devices_mak = configure_file(
> -      input: ['default-configs' / target + '.mak', 'Kconfig'],
> +      input: minikconf_input,
>        output: config_devices_mak,
>        depfile: config_devices_mak + '.d',
>        capture: true,
> 

I can't say I understand it, but the general idea seems right to me.

Ciao,

Claudio
