Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1633645njc;
        Wed, 21 May 2025 22:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA7UWS+ROl3geQlx4b5DGoZw0sLg7qkS6H5yMlhywfVL9OHlTGuR6ZKG0UMWP9uSgP2PrV
X-Received: by 2002:ac8:6f10:0:b0:477:6eca:b40c with SMTP id d75a77b69052e-494ae326c18mr410508021cf.1.1747891406218;
        Wed, 21 May 2025 22:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747891406; cv=none;
        d=google.com; s=arc-20240605;
        b=B+O/dhl3B9fTRFMyV3LkCzvnIc8Sj9JByddTnBy9R2XTrDxMDWTa+3BCsNF8Z9tyPB
         DlqNnzNGAme0RClFBD76B6HiicI+N5/11y5GMd4MQR2jVh/uD4VgX8ssq+V0dket3Vnc
         Y3sXH6CIG90Hdy4iMANBkJKmkqMcb3yorfgZQ6GRUJCtF3VZJkc2c4O/Q17ZxN3tXxUb
         OHs5jkws5ZCZaKsLv2Es9W5brk+FuKZzz/g1pZJTIp7Rk312BG1aYz7nu9HS/plQvATc
         LVm5PozQ8Sf/q4BSk4nQuBGXbN2HkAoTYylSFBzRpFxpmyyyFrefqmG+BCHozQ+uNPle
         pECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=RQ5DNBLakYv1sNXF8lzSp1uOGb21M2SWltb7tOwuGAY=;
        fh=jDVvgowtjTY8rpPSuwc8uct6IcZfEELg/CKNcOlO4Fc=;
        b=Aczh/v72lx7HKZJzPNbAySuHtbv/4AwTvmhC9hqYbB3ZXG2SNvSoobd7fLbgCOZxhR
         dIvJAXMrU+E/O/jhDPPXRthEobjWDuiatOOoTL3mis25Kx7omVD1MZ75XZm9AJJnWvew
         ZcloOKwWeW17QfHOtNXIqezKIC1Lw3y8JgHfhlcmzYMUnbXvzYZ6e2fmtqk5Tm6Dq3hG
         On4Zmg5rmWprBzdoyxayblHUVN8VA4Hjs8LEdVJeNn+bt+SiAG+e6S72INVhoCF17hPA
         cRCmrpGcEQX5om38MAem1FpOMLSombntHzEclm7mrU6XtFmUvSQJrmvlqfOnILpZFhD+
         TOZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RPgtgbFg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-49a1fb9c210si63646511cf.41.2025.05.21.22.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 22:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RPgtgbFg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747891405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RQ5DNBLakYv1sNXF8lzSp1uOGb21M2SWltb7tOwuGAY=;
	b=RPgtgbFgxZJ0iuhdGh2M2ycAosHF8GL5v507ErANdIHUXGPwWizLh//NkwO2lXbPDTJpPB
	xSebIefYGcME5r2MbeLrNze3S0YkeB9N3zMur+C9RSWh/7YZvf09ecvwW+A7LqC7YsGV5Y
	0Rg3n7NEcd4Se+IiWfAyuv3QvreRE20=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-PeZaVYnmOEy4fwsb18r2Jg-1; Thu, 22 May 2025 01:23:23 -0400
X-MC-Unique: PeZaVYnmOEy4fwsb18r2Jg-1
X-Mimecast-MFC-AGG-ID: PeZaVYnmOEy4fwsb18r2Jg_1747891403
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad53f8a49fdso462551766b.1
        for <alex.bennee@linaro.org>; Wed, 21 May 2025 22:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747891403; x=1748496203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQ5DNBLakYv1sNXF8lzSp1uOGb21M2SWltb7tOwuGAY=;
        b=uioRFsufgqwVyNUx72Dnwat6ETM/aYZIwNjv55Z4Sngs8YaePLy2+mevyAPxmwuYmI
         JBlaxtGDoAmqxdIMMD3xbNo4TtsuisSFE6auPqylQtdsS44iJmtXWkA1+HF902GDlIqX
         bxGqmHPzYH8QbrsxDFt40Wa/xFhscbIZj1ExvkGSidxs5VgvzU2hCDajjHDAuaYIA6Ys
         exrvgeHtjblmjMTyNV614pWAI4nbXA6AGQhmXqzQXDAj18RXX1Wd2d3lE4KQTNe6sy4u
         pAjtHQiPQLwh6k28p23/2z/3orLp7uFZ2YfqpZ9jY/WAJsUxB8PaUd239CougbFDFiV/
         I07Q==
X-Gm-Message-State: AOJu0YzBKSz2nJYg5sPstcBWsFALOwoEOlKd14cQ9N+gKX2bl+ZOyVNl
	JpGl939A3u7WkTN87Actr6IHW5YwFSOnY78NLhIXxKVeiEBiVEweNb3g34wjpGCKPxPz6qRbfyR
	Qe9qTe2sjip8I2EWyAaw8G5JqcQRoN02Kav7XRzKbIpmXTePSYnHSR0442yFkPT/xtUjPGRN6/w
	H4iyHndyFDWgZiIqoLcqd4wlzdhgtPxDGl7A9/xFq6
X-Gm-Gg: ASbGnctNmtX/ygA7g9UFE+CMe7ddjc+LM3Lk97cS+YvWpJc09Ad8wHZ7SPuE4zCRSiR
	35sw2+6PeWIITjtLv/+yW882e/fy+AO+B6kaxAmBv0dnWIleN1FJpm7+YEsc84P98B5C1iCq3eQ
	nfj9euGSfkwm3or/up50GqNVKzW2eMXWNrlzzJ+WdG7sMc3eOj4y9vWZH+kY1bQI2cAYIHeFWKB
	c1giuOvTRdF+V0rP7zaDfvKi9oF8/BmpDAdOOYYDSFeD7QMK0g6N77YjKhkI54xeb0sLhey0rMl
	7sWKG7ICFi0aAXokryVo2x7ZJMPTxigHuqZsM3yjkm0=
X-Received: by 2002:a17:906:dc93:b0:ad5:6ca3:c795 with SMTP id a640c23a62f3a-ad56ca3cb15mr1313287366b.33.1747891402768;
        Wed, 21 May 2025 22:23:22 -0700 (PDT)
X-Received: by 2002:a17:906:dc93:b0:ad5:6ca3:c795 with SMTP id a640c23a62f3a-ad56ca3cb15mr1313284166b.33.1747891402339;
        Wed, 21 May 2025 22:23:22 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-201.web.vodafone.de. [109.42.49.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af2asm1023178466b.4.2025.05.21.22.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:23:21 -0700 (PDT)
Message-ID: <66dfd3b6-733f-40de-a771-40ddf83cec5e@redhat.com>
Date: Thu, 22 May 2025 07:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/20] tests/docker: expose $HOME/.cache/qemu as docker
 volume
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250521164250.135776-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HrPC1KOfTk2Wd1GVvP00iXebYTFE_arYnKL8mYjH6b8_1747891403
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MUXyhpWZprOI

On 21/05/2025 18.42, Alex Bennée wrote:
> If you want to run functional tests we should share .cache/qemu so we
> don't force containers to continually re-download images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Maybe add something about the ccache relocation to the commit message?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>
