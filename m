Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1261003ejc;
        Fri, 25 Aug 2023 02:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfDgTovUzx6novnOb2bm/Fg6F7C8irlVrhS2oIx3KTio3VdFY1Aq3mQ05XIgWF+9SSPVOn
X-Received: by 2002:a2e:3c11:0:b0:2bc:d889:2d89 with SMTP id j17-20020a2e3c11000000b002bcd8892d89mr6850555lja.44.1692954834140;
        Fri, 25 Aug 2023 02:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692954834; cv=none;
        d=google.com; s=arc-20160816;
        b=NLJI22JEAZoAeCxGKxk1FsFnTvfEl30pxAUbCvUTqvd1chYbC1gwenhLC0cSQrmA46
         YS7pbxgUJoYYn5r8h04f0lMsgHk6kcpLYCVV1aElRi72zRx2RPvFRr1tlz5MeLAp4AHX
         rMQ1sNvpACDzuKCgNj65ftKhv+M/TiRJobgCb34Bwue44tiskGGUqssAQTgKdXWM/LZT
         ixJYwJRIkx2oKqgwVTGT4DQJWUbGVntB9bYCb7md7fXlqEkJvqs1xaLtmPHbHpqHnOPL
         6Wf9hsjtDHghisYpPqBo6AYmiS2w9BUV9WbgbR626dpjPUcs3ZsgIwL+zb5ezn/Ugh2i
         AHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=AD0hGnH+8ytNjJUy2zBgU3wM8IjHIM1YchR6by9t0Tg=;
        fh=jsIeZ0b/TaDicE8p632+oUq1qz0GT6bvbzWCj6/50b0=;
        b=oVJbfX6Xg3PNSKdsPx7AAA4ZBWnmRAYsgN6FqmPeJo0niXjnwOdYiPCvmwlO/Xovck
         c3y+cdoI0pQ5OfskYVYbfK3JInaIU9HUsfhq1IY3c4F86ZuaE5XEERfCI6HZnsJRhfgi
         tYFsXwOqJZKvO/EizpYWweJucgubYrCfWPX2nkQ9hMmZGNl4hC60w58xBn8R2/U8YPQO
         rH3sC+ktoxU06k/9KCj85RoL/RBk64IFLmzvjzLDu3O2C/VD62xJCNOrRiZMPXurSbEn
         GWdhwDMGBpvcR8NrsqlCpPYgjrePbQCVtRLunol72VFPI8Tlqjq/DPBcQm4uTa9nR+h1
         DVCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id h17-20020a2e3a11000000b002bcb8a89211si407762lja.540.2023.08.25.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 02:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 36E321CD9F;
	Fri, 25 Aug 2023 12:14:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id AD35D21BEB;
	Fri, 25 Aug 2023 12:13:52 +0300 (MSK)
Message-ID: <1eb41c65-7557-49b2-8a3a-bd8459791a17@tls.msk.ru>
Date: Fri, 25 Aug 2023 12:13:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/12] gitlab: enable ccache for many build jobs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-s390x@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-2-alex.bennee@linaro.org>
 <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
 <97490761-c138-d496-c59a-f71b86e57c3d@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <97490761-c138-d496-c59a-f71b86e57c3d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FCaVWDI+7Nk9

25.08.2023 11:34, Philippe Mathieu-Daudé wrote:
...
> __FILE__ is used by assert() family, some DEBUG_PRINTF(), but mainly
> by "qapi/error.h", so all error_setg*() calls.
> 
> This has been bugging me since quite some time, since if you build
> the same QEMU in different paths (usually on different machines) then
> the output doesn't match.
> 
> GCC 8 & Clang 10 provides -ffile-prefix-map, but

This option is automatically enabled on debian.  Still, ccache does
not use the old cache contents when building in a different directory.

/mjt
