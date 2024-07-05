Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp972610njb;
        Thu, 4 Jul 2024 20:42:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV08zazhC5MOloP06fGfqZqLXpc576PnPlWVOUkTjOBPg5/9tDDn9aV3Iuj832JP5vodpdT3ZSsdpNLgHsAxMqHi2YKEct
X-Google-Smtp-Source: AGHT+IFWcx2+JkgPcqNko2IhHCLBUr1M8RzvsS8xqOeuissCCIrOq04w5LshCeiCdwyNmtUiRM7Y
X-Received: by 2002:a67:ebcf:0:b0:48f:a4ee:6d73 with SMTP id ada2fe7eead31-48fee872166mr3863245137.11.1720150945516;
        Thu, 04 Jul 2024 20:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720150945; cv=none;
        d=google.com; s=arc-20160816;
        b=skqChAAupUNHBBzmjviBtSRcbxTr5in+bXFlSmrB2vZ5ggyB4gvMq2HyP5iJTzirUV
         rvgd1TtVFeEG4Xz6HEzkuENwoKfM9SX71dCxTRQWqZw6LduHqGsZO35rnr7iHfB5deyo
         SC8kUlctTMwLyc4O82nfSKtAQNbdgakkL4bJYP39VpMoP3J5xZZODoNLQglGprcfB2kM
         PANIVrdBTkvkWelpyTc2vrQu3gCDqsiixqttvvU432RxoG82MHrhRAYXuTFsbFUjljkF
         XUz36oMr1CI2+j5msqyai5bLA0/5lH1MDqchxM1SPtzFd52D6xS53UTwG+GnENkcyjjH
         vevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=vzEIAP3L4RMWPtDRwSfALEOdQXfFlI7NT0/8W5l31+w=;
        fh=XYd3nlz1imZB8xXeQHM+01qZJ8iudtgMnw6k7asy4OQ=;
        b=mCu3Y96xAWU/RoJufzsb4C6+AAAKjKlvR6U+qGpWxATbaephALz5UFR/pisC2tXQpc
         On1M1YIjlPz6/26nz54/CPjSvRJokV4Ppg61kwha+e9tqF9ROVosyxKEIa4cjBr1i0p1
         9NcUJQRUkz7HwYPitZwYl9PyeJ+K9LdaF9njRCi7UpK8XhGC7LBfPUhMnXgo9jGCbMnx
         Mlobgbv8e1Wxw+OjvOMgP2Wo5qWKM/2go6uHPXrJAY2rfFpMR9SEkulYbSvAXB8PL5CL
         F1t+qpqfLfY5qYkqVQ3iAw/naXOvWxhlWnf/OgzbjR5fWg1CUeV+QXyrczDNlaHP78RH
         57HQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=m+1fMb02;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4465148a301si158143881cf.370.2024.07.04.20.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 20:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=m+1fMb02;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPZpp-0000hs-Ri; Thu, 04 Jul 2024 23:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZpo-0000hY-6F; Thu, 04 Jul 2024 23:42:08 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZpm-0004uQ-2C; Thu, 04 Jul 2024 23:42:07 -0400
Received: from [192.168.68.112]
 (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.145.155])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AE4A120127;
 Fri,  5 Jul 2024 11:42:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1720150923;
 bh=vzEIAP3L4RMWPtDRwSfALEOdQXfFlI7NT0/8W5l31+w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=m+1fMb02t6SzfzNZ2Zg6kcL4qBS5vCY051xi/s90rL3ojyu9yVG1lxGoPi9i1ILHU
 6tXK5a2lhS76eS/GBRI5eenNOwcBJCYWmPAUgvrgTTHPK86k3kbQ1vRMe/erUQLuvm
 /Hc9ndCFjCpcaVLjcLtnoWns7sbOGfq2LCYTjSyAAnudBdRtAt1n4LZW97AbffSXOi
 1y5gq+3JgO+0e76EPPnVNas/STaIJzqmWNw4/2pSwrA81aRj5uEojC2SBZPxRk0dIv
 D4CK9aiRRUGy0tp+SNrltx0paSAKis2JTbE9Dfp+wtDDRGf0Ka4yQV0h0mVbvi+/Gc
 5doDQqhQMHbSg==
Message-ID: <6a406f91632efc0f8c8c7c5875feadf3db0887b2.camel@codeconstruct.com.au>
Subject: Re: [PATCH 6/8] aspeed: Add boot-from-eMMC HW strapping bit to
 rainier-bmc machine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Fri, 05 Jul 2024 13:12:02 +0930
In-Reply-To: <20240704053651.1100732-7-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-7-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: yFyPNnY6E8x5

On Thu, 2024-07-04 at 07:36 +0200, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> This value is taken from a running Rainier machine.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
