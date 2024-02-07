Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp612881eji;
        Wed, 7 Feb 2024 11:27:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRO5+DqOFO8nT+TjLUhW5MukbLilNpRqb4hErLLu1j7K7CliPvrZNoaEyhgAi8DlsrbO3X
X-Received: by 2002:ac8:4045:0:b0:42b:f0a7:e5b9 with SMTP id j5-20020ac84045000000b0042bf0a7e5b9mr5432512qtl.25.1707334071783;
        Wed, 07 Feb 2024 11:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707334071; cv=none;
        d=google.com; s=arc-20160816;
        b=eTmyenoU8L3f4Zbw042UIDne/lfQcFT6xjbmjimuEv4rtGSOc/e8MfCJCcHxyKzKTl
         9ejtsWgSI+QtxXDDGYb7JdREYt/gVTWAMHm1i735b8bjSLRFziJtmsIj2FGTO6JG9haw
         5Cq1PJWG2j2EDOS1tlpdRlRf2v+POKJ3k8mr4hlqBYlg+gdmlGLB5RiXtjTvb80JqFmo
         7DvMOSro+ogDzjsjl0QQhZWwkpb0esIrrr3Nvm2QquvwSwOrnyVAW5Trj+YgDrI51vCA
         6bwU4nhtprCEpqGJko2Z4uaJXB9WcjiZjtcJHamxqCDqLzbPj5yo67e2hozyJsedLGIY
         dApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature:dkim-filter;
        bh=VqrU69F1Upxy2wSuSJcQIQbvaVpfBNHflNBbVNIunew=;
        fh=SCaSSM2fiP07k9JN7TbTMwZCAwx3avNwoDvZbYSOJps=;
        b=KSRF+hAWpZw2mLbXkA/qHTDsG4JYzgDnA+pENvirrUXZbrN4NXuZNxGq7Idbg6TQZt
         jj+l4Pk0HjIe3+VGRgF07cuwtN82pAQovFwBbRwNBiqGvRwa0dkQ92q8zCXLmlPXWGcc
         mwHP1lgT0j37b10ViNZERpsirnT/2dRFrZ1B62PSN/ZXdJzp3Oj/fyJkAmH6jAlTBiC3
         UlvxhGKn9bHzCU8iM0FyQR8Nrcm3zDLWYIurvpfoxNcnWy+tFtVAUSNXcAEsnPv2Dn11
         XVK7vCUH0lDveVNP5m1adZ7QtPRsy5OG73htif93tDWkLeJOsDPOrHaKuwBcTTODyWjR
         j0SQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=ghoinMPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
X-Forwarded-Encrypted: i=1; AJvYcCUNlr/Kq6ywVii79Pf7f4chjkXtkdRiAxd5aKmtc+OwQIGHf1Qp7qp58Dy/dtX8ixnsgKXsZIz/TU2TB3wsjcP9bC0oHAqP
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020ac85e4a000000b0042aa55b47d4si1753175qtx.109.2024.02.07.11.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Feb 2024 11:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=ghoinMPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXna0-0006SS-3O; Wed, 07 Feb 2024 14:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1rXnZx-0006R5-Ut; Wed, 07 Feb 2024 14:27:29 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1rXnZu-0004Sy-VY; Wed, 07 Feb 2024 14:27:28 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 1D8C0A0529;
 Wed,  7 Feb 2024 20:27:22 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id uK6sQRQDRVcw; Wed,  7 Feb 2024 20:27:21 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 69699A06ED;
 Wed,  7 Feb 2024 20:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 69699A06ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1707334041;
 bh=VqrU69F1Upxy2wSuSJcQIQbvaVpfBNHflNBbVNIunew=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ghoinMPTsN6/3/GLibRSYrz03/gywEaL7dXP88T0Usa2X2mJx/Iy0I4dPo01ijUUT
 db72jL+FBtnr4vLRN9OUSLT89yWBXYmKz0a86gmCGYV+I4wSlM+Eo3Vdr9nHQ6IhKD
 PzKngY2PXQoiDfi0wLmfynItc5qKRLqbjK+zFGQQ=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id O-AmbFWFV8hZ; Wed,  7 Feb 2024 20:27:21 +0100 (CET)
Received: from zmail-tp2.enst.fr (zmail-tp2.enst.fr [137.194.2.199])
 by zproxy3.enst.fr (Postfix) with ESMTP id 05406A0529;
 Wed,  7 Feb 2024 20:27:20 +0100 (CET)
Date: Wed, 7 Feb 2024 20:27:20 +0100 (CET)
From: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Samuel Tardieu <sam@rfc1149.net>, 
 peter maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <166919954.385629.1707334040744.JavaMail.zimbra@enst.fr>
In-Reply-To: <f20a325e-7998-4065-b4ed-d43da7d4b5df@linaro.org>
References: <20240126193657.792005-1-ines.varhol@telecom-paris.fr>
 <f20a325e-7998-4065-b4ed-d43da7d4b5df@linaro.org>
Subject: Re: [PATCH 0/3] Add device DM163 (led driver, matrix colors shield
 & display)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [::ffff:80.125.0.74]
X-Mailer: Zimbra 9.0.0_GA_4583 (ZimbraWebClient - FF122 (Linux)/9.0.0_GA_4583)
Thread-Topic: Add device DM163 (led driver, matrix colors shield & display)
Thread-Index: qPYjeKm+4dDFkfeuKlXBubwdHL2NFA==
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=ivarhol-21@enst.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: FqtxhzOGFVrD

Hello,

> De: "Philippe Mathieu-Daud=C3=A9" <philmd@linaro.org>
> Envoy=C3=A9: Lundi 5 F=C3=A9vrier 2024 15:03:59
>=20
> Hi In=C3=A8s,
>=20
> On 26/1/24 20:31, In=C3=A8s Varhol wrote:
> > This device implements the IM120417002 colors shield v1.1 for Arduino
> > (which relies on the DM163 8x3-channel led driving logic) and features
> > a simple display of an 8x8 RGB matrix.
> >=20
> > This color shield can be plugged on the Arduino board (or the
> > B-L475E-IOT01A board) to drive an 8x8 RGB led matrix.
>=20
> Nice. Do you have an example? Or better, a test :)
>=20

Actually I don't know how to test the display with QTest :/
(I've tested it by running custom executables)

I've seen that `qtest_init_internal` sets `-display none`
so I imagine there's no way to test the display visually.

It seems to me that I can't use a qdev property (to access
the DM163 buffer and check its content) either since there's
no `visit_type_*` for arrays.

I could technically access all the elements in the array=20
(returning a different element each time in the getter for
example), but that seems sketchy.


In short, how can I provide a test or an example?

Best regards,

Ines
