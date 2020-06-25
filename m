Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1374615lfm;
        Thu, 25 Jun 2020 07:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk87uM7fRUPHIvEMaV2zqQ2L2onKylqp0avuDlTj/aJPLlkyhZIXB1TniZenPBMGrKAk3W
X-Received: by 2002:a25:24cb:: with SMTP id k194mr4602943ybk.81.1593096923584;
        Thu, 25 Jun 2020 07:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593096923; cv=none;
        d=google.com; s=arc-20160816;
        b=n6wa52fB6qtHZS/duWe87dqJlql2HdDNO/0WF+b7mm6GepvKOHl7UQeXYfjf0Q2ExV
         bDF7QomS7Wi4VXyUEakaGvJ2GEGoDIMkmvnyPWQLIqEmBB97k0JKfwF9lQNjNFNX9twP
         z7muVOEFCrwD95FJ5O//mzsmUwYnyeZOnwwlZDcf61KwGJqksynhMEBNG/d1o/tiFlll
         Hvthj2agSWy5gxx3QhtXFYy2X63xY7mcZYFBPHIkFBktmjEGwJcWKgrkPvvnVvj3ieB/
         0oCqHsNbrygwOMF+8URz3q2Oj9cCMsZpHN5GRr5mxowjp9NOHHiUQZ93gqEkbbEYhYWT
         PV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egOabnArhNxaatNsxWYSo38vue+qriICqGnIknScYLM=;
        b=dd47hIBz7ht6EnP4lx4nbrFfdAWIJRMA2ZQ8Q0zjJCxUjQ3Pc4lH3yDRzehVctIAB9
         cz2pAtuyWH+MCxoPHiizFSMxkEl/D955CufJOaKCIrV9K88fRDA7aE7kZW40GAjEQRhB
         P7K8IV0fCIibKzwteI3qo/xI+gRYLDOzLZs1BtSnXftUU4lNz29cnOs2eoccQ9Mk38Y2
         VcA3VMTh/tLgWpzwaHJDcikwCfZcEIGcWutg2xzvlh8zKvHFStuicCKnw4065nSMLTW0
         sEHtdCXcoO0Hi0wNkxK58dhJG/Rf2/RWS/PSAvfeFnp6VlrvV0kfN5hRT87XdYiaJsV/
         s1Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=awyORTc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e187si23956088ybf.249.2020.06.25.07.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 07:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=awyORTc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joTHe-0004PP-VU
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 10:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTHV-0004M1-Tl
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 10:55:13 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTHT-0005Jz-G4
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 10:55:13 -0400
Received: by mail-ot1-x342.google.com with SMTP id 64so5505888oti.5
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=egOabnArhNxaatNsxWYSo38vue+qriICqGnIknScYLM=;
 b=awyORTc2yKwX1g3nHiuqDZU/0RIN5i8JycyrnVa9DKlOoa7QHBEYcW0HHlDD/u2dLd
 1afUIl5yXS/N/iWIS/h8XV44jZtekts+qH0ky16FwPIcCttn/rAWT6hG0dhisPRr7/J7
 Onxfliff4bZEAX2KJFxG0zq54QZQpXJxf5xEJ0iECpBUJS9fq0S6pUMJBhjFViSqDkK0
 ffr6cPNzeM3jvUt82nFkSdtHwHS5lsnvLnl2mMuB8eL/egK4i5NOTEEq8AprkEnUhEGd
 AHsijaNxm2rls+iB+oL0LniK5FvVuLhhO2EcrXsU87aWy0PL53mH/j7HL3DD82I5Ux9D
 eJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=egOabnArhNxaatNsxWYSo38vue+qriICqGnIknScYLM=;
 b=UrAg80qHK/CVi0vJj1ouFOqX7VNpcZcDnuAcoJDJ3YxwL8fCbXnMBrhcPOSx8oKdQs
 LtSKormqpN9hPPFjZIBoTUIhcLg8HEwKwweQ2HI9Uogr3k0+5iO1WX1LtKtmmSxoarh/
 SCs70+TxM/lQ/EWbATuo/mE0MtUo+yt9StbMzOE3eAHBbPbycYlfohKH+uFbL3c8KeZq
 32y/o+raAFMT2bpfBG5pOOuFACi8Vah8M6nNFh86X5BmhsxXrQh+eA/QlB2lv/LdeZNj
 lws1fanQp/+Gnp4njwh8t03e/hutsE2/03GLd5UgoYyPhaOWiNDEsBYWP4UfJs9KPGvQ
 4jsA==
X-Gm-Message-State: AOAM533GrnsCNWot/PAbvbpw0HO6mENGetB6q8MCu8s1Yu3mrKAdFWCk
 uqoyiRjlF3ZxAcKWI62tNgvePdihtg/n2XVKQFrHDg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr25872905otn.221.1593096909988; 
 Thu, 25 Jun 2020 07:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-3-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 15:54:59 +0100
Message-ID: <CAFEAcA_AkshYzrqZ1O008UuTMj-q7Zd9he99ouqSTVk6tbWD7w@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/9] hw/arm/smmu-common: Add IOTLB helpers
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9OMaeyaaOOqv

On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Add two helpers to lookup for a given IOTLB entry and
> an one. We also more the tracing there.

Missing word between "an" and "one" ? Is "more" a typo
for "move" ?

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
