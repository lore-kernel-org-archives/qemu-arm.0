Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp299778lfo;
        Wed, 3 Feb 2021 07:05:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlJe0vTUIc0AOXrgv/2EvHH4I6rKgjH+B9W6Hcc5H8NjqxxVNLUNXEsF5CJ4wFKEk9PSXr
X-Received: by 2002:a25:3184:: with SMTP id x126mr4874274ybx.9.1612364738203;
        Wed, 03 Feb 2021 07:05:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612364738; cv=none;
        d=google.com; s=arc-20160816;
        b=KxlINyYwufBPb/SSL4X5vZBDb79tdwpkd8E3UAaCp25qc4+T0eEYaxoTOHabN0DLLb
         mGRHGnlG13sxWYxJqHCx9Mesn1cwGoYx57pjUmYP+gydQkgtgXb8hF0xqFmAJpPmweoK
         LN5IEZDJ8ulqjdMvBryIxVkafbbNZFJOTdA1dzQjr1zNOdjqollUzHK9GnZaXmQvxVbs
         Xe41CfD2OH1I0Z+OY3/y3H3dbeARdaJs5pFMwfkY9Gfz3HQMSKXZ5rYRgIy7qvrQ7l5X
         0zTWIlxEDXSyiV7vT5ZpnnN4Y9l+9cWR/a0RqGoPqOwJwDJCKDdro7m/cAsIy56Clf93
         Xgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=ZFysd5kcWGyceD2Y+Mh0VUHVr8emvI/zMDj8h/7bdOo=;
        b=KyHJ7nRah7Ex6710jI/3HK0VboYz+RR2vBQIKUP2xL2cHSNRozpSQgQp3DWmBjDJjm
         Itx3+oaamjDOOmBhdd/2sgeVN15ZVn5T38+pCYzDcRF4YTni7wbTbCRvsY4Ts1Q4xJuX
         +yXCmZnpI0sBufydY6asx2AMNvYmqseVghgQSP8Vq2dwVeReMnlv5M1LXK1HEKjwYUig
         reMeob6HBO2wMd0I3v7BQkrcGZLO5qwrcr5zqwBeNXckLz05IIFD/j5oCiuejl5swxPg
         3AZCar901Fm+dQBCy2CD4f9ydOub9woTCGL47ybdEZk5X/TBIx+bw52GDRKVQZMI/R+G
         M23w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si2560940ybp.477.2021.02.03.07.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 07:05:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Jir-0005M1-KM
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 10:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1l7JhQ-0004GX-Hu
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:04:09 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:36876
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1l7JhO-00021T-4W
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:04:07 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id D21BB600B9;
 Wed,  3 Feb 2021 16:04:00 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org, Michael Nawrocki <michael.nawrocki@gtri.gatech.edu>
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
Date: Wed, 03 Feb 2021 17:03:55 +0200
Message-ID: <3560653.N6Ej7becCr@basile.remlab.net>
Organization: Remlab
In-Reply-To: <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
 <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScdhyPtuPdBJ

Le keskiviikkona 3. helmikuuta 2021, 16.50.28 EET michael. nawrocki--- via =
a=20
=C3=A9crit :
> I see what you mean. Does QEMU support AArch64-only CPU models, and if
> so, is there a way to determine if the CPU has AArch32?

There are 4 separate fields under ID_AA64PFR0_EL1 for that.

=2D-=20
=D0=A0=D0=B5=D0=BC=D0=B8 =D0=94=D1=91=D0=BD=D0=B8-=D0=9A=D1=83=D1=80=D0=BC=
=D0=BE=D0=BD
http://www.remlab.net/



