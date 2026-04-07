Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B1FF5135
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:22:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABVR-0007Ai-IH; Tue, 07 Apr 2026 14:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wABTh-00042B-DX
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 14:48:45 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wA4u1-0000Lo-Oq
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 07:47:31 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64eaf8aa893so4169970d50.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 04:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775562448; cv=none;
 d=google.com; s=arc-20240605;
 b=GojgrM8oUA04fmgeGc+3ElCPIbMTLFOVnsph2mHsBwJ8WvcO11WKcyVJrpktGAIDkC
 ydCTs3K82Nk+AopYONODqNXjg6CHVEAKiGR8cxyItG76C8DwDO22aDN7yxoKlvMoPKgF
 ODMmOo+YoOEmMnrJ3F2/UdDWRGs37T8CfJ5Yzev0whnaPmTJ+qYfDWevdgrO9K7Gou2O
 IEkR58ThUhmGDt8q+twal/XWxWC6CFsG/D70ZJLQRyDXKDb+LFbyZafPHYJcwowZoEi8
 WdqnsJHCKmKXjbw+148IwTvROqhV3cKumSVsaKb44S1X+kPRssKajVaXdVGLuw8wUvsA
 IzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YA/IjXKbtftLtGGdnliZ4f26x908xHKp64DpGoEvv9w=;
 fh=UbX+oSPG++Ue5ZrpgTF1FK3NXFDjhBQykWHofxepz/w=;
 b=JfsoI5NFLKQYuLNMXemzWUzhlJH5R7KPaJzUfafQo+CiLObnKA/ZlEwxQ3JANnVcTU
 hkY2kffU5nKH7u2YQ6RTnkS5OXwnzDXckREJ9UR24KnmKSPt17TuoekJ/70zIrE3klbt
 ZEnZDLl/DwZTsasNeQpyOFSZjg0vFo83vxY4SBBZYakmiIwoX+doZQ4QuHcFV/QsC+6n
 sLGLOdFYBLKgmk7Rkv2y6gznhC6Akb8I77/p92AmeiADivo7iNFLWipg5/Cq37LUuiN2
 6dLfgF1fbSa8srqSrZPzOminRj+ut4KJcjy6cHZdIw6euk4m0ZhqVlMf7e9cqNpSp7Jv
 Q8pw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775562448; x=1776167248; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YA/IjXKbtftLtGGdnliZ4f26x908xHKp64DpGoEvv9w=;
 b=djsMJ1LVbz9gmiiaRuBsLYa+D5rg0Dj9v85HJRWtHn9GijFIoGeM2nOphRYFtAeSek
 s3mw5VAOJB8OWDlczaBrskVfFCuSw8i2W9Lvf5r7hS6/d0vi8TyHYwVe3xNKLzwApvQy
 /ijzmxcI0M6VfkpQ/LvTxMu1AnorGInlW9Ij/QDBM/lvq7t25rzPj+Adr1oQdf746A/h
 aw2jEV72L92R0b95iAxkG4NbXC+FRnQfwbOiLvTIxWHWwXVyLyKTn8989rIv6Worc9SQ
 bt92OuYtVCQDzrVJObcqOxEzMs+F07tSiXKIiUNXtTANaDWT6IZafsLQapoVtVy9kWu1
 xxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775562448; x=1776167248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YA/IjXKbtftLtGGdnliZ4f26x908xHKp64DpGoEvv9w=;
 b=MrrsHk/ngGEpCc/YQUBhRg7+dfTbvBbIJafN5bkZR6gfP9J/NMi+mGnDrulVTKxdsO
 6+nIA2bfi5YLqSl/on1MePxqDXEb4aXOgMqxGyxwChonawMSvUxWqhoKiP92n+ig2Jmk
 bz/RnMagT3WrqOlLB/n5sXSK7xKDsw7zUrbQPikCrBnnr/sGl2XXTcgm+ETqxBZTv0rp
 MPxAz3A9DLZNNAhUmjr0iLuJQycrnHcPDfcR0SWsenIpF55m/tgeXBfF6E8bIJ16a5wP
 j0HQGiTyXt+paw2u5iQBNZSpuL6u+BMx3Ztr/K1xN5kXwcBnn2o41Kps5wuPvBOeQGwl
 L9Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVggMZOV65qOuuSwrPnDrPuSNphwLKTy7AM0hRKdrvu9VIkLIGXNxnU9FWkMpMWAWzoss3ajXqL7g==@nongnu.org
X-Gm-Message-State: AOJu0Yxn39xCikkYRp1a2bXrAwCCbpF8xQ1Vhrvb9soQfM6v0jMoHwcm
 vkZZK3tZzMcodMlt+Mbkf0AnDpeIRlpinZ0EGi2T9w21e2UqzmPbJ9vcmO+ta+2ZCRPpkJb2Syf
 Q5LnSkP7ZnXLSwl2f4geKIYVYPqw59qpVd39IxXZNDw==
X-Gm-Gg: AeBDievJ5KB1KAFxHIdwEcpqlPTscMvU4yT5LHOyGknwKCJNBpcuXXDJ1mmTAZ8Kql8
 aJNgZeveY3GZTKzPobcuUtsBOWsGoMU5OjKHcaMsfYV/X4EpQfnYFeMg/fJJYmLASyPe6xxXA2Y
 Id7TwJg47ZmomE2TcslIP2cuxEDzgNEcry1TnI3xukJD9dYLkXGpyOmvuz0sz61zwDPXSq9Vt+7
 NUavAvBj4JVXCszlUVOJcfxcaNJ8KK4fUOhW3TZV0XpjYKBa1g6qOy6NeIM/JeAYhrAxmY5e96w
 vn5ThVUg/6oLvumCm5zZv5fELgWJ38vwC0Lm6Il6CkagH1EN6u71cSixYar0aBy0NSGvkjGKqtP
 5zQ==
X-Received: by 2002:a05:690e:148d:b0:649:b943:2ca9 with SMTP id
 956f58d0204a3-650487c0cfcmr15851318d50.33.1775562447937; Tue, 07 Apr 2026
 04:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260405112410.603223-1-alex.bennee@linaro.org>
In-Reply-To: <20260405112410.603223-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Apr 2026 12:47:15 +0100
X-Gm-Features: AQROBzAVcKcR5pZuhVa87CGx7iDK0yX6ZxPvZOGFBbLaE0qyC9ebipBSgzTDV1U
Message-ID: <CAFEAcA8+wurZTEAs0YzN-uDkmXKur5AD9wLWY5R0tTLRdu6Cfg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: fix fault_s1ns for stage 2 faults
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Sun, 5 Apr 2026 at 12:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The computation of s1ns was simply wrong. For Stage 2 faults, it
> should indicate whether the faulting IPA is in the Non-Secure IPA
> space. Correct the logic to check for ARMSS_NonSecure and drop the
> extraneous s2_mmu_idx test. The actual writing of HPFAR_EL2.NS is
> already gated by arm_is_secure_below_el3(env).
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/2568
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This seems worth Cc: stable.

This is correct code-wise but we also need to update some
comments elsewhere. I'm going to squash this in:

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8ec2750847..9684506592 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -740,7 +740,10 @@ typedef enum ARMGPCF {
  * @paddr_space: physical address space that caused a fault for gpc
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table =
walk
- * @s1ns: True if we faulted on a non-secure IPA while in secure state
+ * @s1ns: True if we faulted on a non-secure IPA. Note that (unlike the
+ * HPFAR_EL2.NS bit) this is set for any stage 2 fault for an NS IPA, so
+ * code must check that this is for a fault taken to Secure EL2 before
+ * propagating s1ns to HPFAR_EL2.NS.
  * @ea: True if we should set the EA (external abort type) bit in syndrome
  */
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bbbfc34f6c..7b993bb5b3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -613,7 +613,10 @@ static bool fault_s1ns(ARMSecuritySpace space,
ARMMMUIdx s2_mmu_idx)
     /*
      * For stage 2 faults, S1NS indicates whether the faulting IPA is
      * in the Non-Secure (true) or Secure (false) IPA space. For all
-     * other kinds of fault, it is false.
+     * other kinds of fault, it is false. Note that we do not
+     * distinguish "s2 fault on NS IPA taken to Secure EL2" from
+     * "s2 fault on NS IPA taken to NS EL2 or Realm EL2" here, but
+     * instead do that when setting HPFAR_EL2.NS.
      */
     return space =3D=3D ARMSS_NonSecure && regime_is_stage2(s2_mmu_idx);
 }

thanks
-- PMM

