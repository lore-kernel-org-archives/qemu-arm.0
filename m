Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E26DFF8862
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 08:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHH1y-0001gR-Cy; Mon, 27 Apr 2026 04:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHH1W-00018Z-AV
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:08:58 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHH1S-0001jt-3D
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:08:56 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-65318dafbcbso9597363d50.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 01:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777277333; cv=none;
 d=google.com; s=arc-20240605;
 b=Aj9xTHn5YBiiG9n4FPkAC137hN6McTSfCN7vnlcpNOom54FpEKowCEnITrvgmectMC
 WyL3wZBLQzfmXqgF6BxiCf2p/sd8HFTzNPszFaOHOtrZOUVenLzmzfKfLQoFcRFsl/Za
 EHVhzxILfdVlHkaC5P9WuJFmUCtbZjylQYh8MKTR0q7Jj1i8Y6bWb8qtNLPGwgM8Npsw
 AsQLPQLZSU1brssNwTHT5wpFhXtA7c1iEaMkTe3IqILw/FG8bHYQCsd0JHIvr4t240l9
 0HIUJg7sfHE+gVxpqEu3SCi1sTVRZ1pGbEaRHkiIiSBWqUunLdUWm6TvhsOXLK4ALQbA
 j7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1q2hYtKxXXpvGxSX0CTof6qHKewYGNFBV26RieKNCl0=;
 fh=b9OD8Kox7QPIUZ2nbieJTVAROl4r13rN7VzIh1+3cdM=;
 b=YyWXSWe+epyxghmGD0t/1N4VvopMK+jKQ92IARucKPSXqYoNRsE9RwdYj0fYBchn21
 UiJpyXnK9qZfRa3dwdx/RqVG39adj8f/CYMjHkfdT1YcSiqBkP1J8OdzFOF3Dzzxqkhn
 O+KTTAINJIh3UACtgpV54orD2/4Ck3nX19UAiQm5BGU8WruDyRiQSQ/nB9gv7ZJ5vvjd
 OmIUIbv5f0FP/iBrbSZypcCMgX/GKJB865nBv4ZdtV7SyhwfxyDbgCmeTDW7qJUFFQBT
 QuJJmusANRQcIFCqPKK0UT4y1BkvdFOCUEMjGuAE7Zv4PlL+KhqPPdDjea9KCNdF56BT
 +uHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777277333; x=1777882133; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1q2hYtKxXXpvGxSX0CTof6qHKewYGNFBV26RieKNCl0=;
 b=NYobF6SE3Fw+cgFNTR3iEq+z2lFp1yQsqd1zS5GaWO4ruP5vP4nG8y+VNK0FWzn3ly
 aqDXYe6FpZKXBHf7QJeeJmcG/e9hnwQuoZNJohPYSFgKEQESlUObHrwYzipFtlJdlUf3
 1w/EXU5EZAOyUwM7HutJq86Xcs+OnTpkocz86tFrynMGggWpyh5m7Ce3a4L8JqYp8Y9e
 Wydhf7VU47ORaLtN8drzO+GUzSDW/i0WlxcBLtXJmm20TUAT8oOvMWySOyNBW3FNUsn6
 xsLHBmfMRwrQvnBYjkSpDXyJmDMhBOT0SDESRzLKWWOPUmm4ih30mA1JBZzVkNi4+4PY
 G14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777277333; x=1777882133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1q2hYtKxXXpvGxSX0CTof6qHKewYGNFBV26RieKNCl0=;
 b=ei5fLoVhxtyAu/8I47wN4WfQosR1/kLeiW3I7FYJteO3b4SX3GdPyYS6U3XvxxHdQh
 gM50y9frYb4mQMwQXfMsaaL+21rBuz61ZWaKBmL9CZMX3XzQNobxXY0DfcZtK1rZB1Fo
 udg8P56qHgWcI8zsn58a45KRToxx4kbQtW3jvIPY1fS0C3D+sbscbSYPFVscahV4Lv3v
 XxFJKZbntjeZWLuA6BvAndgAMQzozTjDgjRASHcP8i58AC6RNwG77R7un8ArBq7iIG9V
 njfxjAS6kF1CSEePXt/cZWkuGsy6yZGBOEppRKBdEFHH2/aIOfzVAiHj/3Ox9jJz7bdA
 X1kQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+jcDCUhhh14wGO74LGwfJvnPh6YWEXHVDHsaM5g02pGJeYkG5Y9aInRySQEi7haQbqr8WufYM4Ag==@nongnu.org
X-Gm-Message-State: AOJu0Yya4EWtALyQpjjX1EoRdaVy1ZH1RXErsTHCdhOOlHPgVK/8VJ7/
 XsdNUfuV8BHb+rOHVeh+ONvrwd6kMirrssnrzDhOFKEGf9vWA4C3j69fCMdw9HXBaFrx+ER2/V3
 v5t82ieGQgzkAopQ7YPjq2ERrGm5xbpf9MaNJMLur0Q==
X-Gm-Gg: AeBDiet54kMDHKv17sUqqkE6dv3nks7riF8ymzgMV5zaIkBLcc9EoyXAaorTo+UEQp1
 Y6dARtakkSNofcSISKCHtiGH+qpjDmW02TFGPNJLw0asCTt7zWCiJNwpFtncLoRFuelk7nZNf2V
 5r0eFxdWcGr9DtSKPH4ti3Gm2DCQ5cP4R0AUd6H2zKIloeApe/zDIL59Jhhuey8YMVFUR716nJu
 CGuasWnaggRvOksBRfLevozRJesdMY0TNBnak8KM+2YbA7Oeg6hh86UwtzXwyY9XDafa3REPxI9
 EGYedEwn58kMmxJSCRz5ShJH891N0nNPsy9jFmQTzE3V3k4qd5lnX3Gq9sqaZHlOWU8egoH6ELw
 kew==
X-Received: by 2002:a05:690e:1913:b0:651:bacc:77c with SMTP id
 956f58d0204a3-6531086f908mr37511750d50.26.1777277332924; Mon, 27 Apr 2026
 01:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260421093506.616307-1-alex.bennee@linaro.org>
In-Reply-To: <20260421093506.616307-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 09:08:41 +0100
X-Gm-Features: AQROBzAMUK3UsDhAuY8DwEr0ywagnC9nDAdCshnyeU_NMGqgWHJ2jlOB5HpNoA4
Message-ID: <CAFEAcA9q3a0+2gzjRinq8i4GqOVeQRLVDvTTStHf0OhNPUAtTw@mail.gmail.com>
Subject: Re: [PATCH] docs/system: add FEAT_AA32 and FEAT_AA64 to emulation list
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Tue, 21 Apr 2026 at 10:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is just a documentation tweak as we already support both.
> FEAT_AA32 implies FEAT_AA32EL0. FEAT_AA64 implies FEAT_AA64EL[0123].
>
> This is however useful if you are using emulation.rst as a source of
> truth of what QEMU emulates and when cross checking with
> Features.json from Arm.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/arm/emulation.rst | 2 ++
>  1 file changed, 2 insertions(+)
>



Applied to target-arm.next, thanks.

-- PMM

