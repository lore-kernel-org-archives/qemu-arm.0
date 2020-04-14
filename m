Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1086094qvm;
        Tue, 14 Apr 2020 10:00:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypKOCns1pHX2oSUa2wpMM/YbU5rCVECwKQXGcAHfP9rkKv34I/EesckEXTYr3MAwuhT/PYQD
X-Received: by 2002:a37:2c81:: with SMTP id s123mr19645938qkh.284.1586883629817;
        Tue, 14 Apr 2020 10:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586883629; cv=none;
        d=google.com; s=arc-20160816;
        b=CNizUKMI49sX49cJ/ecIWvt9pgasG2o82XilEIUHM6CT1ove4yoiy0GlZgYpPOhVIH
         lVYLLV5FU1/0lCyqs8bSha0+v7VdddOk85eCA53zpzxkZidWNbxUCZ288K9GHroalFHt
         1hle+6BooJ/WaItSOw9uYyWizaB6D4ECuMkvMQvA52wkOcFBQX1G+hG6L+djHAuFMlaL
         KnHHrNk5wbTEXrYvnoOHs+PuUSDFfdSvnCu0pWr163QAxNZDJIb4SDp92NMDge8zwmzz
         uGbv8LEpRSGtznnNrWJL6nCzu1vY6oQvshQRihTGLu6SbtjxAEsEBICqliuAD/t+S2E6
         HIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=1NutwCTYV7GLRuvHlCy5xsed3qRvUhgaTVGeCnPArTk=;
        b=yhhsNJMUhAsnS0V9IqDZjYPlxrtZOhER78b6jsiDPp1ZR1q4Ce7P7EepR9eFSXK/qo
         eyYgB8yZ6BlexmOtapw0FMPSEyaaaWDh/Ixc4sA5mRLGrzx0HhmYANQZjaIdZN3R/D8w
         ADysSvEZgA9jKP8ddhIhlt0vDkVZR8uujdc3oeEmSwr/jnfxVrRM/iRK5oHnZBXIAcww
         DlsCcNxUAWO2M/4b6Oy3mOFXeZLbcTBXvDvB6gNYNud3L9FkJuOt5E0WqdHMm4UzYfOh
         k5V9mud/FqnQZrnF5U2FleGVg2YjTKGdG1iyHeWMMsmd8P5iXg1D6M/ACGm2QZdADbuc
         gdWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i36si7547711qtb.399.2020.04.14.10.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 10:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOvF-0004aK-B1
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 13:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jOOtg-00032O-KO
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jOOtf-0000jd-D6
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:58:52 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:40389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jOLjN-0001eQ-P1; Tue, 14 Apr 2020 09:36:01 -0400
Received: by mail-yb1-f193.google.com with SMTP id f13so5459125ybk.7;
 Tue, 14 Apr 2020 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1NutwCTYV7GLRuvHlCy5xsed3qRvUhgaTVGeCnPArTk=;
 b=SpICs4bd1ki1KdFh1NDjSBK+l62Fdivb5nVKLkVVbWcxjC9qB/sLEwLXKRFTNukbjd
 VmA0Ixd1wYtuXZWnTQo4Br1TZSJ0cQV7aOJAVk+PT6d/6Ea2C+wsd58benuJkwZol7E7
 c3e+TTbfzLrnyldgLJwvc/5o7/y4k8bO8vIc+tidmE62QQVB1H74lTiFGvp+crebpdo2
 J//O5SfSJ7enrS+p4S4+CF9fgeUHioJ/4/vGQC76Ny5zgkIfo3wP+edX5rszhsgcpbpg
 R4SekxYH1JbLpFSTU46PUyS9BBZ5u/w1uUX93MYUXXMEhfR0sSFJIU6ntjH1yj+8RuA8
 DrAQ==
X-Gm-Message-State: AGi0PuYrPDn2hf0hr29ybK6vOvthVIdBOD8V/MpSiYDjKbWCsBluIPDx
 8PtvCaboAiXMfUFx9Cj9ms3AsUbqU3g5kA+Ci/E=
X-Received: by 2002:a25:8491:: with SMTP id v17mr54493ybk.316.1586871361190;
 Tue, 14 Apr 2020 06:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <1586529926-11441-1-git-send-email-sundeep.lkml@gmail.com>
 <1586529926-11441-2-git-send-email-sundeep.lkml@gmail.com>
 <999b20d0-4933-046d-f014-a885073b1740@amsat.org>
 <CALHRZup_St5oJqB3gDm+RiVUo2-xwh_RUJKscMmGh=roQAa0gQ@mail.gmail.com>
In-Reply-To: <CALHRZup_St5oJqB3gDm+RiVUo2-xwh_RUJKscMmGh=roQAa0gQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 14 Apr 2020 15:35:49 +0200
Message-ID: <CAAdtpL4QUTXWHLG0M+fGvR0iTbx_qdVSyQSKrvoJWTQ=CTZTag@mail.gmail.com>
Subject: Re: [Qemu devel PATCH v4 1/3] hw/net: Add Smartfusion2 emac block
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.219.193
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PN1482PeH9k0

On Tue, Apr 14, 2020 at 3:05 PM sundeep subbaraya
<sundeep.lkml@gmail.com> wrote:
>
> Hi Philippe,
>
> On Mon, Apr 13, 2020 at 2:16 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > Hi Sundeep,
> >
> > On 4/10/20 4:45 PM, sundeep.lkml@gmail.com wrote:
> > > From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > >
> > > Modelled Ethernet MAC of Smartfusion2 SoC.
> > > Micrel KSZ8051 PHY is present on Emcraft's
> > > SOM kit hence same PHY is emulated.
> > >
> > > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > > ---
[...]
> > > +static const VMStateDescription vmstate_msf2_emac =3D {
> > > +    .name =3D TYPE_MSS_EMAC,
> > > +    .version_id =3D 1,
> > > +    .minimum_version_id =3D 1,
> > > +    .fields =3D (VMStateField[]) {
> > > +        VMSTATE_UINT32(rx_desc, MSF2EmacState),
> > > +        VMSTATE_UINT16_ARRAY(phy_regs, MSF2EmacState, PHY_MAX_REGS),
> >
> > Later we'll move the PHY registers out of the EMAC. Not now...
> >
> Cool but how? Like SSI and I2C, mdio bus?

Don't worry about it now, it was more as a comment to myself. I have
some series doing it, I'll cc you when it is ready.

>
> > > +        VMSTATE_UINT32_ARRAY(regs, MSF2EmacState, R_MAX),
> > > +        VMSTATE_END_OF_LIST()
> > > +    }
> > > +};
[...]
