Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2805772lfm;
        Fri, 3 Jul 2020 14:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLLOcUBRG8+lncv2tcrWAsvfw/Kc2QUKUnu6ryekeZVgCazRN2L4i24E2LkMH8AG8wvU2B
X-Received: by 2002:a5b:48f:: with SMTP id n15mr50695629ybp.115.1593810151555;
        Fri, 03 Jul 2020 14:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593810151; cv=none;
        d=google.com; s=arc-20160816;
        b=RFHiwlLzE9qb8lnfBPvWTOHb66lHo8VBmHheyHLodUvjsOusOmIbrp3z3PCT8e+bR+
         GYodjsRY4zcE6bgX3lExnnrSPdoe/3yOl2I46cT5aqw+DIS3BfT/iqW8mu+JBGFAvQ6g
         LQ2evZUu+zdsiBOADH4W+08Y9FaY9RDK9mWynLwOIryn2swAOIDeel8uixUddM4P34aY
         pueslmjGVcRNCRm1TzJkZ9m/NJJOa5eDdLpmKodJrm4C621iqg3CV1pzHgHe58jD1qHa
         h440taflxqmFFSVyl9N7RjuNHdoSFa9vpN6uYu9ILBiRGBPNudXzaRR3HH67Kz9Cr+l8
         f11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+Hped9QqubUh58Lz19w66OCIr+pQ3Q/OLs6O5uWZmCA=;
        b=BbA4Ij+TMwI+YVDXtzqUyuJl8NbvNNOr0lwqavSxwmHKY3HDROKFxf8Mb+4OOBSOEM
         pJro5Hc2zl3YWfKw27CezLpwsxdHYuwSbIhF082DVYN0Ur5T6tmFyTq8Ws2Px1Km/aBV
         2klA7kSCxg6W0o02ISute/XkPoS6I18+vFC7zHzc+lA73PBc1C81wpbg+u3X05amDWbE
         DkDx6ogz4ymwyzhxDY79B6XNNEZB/R80B9ciqiew0cnm4GJW9GIk3bBzojHn08uacY7d
         WDf9E0JIotNmq+WWIvlxlohOHUsgutMyfYjtl3oiwx6NncNjXhNgzo/IK9gReiPJrh1g
         K1Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=QX9UNZk9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si12159458ybu.101.2020.07.03.14.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 14:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=QX9UNZk9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSpK-0001Ly-UX
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 17:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSpB-0001LZ-FT
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:02:22 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSp8-0003Oz-U6
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:02:21 -0400
Received: by mail-ua1-x941.google.com with SMTP id g14so10398510ual.11
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 14:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Hped9QqubUh58Lz19w66OCIr+pQ3Q/OLs6O5uWZmCA=;
 b=QX9UNZk9R09C8o/m7w3Sob/GDyisU4nxH+ME8sNwNGqBfd5nP2zFxHnDfFiOCeFqar
 r6o55as3btb/qhJJbk7K9VJrVD5jOJCRXDfzms25MHe4dkQkB027Ju9z570K6QATo++D
 mZjXLAbumiNcVhZiOmjZfMNDage1Wa6sTN8WwwLYiQ8n8zuj4KVwFtYs8k8kiuqGcnrc
 zMXy1oj4uCJ3rboBeNk3AwmMOd4z/1Fr6D93ddYxGxtuRTbr96X9JL+STBqvVdYwChMH
 LSvY4Tign60wjIEuxiupMu+txse6hc51IjiOD2ldYgXwSpa9icb++Jg41JOfX9d2WN8X
 zBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Hped9QqubUh58Lz19w66OCIr+pQ3Q/OLs6O5uWZmCA=;
 b=SZUVAQYuJDu155gXMz2CWEgGrCVvdib6qrVubg0gNGo8f+m40wZ1MVxrCMNRu6ZAXQ
 fj+99C+BRXk8txzPIjDuMgQeCF0BS5YjRMqq7x6utFXvI/5uOGR3LAq5h2sRYVHpOi2O
 beZuIAi2ezYTC6DN/WkNzHw46XRMSJzyK4bLyFj3neEDzue3yq7/Cg3kDTMBTj+/fOrq
 oEjubNVKHyuhCf+x1Kv5GDL66SqUjbkEow3ZmCy0DSXU5pxHzWkeropWr3GuGyTiGGWt
 uG+eErdHx8/2oF23iDh84Ef5FDKMDDAALbRsda2oCGPMQK3Yxm8t+A6vyP4IYa2/3Q2M
 q3/g==
X-Gm-Message-State: AOAM533ok62P3pfml0+BzXwLPMwYpFQhclaXGvbgr0MktpL4UhUeM4zM
 hVYRMV4EijezJXRP2qm/IOfwjL4E+oSfDbUZAwJguA==
X-Received: by 2002:ab0:29cb:: with SMTP id i11mr11584105uaq.12.1593810137656; 
 Fri, 03 Jul 2020 14:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-13-hskinnemoen@google.com>
 <56028150-9efd-dc34-5244-2c6fa1f6b8e2@amsat.org>
In-Reply-To: <56028150-9efd-dc34-5244-2c6fa1f6b8e2@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 14:02:06 -0700
Message-ID: <CAFQmdRYrvCHPfXhj0N74dxHWEVk9SuvDLhyupzDi45TuKT=WHA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] docs/system: Add Nuvoton machine documentation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::941;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x941.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_OTHER_BAD_TLD=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5, USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: qVntPfxPWxYa

On Fri, Jul 3, 2020 at 9:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
> > +The Nuvoton machines can boot from an OpenBMC firmware image, or direc=
tly into
> > +a kernel using the ``-kernel`` option. OpenBMC images for `quanta-gsj`=
 and
> > +possibly others can be downloaded from the OpenPOWER jenkins :
> > +
> > +   https://openpower.xyz/
>
> I can only see the build log, not the u-boot/kernel binaries.
> Can you point me to an example please?

This looks like the artifacts from the last successful gsj build:

https://openpower.xyz/job/run-meta-ci/distro=3Dubuntu,label=3Dbuilder,targe=
t=3Dgsj/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/gsj/
