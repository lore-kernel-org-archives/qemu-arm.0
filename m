Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEAACA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBwo-0005Y5-Qw; Mon, 28 Sep 2026 10:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBwZ-0005MJ-Lz
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 10:03:05 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBwY-0003Ho-52
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 10:02:59 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66f7a9afe43so2506043d50.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 07:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790604177; cv=none;
 d=google.com; s=arc-20260327;
 b=r8VIXL8/geMc+fbgqp24Yp8vwWBviQXwvCvwL8g/se9J1uv7mdA5rXGo/JmoEJxcxW
 xG1vDJg1n7XC7k4smWwatnI+lhD1dQBawT8Xr6Xm2qWkoFwWd663qo2VFpB/xJ0GXyuz
 ina1ig1Lm7Vl9G8JikVYMu1ahFeJ1cBlRh/43dMMQbKkKynXJx72lGEqBGpZMp3HGExF
 lnF6S+i+Qwqk71DtDGOSvaRxivE4jyiwXY073YOkmlMcMFU8kOui6X0cIggr0gBJUhF2
 zise6Jt5XgCizZ7O3roouz9C4aS8N9pBITw8KoE8nU0pZGTPKQ2tAUVvNXIXTNT0jAhN
 tfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5H8+aRjOJyHw9CwwFX3FDF5Rx4SDXt3f+5AC3pugOe8=;
 fh=/uugZigwwiWSiZQdllTeNcGowvJj/gvurbgyEe9A6+U=;
 b=qb9DHITqtsLqzeb9K402vVlKUHNa/uwR6baBBqmTYwYBmeVT72q0BptIg/AUYTpzCV
 XI52r4+6HFNQe4c+S7aYZcT9H5c+GnuGfV8C+YnThxojzYdYXFnaH+SgynlwABu2Ubo2
 LkXBlRWtPc7hevTd/6aY3Jt/NqmmVOPijtAMQP0gbs+P2CsdwYflfVlVg0ec/4ZDqUrX
 ur4DxAA7dR/WprqHbOS/Nr0vkCnOHGtSYVx4diexcptIt4y+rsQSw5hOsslF2XvchyEZ
 GWNmfoNVDfkvCJRBp6J4sdo1ivM0JaQDkRjMD8YKSu8cwR93mc0zWd/aJbBALjhqvn2l
 CuRw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790604177; x=1791208977; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5H8+aRjOJyHw9CwwFX3FDF5Rx4SDXt3f+5AC3pugOe8=;
 b=iatUL8ARfVsb0I4SSKkCOholul/gSFXRFu/Rc4wHt8vOihLJGWr92o/TvvFYDPT1Rv
 Tc9iIE+/wjvUrpRNy1b4XUENbMi3MrSXm6TmhpUDQ4VkVTS4+M/K9ZoCgqEYvuWRVHRU
 BScKUOwtgvpYDR1rN3VvDvucLnV/ovV2QR8vCycUIVyZ6fdMAgSHlS1reyglDrryGJU5
 MI+rx2+0buoXOOg419i/cFXDUgYDW4T7voCgOMvh7RAFypEi++KAqyIL2KwoYLLw3RV9
 D3LmQd+uaDFSDAmvxPdrOQpbAfMyFA3mBCUx3cZ5ibrJthurRZoItomljuFV3I34i5Yr
 Rh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790604177; x=1791208977;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5H8+aRjOJyHw9CwwFX3FDF5Rx4SDXt3f+5AC3pugOe8=;
 b=YsuWMlop/pa8LVypcQscTHkueoxoaywiXuFpdmHmgE+vtDpMNBh6bqmLTveAIPDs1r
 t4u0to1/GE5IablbN5vlExxYyAS9LCV6fjazSH2w3NU7s8UP78GKLVu+GXY6w7NGItjf
 xhRMQU+53wDoHmLCQckCHVd1mas/+AEgY2gOTRJv//+habwZg6+RcHsGugarL2r+/Iu6
 IA0aSK6ViuEK2U1UQwrl/NExReZbzmJvuHyUt1sl9fEy2g1B4Gey0noMsBfzN7s4pa60
 gn4lsIVaSbQCO5/b6Vx74mJNWQTwRz9+TYthq78AdGGsPDuGoeTeglCgUvgAvyXjzeiw
 YMag==
X-Forwarded-Encrypted: i=1;
 AKwUvBxr39HeNrvvBNNAVgWzTJYduPaR5u9enU/5wMCmvta9iPUmdLxnJ4exmrBgB3c3hvp3NSpMPhEddg==@nongnu.org
X-Gm-Message-State: AFq9FYLg/tN+epSxmVf57I0/Xqyu2enmx06qEBqsXhoajL7rGHjOnT4P
 NgH7gaVpbidLHNbJWbrliQjDU1DlfLrWxhWV0bK9o3RHbqvlkFN7eA2YdivWfZlveJIn+CpYpN3
 BEo+3poLU7zD+kDa5tmWyjWHeUaSCJV3l82WmsxQRFA==
X-Gm-Gg: AYBFou1iEcOOgVYAyAUJ4QAd3a6YKR7GsY7UUnsS3yTcx6CJ3JvOtxhQ00CObUbcZ8z
 EHguDwFXto3/IGKlQEJZ5WelpAc4WiJkQCig84UHUx36CIVzyjdl4Mw8It9JmKg9Hmdtj5CgWeD
 7PpuHnIY+PlI7ax2rXYU7/NHeP2hb2bryc/noavkKv/JdqaPQXKfh1xuazHzXyjvuuV6sME4L+e
 WxXGIZZVGq5X94BohzGNoShkGTY3ESGa1EqVHIs/fYOJUvzbVFj3cDRSUOyR3ffhs13t71A7FZz
 jdmVEksFnLO/0ngkt6/vAHzvPKILSYSsxinlstOCqUyHJHsolrPVjqFuq9qLm6Qg34v1zV2og/6
 eIeJwA7MyY8E/t4INJ3OvSgYDRAF5WI8pA6Udc9M=
X-Received: by 2002:a05:690e:130b:b0:675:4565:60fa with SMTP id
 956f58d0204a3-6754565667amr1100226d50.89.1790604175180; Mon, 28 Sep 2026
 07:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260921142910.1462880-1-alex.bennee@linaro.org>
In-Reply-To: <20260921142910.1462880-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 15:02:43 +0100
X-Gm-Features: AclHuK_zVto8wL9Rci8DBerZ9IVoHkWd3JkQuBpHRHOiZ6JyixXq2jaQ-ZyrRgg
Message-ID: <CAFEAcA8DLweguCk7-9prMKraPcYRC_Sf5WD_07Ke9cLi4R9-Zw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: fix user-mode emulation of
 ID_AA64MMFR0_EL1
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
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

On Mon, 21 Sept 2026 at 15:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Since kernel commit b130a8f70cbbf9 (KVM: arm64: Check advertised
> Stage-2 page size capability) the relevant Stage 2 have been pegged at
> 1 f(4KB granule not supported at stage 2) by the kernel. As a result
> the behaviour of the test differs when run on real HW compared to
> under emulation:
>
>   id_aa64mmfr0_el1    : 0x00000111ff000000
>     !!extra bits!!    : 0x0000011100000000
>
> Update the test with a new helper to explicitly test for fixed bits
> and update v8_user_idregs to match real systems.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4566
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Why is this only an RFC? What would you like comments on? :-)

thanks
-- PMM

