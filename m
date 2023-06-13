Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp777982ejb;
        Tue, 13 Jun 2023 13:24:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/tyowlYi2dr4mX0KOssAFu8tI8AmznPQt6lTCG/w7fMEOfhjWV3ZEsTI5DeIA7/Ale+wv
X-Received: by 2002:a05:620a:8c06:b0:75d:4f92:dd0e with SMTP id qz6-20020a05620a8c0600b0075d4f92dd0emr12197535qkn.20.1686687847484;
        Tue, 13 Jun 2023 13:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686687847; cv=none;
        d=google.com; s=arc-20160816;
        b=tHq3E6gLsrJapb4SUeV+xrDbNH2acrHAOJjboHd1fTyW0b5v1v8cCGymfnjX7KY2Ld
         AgezVmoP/E4UzyMDziDxL5C5Ms7zBWYtg2NIh0lsBLXeVtzFLufBIYpmDC+R96yjBCvl
         6Hpy7gdMVG0+AC7uYMJx7U0d6AfLpKcjkP5JzZZcfKpGxXjBDmN1QnD2HjVk8nbMXn4m
         LVldEvyYa58st1u9rkqMN180hdurnvw2Ff90twCvWZ92oZJj1loDXFkJdwnr7xsk9Woe
         ngi+dmgEYk72+oTTRpKOZ7TnY0pV1SPvXKwNcwp2WCxvDu7ErfTokt+erYIv9VUOWyHU
         5Gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=3wnTEsZduFED1t29Ud0nFVF99SyZU8AnimO/gTyj8Ko=;
        b=arW0PUkFi2JHS3Mydp980sy1EsEb9sOQyAkj9nReYJ94y1JW8WBSXg8PmpRVXdIv6W
         K1y78vthASwqU52+pHbW+6ZC1eMUgP83/wDIif/TtGw1y+RE+7A/yxBETftTLoAf3yIi
         7qlJY4XKtjBhQ07IwnOuO6U9Hg6wJ75Q4jx3/voDIsnacLe+oJF7emPIyPhB91J3UqGA
         ldX024N/KxS4oXXnNWDhwkToGQ0rmHrfk6CeNiSa34B1GkHJEYRog98QUgl2mHkyM5A0
         aNAz062jC4sIpsVLfwibMuqKDyuAKgGDxTuH5biB7qXIZpIUKr/XpXtXi4lSWj0ERYcK
         HkKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=RUG6FcCv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020ae9e40c000000b0075daf23cc6dsi4182591qkc.762.2023.06.13.13.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 13:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=RUG6FcCv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9AYB-0005IK-W0; Tue, 13 Jun 2023 16:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1q9AY9-0005Hj-I7; Tue, 13 Jun 2023 16:23:33 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1q9AY7-0007I3-CZ; Tue, 13 Jun 2023 16:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wnTEsZduFED1t29Ud0nFVF99SyZU8AnimO/gTyj8Ko=; b=RUG6FcCvdaayJTOnKO2GtigIXv
 I+HS6+lyhfqcK84jGwqTl0QQIANVQ9NQ4Oa+jKTcggyFP3P5FlzzrAvKnA9pLR0BNtnP5S/dhPNUE
 VGqPU9qzUu2UjznaCvp80JFYJuDhzZOgvyNGcGAEAE8/dO4mO6vnGu0ZuYIFpWtfQe9E=;
Date: Tue, 13 Jun 2023 22:23:12 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 2/9] target/tricore: Remove pointless CONFIG_SOFTMMU
 guard
Message-ID: <chx4axanw4ddnwhdbdh2guy5jctcguyq6xbchtzipzeu5a7tiw@36j6zeemonis>
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613133347.82210-3-philmd@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-IMT-rspamd-score: 19
X-IMT-rspamd-bar: +
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.6.13.201521, AntiVirus-Engine: 6.0.0,
 AntiVirus-Data: 2023.6.13.600000
X-Sophos-SenderHistory: ip=79.202.219.6, fs=532687, da=174296860, mc=53, sc=0,
 hc=53, sp=0, fso=532687, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ORY4FDLGeDeo

On Tue, Jun 13, 2023 at 03:33:40PM +0200, Philippe Mathieu-Daudé wrote:
> We don't build any user emulation target for Tricore,
> only the system emulation. No need to check for it as
> it is always defined.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/helper.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
