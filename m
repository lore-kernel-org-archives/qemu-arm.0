Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3376429lfq;
        Tue, 12 Jan 2021 01:04:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOx+82REJ0bkP1cc5DrX/XiM1rSnfMbCvmWXpG8kUFGgNdbS1xYveNWr3Xr8lukUs8i9SJ
X-Received: by 2002:a25:ea09:: with SMTP id p9mr5314601ybd.109.1610442266207;
        Tue, 12 Jan 2021 01:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610442266; cv=none;
        d=google.com; s=arc-20160816;
        b=EqddrIJF6xis/odt8MIhkUC5j32ZG/+euaADYhsjQAcY+51+9DS2GGVUNLp7Zdmm1a
         J5iWqjhyLwKmceJZJWev35GYp9y8yfeogP6AO/wordE9Yd/+qsHik4rNoLdBAoJGIkRF
         djufVKwcbsEX8YytYW6bLnM9mm0Bf9OAo+f+tFCjsf1pDcqmhJQTcA40pERJhwqU8gJ8
         zwlDZU6Y8+q0+mEPC+5j1sI2GrqtEam6771XGAdW7EMJvUtc4ccSBYjdGLSapJkgj6N6
         JpccEe4p/FGdlUprJNrezOC5HVkxY5wain7aR5Jk8amIPdAWwfUVKjXe/l4lkbnilZKU
         H5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=OROJFRwE9zk61IOTIIRnTjk9Bj7n+MqTVsOQUp3ywac=;
        b=buR3CKqop87c/i1KhEybqci97FumZWkWwwmVOEAGUYW8cRZmXE19hkFvSZxMbgAEgM
         rVRdfgoI3+JYELOByPUi1Wu3VcxjVuPmj0Sv/+Br1KN9Zb5Nd+67rfGR6KzQUdTAhHYL
         ZdxEuqY0RfZgB8i0EeLvY286CIiYXR2IiOFPBfqE5rswkYU/ozJt3sFxFjDOpUfbew2d
         U1g9HzlbF8NBcfj0dFQFIP2OsuBY4QVDOPTfq/7uyaIR6TtH3FLMvzNMnYf/HUUyQomk
         psvAc+StdaPsx049MFRWROvM8c3bwEFZaR9wORpdDxF/1BRPMEj943Bw5NHTgYeLmiiS
         RN3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si2232661ybo.210.2021.01.12.01.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 01:04:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzFbF-0004SY-Km
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 04:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzFb4-0004S5-LZ; Tue, 12 Jan 2021 04:04:14 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55344
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzFb2-0002zG-Ad; Tue, 12 Jan 2021 04:04:14 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id ADF4F5FCEF;
 Tue, 12 Jan 2021 10:04:07 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 07/18] target/arm: add 64-bit S-EL2 to EL exception table
Date: Tue, 12 Jan 2021 11:04:05 +0200
Message-ID: <4589283.GXAFRqVoOG@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-7-remi.denis.courmont@huawei.com>
 <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLqYiVIYYD4o

Le tiistaina 12. tammikuuta 2021, 2.04.30 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
> > secure mode, though it can only be AArch64.
> >=20
> > This patch adds the target EL for exceptions from 64-bit S-EL2.
> >=20
> > It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
> > mode. Those values were never used in practice as the effective value of
> > HCR was always 0 in secure mode.
> >=20
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> > ---
> >=20
> >  target/arm/helper.c    | 10 +++++-----
> >  target/arm/op_helper.c |  4 ++--
> >  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> At some point I think it would be worthwhile to convert that target_el_ta=
ble
> back to code.  It is really hard to follow with 6 indicies.  Not your
> fault.

I don't have an opinion. I suspect that it will be hard to follow either wa=
y.=20
This patch does not add complexity per se. In particular, it does not add y=
et=20
another dimension. It just fills missing/unused entries.

=2D-=20
R=C3=A9mi Denis-Courmont


