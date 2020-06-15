Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1637811lfm;
        Mon, 15 Jun 2020 05:16:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww0s1MCQ/1xCQbjblSOYAAchtTqIF2I+uYgb2aDZHyfvMV2XcKAuEntRSJDm2bAavm1zhf
X-Received: by 2002:ac8:4b71:: with SMTP id g17mr15575445qts.187.1592223414898;
        Mon, 15 Jun 2020 05:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592223414; cv=none;
        d=google.com; s=arc-20160816;
        b=t8zIhcakesUt4+AJAFVdVNKdLGmQM8DPMjTYA9aCSvbYas1EaqA0QljVeRxggRD2Am
         drmBSoL9hZkvqmUt+BAqOLYB+WU9cKLoU4FOjgqfzr/NPRvYktpMXnQ2oU/v9bLqEvaI
         Hy1NnJn13hhWROFhLavDAcK2wtifUuSpSrv5/DRDw4n6+jdJxNQfYOMZnegejBZVKLxI
         ql4aG6SNdHDCq1lordxiPTbP9pph6HkomreOTeoIzbVEMHbwPijBucNECR3flJEbJ4ar
         Ao0GZ4FvcVJEwkMq28viDqQjKTsIGjntWVY+OpLEpFgB6fgfss9XuId2LK7pxdChWYUP
         VKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jH+FVUcLyGZ8+p75rBAz48h/mZlYR0NcFtss6SMrdsg=;
        b=dn1x/Hazybu6u8rbeSJTHgb8nlK9H/vRbzW2l0aiPcd88UdJ0F5u7vBSljveU4Uqyq
         7OfwnoD8OLamjSaRIhRd6iMUw38nS6a3nmFrejRxK0EJ4DZFV6sFA2HqxW1MgawGHUyF
         +TwJz1jhjdi3BLF/iRT2RjC8EEzJ3qVZehLYRet78VhWzR782HGn08RcNEc4iWMEuIBV
         bXyo1FBcjsrnJStq/z+e2qfRwnidyC8SKHcRqb8gH/KUcCoqWYLU2aXwKID7UZfStZkX
         9kBA5LyksY8LVoLoc273pFS6nYPqDI2bw6j4V2ajEGjUKMwFgPAPxWGh9rEYOl9w0ZUJ
         eFOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J9Kmpis0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si8612258qvl.37.2020.06.15.05.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 05:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J9Kmpis0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jko2o-0006Th-5h
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 08:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jko22-0006T0-4U
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 08:16:06 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jko1z-0008IW-7q
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 08:16:05 -0400
Received: by mail-ot1-x344.google.com with SMTP id v13so12901309otp.4
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 05:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jH+FVUcLyGZ8+p75rBAz48h/mZlYR0NcFtss6SMrdsg=;
 b=J9Kmpis0bRU9anee1/c80QlEwsCdXRIvA4fsM1sAbuJmfBj+OqRsVDTI68fHpPR/Lx
 Wo0pv7KmySacs1yNsEJdBcSLZ7TWFx6B9HjwBOERIlXxBZHuXlQjzxB68xezFqOgRoU+
 prfYM68i5WLbOrNsSOJj8EczWu4oTJWEiSE6J8ItLSKT/bmiRTsUhfL0xMXWNX20Wq6e
 a01l7ocgKz4WIk/73NFwmBfSDKrL5iUzIEgsi70kFASSR2khl8nHH3cDjeC22Qm2du3v
 cr8cI6CDv7U9onCTiI79kJY74+Wj8kaKg9NSkOV28LjS3OeKjXMlXBCW9NZmR35Nr5rY
 HfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jH+FVUcLyGZ8+p75rBAz48h/mZlYR0NcFtss6SMrdsg=;
 b=IpXkg6nOljhRDtSGlz4l8QWhse5VWqQVt1YYZRdTFbxUXldCpy/DLpx6utHUZXKD+p
 lKS1wtvuRWRhb0bsScNI7ET9Ltv28AH4JIwJa9jV6ZY8Uh/UW9iCGErBObSsFcyhjyMY
 IXUs/nUmAaTpm5BA95qUQcK81DR57vCEoLvwuFm6XXfjnCE6hHdjkaImxM/7uFItSijp
 BUFCEJwPae7AkwuCOKebSg3W4KETyYkqMIb5oLvQxGZpMUvT0Ws3uVXy8JonpNlmmjjM
 ly9OcutYUw4TERP2zAHq29ifpsYl6bOeMzpq48IdGtePH514zs4iqOIzqECvcW2o4k6F
 Z2mQ==
X-Gm-Message-State: AOAM530W2hEjwvYSAttAp65bApuaDW4id5bLx1EvN2P96Jq6LhlzD7Tx
 XrnSzeZX+UGp8OyanXP1/BNRE4Mm9xK1XTpDm2smzQ==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr20958370oto.91.1592223360506; 
 Mon, 15 Jun 2020 05:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200608121243.2076-1-fangying1@huawei.com>
In-Reply-To: <20200608121243.2076-1-fangying1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 13:15:49 +0100
Message-ID: <CAFEAcA-ez0aNE6ASFM1PXs_PaqAuBzOqRhbYVAmrEhooPzmP0A@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm/cpu: adjust virtual time for arm cpu
To: Ying Fang <fangying1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wu.wubin@huawei.com,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mN1Q0W/VagzS

On Mon, 8 Jun 2020 at 13:12, Ying Fang <fangying1@huawei.com> wrote:
>
> From: fangying <fangying1@huawei.com>
>
> Virtual time adjustment was implemented for virt-5.0 machine type,
> but the cpu property was enabled only for host-passthrough and
> max cpu model. Let's add it for arm cpu which has the generic timer
> feature enabled.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>



Applied to target-arm.next, thanks (with a minor commit message
wording tweak, and the suggested-by tag removed).

-- PMM
