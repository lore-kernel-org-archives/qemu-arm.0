Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp575409lfg;
        Fri, 7 May 2021 10:15:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI6MFMTh5ZAN8hUImVpL7OaGLF8VLDYlgPC53T9OmUo87h1wyQC9YWGIh2XK490a+iTFcz
X-Received: by 2002:a17:906:f1cf:: with SMTP id gx15mr11057268ejb.435.1620407716042;
        Fri, 07 May 2021 10:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620407716; cv=none;
        d=google.com; s=arc-20160816;
        b=OF+Ug6pC6aOnsnWCpexS0fwd+X2Rhc2D88Tjvvam5hCeiOzrCO1ANJatBB/cJA65iN
         u3zW6KWvCmIsw+AtdYuSOJPKXlMezQ2wMAF1CsVr3ccCtGbztuR1CQBlGVgH2omX7i3z
         6TuZL32xUgLkCacuEU/VGKLJQh9gmNr5WH7xTkGUlYv/509iPSk270GlYxs0nVHwTjGo
         aWHojgoqLOmMkaeOVadZnZNsYaDU0N9iwE+34BaIEsBNXawOgaU5FhlXYM5Pi62hyVo6
         /kK4DeEVGxRWy2YjUmXnRwqb5uFdAz0DtQem1TvQE1QEcYxJt8PCxjNypONTdduG1c0a
         z6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uTyDKyOPg1mkUq53+v02Ub+Jg9GMqLoeGEEmOXgo2O4=;
        b=KXzc07zjPKnDPiniv63+wOHkMn1rsEF6yjm0QXVFc055wLatKXLsTRU7v/bPZtuqyR
         yfKp0mLyQVXRP1XSYZNcb5c4FS2z5l3JYEONrCzayqqzfN+M9Da2vmNVyBN7+I/LcZF7
         TNAu8gNYODtXqKFCxdLARaHHe+/2gHQ3wpenHpNcJ62b/mDQFEcyGufuGqAveN6Wv5HA
         Vfp1XU2l3pWWoyE103mepu/b2vw/IBWfAgLY5+TgCNCrCYGKwZE8Prz8iBiax2YL1l2r
         5RSVZAfIuo96bqwArJBdkiNLKTOwc/qtufZxt9oVqcUB76KJfSEdAddhX2CuuC7k5PgM
         BcoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DNlD1MpA;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n10si7114970ejk.556.2021.05.07.10.15.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 10:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DNlD1MpA;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620407713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTyDKyOPg1mkUq53+v02Ub+Jg9GMqLoeGEEmOXgo2O4=;
	b=DNlD1MpAIVkxiQDFuji6Lho2yS2U3pJKlWnBMg+CBZ0LcaDypgfIaqv3NoxNVwmAOhAhlB
	BgXr86W+AutoGDgeQUADDJlX3cruzL6QB31wmuAL/lplThLgu/0t2lLxC2UvPWkxMzyair
	Y+KUHDOvka32PygdxM8c7fY0jcmxGF8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-Vk1OjCOJOLGa4uRwK__SzA-1; Fri, 07 May 2021 13:15:10 -0400
X-MC-Unique: Vk1OjCOJOLGa4uRwK__SzA-1
Received: by mail-wr1-f70.google.com with SMTP id i102-20020adf90ef0000b029010dfcfc46c0so3876543wri.1
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 10:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uTyDKyOPg1mkUq53+v02Ub+Jg9GMqLoeGEEmOXgo2O4=;
        b=e95Q3zpiimmeqbO1XZT2FQLqgXunSHW3dK+kiJz95dc9/mhVWt60h8xCo8eM3Ao1cn
         FnRvSLwr5YZsati2ATsy3qfYhvemmnZZjaXho8bX3sLvscrPvqA2c+m0NQdSVq9RYzkw
         ZdcSXEP8rehLwiyckrbCRh7jcP0iDFqZO+IBEr4g2690W3Dcw8iSWWAbFhR8hkztgEsq
         V5snVyDuZbfhm/4FLYjt9IHGj1MXFs86s0iZxSH05gdqkzqjFrAC5iXRMJWRTXOwOxjY
         gHzRSc0juLr+5psF5+5LW/w9MRUYJwoqSYnHl/4QH5pRneKQGie7j5X6RHogaOnvnAEI
         OzIg==
X-Gm-Message-State: AOAM533P4KaVsEkr7Xy0t82CLkyDFXxNyzyCQxLSrBUW+XqkVMjwGxhj
	thN/9Wn9mFSP4ZHZlLExqA8P5Ds5VmTaiFv2ZVQD7iUksk8DsH4HMGyDNR7/m2NL4Dq2tsUab8+
	2AuT14t3TZlMCeDTq
X-Received: by 2002:a05:600c:4f49:: with SMTP id m9mr17638990wmq.78.1620407708958;
        Fri, 07 May 2021 10:15:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4f49:: with SMTP id m9mr17638973wmq.78.1620407708837;
        Fri, 07 May 2021 10:15:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id a9sm7539023wmj.1.2021.05.07.10.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 10:15:08 -0700 (PDT)
Subject: Re: [NOTFORMERGE PATCH v3 17/17] configure: libSLiRP buildsys kludge
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-18-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <781a5288-f1f7-de29-cdc0-b71fe38e7468@redhat.com>
Date: Fri, 7 May 2021 19:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507144315.1994337-18-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xU2DlSFHw5nh

On 5/7/21 4:43 PM, Philippe Mathieu-Daudé wrote:
> Only enable -Walloca when libSLiRP is not built.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

> +# Kludge pending an alloca() call removed from libSLiRP, see:
> +# https://lists.freedesktop.org/archives/slirp/2021-May/000150.html

FYI it has already been merged, thanks to Marc-André :)
