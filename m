Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3510524lfq;
        Tue, 22 Feb 2022 05:16:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBOM2EX7Ek0x6UBu3nOQMeMlmmEz2ga09PlYPmtjZFsx2OB3gQkVTr31gLqgupSLWMq0aA
X-Received: by 2002:a05:622a:1206:b0:2de:6fa4:41fb with SMTP id y6-20020a05622a120600b002de6fa441fbmr116487qtx.295.1645535792195;
        Tue, 22 Feb 2022 05:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645535792; cv=none;
        d=google.com; s=arc-20160816;
        b=WpOYRs25HgZV2dXjqU9hPMm7CmaADE95OG2ibZSqzOVO+cowEf5M85DGbEO88lARaw
         AbpevmupI4bFRMY7lVvtX7+CcNl89KSdmGJ1ewmxR9Wj1tueBLN/Snk2z1sRpqR4LPom
         C3V4arhpdkknLULgMszOiPCgRJZras/OFJommN4i2/7MJm+uklkbgzyyfgXccBG/15sW
         eroE1MBL0bk0RqYjnHzX3uvF90Lb4+4edUL2zb9h4cMzRvwtKBWt8ewHqUxYiY0E+cGa
         X2jTz5DjJ5oSf4VL65YTf610x/Q/77MSU7pjYnbJWKuL1tZqf3Vj2fdaOkUMZ7MUir5p
         dN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Xr1h3zvISWjGsocXLvU64IU/Uu4YnNdWwlFS8pdh7b0=;
        b=UsiXqJQ7FG2JWLtKl7bvBwpgiQ8IXPfE21Ec8heVQS3eQZQi2qUrlE6vdFfFTU3lnQ
         QYNRLhPKmo+GgVVuhqba/avb6TrrrB1Lj4EXn2KK/KfObrw52uC8lCliu4t3RDGFPvLK
         Up8SDhvD1jzWqKYraxrN0naAZaSQLWSqFaPd4GQwjtxBfB8jTcR4WSaSICs5h7OaMsE5
         cXvSyZco+m048KXO/k4ffg8u36uT54+gNo2sqFTaLlZc5fh3mR+eEqSsrwOVWhb/b8sH
         AEjnUAqxbCPHi91ny4YN88f+qQWwMNijaXuVbHElm00NSvRKQpl2X1OwI9JjSm43JDYi
         B70Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dNvc6aKt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f184si6955177qke.708.2022.02.22.05.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 05:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dNvc6aKt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMV1q-0006EG-LY
	for alex.bennee@linaro.org; Tue, 22 Feb 2022 08:16:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMUs8-0001RW-Tw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:06:28 -0500
Received: from [2607:f8b0:4864:20::112b] (port=45502
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMUs3-0002uK-CT
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:06:28 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d641c31776so172777307b3.12
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 05:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xr1h3zvISWjGsocXLvU64IU/Uu4YnNdWwlFS8pdh7b0=;
 b=dNvc6aKtVI6VAcDt2xpvwcYEmPTLXOSovhkNFyt6aaPK9U3/ENT+/dOue0+j75FpZg
 367Bna9kICOOCXhPo0m3xQOoqrxaZWt6RoSrAoe+4vSlemLbjJvrz9mOyhc+XVjTli8v
 d8A1S0bZEb3eNWegqfdaCp75MhHvD1u3mPbuS6P6QekzBNeVek6UjDo0A76ZrTYgfRz8
 Ec1Hrt0u/YmvLxEGICJpJ8eQ3HKJFHTy2kOLzaqj7snO/X7HGDLYHyiFvIDwAYuwbmrg
 gUzGwIW17UPU8TkAACi5x33SO/0EG518DFcPA0+54BDDyIYLgeP5kKy1Ien9YLKmmZJV
 PVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xr1h3zvISWjGsocXLvU64IU/Uu4YnNdWwlFS8pdh7b0=;
 b=NFZoLWC8XGWLMhSNxzJgChCmWxjdYsLi5WAaOeVa7fsEUr7qkCwk2oMQHXyvKmZNaw
 1iGg5sPB/q2CEUBNy7lzfY3B7OutFsnA+EZwnp7Hmhr0VuZGNYVgEzSGkNdh4J/nqXaN
 3yeAzO+2VRtl6tafpBiM2bYemTBOUqD4hI/V7BXkTv7R/O0CLmo+Q7f1sMlPvQ85CLRT
 3aAWe2otAbhe1IyjXAZp3NkQkFdGYeWbpgwyMnA7/3O9E/foYItoITzKArTPCspRdcc3
 G0Y1il/ORSFJUCOz47rHUapUBooNoZCjGTEmxmPJp8MN5ERc+6hs1EkhAgcGIyni+/IV
 9LAw==
X-Gm-Message-State: AOAM530BuYAjeBgiuxzPwb5zB6BtPwIwNCwk7lWv85A8enOiWn9JTbbz
 DybDQ671Ko8h/s9cI9whcu3lkIJe4XmdE3ucf21qOA==
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr24103994ywh.329.1645535180769; Tue, 22
 Feb 2022 05:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org> <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
In-Reply-To: <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 13:06:09 +0000
Message-ID: <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U38JuaMzNZZh

On Tue, 22 Feb 2022 at 12:56, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> On 22/2/22 13:02, Markus Armbruster wrote:
> > Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
> > the RTC supports the event).  What if there's more than one RTC?
>
> w.r.t. RTC, a machine having multiple RTC devices is silly...

I don't think we have any examples in the tree currently, but
I bet real hardware like that does exist: the most plausible
thing would be a board where there's an RTC built into the SoC
but the board designers put an external RTC on the board (perhaps
because it was better/more accurate/easier to make battery-backed).

In fact, here's an old bug report from a user trying to get
their Debian system to use the battery-backed RTC as the
"real" one rather than the non-battery-backed RTC device
that's also part of the arm board they're using:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D785445

-- PMM
