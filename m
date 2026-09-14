Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1779C88E50
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6550-0000t7-3n; Mon, 14 Sep 2026 07:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x654v-0000s1-Lg
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:42:31 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x654t-00021w-5z
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:42:28 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab201ebso1454768d50.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 04:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789386146; cv=none;
 d=google.com; s=arc-20260327;
 b=QlAOnuKqYtLg6m1SIFnei6dSsppF7nHgh4QKtrxPDMROt/qwsqdhHnRVUiaKVfmlDk
 y7F+vh0Yr+T7+ogFdHH2A5eXj1WKkL1oVKXly8AYd4gNtPNHr4c2q0zGnlhOUon7sRwK
 /f9O3a1A8zWuap/GNNVzhMy89f5hhZyDzuqx/GrYsSl5g+FPfrqKql1Y7QzdgrOK0yMV
 M4DvDqHe4dbALuT64EPqzhClzu3cqBYJ23jCwvuUFnyA15OIJHyYCoDMfuhI5UGrvwNy
 T/7s06gmDKBbWxa02IX8nr5I1SaobQU4R51iF/gnYFuC7eRRFjgYU4FFnde4LjlxT5Fz
 00Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CqjmCk3ShyWFBpfTGrnIxPC2Rp2QWi8mLEyLTcq2rms=;
 fh=9a6tNdjIFbVrYAs63okQ74/905nld4n3i3YDedauGjY=;
 b=j7I1WViVHssm0us2R56piB98eWF+U+N/MmqvXv1v+Lgkf5ph1cb4nBq6E40I0Wxmxn
 bbufqchi0nzHGt5Y8piR45BhiqWx+G5lF/Arpn8TFC++h6mtSSQVQwLARWvyB7PPykkU
 vQxfocE9HkYzYdo7An35pLAq1urDdDQmS5rU/8PMU8GyRQ5ieOCcKWWVSfpAqbrPCGe6
 rcKa3DRjW+eK8B5Jo38m9XjElaCSSW0ZtOFzgUerdrNPxkM9YSzqECN7ImRcEH07yUGi
 B/Wsr7+C9O95B16nURRXOCFPwJmd+3qEg3Z0Pb5dBuqxhNTA3jS2fxxide0TvUIC3qFw
 Aihg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789386146; x=1789990946; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CqjmCk3ShyWFBpfTGrnIxPC2Rp2QWi8mLEyLTcq2rms=;
 b=XfTjLANI3tkxSxru7z+03C5xdD4oqjZAsrTBKV1Q6xIuMwC2Muj5lnmJ++Kmlx+76b
 Vv0xpaGQUpzbTnP78qjot7+D1ZOZlPpZIZNxpdKpG+yIYj0MPTqR2d3Gn1ykWaVDUm3D
 m8iVIXa60ZbOtCL+XIF8GZmOiEmcdBtT9+w34DADhAl1nArFGCCFZRjWBpf94VFxC76+
 Iu01y6d/zG5VSm0WSwZtu4nL7oAtZ3WKJFSebI41Q3YXfaN1mwEgpB9pss40kWBlMWAo
 3vRMFwsvOecAijVugFBA2x7SfQTh3bsn5MO45A+L0pdyjcWgjol9+wFhJRrkSTAKyYjO
 pbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789386146; x=1789990946;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CqjmCk3ShyWFBpfTGrnIxPC2Rp2QWi8mLEyLTcq2rms=;
 b=JVmT8G8HLSSagud8ezM52dJw3KsvjK7O36uXAoDdMo6cZKz6m9xnhUgCCcp4mgDD1/
 cpLk8t2dVgZbqkruMr08h5T/ncp7wc8ES90DtGMLbDkRD4tZqL8GVaA3ft6OewXV98a3
 f05kNtm1HvlGQbrd/SKN1TBJ+sQ6WMIHd4GfXdYg+KZyIOhAdtTQDF25Q5QlWTuSZpSL
 xmcVW5uqEqYInqeE3UJkuc1Y0PItEAalCfrtZvDUZ3VOJYrl1TpJmnSRYhHr86+QhkGb
 +zXpmxif+UT9a//FnfSrLhhsdvzA1hQTSdT/rxBwPRqzadSDVaFl+uHDg6w7/5qO8XUV
 1qBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAS90ew/vyuXY3wlnCSqDzp31c/NAu2/bKHUdUNSbh8YF9117aE4AIsTflgH6RDEHFjR5gSGvUeg==@nongnu.org
