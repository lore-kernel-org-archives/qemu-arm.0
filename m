Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp774363lfb;
        Fri, 22 Jan 2021 04:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXudMLq4kfqPBOvQFdGCyBez+CNzeqhXtef9AiFm9BpO8AJ+h8BLlsUlYCnkTk584LdXKN
X-Received: by 2002:a25:c614:: with SMTP id k20mr6330135ybf.371.1611316953658;
        Fri, 22 Jan 2021 04:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611316953; cv=none;
        d=google.com; s=arc-20160816;
        b=w/4BskrpU99YBcJRVWKrtLjeqjJloj/7V04HRehoaBoK+B98q7ZoVm5iLHB0GjsxMw
         T4qKlpvzxf9Xdz8WtXIGzOxmTsiQ1zgNKAwJU/kiMDp2KCiXWS5a3wkVsdwYpI46vlaZ
         udHTVBgfB1v43NJk3mtIR0JY5095FBBfXHhVUvxYGuL6cXqcS/9rz/HkrMC6puu95V9I
         9+g6wqgPvp4zhuKtENiaZjCPXpKCN8AsDtLnxUidB14UgLe4J/CfviHUA5cTNBnV2bWr
         63S3JQltTSICd9Slo+GFGNv0H7qQKjxmmBkeFEAJPz+pT6Dh1Ef7Q2NzV8LO+EA1UxAN
         hA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NTZPY6WkVFpXEUfb1dEykbGXS9p/chRYJl8UuYW5kC4=;
        b=yfdQX/8Uioq9sWdi1JAOxLL0l2z8Hg7VM7NyTd1c0EIdfEnEDUKbqhPWthyeY63gB4
         22v5xiNZoHbw/sI3fX99bebii6ICNtdYxGxVWZ0vKwi33sJEm7mJ6R4rmSrvNcW24IO8
         qUdiYBewBU8+8y0B1D1OCQvrQ5uZS0KAxdKf5o/OaTQxCd7BwJWwALOkxwjzfR5PcsUB
         zNYFL4a2eNZ4XqXqgO+d1DJclH1gGBCwcjWGI5dEawXIW08BQQ1ReeCY4ZFEtnA00t1G
         7f+lKJwDovUeg9X4gerKStPR5PMkLv1KFiy/16svNzZTQ9Ll7GWcb4omMGNfv06hm6HJ
         XSqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nHlen25Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si7914088ybc.46.2021.01.22.04.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 04:02:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nHlen25Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2v97-0005EU-1X
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 07:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v8v-0005C7-VQ
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 07:02:21 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v8u-0007ci-50
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 07:02:21 -0500
Received: by mail-ed1-x530.google.com with SMTP id b21so6248013edy.6
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTZPY6WkVFpXEUfb1dEykbGXS9p/chRYJl8UuYW5kC4=;
 b=nHlen25YPrzO7A3I+8QFk9oxK74aiFK1fi2sWtxk4fVvLEM03YTomS+bcomz1Y5uc8
 mXaXn5Xkrovo1bRvattmUBirk6S8Hb+6/iTrntBrCrIBVY7yxo+OqTzet/RXT/CGD4AD
 H27bFjOgbhEO7yK1xXFkAFInNyQ18yVdHswdKyHpYDPN+X1HEA8dvf8IOTzNCdmnRFj2
 21lyzp86AgdO1hgWpPbbmZEfoO92xSIe0YuIR2L6vdbydEyYyxpfwnbf0qJY4A9eeziO
 zrmBuNAVdtLvWxAYoGsWj1OkMD8+JeQCQ7phP7T+lNg7zLkng6okR2uM2y1efIAw2l9v
 3d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTZPY6WkVFpXEUfb1dEykbGXS9p/chRYJl8UuYW5kC4=;
 b=TEokfO/lnN8KzpYxF0Klq9qcdRAthAf+qgwOpodNIOmmQ70MqX8sdpmaELz/VaE+Pm
 /vx0WMM2K2KJVXR6/B2ugSduNGclS0WSu6ja3TqX+Aj8a94rMM6sbvcAkE9OjvqZuyOz
 0x0TCmQKf8YgFZ6sfB7ujiELrpzDl58OUrznX6gnIO9Kuv88IU4T3eQychcRG3/rt9FW
 EBYCqSSVgT1/ihJkqI2PUeVT2IhFjyZj9NdwbDC3phz1NsuIs5idDzoXPQ4pMFvDgXxY
 nPwGQCQ8vcOfqkqVfpTSRKxIwB6lu0qWOO1qRfA80BxRfBXKMuVAr5epUYYlnocAw0Fx
 dVEg==
X-Gm-Message-State: AOAM532sNTEiM/+wgQ1PqbwOaIZFw291f1WtaFPs2WF6hi08Cqea8QOF
 52TANmwcGpsIDQWTtc4pFFhRZvLBpTbWkzdztC/wnA==
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr2886276edb.44.1611316938439; 
 Fri, 22 Jan 2021 04:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-13-richard.henderson@linaro.org>
 <CAFEAcA-hyjfb399qWC4ORNtoLxNs71G=paurrVX4g+aRO2=26w@mail.gmail.com>
In-Reply-To: <CAFEAcA-hyjfb399qWC4ORNtoLxNs71G=paurrVX4g+aRO2=26w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 12:02:07 +0000
Message-ID: <CAFEAcA_LC-2G72b_ByW1magzXQi3fL97kjAVXZ3zaThB-Erk1g@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wW8lVmZEhpNa

On Fri, 22 Jan 2021 at 11:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> The kernel's "untagged_addr()" implementation:
> https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/memory.h#L203
> slightly confusingly does "untag the addr if it's in the userspace
> half, leave the tag bits alone if in the kernel half".

...and a kernel person has just explained to me the rationale:
TBI is always enabled for userspace and never for the kernel,
so "always clear tag bits for a userspace address, never clear
them for a kernel address" is the right behaviour. I think we
should have the same logic.

-- PMM
