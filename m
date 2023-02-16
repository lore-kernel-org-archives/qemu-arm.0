Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp202812dll;
        Wed, 15 Feb 2023 23:39:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+ASWTiW4nqVJ+598JAqevX0DrPdtq1uJv2fG5Q4zkudcOC3tKBitCRhaRxr6dxxkcQXl2i
X-Received: by 2002:a05:6214:f26:b0:56e:b690:9bc5 with SMTP id iw6-20020a0562140f2600b0056eb6909bc5mr9977932qvb.19.1676533155811;
        Wed, 15 Feb 2023 23:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676533155; cv=none;
        d=google.com; s=arc-20160816;
        b=AYp1w7R1wGnLK5m3G608A147xuixh2+mWUZ/3djFbiemZFRakcK6hOOMqRkZ15NhjX
         cga3H+vBzl3gE6CJghV5ZUamPRIrioWS7HdSOsxiLygXq2KRlIgMGZN946z1C5p7pdaL
         RAEGCd9CiB0+R3zUzhUBF6rs9M5V+Wcpa5jh+Xkkqxfi5hclnYOVj7KSYNvarWSea07C
         w977VzcOtMlaOAjYyt7DTbVyB/FNaZiNm2ZN2j5zhp/2gG4VKHaClQrM7+/TuWH67nug
         H4VxklUbtiytTY80/hTFaX/K29s5yiWyD7Lr75mW/t5KG7blgw9pbsTLoFFBLXORm8TM
         G0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SmIYwqtS5racSw6UEcuF5eYcwsYcc6j4GjLr01RvMYo=;
        b=ORdhGjCQx9bFcI+p77mvG8h7Xg1tM7UlLjibNDxjpqpQvz0xf6UOJLcjKKMlUvbkp6
         PT8cIMTsib5tJeVjI7E5LqMcJMpz1FFuDTOwgQ2cPGLw06hhVBKeOO6UnW0zvSgng6dr
         sv9gpCY2yA+ZhfA+fp26xTk3uFlXlDeqwyvN6cm1ftb+3oaX8ZxDGhk9XD34DJ1pJrRM
         SwKqVn+UWXkXphRl94+/8aM5M1fWTBzT5oZkmRVEa8lCm2JSKzVWk1uVUoRdKQNHM1fn
         dVCnQAKvMvKAcZMxdxvIDoi7H9IqLHAurv0nmN0pVW+c7TcIuugcJGdhT/HcBum9UZfs
         zWzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BpJd0ar7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o4-20020a0c8c44000000b0056e9470eaa9si602377qvb.546.2023.02.15.23.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BpJd0ar7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676533155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmIYwqtS5racSw6UEcuF5eYcwsYcc6j4GjLr01RvMYo=;
	b=BpJd0ar7ym0dFOSWpQ7uG7bOLyD3VMfUSLU3NnHsxVR98VY6/cFnockwbrTkmTEckBZm81
	dewqQ9ik6Y0lu8Mbd1io4IIUyMitr+Bu9MLbAPJ8r7LRwuS6mq/Zj/B1uwaNPgeqKqaexQ
	qcqySOXgd4yN3VrQCHdAWE3e2Pl/iHg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-SQFTPvLiNVS2MLr2BhmLpg-1; Thu, 16 Feb 2023 02:39:14 -0500
X-MC-Unique: SQFTPvLiNVS2MLr2BhmLpg-1
Received: by mail-qv1-f70.google.com with SMTP id ob12-20020a0562142f8c00b004c6c72bf1d0so658698qvb.9
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2023 23:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmIYwqtS5racSw6UEcuF5eYcwsYcc6j4GjLr01RvMYo=;
        b=qIY/llLsH9tBrHbBtEUSwawnCh4VGmnP86ugfOuQqq/6I5eKJuaVYEEh3kFiXsfeph
         9Sf2/d1Mt15MiGmK9EtLDOtzRulmvn9leTlVjPYC3UrCOM588KEAtjavXpdy2h/TgXMM
         Mv6B23OhjX0K/8ZqZ7/LdiquE3Jxc/f5T/s/1u3lZGIiI6mfjAFHgYehepTJXGVa/9yF
         VypOXX5UCu8pAjejk+SWeLbKzVRPyPnMC2R3i2GFPegZ7P/9oaiLEjPF6/K0WFHXVZUl
         MYPThqUQmEL6G74u9GDsAbW8h524xosmhJ1L1KCAQ4BxuqVKJF5WHiW+0f2dbV1BAZC3
         0pgw==
X-Gm-Message-State: AO0yUKWDd1SCCw3X+eex6MFI3kr+blBGuaRbFFJ+nGiHSUsBQmwiE0oB
	hBgZ3/6ibCcpfm6zyi8XsPgqPcow1Wem+oj7JchndhnlSZKYydy03RpPBgFHraWfUUrcb0x95Sa
	p864Pk+yLVzy4kMJC276cazuCZMV+23ln3c/THD2azsTOpQmzPFOeVWFDFMxkc6qooc7KHsWH
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id m11-20020a05622a118b00b003b9a372e456mr8872449qtk.57.1676533153831;
        Wed, 15 Feb 2023 23:39:13 -0800 (PST)
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id m11-20020a05622a118b00b003b9a372e456mr8872409qtk.57.1676533153545;
        Wed, 15 Feb 2023 23:39:13 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id t68-20020ae9df47000000b0073b8459d221sm684900qkf.31.2023.02.15.23.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:39:13 -0800 (PST)
Message-ID: <bdc45bcc-c29e-6da8-9474-0444cdb14988@redhat.com>
Date: Thu, 16 Feb 2023 08:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 06/12] gitlab: extend custom runners with
 base_job_template
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tXCwXX5lQWsZ

On 15/02/2023 20.25, Alex Bennée wrote:
> The base job template is responsible for controlling how we kick off
> testing on our various branches. Rename and extend the
> custom_runner_template so we can take advantage of all that control.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml                      |  3 ++-
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 10 +++++-----
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 10 +++++-----
>   4 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
