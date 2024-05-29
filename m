Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp736031ejk;
        Wed, 29 May 2024 10:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBAOWN4xcA5v03c0rPME7IvE+UlC+jsbDkvs/h/EqwxVTD5xld9Pd9lBZ0gD1Jhl4zilAG
X-Received: by 2002:a05:620a:2904:b0:790:f9c0:b573 with SMTP id af79cd13be357-794ab07bab4mr2035495785a.17.1717003543587;
        Wed, 29 May 2024 10:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717003543; cv=none;
        d=google.com; s=arc-20160816;
        b=uTK4wTnxvB0BwPC371K0bwGqNajNdKSR+CsRCqg7E74yXNPerOONfQUfzlQcRjOXnL
         vsI57bmI1QQ3BNT0yEzozYMEew8+lrXxIpGAcRZGJlGCftBhQEac0ZIQPceFN4HeFTyb
         AKZfZ6xzxqDcQV/a3Lr0bDxuEwdHaMORgKQhhDWP4mc6WcAXGFKMoK3TfCfsu4o0vjFH
         N9lfhSntKJO31/4H6PXtIi0mIlc3OuHxYZyASw1glbGc1Y7OStGCHnCbMxKeLpxIqDm1
         Slt6jqcMpIwfli7f99SRa2+7Fv92Gv2ItGeLHicmhZJ4QVyHzPbzm00DbRzg0PQl32Uw
         uvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=VVOadCbIuLTvmklCU9CuaQvEFU730xLGTZdD6H1Oo2c=;
        fh=uJyL4l1eLCWr4zVyl3nRY7+5zu4RQyDCUesUUDOC38c=;
        b=UPbzdzooRGSWtLb9SDRvmlHRADSXUc7PGx4MyKqnEESsQSkcxHhG0fxY1UsYr7pgWf
         /xvO0eTP5mA2/NKbXJRhHcDbD0GZ7hw0FNhZbvckkgfSd2r0hZxzTBSztF/ZIsJq+zSL
         jcJM0RXRXAseKL8GSCd1Q2JSW5CDOet0gNB5hz4B/oVbrekeCcnqN7ZmrgynSeeOP6Ha
         A5RWha+wP05d9eutdMboTjKM7dO0JFl3AhZjCEmIkricQM6g0DKV4f2KXqwcSmVpHeZq
         r9J3tH3PZFABSY4PPQY6Ptk4dY5/S58c+W+OoVjzfPakHNVIuKCzjt1YGj31bH6pwR/i
         elDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=azJuoNd6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-794abd5178fsi1294077385a.658.2024.05.29.10.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 10:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=azJuoNd6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717003543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VVOadCbIuLTvmklCU9CuaQvEFU730xLGTZdD6H1Oo2c=;
	b=azJuoNd6c5vUAYFDlhNZ7My6K0RtiYOa0M4FqB60UKg+acKw1ywYcCIc9rDp11DgXzYOBk
	8OaGXjZGAQvGfj+72MyRSHnFqidTMjS8AmtSJx3dqROw1FcZ/GLOWCrMFLNRBQ4vBRmtUc
	1KlJJ1mWvfN5M8AMoaSg5Ooxavz2V4s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-RG7sqZVuOmyKnW53Y5t2EA-1; Wed, 29 May 2024 13:25:41 -0400
X-MC-Unique: RG7sqZVuOmyKnW53Y5t2EA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a633ca5cb4cso104114566b.2
        for <alex.bennee@linaro.org>; Wed, 29 May 2024 10:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717003540; x=1717608340;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVOadCbIuLTvmklCU9CuaQvEFU730xLGTZdD6H1Oo2c=;
        b=t8w/d79SIoUCxjNKragOM0slmdYekHEyFVJa8qlG12lfyUpWssc4NXLmEO1txKLnq0
         9juLIFxTO89AyYdntVpOl+0TvLw/M2u3GAismV/X7ZuY/r1OetigDKx9fv+kF/d7mJIp
         pEgNXaSN4O6nRtnmIQbIN+V4qkMzDrPTQ7h1HyOnBD2Cjev1uulwxdC48J+m4swtBGNx
         Tn4U/CwJ4woQ66ag/oBWNxQJZQMkWUtObELqoTKTqQMTg5DuvOkGiiTu8Rw1BKTPcOp2
         +k7JkpshlA3eSVreGldlIJAgdki7fPZZmJf5TnA4NchovB2BJDx9Nz11ev2vPQpq2ikZ
         HmaA==
X-Gm-Message-State: AOJu0YwN9e8Ajt70ySthgKOI73aa9FLEl2g3W7+relzzzjkmGNXHL4MY
	NODw+e7jtZvYr5H17Fn+uUbzokdEOup0CpEjehDV5+eQJxkOO0spQ5gSqy1GAjL8pXYw2DGlpgp
	b3yIQbjomZUPYVtUBNe+M0ZvFGJX8Dl4kzYJp4RiKXmyXebr2uYcytg51IeOig61AnDKUwcJrhi
	7/OQSEiFRUHCgD7fZ0uUjTRkCAtIk29Zf5Ug==
X-Received: by 2002:a17:906:5902:b0:a65:cea9:dd5c with SMTP id a640c23a62f3a-a65cea9dee2mr84024366b.40.1717003540605;
        Wed, 29 May 2024 10:25:40 -0700 (PDT)
X-Received: by 2002:a17:906:5902:b0:a65:cea9:dd5c with SMTP id a640c23a62f3a-a65cea9dee2mr84021066b.40.1717003540087;
        Wed, 29 May 2024 10:25:40 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-176-229.web.vodafone.de. [109.43.176.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda8cc5sm733897766b.222.2024.05.29.10.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 10:25:39 -0700 (PDT)
Message-ID: <99b9a660-cefb-4394-ab49-c8e0b6364753@redhat.com>
Date: Wed, 29 May 2024 19:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] docs/devel: update references to centos to
 non-versioned container
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240529160934.982373-1-alex.bennee@linaro.org>
 <20240529160934.982373-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240529160934.982373-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t4jZBVBSrm5+

On 29/05/2024 18.09, Alex Bennée wrote:
>>>From the website:
> 
> "After May 31, 2024, CentOS Stream 8 will be archived and no further
> updates will be provided."
> 
> We have updated a few bits but there are still references that need
> fixing. Rather than bump I've replaced them with references to the
> Debian image so we don't have to bump at the next update.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
