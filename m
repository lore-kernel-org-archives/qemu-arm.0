Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1217846lfq;
        Thu, 8 Oct 2020 03:46:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH5erWjUa8apVVZC5VqPWT1mKQi1409KU+r2fHX8bP5YqBYPUNhCEry/KdMHbD509QqreG
X-Received: by 2002:a25:d9ce:: with SMTP id q197mr9418315ybg.88.1602153974875;
        Thu, 08 Oct 2020 03:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602153974; cv=none;
        d=google.com; s=arc-20160816;
        b=w5bzWShND9khOURpTR1GnqiBWSRBPavX7HqrET8r1kjS6dfcAqArg/mNnG9Yph5Q30
         tcY3IkiFitOgQOwpQax7dClhWoiWx1kmrfpMMmm3lyPYNQ/l+C98Dyj7FiothK69vxH1
         ujCtAD0rmrq5OL5EiZVfzkThjlqf1Or5jhyMnDZG5RdXfVT6/Fq1IUi/bxA7MI2Vfkkz
         p4niUGmRsDqdlFBDiSzIONHokWRspSxveoafhbu4E+iMkDBJE+DOEIuduZ0gFWYK1CF5
         Nx242FqwJQAJJ4XZMTKBrxiLjwnBdUVD9O6uwF2t4d4c61SOOpJC2Ie33htKyWH1Bic7
         CD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BYOGOL7O3px4ZkEMIR838II1qZBk9jZVy+ztlVyqirs=;
        b=UbBPbnv5j9+fh5FLQNz6JF7oz7kOcw7louUxmYzizG4q9AiOu2E6rnDd5izKMGr9Mx
         ZK/X0D9myFcB8MOECCsY1Zr11RjVzmrB7Pjs1qUVtfh5ese7wcZOo2qdeJi4VaalD3dG
         0lVesFaDitOSiW43QLPoXMFB/PpfJEfXW0eAHtWA4jTX6K/LbjJIS3SdnSoPNolIuqKF
         B1k5Lpl4h6tGsK5V1zyQEneTiJBpUO2l4ukp0Ebe2Nxf4eve2+TCtfnW2pct+rQ0UpLt
         xa44y/ec0Lp6e25XhIeRqVsfL3xQssyMxDAKaGqi87oVU3uxl7cWk67ZNulAbrdWv59u
         Z+iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yFsSJIXg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si4230695ybc.448.2020.10.08.03.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 03:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yFsSJIXg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQTR8-0003qB-A6
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 06:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTQu-0003ny-3Q
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:46:00 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTQs-0007ce-NH
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:45:59 -0400
Received: by mail-ej1-x643.google.com with SMTP id p15so7404515ejm.7
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BYOGOL7O3px4ZkEMIR838II1qZBk9jZVy+ztlVyqirs=;
 b=yFsSJIXgxSXoIPHtWmIpgguNrU+6OBjQJI5LIak2fC7B4gOhG4640NYG2Cmeysk9Ql
 0v62GlOgc5NcXJPhM/bXlPKeVTrE0LlzX+aVTm2O2lE/KCJSv98axfpb1l8gVKlauGBE
 vZLoZDAJk3uZ2gxOlADqlEXUpeNdLhIwbfjFjvr8FhOZf1Ue+CSD+TRT6nL+QT1RlYCj
 uFrrKc7x6jWLa00CAdPbwztAEQdwMfBsbZgGE6mJnnF0KDNPfDc0VmN5EEp9d2HVATna
 AsOsCLSKR8ZN03p8sVuk05S5ZBRSPz9lNM7KUa33ksjY108n49Ri4G3oqO2Mzw1nnHSI
 2piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BYOGOL7O3px4ZkEMIR838II1qZBk9jZVy+ztlVyqirs=;
 b=Iz4jKrB7VATcWeDxrypDPlQvapmvxRVhMf11fU7mZpPxV+iZ0fzBAk1ujq9UzvS0rt
 cwZG9I7Ldd17kIv713Ets3LV2EAvzlRWs33SjmhdJmz5ws/sMh2ZNzexpUehnW4VusL2
 tQzVJ+kO7W+rsvWd6v1hhRVkB6v7aze0xjhp+PcG57scZ6za6xUZlJNEf48380zDfTER
 9V7d2SohCHF+78VTHWhRHpIX/0uMlapgxhHlsBuDFfaD7u/MIo+e9UV6j8Koyo2Glc4Y
 6vdLYH9imCldz6GarZxWz1tvi6IH7oAnJPn0Ll3Na71mF3IPWEZfs21EJn02zZZ4JAdg
 1upw==
X-Gm-Message-State: AOAM533hU40mZS+uCoobqhNYAv+LF5nzl9fRMh2i0PeBjK3Kuek+u/U4
 eygOAoJvitoZYWaKEkhbzKPDB2T/DXi3/49oQG9uog==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr8276487ejb.4.1602153956716; 
 Thu, 08 Oct 2020 03:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200919132435.310527-1-f4bug@amsat.org>
 <e35e3c67-2f45-c1e2-b8ea-6f3512829fe4@amsat.org>
In-Reply-To: <e35e3c67-2f45-c1e2-b8ea-6f3512829fe4@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:45:45 +0100
Message-ID: <CAFEAcA-Qb4znbRtHBWvp2pUJwJdhfzRywYsOPdEgsqdf=YxSgA@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi/npcm7xx_fiu: Fix handling of unsigned integer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OKExpOMsXPX0

On Mon, 5 Oct 2020 at 08:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Peter,
>
> Can you take this patch via your qemu-arm tree?

Sure.

Applied to target-arm.next, thanks.

-- PMM
