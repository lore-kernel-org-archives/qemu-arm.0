Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4200192njb;
        Mon, 19 May 2025 08:38:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtyIm2eiCx8BiRVca3j6vJPiKUad6isRRwJIMh4cEuYBqfwJAkF5YP9Swiy69Rrwrovrk1ryVfPJj8Gg==@linaro.org
X-Google-Smtp-Source: AGHT+IEr7S04DkuoXWhYo0GxAr3lEvLHAN5G9eHOYoB6dD64K7GRqBPqb5v7JGRAmT6ADC3c7biM
X-Received: by 2002:a05:6902:991:b0:e7b:94f1:38ef with SMTP id 3f1490d57ef6-e7b94f139bdmr9321002276.44.1747669101028;
        Mon, 19 May 2025 08:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747669101; cv=none;
        d=google.com; s=arc-20240605;
        b=S6bhFW6jhSn4OXDVL30tT2H5xjmolNIp7fqfRGTFCfLiiY1OHNrvKi67htaGxH0LQh
         g0lsbwUC8y+XXEe8AJqhrUwlfKLFy7SagCIIe4bo9EgcsLkOh6v9HP0NDbthVVJDa+gL
         SZgMZ8r7NdPsdDFzF0yRCREaEIG+muX9CniAr8Sr3sasaN8iDmnxkcqlnuulx/N263Od
         3QxlMsdwazB3/vpe24ZC7qxQBye9iIPZRuDbQ0ifuqFm9TircusMSmzvbs7dRL+3wRK2
         07VfDcXhZkrnELqO9mIWnLAzkEeQVT7Aw9M8BAMdz6lRw3iVhcGdpYrh5MrUfnmzw/Es
         3prQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UTyg3KKxLAz6/kpwgi2CoJ6gaTf37AQ3cfdkNk5Fnno=;
        fh=hPMr/bb4gIbPc+1mpnm9+Qh8VRwn7tvDNxTTHAzeZhk=;
        b=b0eIb8WpRFOnPiOzu+FDj+44Y1JghzRmceQ3Znjmn0EpICIV89HQinO4Yy1y4ik7+I
         nJZRaCr41jwgW3m9dhyz+gWord/Z2w9fuCe4sY0F8VumotSe9/Vzd2ZUteEUXo+T/0tH
         lIueRmxSFbhi5436zV5aN81r001RmcLSGZ2LwmTWDE+C4Zq5+oKXlO+2PTnqferI/7/l
         7BT++Ms470NZ/3KmCZvfNdW0lExHhI/OGBUoLECvIZFwivFGSyrYfCZtmB0NzZslGXMp
         IIRFCWsIG9LNfCilQ7JPckT7sxJ+KeaWJfAU8DLyBTryI7w0aHnwul5wwVyKifDuD1Ja
         k/aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oR2w4gHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e7b6aff3d37si4792900276.345.2025.05.19.08.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 08:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oR2w4gHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH2Z6-0007ic-MZ; Mon, 19 May 2025 11:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uH2Z4-0007cb-8a
 for qemu-arm@nongnu.org; Mon, 19 May 2025 11:38:06 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uH2Z2-0007S1-Ac
 for qemu-arm@nongnu.org; Mon, 19 May 2025 11:38:05 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-70cb1e8263bso23101487b3.0
 for <qemu-arm@nongnu.org>; Mon, 19 May 2025 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747669083; x=1748273883; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTyg3KKxLAz6/kpwgi2CoJ6gaTf37AQ3cfdkNk5Fnno=;
 b=oR2w4gHkaM0cpfRWVM3gXZWLbYwbeSm+WhZE4pZ4iVJ5csExidojphOTVrCOBBmGFp
 CpEXFJitPDLeGxcopEzc5qaCpVH1kOeZayqcwNfBCnPtc/jtsnwmeshNR2vtk3ETilBV
 C0u6nCuTGEnrqlCCQizzVxd/kVOY5UR3iPInpaWrdLv61Fi907pedLJEQ8rrEu9pPFcR
 An/PbCwg9OEdvRKEPnM95jE0dJfkO3Da3W4rpLglr6gGyQLLVhb+s7GwspyfFa76npNY
 8FxDOTJE2XMH4n2TlbPQEB3aSeb5jy+4JPzzpZYhJ6SpZ6hVoa0EKCtdEhmVYPqGgscO
 +9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747669083; x=1748273883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UTyg3KKxLAz6/kpwgi2CoJ6gaTf37AQ3cfdkNk5Fnno=;
 b=u1buzN+gmOz27lU44ZH90d5A8FXjteOGmi2/0GbJzfyHAILoAMp9Z39SVTrVNeSA7a
 PmE0yxc8Wigw1U3iPp0AD4XS4wOznZu8rdughihQ9YrgcPDQMVGycerD9KGalSH6WYa1
 3JCgizptXrK/nef25jC2yK1SZ71fn3lSTMYZ5u4nxPH2Pb6xJgbiySP7r4iF61eRugRb
 BeG6LSdwcDt5UCKT63Ajfk8z8lBOWpGXHlBU86GeLL3mqhNzj5Bt1QnXlUEXfzdHhwTe
 wkHVig1gZgmXtPjcjDvyjNTu/w82HRlDQvNc2A72ZUs+FGLAE2XQLaG5QScrAxAaI331
 ImhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5IuQsmSItSCdTILbugMCO9kRmmT1lN0PG2hmzp+DoOHYCD74SW2vgnp6DsdKHtCJNok/Vu88O/g==@nongnu.org
