Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1248019ejc;
        Fri, 25 Aug 2023 01:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS1CzbDI2hC/42GSnW61JCzNrbcOxeqaDaCzFnbn9WP9aH/mqmiEEu9+euj+NKuzOoR27c
X-Received: by 2002:a05:6402:18b:b0:51e:53eb:88a3 with SMTP id r11-20020a056402018b00b0051e53eb88a3mr13784304edv.25.1692953036118;
        Fri, 25 Aug 2023 01:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692953036; cv=none;
        d=google.com; s=arc-20160816;
        b=jg1rs2gecYhDgT6mBYRgCgdYE5Gjv8Nhf9aTuJ7mk5Oq6BckPFYuFI+U+JSrDfVc2f
         vpL89JQJ1bpxoPDl+MVnDZOTSxM7dHsc+aTIt2/1zOCcYFcPdCW+eW8zKV/OtHW4s4l7
         XTzRTpZh2ZJyf2pdo3QcX/AVNR7gTsUHg/iOmwCSHzQFZrChcJHKc1KbmcmYy8fLaGI1
         g98LrOlT93GJarL1vF7evvt3GUjDzOasAvIhZxwKTPSNrveZisgq+J+wB+B24lPoIi7D
         Fu/ctQ3YIbLe1RGKN/0Osd+1sBrDg8Vxi5NHPZ8uVWnczndsQ9GlKC8CR2aZNzgR+1mQ
         /A+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FMdSIogukHVsbz1GOKtUPqyfRKh37yhWoahabbWmBgQ=;
        fh=hXTIU5FZJkMS4GdgvE8qB74Ln/WRbdOuNhADBJNYZ8M=;
        b=eZd08jJfcHk85LipzHfDgLv3VIqgzA6EPrluwL5wxnMrYOmsAaewtFU0q7G2dcnoUA
         UgOe7y/Y+3RPyxVe6GK6j1O4OguJvY7+asS91CEe6dg7ElP4UZ4GjjyNMB7ijEJTuCW7
         6g5o2TgbHbh97wbXw1z4Myup+H8B6qf0J1J5tZj2wq/ATpnwxvf4224rOXeCAlYIwt2h
         xHPROI5ziBfjUanZ3x/yHJ0691349YUDxniNRoKUy/kOxQ/O3kSOoNk8JVciRUWH420t
         s0VMZ2AyNx+jmtJgwoCIkv4iVeT7VLi1iOjftJYBhYtl6zpIiHQ/pUV8fNHvUx1E9C/s
         nZEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rm43tdHR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c9-20020aa7c749000000b005223a53ce0esi783462eds.323.2023.08.25.01.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rm43tdHR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692953035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMdSIogukHVsbz1GOKtUPqyfRKh37yhWoahabbWmBgQ=;
	b=Rm43tdHRZyYrB1r3KjVANei4Zgs9nGkSvFIxTLyCy4Mx+ovnEXttrybhI1lEFYX80uO4+9
	Jhb9kBWoJaCVvf2We8uoUFORO+Myx6YnqXdU64IIv8+XbgizhlmYFeNl/0q1HsLn4dG0eC
	Rh2mkBVEEhk0BgK4miOmbEJyMWPHgwU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-RXJq0wj8NAucGYLJe_Whzg-1; Fri, 25 Aug 2023 04:43:51 -0400
X-MC-Unique: RXJq0wj8NAucGYLJe_Whzg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b8405aace3so7358581fa.3
        for <alex.bennee@linaro.org>; Fri, 25 Aug 2023 01:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692953030; x=1693557830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMdSIogukHVsbz1GOKtUPqyfRKh37yhWoahabbWmBgQ=;
        b=AfrQNplqWiaJK+M7loat9rMNJlnkre1stVd5Xt5G6OTYlDMYt6QklRd0weXV6JjUFY
         VE4C7hItnOKzmp87Eyst40t9pzG8i6h8B5j3eiF5nLtc81g1Pzr8GtNNMdpqyrnVkOn9
         /Oq/Yl6LabbsCuz/5fFJ178DvGEMGrGHzXTy24mW8u41Emt7//cAwTdxMG5lW0ZsKcoO
         eVM9oeNxc52WHcdjqqzgZ0XxCusCfFTprl4NicGBaDnsv/dloJb9YX867kNcTUP5/RYR
         B4JAKzC8iKEbMn47iYdAkzKmoDkH8XI2985gnAnfYMWuu2szhHgljdb+gXFhaNa3nE+p
         gcCg==
X-Gm-Message-State: AOJu0Yx/gYIhoQRhT2iRtcwCSAsFVV43OIj3BSSdUqsbxJZRpxzpvX0p
	5MrIVsxwKEgHKQxtYvljAF86W49yfjC+1JeoZ10YpuoOkf873tx/H1bl+q3pUAUPBu00OHYV0uz
	s6aYklBUn2bunZYFC
X-Received: by 2002:a2e:b053:0:b0:2b9:6810:b333 with SMTP id d19-20020a2eb053000000b002b96810b333mr13150676ljl.14.1692953030159;
        Fri, 25 Aug 2023 01:43:50 -0700 (PDT)
X-Received: by 2002:a2e:b053:0:b0:2b9:6810:b333 with SMTP id d19-20020a2eb053000000b002b96810b333mr13150658ljl.14.1692953029812;
        Fri, 25 Aug 2023 01:43:49 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-97.web.vodafone.de. [109.43.176.97])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b003fee6f027c7sm4735136wmr.19.2023.08.25.01.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 01:43:49 -0700 (PDT)
Message-ID: <0f2cd2e2-2524-cc4a-5c3c-42eb083dd7b9@redhat.com>
Date: Fri, 25 Aug 2023 10:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/12] gitlab: enable ccache for many build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-s390x@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-2-alex.bennee@linaro.org>
 <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
 <97490761-c138-d496-c59a-f71b86e57c3d@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <97490761-c138-d496-c59a-f71b86e57c3d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: i+OzNzFxfIRz

On 25/08/2023 10.34, Philippe Mathieu-Daudé wrote:
...
> __FILE__ is used by assert() family, some DEBUG_PRINTF(), but mainly
> by "qapi/error.h", so all error_setg*() calls.
> 
> This has been bugging me since quite some time, since if you build
> the same QEMU in different paths (usually on different machines) then
> the output doesn't match.
> 
> GCC 8 & Clang 10 provides -ffile-prefix-map, but
> 
> 1/ Our minimal GCC supported is v7.4,

IIRC we use 7.4 since this was the default GCC on NetBSD 9 ... I guess we 
could bump it once NetBSD 10 gets released.

  Thomas

