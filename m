Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp789190lfb;
        Wed, 28 Apr 2021 09:38:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhtd1SDtkUvE6CCT6v2KygK33OMOEm1oxxjKhcrATrTMSYPL0gItOcc5cjNW9Zb0OFSZFK
X-Received: by 2002:a17:906:1c83:: with SMTP id g3mr30504678ejh.93.1619627897115;
        Wed, 28 Apr 2021 09:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619627897; cv=none;
        d=google.com; s=arc-20160816;
        b=nQNFZ89EVEYwUcts+oRLCPTDGaY2EMk1l143nVcstSq8fkuBMo9r5if5PdsmnH6Yu8
         zu2nQYLrcFd7GGYXUce9r3MePywfqF7M1fbkGurTlJuzIWIvfch+L2fDr5gpTdb2fMZQ
         o/Q3IruXQ/z2kFmwmt2FIBGkGTgnOGORVaB8gZGSj18mYVbiiUygfEl2Ik9swXEGBZT4
         pVu4/OZwi8boUjH96vP7+sr83I6kVFxsO9VbhZupSdLwchZJ9ubhGl+8wgjRUVL5Bnrn
         5IW3cl3fsAhZn7YecpRsClya/gBv9JOLCLl78uLq4mU2Bp2t/FC+fBmCJP/zB/Y/F4ru
         9Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uTaQc9FkCcuokZPM9UeLGsCCJu3lvE/81BuUp6++iKg=;
        b=MzQ+uRj4x6/SkMMrPMQKNVLRdXsMBxQC2zc1UijYCGJgqHgeQC6qRaMruE8aR/5nA4
         i7KqRogETR7s9QQ9iM0Eywzj7PNCxc7dPfwVqNdlUxJ+bt4NBxBtRcp6RLnIvV3L+vYH
         yFte+DqZvObY225Qjv757csGOsxlgYIz3YXawBtWYpp8sVWHWpSczNZIr8+SkWKNc2MS
         ZkAN4OvHqRpYI2CMq8DE/kGlLfeaCId+E3ARaqdY6ZULVSU+LwMCOJ06M70SWn11NOMW
         k/HNd2eil2/cD5K66fQG0XHQae8ftb6jnOcQ5MaAAnaIqgSRJ3WBByKbrABk485Jxdop
         VuCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XuxgKmFe;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y18si499279ejc.232.2021.04.28.09.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:38:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XuxgKmFe;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619627896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTaQc9FkCcuokZPM9UeLGsCCJu3lvE/81BuUp6++iKg=;
	b=XuxgKmFehehAHNhPyxHsOAMNmfB2Xz61Q1k9Zvkt8/0Vj7LEKdV/TqUI/laIAY80Z9corQ
	l3aSW7rfVQ926mSUMwG9QE2T0pIr5ZcNdDBWuokrSgRbCTbQl1wJ4GTel/2bxTzq4xWxLD
	/JGKU1bX1UpC/Sy1njV2+m5B27CVuOw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-2TexNsq9OG2M9M3aKmNtBA-1; Wed, 28 Apr 2021 12:38:09 -0400
X-MC-Unique: 2TexNsq9OG2M9M3aKmNtBA-1
Received: by mail-wm1-f69.google.com with SMTP id m22-20020a05600c4f56b0290145dde0633dso12832wmq.1
        for <alex.bennee@linaro.org>; Wed, 28 Apr 2021 09:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uTaQc9FkCcuokZPM9UeLGsCCJu3lvE/81BuUp6++iKg=;
        b=cUHdfjytA/lo7BuuJZG2x2baS/9X5al2L3mhsiqMOocZE3AmhLGSkYS9NnzAXOGt3h
         EGn2ZijZ2m7pbhPr2GzPJ3xIfmwtYFbK0fezUushSIA87sbFAnZ1/hQo5i8S5Y+eMqbP
         d+fmlNy0tVH0hFdXkdvKhQOma0jtITC9oJ7Fzk7K5HlFSZVfYd6M0J1PmJ3p4jf2lifZ
         eXKYPxDebo7gDczKVM5Q8zsDAd9cHJMYh3ryC1TLMJm7FXZx/BXFBBS50YH2EcAd2ksh
         k0FzjY08X4+Jp8f2XVhtEazZ2XIYlpgJEHaltcs/S5+BOTsmi2akXsnJUN8oV3LTpmoa
         GjTA==
X-Gm-Message-State: AOAM531XdLr4OoAiB3cdcE57+WPlD5jOhVVe+tpq4teQiP9kitpWYibd
	5jnUs6gtgn/jBq00NBXSk3Kw8DpeB76KYH8sLKRgJ3OqB3scK1ZSYhSiPH7+nVYnl0bvpwMYQKs
	x3V17kUuK1lzDM2Ku
X-Received: by 2002:adf:9011:: with SMTP id h17mr37172857wrh.384.1619627886727;
        Wed, 28 Apr 2021 09:38:06 -0700 (PDT)
X-Received: by 2002:adf:9011:: with SMTP id h17mr37172849wrh.384.1619627886559;
        Wed, 28 Apr 2021 09:38:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id u5sm330680wrt.71.2021.04.28.09.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:38:06 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana
 <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Emilio G . Cota" <cota@braap.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com>
Date: Wed, 28 Apr 2021 18:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-13-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jkzD4P0fV6Kc

Alex, Richard, do you mind reviewing this one please?

On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The previous attempt (commit f77147cd4de) doesn't work as
> expected, as we still have CONFIG_TCG=1 when using:
> 
>   configure --disable-system --disable-user
> 
> Now than we have removed the use of CONFIG_TCG from target-dependent
> files in tests/qtest/, we can remove the unconditional definition of
> CONFIG_TCG in config_host.
> 
> This avoid to build a bunch of unrequired objects when building with
> --disable-tcg (in particular the softfloat tests):
> 
> Before:
> 
>   $ make
>   [1/812] Generating trace-qom.h with a custom command
>   ...
> 
> After:
> 
>   $ make
>   [1/349] Generating trace-qom.h with a custom command
>   ...
> 
> A difference of 463 objects...
> 
> Reported-by: Claudio Fontana <cfontana@suse.de>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Include Paolo's feedback:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
> therefore o not include Alex's R-b tag.
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>
> ---
>  meson.build | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..623cbe50685 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -262,7 +262,6 @@
>                          language: ['c', 'cpp', 'objc'])
>  
>    accelerators += 'CONFIG_TCG'
> -  config_host += { 'CONFIG_TCG': 'y' }
>  endif
>  
>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
> 
