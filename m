Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp396039lfb;
        Wed, 1 Sep 2021 04:39:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkdbpgNaGShv2mwJ+oIr44eccczj33MsWzBISKLcMCpGA14zmtIwRi8Z1hUcpjLZbzp+ZD
X-Received: by 2002:a1f:3490:: with SMTP id b138mr21528887vka.22.1630496371018;
        Wed, 01 Sep 2021 04:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630496371; cv=none;
        d=google.com; s=arc-20160816;
        b=mk10Wkdea7uaqZG9ItUcIE6Ti/PJ0lMr6zpsXwhNQ5IgG1DQd3CtlkkOghrBCSI678
         2Q8Zx+JmZIARI1E3otN9o740WhzOxMJpKMkWAGIoSpr5XN5NeibjAzywsveXiqziLlaL
         IUIZhWWuJnpAZFewOdBQwK0WaJl8Q8/u03MO2io6XcdfZZx+WGqXVrYcZrUFy/ZYO4IX
         KuzvjYeJvlt7PdE6U/RiaENjLbubp8Bt5tQIIDRp3Nu15aiNrCJHR9wlQ2dA5Rtfhy/k
         QQEk8OdyERN7R14sYCeCNMeYRc912d2Dy9LBh3DEmM3ucv+srKpgwL0DeuJOWziKcCj2
         L0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LafdwHLeYyptb/m9RT9R4UWp5QMx5HeqJsiCNp0vNU=;
        b=ltcOeMyu34jWUd2hM/IyeIKa0IGmHTVSHdRH+ShQ2sFmK9nAigynyf6VER4B/P82Cn
         mKBIBbU3eDZOjtZBTsoHcIvRvk7spmmzyNtnkQRA1osf6myoAXP2kKdttL58nxWkuHgZ
         D+udOhryf8aPe4GQ6KoZ1gj4jDNU6D8LzB80OwrU4cSwjsNgWQ6AyG26ehrOVGk4b8BX
         qIhVz44VDY7xj1Rzw9pTWeRtRGhEfvlLQq5O7cFNpKFwGhKwJOqg8NvaApQc26TNVb5M
         2Kfv0YfxRw/kNj7yfJmTIKOpZ7lJe32niFDqNAPJPaKfB3AfVnbkaGNaZN2pV1RuC7QW
         RV8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UQ0FUEpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si174579vsj.36.2021.09.01.04.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 04:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UQ0FUEpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLOaY-00023D-CY
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 07:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLOZO-00020D-3J
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 07:38:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLOZI-0004Us-J2
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 07:38:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id x6so3940749wrv.13
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LafdwHLeYyptb/m9RT9R4UWp5QMx5HeqJsiCNp0vNU=;
 b=UQ0FUEplIKJfNhYJ1gr2+jFb+vOfm/uQwmZS03VNp17q8ebh+XC+NKiVT3FpgQ4d3H
 id947aepSClkY5PMMXjfzz8HUByxJ359ZYTp+JM/7CXE7AFBa4m39fJBXQaozBEyqqNY
 hA3m10RBDZTLlqvz9wxJRQXipPb7TdBRKDg7hSzMG+kyrUmjtT9esscXLWU60q9XvInS
 yA82WNery0BwjIy1enH8aXBbPCPisy89en+BqD6WEbVQDZT79f0C7/ADBX74hdK+nzAz
 W3DjSAlWG9TjGBFa9nNZNtjaKvMonlENUKeIQunKG951ZZ2U1RiWGFEtXjzA0+F5/UU3
 3Z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LafdwHLeYyptb/m9RT9R4UWp5QMx5HeqJsiCNp0vNU=;
 b=YKoMXJ6HkhAPYSCyzi1ZGw3cz7C9c6lT6NNQ85t53QtBDmaEApPtDdJTWB8Xj3kNBW
 2KVdKjmab5Pl345/xH+OZQE4fteqmCxQgr8E+l+K9XRXHq1xleiEL7yHzIbF08eJIeGB
 0axx1pOtzaoSXj8QeRcBBLIweIFLi/ea5El6j3rYWqN48653FNXGzAoFAgZNZ9VHPlT8
 eUeD/zoDMG1r7jE6bNtNnzfLwc0VI8/3FF7hyuveEXmmGjUraN5vCfPuMNdfB63/merf
 gMMpM6cJFAOucrDaQonAynD7Ld9Er2udczf1ljVvzFa3cx7vw7nUT8wjSw3lbpuN493l
 UKcw==
X-Gm-Message-State: AOAM531eK9dqON9/BWQqkl+ZIQYv7c89GGIkgmNCSdHZoV3wfZd19qln
 EAXoL1NY7mFmE6Zhcf3I8J/ba6uRkECm2qbamlwvGw==
X-Received: by 2002:adf:f50a:: with SMTP id q10mr36883264wro.271.1630496290772; 
 Wed, 01 Sep 2021 04:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210901041903.3111086-1-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 12:37:22 +0100
Message-ID: <CAFEAcA_m-VnCXi4KxsFkVSmN-V2d6QBbe=6LKnp-9so3sB-EzQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Vga 20210901 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dA5pHJZrqH9+

On Wed, 1 Sept 2021 at 05:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827' into staging (2021-08-27 11:34:12 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210901-pull-request
>
> for you to fetch changes up to 01f750f5fef1afd8f6abc0548910f87d473e26d5:
>
>   hw/display/artist: Fix bug in coordinate extraction in artist_vram_read() and artist_vram_write() (2021-08-31 14:38:53 +0200)
>
> ----------------------------------------------------------------
> vga: misc fixes and cleanups.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM
