Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3701687lfk;
        Mon, 29 Nov 2021 05:29:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC3hNEvYpv4xyhlyHHqLwsaNLC/kuCQqYVMQUfuzZt9w+4rfAeriK7/Y2Xl3TtErUx8ytt
X-Received: by 2002:a05:622a:1495:: with SMTP id t21mr43860471qtx.152.1638192573945;
        Mon, 29 Nov 2021 05:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638192573; cv=none;
        d=google.com; s=arc-20160816;
        b=zHTUCNaQThurpPpCLVRqJ2kDwrFRO0WIWRgZnxkPz60mhTT9YTjqHcegfQ5IT0tsRO
         4xLUolQn8jxOtSn5tMEHV8QzaxmbJ+Mr3EwUoN/zH9arjn7jP7B6K/DlU7n8SdtW3d9J
         7kERDnfe9gV1js24aP50xWYDs545froR8IPnoDn8sQeO5QP6AQUsXEl1+el+pWmCyyMu
         j4+LRrKeLPQGVbf0ZwXueZaRSWXFEf8F8eIbnMV8rXgNzF06p7UChKVjIauOzZlUhReB
         dCOAnO4xcRDEFo3wB8DlMfRu5vf67KNM7XeJ9Zh+xae7Prx0dn2dSKt14Dek4VMDIS0h
         gSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=am/rBPgdiqjACXbdhmAI6DImIEUyhaAKNXARnrWXYok=;
        b=qFJeVSeBl9Pk7D0o1UktH/Ewa2/jVzlB+7CASPHNA7AHpdvDXFLLeshfMIdjfbfmey
         tSolKoJpC0YwymFGJLJCXeMEUtm9DWkA0ZJdz5YSGaempTfjCu9rxlfALapvIpT1Hr3T
         9D9RU6Ggcgc82rQsD0dSSw4p9u7GjUaiaexDNQtdYKWbMPQeC2lIwMvZA0Y1ZsNoE+nZ
         2FYaU1CT/kH+5Y1/JSvmihTO+JY6hLBhfMZ5eTt6iwPLT/BGbUOpjwvn7qRPDg15tARr
         6l6lcqWr3+rOqxf1Ffnc38u0xJhpF6tKMjX/jKIUSn0mE3RM1kShobyvBZRJot4NazYj
         +AXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Rwpv8//d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si14604240qtb.65.2021.11.29.05.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 05:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Rwpv8//d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrgir-0005I9-Be
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 08:29:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgcd-00060o-Uy
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:23:09 -0500
Received: from [2a00:1450:4864:20::42b] (port=34341
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgcb-0006Rv-Uw
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:23:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j3so36804292wrp.1
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 05:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=am/rBPgdiqjACXbdhmAI6DImIEUyhaAKNXARnrWXYok=;
 b=Rwpv8//dPHzD0FOZ5fN+TQF+Z2gXNdW1km6J/L2MbRespAcNxYpCLDfnI01YUY5/YJ
 ZHGNFSlZ+r+qfIU54GJBarEwgQNjZJ6j4VM4IPXa0KVuxV1c7kfhRSq6HC00V8dqod8e
 w5xa8fhIAs8GuB5aApTJkWpp3uLfBd65XwYokzNBgMc+V8gnZDXgT9gx/AHFpLS1OKxi
 AoJ8PrvrkiRH5t/VvoKAyL4h4KhlztE5mpltjHJ2YuNL9EkDpO1UXoKV5Qf1yMOq2+D7
 s+R5HEEONDuPrh+HJC8VV7b/+35l+7W0M3zXQwFZCo9fUayUHAu2yr3phCk1rEVDP+o3
 QWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=am/rBPgdiqjACXbdhmAI6DImIEUyhaAKNXARnrWXYok=;
 b=TWNN7/iOV7Kxw//6EmqRmrjq2H16nyWrojG3v3iIy4zSDgcbcQK7bWG4Tl9rsBBMos
 upGdh22hs+tz3JhXdjKzktppHeJD/jibEdM8jgMBhk22yNhrKNif5+E+waPuQsb2oq5V
 5yyjlBhj6G/+GnaJjvwvLmTAY8iatwHlwl3OGp2Bu4QV38WHpthbNetsY0oLveQdNJuo
 QBF/2co0s96rbmCGdE4RU0nbcyde36mn65WFzgA4p6kw/M4h8XrBg8IpjKwD6MqxoJnE
 yeTmV8KK8rItjSK2Wxupc8XjDLA0a7AchczZGI2syp0JN5poDRk2LvishKPxealkExmR
 /BvQ==
X-Gm-Message-State: AOAM533s3umx9OHSkCfqair04OISBPeb4sbbhPavPuiYgbsVrLGE+puJ
 hXh1jWTTz6gn9MFkTL8Gedu4ROQCQiU8q1Hv+sr2/Q==
X-Received: by 2002:adf:ef42:: with SMTP id c2mr32987086wrp.528.1638192182402; 
 Mon, 29 Nov 2021 05:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-7-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-7-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:22:51 +0000
Message-ID: <CAFEAcA9kFEWFdL2TnPPY8Z0aFmKx4miSGqxLBxq6ix6DAVamJQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/arm/mcimx6ul-evk: Replace drive_get_next() by
 drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kdTLEfUu4fbC

On Wed, 17 Nov 2021 at 16:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Machine "mcimx6ul-evk" connects backends with drive_get_next() in a
> counting loop.  Change it to use drive_get() directly.  This makes the
> unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
