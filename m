Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC22C88E6F
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 18:22:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6BJU-0007YJ-Oy; Mon, 14 Sep 2026 14:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6BJF-0007Tf-KZ
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 14:21:42 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6BJ4-00062e-Bd
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 14:21:40 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-66c9995ca60so69704d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 11:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789410087; cv=none;
 d=google.com; s=arc-20260327;
 b=e4lCIIZjbuhXGGZ8tf1XJnH6BiSoTsoJMKOuNV1OtPYkiBjZk5RDgCAHg149ILRiPZ
 MPTPxtRsctubTDNl3M0Yv2qc9JpuTYrprzfMzHlVHESLRvEZ9Ll380EVugLM7PdG8iwQ
 uOeoqu6ac29vKHQcM5kNpQxPpYq9c8hGRu6Ehrs3dHatlku1DfBGMB2AbwQs4r4aWQbN
 FBD5Vwc3oRKlU4iOdv1Gt4Xf7tROsM4RCXapl34QCXk5ZrLJRddC9u9O3cVBmsf7sS6j
 DQvh/M1UJ0oiSurBaYXfnuaGWWEos/mNvcA28tVrKdeg9Ou/Lt7qqRazL1KnjGxubNJ1
 sf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gJIVwsqYH2Ah5mcekCYPyLfQfKzQzbJsGOyIhIdz7PM=;
 fh=N0LYPK0kZ857iUuT5NfZI0BVZ/MT53ragPXTe2w6jTw=;
 b=ON2pPyiPyNpPGXCtaxSRCuivYAdbW58qit3OYZFOYsP1YE0xpXhFnmp/i8lU29uXWr
 Z5WwE5ftAP4n32Oz59wPiqMSM7qlQ1OGhQhn5bDFXdmiR5NeUkErBpy7mLWuG5mxICyN
 kVRDG8e4qPpBVsz+q8zrWjTXVtYnHKc5s4xAks89v/pjVVSGWCIVDLlKn0ud65+ND8Vr
 87Zh43X6qQilxliC05cZpTjCOj90wfBDY6442XO9cfolDzOiipzH903mI0/M7NI80K3z
 E1zq94r4MiT4Rfp1KLr2EQPf4cSF505Ol7z8hqCdGUPShmLiIJwPNfK3A6OMmT8LFlVa
 5MSg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789410087; x=1790014887; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gJIVwsqYH2Ah5mcekCYPyLfQfKzQzbJsGOyIhIdz7PM=;
 b=eP0R7aPKYN6KGjf1V5Ogm5rUEErgauawJZFqFXT0k2sdfnVspPt0RjJAjbSdI4Mh9x
 XRjWCyqxX3P5olz2LPBYBM5ydFhNpUXyLcKkMkqBKNecJarcypHry4JvtQj39vR1bwJ8
 rv5Y+EjgpH4KfAWbPaxGXOikpN6rb1t85CnYLtlDjHsFN7Xd1afjPfXWfuD3LEnwFB6y
 ch5iNuNJcFBZh2htKVCrsaqz7qt1Hih2Frgq2r+mWDU8kuR0hlMMyJ0IhEW+yOEkwzYd
 s/yv+sDiAkryafy5y1P10fuIYA897XhWiEJwWPKW/MqNUN8Aamycdid6BlW5QaHAfcGw
 70fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789410087; x=1790014887;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gJIVwsqYH2Ah5mcekCYPyLfQfKzQzbJsGOyIhIdz7PM=;
 b=MHl3yCP4qYorFZxHWiXYYQRD18+D+GD/oNdbZmtbTEMTo0QoAgpWNpjmXOJUuqb4Q6
 LPS9+Ut5AdXfnm/SOt+YFqfBO3QHIxJH0RCcTwJyg6C0OKrH59uibAYTeGHSz29a5UJk
 6piUMaXXfIIlcuL2PZCKr8gQXKMxUd6fMjnK4v4hz4o92tLH2YWz3tvv+EZif3kGYaKL
 U3zBy4Ggu4hnIpRq8XkoVlZvyCIWCeRNH3yPVpRRQTFBKHpFOE5/F9v/8VdzaHv/v2Fr
 lOJSE7ExocCou6xFIbvZILndymDHg6uQZX1uEMKA+trY9pa6+QDDeg+JMHq/cnBpnB+T
 oUzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8bt9g0bQBG+/io94ImqEJjPyhqFECm9kQeeOk+uiicpz22+5/8pGqZd5S71eovFGgls/dcCw79w==@nongnu.org
