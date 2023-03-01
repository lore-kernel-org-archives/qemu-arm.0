Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6884642ejc;
        Wed, 1 Mar 2023 04:14:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9fB0pM/neOk/Akwooy6OtYF3hlCqjVPoMZiUZ0i4xAxMth9mv1CDdCqt29ouYqjQUtltxY
X-Received: by 2002:a05:6214:528b:b0:56b:edfa:57cc with SMTP id kj11-20020a056214528b00b0056bedfa57ccmr11413060qvb.41.1677672856488;
        Wed, 01 Mar 2023 04:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677672856; cv=none;
        d=google.com; s=arc-20160816;
        b=lHMChbhyvPBBnSjM1tvCGBMmMJ4ozjiOtsuksu0jI538gJXPx/q81r9pJ5Wex3cqxi
         hSeV3XG2Co9oKxYxuWV+dJb1hj3112hsK5t8J4uaksK4HnGfTsPYMMUlJTxeLnT486GL
         FpW3tyZH73y5KaimcC+7pRbMS7pFhzG1jL26e772lrrFSTz4Gg4hn8bGf2y+cOeiuvUy
         838q6iPbne0xoisBifRjvynGH8rO6q2mpxcN65YVPfF/rZY1yxdVNaiaAjKV5UvEJrmU
         x9sppmtaa6UcsxufrZGTWFuZV/U48yqpFoW3AEPLGUt9QwbERC89xZfjU5si2jLxDTNo
         zieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:reply-to:user-agent:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=lv40Kn/Y24+MEtMwfFUGc9IW8P9QonFwfp/VQszCnYw=;
        b=Mp7PtWvwtEGED2QocJLGGvPufPFUu1u/O6+cOWItK1rI3IxyiDSD+YEW5xk50UGmSZ
         UtKG8yGAB0gImMevcXW4v+o/H+yD8c/FEDgF/gKeamg0kmn9/AqtnP9JVT/aPlZdFc9s
         9W4nb0/O92o+OXdVSJ4nwduz4gCOGTXjpsvitQBL5vv0Kg/GpvAF5n+4y31sshDrXutD
         lHQKLEPP6qIfVxACPmg9YJYhbNrrNqEoVQGjS5XuA2qgE3nbb105Atx7Q2R2joKZeD0h
         fdJYQoS5M2DCE1adtf5zGUay+JrUqkAd0Ajx6f5CDm3hPpzztbK7g/w1MOtfWUprgF1w
         rXIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="U3CI/dnv";
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c11-20020a0ca9cb000000b0056e9498ca87si10847466qvb.473.2023.03.01.04.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 04:14:16 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="U3CI/dnv";
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677672856;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=lv40Kn/Y24+MEtMwfFUGc9IW8P9QonFwfp/VQszCnYw=;
	b=U3CI/dnvNq9mgdU5BMdnU1cWpSnU8B22S3EiaOM2IYM5yfrbV0fB25wVf1b6QiGddPhtP6
	xA5FaWPgZSwUxX5oaWIfAIwHNd5lF3jt1Q2Iyo+UeW4dE7VBb3rLqqAtvosRVuZLwsO6jc
	78i1X8ick4BhCuFoa0FYP72Hft2IHGU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-qofcvRXnPHG3SIVpdGGplA-1; Wed, 01 Mar 2023 07:14:14 -0500
X-MC-Unique: qofcvRXnPHG3SIVpdGGplA-1
Received: by mail-wm1-f71.google.com with SMTP id f14-20020a7bcc0e000000b003dd41ad974bso5260442wmh.3
        for <alex.bennee@linaro.org>; Wed, 01 Mar 2023 04:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677672853;
        h=mime-version:message-id:date:reply-to:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lv40Kn/Y24+MEtMwfFUGc9IW8P9QonFwfp/VQszCnYw=;
        b=e/bM1vnGBA6PMGTe1c2xfxT2ojDnbVReyQi6vcTEQTLbINacauyyS3KFc5xH0CZ6xe
         w4Bc9DejHtuU9/p8kYpqpEJjiji8ylpsfmYeU860/pNVy/Y/ET0TShKI5GkwAfsyJg8K
         wzWHfzlpJw8YJuskbTZskL/abRLkiwAP7/Dm8WzP/xBRmDHyKhwiaxGrAqt++mm64Wh1
         1iiQUzkMHpYOpLRKzoSu4vz3yWiLsNXuFO91/JONQIKXhe9ghB3PQwGIU7Hny9IVCKQs
         1/l+H7ashZhsdIKEdX5svwbKs3/ch1Hk9XSKVZGnELpVOxUCHVVpsKznk6uHsOzOvszT
         NXfw==
X-Gm-Message-State: AO0yUKWvRu3Jv8W/dv6Q/U2tDie+oV9L17NTeQW7a4lekRXM3itFm2LZ
	XKlauX99xkijsxtASH+KvJn3JxVJqOXa5tKbS8RE2IO1Nz7smbt1jyZ4HqSFKHdwEH0y9L1t0Ve
	fM0PJivK0riuZxHbg
X-Received: by 2002:adf:ce91:0:b0:2c9:bb03:7843 with SMTP id r17-20020adfce91000000b002c9bb037843mr4527865wrn.69.1677672853626;
        Wed, 01 Mar 2023 04:14:13 -0800 (PST)
X-Received: by 2002:adf:ce91:0:b0:2c9:bb03:7843 with SMTP id r17-20020adfce91000000b002c9bb037843mr4527842wrn.69.1677672853321;
        Wed, 01 Mar 2023 04:14:13 -0800 (PST)
Return-Path: <quintela@redhat.com>
Received: from redhat.com ([47.63.153.28])
        by smtp.gmail.com with ESMTPSA id i2-20020adfdec2000000b002c71dd1109fsm12453879wrn.47.2023.03.01.04.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 04:14:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Richard Henderson <richard.henderson@linaro.org>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Claudio
 Fontana <cfontana@suse.de>,  Eduardo Habkost <ehabkost@redhat.com>,
  Alexander Graf <agraf@csgraf.de>,  Cornelia Huck <cohuck@redhat.com>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Igor Mammedov
 <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <20230228192628.26140-10-farosas@suse.de> (Fabiano Rosas's
	message of "Tue, 28 Feb 2023 16:26:28 -0300")
References: <20230228192628.26140-1-farosas@suse.de>
	<20230228192628.26140-10-farosas@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 01 Mar 2023 13:14:10 +0100
Message-ID: <87a60wk6st.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-TUID: MsELwi5aH8Pb

Fabiano Rosas <farosas@suse.de> wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.

Ouch.

Just curious: why are they needed?

>
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
>
> Fix tests that crash or hang in the above scenario. Do not include any
> test cases if TCG and KVM are missing.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> This currently affects Arm, but will also affect x86 after the xenpvh
> series gets merged. This patch fixes both scenarios.

Reviewed-by: Juan Quintela <quintela@redhat.com>
