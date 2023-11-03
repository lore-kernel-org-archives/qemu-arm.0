Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp982869eja;
        Fri, 3 Nov 2023 03:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxvbZeSnMAdoMAILRUz3hrftQiy0gtCKEJ6VAghILP627QPU6CGiZmekrNVP4rYvhE3/lQ
X-Received: by 2002:a05:6000:156c:b0:32f:7908:63cd with SMTP id 12-20020a056000156c00b0032f790863cdmr18949535wrz.18.1699009024620;
        Fri, 03 Nov 2023 03:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699009024; cv=none;
        d=google.com; s=arc-20160816;
        b=IiywlyYZjBmiynxXVBNC57nQ9nH67By/CPqaruzVtjf0F/2+XDF7SeVZY0J40xEtlH
         SPsaj6OA3BfGFNZZWvyxtvsxhRQa1qhYe2juQskygeTgNeYTQjo8lay12+YF0HWuUxdS
         6Pd4iUnrnSijlSj5JjIR4Ijly24m6QWZiTjBrBKwi1rxabGmmmKanKsS0wAACFSVH9I0
         qO5gidilomJccJRGNuT0sPThHy1s30wCIhhzq+hBOBW9TWKsrALuclH1OCEh9DM/HgTC
         f+r+CCb8X/aNJrsbtLX/mk8IqWydkzd9pxegl5Z3tsbZQ7tUOKXyQuftZB29n/QwXQ5N
         IYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=RicE5iIE043jU1ebmInnj8acUzF/kHFAP41x3kwHJKE=;
        fh=5o2JlOk9QD455354XoZbkcdj3n6+OeIcuDKL04qvA0o=;
        b=gRL6EaSWY/XyMLSkVeuo+uFY+hOnvCZmQjtE2i3RQdd/v/GPuUoF0SGTwKqBTeRbRv
         MVQPJIeWQzU+EU98JZXmJXujvIdF5ZsaMuo/XKDZWKMz5KQb0gONBWYzWbnQRivrXoI0
         5Khgp4X3niMIcPBRl3OVjXa8qBghdBL208ejhahe0dfI7GLI4F36QXmc5p3inGWtgx86
         yW00U7COHALS1A2e2D1u5cdjpWFhC92AMBzpVbiQjeseEqyzArWn8z7L0sQ/btbEhgTd
         R04JG/lAFsUt8iTqfz4wnMuk3PP3Oj6x+mM8dXnIdCNAYeEK73uFYguwxGrUVmL4+kH6
         dz7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y/g6q0pH";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f11-20020adff44b000000b0032daa524ea6si1065521wrp.827.2023.11.03.03.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y/g6q0pH";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699009023;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RicE5iIE043jU1ebmInnj8acUzF/kHFAP41x3kwHJKE=;
	b=Y/g6q0pHJeoT3auW6IujdKwpbDox0UuOJSPQh8E4svPrOi0iEHQOkKGtBUYpE2cGroET7P
	eIk6byhYNbzjzF2crthWBZaq+eIWmj5pBTrm2ctfgUh6EDMAls9D0q4Hf2/tkgsWwRudwe
	zQdtEHUczseh0ZskW2R8CuHh1UVuwAg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-D2YhiTjIMK6YzqGMIaQneQ-1; Fri, 03 Nov 2023 06:57:02 -0400
X-MC-Unique: D2YhiTjIMK6YzqGMIaQneQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4094e5664a3so12753245e9.0
        for <alex.bennee@linaro.org>; Fri, 03 Nov 2023 03:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699009020; x=1699613820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RicE5iIE043jU1ebmInnj8acUzF/kHFAP41x3kwHJKE=;
        b=UnMnU3KpC+aHQfHrRvoYf6cvcI5tHKSKw2RFZCJt9D0ofvNaKfjPv8Rh5Hj8k13E/b
         FyvVj5Q7pW3GbFybgTnIYyErn/JTj4lIPixyeGdXsT7eQltFf7OAQB93tBwnCMXyLQx/
         o1s8MaSzI/FYHCvU4aK9pFYfYGF3iNbCb/0DjWPFx5X9QbAU77LhRNCC08wqbo5GYbUL
         /0hbnuIqe54w6HQ+tQzY5pA2HfByZQ+1pyqq++R+MN3SkFroHcmeXov33O7YXc/i7AVW
         tznI9yNLfVP6INpuOwtiHrSSkgBjVOaFrf15qEJ0tpgxdwReAK1aoJKXvWq8CHx2yNRV
         hQkQ==
