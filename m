Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A27FCD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:13:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnfu-00076y-9E; Fri, 15 May 2026 04:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnft-00073g-2k
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:13:37 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnfr-0004M7-0Q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:13:36 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-65c7492a2ceso10034694d50.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832814; cv=none;
 d=google.com; s=arc-20240605;
 b=Gc3sbwEV9YjFHsBeYAGyWqfXmWgQBa1Shuh9mO24BN/l7LL9VF2a7zwFFKQ4Y3kDSh
 734gywLwvMj+Ne3nUN+ypFkI3ZXbFtAiQvV7N0dJGsG8+BfrfgA4UhM9sbQrvJmOn3Um
 cKfLYL50vapjTCGX7hMwL5Slj8EHLbz7orvozLUjR1hwATsHLwQUNPoIdaFGKTkle0vr
 /0jaQhvNXxmEi9M7HLUUmvm5TrxtbDy8Qf6H5z96GLuTF0QoO9GTOwoWQZzN0QcGIXhY
 3xif5PJebYTo+qg7yaBNvmsy5DHUFRbv6m40FsPr/e2ml7BoXM1ARb5NfxUZrnlyw/4H
 gmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XyrErN7cbbGBASANmj3+ZttdGIYnI1ScJ2BwJK3w0nc=;
 fh=cJ9ReLsGrLWvmDPZAVS4ck852uWYO5gr4y1pqWcLJSI=;
 b=ih+Nue8xZ6MZJvU8HPBlrp+mWH6OebPfNNFk7nEmORCycynVEI8XhJLqNOedxgq6NX
 PVYMz+nZq0cK+wlyi6noJQ35NCAc8OrOfU4opWFvGMzQ4YGNHGxKCLz/nUxWkNE7oWQf
 60BCSmoXBlV2zBsv0lrKSSpB8glDf1ksaeUdah+znInRY9SFza8qwN4k9duBV3RjsZ+a
 14Kh4Chj+Inz35tDmrIU3l87iJsnQA1r7SNLTIwS2HstZcguOKz5A/VQWBNk7JcGUmp6
 4njy4LU3MrPrxV0VIyEZMEld0qSiUCaqGoegnGtBxvoXGHLd7WF65ba021HxlbyOoDJ/
 r3Yw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832814; x=1779437614; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyrErN7cbbGBASANmj3+ZttdGIYnI1ScJ2BwJK3w0nc=;
 b=RamBhCH1tzmVbUwSEkL1fKGaF7U/MjttqI8gZ7ftuzX/rZNZr/bzh796V4ZE+Yo0Xm
 dqVzFvJEiJ1sHYrIr3jQ5C2/H40ZLh3sYS1MuWGKmduP/5H/Aa/3+ZYClRSuu2RF1A1T
 P9LEGuk/V02dR0Ir3VHzVcVFl1sXOrJG+Y9JzXzEq65/Uu75TDQmGSpplfSv3AA2ToA0
 xFM7XCBBzhuAFoSR9FioqVTHRLqF+O884enmheW7Q8y9fvSZg7BJOxxd2JgmwPP2DIhx
 i5IP/HSU80ir8YWGGEQozJY7mZtNNPi9TEaFM8ipZeJXRd11yny0F/fAjbvAgTNmnl9H
 OnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832814; x=1779437614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XyrErN7cbbGBASANmj3+ZttdGIYnI1ScJ2BwJK3w0nc=;
 b=bV3SA48nVZAvHhqibGifr7JhHelNk2qnKFYOOrKjTe9vHyEcAPR02xo98mQIYe0Vn4
 FAyX/q3GYLpTWu60aO2ZOCKt8uoBSAQVxwIvYTuBJOZr5Kwbiml1Q2JuTjz8LF20Ov9n
 +wNvQg0kXgPR50W14W0i4AHzE+r1xGYILUybWdzyGzSWhf6ZxilQUvkEG+QbckrH24VA
 IbwEZC/wuCuPt9UbiHFkZ24NznIEmhm3e9hAHMW/IcPvoFyoKUVws+lTgSK7aTWsSpW2
 c7P8GDJoS3HMMgEgUvkbBy93Azu6ekrXrjWhMAhI68PxJh6ID0Z2Yy0OvXBHGtlMhSaI
 eIYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VXxJExlXTRxH+Dx+IfwCDHc/LCRfZwoNUbd2OYTkIEGVCSyj1o/m3QmDo81F669SXbw/02QZYDg==@nongnu.org
X-Gm-Message-State: AOJu0Yz6qR3uPpvpuHEwEhte23LpQceyXzfffGOxU5OCzcrQwWbqRWNx
 6+aQ4o1JNPkTsKmeO0C+e+H2ZTuBA1ys4ytcCUiOVnMzypOcIa+tKu7+rTWriAPYXwOO5gngXR+
 1vOD5Z7Srh3sNC0UI3aAAsMCmmliz3huQg/dbd0qwVg==
X-Gm-Gg: Acq92OH2ovunb3M4lW5LmrVNtFUYNWKbdHvR5uXsm0pAPqRrgApmm2/HCEp2H9gPAcx
 MGqxRD2w5nVVzuGHC8BC6EKuym/M/pvBp/ObeuKwyrvitm+GBSdyDk7pOZl8gFDdjBZUvoF11wp
 0vockso9eIRzS803JWQX9g2xU8Wku9vPdrMQyMc+4xnzT/3B0mMmLG8m6TWx4cbtcLSfepH5ozx
 Kvod3M727wvSHNJJn+Jv3G9nbNifS5GBtBgAHw+P9RfcZeh3BBjIZjA+ZQgbXe49k1mercy21vp
 L74tOMpazhbsLVm/VVyqcaPO1bY9SW53xhK3SCbI14Ud1qzoKPcwRheSZN0Co6mDd8o8MkHroZw
 M0g==
X-Received: by 2002:a53:d005:0:b0:650:895a:19a6 with SMTP id
 956f58d0204a3-65e22849a88mr2602687d50.56.1778832813786; Fri, 15 May 2026
 01:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-13-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-13-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:13:21 +0100
X-Gm-Features: AVHnY4LQ3dBhG_1d8HuEBIeuE3mVHoqQzC_EK7P5O08xXUreFyfHDisCexMMRMQ
Message-ID: <CAFEAcA-7so97etPHqGa8RBCKTo1OjQKi0bQDXVm6MAK6XbV3aA@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] hw/arm/xilinx_zynq: Split xilinx_zynq into
 header and implementation files
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Create xilinx_zynq.h header file to expose ZynqMachineState and
> related definitions for machine inheritance. This enables creation
> of derived machines based on the Zynq platform.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

New file should have an SPDX tag, but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(as noted on v5)

thanks
-- PMM