X-Gm-Message-State: AOJu0YwsRBaRhURFG7aRazwQqs5+d+gHeLRSRwkRFfPIJaUI1ISp6cfd
 WXLGlbFfwObRh8NDkAlZ42+cVLLLoIaXijlF67dT/r+Iq/r7IwsowUyx9wnUjZpteyNsK2hLOzT
 QF9IU78JT5o4Y+jzMuLD8tYdv6exxel3rwbUQ5XUQzw==
X-Gm-Gg: ASbGncuFl8/VIVSvwaTU8hLBzA4vJiVcDUJ7WVq5I3YczvF8cHslDVtlPgK5B/QWdC0
 AD9f5x7qa3h8YO0aYPCC2WPbhTmdHTHyTMBRXMMULtaXngdyFsCdtFnWMyvwERWesaUuCJJZA1+
 epBUKtcQRyTIUCfQVhLiQbqLab1lu0zTMRTQ==
X-Received: by 2002:a05:690c:660c:b0:708:16b0:59bf with SMTP id
 00721157ae682-70cab0bb8b4mr181576317b3.26.1747669082768; Mon, 19 May 2025
 08:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-5-chigot@adacore.com>
In-Reply-To: <20250513141448.297946-5-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 May 2025 16:37:51 +0100
X-Gm-Features: AX0GCFu3jjc_yELAUeeYct48GUQy9tp5v2mEXKVH2mleh-jOQG75mmHSIUVFGxA
Message-ID: <CAFEAcA8qA-ZyWihgSkw3Ubnz-WyXMB3m_MT9facnktqbXAM7MA@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/arm/xlnx-zynqmp: adapt cluster-id based on the
 boot cpu
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cXKOZabDmojp

On Tue, 13 May 2025 at 15:15, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> When gdb is being connected to QEmu, it will be attached to the first

(QEMU is all-caps, by the way)

> CPU cluster. However, the ZynqMP board has two clusters, those being of
> two different architectures.
> Therefore, when gdb is connecting to the ZynqMP, it receives the target
> descriptor of the first CPU cluster. Up to now, it was always the APU
> cluster, which is AARCH64.
>
> When booting on a RPU, gdb will still connect to the APU. If gdb is
> supporting only ARM32, it will receive the APU target descriptor,
> resulting in:
>   | (gdb) target remote :1234
>   | warning: while parsing target description (at line 1): Target
>   | description specified unknown architecture "aarch64"
>
> Adjust the cluster-id based on the boot cpu will resolve the above
> issue; allowing a pure ARM32 toolchain to debug programs running on
> RPUs.

I'm not really enthusiastic about renumbering the clusters
like this. I think you should be able to get gdb to connect
to the second cluster via the multiple-inferior support:

https://www.qemu.org/docs/master/system/gdb.html#debugging-multicore-machin=
es

thanks
-- PMM
