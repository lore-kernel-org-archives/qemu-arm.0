Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp245936lfb;
        Mon, 4 May 2020 02:29:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7mwcD+PRKG6e2KDkwHalSp/6rctVmRoBzaEIl3SCra2IS0RSLoByFO2OVvCj6VIVfQwML
X-Received: by 2002:a37:8a87:: with SMTP id m129mr15723526qkd.250.1588584578842;
        Mon, 04 May 2020 02:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588584578; cv=none;
        d=google.com; s=arc-20160816;
        b=HsQBGGycF3vAj61s5FhPCiId42irpZwzbmdmTE+LBF9mk56o0fhuj6A915c4RszUYL
         aPotVRH9t7ndHr7oQ6zb3lxHodRpj4KJqgm6InAYDghcFiX4svxuNpdqHkxF+PGzsAfm
         j7e2MsKcneByv300cfTnYQwnMRAYbqxtJ9qD8F5LdH2ly+dWPFPxyUEv+i3hp2t6wT8l
         d4vIhcH9GkvgW0QU1RzubXmDbGurtob5NkD6+6ffbtvIODqErWRm/ZZFclA/+6VUVm5p
         iQrSNJ9Kbldzh8sz+ffoPDwgQO4ygDK5R7HRzihEw8ivVcnUIHkDwGnUFGUVElZEtT0g
         Azcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VE4WTDSHDNzlvovKwmVzZYoV0fgIme54I3r+hO9nD9c=;
        b=o8UlYUewh3Faui+lryfZNSi3+vc73i82BNlKZA5JcZE5jAvSAiFjL46lVXzKoa9b3V
         NkmUf5Reac5So3kVd/2/1pQhzzyFVuJWxr/G72gsofpNaUxKFQRA9caOP218njGFqPat
         bBu8hnOglqG46ipo7yyNwOiev/fKg7K5toraPZ76+LpJQ9QxaEDfr0wJi5KS1cbEjU3L
         kNhECWENRZtTiREqD40s80hs0a7nWyxiWzERYPtHln99AhKxrfFEBfm0fEYqjQhp3peC
         ubDIRNwocOSEY2uLtFcOpKBQIQAm3bPPR+zcAljeLmd9X9at9FLdJVWyrVLVczKjPi2B
         N9qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afBj0NyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c16si6131721qtd.254.2020.05.04.02.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 02:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afBj0NyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVXPu-00086A-B9
	for alex.bennee@linaro.org; Mon, 04 May 2020 05:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVXPo-00085g-BH
 for qemu-arm@nongnu.org; Mon, 04 May 2020 05:29:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVXPm-0008V1-If
 for qemu-arm@nongnu.org; Mon, 04 May 2020 05:29:31 -0400
Received: by mail-ot1-x342.google.com with SMTP id j4so8296974otr.11
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 02:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VE4WTDSHDNzlvovKwmVzZYoV0fgIme54I3r+hO9nD9c=;
 b=afBj0NyRXc2P9RQfVYQPCW089keZP0jqPLJ4lDGhCCDteMGdKHmxKz5NqCQ8BVkfH0
 7dmDEAH+EvRSQK40aQv97yKZ7Zsg2+wHjZOcyJAn95cHMQP+zGmOQ52AiE5U6sguFs1V
 66QEv2YrcSZn7ekZz9+5mYl1wTG7uHHmIgM85xT/05zKd+B/mPcb2vSxr3zkXmlwZRsX
 u6632sgRYil0t1R6czBhTABsy6rAIAtB/pZl687t7Vg8AqndGYFVCsqw6F8k8//qXJXV
 FnNI1SHR8PeiN9ka2RMjBADD8tNzQk4XaDT9YUtnkt2km8UqeaW64Kz72p/j4mMzbWUG
 ddkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VE4WTDSHDNzlvovKwmVzZYoV0fgIme54I3r+hO9nD9c=;
 b=WGYPGhT43uqX6SF9hW594GIUHuI0ztHVnpafRpUm+mgfO0i3jFA/gtywdzCunhOg6+
 8qohWdmOhnMSe4maw4MjtLwRTw5d544GD+vu9wn6a7HVs+YUKQBaSAwsYliAqau3eMX2
 f732MYUSrAr/NMdebGNttwY3xkgmjvonPJnnGak6VCMu55YxjHuPV9t3nyeQGhWgabcn
 ahnNhSatVG0zCAYGDd7BMzgPEY8wa2FqJvCYHqqwtiaKHEXvlarbAQlr4jTojtJAdLLW
 v7mLLus81gaw+LWBxRipi1oAkwEEg7wcX/gDYgdymcbwa0rMtT/19Bd6xvfOhSLdWIX6
 WCWg==
X-Gm-Message-State: AGi0PuazxkhaMy/y0/ekRhdfwHw+OYDnnlIbcIDZSvS6kiPZuDD/5skG
 wWojvO8sgzv+GDE5dr15wmFx2LoYZx1VB13FshpHvA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr13304921otj.91.1588584569082; 
 Mon, 04 May 2020 02:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
 <20200504011252-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200504011252-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 10:29:18 +0100
Message-ID: <CAFEAcA-nkbCZNj0dbVgcN4ajRVx-N0Yvy5OEFuRewJyRGWfjxg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] ARM virt: Add NVDIMM support
To: "Michael S. Tsirkin" <mst@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 prime.zeng@hisilicon.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +8bJwzFPa1Z/

On Mon, 4 May 2020 at 06:13, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Apr 21, 2020 at 01:59:27PM +0100, Shameer Kolothum wrote:
> > This series adds NVDIMM support to arm/virt platform.
> > The series reuses some of the patches posted by Eric
> > in his earlier attempt here[1].
> >
> > This series previously had few fixes to qemu in general
> > which were discovered while adding nvdimm support to arm/virt.
> > Those were sent out seperately[2] and are now part of Qemu.
>
>
> Mostly ACPI stuff so I can merge it if I get an ack for ARM side.

Happy for you to take it; all the arm-specific bits have
been reviewed by various people (thanks!) so here's my

Acked-by: Peter Maydell <peter.maydell@linaro.org>

I notice that checkpatch complains a lot about

ERROR: Do not add expected files together with tests, follow
instructions in tests/qtest/bios-tables-test.c: both
tests/qtest/bios-tables-test-allowed-diff.h and
tests/qtest/bios-tables-test.c found

Does that need fixing, or is the checkpatch test wrong?

thanks
-- PMM
