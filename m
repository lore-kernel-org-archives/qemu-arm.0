Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp200980dll;
        Wed, 15 Feb 2023 23:34:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9O9MWAzhpl2oEsFeacCeogf7TE+6xw2SvucQwHBbF36ETbhsqtnQn98vAjyNI+FUfBtnhr
X-Received: by 2002:a05:622a:18d:b0:3b6:3a12:2bf9 with SMTP id s13-20020a05622a018d00b003b63a122bf9mr7768894qtw.2.1676532896414;
        Wed, 15 Feb 2023 23:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676532896; cv=none;
        d=google.com; s=arc-20160816;
        b=UUqfXFR8Fhi4wzFOhlgsz7L4uMXg0ucym73DzdUrRu36Fk2SOGDIrVgwDLKX2IGCzi
         M6eD3BZcTf1hxnnzB7/Did2CLaO2i6pZt4I9X7jCtxPt7P9FsCRGCySwGmZ+Q5FzLIyI
         2rMZDl0BlGI+bnpEJ9JHqvrOVuQAPonH2iZugXaO4o3qG7FsbgCa6iti6OjOYpnISa10
         5hvDFjctmG6dp93tPxnsVMiMGWqQhAT5LwpzrCG9wKzWXaYjIcDUptpzDdcQP7fy2sle
         NsQHgPbxY1Oddl+9cs5s5JtgFjPFyTX7fHIjBgtNFCKp8/PG5mEsQgt1iOkhW6EGoUlU
         ltXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZPb4rNiPVH62XA6fMrT3LhZNZV/gCdQNzwieA9CVAc8=;
        b=Ulwlev3Syww59HE3HywBZEXJkpd33QXE0BpTCC5jW66Uz8mzfFt6CdGZdgKclb/ndv
         CVKhH9hT8jk84fs6VCmvdvL5Ddl3DhGXxLYddZkictN/Imcf3Ufk81aElIzfzjHc+h9K
         d3zBVUVFfjRvQq+C9F5cZ/kHrYzYRA2DNV09cC94pgJ5TCM2iXUaWHLIUYNRVSj7gDtq
         Mb9My2ZJ3fXZYtoehhOdr30pZm+MW9P/0CNEmSsxBP39RzWDHgb1Uj2fqWKneIg+AyGp
         XKpM7EFxULnhUxnvpj6g8H8WhoUcIkDvdhjvlefCpbbJXkksDxrlzE9ZaGt6pbkLRH5N
         gceg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=du3QirBm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o3-20020ac87c43000000b003bbd8bdb932si1013182qtv.790.2023.02.15.23.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=du3QirBm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676532896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPb4rNiPVH62XA6fMrT3LhZNZV/gCdQNzwieA9CVAc8=;
	b=du3QirBmNLx3Dvws64naFF2KkjMYnOHaNRXcykS8g3gdIoKNeD96yxli5oTpqzMVt7gpko
	GxXIwYerfu4AbFNBytZbEJNnlhTZ6l5U/BeYGuQB5kDp21VqWZ6hcnh/GPIMK7qBhJdvEp
	UwrTjsh0sn44o3bDNdKejZuo23h4MZI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-SIUpAdhkPhKXyobAG7sHAQ-1; Thu, 16 Feb 2023 02:34:53 -0500
X-MC-Unique: SIUpAdhkPhKXyobAG7sHAQ-1
Received: by mail-qt1-f198.google.com with SMTP id n1-20020ac85a01000000b003ba2a2c50f9so758874qta.23
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2023 23:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPb4rNiPVH62XA6fMrT3LhZNZV/gCdQNzwieA9CVAc8=;
        b=PieB8j1ganPRQtf3RK/Z7LT/7i+5UnN3RU2l3NGi8ARabF8sAd1nLjevichm5Eu7ZS
         wpDF20EWV6x/laPvJwLLEsKp2QWozGJIFHHnukjK8WwtAtY3XmwCw1G0gv55KqQYwL7r
         D6Qo5J71ABeYRO7PdzrqrYGxuuYWFy0As3r8DXq9jA/cXuexUVZgqH+QM9Y81+pXtaYB
         xb8+87sQa/WjL7UAQI/UnN10cahakJSCr4K/lERJfOaRIxyul20rnozvcxmoiTrkMWDO
         TdQknc8VqOOyW7fuh2kBo3g+N6KXoAjRf/kn097ZsHnMzZw50J6OpGH76LshQ142obAp
         cyvw==
X-Gm-Message-State: AO0yUKUPKxCL9+RT8D0661nWCVFbEH494VqtWqBvFikJ/HgN9w226k9y
	vTfTlXLVfZf1oumzyh3BHtaQrvCBpcVKXC8WGze7xbtRZZrcg/Na6IRlmMaV4mXB/Mk/Hd6eks3
	01e6qlkx6oR5H658U/1zRS+wiTGV2pLpAlsXgbsK1D92NKdslJGo71bjoUKFUmKzdHt8hO+CP
X-Received: by 2002:ac8:5bd5:0:b0:3b9:c074:6e3c with SMTP id b21-20020ac85bd5000000b003b9c0746e3cmr9210960qtb.43.1676532892554;
        Wed, 15 Feb 2023 23:34:52 -0800 (PST)
X-Received: by 2002:ac8:5bd5:0:b0:3b9:c074:6e3c with SMTP id b21-20020ac85bd5000000b003b9c0746e3cmr9210912qtb.43.1676532892203;
        Wed, 15 Feb 2023 23:34:52 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id c13-20020ac81e8d000000b003b9ba2cf068sm795457qtm.56.2023.02.15.23.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:34:51 -0800 (PST)
Message-ID: <1b0d28cb-61aa-1e5a-f246-5e110ab5df79@redhat.com>
Date: Thu, 16 Feb 2023 08:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZlETJUIkLWeM

On 15/02/2023 20.25, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
