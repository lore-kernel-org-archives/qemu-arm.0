Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4209702lfa;
        Tue, 8 Jun 2021 01:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylATldVdzsO+YQPGr7XEiL1uYFkqZ/6Ab5FlIKRQGgYWVePt/15/XtqUYfDb57Abol9xeK
X-Received: by 2002:a05:6402:520c:: with SMTP id s12mr24332151edd.304.1623140632083;
        Tue, 08 Jun 2021 01:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623140632; cv=none;
        d=google.com; s=arc-20160816;
        b=P+acFKx2KYg3+XOW+uumsbot1L15EE1GoIoJjwwBC/exFP/uacXdIniAAqrNCoNu1z
         nVsdVj9+8pvSBfDJyYyt3eZHOzXs3gC3WIe/ds5AWjhER/OAJ0/2e9+jmmzR1ktX/oFC
         hmAsvUwwoEBJ6Zhr2ISgpUrSGML07QUN8NUKyLqztfhStgEiWriE+2ME/ot0Atkc+0Ly
         xlyNFDYmk47o/97G9KbTJEggcy4cZOkrXrm3ADE7U6H4tUy5m4GabrezJlcEkh/YPcAv
         HUeMgrj2pYjmpFoodXsjjjXQd2RFv41Wz4o86L5Ua2oj2y9uiYJoLyNY6vR74Y2kVHRp
         alGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=mWaoMaH5sAthTY7wE/FmtMQ4xtoKpzrj9/htyrCTsmo=;
        b=IM6p1Adv+4lDlOJmT+kvXX6lBWOXUIgl1nRg896sR8WN8MaC8pHZ5TgGdQSAEwpaQK
         GylpmssBXBAl4UHrKUbo4FjDy+dfBmrbH7bzD+PkhnNRUNw8d7QoAV2lvlkm2KdPon+q
         pbj53RbUxxWj177Fwyievyp+9TjnXM0W8C3pojRwIYmfzGpwM9wJyBm18tkR67GEs1TU
         F4rGBY/faz92kx+oAvAutuEZAKSR0RwtQzQiU2Ygx5VfCMQKth9pKffFt7M9IA7Dj06y
         KxsLRHia5dj6nwwvG/ZvAvqTSI4HoK6yX15R9bGA5Sj84RnuezYCJvPYfsy9HcOBXOtv
         CeYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=adCAPGuD;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id z13si14232189edq.281.2021.06.08.01.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=adCAPGuD;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623140630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mWaoMaH5sAthTY7wE/FmtMQ4xtoKpzrj9/htyrCTsmo=;
	b=adCAPGuDjIHY1JupsCH6vktzd0GIMN9S6Ns+KS5KJaoXgHJ718PTC41mJqeFE7JCMLXIaI
	JIkmmnS82xBTGQIHyDA6fSvVZ5HWE8cYcj+c+xbYzxve795MDjmWVcSurZNYSLdAPkn1Uh
	7HSZ84vOJmE2Jx2fQ9HshqXbpnGSP8Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-aVhxhAL7O2q3HkmgHZ225g-1; Tue, 08 Jun 2021 04:23:49 -0400
X-MC-Unique: aVhxhAL7O2q3HkmgHZ225g-1
Received: by mail-wm1-f71.google.com with SMTP id n21-20020a7bcbd50000b02901a2ee0826aeso881665wmi.7
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 01:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mWaoMaH5sAthTY7wE/FmtMQ4xtoKpzrj9/htyrCTsmo=;
        b=Yl4XdxJv6wGKAfTi9SHMJUBs0pTPudbnqS+e2FCrU6MC2FXttuMnY2L951h1h74kKn
         kYT7X2iE5YwMZhqnfbKxPGY0Ccd0rLAKPZXWLaLJkTDu8dxd92C9O+/Wn8fhKwmJvGIJ
         EnVqQsyolJbJIFxrqcVbaWy3dhh+CEsPuDlu8ExiKkKuraL8wLsrxP6C6IBwSKLttloK
         uGSSdNdVurLPL2KbOdS0w95A6k0u08lzY3Zq0o0sdEiNaYb1Yl7iuaz5nVoFHVgnxQ9d
         cd8BHzi2hCykFpE2MvO8GjIWete1rRlDANgXxDWvHvocLfW3o2KvbT9K9MbO75tTbYvb
         l5Zg==
X-Gm-Message-State: AOAM533Eg4o8TGOCVxo1y+PDBNQrFt2b/sXPtbx2M298awMU/CPgha4r
	bw5ZdIEcxlZusCNhIxrERs0pr5ODabjFEg3CLQ29ISaJySRiF7BtQgVmRCNxqaUeGW1u5g8WiQx
	hvNyN9BcEIlMbxZpC
X-Received: by 2002:a05:6000:511:: with SMTP id a17mr21278007wrf.351.1623140628293;
        Tue, 08 Jun 2021 01:23:48 -0700 (PDT)
X-Received: by 2002:a05:6000:511:: with SMTP id a17mr21277991wrf.351.1623140628158;
        Tue, 08 Jun 2021 01:23:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id a4sm17317021wme.45.2021.06.08.01.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:23:47 -0700 (PDT)
Subject: Re: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-7-alex.bennee@linaro.org>
 <3e4942e4-be35-ab51-e290-3faa6c67d4a2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d9c4b3fc-f4f0-f612-8e47-016f69d54e08@redhat.com>
Date: Tue, 8 Jun 2021 10:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3e4942e4-be35-ab51-e290-3faa6c67d4a2@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: y4lTuGqVOk1O

On 6/7/21 3:28 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
>> tests are now only being run if KVM is available. Drop the TCG
>> fallback.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
>> ---
>>   tests/qtest/arm-cpu-features.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c
>> b/tests/qtest/arm-cpu-features.c
>> index 66300c3bc2..b1d406542f 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -21,7 +21,7 @@
>>   #define SVE_MAX_VQ 16
>>     #define MACHINE     "-machine virt,gic-version=max -accel tcg "
>> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel
>> tcg "
>> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
> 
> Same comment as with patch 04/99: I think this is wrong. You're mixing
> up whether an accelerator has been built into the binary with the fact
> whether an accelerator is available and usable. There are plenty of
> cases where e.g. kvm is built into the binary but not usable during
> runtime, e.g. because:
> 1) The kernel does not support it
> 2) The current host CPU does not support it
> 3) There are problems with the permission to /dev/kvm
> etc.

Yes.

> I think we either need the fallback mechanism to tcg

No, this is precisely what we want to test.

> or you need to
> properly check whether KVM is usable, too.

Yes.
