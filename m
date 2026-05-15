Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F249CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 07:58:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnRe-0005em-Ql; Fri, 15 May 2026 03:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnRc-0005Yw-OR
 for qemu-arm@nongnu.org; Fri, 15 May 2026 03:58:52 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnRb-0008HP-84
 for qemu-arm@nongnu.org; Fri, 15 May 2026 03:58:52 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-65c396d3b36so11544090d50.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 00:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831930; cv=none;
 d=google.com; s=arc-20240605;
 b=Toh1D8XFII3yC7kOdY0bmSaGrqPpOaPr16S6PtU1PpRkr1w5EZMTvYxvFTVyQJmtc+
 qprMnGkH0komVqiFBUL4llRrqH10IyGZlkPkxHAHMFl+YhBZMi8t2/n4vbp8NkPx41Qu
 VsClT9nutjPaHIq19crsiWqn9SyXPb7OAmxeOFxJXjoYp9P90s6GTTXYpLpStApToatU
 T3xGDNp7g/eCHpgRMJ/B1oR72Zy2ORtcxhVYrnFbw7N4YM4zx5IIlGjoO5xMOIybmv8U
 /uZcDyp2yJPH2bu4VlzqlG9VacAN9s8a3ahc5b+jS4mJZJYT00xBdofj/N8ah9HbfYnH
 dHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aCWPdUf0X0iXViYYDjRF8om0aPEQZ7+tPs0RhD55C64=;
 fh=74rqlp/cOjSGKv19rRz3EC9s8AxtEGngZdZHMPd7Pvw=;
 b=IIEKw8sViRLIU9Ew4Q4dbLID0NjmUtc8Ck4filyMaNBmAKXjUonB1Garh1hkirmaoO
 BGdff6TbWBwcy/EPzmSrEoFE526XYbKbq1BdiquWRiW17YP7Tn3Qu8BYHs8+Io7rf3y+
 4XRX+AY5Glu8Q/k8YfAKPreXC2X5U33yFtcRfJ9qZHrIkRpxNlSdVvLwUWYTW35aEsmw
 u37E1UYaeWYUDF1c/iF4/TOnD76Rc0jtRXZNzmlkPrL93vWl2Ui7KC8oXtLU1k2VR54f
 eTnen0/hosodQ41lWIiHNeA82cWAGSZuzhDB3qAEpLvkA7ohGc9KMPGx/fAhe5RxKuQs
 IixA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778831930; x=1779436730; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aCWPdUf0X0iXViYYDjRF8om0aPEQZ7+tPs0RhD55C64=;
 b=bxSK66GiFHBYY/jt6IHL/Bqugw402vNwstDLDKTW0W4dNegkxQGPeKMyTOMdfi3Tu4
 OPD5MPHqYIv0ZvjSvTbeI52QpvlYqMrpK/x9WVX/tKylJ3pwqVYdMvBp62JsYlI/MX5D
 CVjCfItx4yRT3nesAn6pk/nJtTdSf4QFoDyrQsE/SjhzcW1dFWBqIsIa6kejUMfAjT1N
 1M5btPXt0Xbhigcgs0NVMPviJvF947pYRoCu41jk8QH81tv4ZBVAPG7n83VZdhcRhyJa
 V1hOTj8h4e7yXzGwbaT4ta0Q0GHjaK1ilhReWJJfU60/thOPWjE43L8/ChZB1PSHcbv8
 ZT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778831930; x=1779436730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCWPdUf0X0iXViYYDjRF8om0aPEQZ7+tPs0RhD55C64=;
 b=hk+T3+rziYXs8KUavZkmi7VNnJociVPYdXFqWhUtV3afM8+TJBiNux7lKg+t5E1E+3
 /u8oQWz2ZYM3sGH+/XXXg3SKeTU64QGJmC2ALwCqcwc0/pv+htcF216drH3BZRFiTx2J
 yG2AcbVkTA6LXS03dve6fied+7Y/GhlYlM1fAT16sSS54pamYuRScDB1qva6jkT9JWp1
 Fgk6zvmkMEaB7vmYVxH71mXId4fStP+zkFvmu0v8crXefS5aKyY8JvkDQshTbN/gudp1
 2wzNGEzpQQ9DZ775XYUa3j9RtaGjm/qUqv0kHG2/ceZsblJzur+7PLIvXBuL1u2vK2Yq
 Votg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+HPSnwgtf7ksHKLRKomR+q3u7SKOBdALf5nMpvtTVm+IgGp59A7vXf8RwQ2vUnrvC/NO/Y13sSYg==@nongnu.org
X-Gm-Message-State: AOJu0Yy/qpeyZRCrT9y1QwDyjl07IhQGFmPOnTTmOUZsc8O6mM3MjL8k
 x0CUVIX9MHzN+kNDNZYuaetJ4b5pUpz7sQ8JYwdqLoIdH988K2x+nqmBCvbb1xc0TFB7zUVvYlE
 ixer6i0XA0gusdhcsJ2r6S4dWIZn8vEhhSkOBGvaRuA==
X-Gm-Gg: Acq92OFUZ4ZWJfxMxTDLB8G4aH3g41Rg+liYBeyCp3shypsBShr8QwoRGdJRyCmVSUp
 ywDZNc+rdsG8R1nlDrR1ycBh/uxPOjKeN04sXwcUHHm6P5RxWFfsGTqqGzyk6EA8x2S07FlkqXz
 MggwPtz3E6dgZEzkr7C0PF2QS4I9XwBgcv8cCXtysq1FvRP/W8/TfuqL/muOCieFqr3nfSJJrVg
 GL6Bftdd7NU2C7XCOgHaA6HOmdrDEtB9nxxOUMSM8nMYdnGpIQ7ELsG75AXsvrVA4Zry4LfSWYl
 ACI/k9daNvsNJVSOSvpBs91CIPcz1VOD/DQ7zFqYADmkn3/VN8mgW5dPGzRYad05Ft4=
X-Received: by 2002:a05:690e:4192:b0:651:c642:92a6 with SMTP id
 956f58d0204a3-65e2276af55mr2483744d50.21.1778831929890; Fri, 15 May 2026
 00:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260427232116.50586-1-scottjgo@gmail.com>
In-Reply-To: <20260427232116.50586-1-scottjgo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 08:58:38 +0100
X-Gm-Features: AVHnY4KkODd0CK1xC4rM8ECOFUrrGHLW2FhY5PEekLSGhg4ZO1_3B9Lqm13-vuM
Message-ID: <CAFEAcA8_egumRiafxt88nFYBGgfAPaEW=1Gteei=4Mp+pimH2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/{arm,i386}/hvf: Fix HVF migration
To: "Scott J. Goldman" <scottjgo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, "Scott J. Goldman" <scottjg@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 28 Apr 2026 at 00:22, Scott J. Goldman <scottjgo@gmail.com> wrote:
>
> From: "Scott J. Goldman" <scottjg@umich.edu>
>
> I've included two small HVF fixes that allow migration to work again.
> I've only tested on ARM, but beforehand, starting the migration would
> segfault immediately and now it works.
>
> Scott J. Goldman (2):
>   target/arm/hvf, target/i386/hvf: Pass MR-relative offset to
>     memory_region_set_dirty()
>   target/arm/hvf: Stop pre-allocating cpreg_vmstate arrays

It looks like patch 1 has already been picked up into git;
I'm taking patch 2 into target-arm.next.

thanks
-- PMM

