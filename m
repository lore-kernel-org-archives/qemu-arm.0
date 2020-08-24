Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp4199816qvk;
        Mon, 24 Aug 2020 09:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb1PoS1UtG2sHcNtW22gzCTenTACbRc13elSYpImhdT29jJMGhSUQqCvSnv1EaiYDLHKCl
X-Received: by 2002:a5b:744:: with SMTP id s4mr9058991ybq.26.1598287084431;
        Mon, 24 Aug 2020 09:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598287084; cv=none;
        d=google.com; s=arc-20160816;
        b=JitCfWKz5MBjWaOJnEnPN+q87Rgv5+ZCp3guSmfSvxkhG599+zUBzbXJigoxfRdaKZ
         SEpY5Q4/IkpaLLikIbtEYzVJvkEYZugB1CgrgopoFi4Uqucmt2/dE+nAgrFrD3t31CrA
         6hCh1cXTIQq2Nh21pVRLKU1yFUGaqaCu0zPKGE69gQuCkYU+P1cBVceM9SkTlFV6NuYt
         XsXyC8aZ5LIm4EyREfI2v2RRqVDJP5TFe66yrqs0yf71Y5KZfCT2axCYM2tieMm4dQUe
         4KFYqpgi8WD4d0DBQeplNRpby38Z9VJYvy4i0EnU7wAQTLHlBiUe282ScdNuWYNzEc0y
         N2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GJbQLrEXPHCF0Y7PvVokpWg8WvCHDJRCiTpLjr/3njY=;
        b=yR84p8vwFMypGEKxKb8r3UeDwc7PTOc6HStexSwH+EUI24kDDdN6wyb9vP6aaN0DKF
         tguQ1I2qCG8NCJkeuHCaWk8IYL1g50kMyFX68wMO1dxXlj2Uz8a4jrZjT6wuSdBze7Hw
         /nea/+zH7IR9dYerYg/4ulkCX7FcCYM72Acm0OrLdNZlX8TmPiRghinyI5+aIR27JjLz
         +LsqtspdeMxpINh+rYAw/19E4TrCMWlLumbvbQydbOJw4GuWHJD6rYATdPxUKKjR4uev
         DkrCQk7/MjvQU1jM1g0u/bcCl3vPKzGJWamLmXfvyJMNTyC0SAQgJ9elCoeUc/Z0Hm7c
         qVgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OgPqRw/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si15331813ybt.3.2020.08.24.09.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 09:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OgPqRw/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAFTv-00016E-VD
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 12:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFTn-00015f-Vt
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:37:56 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:36945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFTm-0007b8-DF
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:37:55 -0400
Received: by mail-ej1-x641.google.com with SMTP id dp2so7453186ejc.4
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GJbQLrEXPHCF0Y7PvVokpWg8WvCHDJRCiTpLjr/3njY=;
 b=OgPqRw/Z42g9Ts8PU5GHHEVabIOtd/MmD2vtswrmrKbiVY/7TZfEDClJnl8zB5jgJG
 Qnw5TYl907QJWg3RpwFLnfE6ILHyHKapN1D+QCd4afJgoYF5aaMcfEwuuL7v2u1AAqAk
 cxmKrIHYbL+upztG96AIWGrELGmxoIZQ6LUu9NszLIxu8bvpTyoF033LG4aO6Oplwr0Y
 /LUAicDTM01Kfx5HP41mH3l1dHCKe0JatUy1M5svp672dMR57j83N3wV2gLWygvbR8rg
 jK9c8M4mN5ZiEvHF8j9Z17pWZ/UbiA8XdyHtwpZeU4qydOZN4hE88C5C9EeBDCrDnXiY
 fSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GJbQLrEXPHCF0Y7PvVokpWg8WvCHDJRCiTpLjr/3njY=;
 b=CRIlCa3zGyB67WuCfsa/UxCOyhQN5uuR1Q7/DvO2omiCWqf4zxmkexcynWLAK5xh7t
 nacvxy1phOfPm+qiozN3SmTGZq2i6sC1T1S0g5s32kAsHrX6XLOSQsWAjDuVckwPBWuf
 GYHpBkd16FM6FXvx1K19zCnDlDv0KBPX6n2N+DSLW4CkjbLSlOqPpzzCHVtYzhlxYA65
 4+88Ab13tSLpqZPObt28i37kS9UC+rtkqEH1JHALq1W5RRwXOGUmEMcSdWhbZ+W3Zgsi
 yVc2dHh8ohlUjYwPWb+jU10/eOSEs5lM0UVwYg++smpBNXkLU5daIm5QE/TScyO199og
 NxaQ==
X-Gm-Message-State: AOAM533Oaj+g46nGNDdJbJkl2bE0MHl2Ez+Wvnhwxsidyuek8xVdUHSu
 7Vn1LOyi6ys5En+k+4ZjaFCVKxdVJ3/QCXqRQuq9RQ==
X-Received: by 2002:a17:906:b814:: with SMTP id
 dv20mr6352924ejb.4.1598287072971; 
 Mon, 24 Aug 2020 09:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200814110057.307-1-f4bug@amsat.org>
In-Reply-To: <20200814110057.307-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:37:41 +0100
Message-ID: <CAFEAcA8E7OSD2saeZVvh7tn6Qs=qchH+kxSD9COULdiMJsaLng@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/allwinner-sdhost: Use AddressSpace for DMA transfers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Qemu-block <qemu-block@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2YmR2k+lRY2m

On Fri, 14 Aug 2020 at 12:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Allow the device to execute the DMA transfers in a different
> AddressSpace.
>
> The A10 and H3 SoC keep using the system_memory address space,
> but via the proper dma_memory_access() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM
