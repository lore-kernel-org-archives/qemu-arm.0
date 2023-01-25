Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp200612ejc;
        Tue, 24 Jan 2023 23:53:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvglFepRDCZx01DjtS9aHWYX0qBpujAGhgWTRZHQFoAa5Ei6Be+BmuJzT1f20FIrFLhu1ah
X-Received: by 2002:a81:1353:0:b0:502:349d:a15a with SMTP id 80-20020a811353000000b00502349da15amr11892275ywt.47.1674633212121;
        Tue, 24 Jan 2023 23:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674633212; cv=none;
        d=google.com; s=arc-20160816;
        b=lyq8f05BAF4/ez+edKIGQJQoAp6dcGL29ZClh7s/sL1U8A+1fLRzVik6kGDHv/7rW+
         bNc/wYhZQ5FMrhjW7KhoA+G58wTavi5AId8W6pWUnn7Hpv//ev9KkQ66LRmMv8Bp6jGN
         UNdiwaAQqxua4aKRI0/dyISQ+jEwPI7LEAQljzfp9pE10ULMpy9KW5JeyabxPQwSxVNG
         GQfEq1VC51DVtn7MZpEZMp0u3nd08t/I1vi3B838R32HX+y5LKFe1zduvvdWnRZyT8+y
         UyCWyxto55NeJEm32q0k8QDt4Su98qTszOn0DlL1uH052oR+X0r/9CVnOy6GV6tT5zQl
         peaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kaQeXSEqA7tAJkWYVxlVs5Qabn1lJYU3QabjwKzPGsw=;
        b=XOJKUr1kci861DB8JaZ4hRKgf5hx3IsmCmLPhXwGdSRS1xAvAPMRx4aYYPKfNOZIHh
         NGh3Xib6Ptj0zRaH64yAJ/fXUp5ovPpqJMNBbusdFEgKWhT80kBIB3mPHpNUPEDj462y
         bvxfWTVKsTJp3lVjcyUj8gLDWiGNpemHBNDaHWnvF34yFrX6tFxZQjG/GEReKDZA/wxR
         Xpl2wJ8Lm+XxNwEqokVGrJrh2UW5IiS/1jMRljS2wmcu4btuC6RbVgIdYpSYLrDP4Ff4
         kHP/pnx3mbQ/NrHiR/iEDd73iz89u1ub9eC9Z82sAiWyGEIA5c4GmSdZzJP/+fDVVdCG
         ULzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayokykil;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v84-20020a816157000000b0034a01155e9esi4438146ywb.393.2023.01.24.23.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayokykil;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674633211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaQeXSEqA7tAJkWYVxlVs5Qabn1lJYU3QabjwKzPGsw=;
	b=ayokykilpn7MYZfAJSJSuFAUBfmluGKfu5mSMRrDGB8Ls8L4nSl8avSS6PHraGsSOokNIs
	GaWnDf9W8jMuJuDQQ/NoQ1P+g/WU3yi4ISEy0WgwnduU7SNAfVaCMBoMNPwvbEBAIp/ixF
	ra4GixcPoZbVcwg1O2gsrFOD3KsVYjk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-4SD5EQ7ZOr6arr1w6qmhGw-1; Wed, 25 Jan 2023 02:53:29 -0500
X-MC-Unique: 4SD5EQ7ZOr6arr1w6qmhGw-1
Received: by mail-qk1-f200.google.com with SMTP id bm30-20020a05620a199e00b007090f3c5ec0so10818969qkb.21
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2023 23:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaQeXSEqA7tAJkWYVxlVs5Qabn1lJYU3QabjwKzPGsw=;
        b=ZfoXwnQB/JrYPkYeZfBkFHEEVYO7c2UYGe7jjyPTFFdK77lzA+k8bjT2opX0eFJhrb
         MF/IbiWLByCCvd29A4C6yUTM0EjeUJukaVDeG1wgEo06+BpWz5S02ffmAHK2aCQirr9K
         +DoMxcaBAozSb/lkUugCzuwEvCko4VaD2g6VK9BEsyRAeMKdqws02KdjTRIZYEcyRs5E
         BVaVnVrz92tbzh+W8c2Fnwbn6dv7m1lsDubG/JXmoL0u/1NtqVxpapmLMtEQeu8/ollP
         /VACqK5iAM8HE+qJn/OKSDflteBgWXD5Uz6FGaJ+U39gJFUhWqL+NiyCEEWJPzknsxvu
         k9kw==
X-Gm-Message-State: AFqh2ko17Sjul6377oinW7CtYWqagb5dazFZmYEH5z+YNT/xv/egnGQV
	m6RzS+BDHagmuC144qBxMivIOBGcnVxpTjnbkV80MT+1q+8iu0OwZRheSEnvJ5J9pa8ZaUSTeui
	wAw7Krf7N1QUmZvpHPnj7RgUwEzDeWs8laPgkTbf+BkP5KfgNZ6uK2JndyIXCB7m8
X-Received: by 2002:ac8:4706:0:b0:3b3:8de0:cacd with SMTP id f6-20020ac84706000000b003b38de0cacdmr43658170qtp.32.1674633209043;
        Tue, 24 Jan 2023 23:53:29 -0800 (PST)
X-Received: by 2002:ac8:4706:0:b0:3b3:8de0:cacd with SMTP id f6-20020ac84706000000b003b38de0cacdmr43658126qtp.32.1674633208713;
        Tue, 24 Jan 2023 23:53:28 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de. [109.43.178.209])
        by smtp.gmail.com with ESMTPSA id o3-20020ac80243000000b003a6a19ee4f0sm2876856qtg.33.2023.01.24.23.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:53:28 -0800 (PST)
Message-ID: <fed02d8c-8a56-1137-d11c-5e319a62f6f5@redhat.com>
Date: Wed, 25 Jan 2023 08:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 22/35] docs: add an introduction to the system docs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230124180127.1881110-23-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pvUvfM1sp3gE

On 24/01/2023 19.01, Alex Bennée wrote:
> Drop the frankly misleading quickstart section for a more rounded
> introduction section. This new section gives an overview of the
> accelerators as well as a high level introduction to some of the key
> features of the emulator. We also expand on a general form for a QEMU
> command line with a hopefully not too scary worked example of what
> this looks like.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
...
> +That said, the general form of a QEMU command line can be expressed
> +as:
> +
> +.. parsed-literal::
> +
> +  $ |qemu_system| [machine opts] \\
> +                  [cpu opts] \\
> +                  [accelerator opts] \\
> +                  [device opts] \\
> +                  [backend opts] \\
> +                  [interface opts] \\
> +                  [boot opts]

FYI: My "git am" complains about a trailing white space after "[boot opts]" 
here. Please remove it.

  Thomas
