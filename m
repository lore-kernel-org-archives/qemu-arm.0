Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5986905njd;
        Mon, 28 Apr 2025 07:00:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN9RRHwV10RQbh+sQrAf7eyyNBJBmcinZ6wKIuUvjmkdnMEGjkvyQxRXGhevgVXRXVdrZ8
X-Received: by 2002:a05:6214:e6b:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6f4cb9d37bbmr175956396d6.12.1745848837792;
        Mon, 28 Apr 2025 07:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745848837; cv=none;
        d=google.com; s=arc-20240605;
        b=F/LOzgn+dYLQYXTA9QBkLWG06092RC19lsHaURAKvPWFeb51o8eDVca05WxjDMfIHG
         OhiqDfWkH7wZNSCjn60FXGHWQsiSP1EViZ5/uWcXWfdqBjfZVqMqSZywQ76u6EeQRyxk
         RxzmIAIk2HEzfKpOi+CpqK+KkuAEKjaH7UR9DhPa0dCRlnu9IHgHw58WKIKTElte630h
         vtiGFUoWUbI1X84TXF1Bsr8uG+ZStVWaXRyRskW/vFkfwuW9hAwm1uZULQl3wlArl40k
         e4vRmJJVIzoQBwGWVtjW9jz2oVDcOEu/iI8vctPlOqn3ZrmwshHQfsmKwgv2pkJ5RMqd
         8+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=o+K9fY3HxhttjtKjHOfixYuMIUFJSLFgMg1UK+eFuek=;
        fh=jf2lbwziKaTy6ue9vQ8Pipxc7vUxBSFDf+GMsIxsvzo=;
        b=EfpxPCCnKi8FtQIcHmn4SQr6LRWr8s+e7Bkh6POOqo6f3CS/w99sXC0QzHo1jVXZ1R
         3ucYkVIzlzb/Ux6tbZ7jmRoXhJpwznaEZ48l6Zh1CCWxdzBQ2kfvV7zNA2Vn5cnakGUL
         uZI8FFeIIrDjVcZChTZjvwkjDza5tUE6VXlE9x7DFdrgijvK0C0d9FU0tXpfrJowaXML
         uy3VDNMqNkgM/HM1vs8RcfzqyNAzIlC5C/yAgOF52DjMgCf5hrzE+ZRNqsVXfV5Bd3ke
         hkLJ2ZBjfwcaE69psa4ioNCi37cY7X2F7QH5iGuheHlUaupP7MJpOqkC0gOYPXPjO7tF
         BRSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CGldGy/G";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0aea494si99601106d6.299.2025.04.28.07.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CGldGy/G";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745848837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o+K9fY3HxhttjtKjHOfixYuMIUFJSLFgMg1UK+eFuek=;
	b=CGldGy/GgGPPKwtjlp4dLH9be2IoReUUOofYnLW6fKy0O2uoVr+2JssygaBPjrmQ91jlbl
	TdD8G3vcLW/GYBd7q+7tTJBZp28cRe78f8pWA3ux18O39LKo+ueN1y3AlfFTK8fKUfB3xT
	JEcoyyHU0Uq8ZbkgJoEYGa9EIbdGYtI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-khHIWhyoMFGqP-movnzhHg-1; Mon, 28 Apr 2025 10:00:35 -0400
