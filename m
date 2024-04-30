Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2824503ejb;
        Tue, 30 Apr 2024 03:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7LVnCVvEHpjeuGlRNpMmkftL7IMPJNxfl+y+m/dG473GXSDmxFvrseOwocamPBLEJkixXe2QGcdL7P1TRvgQYHRjyCQ7B
X-Google-Smtp-Source: AGHT+IGFh7JkdwoLRKV61QilIZ9uW4qDcFn8XABit6Nb+eggx9e2G4dF1yMQ5x0XdTAngBAsiFoW
X-Received: by 2002:ac8:58c5:0:b0:43a:f4e1:e8e8 with SMTP id u5-20020ac858c5000000b0043af4e1e8e8mr6242264qta.7.1714471384781;
        Tue, 30 Apr 2024 03:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714471384; cv=none;
        d=google.com; s=arc-20160816;
        b=k7+bYqZBBHq833G06pZ/9b1WBmLkaISJNdC4tcitTlQVFgMj158J6eQ7poZMtDyCZV
         xA54FdsJ2lfC9QOlt/Sfc2b58q6qZr4KU/U5x00cf0g7JtChXZh1xnk0fzDKlR+lwCj6
         SMfXO3AgR8h2QmkIx7NpXim7duV8oTW7Jwz/AdE0p/FgR4YP6u0rOgCLZA0+/fD4BJcx
         X7KK0sFLYi2Po6UYUeDAyFVQW4Of5I8vERuwDd1isEMU1+PRHLzdGJtxg/elc88IvK4z
         geDx9MVNaSVUATM53z4mwEzXIeWQE8vnDJ9xyEW+PYuHlDzK7T623s9ekPFokDunVUMC
         UXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=W/pEhFUtvJcKZlNckhNigwCs7C76Si97VwygHq9s+NE=;
        fh=eERpocGvAiiNqTHmAfsIqtkKlZwy+UnDwKu/ipckAd4=;
        b=hsJZkjZWuoOERpSq8/tgiAfVxTXk/YhLzd+7H/BZ8u54ZWwFEFZFCENrWDPGOvLcjU
         xnSBBdKHrImtrr4RwxD5edb/AhdzJinl4Qjht0i7RNeFb9StMTmPlnaNXO2oY01SrZgs
         cpM+vkCgobGQe/jEQ3xLAghJA0LTQRfBf68c95RKZQ8Bc86nt/Nl59VT3TEMDKzrnupF
         j/WSX+ggBnfpsNAArxDpRsWAmk4mCJdzNwso3AlN1a+0DABgfywEzijqvhxIhb4NEDzI
         dfU1pnJLkea6/CRcC3eyA2miXCZ92TtRSbOrE3fU5kKKXlIjYA65Z5bNw+mmSocbjL73
         x4mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKqHOG8x;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id fy24-20020a05622a5a1800b00439b41a56c4si22511141qtb.689.2024.04.30.03.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKqHOG8x;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714471384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W/pEhFUtvJcKZlNckhNigwCs7C76Si97VwygHq9s+NE=;
	b=YKqHOG8x87i4g6Cne4LchQCvRq4saSGUebDa7Y6yg5pWWG+BjgCeNpV1MiCAe/d+3DRzuD
	ByhhB3hBmbLYsA/N4XvZ1hu0obEOpfcgj57gf1xF9qmZtGeQ3gnQDGo3SM//9kXCa3XIwo
	8yDTNdAakTHUIO+S3wFuEPHqA+JPui0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-mmpd1iWlM16K15H-0XHVXg-1; Tue, 30 Apr 2024 06:03:01 -0400
X-MC-Unique: mmpd1iWlM16K15H-0XHVXg-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6ee17b4a78cso3375772a34.2
        for <alex.bennee@linaro.org>; Tue, 30 Apr 2024 03:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471380; x=1715076180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/pEhFUtvJcKZlNckhNigwCs7C76Si97VwygHq9s+NE=;
        b=FEgvaDvX1YokwjGBDbyBQS3L/vwi2cBse5PCypj6WwgDZgGUZW91qmIYAWB0PKMklO
         GvHAFePttPAywxtCEBpr2DAQtUkeOYbMqT9Jtod2fLa2oDJIUwODF7SNrJbykd1BYW7F
         gwyJgY0m+lE8PZR4gmiIBYWyspbpks5eJGPcQGlz8GgW+OmJckBsj4WtbYiYCEu2fmxb
         LcCldpPnQbRTD6mwwU/Q23Ue2McPgCfu00v4GnN1Ey1jdSaT/j+F1S7Lo5sUYeBDP69W
         Fnbm5t0yJxWu+WuU4FyPLKW+r1egNMrq470kf4YoMF9NuXmZJclSMHsmCyJMXHg7LuGl
         PgVw==
