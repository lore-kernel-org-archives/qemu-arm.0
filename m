Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp611341lfc;
        Fri, 17 Dec 2021 03:41:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP0JHPrHRq0PiqQYX1QORTyShytNGBCcCfAM5pJbinoEDHXN2E8ENVILv/mpkksnsiC4IJ
X-Received: by 2002:ac8:674a:: with SMTP id n10mr1852590qtp.145.1639741317084;
        Fri, 17 Dec 2021 03:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639741317; cv=none;
        d=google.com; s=arc-20160816;
        b=M6FfY/UWLwvJL93XuG4QHwtKTrNGXeuG2W+YFXNqAWBBGpYQU/ypoKeMgGg/dWGkX6
         3jfJXvFGP8mVWvQE3esfhVfsxvnlmhQq0Jp64shLP8Pe74uM2+fWSKHVUcKGdISyBLCW
         vMZ5ybvZg8gXDi25+eo++ehA/AlycHj2HtjM9zxZZUJOu0SV30I0cHuhthAsP8bs2Q8g
         GV7+lIx2doTlKYkpHBuJGv6GIKNnIxY3+zyskp5XmLOZSi9kIQ5lDGWndMtsf7oVYNrV
         40nqNNMgnZKKnRofpSWPbMDgxZky1LkJeOdT8+HKyzNsJMNGHNGFR7HFTazPZWG2cxic
         JbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7Of/7oYRLwHhYbrlIjiYP46//38AzAYhkD2VOSQCvmI=;
        b=N/rYS9XIKudFCC/Ml709EqDYCId0xCvOcUk97wXoB25lwcBRS/ZUkkcj6z5GvQrKXN
         C1lKyAx4Mb2/VUxZ3lK1JaKtp1MW39riIqQoUOEyood+iKn2AqlwmR2a9oyp7hkIYzKx
         95YnkFSfEMy7xNDC4juVgXJsmjI4pzmzSIQPn3Ousg0NWHUBrGO7lTknCqi/KsY46FyY
         LINeT4Yve27ilrLYcPgGT6A6/KDHAYppOgbkwrfr1OGKjm0usZK3RH+gCtPQJX/42g9E
         f0jHSZ6AozhJd5i8costXwlmsbqtLM8K0EERo8SRjRNqJ78SSBnZLk9c4fWqJbrOZWBC
         m+yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvCBSq5c;
       spf=pass (google.com: domain of lvivier@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=lvivier@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lvivier@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bj35si3462008qkb.383.2021.12.17.03.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Dec 2021 03:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of lvivier@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvCBSq5c;
       spf=pass (google.com: domain of lvivier@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=lvivier@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639741316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Of/7oYRLwHhYbrlIjiYP46//38AzAYhkD2VOSQCvmI=;
	b=XvCBSq5cTrA4NyC92HIoegrsiOBPBwHBHh7UTlrTTqnmsANwiZIHJ0MW3VGKVY6av4YLH2
	uUxXf5aRoyXqmzJot/kcV4tH6XO2WFAfTXJE7vYm3IWNd07esGv6aM6vXVooOVeUGXB2OG
	nk0xV8tjaI1HkJrx/yHdOeOGBFX+e8Y=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-GqS8EhllNrCRTWCsNcJ57A-1; Fri, 17 Dec 2021 06:41:53 -0500
X-MC-Unique: GqS8EhllNrCRTWCsNcJ57A-1
Received: by mail-qt1-f197.google.com with SMTP id u14-20020a05622a198e00b002b2f35a6dcfso2201302qtc.21
        for <alex.bennee@linaro.org>; Fri, 17 Dec 2021 03:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7Of/7oYRLwHhYbrlIjiYP46//38AzAYhkD2VOSQCvmI=;
        b=KoYz9j9GcHuLHQR2g7K0Vp4p8mtOU7kk7jbzwrQsCmszf990d7pdJ6OydDh3a3DSzg
         mi68ngC3EnvH4sW+g1MCDz2LNOesn/v2uV89OxmWw4p1xyihjNdyhhAUMHzUJNFCK+E6
         mTMitpWSio2smEiU9CAALbtoaI/au0Fa0puVeIr5Et/UTzRT4zXyPRWrFxxv5XOMP6BB
         4C2H/FyHYEGPh1tXK2AnFYgg6ut6LK/aZSFr55szuu6PAxFQmq4so9vHkPFndFYfXDkq
         KIvS2CNkjsEDpF0SqMvQauk8vdVfwqaa+dXywbgaeBZXtiM4EgFfozobETxUq0uH0u6l
         8inw==
X-Gm-Message-State: AOAM532UHsPNDtvajtW8jqK2K3HPRNdkjGGZ87qvAN8U8/nBhwny4y83
	W/GB8oiNHGSnWwEo40R0qnm5SOiJR5/uVe/iCJs1Fbbt6w6BkY88LDNyo8cDroJWX51dcNlAih0
	lEeNSdzE9r0G9WES4/OjTXJXQHCz8bxasc57PYwkfLA3H81YRLH+AKfiDN5NBTGqyxYA=
X-Received: by 2002:a05:6214:1d0c:: with SMTP id e12mr1640310qvd.105.1639741313154;
        Fri, 17 Dec 2021 03:41:53 -0800 (PST)
X-Received: by 2002:a05:6214:1d0c:: with SMTP id e12mr1640267qvd.105.1639741312787;
        Fri, 17 Dec 2021 03:41:52 -0800 (PST)
Return-Path: <lvivier@redhat.com>
Received: from [192.168.100.42] ([82.142.30.186])
        by smtp.gmail.com with ESMTPSA id l2sm6756907qtk.41.2021.12.17.03.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 03:41:52 -0800 (PST)
Message-ID: <c2ac9145-25a3-8b66-2039-64229247c403@redhat.com>
Date: Fri, 17 Dec 2021 12:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com> <87v8zneap1.fsf@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87v8zneap1.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OcH/tu5LKQNL

Alex,

I've added this patch to my trivial patches branch, do you want I drop it?

Thanks,
Laurent

On 17/12/2021 12:10, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>
>> On 12/16/21 15:11, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>>>> (Fedora 34 provides GLib 2.68.1) we get:
>>>>
>>>>    hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>>>    ...
>>>>
>>>> g_memdup() has been updated by g_memdup2() to fix eventual security
>>>> issues (size argument is 32-bit and could be truncated / wrapping).
>>>> GLib recommends to copy their static inline version of g_memdup2():
>>>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>>>
>>>> Our glib-compat.h provides a comment explaining how to deal with
>>>> these deprecated declarations (see commit e71e8cc0355
>>>> "glib: enforce the minimum required version and warn about old APIs").
>>>>
> <snip>
>>>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>>>> +
>>> As per our style wouldn't it make sense to just call it qemu_memdup(m,
>>> s)?
>> I followed the documentation in include/glib-compat.h:
>>
>> /*
>>   * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
>> allowing
>>   * use of functions from newer GLib via this compat header needs a little
>>   * trickery to prevent warnings being emitted.
>>   *
>>   * Consider a function from newer glib-X.Y that we want to use
>>   *
>>   *    int g_foo(const char *wibble)
>>   *
>>   * We must define a static inline function with the same signature that does
>>   * what we need, but with a "_qemu" suffix e.g.
>>   *
>>   * static inline void g_foo_qemu(const char *wibble)
>>   * {
>>   *     #if GLIB_CHECK_VERSION(X, Y, 0)
>>   *        g_foo(wibble)
>>   *     #else
>>   *        g_something_equivalent_in_older_glib(wibble);
>>   *     #endif
>>   * }
>>   *
>>   * The #pragma at the top of this file turns off -Wdeprecated-declarations,
>>   * ensuring this wrapper function impl doesn't trigger the compiler warning
>>   * about using too new glib APIs. Finally we can do
>>   *
>>   *   #define g_foo(a) g_foo_qemu(a)
>>   *
>>   * So now the code elsewhere in QEMU, which *does* have the
>>   * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
>>   * without generating warnings.
>>   */
>>
>> which is how g_unix_get_passwd_entry_qemu() is implemented.
> Yet later we have qemu_g_test_slow following the style guide. Also I'm
> confused by the usage of g_unix_get_passwd_entry_qemu because the only
> place I see it in qga/commands-posix-ssh.c right before it does:
>
> #define g_unix_get_passwd_entry_qemu(username, err) \
>     test_get_passwd_entry(username, err)
>
> although I think that only hold when the file is built with
> QGA_BUILD_UNIT_TEST.
>
>> Should we reword the documentation first?
> The original wording in glib-compat.h was added by Daniel in 2018 but
> the commit that added the password function comments:
>
>    Since the fallback version is still unsafe, I would rather keep the
>    _qemu postfix, to make sure it's not being misused by mistake. When/if
>    necessary, we can implement a safer fallback and drop the _qemu suffix.
>
> So if we are going to make a distinction between a qemu prefix and
> suffix we should agree that and add it to the style document.
>
