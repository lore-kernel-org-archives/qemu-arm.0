Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5138129lfa;
        Tue, 3 Nov 2020 13:10:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfc9H7EqW7e+JHset1BvnFLcKtCQ2w3rlhOXBlFkrZw7oItlUoUScqNs1o5sAXss75RbwF
X-Received: by 2002:a67:cb09:: with SMTP id b9mr19813168vsl.49.1604437831634;
        Tue, 03 Nov 2020 13:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604437831; cv=none;
        d=google.com; s=arc-20160816;
        b=V+53rNyTzyIXmZBj+HVGXKwTtwt6BDIiHGcJz+UwC5BiJlwCPPYZKd/ozRZTjXU4Bh
         MaBChnvL8h3P0g90V20nMlTPF9cf9eGUmARK0EeT7mQSNaAor6ItwDzHND4VgHC/fRFN
         LQVIbodzlL+eBtVT0avMxTYL+gym/mwTaadD1yCJpp7QlRYr+W2Vy4/kQUyFrG7QSau2
         /HPOr117sEZOC4l18+IzenrCIuFYMQbRrYB/YVQOvCOd7jqTgPfhmEJ/uJkkWUz9FwR+
         TB7X0/3DvrbyC8Am/6N34vjWOJn2Q+2ktXZFE1n6192pmkmv28NIwC5qwkQPpSTlG0hb
         OjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=D8J5YnwMiKtuBHs93Jo3559UDGw6HB+5E6SQAuE1UCs=;
        b=d/vP05Gng9H0EpFagzmLBmzyJLfYXGc/nHMQOKL1/joNf5umKVMgcb7myDtmO1sPy/
         OiKq8UvEda4hvby1fE4fOWn53y0iJ/urDhrZ0ayfmkGUfCdiP30C+Oewt8TaOrY0EJIP
         o0SOSCtMDj4iCgvdNzr2VNEAT5CDcj+gBw/+/TjchiVqReFqDvZZx/gu4ZiWhXKzlvB2
         trSKzohVAQ7PmjnTQKJ2QvlpWn4KHM5bQB/DMsCIuCgyhH6pdLGVp3HwaknUu89BOgPl
         4DTXjV5MvSiXR+8aNIcOzZlcT1vYQK1D8k8tz+F05NzQ60tHl/eZY2ctArLah9yD3bJD
         MIhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XUx3YZrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si2604335uad.33.2020.11.03.13.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 13:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XUx3YZrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka3ZX-0007JH-1L
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 16:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ka3ZH-0007IQ-2A
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 16:10:16 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ka3ZE-0003wf-9C
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 16:10:14 -0500
Received: by mail-ed1-x541.google.com with SMTP id ay21so6637229edb.2
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 13:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D8J5YnwMiKtuBHs93Jo3559UDGw6HB+5E6SQAuE1UCs=;
 b=XUx3YZrE9RFHLic3rb8JFbbMbyLfVbM5EelWWaplc4W4dEdYKcf2bYw2kRk7SS3Nbm
 hPVdAdcnsSjeC0kH/6gzY3OY0+JFBIgbQBIsPgGwPnWZSpjnEz7lb4OK4jCXa7TU5iry
 G4HyX5czi7TnTwgqweUMuA3Sov/0Ed0kQhpM5Ga/ECxpYnmOe4ZWc0HQncSM3j9ONVEu
 v6tGpRZh2rJGYUlDYcxafup1wDRq8xTod5gJDL2CD4AtwqpD6vUiGfGQMOxDtjJtlzU6
 wIbQum0hrbThgHUkyV3SAExaCVkC3Cdep5BYzXWPpvSMr2c4VUNoWsFO0KpBz+0ZAv9v
 fk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D8J5YnwMiKtuBHs93Jo3559UDGw6HB+5E6SQAuE1UCs=;
 b=Xo34JiK4GcllPmE3IQPf9VkiIM9khmaMBLkKdOAESr1Vpkh9lBg/Jq5PgvkRVImL2K
 +wKMFgThyJ3AFx49+oQQUL4FZ6l7RWu5rcYTQxMtlP/bMozkL0CK2rxW3bUAHhuggjhL
 yPsauR/1KoGsLSaVtS0QV9a4M64WzPCAZJTFINB0d1WMMkzATojN9g/l2PBHFieS6mZY
 YazoNQQUVlepLnKXZZamb9Eq7qeLFx8cEChd7LlDZgubrqo09zEpm/HluftX3r2xa4n2
 VO6a1Kc5X7ebn1ZcC8BF8IrubfVjgbLN1JjZiUPtprDCWBJP+zNgXYjswAoMsN47hwzr
 8yPw==
X-Gm-Message-State: AOAM532r3U8QSZE5uUmoErAYqRF1Wjy+6iFAznFO6fpPdl+60EMX0JQx
 YeixXxjf1XgL6DJAUJNRdFUnF3hahqxO68TD2ZFHuIJB1Go=
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr13774570edt.100.1604437809093; 
 Tue, 03 Nov 2020 13:10:09 -0800 (PST)
MIME-Version: 1.0
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-9-remi.denis.courmont@huawei.com>
 <d26e76be-9be6-e658-48c7-0f5246508517@linaro.org>
In-Reply-To: <d26e76be-9be6-e658-48c7-0f5246508517@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 21:09:57 +0000
Message-ID: <CAFEAcA-jnWsR_CM1t6DNu09f84m7HTSpfnOiV0DEBFDdP-DQzg@mail.gmail.com>
Subject: Re: [PATCH 09/14] target/arm: add ARMv8.4-SEL2 system registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 remi.denis.courmont@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v3xqsNs49N/3

On Tue, 3 Nov 2020 at 19:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  target/arm/cpu.h    |  2 ++
> >  target/arm/helper.c | 24 ++++++++++++++++++++++++
> >  2 files changed, 26 insertions(+)
>
> These need a new VMStateDescription section in machine.c.

Do they? I think they're handled by the existing generic
migration-of-sysregs code...

thanks
-- PMM