X-Forwarded-Encrypted: i=1; AJvYcCWTSeevhsnWm5YFSMIdq6NxkLk7Oic1VNV4giiHdLuu4gw5voQ6YYLC+IcJnIsAM3ntEo8E3smOF0nyHaxWKSbIE6wl5FDr
X-Gm-Message-State: AOJu0Yw8eBudbKDbUrH8K6nPFjFG90ZfzZhN3h/42sTUVeEgWatGHfnq
	F6K3kC31iEcxMlzl8pcujxPy6ExvCTEucWfeXG0Z3P+iMM9SXAj1mTufjZfwRN1QXchbcf/vVyN
	MMHJBpUHt3lxC2fIAq/BZFEP31O3nZbWCBfmty5e+dIvfUXQnlEhfsA==
X-Received: by 2002:a05:6808:a01:b0:3c6:f92a:274a with SMTP id n1-20020a0568080a0100b003c6f92a274amr13628248oij.51.1714471380555;
        Tue, 30 Apr 2024 03:03:00 -0700 (PDT)
X-Received: by 2002:a05:6808:a01:b0:3c6:f92a:274a with SMTP id n1-20020a0568080a0100b003c6f92a274amr13628233oij.51.1714471380188;
        Tue, 30 Apr 2024 03:03:00 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de. [109.43.179.34])
        by smtp.gmail.com with ESMTPSA id w15-20020a0cf70f000000b006a0e6ffd710sm80345qvn.97.2024.04.30.03.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:02:59 -0700 (PDT)
Message-ID: <9d132b19-0ca7-409c-995a-4fac96b78799@redhat.com>
Date: Tue, 30 Apr 2024 12:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: devel@lists.libvirt.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20240430064529.411699-1-thuth@redhat.com>
 <e0e836cf-f080-45f4-a71b-060dd2c90279@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <e0e836cf-f080-45f4-a71b-060dd2c90279@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cCdnLA5DyG3Z

On 30/04/2024 11.40, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 30/4/24 08:45, Thomas Huth wrote:
>> Old machine types often have bugs or work-arounds that affect our
>> possibilities to move forward with the QEMU code base (see for example
>> https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
>> cannot be fixed without breaking live migration with old machine types,
>> or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
>> commit ea985d235b86). So instead of going through the process of manually
>> deprecating old machine types again and again, let's rather add an entry
>> that can stay, which declares that machine types older than 6 years are
>> considered as deprecated automatically. Six years should be sufficient to
>> support the release cycles of most Linux distributions.
> 
> Thanks for taking that out of my plate :)
> 
> IIRC 6 years was because of some old RHEL version, otherwise could
> 5 years be enough? (maybe it could be good enough for this old RHEL
> version as of QEMU v10.0).

My thinking was like this:
1) We recently talked about marking all machine types up to 2.12 as 
deprecated recently. 2.12 has been released in 2018, so if we feel confident 
that those old machine types could go away now/soon, 2024 - 2018 = 6 years 
seem to be a good rule of thumb.
2) RHEL and OpenSuSE tend to provide feature updates in their enterprise 
distros for 5 (RHEL) or 6 (current OpenSuSE AFAIK) years, so keeping old 
machine types in upstream QEMU for that amount of time certainly also helps 
with downstream distros.

>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 6d595de3b6..fe69e2d44c 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone 
>> noticing.
>>   System emulator machines
>>   ------------------------
>> +Versioned machine types older than 6 years
>> +''''''''''''''''''''''''''''''''''''''''''
>> +
>> +Starting with the release of QEMU 10.0, versioned machine types older than
> 
> Why can't we start with QEMU 9.1?

If I put 9.1 now there, that would make it possible to immediately remove 
machines in 9.2, i.e. we would skip the 
must-be-marked-as-deprecated-for-two-releases rule here.

  Thomas

