Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2986175njb;
        Tue, 22 Oct 2024 04:08:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQQvhANjIvQ4b/ca4yham33MfaC4upV/8rr0dVFDZmOI3CEv93V92gaoUCa84LU6OjLyrU
X-Received: by 2002:a05:620a:2492:b0:7af:cdd7:d6e5 with SMTP id af79cd13be357-7b157b43481mr2059796585a.5.1729595330928;
        Tue, 22 Oct 2024 04:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729595330; cv=none;
        d=google.com; s=arc-20240605;
        b=g0Y4bTEs1okgb2S7DgB1ZkY/K+HVMao3kBMzcNcrUMnFPSr055ih5m2X+fKSPv5J6S
         Jgy04c7A2mZr0haQBvu27ztn2z9M6b3AwU4CDG1CHMXxvC90NiakNJP/FyJ6bSF2teXO
         9hkIWCYNYZJQJLqOOgLyCzie3wa0m2p64+QvIf/J6/k8VBJirmb12un9+paeUb+1s/pE
         S9eRUco0jHVwMl+VYmX/6jZfkSD0LzJ7pLz5y08YjqPs6TQOmlU7Az5xrMDiJZOM+Qd0
         swzXUgdS4gEIKpGitUzV92GTyaz9fihWD6ls6YJ7IlFLicyVav2KutnVVHO+J1KOOsqZ
         XaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=5C+wUpQXfGIPLQ3UhbqP2JZa2mcjb3ugeggIlo4yB6s=;
        fh=z6H+tLebActmKXI7cElA2mfoLLXaJw4w6WDoX5Op/9Y=;
        b=Jk5m8QzSjVlnmZAiscc8cEpPY9R1fvo7QPN1oRrs9aEWarrwxbQcjspC2ojEFuQXb8
         D3ZfgRS8r4IHVYxU8rJfcFF7DpXpszECfh2QZwRoHtx+PHeyRHIZxnXe8OcqoEX0scCi
         huE8vM4at+DoMjyw7RcCBg5DHOrE8Nl5hu1/aZXfX81uyHNvUkx/qjKaaf6zA5iWqQAP
         x3rWRXqSYn3+zbllGi50AKCaS7ip2f9WjsXo4vuGMTrOLq8PmhpH1cesdRJZVvSBJ07X
         YbBoR8LeXGj1Va5eCwtAi+4kPOonVbmc93G/FJQjP6y1JQm74n1N0z64BIKgB4MNTlEJ
         0eGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MlvE+j6p;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b178b5e6a4si95434585a.670.2024.10.22.04.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 04:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MlvE+j6p;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729595330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5C+wUpQXfGIPLQ3UhbqP2JZa2mcjb3ugeggIlo4yB6s=;
	b=MlvE+j6pMFLyt7pk4TGF12U+P0zOJRl4/WpFH8Y2CQ1O2TvxArUFzSl8ANnBx0HQYABV3w
	UbJIfDozKdVrLMMs8mm7mMZAZ/Tqm8E2YEYiy8A0wmSEezbOruel4ecnw4Z8Xu3JEJfsjn
	TcNGcGhheMemgpjwuwky2kkQs8tN81U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-dNxDa_7qN76_XJqG_w_tIQ-1; Tue, 22 Oct 2024 07:08:49 -0400
X-MC-Unique: dNxDa_7qN76_XJqG_w_tIQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b1502ac352so187620385a.2
        for <alex.bennee@linaro.org>; Tue, 22 Oct 2024 04:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729595329; x=1730200129;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5C+wUpQXfGIPLQ3UhbqP2JZa2mcjb3ugeggIlo4yB6s=;
        b=o5Y8oOX7BL7oGFO2dSj9vA0lhwlDvVZWqFb6bp1PrFdHyljbTjHSowKGeMVI/ai+GA
         y64hRvJY4KW3A6N/Mfpv+6Ygx1ODg3JZU7VZdhJf+p82xwWNE4o8AH7/kzS6zCZxi4hU
         9PiPOeRHusJik2rfl8PFbqr8HYt0BpjC9k1McwA7glsoseiqmoq2mKiPa06AggI/vzL9
         fHG25wk6i+W1F7P6VKGAk1987/H4wXYuq1qIEdgElTRDdTtCxX4WFbYYWkeb0DrNeAHd
         emn9meITAgKrgOyXtOKYdrrTV+/JJqGupNcAhvyW9kYr56HHjSMVcsRPgzesy5Nhd4eo
         +msw==
X-Gm-Message-State: AOJu0YyK10zWFL4EqXLCwlFDrnfUSZkgdCWSH0mYXTmAyc2IRT3MiDHg
	kWudcAit9VlYIyO61u3ovtCRBWlO0uLDeZAIVxd+ytVi6FREAB9BEyAZfSbotN7b/zPhbaeje8z
	CKIaZytWSCi2T8tZsQuFM9abhymAWhbDe3eMhnwPldUvoQ/Tfauz5Xsxij1lzC4fe1cEPc4GTRn
	7yTILCYaDVL6jLPodzAzbqoUSYKyRsxnjga38u
X-Received: by 2002:a05:6214:4498:b0:6cb:e997:6717 with SMTP id 6a1803df08f44-6cde15db124mr224440276d6.38.1729595329034;
        Tue, 22 Oct 2024 04:08:49 -0700 (PDT)
X-Received: by 2002:a05:6214:4498:b0:6cb:e997:6717 with SMTP id 6a1803df08f44-6cde15db124mr224439766d6.38.1729595328710;
        Tue, 22 Oct 2024 04:08:48 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-40-241-30.web.vodafone.de. [109.40.241.30])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce00999d08sm27654656d6.83.2024.10.22.04.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:08:48 -0700 (PDT)
Message-ID: <71858315-3814-43c3-817f-bdd9414e7a28@redhat.com>
Date: Tue, 22 Oct 2024 13:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] gitlab: make check-[dco|patch] a little more
 verbose
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, devel@lists.libvirt.org,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Zhao Liu <zhao1.liu@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241022105614.839199-11-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eFEZCoysFc37

On 22/10/2024 12.56, Alex Bennée wrote:
> When git fails the rather terse backtrace only indicates it failed
> without some useful context. Add some to make the log a little more
> useful.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/check-dco.py   | 9 +++++----
>   .gitlab-ci.d/check-patch.py | 9 +++++----
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
