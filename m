Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp20203ejo;
        Thu, 4 Jan 2024 03:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFISVtdb6mhnZaLOULehyi5cKk3RjucJuZUN94MIyoMchxgDOhS2r8PPAArppLoWThZIFc
X-Received: by 2002:a05:6808:191b:b0:3bc:1edb:1ee8 with SMTP id bf27-20020a056808191b00b003bc1edb1ee8mr513418oib.55.1704368195799;
        Thu, 04 Jan 2024 03:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704368195; cv=none;
        d=google.com; s=arc-20160816;
        b=UKgebWKyljFiVMJxWHwGjhP0jfP4ZaXa/+PF/xmKTwENYUjVRJTaNzmaJGAmBVHjMd
         Z+WUMWfZQwDYE5SJDz7dzDljL+k48/Oxk3S7C29fhDKBDyVJ20xprFWQ38KQpvbcIfKp
         uLPf5VYk70m6GHC1wHThV4EfEC+LzRwdkZi/8dcSiXpcqXJ+PmHrz3jR688Qbci/kCyt
         1fLxqebGAWedc6ywpQj58+M0mqOauLSQOZ/OnGMC+2qGTSp2d3DpMNpqoDuFmyxtid34
         sRVOaJ32S9ghIYBz530MTsUsoOFVpCnRF4iRQbu/fOp0w/JLrgSZW1Gi7RQTVjXm+9a4
         4VkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JiqQFbCtgVfu5KxzxBNsgCQ4UrsbDGzvfy3R3hTLeQg=;
        fh=0roCnE68VTjeaqD7vmkgCjO2ZabnBkjskiEy4oqcjws=;
        b=AwllOEEwxzI8iGhiIwUDWlVHxuWEaNqA+SDD7Wx21UmVVDEjVL8E6MFnDAJoSXBfnc
         szlZtUIp+T4OXWlg81NhktKY/Z2wXhvTVi4gMdLN6D++57y3il6eUMxzOuuR1pp66EuZ
         p1CcVi8tZ6NNY8YHBjfAxzdhInb1E/NYARvNgF124mpcMdHE5kt/gZVeZQg0fYfu4GPQ
         wwolak9DCSpYoDuLADbLEjS+KIIv2dW+3w1Ezx478iBYtK6KjKOivBvZvCPLSYy3Cb3C
         hemqlQBVlj+PheeXPg19KCPL3vnLniiz8MS0vEZt5tr89JE0wdECMoqSICVEzcRUNWhr
         pNsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rmqSPoPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq36-20020a05620a46a400b00777731bf89csi32768303qkb.150.2024.01.04.03.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 03:36:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rmqSPoPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLM1Q-00018L-SW; Thu, 04 Jan 2024 06:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLM1N-000149-7D
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 06:36:22 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLM1L-0006ZY-Gy
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 06:36:20 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso536135a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 03:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704368178; x=1704972978; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JiqQFbCtgVfu5KxzxBNsgCQ4UrsbDGzvfy3R3hTLeQg=;
 b=rmqSPoPTAqbKJIFwDC5MgkYMr/iwgOWVqoV4cozO5YUAONRpt8QlzG6KhO8kaJH/O1
 QqOygdjNt0tYgvZtdysj8xMBcbjTQwxZED+Nw9uOkKF7dP39im8CQLAQ1pJng6eXdr3j
 BX52wiLEDitPCD1CbeNXwXwvMjK3WL1aLkPyyOD2Jrt+llfrna5PDh0F2mQtr+RQryxJ
 7VczhvjCQQVfcBmaJKSsndPG4WPN/ldfnkuS56cWrEWMUlkqxmb3PX97giHupeqSfFNW
 Np11q4eOvpcGWFOSY2Q5AgXUgn0FMQ8DB8W4mD5w1jn4AwxT75WV3xC+XJ9OoGuCQY1v
 gZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704368178; x=1704972978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JiqQFbCtgVfu5KxzxBNsgCQ4UrsbDGzvfy3R3hTLeQg=;
 b=eInUYKhYFKry/FOr5sLQsl/r7JCeoXCzyub4qOX4MJ/wH9zKiEnJxn1UlW6JOPQvC6
 PEj4wJbQN0cSncLBMGBRiJnsxlDKgrzxnZtcj1RiMeJiS3PA9s9QoAG9GDlEvBmhs5A0
 U2+OuYTI4tuO0Y++TezgpDpx6Hqhk+LE48RVu0ROWGevKQxiAl9dDvyNztS0p1GXxbQE
 bQdjEh5KQdbg5+jkPNCa70Auam8LJA3ZZh6gjZLAbQ4LMhvVySyFQ07r4v/zqugTZp1Q
 HMboOPJlJ9jXHcfLyF3f5EZBmFMp+sYy6Ug7JNIlh1WGwDQc6bVCyoXugcJNZzgkBYYv
 GdHw==
