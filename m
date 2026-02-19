Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC32E9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 16:13:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt6eh-0002VM-Sb; Thu, 19 Feb 2026 11:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt6ef-0002Tr-Ed
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 11:13:29 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt6ec-0002iu-LQ
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 11:13:28 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ada2c30a1so1014534d50.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 08:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771517605; cv=none;
 d=google.com; s=arc-20240605;
 b=gJjq1bR+V5WNGGaH9Ll0Ql973K8D6etaCwsxHJpB0hk4oT/OuMqR4leZwW7X0xsqNK
 kJv5BzzPSXCmDQVPsNWgLnWZhn4fhkFtDo5EBOIOEyO6t6OFsYQClL8lUWaYw+4HKUMl
 +Po5svHQx/HADUnfrkfOP25sgyL4c88eP3x+XoNFLDfrbTE3UbrnoF448royQatlEAYJ
 V5/9TnkScSNJNTb7qzocCw8dM60iUcuT7vtczZZ4Wwzo8dWWLlTRROp56m9sFKn3Ghnc
 oF6cW6q4MZR+P1/2/dEe8s0R4G/ktyFYLSpmE+yxunwKOpyZdq324IcepgKheOiNpuXo
 WGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=K+UFSnYNwT/zNUPoy2Outt3woBrkyvqJ1rDrXb7lsAk=;
 fh=PLt01ZSH4btFc2g6UO/0ZQFz0cFKMYVTzs0OaFRlafM=;
 b=CcwKi0IGw1WodptrLjA4QZie8qNTjmF9X2m9ju5ZiISzatcd8xWCZPwo1VJMqmhAmv
 54pWCv5eevm2YIbYXL+bTglvedrQo4yKYVRd5hvgqhHzh+f56C5hha1Ailz2XmKxeIqo
 5FsQcYfFSfuo7I9U5Lql1zjU23n9CvgSgEmQ1W830xnJLfk3W6GhTrjNif3wQI8CODT0
 pgNpG6SWuJezAY+PDxePDjRzfFV0ojLO1yNdnBofHXrjkhQWT12Bt8XBK11oNEWtlxqA
 BcuZ5TpFRrZGlNkVA+BPGtqN1exIXU8jF3e6vDfz3fE+6nrQAiQtGdXObAFwjQZ/YTxU
 x1GQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771517605; x=1772122405; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K+UFSnYNwT/zNUPoy2Outt3woBrkyvqJ1rDrXb7lsAk=;
 b=NVW5tWEbUzwSzNH6TSkt2MDwwtXhbuxsUgWXYnpovycE7UJuq1PSqVFQYxhf8SYLCE
 xrgRpBEGlw6lHgJO0Ypka5Ula9P6FYtTauc7+d2dfMvkjZEEiNPPE2ZlW5ehH4eyVBhJ
 36r7DWjiL79CHDZkxlbYmXvKyzp7RlnpVZDv0Q6pGADalpUwlHPgJ9HyFqanH+vJvTDX
 gs/UMIzOn8odyQqIvR9oOBQL7CMsgWpFyfcOeCprkmoZQ+5EMXL48hist7eCbTlOWyte
 BNT+ofIIN/F603ki+CE6+48aGSUi5SE5Rx7T8Qtf0CBloA4OGoS+ly8URf15POWq5YYu
 2h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517605; x=1772122405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+UFSnYNwT/zNUPoy2Outt3woBrkyvqJ1rDrXb7lsAk=;
 b=j1ZsI+Q+ZOIC/sfD6kteERusxjiQ6ndzwmCS5SFEtOaME0xTkqt9DdJD+R4tFXgGpe
 BICIJHHKZNemRxAx8KyrIrUiv5zH2cawMzwYORE5gy2wScAAZ9PUpynrJHE9diqN9r1z
 IvlmLRntxtraQ0XgBHunkw7U8eigWP4Iqs0s3BLHigA4YW6xB47MG+6L7uT4VPfvwTtp
 Z1VgkarDyORVM8Iwlgxf+PIpTMcru8Qdm0M1xVSBQV2qXB3x8H6FPnj7Rq23uRNbQNrv
 XMGtzrI3Lp3cK8HBHQaKaG9kqvYOCAksaLpJeZF3/MQKQ7aGZx2upGtH218lDjL4AVC2
 s63g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5UcY7A0WWLzbbaAAxkoHccHpY2fdYfsdgWQw/mhlbkZdgdV5Op8dQByXHJCOCSvKW2asTMXM1Hw==@nongnu.org
