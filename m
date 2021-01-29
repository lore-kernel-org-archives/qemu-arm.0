Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1377785lfo;
        Fri, 29 Jan 2021 10:53:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9MQQI7Tz3qOijgMww+n9m0CKFHqtEA6nhKfyMehicuXR6MG+2F8sf2nFEXkXwX6hV/sqE
X-Received: by 2002:aa7:c34f:: with SMTP id j15mr6749596edr.120.1611946386826;
        Fri, 29 Jan 2021 10:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611946386; cv=none;
        d=google.com; s=arc-20160816;
        b=Qk+2IUlWPgRiI851jLqwD7AZQRDv7Ef1X3tfLRp+ZsEaNqQuGXmumOnzeSmeDdtXK/
         VWBdB+52UbBH44WABonvOvRYVN6JmJ9A79v5BPypkPAcZFy4fSbRwws6mG98JBEXtkCT
         KlwfHDazLEwoMqp5i6QVbZbY65f8BKjkOVWNqnYPoGb/dl178C8iroYe7SyAK5D5ZhTG
         wBTp+jZSHQ+0XgNBYFVqOkmFvN4McVh9/6BZCd/XTLxf14G8vC/+K6fpPtRWdwnvwY69
         Tno5HYDL0No7fl6D7h8if7eImjn7D4F/CGmrtxe14SN4j1RO0aRUEaHF6wYmkPw6sZ17
         GTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=v2lQG7NOq1Y30ihZ3JvjW7LHsEzNf1l5ZIU262Ux5yw=;
        b=SsL4G5QDfVnMFdevxlv/X5zporFVxe9NbqpvB/J8JsKoTqrQVx5zos1JKavWc8NYeZ
         r4Hk87oRYCvcsri0Mi/QkjZEHYyOZz5OclRCI+heTHUa6DHN+abf1HL0Vohg4gYsbkIG
         YZhyExILj7km8xFIxzBjc8gUlhRCaCA1QbiLnAee080IskRjdIABOxTGS5DCViUkL9xD
         4YkNJmSZoD1AS7yBwYGqeFcQvHngB6tnmwdyOs+o4newra7Wgna+E0PgcbMOFveuPfkm
         TY0hWQE74HK5BK0vkZMvrjWZoBO0/mncsgoSyFl6ZKfDxhbrhkWcNC8GgUVd0ZFxM3i0
         2Mag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YaRPkgkR;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x35si6415947ede.325.2021.01.29.10.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2021 10:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YaRPkgkR;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611946385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2lQG7NOq1Y30ihZ3JvjW7LHsEzNf1l5ZIU262Ux5yw=;
	b=YaRPkgkRkeKndpBReXwDBBoacYb8LhVDTTYDANL0nn1Eo9Yzw9TrnzUI5EsupA0iu4iuQI
	wn2gsHAPU+VyuRIj47eROXXIwxAX4xAZxhQxgRBLaw27vzKKfQwNvcG3FqF5FgQWA6FJYI
	FGF9sCFPy3z21FJmXDSEjFMxDG0rVlI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-DVJ92HVCMIeZHB8J0DcHrQ-1; Fri, 29 Jan 2021 13:53:04 -0500
X-MC-Unique: DVJ92HVCMIeZHB8J0DcHrQ-1
Received: by mail-wr1-f70.google.com with SMTP id p16so5367181wrx.10
        for <alex.bennee@linaro.org>; Fri, 29 Jan 2021 10:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v2lQG7NOq1Y30ihZ3JvjW7LHsEzNf1l5ZIU262Ux5yw=;
        b=OtaNN+5baOYA8v5lyNOC9Lp/qkRH18PPrQWhN62MEEMo+Svgpu8itPAPN2cWzHDy0M
         88xIZMeU/BXk4oCHGYc6igxHFtGiH2geqz4z0Vi76k5NcNZoewSmSx143ZDNzCIStlB2
         mPopcKa24wfOAE0tKSnUp4a1Bd9rCJxy9X+ueP57Hr0TqpVpUQvatVIfLsRXM6jpTWqs
         4CngcK2boF4HhYsWQNlSJ8zYqWk6hd+PMlDtwumL7o29XRrSyqP5GU0RHAEMrYlLr9hQ
         qJjt0FrE8FtPo9PCe3gB6vifeBvshBAC2SkrnrRAwQeCHqR+xOmO9+72gvq0G1F4SysY
         szjg==
X-Gm-Message-State: AOAM533opMlajpASecGMLGaBv/rfwm08hye0CGze99zvboQzACS8PBNJ
	M/WH82PhO5MPaLjs4atOO5oYQk6v0WFr0rXidSOz0d250WVtlNMXHI08ncNn3C2m/c4UCzcBenh
	lLvvYmeI3ewmkO6Kx
X-Received: by 2002:a1c:9609:: with SMTP id y9mr5027751wmd.75.1611946382859;
        Fri, 29 Jan 2021 10:53:02 -0800 (PST)
X-Received: by 2002:a1c:9609:: with SMTP id y9mr5027741wmd.75.1611946382729;
        Fri, 29 Jan 2021 10:53:02 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id 9sm3199432wra.80.2021.01.29.10.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 10:53:01 -0800 (PST)
Subject: Re: [PATCH v4 09/12] target/arm: Make m_helper.c optional via
 CONFIG_ARM_V7M
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-10-philmd@redhat.com>
 <d9af8896-efec-c850-655e-1d1eb2629762@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d57cc48a-2eb4-011d-7903-91042de507d3@redhat.com>
Date: Fri, 29 Jan 2021 19:53:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d9af8896-efec-c850-655e-1d1eb2629762@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: MbW926wMtWzk

On 10/3/20 11:48 AM, Richard Henderson wrote:
> On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
>> +arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
>> +
>>  arm_ss.add(zlib)
>>  
>>  arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
>> +arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
> 
> I'm a bit surprised about adding the file twice.
> Since ARM_V7M depends on TCG, isn't the second line redundant?

This does:

if TCG
    if CONFIG_ARM_V7M
        files('m_helper.c')
    else #!V7M
        files('m_helper-stub.c'))
    endif
else #!TCG
    files('m_helper-stub.c'))
endif

So:

if !TCG or !V7M
    files('m_helper-stub.c'))
else
    files('m_helper.c')
endif

There might be a better way to express that in Meson...
I only understood how to do AND with arrays, but not OR.

Paolo/Marc-André, is it possible?

Thanks,

Phil.
