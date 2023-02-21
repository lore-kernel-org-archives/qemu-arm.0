Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3135603ejb;
        Tue, 21 Feb 2023 02:52:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9VcSGv+21Y0VYGVtMpCxhnjvV4U05+g9nZZPhNLo7KNKcIDiHIskb6lcs1lRTVZM+b683s
X-Received: by 2002:a05:622a:452:b0:3b9:f4a0:e600 with SMTP id o18-20020a05622a045200b003b9f4a0e600mr8028881qtx.60.1676976734202;
        Tue, 21 Feb 2023 02:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676976734; cv=none;
        d=google.com; s=arc-20160816;
        b=FV08eSKwvoN8doWKp12QfzQ8G1YWpSlhKe6lPcnUDtzC+FjuQ9NVqFe3N9lIr0+EhM
         tc5hUJNqVx5XM9Po/0z2R0nZ1sUuHNa3e6ievegD5rxpdsV1+wULDi5xS6eNyleojvjt
         hZ0ZvKuiig8YkO5YAQu03p1qwCZdKyza60bdyk9mM2IKjxFhQz85HOyEoYX8gmjMaogy
         CNbd0XBe2R4++M5AmnXu6tSiBsC97dUpP+KtM/4R2OfJLhbwIxWeRn7fCGUU9ncXJTh7
         kEKmJI5lec/1ITlznQbwh8S6TGIBTtae2cCpsQNLIhN5JHUZnRaLwjugn+Xm3W8QpCvQ
         yg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jWL5GfTkzBTtpgCXMu9nhqTyiCpZp2cXDMITN11zRrc=;
        b=Rw1Qo2qzlT4NCuIjpJ7KbeSDxdaBdlL9JOntx+z0POmiJTANQUbHgz+lYIEM4lWdI5
         9eUCJN82S6AuZTrd2meGam1+nG0eZ4QVoNgoJTLjTNfskZPnTw6kUT/yTxTMKvDK4YXm
         e3zK4eMOTszzJyzR32KWJ02h/ZHJDp5xyaFu3na2ON8gYZi7bBzL1B/VoKlfmdzyJ6MP
         gRpwWM1MnfoHGaHKrD+e9XbrYqsSdach5f2lqi4eIQuoDxaOfP0VCHVTihAFg/U2hHh5
         eTdtzKtqn/k1lILenMp7xZ/NLb2M2yqOYUev3k7ni8hZhmBrS3lkZ89fLh3meE2iR8WP
         X9Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RZppALjh;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bj14-20020a05620a190e00b0072a0bb7514csi12719757qkb.546.2023.02.21.02.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RZppALjh;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676976733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWL5GfTkzBTtpgCXMu9nhqTyiCpZp2cXDMITN11zRrc=;
	b=RZppALjhQa3cHraltZe3MQMiauYFRf86J8xE8u/Y6QLVcR53RMGc6v9bErFwTMH/4eczMz
	TrNcdGd+eLp+v+RWLYUl4LGFKj21zuoqHcKoF5y5HmkdEnios77cLqvtn3+Kg/pRFtpLyq
	PJUh6/5WOjm2D37J1nWkB114e3TIVnE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-dDl8UCjbNM6y6QmmVLNWQA-1; Tue, 21 Feb 2023 05:52:09 -0500
X-MC-Unique: dDl8UCjbNM6y6QmmVLNWQA-1
Received: by mail-wm1-f69.google.com with SMTP id e22-20020a05600c219600b003e000facbb1so1799822wme.9
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWL5GfTkzBTtpgCXMu9nhqTyiCpZp2cXDMITN11zRrc=;
        b=jy8wWl1bvlQAMTKwhoANC1iwbASUxFCVgUpqihuuhfjdyRHI40gVxdJnxUxrW8KkLu
         H/EB0NFj6hPRR9hsoj7cWzFuzPUwR8lTkyAa+WFxp1tU0XLXXY7rvKJnSNhS67YUvpEF
         LZBeuYHqJ431miZ7IbFJ/yk6DGPEdIkqEoeHtkES4VmRACccoHW4Sw7LJm3qCU9XyE30
         ZeTc9JBZlL10F/Vg9fGrFBJApx6fatq0XtfdDdthkXezFA9v1DCflXAJQI73Akmqjap9
         VI5jk0bLkedAj7bv8XyHqNAu92fJh2DG94w53egtXaGEOLWhEA77HiQV+iBK68dWhRLG
         nhcA==
X-Gm-Message-State: AO0yUKWtcdWpedIWMKzmniqqCrd6VwGSRCkWti65qRHYcQGWXEMXbiBY
	MkBuwcLviDzRIUP9kbZOruvSRBZYWpzx88E3uQ9kIMoxb5cjPR3p9O502kGoz8w/mCiMBzUIJqA
	xjIAEEQu5t1w6rE8+/CSynRNaJK06DvIIngrC7VBFQlfGlev46i8yJ95MkXioW0nqHRmJnUCq
X-Received: by 2002:a05:600c:4a98:b0:3e2:59d:432c with SMTP id b24-20020a05600c4a9800b003e2059d432cmr2714520wmp.17.1676976728384;
        Tue, 21 Feb 2023 02:52:08 -0800 (PST)
X-Received: by 2002:a05:600c:4a98:b0:3e2:59d:432c with SMTP id b24-20020a05600c4a9800b003e2059d432cmr2714479wmp.17.1676976728061;
        Tue, 21 Feb 2023 02:52:08 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c274100b003dfe549da4fsm4771613wmw.18.2023.02.21.02.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:52:06 -0800 (PST)
Message-ID: <d47fa98e-ea72-d922-03b9-0cfbc045ca4e@redhat.com>
Date: Tue, 21 Feb 2023 11:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/14] gitlab: extend custom runners with
 base_job_template
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZA9t3MLtEqzJ

On 21/02/2023 10.45, Alex Bennée wrote:
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

 From v1:
Reviewed-by: Thomas Huth <thuth@redhat.com>
