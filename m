Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp657942eja;
        Sun, 28 Jan 2024 02:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1T48ttz3oNYF/Zz1CSeCqrYQsgG1bJK99wP8xXrJYz1CC7ys8Ky2LSXpiqSXMjEqVgBdf
X-Received: by 2002:ae9:e645:0:b0:783:d2d7:f9b8 with SMTP id x5-20020ae9e645000000b00783d2d7f9b8mr3480292qkl.85.1706438125712;
        Sun, 28 Jan 2024 02:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706438125; cv=none;
        d=google.com; s=arc-20160816;
        b=cSnWaKu/rq9g2EWZ0t0JGRbQKHWTK2zlTCyt+EXo9kJmITW7ts5dmHa8xtH1TlpWau
         BQW3/VHtzUzhqyX5nhdAie/M+UYbI78K4Y5/WmhgHg64FWEy8qeAmOddUi8Zoi61F7GK
         0L2AbpvSIGiaAetMHpXh5KoNg3az6pbizfS8uRYaZ8qX+w2/nuvaX/vc9ad4KDF6mgTm
         6BpqeR5Ni4U3X4HhADxqAPJ1RF/9Z9XPcGSCoy91NlI+MX/5ZN7r7JzrJ4DPf6g/q97Q
         fXRWDBkCiONDAdIk1qMxxI+xgNxGI6/OsF9Hw5rJZlOI4XtxEk+NGbguMIIt8OXhjRu/
         8+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=vvIF26RBDLw+ldxcag6nMVV5Dto0lCR4pixmzH4okR8=;
        fh=ydXKtdleIT0GXtoMMRrgINK5TKSJhWKr+0WlYVGlv1U=;
        b=dMFHqCHROf7vb0k9ta9uPfScnv3QF6+Iw3skQz3AwKmMmUT6C0fayMq7IAraKJfon9
         R6ja4t4dT1H5dHM0Lm/KVDXDAM5O4lEnF+HuRzkSsqlsCeuMvRpRdiAK+HKt/3GNusi9
         BzGcqjzkJZAu3FxwmD8q+Pf5DRsFeUOnQy7qITuEwQlq3joZcm2Jb1dHcvqiBMr5QKN9
         ZmGBwKdTOelBMs6c882I3rKWU/9W9Omu6+cHQ0PkyY24QoiWSqfeWFCXsaE/E9o4bWh6
         GMkV/0NRD/02NxTXRBLXzjesmCCq/bPK0NcDDvxSxP/VXhwkkXGWgP5WB4emMLS8yCY8
         /+Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=mtzig3qU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020ae9e647000000b00783dfe4b371si3900790qkl.338.2024.01.28.02.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jan 2024 02:35:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=mtzig3qU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rU2VQ-0004EI-HV; Sun, 28 Jan 2024 05:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1rU2VO-0004Dy-Rh; Sun, 28 Jan 2024 05:35:14 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1rU2VA-0003da-Cb; Sun, 28 Jan 2024 05:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vvIF26RBDLw+ldxcag6nMVV5Dto0lCR4pixmzH4okR8=; b=mtzig3qUEc29xOV48tBTafSouS
 kYOTxo1qfO1eb7PHNe7+5869tAjNjANki5CK7hOSu7tfylhpsS2P8/rOpbfXQcILECgiWXepxp8Q2
 tq6NqTcqAisc0R98LRRP3A+RjNTk4zdt50hyxYyw8X2VhXC3NE0/Hoe+69FX9vTAmFoo=;
Date: Sun, 28 Jan 2024 11:34:48 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 21/23] target/tricore: Prefer fast cpu_env() over
 slower CPU QOM cast macro
Message-ID: <mc67nwaoaqancyz63zt36awnsyzslgl24w3hnctaxzuycezixt@yvxaywvzntvb>
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-22-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240126220407.95022-22-philmd@linaro.org>
X-IMT-Source: Extern
X-IMT-rspamd-score: -25
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.184.59.80, fs=1716459, da=194047155, mc=2, sc=0,
 hc=2, sp=0, fso=1716459, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2024.1.27.235115, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2024.1.26.602001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5KL3uukQGghJ

On Fri, Jan 26, 2024 at 11:04:03PM +0100, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/tricore/cpu.c       | 20 ++++----------------
>  target/tricore/gdbstub.c   |  6 ++----
>  target/tricore/helper.c    |  3 +--
>  target/tricore/translate.c |  3 +--
>  4 files changed, 8 insertions(+), 24 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
