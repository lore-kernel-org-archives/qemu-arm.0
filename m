Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1679307njb;
        Sat, 10 May 2025 05:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUFHX6+jSBFcTFtc2n8dljU8tZA9EPSsbYMn+wpoQ15z7AKP7oaNFsPZqLab0CAFPTp2/HhSRUOnEo8WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHiVKHRIW5+galTyPWDl+eHrjcRiscCCL/d+L0xHQFn8xv+s2pR6vZyjFKdh9XH2U9tGHYe
X-Received: by 2002:a17:90b:1e53:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-30c3d64d90amr10137560a91.30.1746879187817;
        Sat, 10 May 2025 05:13:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746879187; cv=pass;
        d=google.com; s=arc-20240605;
        b=HuY3h+jf7cSEAp3wlvXNEYyq22oGQ+Y9CHyWQjqScSe2q1w2ErCRL3Yoioxirleg/e
         ovZHX2+xh3EYugM0XNRP6fP6eTzAyCs2UOPcFa63fUM9o52lUpMwPdXLjq45CH7wIiPe
         y9olZE7vYQfBaZRzgl2CabmkC+GhRuFXKTKx7JUpwlVukZm4CS5CDwyaYApAp9OX+rCO
         MmSLmWtDSXtYet+PsPUZYdsYpIbrAV6kuyTbH4S88l95b9TujV6r8FsBfi1GVVed2zvk
         C6E71acdWkXf+cZtDjqeBXwcNEiQT1MmmtCeM90fN0hoYPxVPHhMbY7AS1S3kjNWs3v8
         +1Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=da87Gvfr92nTmRe9YFikUiBtrxbK9MwMgr9kg1RROaY=;
        fh=zQ93gWpICIvEzEVrvbNQw5VseMqBXVA0tR6W6zOEW2E=;
        b=NTKjrOVJTMwQxqmoxF7ZIKSYz8gA/45/7uuRqm5uuFhgLJwjrKnK7PeKdYzxwiow0/
         yEEOssBONx9xru1KOB9EMvxeWP9C+3LI9SNwNM9xuVILyoVvqjBRsh5qSmGDPmIALG/Z
         XGMaFom4u9S86qnWo1FYViy6XTwKKMAzk40GL4QhDwFMZe4MN/V37JMcF8ApW/LznD9r
         SHMSGJtG7yZtKY/u9+LUeyN2bv41nNOEBfxu/TFR7ZMVjOBjI+FCCvh8eBbwUhyWx+h/
         edF8L9jp/9KA5Z3JJ+xx7CRzpH+CTwruMbNvWb129fPcF/JTcdoh023TRvqac7EHOTHB
         Ermw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=NxwCYmm7;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.12 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
Return-Path: <dmitry.osipenko@collabora.com>
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com. [136.143.188.12])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-30ad4841387si9086960a91.19.2025.05.10.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 05:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.12 as permitted sender) client-ip=136.143.188.12;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=NxwCYmm7;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.12 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1746879175; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CQqi0aQRkMyWKiBG9y86zueiHzyBoWZqTdb3ij3pG8We7Oz63UKphmty9iyppXAjOaR3Dr3u3sLcQ9A7dSj4oVSpcKNGwo2kE+1ZKku/6GUbPCV14trBRb3vBleTaRXQi+69VhHEUVhbopdgji6X5W8Ykq1qFlre+5Y5GLtMv8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746879175; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=da87Gvfr92nTmRe9YFikUiBtrxbK9MwMgr9kg1RROaY=; 
	b=F2C1bYxeUEC1urcRyP1UPJz62kUBFOEP7IdQODVsJo7yLSDsoSALc6uKvH/uFVG0I4fJsL2OjMeDN4E4TeDh5H6CWIgKV/35Kh1kAZ8M9G/awMKXuj/5LdVHYStEdYRozFK3+zuGP5FUiUTKy6Ph0SeJZ8XEmCSZudLtBnVQ2g0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746879175;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=da87Gvfr92nTmRe9YFikUiBtrxbK9MwMgr9kg1RROaY=;
	b=NxwCYmm7eiB2fDVfMi7Ugvzij/zXWswkfpvC5dsuDY+f/6q4FMz302nNwLMRWE45
	HjIMfCzv2LI8oaqYJ2NHkJgcnhbGr01dwHAmPRyZevoYq2DylhXXyBIG84lrM/GGwFb
	86fSLBIPcOEpeV8WfR9FkPIlxRdqa96yTlsxVx+Y=
Received: by mx.zohomail.com with SMTPS id 1746879172685901.4554516787928;
	Sat, 10 May 2025 05:12:52 -0700 (PDT)
Message-ID: <d370ffec-f430-4377-80bc-323d5087834c@collabora.com>
Date: Sat, 10 May 2025 15:12:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] ui/gtk-gl-area: Remove extra draw call in
 refresh
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-13-alex.bennee@linaro.org>
 <d5a8cec1-f689-4d31-b6bb-b63eaa4ce2af@daynix.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <d5a8cec1-f689-4d31-b6bb-b63eaa4ce2af@daynix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-TUID: anYjWlcqVJz2

On 5/10/25 07:52, Akihiko Odaki wrote:
> On 2025/05/06 21:57, Alex Bennée wrote:
>> From: Dongwon Kim <dongwon.kim@intel.com>
>>
>> This partially reverts commit 77bf310084dad38b3a2badf01766c659056f1cf2
>> which causes some guest display corruption when gtk-gl-area
>> is used for GTK rendering (e.g. Wayland Compositor) possibly due to
>> simulataneous accesses on the guest frame buffer by host compositor
>> and the guest.
> 
> Simply reverting the part of the commit may re-introduce the problem the
> commit tried to solve, which will be a regression as the commit is
> already included in releases.
> 
> I guess the problem is that the gl_block callback of GraphicHwOps is not
> properly implemented and it is what should be fixed.

The reverted commit made QEMU GTK GUI unusable under Wayland. It was
fixing problem which requires very specific QEMU setup, while breaking
generic setups. The offending change should be reverted as it introduced
a bigger problem. A proper solution should be found, meanwhile QEMU GTK
under Wayland should be restored, IMO.

For the reference see [1]. First bug reports about a mirrored display
problem were made to me on IRC a year ago and the root of the problem
was identified only couple months ago.

[1]
https://lore.kernel.org/qemu-devel/5aedf1ad-d9b0-4edb-a050-f3d9bee9bccb@collabora.com/

As of today, the GTK problem isn't understood.

-- 
Best regards,
Dmitry
