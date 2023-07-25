Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2336382ejb;
        Mon, 24 Jul 2023 21:04:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGe/3FDcmvweXfVSFq3P3qBgy9hB38taAcqOV8JWatjAiPH1QKJRETzfUJkeUMTmF5bdPmQ
X-Received: by 2002:a05:620a:2903:b0:767:2736:ecd4 with SMTP id m3-20020a05620a290300b007672736ecd4mr2027074qkp.47.1690257870364;
        Mon, 24 Jul 2023 21:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690257870; cv=none;
        d=google.com; s=arc-20160816;
        b=wjdj/SoBhL4ftR/8Xdwuvn7SWg+IRwVK52xgzRKNJgLYOGK7y/3mU4HXOt/RUPIjNo
         PKUaeZVuntXEWxT+VpV2+YuTNwCz+MZ81Io2qpOC8MKsGSr4NGnVMp99Yb2Tdv5HKkLy
         jcg0Ww9+/kkAU+eTdV2LXfU354aT9tXPLA0s1bM16Triwuy1sT3XaGsEyIkK4iLM4t0X
         o+UhA/XolCfYD8Z5ZNLyvtDoTHXMXMYlFEUQm9rhkasx1FC5UHmwVSMQr1hBdti2rE9N
         TcfGIufPamWzpWYFwGYPp/rdubVIjnQkTF2uFqwk3o1zjwG/uUl4h3Mxzos0GSTZUNfB
         SRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=FzHkezrXUwtNFiOep8NQSkIG/L/SpnpJvatf25VRcOQ=;
        fh=uvGlSLfcSt9vnSvrMWc6y0Q6mWiTDHJnOxMsFuBeqTg=;
        b=o/kTIip5s0ICaTXtZpyCIYurKI9ltUY/cm9Fu+U+p+KNUMdS+Sp83rCrM2FHvhk/ky
         ax6hxQzbwz4JyFU30bmenfWiHb5Z0OgvHqPXhjwc+VNfD60RyUgwR1Dc4BP92MLw2UAv
         MmmSY4XYdcPjpms3GgdzvKE5492Go6acdlrHSNPAx6iuB17LRGAAUIVRTwkNMZlwK6XE
         vy8rD8a2tSZiRN23jRYuDXGzAKWtHeNXLfgN6HZaheiKnY6UzvsF8KDxOjf7zTnXumMs
         jMinE3YsnH2PgGQUX6Jxq9UUtnMJxcq5x1B6XC2gXXuLitmJLf5hu8YgePphepX1UiXG
         rRcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=CNtnRQOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az35-20020a05620a172300b007683d78ce4fsi5923598qkb.390.2023.07.24.21.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 21:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=CNtnRQOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qO9H3-0005GD-PI; Tue, 25 Jul 2023 00:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qO9H2-0005Fn-E3
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 00:03:48 -0400
Received: from mail-4323.proton.ch ([185.70.43.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qO9H0-0008Ku-6T
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 00:03:48 -0400
Date: Tue, 25 Jul 2023 04:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690257822; x=1690517022;
 bh=FzHkezrXUwtNFiOep8NQSkIG/L/SpnpJvatf25VRcOQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CNtnRQOHfOhOG/FvG7lVTImOnAdEvEQbqV6emLMlsyH2RBCRG/HHdlSXQzH4lqO5M
 eNCP1MS/DUH44NNBwTaBCLpm9Wn7CutA2v8Px5dI7TdYx/5A5Cz0jFVJ9SIWWVpvNt
 f/BSACUkvJYi8m2om9ZQ2xI8B4KsmKUig10rib3CrO+Edz1AJh1NVdyOvCq/vVBOSG
 uwmJNttUTgFJaEolYMGHNXtzAzua23SxLhVJcPnjt4rcYgqSIoBCJ9t7rBC5Io1ubd
 DPCbs0Ato0k72wjXuB3AGelXbfQ7Kba53b0xztMzDnLdgsDG484iUZ64S3QoTyUIIo
 j88t1TX+YXpog==
To: Peter Maydell <peter.maydell@linaro.org>
From: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: Re: [PATCH 5/6] qtest: irq_intercept_[out/in]: return FAIL if no
 intercepts are installed
Message-ID: <xu8BRMMwZ-YDUONRpB3ezRZBQSdPJ8KybNIsTf-ciNUp8r2WpuuOcuz9BorqrvG-DBFMmLTAX5rKaAYLtTOHP4YgCU-GQUffQOzpMkE-byI=@laplante.io>
In-Reply-To: <CAFEAcA_kfDP_RpQB=_u46tH6C0pSeB=crv2cBgfrCjLCbWmGBA@mail.gmail.com>
References: <20230714232659.76434-1-chris@laplante.io>
 <20230714232659.76434-6-chris@laplante.io>
 <CAFEAcA_kfDP_RpQB=_u46tH6C0pSeB=crv2cBgfrCjLCbWmGBA@mail.gmail.com>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.23; envelope-from=chris@laplante.io;
 helo=mail-4323.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0CUOkAls+MPt


> Makes sense. Did you do a 'make check' on an
> all-targets-enabled build just to confirm we haven't
> accidentally let any bogus uses of the command in while
> it was returning OK for these cases?
>=20
> Reviewed-by: Peter Maydell peter.maydell@linaro.org

Yes, I just did a 'make check' and got:

Ok:                 737=20
Expected Fail:      0  =20
Fail:               0  =20
Unexpected Pass:    0  =20
Skipped:            71 =20
Timeout:            0  =20

Thanks,
Chris