X-Gm-Message-State: AFuF++lVHmNT8k9iXiunjqbVYk1z6kxJTvJrwXA/iw9mXktiZjhdnp/C
 4wineGvNOz1xBgFFJ/fO2qeZh6K7tjGsoPzwFDRiDQNxukA1BFO0NLhBlPDZ+4MAm7bTvvwjO27
 af/ai19zRk9hizztSN0sOLQjqNzD15rvKPGQENMOjtg==
X-Gm-Gg: AYBFou0fyphrmbzA2SH8WR1ukQy+gYLox8JOoOLA5ozKYhAfw52C9yw4ntgH1uOn5Zg
 UObvYwd4Of92K0ToMze/H3hwxRNcm70g5w6iIKlcm2LNyI7rz2Xm7NQhnZBVeYT/9bRmmAkZcEo
 PceLjB9th2ejOeoSwxwAzYgLw4mdawGcKtmFqVFLIAj3t9inovkQkRlR1A0GQijvZcowvIjuoNG
 UbN29K956TtdGBmCd0gL0jzxop4X8gbqTHCZIP3W/CGvzwPOE6rAsjuHLDSBzFkyBX5pFSFP6cx
 CCcczrtWuDBUvbO90MguQGL3EuIKlPdwmhEiaWeLB77X7ApvhcOmyj9biQRmQ9t+S7fb4pg6jYW
 6I2whbZLuo0c31IJVOFOZMnLI/EtGfWhJe1ZuXZk=
X-Received: by 2002:a05:690e:80c:10b0:66d:207b:a0c3 with SMTP id
 956f58d0204a3-6714dfd24dbmr279272d50.16.1789386145781; Mon, 14 Sep 2026
 04:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260912183110.502358-1-vpyr@vpyr.dev>
In-Reply-To: <20260912183110.502358-1-vpyr@vpyr.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 12:42:14 +0100
X-Gm-Features: AcwNN1ViEbHmIujLgfQKK-6kCJekJr0Qkg5qAwTo0eEt0rNndCA0pqPgQvQhwT0
Message-ID: <CAFEAcA8GCtoQoRD9qhVZp7Oo=-Y3-0OQehZvJh_c+Z8xfzfbew@mail.gmail.com>
Subject: Re: [PATCH] arm11mpcore: initialize SCTLR reset value
To: vpyr <vpyr@vpyr.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, vpyr <vpyr@proton.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sat, 12 Sept 2026 at 19:31, vpyr <vpyr@vpyr.dev> wrote:
>
> From: vpyr <vpyr@proton.me>
>
> Initialize reset_sctlr to 0x00054078 in arm11mpcore_initfn.
>
> Previously, the generic reset mechanism initialized SCTLR to zero because
> reset_sctlr was not set by the ARM11 MPCore CPU initialization function.
> The new value follows the fixed-bit requirements documented in ARM DDI 0360F,
> section 3.4.7, Table 3-20:
>
> - Bits [21:16]: 000101, contributing 0x00050000
> - Bit [14]: Should Be One / Read As One, contributing 0x00004000
> - Bits [6:3]: Should Be One, contributing 0x00000078
>
> V, U, and EE remain clear because their reset values depend on the VINITHI
> and CFGEND configuration signals.
>
> After rebuilding, the test read SCTLR as 0x00054078 instead of zero, and the
> 0x00050078 mask check passed.

Thanks. This matches the reset value documented in the summary
table 3.2 in the 11MPCore TRM.

Applied to target-arm.next, thanks. (I added the
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4454
line to the commit message which will cause the bug to be
auto-closed when this is committed.)

-- PMM

