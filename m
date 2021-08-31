Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5363994lfb;
        Tue, 31 Aug 2021 13:16:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbI+8OpvlAr1mBISzS6qsKRBD/5cwkKCL6/S7EbPSYh9hy2soXgQyUPSjsCs0Pg8ooKibj
X-Received: by 2002:a9f:3232:: with SMTP id x47mr20935765uad.132.1630440986373;
        Tue, 31 Aug 2021 13:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630440986; cv=none;
        d=google.com; s=arc-20160816;
        b=dlZwpD2XAs6Rq4TRFOma8fJeLXYzf17KxHzeYAyQUD93VcrlJfY/XygRiga7MuVNd0
         GlUfdwyb6DTSEr4Ix/szb3kUoMesalPuSfCcO4o9XAT6ubSR4LRE6i2RKc+N/lx522rn
         1ZSpOBMjfI2+uSMO/3r9JNr1E8X+O6unWShBEf67CISCypzKpwVecqfrASu5Mlz6OICg
         XN8D/5bkqJRNYz91QW3quctKnOtUEeX8QInlfZS4s4NY23qkNHDioNSx2GSYgpdt+FIJ
         QMG3Epk9eJa8/BhU2Gh0o3mjspi290B8TGts/jSxQuB/zAD+I8tPyMr0PjhLztLDAY0j
         SIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SCqLjISKkEFa7cIEsXq7jv793D3CNJs9UaW3XAPtYJs=;
        b=uTNPaDr2gzlOYWdhXJt34/qsa4EHAHMESo0ujdaNu7TnKtAuVuKGxZGMBw2g6Y/+TU
         JF1IHl7pDLo6wVfHWu/OxH5VexWEHHU4qJO6dsRCTpOTm+ztAerr9HHnjRrTqRNAvuX3
         68vfCH9hUPzxditzLM2XUKAaeoxcaL52sFjj8essZmf0aSaMinTkY3KDHDAcesmt+v/e
         rWe6Y4vRy/AHQMlZrWoqx75hx9IkoYfHKmbWCDiqV08jn7FVlx4zjlsonxTnevSVAMoO
         fMR6oVw9FJ4Fwd1SnO4mMGH4TlczPk8fdkPxhMwr/ALbIorYy3FxTG8zEqv+5Egy0bBu
         QYyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGn6Uq1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si1162949uae.148.2021.08.31.13.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 13:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGn6Uq1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLABF-0002l7-Nm
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 16:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAB2-0002kL-Sn
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 16:16:12 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAB1-0008L5-7d
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 16:16:12 -0400
Received: by mail-ej1-x62a.google.com with SMTP id mf2so1485461ejb.9
 for <qemu-arm@nongnu.org>; Tue, 31 Aug 2021 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SCqLjISKkEFa7cIEsXq7jv793D3CNJs9UaW3XAPtYJs=;
 b=JGn6Uq1Fh6ABcW6cKoAkWysvlFIaz5bL0Z77d55HwpFYyj02gPq0Yy6WdOdSen8doK
 Y8mk56xMxlc9Ju/bWNZK8DgHcbqj7pOaCbS6B82mW1fIKNA/bHu9flnyWD12c3iOy/98
 Bu01i3d0Zq/f/pwsszuzzfYmtmDGT/qt23sVNL9Cb33IDH90er5ZzwWjY1vtdDRjlRAD
 QjzEn8WzBNJSLlYloQyl8GO+2qWzMpizh6zxNaVhl6eoPQtx+WmQtSABXKkjZcVvKUlf
 o4+OadKlMuVB5bmT8HfQfh23XBo6xn7CiQ4d7yPkD7iNx1BnIHoSE4Fy7S8V0vq/ewux
 cIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SCqLjISKkEFa7cIEsXq7jv793D3CNJs9UaW3XAPtYJs=;
 b=V0NbILd7pbcFZLNCcWMoezDU4jvehKv0HUXx5Ttjd+dhFesNMRoruBvPcG+nXIp+oT
 wqw3Z0yUL+p56iD6lPtzSy+cWix1PeU1jtTZmaKBNAVfrs4Jnj+QOS9vYmTVi90AxIDl
 /rF7LvtA6lfD7s/ny2+fd4U25LqQVBStiM9uJ90rzfBokQ+F3tDpnvJmNGZWzsyhFNCd
 5jczzALdfrxTtAkXmraxIRmZl79Dqw/cUUSKgrH8cMJtlWXMx78Kzz6tMykkzVXtwbaR
 T5KEhjPT6G254jwTByd0g+4OB55nIOrGcUWLAH/tnIDC9258wARYu1wnXiQUw6ks/GqD
 ncWw==
X-Gm-Message-State: AOAM532m4YFMOCU3BhB3AkmcuOmCLAiIj8TbFO4O5CTuliuvdUTCNvl1
 +AbYACZFXCDBAUHf3mbT/j7D5cieyhiu1QbXKPBCzA==
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr30634629ejc.482.1630440969490; 
 Tue, 31 Aug 2021 13:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210827060815.2384760-1-f4bug@amsat.org>
In-Reply-To: <20210827060815.2384760-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 21:15:21 +0100
Message-ID: <CAFEAcA_KLQGvxZa9Y4=jVUr3ofM3DASErT+JqVJt+o7-77ewDQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHrHlM5gNAv6

On Fri, 27 Aug 2021 at 07:08, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Since v2:
> - updated "Since 6.1" -> "Since 6.2"
>
> Peter reported CI failure [*] but I can't reproduce:
> https://gitlab.com/philmd/qemu/-/pipelines/360227279

'make check' seems to work for me too this time...

Applied to target-arm.next, thanks.

-- PMM
