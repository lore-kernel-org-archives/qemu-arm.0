Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F18FC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6T70-0005Dx-70; Tue, 15 Sep 2026 09:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T6y-0005CP-4s
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:22:12 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T6v-0001LU-R8
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:22:11 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4aa8e6bdso1615144d50.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478528; cv=none;
 d=google.com; s=arc-20260327;
 b=ELYHeHdlqoPdAPNYskTqGIdQy3jWoMRJrjockEX2r1A57KdqDrTtIIBv350CNrN2HV
 /+iyhMrCTxr+SP4r6jqeRuNL0/JM5VR1FL/ji31jmMLOdAvd9UEAU2brExZnOqhJ0nVI
 6RPKAsmVPGUOk0JYcS10Q2WL8U+SXS2LGcKRzzoLlZhJBZPwdjOWLvBo+eoA+ytMh3eZ
 o0Wzs+PK9qnqIPYOAYKgYtn12Hud93CyY01NlY72EJ5JLM9+x/eXiFwOwi0hNmtW1J9A
 wbzOtKmz32uKX8ApGeMHtK4kVbn+2DviBwjMsRwnzn9D8JjV1mJ/iCvmFntWzcM+hqiP
 sv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=W12o7TEZn86APiTZttCpqXbjGDKtL4qdG0FaAqyRrQo=;
 fh=eczogReqGlt+F7u+K9Bub4rmsoinZTLyHBIscQWJn24=;
 b=r5ZIUz8/MigSGud/OZaVUgjt1wlguGL8Xy12trj75YibShmW7wQiO+sBL5B5Tt5P87
 t7X/N2DLF68wv9C+dQSwM96C9s/lxN/4UckYUR8vKHk8L9ZS74Gc426r5vjWCdhmRB1W
 XhrJRJmXiVs4QJ7pY6/mHAeMk2IWNNitGelzWy955WRO9DZlOHJSSkvL+vkCHFpx4GLf
 9hrJcsWUWlvHFmxo4WNDjJPAdtg1As5ygSL8FIRje6bQoAG5xHojQWEVKHYU2PinOYuI
 HY9wsnR08f7Qv5CdazGJw+G44vWweAzWDzVh4RoILJcJqijGW0Fo3JJZz+nPQAlOroMd
 o9yQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789478528; x=1790083328; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=W12o7TEZn86APiTZttCpqXbjGDKtL4qdG0FaAqyRrQo=;
 b=jYlBr1NzmxP5Oozz8LbYeeS5RoMe9EltCo8ZQ+Voi55EEbR4tRjfvpntlh9Lkjv0PA
 AIkGPFKmEok5kZh0kruzUATtgXusTAGvC7GtdMMUJX79h1VJE/LT54SZ9zxgT8HGpU5S
 ilZRzoDOCm9LkCq07RejFPfQxYOJadJrbaGGLKpmJe6OMkXKk7V6BwbM0Hk9hpzvT25T
 G28j8yCf8wGgWIQYAh2dtwSsm46QFnsZQyle09MurBZ6M3+gO+JKnDg4uhfzbblhQdEf
 Oi1EQ0dN7HttIDenO9toNhphkz+yi/PsYmzq0UCFktpb2inaedlGSok4oLg4dRPLCccL
 cEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789478528; x=1790083328;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=W12o7TEZn86APiTZttCpqXbjGDKtL4qdG0FaAqyRrQo=;
 b=II1gOWNOp6+UCLFmW8jZGvOVm0pul+ApeIr4uKuCLpM8I4rhIqwVRY/RncXPDo28lq
 7A/tZydEf86vAooggflOsY9J6iPBqyYcsZ5B3CY40JATlzQ5rR3R9NMIUsY+RMYv/H90
 zRENIm4zHolQkXEYZuBPUyy85gImGbeV13dajysG/h7m5E6+BFNvM1+sWP3QOmHraHuc
 WOjOpJF6mfJf5TuaKFbYJ+KJLmP6BqcVi6MGb9w/Fw9tX/xJ+2uL/YrPUthsigveME9O
 vZWtd60/ZoZKoqBF1wY3la+yZgQLrYqd6oDZpduDW46qs1jYmGJiZ2M4MblMIn7hGjTq
 RUfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByO6f2vawkqrdFmdumCi2y9lCcfPVj2bh4/u/TdBcdctTDRYl8Zez7pBnccI3bvLSHUi8fCWkKTgg==@nongnu.org
X-Gm-Message-State: AFuF++myPqVwqoB6GLRV3sB+Hl5UOOOGBYGb30jn/46z46VZ/EZjK2QN
 XnWoNClFhUTZXZ1QnmlFaNIPyXKSPUpwAC5WxLQ7DIZjwciFXvtNQiV5rIqH6Rv/TcDHRMw9RMn
 TjOLOHgJfQfy9ItbgiqRhe4uA/tGFPnpVTYkuzTXK9g==
X-Gm-Gg: AYBFou3N+n+pw5sjwcjd/XnEmkCn/cWlaHaMamqCZGhrO1ODhjcEabzrxpnSCCCy+h7
 BWmbt3z5wCmSdbmT09fGRfdGcK0nhRueg5JhsQ+Waj9kByed949pmFH5KDTWzBkFR+mwqeIkYf5
 5HBC/9WOfPjcfnprT02qEUwNbNknAH13Qw9glw1jvLdePj+gI1NlcL04eOH/tjV9BfATIHZCQ59
 /hmQts1CXvBdE0C2AV3UB7bGwAq+P4RJfJTOLwmVa3r+3UE9gTc/HaTz+2t1RH5Mr8FW77A5wm7
 tXLRLq2Zv2bcgsxqDpgjTXbRuRwvmOq20Jxkp+bdj+6m/lrMiACwgmcp1VZ4OCFPX5b6CNulS6V
 yhgAmCPNVLbWdlHy2tzV/RcsZSS/2bdbbD+3+JIM=
X-Received: by 2002:a05:690e:d5c:b0:671:4d0f:13e5 with SMTP id
 956f58d0204a3-67154f6d8ccmr649579d50.8.1789478528125; Tue, 15 Sep 2026
 06:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-5-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-5-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:21:56 +0100
X-Gm-Features: AcwNN1WG7p3_2CD_dXN25H1VAa6L_pCIaO12Kn2yP77PfsN8gTbyDlFAGlG3UD4
Message-ID: <CAFEAcA80Nwh0wULFVqO4CeTzNj0QQP0SHJ-j2CvQB8j7YM2+pQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/6] target/arm: MPU_RASR: mask TEX bits for Armv6-M
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Mon, 14 Sept 2026 at 20:27, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> Keep the existing mask (0x173f) for CPUs with ARM_FEATURE_V7, and use a
> mask that excludes TEX (0x1707) for Armv6-M. PMSAv8 is handled by the
> earlier branch and is unaffected by this change.
>
> After writing MPU_RASR on an Armv6-M CPU a subsequent read returns zero
> for the TEX bits; Armv7-M behaviour remains unchanged.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

