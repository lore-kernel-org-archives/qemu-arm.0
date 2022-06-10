Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1035033lfb;
        Fri, 10 Jun 2022 03:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcr6PRa2B3Zr7JGg0YrHRyynYNIXhiKgTVMaN5ST6I7I1/3+M375tFrzI3o7WEwPev3msJ
X-Received: by 2002:a05:6214:3006:b0:462:5472:86d6 with SMTP id ke6-20020a056214300600b00462547286d6mr69009098qvb.43.1654856661460;
        Fri, 10 Jun 2022 03:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654856661; cv=none;
        d=google.com; s=arc-20160816;
        b=atCwVcsMNt9gXoxOUnNmVrMHaBH5IgykS+88CwO8snJ/VHocxCmQTyOmyc2AHfczB+
         4qvXwK9HMSzlyPHJxg57cHpj2IhmPt3+OxM3487ZiEJGYhwJPYjgNsULPALYus8QhSFZ
         0YIqzoIybDWPSktjKVMCtTotiK1JR5Nc8Q/i/ZGREC1//Djfo7pYk1MV9hZkxBzkQupB
         su+w3P0WX8vxHaQK+b1WlDdoEMOpyPTxJMDFWl8Rp/p70qXZTZJaH2sKDzK3K3IE2Yv7
         fqCRrtIPfOlVzGvTzM9U7btQzIO/0jy9FXJOBMAxnRaUyQN4Mm5uINaK6XCKWzFADvsX
         gv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vYEC5ssCzCQq9KjzSHR4k5vVe2Of/Di9diaFlvbgsak=;
        b=WYT4Hjudg81Xjo7cS0/p8APKOiruSQT94QUXv8lw1g4bA2pdwnXU9Y4/YPP/sctlrG
         5XkFB+taF/oC+QQ6tf8l0q5kHGYK3CjIFS4GrzmorBnm8N2Jvic1XqbQ2K4roJ56HKTV
         Qh9hI6vw7Q9IujaLZDK2WsuWBep+jLj6d9jqo5M+hVHwdIPz4sBbzlbuiOa8Xpmcv+BT
         D6WUSPrCHNzj9NohbjBLlrITB1WkPmnQWjcEeQfiesLkhop7jETbzRc+qol5luUPwsWx
         f9VkbgnU/rXtMo/pfEta4yHBk2YA3lvzE8l4RB47qThwDtIKri3C3zb3mP517PnJ1rhr
         lirQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYqjTsP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk6-20020ad45d46000000b0044410c8ee72si6426234qvb.381.2022.06.10.03.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 03:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYqjTsP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzboS-0003F5-Te
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 06:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaV0-0002n4-BI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:00:12 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaUx-0006fa-S3
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:00:09 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l204so45922844ybf.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYEC5ssCzCQq9KjzSHR4k5vVe2Of/Di9diaFlvbgsak=;
 b=XYqjTsP7Jj7qYqk7eTsvF8iimrf7UbPr4R5BW/S9U3y499Jbka8js9r493CFBqOOSw
 zX8VOX+i+p6Qy83LOMKsTfUbFtN32wBkq+iwHtRZ5Y5QtrhLg1bJFy6BydWv75zXZSJ+
 YM0547jySLteJxW+eAfeihlu6ejBtMZDxpm7KPyD4VmJvv0pQW2n8J46kwLWOe+ZTfte
 Gn+y11H/iPwF9XseNs4AvHqVZ32YLMW1EjnfbC08iGnIrvU673B/EzoqkQKfwSGvZ6S9
 wivXJJJKdTBvBD5Q/OuaSxy5opSpqcRAYnpwiH/MsRkeW6AFAu9VRdruWP6MNfGL+/se
 o5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYEC5ssCzCQq9KjzSHR4k5vVe2Of/Di9diaFlvbgsak=;
 b=MjrR/W8WDnjd9HNE2sEFU1hrfwyULTDKwwDXtpuMSPBS7j+AidQvTw/PL3+ohN7o0O
 Gvr4FJk24fStYC84bRi6r4CHxPQfRTE9ixu1tOjU3K9T4BiBjwDaF3Dd22MhYwLznHRe
 t6BQT9AWu/5xz6tPXzU2xd5TANME4CioFWujo6KXVK0EM99PbTpMky5wJrQqcrqeGO+4
 zIM4p2bITqwaT6fwTm8AvydxaaX/z5W2oVLmtcoA1faMuS2Xp+GV+nv74n9q96PudmeP
 vt13bwv2OaIVyAHhzyS3OUdssXV9MABK03CpCOH2EIOnFWLwAwXv12Ej6vlO2Q3MhNns
 r0WQ==
X-Gm-Message-State: AOAM53095tZKbTIVAV6NOBRVSxIN+OJUIRI8cK47mIAQl9PvXukX7s/Y
 8JXed4fNBx32gO2Fx9/8/TyBSLkZvUA5ZuHMBbil9A==
X-Received: by 2002:a25:b94:0:b0:663:e6e7:c5 with SMTP id
 142-20020a250b94000000b00663e6e700c5mr15565573ybl.85.1654851606578; 
 Fri, 10 Jun 2022 02:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
 <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
 <CAGcCb13k1RtJ7VVhp3goYhUrD61ScWMWrhGuARtuUOH17GozCg@mail.gmail.com>
In-Reply-To: <CAGcCb13k1RtJ7VVhp3goYhUrD61ScWMWrhGuARtuUOH17GozCg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 09:59:56 +0100
Message-ID: <CAFEAcA9wmRZWiiZ99UHBOf2QwfoBC3CP_pPu1H_Kmo19UYW6+g@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Cc: Patrick Venture <venture@google.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>, 
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V4NUcSFXI2ZZ

On Thu, 9 Jun 2022 at 22:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> Hi,
>
> We did some experiments on this issue. It looks like the image size restriction is in firmware. So in qtest we can make it
> much smaller (e.g. 1MB) and the test still passes. We can send a patch with this change if necessary.

Yes, please send a patch.

thanks
-- PMM
