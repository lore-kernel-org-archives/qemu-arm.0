Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp719197njh;
        Mon, 12 Aug 2024 03:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtCa+FmlUVQfKTOOOxriZ5oqeZlMsBzbPOaS0pagx22qW92bQ8EW7JDWPI1xMAD/hsaZnS4B1oZxuGiKXFH98AXuFCBRX1
X-Google-Smtp-Source: AGHT+IGrSTvFwzhNv4oc0Kwi0h0Eiz+OaxYHpSdNxGgc0nnPdLKlXazjyyeP4miITOyxY7+q62+b
X-Received: by 2002:a05:620a:17a5:b0:79f:12e9:1e51 with SMTP id af79cd13be357-7a4c216cd1emr1648961685a.5.1723458090739;
        Mon, 12 Aug 2024 03:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723458090; cv=none;
        d=google.com; s=arc-20160816;
        b=vBaF2dsgTqZ9Jc+ndzh0PQnIZId21GSU+e9w9BbQaK7/VoUPCSzPryxuwX3JIWhd/X
         yTBmnWVb1wJ6LTMDjdHBMcJu2zlSYF8qeg1HYfK5Hb01mHmEVXxap0Qf2C62qJD7hXbA
         BEVWmyqi5VnvZkDzZtrYA7qLMh7/exFLbLBjsF0Sii0i+mpJ6FYEQNyEPjUMTrUzrpfB
         nQLN1Idu40tW5a5f1FiKlhHfxQ/LHDTRauMz5TPygMAmw2ERNEu5fIjpAsl4Yzs2r1C+
         DO1fBQJEv9qWaskq/Z2NVLu3XrZCrpW0CR0Emb9KrWFwoRZV+OS4b506Gx9ZnE3O2KUZ
         BglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=gyJDd+GXnuxBnd4cSdoB2aJ+H6UcavMzMJL5XfuHTfc=;
        fh=4tirad6SJFwGfkrh3M8JKG6kgYKE6KnRSgpH6kkhKgQ=;
        b=KeNM5Oe0wGJMaza1sEoFWbU5VibLUQWRRxfVmYnjCwPiPRT6Mis/9S8cDrb28rWCJC
         5nmjkoSrhOMIIQS4mGfpM1RQ1ZBhuIW5cFBus5lYmMXuxtVh3hWUuryiA/ehqYh6XTsL
         rH7pzmEWc3rT06M12N9jBeBI/poS3uB2mD422Gfs6xMV6ksFzBWzTV4aui0HdwGv6jvE
         Mlg5MxDLHR/zsmJ46L5xG5jwq0i4NsQBhDWz71UpsdJbWtPBbU6nFLKN2OhJRpdCtUr1
         3K8r9uWLg6r7i8jBtV5O+x1dr8vEx8wKsuBhyPheasGEVyIdkoZGt/eV7UpwD9gj0hH+
         soPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQV2lLT8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7dfabfbsi552484985a.360.2024.08.12.03.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQV2lLT8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723458090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gyJDd+GXnuxBnd4cSdoB2aJ+H6UcavMzMJL5XfuHTfc=;
	b=NQV2lLT8t8GpnWdKrog+BHI08g2S1zTTU0vy1YTUW72uo9ETAq2dgy8ikIymeFTkYo6ZUG
	m1QSKrnlXWEX+MOg1/1XGjoCJVA6WnwdS4cMxgOIGalq+FsGPChpXCXQv0IZFE8I6tgyIK
	AR5gmSilVaed9lnTNLnk3fIVRXslCas=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-_aZeP7OyMTCm7zeNR28jFg-1; Mon, 12 Aug 2024 06:21:29 -0400
X-MC-Unique: _aZeP7OyMTCm7zeNR28jFg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4281b7196bbso32807825e9.0
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 03:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723458088; x=1724062888;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyJDd+GXnuxBnd4cSdoB2aJ+H6UcavMzMJL5XfuHTfc=;
        b=HQfyh6Xk6c7+Z61Kq8WZWxBlirQMgq/umb4N9bQ5huKiOBzJnikZqumvYFxGRUUjuO
         iyczQca+TCgZsRD/uOC4HCR2xlRbkoMh2lzNeINk5239geuGLceHnGDDacMIuRzP/n+9
         x/rvpn2jsfnJP97U3gMQ/fFS7O6GUixcah3fE5YTd29cT91EhQ5qYW05+W8swlrojnqP
         +fNAzjy4+PGUXFAwSQKjFThRK8ZprHWkVty3lWfZmLtsbZ9EWIoWUqCc07Xqp5nKwfir
         THg+5xv0E/4sa3f6/7IgTw7Jg0/VMX5/tMKo1QEJLnzZiSaOzsBYyhfjOVT86jQveLw5
         QTig==
X-Forwarded-Encrypted: i=1; AJvYcCU0z83BnUDZ8tshnhzn6t3jP56HPTZNPeYRGI7ycH458E7n3fyJwny3JXApkHLdq7VYvAAliirdKqPDSNeeAcfxVzpGYb3I
X-Gm-Message-State: AOJu0Yy1Kqi4cJurEcICWHSLWQ6NB2SzxXUKVakifFWnoTmaNsPyaGwi
	T1djnnWYwVc16e4xtjWxcplnHkxKbCR8jyuEPBbt4wybJacNDKH/0LEBBBRz6XrFuPk45P4Y2QQ
	z9zZuA7ftboszS9U9kcVF9R0y/Mhph5+Zl6E/xvUAokl+Qh8oVBFsvg==
X-Received: by 2002:a5d:5225:0:b0:367:8875:dd4c with SMTP id ffacd0b85a97d-36d5fb92e41mr5613112f8f.23.1723458088046;
        Mon, 12 Aug 2024 03:21:28 -0700 (PDT)
X-Received: by 2002:a5d:5225:0:b0:367:8875:dd4c with SMTP id ffacd0b85a97d-36d5fb92e41mr5613093f8f.23.1723458087581;
        Mon, 12 Aug 2024 03:21:27 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-125.web.vodafone.de. [109.43.178.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e48c784basm7153521f8f.0.2024.08.12.03.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 03:21:27 -0700 (PDT)
Message-ID: <0658b06b-024e-484c-861d-1b1ef3ce7888@redhat.com>
Date: Mon, 12 Aug 2024 12:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] tests/avocado: apply proper skipUnless decorator
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
 <20240806173119.582857-3-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240806173119.582857-3-crosa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: X2CZHBDsJSX2

On 06/08/2024 19.31, Cleber Rosa wrote:
> Commit 9b45cc993 added many cases of skipUnless for the sake of
> organizing flaky tests.  But, Python decorators *must* follow what

s/follow/directly precede/ ?

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>

> they decorate, so the newlines added should *not* exist there.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py | 1 -
>   tests/avocado/intel_iommu.py        | 1 -
>   tests/avocado/linux_initrd.py       | 1 -
>   tests/avocado/machine_aspeed.py     | 2 --
>   tests/avocado/machine_mips_malta.py | 2 --
>   tests/avocado/machine_rx_gdbsim.py  | 2 --
>   tests/avocado/reverse_debugging.py  | 4 ----
>   tests/avocado/smmu.py               | 1 -
>   8 files changed, 14 deletions(-)
