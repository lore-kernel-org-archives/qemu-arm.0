Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp7729ejr;
        Tue, 10 Oct 2023 02:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqZqQ6vk6MV2TARamtBwUUSDeRzWALa+pDzFvXQqqqNh2GY9ftPnLRcxK7M1vzQuAZnHjd
X-Received: by 2002:a05:622a:1a93:b0:417:d6c7:ea69 with SMTP id s19-20020a05622a1a9300b00417d6c7ea69mr19468009qtc.7.1696931402500;
        Tue, 10 Oct 2023 02:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931402; cv=none;
        d=google.com; s=arc-20160816;
        b=ew70eA2abzbFgY0jP/IMiJpl52bR10uR/MsxAOeKSKXOV4Jy0y/EcIwClyaw0DrsxS
         pkZu8ips81RGR1iGGyWV66cyYwUEVp3tf++eiEw+7gb/equA+MCtEwUx2EdENc7sxjZb
         uPl18qTlHfQd7jwmpANYYyWrnd7mOHSAB1Xwl1GhuNPgucNqv0lwa8UOv+pPrLb9H97C
         v2Z+Y0mSv6CzGvR7045j+ertMPJ3TKd6ykVSREtpnYDsMddwIaRtbGDM1ctrRzvNGqeN
         3B9YFfJDFMOp+5MUyw0jMfn4s+CD0IzIPt3v2PmpwxO2hE/f4EDsHh89wzU3MEJfPw29
         Bmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FzlqfLMI90FvqxE3Zbk7F049uM7oauvw63r14pDiCKI=;
        fh=fcDgJ5Koift+u8+3sL07faEgzeDVJyU8/A+o69N3Sg0=;
        b=HLEm+QDEXswYqjJsmYG1jlckZVoVlNrl/ShmVFJsq+iHA+mza0i2gJZhKbB7O5yGdP
         kOD1w2X3Yr65yEm0rTdPFeUoTsMxHBP5scweRYF6uj3BXu7npRiTXo/uwycelxgl4C5A
         mWDPH2EAUXE9zfoBuTlwYcY9aSbHLtaHKyANkG0OR332JoKU9qwmGqeXKXwjWQ6Rm2aW
         VrMZtpz5sNMQlEk3BjV29oeo9h4GbXTQWFSXFVpfH8phzKLChWtd9BEpF1IeWlN3H4pn
         iMordCCcghXrMzwXZw+LUDIPI+uZcKwYYuGmhD8z2btD3RSukCjHplLmXIyXlxO4gsUO
         tRdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=csenZBwE;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e22-20020ac84e56000000b00417d1c0ba59si7588129qtw.341.2023.10.10.02.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=csenZBwE;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696931402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzlqfLMI90FvqxE3Zbk7F049uM7oauvw63r14pDiCKI=;
	b=csenZBwErrjveyKp70eSWhMTvT9QTB8+xHqOD73+SJyJ0t5Y/84B+8RbAqIZ84IQWgY2wg
	VCNDAVjSPmVv68t4DuGXBjSDFZqiAn0RxCY5vhfzGUmWLPqdPBHkMcmd8Ios7IrrKBwrgt
	VMI2gqfZmMIXtA0z6S5wtduKDn8VeA8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-RIrc9J6NPKa0YiFWHtz99g-1; Tue, 10 Oct 2023 05:50:00 -0400
X-MC-Unique: RIrc9J6NPKa0YiFWHtz99g-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41810af14a4so63899941cf.0
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 02:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931400; x=1697536200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzlqfLMI90FvqxE3Zbk7F049uM7oauvw63r14pDiCKI=;
        b=qk5Gcr1xNMeX2a++ksD3D0Mu31kAb7oA5BWQXpRaXHFVKgg6CzfrbwKizrsn0+VuPz
         zTqLXO/ZEi7qx/hfK9gG4L1L2WBMLiXgACyV4uyr+9W759v4RH0utVa4ojFK0aNFowTd
         Jf/QCCQ7l3LYfoUOEPKCDvQZnuo3bPwmYJBICCVAumFRbFcSDaUFu5zsAp3a1F7lnoFQ
         MuTCE91kFfKDWx5I0GqfWTLYlPx7A3WfZaOYDVOBzCzDlOAVW5TQmvx4MZVU+F3SLydY
         yHsswFYG7eqgMdcXwnmFAUMSMPq4bC+vwQiOYR2fkSemDIOFPwZYwuxDy3BnnU0tgCoK
         /uQA==
X-Gm-Message-State: AOJu0YytpkrH3yNKpYhEjLfw24kvHb8sQvdJOiMymhQtzmPIVq3LDlH3
	ftsx+jH9BzQ3IfrYrCHqjLaZbPXLr0fQp3xjrtE51xO7ELnRFD1e/ZPFxC11FbQQtJh1M4YAYD1
	Sh/9MMiFnRqKNYE7Q
X-Received: by 2002:a05:622a:15d3:b0:419:50c7:f6e9 with SMTP id d19-20020a05622a15d300b0041950c7f6e9mr21036174qty.25.1696931400221;
        Tue, 10 Oct 2023 02:50:00 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:419:50c7:f6e9 with SMTP id d19-20020a05622a15d300b0041950c7f6e9mr21036154qty.25.1696931399902;
        Tue, 10 Oct 2023 02:49:59 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de. [109.43.176.176])
        by smtp.gmail.com with ESMTPSA id e1-20020ac81301000000b0040331a24f16sm4348896qtj.3.2023.10.10.02.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:49:59 -0700 (PDT)
Message-ID: <d69ced42-5fba-8dcc-5137-2fa95b97482e@redhat.com>
Date: Tue, 10 Oct 2023 11:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] tests/qtest: Use qtest_get_arch_bits()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20231010074952.79165-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UAh3VDk7jgJn

On 10/10/2023 09.49, Philippe Mathieu-Daudé wrote:

Some short patch description, please! Why is this necessary/useful?
(I think I know, but other might not, and it is also important for the history)

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 49 ++++++++++++++++------------------
>   tests/qtest/bios-tables-test.c | 16 +++++------
>   2 files changed, 30 insertions(+), 35 deletions(-)

  Thomas