X-Gm-Message-State: AOJu0Yy8dezoSx26zvey7rmxJ1KW6qhDrU/3K3Qtkz6yC4Gr8ZswbT7T
 3uBsOAbNNZo5JrqWVbHxfwq8Gp5KXJF54QfWBUS26m82td+W3nytr0+p20Wi6XnTn7Qdrs26/T3
 ZJ2pNi7/SJbtKsAiZMXPpCUmZPLRVMj2l8Pl0ylWBhcAnTONV2sc3
X-Gm-Gg: AZuq6aJs6yv8eDZ1Chq2v77GwxpKWH60MBt/GcCEtdaTPMRwjPm6XAcSQrkCu7j0KyA
 Enlv/jj9JSnfAVugV+AKEKl4MyZPMIDzxeB4tHOO2nfvlyPLFRIJszvMSmYoRAqEhAHkC5hU5fi
 5jLhoeG8JICA+zQqYWKUX/qLVwm8FlHY3mjb65K6eMAx/6+A9A4PzXZMu/9W4IoZiwJBgcm6oBl
 ZqS74TcfY9usFflzpD9AGsSL4oQsQIqgH8uDcPIbq9b2u84LNKZADOedN0QK5CP3gXJRV9r0Hu2
 BQPwqnH80cLi3jtVSRU/BSXjg2wfM3vjmLBWXJjAka3fmFDaGC+9pl2Rs6DxYgYOV1o=
X-Received: by 2002:a05:690e:d58:b0:64a:d35e:d356 with SMTP id
 956f58d0204a3-64c198c72e3mr15015999d50.30.1771517604517; Thu, 19 Feb 2026
 08:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20260219140228.407513-1-gustavo.romero@linaro.org>
 <CAFEAcA_GdkVJbgGm2j8v15PM2ijKF2hYBAUKZ2_W=g6XasFvCA@mail.gmail.com>
 <00bed3eb-579b-4153-9bc1-07347a5d0792@linaro.org>
In-Reply-To: <00bed3eb-579b-4153-9bc1-07347a5d0792@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 16:13:13 +0000
X-Gm-Features: AZwV_QgxFBD5NXHqpvafDTVt9cEI0lcuhAL5f2aqKe0Vxu6S1acjGO5YzOwgts0
Message-ID: <CAFEAcA-3BOhHZo_mD0Re5dpGpQ2=dydtSN5SxSKwywbVdhNarg@mail.gmail.com>
Subject: Re: [PATCH] target/arm/ptw: Clean up unused ARMMMUIdx
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 19 Feb 2026 at 15:16, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Hi Peter!
>
> On 2/19/26 11:13, Peter Maydell wrote:
> > On Thu, 19 Feb 2026 at 14:02, Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >>
> >> get_phys_addr_disabled() is called from only one function,
> >> get_phys_addr_nogpc(), and from two locations within it.
> >>
> >> The first call to get_phys_addr_disabled() occurs when mmu_idx is one of
> >> the following: ARMMMUIdx_Phys_S, ARMMMUIdx_Phys_NS, ARMMMUIdx_Phys_Root,
> >> or ARMMMUIdx_Phys_Realm. So, handling ARMMMUIdx_Stage2 or
> >> ARMMMUIdx_Stage2_S is not required in get_phys_addr_disabled() for this
> >> case.
> >>
> >> The second call to get_phys_addr_disabled(), with mmu_idx ==
> >> ARMMMUIdx_Stage2 (or ARMMMUIdx_Stage2_S), only would occur if
> >> regime_translation_disabled() returns
> >> true for these mmu indexes. However, mmu_idx == ARMMMUIdx_Stage2 (or
> >> ARMMMUIdx_Stage2_S) can only occur if get_phys_addr_twostage() was
> >> called, since it's the only place where ptw->in_mmu_idx is set to
> >> ARMMMUIdx_Stage2 (or ARMMMUIdx_Stage2_S) and that only happens if
> >> regime_translation_disabled() returns false.
> >
> > This is true, but only because we never call get_phys_addr_for_at()
> > with an mmu_idx argument of Stage2, right?
>
> Correct, and that's a case that will never exist too afaics.

Well, it doesn't exist currently (because the architecture doesn't
define AT operations that do stage-2-only lookups). But two extra case
labels in one function seems like a fairly small price for "the
get_phys_addr_for_at() function will work correctly if you ask it to
do a stage-2 translation", if we ever need it in future (given that
it's a function ptw.c exposes to the rest of the code).

Also, removing these lines means that if we ever do get here then
we'll drop into the definitely-wrong stage1 handling default case.

-- PMM

