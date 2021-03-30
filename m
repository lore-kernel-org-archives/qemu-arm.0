Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4421071lfg;
        Tue, 30 Mar 2021 03:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFAVBCFyC8b1iM5LPL6dRMSkNlIVJv5d/fIJGfL4/JnZpyoBZHRWzISl1inpsHLPgtZ6Eu
X-Received: by 2002:a05:6e02:1a68:: with SMTP id w8mr25570397ilv.129.1617098636694;
        Tue, 30 Mar 2021 03:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617098636; cv=none;
        d=google.com; s=arc-20160816;
        b=ps3JCfLZHxcbMtgui+lwB0PK8uIRhoSSh+bUzMOF5tpvU+zXMJyL//tKD7durKEOQ5
         90bTTx1b0oZ33RvK/5mdHtu9nb7NBcXXjd+LTUKlZbZYK47cm5dIoyiDXJ8HMR7PywtP
         aKy4lcRVJTz6e2CixIS30l5ZL8LIrt4m7pPWUuJvxWOnaUzGcGGmHTIBeTkf+Gen3KkW
         drmjiGrxPJYw0wl6+7wHfMwqYLP6Mj7YRNYRERyBjOzTrkVuVT75MI8NtzlgYQreaSSX
         bUnr0ZLOED2hn6Z2mq/bQP9vRewH0O1NHWHVSn+XSEAqm8nwzkcfa0y105GfchNFoKXG
         S2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=2ETVft5yW/I40Ph/IvJjKFJNigicSQWvVTgFy0AWUSk=;
        b=zhhjDDFOkresFhu4rREagQ4GhibyiexzEj1t5HmuNU21AdkJY19rA+RktXJA0hSVo2
         ebv6LdQDdwKMtu+k88d7hQWn5ift5ZcSqaWIkH3OpcMHvU4qjV8w27wJyzun01DU2B+Y
         wirlu2kewfi7KozbCMVqLtzmIRhGxV8d+578EefH8g5g9yc3I2ksnItikH+KGYnvIhiJ
         MrsxOxPUL3lyaHrL69O3RRGgpOFmnaYXppWoaVanoLYklUYietzefzptWqVD/PQhVu/f
         YPKxVv7uNdgwVP6vuX5ltcfm9CJXXeckA1PA9KDFNVNGFhQDspKMG7NT0IdrbnASU+mL
         DTWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si3983563ili.79.2021.03.30.03.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Mar 2021 03:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRBE3-0001Br-VZ
	for alex.bennee@linaro.org; Tue, 30 Mar 2021 06:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1lRBBt-0000EO-BA
 for qemu-arm@nongnu.org; Tue, 30 Mar 2021 06:01:41 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:44590
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1lRBBl-0003Bk-Ea
 for qemu-arm@nongnu.org; Tue, 30 Mar 2021 06:01:41 -0400
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id B4B2C5FD2F
 for <qemu-arm@nongnu.org>; Tue, 30 Mar 2021 12:01:25 +0200 (CEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: "open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: AUTIA authentication sometimes fails
Date: Tue, 30 Mar 2021 13:01:23 +0300
Message-ID: <14186436.QnnKl2KyAm@basile.remlab.net>
Organization: Remlab
In-Reply-To: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
References: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
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
X-TUID: vJ0XkD2Y3cU5

Le maanantaina 29. maaliskuuta 2021, 23.07.20 EEST Derrick McKee a =C3=A9cr=
it :
> I am running across a scenario where a PAC signed code pointer (using
> pacia) sometimes does not successfully authenticate despite the signed
> pointer and the salt used to sign the pointer are correctly given to a
> autia instruction.  Only one particular pointer fails, while others
> are correctly authenticated.  Unfortunately, I can't provide a simple
> use case, because the behavior is part of a running kernel, and all
> the pointers involved are kernel space pointers.  An example of what I
> am seeing (not guaranteeing correct assembly, just a gist):
>=20
> mov x9, 0xffff800009200000
> mov x10, 0x20001
> pacia x9, x10  // x9 contains 0xff90800009200000
> ...
> mov x9, 0xff90800009200000
> mov x10 0x20001
> autia x9, x10  // x9 contains invalid pointer

That's not how PAuth works. x9 must be a signed value in the second block, =
so=20
it shouldn't be possible to supply a constant there, at least not in any=20
reasonable use.

=2D-=20
=E9=9B=B7=E7=B1=B3=E2=80=A7=E5=BE=B7=E5=B0=BC-=E5=BA=93=E5=B0=94=E8=92=99
http://www.remlab.net/



