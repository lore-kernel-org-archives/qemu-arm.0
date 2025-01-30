Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp44734njl;
        Wed, 29 Jan 2025 19:03:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFycMFuj81WtKpVwduvUyeWQLs8w5HoHMKVy2URptadRKcRXZDxMnLyGXKubcGebcCz2lMO9dN+zQNHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IERVyAPVdcnifQ7xESbO9YZoaSEG0nhtAhID7rHydLSOWPUSR1yvZfOIvT+EiNQMYsITEiv
X-Received: by 2002:a05:620a:6609:b0:7b6:d736:55c1 with SMTP id af79cd13be357-7bffcda796emr1062652985a.48.1738206225411;
        Wed, 29 Jan 2025 19:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738206225; cv=none;
        d=google.com; s=arc-20240605;
        b=TmI6AmtQMUASzGVEXkG9ut7tt/SvvFX6dVO9Zs66PUpSDCsLvcOpwww83r0Pa9I27p
         xmaLVJj4nYin31oAXqpVOs6yb8/XROQf7wR596TILhh4HuAlfG0dRT6aCknGOs8+g/5E
         BfYX3e+LF25xuFcNYzF8OMG30hF1Ava71h9qq5TtMtBsyit1xt8yEKoVmPGi02FvGZDb
         gjcsz1vaFIQlpTt4IyBp5HmaSjb2UedtZCGH+4VO+FKHHSA+ZGrMdxPXeOXVfbh02E74
         Vjmtg9FLsO4Uwq60pKPucx+cleflx6v+mbECcnP754X9HQamj+FuJEP49fcCqC11tuNK
         MqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=S5OrvSekYACv8+1dLNThyw1SZ+vG+x19oDy43O1blGs=;
        fh=4ubiFxNUfpRvcKAYgMhH+gyfBqh/MsXOhDxn6vUYmHU=;
        b=OD3YvtPf3N+po6Oo8+E2v7/iaOWbAqanEtRHn1n0px3WxtBmLJvX+TnJLllVBvvAjA
         neLEPz+xK1Hbj2z/JgOn/qalpNuks6RMLVhtWRrJuIXFakwkr2M5lK9a+rt0v4XtHQJ2
         1exHj31w2bn/4jGahVXbSgV00KpBurDhtunOmnKpTf8dxR7KQSUVFN/UpUf+B9V0UikS
         zf7wTxvNBY39WWbTUiZJKm1aeJEpHpxWDe4orXksTsjph5p4Ccr1Ewh4C9lzl5f7mdLC
         CQsnFDhp21duog9Nh+qEf7jBfBKULpPey7qPi/c5cSEXVEIbieADyd1tvZNSOwhn0L9R
         D3xQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=DP+QfC5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a903d78si88478585a.306.2025.01.29.19.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 19:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=DP+QfC5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdKpz-0003yF-UU; Wed, 29 Jan 2025 22:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdKpx-0003xf-Ks; Wed, 29 Jan 2025 22:03:25 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdKpu-0004zV-EU; Wed, 29 Jan 2025 22:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738206190;
 bh=S5OrvSekYACv8+1dLNThyw1SZ+vG+x19oDy43O1blGs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=DP+QfC5bxb1c7eMBGhMH44KxM8zMJuol1ilhTDL2G7OqMfLKfAB56EMF+Ambtd/Tu
 7Ap2iK0yhkwrjNFTU1MZeIVkiU2eCpDuTtZeuuruDuj4edtk+8zQshZRipjXDj1rL1
 oL2AB00rfG25LLgoMjyU2jH99BO7WOL/bLaEJde1Gh1QxGRFCPNWcPiM/HbimLNCsy
 emDpimU68Rh0zaj4TOxkBuHowrnQ9CR19os7CQcBBPJDPz3wevu6IIRzC3QWouP4z6
 rIsIgT6Nf7F9DyJTC9EQ7uxSZE2HC/L4tVA/wq7QPBZgTJsojz0un2O7SXN6V3drz4
 wVe1G+RYUQ2ow==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8825173803;
 Thu, 30 Jan 2025 11:03:08 +0800 (AWST)
Message-ID: <4c7dc177de0e36a6f3e6ee444357f572affc30ca.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/5] tests/functional: Update Aspeed OpenBMC images
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Jamin
 Lin <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Thomas Huth <thuth@redhat.com>
Date: Thu, 30 Jan 2025 13:33:07 +1030
In-Reply-To: <78e6b6ad-0422-4b43-95f5-f377ea101f09@redhat.com>
References: <20250128214100.1196243-1-clg@redhat.com>
 <bee99a3ef4821f69f6f1a2f6cfc77c3e247e5d87.camel@codeconstruct.com.au>
 <78e6b6ad-0422-4b43-95f5-f377ea101f09@redhat.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QmfyZWlsAyKR

On Wed, 2025-01-29 at 08:19 +0100, C=C3=A9dric Le Goater wrote:
> On 1/29/25 00:29, Andrew Jeffery wrote:
> > Hi C=C3=A9dric,
> >=20
> > On Tue, 2025-01-28 at 22:41 +0100, C=C3=A9dric Le Goater wrote:
> > > Hello,
> > >=20
> > > This series updates the OpenBMC firmware images to the latest
> > > version
> > > for existing tests and also adds 2 new tests for Aspeed machines
> > > which
> > > were not tested before : witherspoon and bletchley.
> > >=20
> > > Thanks,
> > >=20
> > > C.
> > >=20
> > > C=C3=A9dric Le Goater (5):
> > > =C2=A0=C2=A0 tests/functional: Introduce a new test routine for OpenB=
MC
> > > images
> > > =C2=A0=C2=A0 tests/functional: Update OpenBMC image of palmetto machi=
ne
> > > =C2=A0=C2=A0 tests/functional: Update OpenBMC image of romulus machin=
e
> > > =C2=A0=C2=A0 tests/functional: Introduce a witherspoon machine test
> > > =C2=A0=C2=A0 tests/functional: Introduce a bletchley machine test
> >=20
> > The rest of the patches haven't reached my inbox. Did you send
> > them? It
> > also seems they're missing on lore :)
> >=20
> > https://lore.kernel.org/all/20250128214100.1196243-1-clg@redhat.com/
> I shouldn't send series too late in the evening ...Sorry for the
> noise.
>=20

Hah, no worries. I see Thomas has already reviewed the resend.

Thanks,

Andrew
