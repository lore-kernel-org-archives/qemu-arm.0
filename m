Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1107148lfp;
        Fri, 1 Oct 2021 02:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI/HFA7kuzPSZ7ecQcNhGGlYkwXO8g4uhKA1kiFLkxK52369U2pWgGAM7J+IDWFwmj1rds
X-Received: by 2002:a6b:ef0d:: with SMTP id k13mr7455262ioh.54.1633081973844;
        Fri, 01 Oct 2021 02:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633081973; cv=none;
        d=google.com; s=arc-20160816;
        b=qae3sfcZZsXM8KPa/OjDYHdkDwfgxVOpI4I/4JKFO3uNbDeN6a5EQjK0kXvPfy0ADz
         eXrDbm0WeDgRpSQ5KRB/EInfdVYoH7+AhWW+R2M22d3DeLqya/xyesOdgx1iA3GjXVhK
         Bdao8JtQmmNhk+Nrg+bsCM820w2PO3Ekor5cgQ4tj0JZa1EeYMEy13u5uWD69QE/rvve
         Mxp88N1X89bVh5ZHM98meIF4uxpvvrhRN4i/uPDim5XGuVTx0L5cJxEA0L/kPkf6Z617
         VjrptUzXiZAcrtKsz5hX3NstLwhSSsOEUfA/hc4x+VNXMvvvWAh09mGoqZu5A7M/dBdX
         m/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pMxVAulQL3BX/ibV7J034cNBBMoFb7MKAPOGLq89ONM=;
        b=brC5xHir1w9UUlyr6/eUarETnRLcz6WcNlHHpxqx7q2npQZcdUMMD7iV3Fj2aF4IBy
         crlX+mRjP1K92i8pcULdSTFt7V77hkg671ma4sZ2vBCga7zJIzWDSvgpcE8Pt9jrvGe1
         q76NJUI6ZKAwxU14edDoBinLgwJmUtU3EA7gx+61oDJSBdFwrkU8D9d1XDHkUSY98i+n
         +pAhse20yUMVwDO3zqEREGkZXffAOpKN5fMdc/fa2IzokvrkDxl9QNUvzcs43CdZIiVA
         E3DtyQXaCEBQqWMyBmDTOo0b/UWNYbZkCPIgNolmM3AxzLdhhZYUUthViEcjbKL37QPd
         GYUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjEEtmdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si7914059ilu.130.2021.10.01.02.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 02:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjEEtmdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWFDp-00089O-5M
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 05:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWFDe-000871-Mf
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:52:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWFDa-0006Dh-Oc
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:52:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id v17so14520201wrv.9
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pMxVAulQL3BX/ibV7J034cNBBMoFb7MKAPOGLq89ONM=;
 b=vjEEtmdXDPEp6UtJfe8mMdSwSfJrJGfKce8n3k4hJ96OW86OBuj5eE+zFnpcKIFkYe
 3DHYsvPKzeXTgukNYkC/KBtEau3S9S7zs4uP/TGvg2eZF2NRY3y7lozNkitYz3+V0pdL
 flfmxWW/Mk7+BgCT1khtcA8WNBYlVBpKuMedrCkhHxrm8FmcOEZ3fvLGR/0lXZpolbIu
 zip76rHPzzh1MzmsbtUmrZfa1j7w4x9GqEBbd5ayC2rdGENLMfJki7sRD+cIvrgKwVT+
 HXjFpTd4gdiTMLwNWNvQKZHoVwe+8nHPeWEpzdUoY3KvdI4K8ppXAt+vzCn2Zwv3LOA8
 Tajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pMxVAulQL3BX/ibV7J034cNBBMoFb7MKAPOGLq89ONM=;
 b=ge/tnXEmwtx65kQsVp+B6SBy8eyUYaeEcng11Ic/eOjor85EQRtOfmQF3E2IB5QhfZ
 ixl9e/MT15LUGi2dpXj6oXXuHUp85aeEn5Vgf+VR3nZ+G1BgQZoqaWBYtqdWaHIvsOYE
 Dyp5mV7lmWLe6OSJzkkaYOTXJwNta8iFbF1WPo3fGIferer6YKHCIW0H++GeAZfVdGZa
 HPNS1LAjp3scwcIXr3owSXk4XD3Q1Zr66C975FXjQ8xl1+r/rcIaTWjiBRCM+wvIuvQk
 I+ZlB5Fe3KqwCMAW9X1mTJkHYXhuTjEmyqq0KgHpYFg12h4HMsYq+J9Cqnb1CS5HCs5X
 bTXw==
X-Gm-Message-State: AOAM530/ELn5tn5otwWCdGJhswLkLPHuvK4SBewq4YtIL0lmjGdsJ2gV
 8UgnK0c+neLYVkR/v72NrwY3EDyEKDpdGN4vlsEwPw==
X-Received: by 2002:adf:8b98:: with SMTP id o24mr2119222wra.302.1633081956032; 
 Fri, 01 Oct 2021 02:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
In-Reply-To: <YVbYavVeV/OmYON6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:51:42 +0100
Message-ID: <CAFEAcA-_6BYX-MZ6LL0c4xJcqyz_EbOWeBGbteMByvERFq4_Xg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8fMY9vxcOJ8V

On Fri, 1 Oct 2021 at 10:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
> > I agree in general, but (per the commit message here) our dtc
> > submodule is currently pointing at some random not-a-release
> > commit in upstream dtc. We should at least move forward to
> > whatever the next released dtc after that is, before we say
> > "no more dtc updates".
>
> Yep, if we want to fix it onto an official version tag, that's
> OK, just not jumping right to very latest version. We might want
> to move it backwards to better align with what we're targetting
> in the support

The reason for the last update to the dtc submodule was not
for any specific external API requirement, but in order to
get a change we needed to get it to build more cleanly when
building it as a submodule (QEMU commit 67953a379e). To
not regress that, we need upstream dtc commit 85e5d839847a.
The next published dtc release after that commit is v1.6.1,
which is what this submodule update patch proposes moving to.

-- PMM
