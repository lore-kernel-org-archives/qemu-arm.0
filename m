Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1338444lfr;
        Tue, 6 Apr 2021 03:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpWpFPg4MTurwDWpiu2V+TEVNsNQlz67TpVpepoBOxD6JlhfAHn76Chg7v5uFEmR1GEB2U
X-Received: by 2002:a05:6602:92:: with SMTP id h18mr23981900iob.28.1617706068610;
        Tue, 06 Apr 2021 03:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617706068; cv=none;
        d=google.com; s=arc-20160816;
        b=OJJHvKu1o9f+7TRFTFoJ/gBRuWEiQb2dnt/Rt2VEXxXvm0K3h+JOLiWu+o8zJvpoA2
         rO/jKmp8PVt0Q87yYs0r25+XCBIJzZCRqN77HTL6gDD16b28IguuYn/S7rluZWOY3Eya
         D85Mb2RrABonsWfsrixPbIlQL+qgLyQ4GrtT3MG5Yeh322sN2aX2bxIWFSTq88Iio9Wi
         3EEvF/rpNFpZt7d469YEqH+hjkq4jN+7FToYsE5w+BJ3JNQzmj5HkN/3lLxH4Tzgj21+
         F2cws6G20JSxLl9vVaASnuLE5nprg1Ibq86xBKv7GtjNCs7LAU0AvFsJbRlHq6Dkq3Tr
         bg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xm/cYBfM8ESdINptLqyLGyCFvo8j2vi3o7UkvefvkxI=;
        b=jBIDThnJROClzX/xhRQZ4RyLls3RRxSvaF3ioS0GtHPA8+LbAExXKOAd16M66jPNog
         EdEkoQY3XsW0pwtySKJvvpAP2dTwmQc5O/aZmKR/I/FWO+X0am8vm3W5VBMI3HO6j+jr
         hZSWq470XzGx/hUTiN8McM51s29tZuowUae1ZyLivqsuodJxAj6RjOuKId5Im5DmiLUY
         2JjQF66e6VIeXn6MHljgV6478HU0jyf0IywbboynqFkBPkNMBovBDIXAoGZaH5E1xFR+
         KVZviBMi7mu6QwOqNKzuPbU2yegxzwA/s6OFdj+OgvO+CNeepghtQcZprHHmbDp55Zgf
         TiZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZEKwHGR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si17193016ilv.80.2021.04.06.03.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 03:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZEKwHGR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTjFL-0002DY-UA
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 06:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjF7-0002Ct-C1
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 06:47:33 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjDA-0005Xf-S8
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 06:47:33 -0400
Received: by mail-ej1-x62a.google.com with SMTP id a7so21169770ejs.3
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xm/cYBfM8ESdINptLqyLGyCFvo8j2vi3o7UkvefvkxI=;
 b=ZEKwHGR9UwoxozKS8cMjnjGiYsaIPzBlN5a3E9O+pCR1uHLiJkLvK6HIP90vwo62I+
 5QBJ6LgYbJvL93PLFYvDwJYSEXfito1J/Srs6D82EEle4Xfj0qXjag3pa6TZnhphU4TV
 esMMapZunfAWqRRSFJBIiwn90sNW595b0qEAGVY7lbgCqRcPO+PzpaaxtxGe9arHUAln
 pG0alGa1vbmMvoQ2gg9Mv9+HTKeeE4KruD9CmODVyfhtlpfyNlubmNQB/M5nr+G2zQsI
 tAtnhxwVLKHNaIoSZ0YAAbKeZqVuYQLrkc8JNVttgUSbeHA2It0PauTRsaq5tGUoN/HM
 vfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xm/cYBfM8ESdINptLqyLGyCFvo8j2vi3o7UkvefvkxI=;
 b=M51Cp/KwibaFkd1xtuIK9KXpSmh4sL6g1SRhjIplTqHr8o2n8jr6Akoi189zpYFbsI
 R71DBbCh5jeLIUCXDE+zhzCie4/GyZRB8zyXx5fL8SVViZhZjw8ruKe2iaDrvTYtv9+K
 BoltRvQtprIQ4XYhpn/d+nXDqreMpNkDd/foLCOsrMTR8HdaAfXNzfYQq4b28fhSmSVH
 z9mtdqkVZZU+cHkR2L/YIp/NSSZ2qVfEpUcPKnE8Reex6XPlv9WdtSkrsDbw3kR8NjsO
 jwjoSKhhEurMjAqFmOlLIxKye7+m+VDUe3AKYkXj58DRVHZgz0J3+Lif4Hkv0fBstNgC
 BWeQ==
X-Gm-Message-State: AOAM533Lxmd3ydK72+Fha3xQSs6hbh1hBvzADRcCy1B20svjfP9NwEb+
 7PVu8YBjytMD8NaxslMhWwXnv0DAaxXAqDfS6Kcg+Q==
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr32590052ejz.382.1617705931183; 
 Tue, 06 Apr 2021 03:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210402084731.93-1-yuzenghui@huawei.com>
 <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
In-Reply-To: <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 10:44:52 +0000
Message-ID: <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uBlLazMIBHLM

On Tue, 6 Apr 2021 at 11:10, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Zenghui,
>
> On 4/2/21 10:47 AM, Zenghui Yu wrote:
> > The GSIV values in SMMUv3 IORT node are not correct as they don't match
> > the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> > our emulated vSMMU.
> >
> > Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> Acked-by: Eric Auger <eric.auger@redhat.com>

Eric, when you send an acked-by tag do you mean to say that you've
reviewed the patch, or merely that you think it's basically the
right thing but you haven't actually looked at the details?

(I ask because if the former I can just put this in target-arm.next,
but if the latter then I need to dig out the SMMU spec and review
the patch myself :-))

thanks
-- PMM