X-Gm-Message-State: AFuF++nmcuo1bBDCyHMwNr5iIRbXkUtwGy17s4Tr49A5XfO1VSf0zxWd
 Wyk9tY1b0LTk1rmHs9zEvzR/NW51/mTIBtO7NfrGSf54NflhL4q2visZpHW08/HnHKTmd0JWt4y
 tydn9wo0Fa5SZU588gPECvf3YOT9zXUV+ryG2NUHD8qi58znxPOlYpBQ=
X-Gm-Gg: AYBFou1BAWrPj790y9ABiiGnT7hCFTfHAFWp1lNvENew/R8Neh7G2k8XhK4AiL4VWKv
 PCKfHzNfK+0CdL4NMoVgoejOr0j5zCiBkmYEFN/JcKpEeyZC0VLSvNoN7f5xcCsBQCPV7gzUKG7
 qfkp9xxbHx0Qw66JOV6pebSQSBxuxO4K/t4qauTXlO1h87igbhYwBguNmQQDw9I+hHPcZGyQvFB
 YmcmFALqo1pfEHK+Fe1XyLd3hNo8oDlgs0/dZsIaoHnkSEolRxEftJ7cNjy0+7RSP2RzTMPmnxI
 YyX7WwxkFxvBRPS6dJplPUTjDvDI7Iw3MgVOXyBKR229xRyI4n0aQAlgFRPwANCnXnhjODXEAuU
 DEyTKbTuaE7ElB2ti19w2vGPW2hy3qQ3vesXlCpM=
X-Received: by 2002:a05:690e:190d:b0:66f:b454:5872 with SMTP id
 956f58d0204a3-67154fa0fcdmr135312d50.22.1789410087172; Mon, 14 Sep 2026
 11:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
 <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
 <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
 <CAFEAcA_-UwXB9svLsFwJRfe37+CkwkRHnNVoWDScTEL=L4uOpw@mail.gmail.com>
 <72dd2ada-3b4d-4563-860a-86bf6c6a8a90@linaro.org>
In-Reply-To: <72dd2ada-3b4d-4563-860a-86bf6c6a8a90@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 19:21:15 +0100
X-Gm-Features: AcwNN1WOoZK8WHiuz9hJ3D7TwBPkXIWyG0rg1hXCnEGBe6ndfQz4xLISzP5txSE
Message-ID: <CAFEAcA_7eYjtgXVidEMsG9ztZf1Zy8A4Qip_baSGxdNRQQKj6g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Mon, 14 Sept 2026 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/14/26 07:51, Peter Maydell wrote:
> > On Mon, 14 Sept 2026 at 18:21, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 9/13/26 23:16, Peter Maydell wrote:
> >>> On Thu, 6 Aug 2026 at 18:32, Richard Henderson
> >>> <richard.henderson@linaro.org> wrote:
> >>>>
> >>>> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
> >>>> within the range which are not explicitly listed.  Previously we chose
> >>>> not to honor the TID3 bit.
> >>>>
> >>>> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
> >>>> on these registers, so we might as well honor HCR_EL2.TID3 too.
> >>>
> >>> I thought we agreed not to change the behaviour here? Is this
> >>> just a "forgot to update commit message" thing?
> >> Oh, yes.  Because I did update the code to test for v8 in translate.c.
> >
> > So what does this patch do? Is it just a no-behaviour-change
> > refactor so we have a place to add the SCR_EL3.TID3 check
> > in the following patch ?
> It does what it says on the tin -- it honors HCR_EL2.TID3 for undefined
> registers.  We currently only do this via access_tid3 for defined registers.

But there aren't any genuinely UNDEFINED encodings in the TID3
space, are there? The ID register space has to RES0, not UNDEF,
for reserved encodings, and so we have cpreg structs for
all the reserved encodings in the ID space.

We give the ones in the TID3 space either the access_tid3() accessfn
(which honours HCR_TID3 only for v8) or access_v7a_tid3() (which
always traps on HCR_TID3 and which we use for exactly the set of
registers that were defined in v7A).

-- PMM