X-MC-Unique: khHIWhyoMFGqP-movnzhHg-1
X-Mimecast-MFC-AGG-ID: khHIWhyoMFGqP-movnzhHg_1745848834
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6a0443bafso447635066b.2
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 07:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848834; x=1746453634;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+K9fY3HxhttjtKjHOfixYuMIUFJSLFgMg1UK+eFuek=;
        b=ZkC7EkaRJwxuyswhDc0/JgUVhn+3hHJpnXDy7ReeoqDsw0ZzuiBNPtTuEG3+YTG89X
         0FVAK3phWUJ3iLo8nd3+hffU86cbSsUPvfjyE4tmDB9v/0duwF8lypBSdQkOUa/7QZwA
         NUmE1NgRfsNQ4zOViTffVAAVH4now+asrOXYOQw3Bnl8HaVTbwbmaJtxM7Mc3qPV9DgM
         fiU03wJi8biQ0Up7Z0w/sx86260DrdQzruZYAFZyZs70bBHIGD6rI/6bfB5Swl1e3VBR
         lO1mdN7m7CRVw3Ww11s2OLuoGxIFj8DChKHO0lU+aPRR53zWWU8XFfGiXVLWpQwAnsDX
         FJTg==
X-Gm-Message-State: AOJu0YyIzu8U+BAdUwYj7HRGOpgXBn7NX6jeGGnamyqNptiAtPzbx93u
	TlZiN78N4ZIpSXXIuwp6cJpFVOiTDDW7XDl3N9DWpwLJLniZMBOdjAB/I3Qy6kQ+dPyZj4vSA2G
	IVBuo3otCCjQUXA44jWaTlwuRBTJ31yRdMkXZbgX7aQUSkrbP0XCPr789CY3PVBRwTRBr09ifb9
	H2GaDY0ka7UNhDD6FwH84GjYlKMoXiVIAaTZC1
X-Gm-Gg: ASbGncv+weS2wQe8MaEqiAmkhJFuc4FhVoJjSqbqcjPaZuFm/ybuFTn4gtTJT0B1Vdu
	nUZtvrvOMnQ0agrcYGtICcwltj7vzKzs73Yvbx0DJTJSIpnCgDIeCi/imUekhytsTFC+Ntjjum2
	5tTk0XjLr6qA1kM8p/vUxqUOIb9KH+Cnsys+NfxKCeU15KTVxTu75j2ZBLxX/I3dOYlN/8PJKmb
	pzYPCiK8K6NtHSM0cuXAMu7nPqqaeZiRpLrfRvnrFyiRQh20TcdUCvkrSDlx5EHM/3Q4hRBE55a
	sDUGyC1cWl0J/SLG9N1noMe0frruhJavTd94UbVEFIONOQ==
X-Received: by 2002:a17:907:3e03:b0:ace:3a27:9413 with SMTP id a640c23a62f3a-ace739dd0b1mr975333366b.11.1745848834364;
        Mon, 28 Apr 2025 07:00:34 -0700 (PDT)
X-Received: by 2002:a17:907:3e03:b0:ace:3a27:9413 with SMTP id a640c23a62f3a-ace739dd0b1mr975326366b.11.1745848833651;
        Mon, 28 Apr 2025 07:00:33 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-43-178-177.web.vodafone.de. [109.43.178.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafed3sm625975666b.180.2025.04.28.07.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:00:33 -0700 (PDT)
Message-ID: <e833c21d-cdbd-4924-a8dc-79c8269f87b2@redhat.com>
Date: Mon, 28 Apr 2025 16:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] tests/docker: expose $HOME/.cache as docker volume
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250428125918.449346-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mSHg3kh6eIa28QUJ7x6UaNYZNhEoeAzW-npb_9LMkt8_1745848834
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 09ol2iS6NRGb

On 28/04/2025 14.59, Alex Bennée wrote:
> If you want to run functional tests we should share .cache so we don't
> force containers to continually re-download images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index fa1cbb6726..56a8d9f8ff 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -224,6 +224,7 @@ docker-run: docker-qemu-src
>   			$(if $(NOUSER),,				\
>   				-e CCACHE_DIR=/var/tmp/ccache 		\
>   				-v $(DOCKER_CCACHE_DIR):/var/tmp/ccache:z \
> +				-v $(HOME)/.cache:$(HOME)/.cache 	\

Maybe better restrict it to ~/.cache/qemu ? ... to avoid sharing other 
subfolders there to the container?

  Thomas