X-Gm-Message-State: AOJu0YzAtvJLkWIcyewDRB4pIreB+hLUYNWfwJWiHsnIrhTUAVDAwe5M
	03obzzP8uJR9axdSzqhKD1NhIpbY3Hkj9zc4Lw88DwNCuqsijwLdxNtcg4P7Ebra+DB4KtG5r13
	7gUMXvvRqJSFYgJJBFQj1Zl8d6SMQnlchvFfU69Nrx3/+GREYUoPG6htyK6yZ+OKaV2HysmU0hs
	OFJOY=
X-Received: by 2002:adf:d1e3:0:b0:32f:7cb7:f66 with SMTP id g3-20020adfd1e3000000b0032f7cb70f66mr18478828wrd.20.1699009020442;
        Fri, 03 Nov 2023 03:57:00 -0700 (PDT)
X-Received: by 2002:adf:d1e3:0:b0:32f:7cb7:f66 with SMTP id g3-20020adfd1e3000000b0032f7cb70f66mr18478797wrd.20.1699009020051;
        Fri, 03 Nov 2023 03:57:00 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d56cd000000b0030647449730sm1560722wrw.74.2023.11.03.03.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 03:56:59 -0700 (PDT)
Message-ID: <5a481c02-d9ef-4c46-bee1-f17dbd387545@redhat.com>
Date: Fri, 3 Nov 2023 11:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: Any plans to implement more ARM SMMUv3 features?
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Simon Veith <sveith@amazon.de>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>,
 Prem Mallappa <prem.mallappa@broadcom.com>,
 Leonardo Garcia <leonardo.garcia@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Nicolin Chen <nicolinc@nvidia.com>
References: <87il6n0zlw.fsf@draig.linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87il6n0zlw.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oLJ75l+etetS

Hi Alex,

On 10/31/23 13:02, Alex Bennée wrote:
> Hi All,
>
> Since 8.1 we enabled the FEAT_RME CPU feature to allow for Arm CCA
> guests to be run under QEMU's Arm emulation. While this is enough for
> pure software guests eventually we would want to support modelling
> systems with "real" hardware. One part of that is updating the SMMU
> emulation to make it RME aware.
>
> The recently published F.a spec is available on the Arm site:
>
>   https://developer.arm.com/documentation/ihi0070/latest/
>
> As we have a keen interest on tracking (and implementing!) Arm features
> we have coded up the various sub-features as stories under an EPIC for
> each level of SMMU feature on our public JIRA:
>
>   https://linaro.atlassian.net/browse/QEMU-533 (SMMUv3.0)
>   https://linaro.atlassian.net/browse/QEMU-553 (SMMUv3.1)
>   https://linaro.atlassian.net/browse/QEMU-558 (SMMUv3.2)
>   https://linaro.atlassian.net/browse/QEMU-566 (SMMUv3.3)
>   
> I think the state of the cards currently represents what has been
> implemented and what is left to do. As you can see it adds up to a fair
> bit of stuff. As a lot of people have been hacking on the SMMU code over
> the last few years I thought it would be useful to reach out and see who
> else is interested in further enhancing the SMMU emulation support?
>
> If anyone has any patches/branches cooking or is intending to implement
> any particular bits please do let me know and I can update the cards to
> reflect the current state of work. As ever we will do our best to help
> review and smooth the up-streaming process for all Arm related feature
> enhancements.

At the moment I have no plan to work on any of those features besides
following "Nested Translation Support for SMMUv3" works ([PATCH v2
00/17] Add Nested Translation Support for SMMUv3
<https://lore.kernel.org/all/cover.1683688960.git.nicolinc@nvidia.com/#r>).
Adding Nicolin in CC by the way.

However I will take some cycles to review patches when they come.

Thanks

Eric
>
> Thanks,
>
