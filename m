Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1812353njj;
        Thu, 31 Oct 2024 09:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUh7rSvoDqYJfZtvKWhOzz/cG9Hcq/hMyAf7pgsevQXeYfm5xQf9lG3Edg1F0cFv8ZROdAzkhOWlAtTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGY6w8ZpVcJEb+ue05+jJ52W+m8KnWuvO8Dt5v13iVu3Hb3wxnQZqIgZmIGn/7swFPOFhq+
X-Received: by 2002:a05:620a:454a:b0:7b1:3c19:a665 with SMTP id af79cd13be357-7b2fa621e1cmr98243585a.19.1730392427435;
        Thu, 31 Oct 2024 09:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730392427; cv=none;
        d=google.com; s=arc-20240605;
        b=i6pJcAz9GfOcrxvYEFDuv59DU7nwWRZ78vaD7jpHxsS55drmZCyiLWMhTYS6jGWZO5
         K0SqjAL4tgmuVSJITHlUX52rNA8iAhKpLq2wzdURAf0tFT2FmATV+oXmIW7d9TjHzWya
         mU8l4vi7PWwDhFsOIEGoNRcEU8A0THSgEwcINUv+c9teo9+l4EG1du8GFNfHVBrOXEBd
         2V5jfEKHaEBPSOOJrGOtxoUPXfLbKdKxCoxdtliFZiWxxdvRxkxWZa9BhahZXUcPA5kK
         AVA9QTb4vUeWGTAmnEq/PLYMxfAowuhZ9RFaFD1/sXw4KKre0YEP1poe694lExmO9WQV
         sWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aOnP5kSk9F0m1RRBTQfYEC5+vbo9OQCaCNQBmkX967g=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=XxXojqMjyE38shyUNp75OnXO0O2USvXn4F4zMZ4gI0RvM1wggrv4GguU0+/09ZwGj7
         l0AWAc5Kam/U+ZoLQiOYH4VkLalDT43mwHBxgkQbMfhsF/aAIF9Z4gGVhDD6mbhL2WTa
         T6kJXkd+dho19Mmtso/f2uDU0SHzZsZtS+D7mbWpwOHSTq5zCrNmcS3vH/OGJuU5X2/1
         iEkWxOcwHOgeDvxaqenafHvaTicNfX89wzdEAOP67oOPYdAPaaAH+gAOYPLOJzb4gs5O
         cdW+mMv0dHDGolPS1SmV9Cp/be77gGqZeclOFu/NYV7fWRBsoixY/qYCmDrdeZSXRNDm
         l31A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdktMZxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ad0f8asi214086285a.703.2024.10.31.09.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2024 09:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdktMZxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6Y78-0002YP-Jr; Thu, 31 Oct 2024 12:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6Y74-0002Xv-10
 for qemu-arm@nongnu.org; Thu, 31 Oct 2024 12:33:34 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6Y72-0003XS-BD
 for qemu-arm@nongnu.org; Thu, 31 Oct 2024 12:33:33 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so1483121a12.2
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2024 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730392410; x=1730997210; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aOnP5kSk9F0m1RRBTQfYEC5+vbo9OQCaCNQBmkX967g=;
 b=gdktMZxJQbjKWMPXDQPmvVHKdd6CbKpZwoT+OQRAd4NCHFPSovEnNBSafGIbDKfzDv
 7FIPGPedsHyQ7gCVGgJVxIwlBFHnUJ47cbH6k0nLaebqIoAQxIPiDrnWz8Yzrk/oxIqp
 d6Rt8oWK6IPhSElS1iL6bddA7yyiaD5/uqWnkIjTVFWh08v1g89my4tFM6N5Km/hn0b2
 7aK3CKJa1PcvfPdhMQ1gDHTR84k7Sw0ju8wJwoK3+Fil95NnQcY7hpl7Z19ZDgpFIbM4
 OW64UDy2GRlGXI3T2gxi7QP6E3GuwdtrmqCmmrIacGKqDCE6CyXqWdLTOpFaaT/A/zTK
 NY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730392410; x=1730997210;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aOnP5kSk9F0m1RRBTQfYEC5+vbo9OQCaCNQBmkX967g=;
 b=CO8z7DNfw+s1ArTG8pQzNdhHh1M4KBznBPRcRg6+CO0Wi1oJimSikluLD//9jN9HNd
 2VT+UfBHgOmJCMayz0AzHdTKTddNxlyUU1XQn0vDcAO0d1WKPK3/+0QQbnvtZvNn2G1b
 isKOzA2BUlECMzqa+UWPur3hhE0nafFl3OOko4bDtWMZx64qFIkVttuv4E2kRrf/byJu
 xjSxIPuVOKlB/878BmpUuJqjjNE+AVbMcFL5Rg4xUfBr8OwaoRwy0Hhm8TZZeQ026biF
 n7SNO9uPvsNBobO7R03zddR639qTaSJyv/VKqlH3kM3RlQJKN3PVpSfoP1jlY0aOkWGr
 SDbw==
X-Gm-Message-State: AOJu0YwvImxZllr2vBP8LXE/cayyKjIeox6XqQjPPWse4/hlfaWLK0Fv
 hI18ea07NbQygH6ArFlRaUpDKEBOtjTvk8wHjrAMZ/efcMNgP0R9AfnHpuB62NVN9vAHgMoZ2L/
 qS/e2YCU8jo5f67PJGmzn/ddOVqqCN07F/COo0KCrCAlzLP4F
X-Received: by 2002:a05:6402:254b:b0:5c9:4281:4515 with SMTP id
 4fb4d7f45d1cf-5cea9687be9mr3044678a12.17.1730392408282; Thu, 31 Oct 2024
 09:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Oct 2024 16:33:17 +0000
Message-ID: <CAFEAcA8C6vZvQ9qymGehfMswfZQ3hT7DGP0f2Qg5bgj44iOz3Q@mail.gmail.com>
Subject: Re: [PULL 00/18] target-arm queue
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tFugbnsddlUF

On Tue, 29 Oct 2024 at 15:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit fdf250e5a37830615e324017cb3a503e84b3712c:
>
>   Merge tag 'pull-maintainer-oct-misc-241024-1' of https://gitlab.com/stsquad/qemu into staging (2024-10-25 19:12:06 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20241029
>
> for you to fetch changes up to 84f298ea3e2f0627c09871561e55068db9ff9180:
>
>   target/arm: kvm: require KVM_CAP_DEVICE_CTRL (2024-10-29 15:04:47 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * arm/kvm: add support for MTE
>  * docs/system/cpu-hotplug: Update example's socket-id/core-id
>  * target/arm: Store FPSR cumulative exception bits in env->vfp.fpsr
>  * target/arm: Don't assert in regime_is_user() for E10 mmuidx values
>  * hw/sd/omap_mmc: Fix breakage of OMAP MMC controller
>  * tests/functional: Add functional tests for collie, sx1
>  * scripts/symlink-install-tree.py: Fix MESONINTROSPECT parsing
>  * docs/system/arm: Document remaining undocumented boards
>  * target/arm: Fix arithmetic underflow in SETM instruction
>  * docs/devel/reset: Fix minor grammatical error
>  * target/arm: kvm: require KVM_CAP_DEVICE_CTRL
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM
