Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5512719lfq;
        Wed, 30 Sep 2020 06:17:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7vlbmyXGNBz27QP9EODAx2J8/p2NLO7Q+jPCYX5nO/Tlyf3ni5YN8/ObLxwCexy9axuFi
X-Received: by 2002:a17:906:b88f:: with SMTP id hb15mr1503901ejb.45.1601471836125;
        Wed, 30 Sep 2020 06:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601471836; cv=none;
        d=google.com; s=arc-20160816;
        b=s6ey14hjFHu5ATjxJVF0cYwdrGMVAYyWuCf4jtxUSTUS9vNQqvCGwctfCAxS5pWIHn
         sshraJQgomri+EkYWWxGRLiqdZUGuZ8UoLbq8+hyUc4RIVI0poGgdD4rqecZh76FNFPs
         WVemp7n6QqL+uvQJDDO9jnL1zKuBlwPwC6El87uW9SE/OfuaBb9X4mNw1qRDAJ/Eq8t1
         kEOexvCYIt5Gj3C0EahL3A8bH21I+RAM0S9KvDwQr3rtmDUuw0Y7d+GZwjWZMLAvTKnv
         phcm6Xf9NALGr5IzKkG2OKwY8q0RFlWTTig+z/DV2KZ5UYLhAQ+B39Tw1kKifOHDcejO
         xwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=k+T3hp1G/8usQabHu6Z+BeraaB8GJWxJvx9lFv1z4Og=;
        b=qzGAezx3+jSzeRBNWqnoFHQ0QfokXPm2T8lwmrcD68dm8DUXDR99gmC3pw3wbT1I3p
         wiRn6wFXMlcTXmm42EkKGfaGPcyyjTIOdvK8v7skv1OaXLsR6lzsPgPr2DZ9RpX4HP6I
         LRKkZ88W/tAOyOyssvpY1NMmZCVVJuzGy7ajOnK4eg37GoeQv0Uw+RWR66csLOhSeiMo
         LJ1vLAUcdUZLMXRt7vsR367U9tKioveGCIoBvWwO1uxO4bKzwfJn6ZV6TD5taIr/zmx1
         I5iUTEc6rqiQ5phlzyXOO2xfpZrnf04ygds7+N46jb64nqqlo5pfvQhVmPx5koQjXRSd
         fxTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q7TcezTC;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f14si1046207edt.186.2020.09.30.06.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 06:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q7TcezTC;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601471834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+T3hp1G/8usQabHu6Z+BeraaB8GJWxJvx9lFv1z4Og=;
	b=Q7TcezTCB1xb2JRAT6Hfo0aRjeW+tcKMnXUgGdMal/VGdrKt55fjCS5G2ukmLCs+LyD1pr
	Iu0wdIgvKR+94kuRjGflOoWCRpIoeCjrLKArsmjjar6DhQrWudmq9lAr/W4Tw7PMUtw13a
	xvGUlbMUXyyDiC/uvTHfCYHZjO+LyAU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-iuNDhxUGO2aVjwIuT_L-pA-1; Wed, 30 Sep 2020 09:17:09 -0400
X-MC-Unique: iuNDhxUGO2aVjwIuT_L-pA-1
Received: by mail-wm1-f72.google.com with SMTP id c204so461609wmd.5
        for <alex.bennee@linaro.org>; Wed, 30 Sep 2020 06:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+T3hp1G/8usQabHu6Z+BeraaB8GJWxJvx9lFv1z4Og=;
        b=AZC0XAMzwJBqnE2zP7msH7cQ+IR42V994nuCSwfay31oyYQ1ixaBs5BPy/Q9KM3mJj
         lSIvDKH/m0LvdE8Qs838YR0BZmdMX6gI2kUXBmqyvzDifQ4q67r7I1bZ95N9DeVXTtV0
         HDV12gcNbvV2FAFeHaO1a69jTOKXuU8BKgsEqI/KU2zy6XKn3jhBzUdbKMzahSG/g75z
         ksSz01SRcWiS5YvysarOZs/KN2sQv1Avt2ZAGSeeFKPcRysvP0FZ996CsGEAT3kM2F5a
         3h5BSIHQpboUt2SU1bVXyJVJrNjfglhbD/UYKUC5qG6GKNuSkW6vcutqG1az7fb35X9C
         xD9A==
X-Gm-Message-State: AOAM530lGNgFm15M88YsdpdS5CL1DQE8yASoQQvgf0/SeKGJfu9aC6Ll
	azvg9fdkuyJcf5O2yU1Orwt9Y0dVMuiV+QFjuh6XPMojvs1zLtK7du+Gw1gW0jyLeIYUjbklOlB
	W6YeIH4QW0hf5JJCF
X-Received: by 2002:a5d:570b:: with SMTP id a11mr3221726wrv.139.1601471828201;
        Wed, 30 Sep 2020 06:17:08 -0700 (PDT)
X-Received: by 2002:a5d:570b:: with SMTP id a11mr3221701wrv.139.1601471827982;
        Wed, 30 Sep 2020 06:17:07 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:75e3:aaa7:77d6:f4e4? ([2001:b07:6468:f312:75e3:aaa7:77d6:f4e4])
        by smtp.gmail.com with ESMTPSA id h3sm3118133wrq.0.2020.09.30.06.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 06:17:07 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-3-philmd@redhat.com>
 <19b1318a-f9be-5808-760b-ba7748d48267@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <254ee778-e8b6-9acf-d7c7-075eb3a88a65@redhat.com>
Date: Wed, 30 Sep 2020 15:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <19b1318a-f9be-5808-760b-ba7748d48267@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: mw9oLq0rsUob

On 30/09/20 14:50, Claudio Fontana wrote:
> On 9/30/20 12:43 AM, Philippe Mathieu-Daudé wrote:
>> Extend the generic Meson script to pass optional target Kconfig
>> file to the minikconf script.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> We could use fs.exists() but is_file() is more specific
>> (can not be a directory).
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Claudio Fontana <cfontana@suse.de>
>> ---
>>  meson.build | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index d36dd085b5..9ab5d514d7 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -529,6 +529,7 @@ kconfig_external_symbols = [
>>  ]
>>  ignored = ['TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_DIRS']
>>  
>> +fs = import('fs')
>>  foreach target : target_dirs
>>    config_target = keyval.load(meson.current_build_dir() / target / 'config-target.mak')
>>  
>> @@ -569,8 +570,13 @@ foreach target : target_dirs
>>      endforeach
>>  
>>      config_devices_mak = target + '-config-devices.mak'
>> +    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
>> +    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
>> +    if fs.is_file(target_kconfig)
>> +      minikconf_input += [target_kconfig]
>> +    endif
>>      config_devices_mak = configure_file(
>> -      input: ['default-configs' / target + '.mak', 'Kconfig'],
>> +      input: minikconf_input,
>>        output: config_devices_mak,
>>        depfile: config_devices_mak + '.d',
>>        capture: true,
>>
> 
> I can't say I understand it, but the general idea seems right to me.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