X-Gm-Message-State: AOJu0YyF7lEONcMAZKGrOUq1om/lDAh64nCHTKCenIXjbucijTQhXeTu
 oUbyXWOYeuZ0QRkfAeyRFhsRDd0DqHLALGwKXmO2RflFoyOD2w==
X-Received: by 2002:a50:ab5a:0:b0:553:83ca:60c5 with SMTP id
 t26-20020a50ab5a000000b0055383ca60c5mr189382edc.3.1704368177873; Thu, 04 Jan
 2024 03:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-22-peter.maydell@linaro.org>
 <b411a3d8-9ae9-4f99-8a5f-4b3f29b10bce@linaro.org>
In-Reply-To: <b411a3d8-9ae9-4f99-8a5f-4b3f29b10bce@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jan 2024 11:36:06 +0000
Message-ID: <CAFEAcA-9-EnybYA-hZ=kzeauRFcS6eB9VDD8DSGqUiN=9NZprg@mail.gmail.com>
Subject: Re: [PATCH 21/35] target/arm: Add FEAT_NV to max, neoverse-n2,
 neoverse-v1 CPUs
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vwkX0+sSjbyg

On Fri, 29 Dec 2023 at 11:37, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 18.12.2023 o 12:32, Peter Maydell pisze:
>
> > Enable FEAT_NV on the 'max' CPU, and stop filtering it out for the
> > Neoverse N2 and Neoverse V1 CPUs.  We continue to downgrade FEAT_NV2
> > support to FEAT_NV for the latter two CPU types.
>
> According to Neoverse-V1 TRM r1p2 it has FEAT_NV2. Similar with Neoverse-N2.

I'm not sure what you're trying to say here ? Yes, the V1 has
NV2, that's why we have to downgrade it to FEAT_NV for the moment
when we're emulating, because at this point in the series we
don't have FEAT_NV2 emulation. At the end of the series this downgrade
goes away, because at that point we can emulate FEAT_NV2.

>
> You wrote already:
>
> > in practice hypervisors such as KVM are going to require FEAT_NV2
> > and not bother to support the FEAT_NV-only case, so I have
> > implemented them one after the other in this single patchset.
> So maybe they both should be FEAT_NV2 and FEAT_NV will be left unused.
> Or enable FEAT_NV for V1 (as being older) and FEAT_NV2 on N2.

As usual, we emulate what the actual hardware has, to the extent
that we are able to. For both of these CPUs that's both FEAT_NV
and FEAT_NV2, and we enable emulation of each at the point in the
series when we've implemented it.

> This way if someone wants to test nested virtualization then both
> versions will be available without use of 'max' cpu.

In theory it might be nice to be able to emulate a pure FEAT_NV
CPU, but in practice I don't expect anybody to want to do that.
If anybody has a real use case for it we can add a -cpu suboption
later.

thanks
-- PMM
