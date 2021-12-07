Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4641872lfk;
        Tue, 7 Dec 2021 07:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK5eolLaibA7qsl3cPhYybWLvTHJyW5fV2P1jPAKlmx2/5x8chRXQp09aRJQDe8jwD368p
X-Received: by 2002:a67:e114:: with SMTP id d20mr47200544vsl.5.1638891988055;
        Tue, 07 Dec 2021 07:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638891988; cv=none;
        d=google.com; s=arc-20160816;
        b=Ry68vwvZKJsMTEPNCMctyQJmZ2wsNYcE34/XJdNTHU+nU8nbZenKWBJJ7T8bPcz2nI
         tnjnGybxx9RL3Yy2bg90wm2PnF7lOAejy7fCkQDV4TlEANzFFPzptMALR2GxJFngHvwM
         beE5DDU5T1x0R7z7oAhG2j+oppQKHR3aDAEv3T+b8Qyr97weISHLwsy7xUhV+LDTYA4T
         GLx2Lua8W/IST90+vNy/c3NpsM1iTG17Zvl4MRNPzSndGNZsogzi9fo3B4Ny5Np3fEKP
         prIS4yuuIzkHE76fDHDAQO3CHzF207I2MJY68J5mfVtS9y/SPd2V4Ifi45maWYXnmDEI
         fgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uvnNEM8JD+Q+EFbLDOX+y9losyOBY049XcucY+k/TcI=;
        b=Sb06yT13TbmlcmQEco28aAWjM/cK1mR7Y6g7Riq9uipivtuePhqh6ru7e7wAPoh48x
         X0gEFW8EJZagm7BY37DRjs1b+sbdUrNJPzBeKr5CXy+phl7YPgreIeYfg9fB1ho8XFRc
         Ed6JDvV3/wvkaD4Yw2prcBS08RGOtASfjLpXGn8IU1t6yKODxO1+k5jki1183/oSkVXd
         FWYzHcdKJkZVV29vEc7hJ8fKLxEK7oPeZFY3dK1ID6EnNGi0uyOtEiXdGeaDCQwcpOrd
         ZAT34FJXvGbjCdf41QnXfO3m/58I7E2WJb9k2rait/4rJBax5Vo20w3hQwcVD/gLHQDX
         X5iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcTt9QTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si18290339vsl.227.2021.12.07.07.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 07:46:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcTt9QTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mucfj-0005OB-EI
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 10:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucfU-0005N4-IW
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 10:46:12 -0500
Received: from [2a00:1450:4864:20::334] (port=37609
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucfN-0008OY-Ef
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 10:46:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso2070891wms.2
 for <qemu-arm@nongnu.org>; Tue, 07 Dec 2021 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uvnNEM8JD+Q+EFbLDOX+y9losyOBY049XcucY+k/TcI=;
 b=XcTt9QTubQund5m0rXC/jfwf3bCZjAS+WUbbfz1dIptglQDXCRkSSsWj+zuxe8UO85
 ak+tnU1trNfEm6Qy/P1hKgHOuUL+1DOs6ulKVkf+SvnWXxlvFPZXp48Plm2JWfExqQIX
 rACk+eEIGFa6fh51D+7CVDJt7C5jm/Y4U5NA5N9Nw0nRYXsF1JO38CqPXVSccu3Y1mXS
 LfRrnynPeEXzxR1cLB7zKlsIxpi0TDPyEvSJk123aVv+x/1dQ515p6sWkbU/twsq2LhA
 TPwZLQK5e+lPw5A7d7kOSln249BAhGIuoYIph1cEJjRxYRDeBiUVQXsEsiN38b9omTl5
 XLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uvnNEM8JD+Q+EFbLDOX+y9losyOBY049XcucY+k/TcI=;
 b=7BWamH+5YkrL/2JCcrUoOX20ftPs5AtIYoTvaBsaqhy2wEvIDYOI+JXgGw/9Br3f3D
 W90sRopQK1px6wHd5RxqAvYoarQPzo3VZkekCALIYh2pZk6Wb1EW7e/ehoNQPOPOjJdl
 MQ7TgHGHpZhugrLOF5ZZ5eiGPrCF6spfejooUdZyV/F6zUHLdBTRUa0g9auNo7K+1+9Y
 Y3Tuxlt4r82GLqrM+pMgSwhtvzWTctMAdWHV5Nbs1/+7elKSpnnuMt4kPRZG4ZpzlcTo
 cNvVjSyM/VHWhhkr0VdFzDg3gpgkMlgmFvfJUJCNsrxLeA77oDRJstLDYZ6Ulun7hhOV
 eJKg==
X-Gm-Message-State: AOAM531pT5qMkxfrqJpXG0Btj7pjFJbRqCV7TUXeDkMM5fKeihNUts2m
 R7S+EtJPSSv/vExIJoXNyuNsPFEfbkcHAel8/Os/Ig==
X-Received: by 2002:a1c:96:: with SMTP id 144mr8073915wma.126.1638891963898;
 Tue, 07 Dec 2021 07:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
In-Reply-To: <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 15:45:52 +0000
Message-ID: <CAFEAcA_C17byZDDdenOfmD6TU4UuTq=uHfXQxdurppaa18S4mQ@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Brian Cain <bcain@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Sid Manning <sidneym@quicinc.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dDIA6LisCVcE

On Tue, 7 Dec 2021 at 15:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> The bug is a bug in any case and we'll fix it, it's just a
> question of whether it meets the bar to go into 6.2, which is
> hopefully going to have its final RC tagged today. If this
> patch had arrived a week ago then the bar would have been
> lower and it would definitely have gone in. As it is I have
> to weigh up the chances of this change causing a regression
> for eg KVM running on emulated QEMU.

Looking at the KVM source it doesn't ever set the LRENPIE
bit (it doesn't even have a #define for it), which both
explains why we didn't notice this bug before and also
means we can be pretty certain we're not going to cause a
regression for KVM at least if we fix it...

-- PMM
