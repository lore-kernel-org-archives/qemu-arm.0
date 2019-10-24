Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2368785wrq;
        Thu, 24 Oct 2019 06:42:37 -0700 (PDT)
X-Received: by 2002:aca:ab86:: with SMTP id u128mr4819874oie.29.1571924557493;
        Thu, 24 Oct 2019 06:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571924557; cv=none;
        d=google.com; s=arc-20160816;
        b=QQ+PkM0+ccjjiDxbWblosBTuQUOeatSNyoBmGUMop7CztfDXigxE+V9Qitq6zTggEQ
         BwW/NbSg4goXj6iBVRMJqqSlkanjclb6hh+jcbwSssr/ttaWNPP2h5xBaFrVv4S7zHpA
         lXuKyjoTVIDapz2D2ZJsinYNimQQ7VANsdTYH3gnA2d+LFVKNVAkf6QuNyvMCnegT/Ie
         22Md4xEc8pPhEf5FsW1iT5jVWUQDclg5vxYw65dDgAQ3CHp9VwxkusoYJyMlFSV5d2ZS
         D4KsHsImNx24UlgteZykE2wBQ6M05NtEx+EwJe0ddJhb6irWK7vHClIqmQZjULMYAS7y
         yz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CB+2oiFbxh4lSMQlG0CPRGf4bWxa5qmoD5xmiQFW3NM=;
        b=hRKO5ji+ebSKvCcUJF5lp969OqUZ5t1sc9tn+98TqqqV3Wh1jhJKbpjRzGuspU/EEz
         bF4VuPznRlfYBvJlsdkYGEpMV71RZNcflqoizm4+Y1BI82h0Lq82wyZtU2N9di5yyzGs
         lRyOL71qSrBCwijQIlNM+TJyCX4Uy6j/ysHtyyleI12KPo/MsUTR01QlmAxVjyyrdVGs
         k+jx7ziofo88I2jKDkOW0zQi/9WahQuu1ATXJcyE6IieHlbBjX3AegiZ+AGii2zNA2Vp
         wr467FS/afLY0rktSNUeDjZE4OHVj5jR5wUMpBlTv7iEQxarw09opn9hnE4Ss0V78t+P
         E6Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KRjr7LZh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a2sor12505143otq.174.2019.10.24.06.42.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 24 Oct 2019 06:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KRjr7LZh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CB+2oiFbxh4lSMQlG0CPRGf4bWxa5qmoD5xmiQFW3NM=;
        b=KRjr7LZhZ3xQVBJmnk74lxWhxgchqIZXDFOBUZ4r+GaYd6gCXgf6nPEkp192Q9Vx1s
         0tzO8pLrrbO9D1ByOyW2OcRY4I2oFjaClTt8yJB0i1DL4v29GVkecDt+xiCVpnoeweLF
         1w7G8JWWPFsyysBhr3QI+IQXXS5Pk44e+SdKvkMxHy7/QGwLRqGFWxAyh+OgU2dzMIfx
         JYe6RJwYXBXZ88ZJGmMq+rib3kb4dXSLLA7qJgVb/cRDEkDrMfC++HSlgYKWnOSe0/7G
         SDDrCnDDWXS2t1zyHgj0MG66YY2YC7QpH9pwFnwqwA6uaS9xR+ez+RcquGcFZHgma5Hc
         wdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CB+2oiFbxh4lSMQlG0CPRGf4bWxa5qmoD5xmiQFW3NM=;
        b=ULLvHHBbwQp5TeHmKuVbJfwG+APA1oCHFGS/pcnBpkJTJlUN4rZ56e+wMn6h8Q6tFm
         B13QlLXRwmq4hyq4G9e8WLU3SQv31GS5jnuk5WA3nZhV+1mP5UBbPYRW8IegFtCG3toO
         GKHvnDrjXAgHGqdwJx7/wtjdQAqmm4L6/7x9if3NXkE+1pGP1RBmTIgufU6NdIEM0Iem
         MuoYUlCA9fQdc128b5DwhgmU4HBgei86qLBQ3MLjVS/mUMEWXRQqk9fUmuB0PRiKikAI
         FCU/wK3eJedATZp3PaH1X3qf94MN1aue35M5uNKA7TpGLCKJ0fCrzVuf4E83g4iPMmtk
         Qd5g==
X-Gm-Message-State: APjAAAU0Amoy2v1W0EDJ0nxaIY1kRQ2nwAakEJYANDTstvBNfd2aTSvj
	wPrwBLxkaovX4g9BY+4Q7ak6D/zAjJCV+ANndfs5LGl8
X-Google-Smtp-Source: APXvYqzVbdw0wum9mFXZ6RXQ2LWQNQ+bvYqE3mpbTXd9JXDR7Y+0mF6EjROoE54s9vTawNilbLB9rxTSkee9pSsiAQ4=
X-Received: by 2002:a9d:398a:: with SMTP id y10mr11136759otb.97.1571924556987;
 Thu, 24 Oct 2019 06:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191024121808.9612-1-drjones@redhat.com>
In-Reply-To: <20191024121808.9612-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 14:42:25 +0100
Message-ID: <CAFEAcA9ehcuktCTGR0xpTvZegUkr99H62F_fiT7RY_L_dqgN4g@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Eric Auger <eric.auger@redhat.com>, 
	Beata Michalska <beata.michalska@linaro.org>, m.mizuma@jp.fujitsu.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>, Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 0t+O1nsq9y1B

On Thu, 24 Oct 2019 at 13:18, Andrew Jones <drjones@redhat.com> wrote:
>
> Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
> This series provides the QEMU bits for that enablement. First, we
> select existing CPU properties representing features we want to
> advertise in addition to the SVE vector lengths and prepare
> them for a qmp query. Then we introduce the qmp query, applying
> it immediately to those selected features. We also document ARM CPU
> features at this time. We next add a qtest for the selected CPU
> features that uses the qmp query for its tests - and we continue to
> add tests as we add CPU features with the following patches. So then,
> once we have the support we need for CPU feature querying and testing,
> we add our first SVE CPU feature property, 'sve', which just allows
> SVE to be completely enabled/disabled. Following that feature property,
> we add all 16 vector length properties along with the input validation
> they need and tests to prove the validation works. At this point the
> SVE features are still only for TCG, so we provide some patches to
> prepare for KVM and then a patch that allows the 'max' CPU type to
> enable SVE with KVM, but at first without vector length properties.
> After a bit more preparation we add the SVE vector length properties
> to the KVM-enabled 'max' CPU type along with the additional input
> validation and tests that that needs.  Finally we allow the 'host'
> CPU type to also enjoy these properties by simply sharing them with it.
>



Applied to target-arm.next, thanks.

-- PMM
