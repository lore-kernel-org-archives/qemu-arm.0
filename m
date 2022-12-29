Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4139672ejb;
        Thu, 29 Dec 2022 01:29:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtkxrwdUGj62wST8eqZ03O3PqkZ0zpFxXAuU9fGdzsGc5DM6hz709MNTy0eIJt7Kvxwoevr
X-Received: by 2002:a05:622a:1e08:b0:3ab:80d2:1a71 with SMTP id br8-20020a05622a1e0800b003ab80d21a71mr20885016qtb.28.1672306148562;
        Thu, 29 Dec 2022 01:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672306148; cv=none;
        d=google.com; s=arc-20160816;
        b=IsATh6LZ8btRV6ew7haelDkFLpvXjwylBMx8Qru7bkJYt94lCG5pU0e7mGPr79AY+q
         HSUOxFlOIEr//fpNkcGBLEMhM1t0soEr2lbalStSL74p/J17dFM2og4Ctz+xBUMJRpab
         BYpMlyViwzbSGnwDRZjXDmad3eXQU2wsjz8AVDeSmaSpLTUugu3Tfer9ezB7cNOmPZy6
         Xem6kjx9a27gvfd/8k53i7HNIxIIbT7n5Ego8wqRQEtwbYeK034P6p6KDLUNEKELP0EM
         qGfLOuYm4clpeJPC6mQRLuK7Vqo9Y2qk7wuqn9MCZcxT7Nh/f/4NMood5+OM1ZbIcLrk
         lJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
        b=byjVzDyWqiZ1AYkBeO9fsvbDJmhXxxMm0IevzxzhSFIXZQ6v1+jFNb74a50vZwYX+A
         WJTasthU8sttKJClDDcYVLCWXYMEwteMoQd4j+pEeIUXXAYJjynMhtamlISPQ2ZSr1ae
         zxwDdLXvjprmOo+j1DANvteWQE6G+gmmNH2UkaLFWaEKFY0l09b6fWtwDclwyWAupwT2
         iYoXyS9lmP+3lLGyKeNqh4PTcS8ci409NEWmYc42ogjwwXaBZib7Qe3Ro6/kDVdkUYkD
         Xl7M3oPvSIm9fV1NsnaFZ4pnvbCuhRO4yjpvnJiugTbTHIIFapH0gsKSAU7DZrQUiKOB
         nesw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1i3Vo9i;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bx6-20020a05622a090600b003a7d4650006si8172978qtb.131.2022.12.29.01.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 01:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1i3Vo9i;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672306148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
	b=K1i3Vo9i5iV/jhIyDuf3NdqUI8neXkPaIl+JOebG/kqdlS1bCgzKHpuy7tiw/FIlAU1wqa
	pqgoVj9POAy1lpaXPtoV+PSx+/ltrIJ7+4p7M2wJRZrI5kTiZo0fiECrAGB2pUMiijJSP8
	VGDOcIH4otSYAsOAnqL3wFr08YheQdQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-tpp8AOA3OtmuESf6ZOohOw-1; Thu, 29 Dec 2022 04:29:06 -0500
X-MC-Unique: tpp8AOA3OtmuESf6ZOohOw-1
Received: by mail-wm1-f69.google.com with SMTP id c7-20020a1c3507000000b003d355c13ba8so9475284wma.6
        for <alex.bennee@linaro.org>; Thu, 29 Dec 2022 01:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
        b=xZbNNSZGL9m/3E3l1S0Ao/H+8/RiJaSu2/T9RHA3uoUcN1uKUugrKQF3Ld8iFR3K7x
         BbzYDHXp+rDPJhm0LiBBNJ6/EK41uJ1LK/PX4WidrlJhkEwxHZ/7AclV6joiXGA3sKAO
         nFmFDxgE9wBkx7FmfxwZytoEjAu8rOUz6pW1KEvjnhwgZpUtx2IVICljlm9HcbCNu+LK
         YauZCqJFN0FJOc33tKJ4LrdqjCGAHosmeLHyJlwLOaKH0a5SQGPVTN5/fXrnwdWD8I3e
         FXDBglRdqqO2ft4d8kGpoVqhMTy2kphju+ZctqCNNGx0JYHd+U1CQj9zdbvt4k0U2y1s
         x3Pw==
X-Gm-Message-State: AFqh2kpl17ASpaD6Yq23bZbXI9gVolZuTEk5Hw1kJFI0J8rlAPLET08u
	sNrXCzVUAz5oO++2HSNO/wHOqtQea5z2fJxulOS8270LkDatiCX70/Zpk42LIxSvrwLAAGgQz/0
	0zAC9Cet3CesDqGw9
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id g3-20020a5d46c3000000b002427676689dmr16793791wrs.19.1672306145925;
        Thu, 29 Dec 2022 01:29:05 -0800 (PST)
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id g3-20020a5d46c3000000b002427676689dmr16793782wrs.19.1672306145747;
        Thu, 29 Dec 2022 01:29:05 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de. [109.42.113.203])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b00282194eaf7bsm7531081wrq.71.2022.12.29.01.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 01:29:04 -0800 (PST)
Message-ID: <20f8ff01-8240-5c53-99ad-c75d37f6639c@redhat.com>
Date: Thu, 29 Dec 2022 10:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221219130205.687815-5-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /8cAxp9kYEcb

On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 1 +
>   util/error.c        | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/util/error-report.c b/util/error-report.c
> index 5edb2e6040..6e44a55732 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -193,6 +193,7 @@ real_time_iso8601(void)
>    * a single phrase, with no newline or trailing punctuation.
>    * Prepend the current location and append a newline.
>    */
> +G_GNUC_PRINTF(2, 0)
>   static void vreport(report_type type, const char *fmt, va_list ap)
>   {
>       gchar *timestr;
> diff --git a/util/error.c b/util/error.c
> index b6c89d1412..1e7af665b8 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -45,6 +45,7 @@ static void error_handle_fatal(Error **errp, Error *err)
>       }
>   }
>   
> +G_GNUC_PRINTF(6, 0)
>   static void error_setv(Error **errp,
>                          const char *src, int line, const char *func,
>                          ErrorClass err_class, const char *fmt, va_list ap,

Reviewed-by: Thomas Huth <thuth@redhat.com>
