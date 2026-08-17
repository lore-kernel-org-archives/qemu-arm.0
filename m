Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50B1C5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 16:44:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww0Re-0003Ys-Tl; Mon, 17 Aug 2026 12:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Rd-0003YZ-G6
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:44:17 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Rb-0008Ul-TM
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:44:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c20363107f4so388620166b.2
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 09:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786985053; cv=none;
 d=google.com; s=arc-20260327;
 b=QIdwsaovUrXcBMr5OSIGIjVeu8t+3h0hSi4FkxG9HZHu1URZjVrDvQmTeWGg+XhUYS
 HKDkUFP84e4GYxl7llZNovBJrsz+RFsUpB72Rqm96rwtDE6kELLItEZ3SVJIEZ0gc7rO
 Koo3VOIxHUn436cMa9OMsEGsZ6Va8ousrke4XVIPj2ag5IBHrIXDRrjeewDw7T1y/sE5
 3dYQqDQp6o+jnmb7Q0rlmS50X2kOagF4k8o2Q5kBs8noFu6hQUu65uHZ3QG43b3sYbZz
 OiZgs+PjRdo3sXwQSQ2UpOAxv+OE17+0TyQnoX0gPpAp4a+Vq0EwhbMZQZydQpbmU7OB
 0rAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eG79e0j0rvVWQ/Peard3rBf08wIFnN6l/QHNPSHKgms=;
 fh=tKOZqyOsoFsCcHqK8iEhfnR4yPWyytqi4Y9RZ/U2r1E=;
 b=eNoFwqZxzxvR/g/FwWNzeZrIYbojBQvdZRS85DITqf4umy7QYyeVtbPNTty38Axxbl
 e5I7eEGo73+/8G32zsw09Z57qi5mbWG+RKO191+TYv54dR0ui7QFNYFX9FHz79rxQRRT
 8Hq2MWt+a0EttEZWyMa+CZGOBA1iKBd5AUhRkUTGDufWE9EZOZVDizQvTqIepLBcVZRc
 ghSOm//HV9SUKvXSotiFAP0WD0JmAPVGsUgerAgDdY9rAFie/zmRCmz6bEK79IXcN16D
 nPUGsb3HuvD4welcVHHlmY3a+qOjuYg7Rc/j6hFMYKto6YZteRNovq0Wzy1CrBAgpNiy
 1weQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786985053; x=1787589853; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eG79e0j0rvVWQ/Peard3rBf08wIFnN6l/QHNPSHKgms=;
 b=nZcwnznJxvpG8OHoJkkaRpk5iKL9IaOL+vqh2dkawnSkyksk3Adu8MskJI9suqWZw0
 jfSWxBbxrI02faXpQJ+TGd4LNtPJUFkkhaoz/IclYryoTSunCILI/zQ3glq6E3vV2XXI
 VEDTk5ZVFJSfzjvIykmk88atk/rh84ZoJH4rppYBfDzrGYlu3IzCcHd0RYMFiTaWSkob
 rdhrmzJpsZICk8NC1yFk5WZLIs7gD7JkeggA0aoIAi5LN6RCoI8fsFENYOGCvg2k8l4i
 dGTT5ZTZggFg4kIwGZ+OvG/m76mw6kh/AMqmaaOuS8+4MQMDM/Z5wVhIN3vMdw5tiKWt
 74Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786985053; x=1787589853;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eG79e0j0rvVWQ/Peard3rBf08wIFnN6l/QHNPSHKgms=;
 b=WLcQ7T+LhhsZaWVzaKljXp0Z6P2u5odbCFZwIndcPSeq0Q1oejg5xNeyMwmfAZqzO7
 K5z+4LMZJLuhELY7mDXmF/J0wGvv0Q/HXs5GmxSHsH4WkvwcMyvrmYGE/HZceM4FQO6s
 I46ykE+2xa5Myr6jS2Vn29Uk508eU9i3VtUCN4EVAcBGqX+Jf5oHe6R4KOWyC6Urq4XR
 1fpzoubyjTrb7quK56AqXJivBWF6BTnx4ZHYx4BVKBXdA66MJqBXMFMOcsV6zf5zdTy1
 DA95dob8cLZRxRrBVBKnRIghvIRtZy8k8w5gsd/ckVkz0gpmpndKl5Qx4lheWafwNG6d
 viUw==
X-Forwarded-Encrypted: i=1;
 AHgh+RogAD+gpRZ0aUXsTTB73GXCH8W/YOOaJYxAhsJT7itPBG3Kr+HK+YFBJgu6n9SRATUeRaLTNg3G9g==@nongnu.org
X-Gm-Message-State: AOJu0YzVsAc7iaggg9aBbMscT+u4ZodQna5DFd5aQ4GVjSIO1Bxk1Dz2
 zFGeuya09MTvh1uatK6qqQKHM2FGzzhHgWKYnJyVrP/KYDiEPQ606kYcQ6D0OU+Pyaymdg/OyRa
 wUjSoUcbEZR3dXFRoVp50jvJVUHDb0KokbBiqzExMJw==
X-Gm-Gg: AR+sD13MYVRAXMMgPjOvJzmSoc6kn3/YLZo2z94XVdoDw1Ld/g4//4KE+61bzeagyso
 sZ2eTODvV+ciKDDSvHc9f5PpldIqF/SrBQIOwiitHC6MzMEKUyiQCfs/853feI0HxrIo8jANRBn
 1JMJ+URm3mQh3FWMeH6p+3CYeqhOnd3gGD+RKQflzwtdOhF3NM3It6Bklg7Js1SrCn01q7dmBzg
 fF7JW+oS6GSN3CltHjXow+dEnjBytg2h0HemQrJW9WXM3/teQWRudqhsS59abs0QNgNJJYzyCvO
 6EYEIXHPrlOXftlvj9347iPDMh67u6niN9SnyVICmkMMKv995K/6JlISK5LIDfTJI/76bDD3xM3
 ldv2t3+KWdytahCkYHwO2GrHRg09/
X-Received: by 2002:a17:906:f589:b0:c05:b9db:68cc with SMTP id
 a640c23a62f3a-c2188294c18mr82409866b.0.1786985052728; Mon, 17 Aug 2026
 09:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-4-richard.henderson@linaro.org>
In-Reply-To: <20260811191540.79882-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 17:43:59 +0100
X-Gm-Features: AcwNN1Xpcf-QcF1FPXDq2OjUsyCT6SryBu-6J_SK3mc1y7sEfAqis7pyAojhDVs
Message-ID: <CAFEAcA-8ZYKni0cnsC+WhtOtn9704tO7PPjcTo4mTkTibZNq1g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/tcg/aarch64: Add regression test for
 whilewr/whilerw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Tue, 11 Aug 2026 at 20:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/sve-while-ptr.c | 28 ++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  5 +++--
>  2 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/aarch64/sve-while-ptr.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

