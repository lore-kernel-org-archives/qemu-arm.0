Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1341803lfq;
        Fri, 18 Sep 2020 02:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy68gd6cgbLUZXloFSkmGkL960T1HQwsPppiR3kg/1TfuFHEAvnCtTGikCxADhhy494MPtR
X-Received: by 2002:a5b:287:: with SMTP id x7mr47326546ybl.144.1600421803137;
        Fri, 18 Sep 2020 02:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600421803; cv=none;
        d=google.com; s=arc-20160816;
        b=osZ0yrVW3OhBd1mC0orZsnbX5tH4pOQtaEFe77IlbNEOanM708DIgY+Im64pSC+xY/
         XcqfYE8hHefeC0eHFz5yQXzSXzQ4/XHmA9LTRnJKOIXIfP/po3Fo953aWWKxj0owxeU9
         TJgZ4QVbWM8yx6+wuWGgXd+fOof1/WmPuGwkqnUBdpwce0S95GZAZVCbVP44R20AQFoE
         U0/8zw8EsaOlV5/NOp00VS3uJlayDeTZauFXMx2I2X4nu2YGmM2oake/irp1x+8hdryE
         QoVLSpt2SQdKdGiTdsxzpYLLJN0m84QVCuU6lkMCFbgmZnFw1hJ7itvdXnCdAjCUdfoh
         WcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PUNhwdZf1A/RPFS6kQ0UIC3lJKcZ6RcgnoeCbvERbY=;
        b=euoLOUdH46pgXbRELTn5k8KPiXEGTW27mSCd7Eu7F92yKHF1XW7zXPweoYdvMh+d0j
         pQrcr6JmXOlQIEn233aY879gsbAttCF7Zo/8H2IuJEEYedZJzR6JYpd/hnKW4rVwi7eK
         01ASykJlRIPFt9OtTPrJ1tCUyzx6lveF2ByjgIvsswwnuYlJkYGnnxiGWmUoiu4NPRTq
         LET1KA2+KvUJc5D9C8IDZSgbv/9s08LAtuLO5FneQXDKn5FFsOSQluFwWX94ZS3LMLwN
         JPCKwyiQrAu8XSINd4C8yQVHTe8RKxdTED2LuAMW65L4yEfXhRPaGi8xAnAsu6WxphzR
         FuYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r4KRS1Jh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si2520139ybn.400.2020.09.18.02.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Sep 2020 02:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r4KRS1Jh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kJCos-0002Hm-Hp
	for alex.bennee@linaro.org; Fri, 18 Sep 2020 05:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kJCna-0001Az-AX
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 05:35:22 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kJCnY-0005w5-24
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 05:35:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id k14so5474256edo.1
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7PUNhwdZf1A/RPFS6kQ0UIC3lJKcZ6RcgnoeCbvERbY=;
 b=r4KRS1Jh2SPQ0MHRFUkWVAD4idR57dZTw9r9+7wCULZ97qtsDYds6q6MyR1nN4np+e
 DM0RMkfMsj5cq7/iTHzlgHlWhQ80EPTA7ceQePQNtHa/ufI8To2sySYuVgLOo/GKr/xE
 OPi9oCaZXdWlgrnosH2ElGOCfu6kcGVuAp3PlswLtgeU0X1MvRKD9uEPflFg5E78xfSG
 PdVuBaji6IA1GfJpoRm7WB4JwhwZqi+LUC3hB0pONvBWm/qsxlzZ0jhGlX5CE2MO1mn0
 uHi00BnCE3oROM2Z7YM0cbDXvsJjMYNHwpMnEHjjgchdmorudxkZJVFOlm2OpxjDGaR4
 2tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7PUNhwdZf1A/RPFS6kQ0UIC3lJKcZ6RcgnoeCbvERbY=;
 b=K5Aydc6afY4hMw8qk2BZTmJFpDlyBZR20ai0T/qGimuiSij734ufZI+cBdBygUDwBI
 mQXyYZVqpLiR71TJcmq1HdhrUopRJ6Jg73ISpZTiEKrl0uMLoXkHCSBvbY6jFSo6VTH/
 Ay9aEQl9NrgaXVfb7PIR4rwFW39evtoSO+kwMHr52qqsmPJgyhaldzrUO3u643Vf5E0g
 83+w2JqwOgHn0197DbVk2GUuClUgTOJdijefQ51sGyTSUvcOgRyOwbPk3h4sB0krfP8l
 4/Z7x02LnHa+hgG8GdIi0cqXhtDhELWJ/WKOPNTjvNSw1AcPe5Ruf/vL6PfpEzbt8FWx
 iCUA==
X-Gm-Message-State: AOAM533mhbMWtK7Z9THGmrhE1y8o7HLfB0eUV/+BWZlJ3TZyzxqOFd4f
 EH/Q8Q7h4x4grny/udGeDUYz6+YB1PYziAz6UJ2X4Q==
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr36692138edw.251.1600421718380; 
 Fri, 18 Sep 2020 02:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200917135323.18022-1-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Sep 2020 10:35:06 +0100
Message-ID: <CAFEAcA_aY-0vZMqHyTfqQPg5u-AbYEWmQuDFEVCrO+hSTvDEBg@mail.gmail.com>
Subject: Re: [PULL 00/21] Microvm 20200917 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /7lmGb6rJOz7

On Thu, 17 Sep 2020 at 14:53, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 8ee612722dc08830761516e761dde934c3753a14:
>
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20200915' into staging (2020-09-16 14:47:50 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/microvm-20200917-pull-request
>
> for you to fetch changes up to 63bcfe7be09787ad6425afcaab5501b53bc26095:
>
>   microvm: enable ramfb (2020-09-17 14:16:19 +0200)
>
> ----------------------------------------------------------------
> microvm: add acpi support
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM
