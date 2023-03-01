Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6601513ejc;
        Tue, 28 Feb 2023 22:38:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8KhbLmmudeF9d4c6vp6PWibncXdTEJpgeRzZL3UkMyxd0WMcZOEyQT0+AL0sJvi0acZbem
X-Received: by 2002:ac8:5f10:0:b0:3bf:da89:1946 with SMTP id x16-20020ac85f10000000b003bfda891946mr10864281qta.1.1677652689245;
        Tue, 28 Feb 2023 22:38:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677652689; cv=none;
        d=google.com; s=arc-20160816;
        b=fWSAxD0CcjLTDK5eita/QtUzM9A0DfAQUE58JlBoZZRl3YfWVmxl+DEQ3hbE8rRv/r
         sueAje2ECZKniCBlxvynoTUMTnxvYuwq63m6kIYoDsuy0nwLWKEuBkIyj1D6QjHMwPwk
         ZHOfpj0fVdYDSBcv5zAYhyZDABPpCsw9UtQEfXfowZObke7exdvbwfmMqvHn6L/+at9f
         Mx4xkxoGEVLv7x2o7uVCFL74N8FbRLHcJLVC+0JqsEMy3+/Q3+Oe/6NrxXFselnFlTpt
         l0tArjSZOefOYFJlbKseHL/QhaQETvkyhnJUkpjftFGjOQQaBn6C4CzYRekqsbqmyTnP
         8BQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
        b=rh/gbyUbx7ZV5kRciQZau1e9DQcaeRbxn2FZoRdDi3VgCEltkvupiYrGPUT+XwTykS
         51nymO4UtDfP0azoDfKVS12Mv2qPDWyIxk70tOwQssBMI+B7y5Uy7+4DGfZH5OaL5LD+
         Y2kZxSuWvJH1Nqk+RJVH1AlIUqlv7xazzuSIzOQDXDU8mP3GAPAlzZV2jZ/RK9t0724y
         mTXFLD7u9s5EUOfNlNKEd4RCmMTfTWdD0z5Ki2SPzawKSkwB59klTuyAnsy0BIeMkxjM
         2pmzrICZOj1dCe50+cc+DTvqsf5fRZiq+OPPTjzqbIB3q6wr8l3sn+vfxuohOel13Jp9
         FrNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aHEW4uUC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h11-20020ac87d4b000000b003b9fbc9642dsi11390216qtb.182.2023.02.28.22.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 22:38:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aHEW4uUC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677652688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
	b=aHEW4uUC0dDeGSI1uZ17t+cazq8YxGLaIJhQQckNZ+AfieUKCHsBc/Ikzkssn9T0XbX+f3
	7cIFmXU5MwJ8rOB1ndkgc+zqTC9hOS74pqtOafnxIggBKrEyDo0oY8CGeKuzyTLTvzuOEc
	zAEmawrgigSAwEUuIcyRWcLbv5bsE2k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-BXW7e4wxPneZlIBnZiojUA-1; Wed, 01 Mar 2023 01:38:07 -0500
X-MC-Unique: BXW7e4wxPneZlIBnZiojUA-1
Received: by mail-wr1-f69.google.com with SMTP id bx25-20020a5d5b19000000b002c7ce4ce3c3so2251859wrb.13
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 22:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
        b=ZlqlkzYqWYcd1O8bcGvT0JuJlCzIqOdtdPPeVXVLHJjN8+WMBb80j1rR1tknbD6LQW
         TUgNoU0G4GmwOwP28O4bAxU2UxMcCyqyH7Py9cNEzb8c0jKMdqRvZbhfQ78QfmPJAftZ
         rGAdJcIxvZNJyR9Pj9aDnZcRcqRVUuYli7gTlKGXonro66rXojRzqytOJvLI6RHlZCK+
         ok5RthWtjyFXldKfg2f6EYJUDSbCcgbJokHyxGT0zd2IGxMi172GY7pHymyAVCvT4+f3
         WSMG2sd17Ht8Lq8+Up5i+kq00V0eGWpv3dK7b5DjfLqBPMjyHiQtI3qqaWqFARKdrRcH
         H1tw==
X-Gm-Message-State: AO0yUKXToLjtMwTTDEh6j2tmeP73tkfI09N3QRsePT9R6/+0izsojj+V
	aDso/BXOC9C+o9WVrQ9zsf7v0bYCIqtoLsAP9FFa+vG63TVFcs0rAyGijkMmMco0EEbt0y927y+
	Etr4ThbtdwQqNei8v
X-Received: by 2002:adf:ed8f:0:b0:2c9:e5f0:bd4f with SMTP id c15-20020adfed8f000000b002c9e5f0bd4fmr3769329wro.18.1677652686746;
        Tue, 28 Feb 2023 22:38:06 -0800 (PST)
X-Received: by 2002:adf:ed8f:0:b0:2c9:e5f0:bd4f with SMTP id c15-20020adfed8f000000b002c9e5f0bd4fmr3769321wro.18.1677652686484;
        Tue, 28 Feb 2023 22:38:06 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com. [80.187.114.247])
        by smtp.gmail.com with ESMTPSA id u4-20020adff884000000b002c70851bfcasm11667249wrp.28.2023.02.28.22.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 22:38:05 -0800 (PST)
Message-ID: <85aa3a6c-63a5-ad1c-b7c5-201ceedcc3ce@redhat.com>
Date: Wed, 1 Mar 2023 07:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
 <20230228162938-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228162938-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Wi4M4Gi/wQ+d

On 28/02/2023 22.32, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
>> Well, without CI, I assume that the code will bitrot quite fast (considering
>> that there are continuous improvements to TCG, for example).
> 
> We have lots of hosts which we don't test with CI.  They don't bitrot
> because people do testing before release.

Other hosts don't bitrot completely since there are still people out there 
who are interested in those host systems. But are you aware of anybody who's 
still actively interested in 32-bit x86 host systems and thus makes sure 
that QEMU would still work fine there when we publish release candidates?

  Thomas
