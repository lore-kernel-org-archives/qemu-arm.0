Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B2606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZtMPzyAG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMR2k-0003eX-49; Thu, 29 Oct 2026 10:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMR2c-0003do-Az
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:23:45 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMR2a-0006B3-Mo
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:23:42 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ab3d3c5761so20847537b3.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283819; cv=none;
 d=google.com; s=arc-20260327;
 b=CXG261B0yTbICtGsoZRF/6OfBXa//RGqQI3fGNENdrHWrbDgLY6RVnjIeCSVq9ihBW
 tgMMbGlRMukGCNIYVrgfGd+goPtH9OcPnGgkynTtEDE5Ao2VHOP4aDmWzp0xye1PmSXP
 HAFxvJv2Uez1RsxIiZK9jyHhN1jEIn3npJ7X1RzJxkLA2FtmOHgZpdDGndQ5cNTlzCYV
 Lm1NQ9e6js5cWA63gFr62GtWzMpuAw4b3U8OJBUrpInMRS3dghQjgT2yb55KFJC7rUiT
 m/VEquJsdq3O39memgAs/3n95F2TpTiowWqeFKN5xCZMacBHlkrX8AFijG5hHIGgmyUE
 DWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VzWICAQETZsiAd7iFgIdf+dQ/z896t4IzSy3uk2TUHk=;
 fh=Wv5fUzptgCd+Ld5NoH0jD+luf0nT9rts9uHrizbO5+I=;
 b=NirV+8o/5opX6/QshV0T04j5gEY6wXxEzUGbYmZPosPrNEgx/srNJ3pSFTONhrbBBH
 jftoBIv5vhMoEKKEZByrqKfA7pQF3FnlXi0OeJHWpDQPiyaFJls+815XtINAqVu9Qv4a
 rBLjyD7hVCaaqDroBcJEt693VcITX8JdDCl4F4cUSremMg3u7IjES1RSGgivsNt1tdTq
 9C9WaAtxhfWqqFZfTyljBgo6IGR1Ji2eioSeyI0LuPEv6HpOjSf7hmwnzuRs2nxnpyo0
 g1WpHzwTWf0JT0T3Pn7nXdxcK6OlgllguBXLhcWrtzwZLQ4fJ6qmYHdRvH04OKZmUd8g
 cB8A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793283819; x=1793888619; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VzWICAQETZsiAd7iFgIdf+dQ/z896t4IzSy3uk2TUHk=;
 b=ZtMPzyAGxUOviUe2fW/TSqkefN3KbkBCC8Gto+T2/w8TZ1sYO38Nstxl2aVeIsbGlX
 hQkPduFqKrZBEytlvi1CL4qtws0t6mAFrr1SmF421tMMy3D6vF3QrKMJlLbP6Bg0+VFr
 edSN3dC9Ut5KPAjrGrsMyICfcQlxNW8w/pBsX9NZ0W9ymA7qbVi2qfAI+HaCGSuI94v6
 4H6b/OV5VJXWGN1C3sN9cuXCCWQyYE+FFBYTM1ehouepCoJgpiljvPAhrXmIEPvbjgAB
 4xN8foousgQZ6EGum0W9+y1lB48CK7gTd+YNolzlMnTby6FrYpjEaK6EMepnEUGc4Q5n
 gYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793283819; x=1793888619;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VzWICAQETZsiAd7iFgIdf+dQ/z896t4IzSy3uk2TUHk=;
 b=nWgBygpY5pWvk1qiB1+ocd7Z4cSODdgmS2NvFz3UbERb8+t8KXgUdRukS15vUII++o
 uwBX2qqFrGPszOSjbP3hNy+9911QDASnnkateNh5cfr6kNQrripv4rsRU90KfD0uL1SI
 9T7cf08C/tAfrzc+UqiQFJGxSvBO3D/PXwX67lFkBhpphldTfODXQAX94jBGuB/ALQ0W
 2HsXrgRDSP4MYxqt677j8C07+od9XsVrD1p27xnIdDceOrp2Zb2I4eKtf/MSvvLXZuLx
 SkAl+ZxvILLhj3pQymtRPRSmbFbGK01owEsm/A2nxSmhz0SCuEp71oFdKDwJOhyqBO0e
 +l8w==
X-Forwarded-Encrypted: i=1;
 AKwUvByvUuUyc+Fzooun3bAnYBYRX8sNcjeffVtrMm/KFX/HCvnu+bT49JcabfaS4uR/LNf0gRUMbr94TA==@nongnu.org
X-Gm-Message-State: AFq9FYJV2+vr3QixqLNQ3XDF9BRsPcltAq3mRp0v8BhS5io2TDTT6QP+
 yF4HbHICxrBwmkhNcu2F+C2uFDytz3s9sQzJQNV9aCYNfkGV3av3G93WO6vUrILNU2bRWica0Q/
 9sAm6y5Wi2m3TzOO82l/jBCMCntT52u5I6Ld0CxcdVQ==
X-Gm-Gg: AYBFou3cJPjEFpjfa7jtN4HuqgOC4LtjGlB7OpDZDCoGjPCXrf8iL6KV9Az1avILbCn
 /AZHgFv+yHR5zHeoN3IiybDOBiT7Do9hOgjB/V6MQs6FkSZPwa+RzXd1tUIaL8jzzlwRUo87gIv
 cEG56ePDE+j040xzFQp4GfXkJ87oGohpx1yVh0gw6SE+HGnthxgS09o2Ryz5VcGtSeZT5wqsAJg
 wlK+64VNuHpq3Y57myur9y/DWfi61EDQQYXerpivpJNVdV/9w0cQJ+26mEBanASzg7VdBwY0/NG
 NRajemmUc5awAm9n/eJnJS7ReGYG/qw7d+ZLDVfVhPceh2cIgM0nBxcNkigX1FRokuRcR0MhDdp
 m1AGC1cADf6pxl5Y9H81H2omkJjMvFIdly7Z6AZYjno+aarhG4gcLT2luOxbIX2+xDIkAQoxq0n
 52XWRd2Y5KR8TePBF+j5Iz
X-Received: by 2002:a05:690c:c6ce:20b0:87d:b776:c659 with SMTP id
 00721157ae682-8b1b5bbd2f4mr30463517b3.11.1793283818694; Thu, 29 Oct 2026
 07:23:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
 <20261027120135.53048-7-mohamed@unpredictable.fr>
In-Reply-To: <20261027120135.53048-7-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 14:23:27 +0000
X-Gm-Features: AclHuK_PiV6LLrnV-5xbdVki1L0-fECRL0av0EEBiu9tqIvSrDR1gJXu7kgrfvA
Message-ID: <CAFEAcA-BPx9nJ+hN=G=5GaEmCGrXy7dkGs5tghbEd73mSp7MRA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hvf: arm: sync vCPU state on PSCI reset
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 12:01, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> In case of PSCI off followed by a PSCI on which
> is a scenario that happens notably during kexec,
> what happens today is that the state sync does
> not happen and the vCPU becomes in an unexpected state.
>
> Address this via marking the vCPU as dirty during a PSCI power on.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index e1ddfe14c7..7ce2e38df1 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1651,6 +1651,14 @@ static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
>          context_id = param[3];
>          ret = arm_set_cpu_on(mpidr, entry, context_id,
>                               hvf_psci_get_target_el(), target_aarch64);
> +
> +        /*
> +         * Mark state as dirty for HVF to sync context
> +         * when the vCPU runs. arm_set_cpu_on() does not
> +         * do it by itself.
> +         */
> +        arm_get_cpu_by_id(mpidr)->vcpu_dirty = true;
> +
>          break;
>      case QEMU_PSCI_0_1_FN_CPU_OFF:
>      case QEMU_PSCI_0_2_FN_CPU_OFF:
> --
> 2.54.0 (Apple Git-157)

I do feel like maybe this isn't the best way to do this, but
unfortunately I don't have a good enough grasp on all the
state sync stuff to be sure.

I think that calling cpu_synchronize_post_init() or
cpu_synchronize_post_reset() here would be basically equivalent,
and maybe one of those is the right thing? Except looking at
their implementation they use run_on_cpu() and at this point
in this code we hold the BQL, so (as noted in my comment on patch 5)
a bit dubious to call here.

arm_set_cpu_on_async_work() could safely call one of those
sync functions (because it always runs on the right CPU and
run_on_cpu definitely doesn't drop the BQL if it's already
on the right CPU). And we do do a cpu_reset() in that function,
so that does kind of argue for a post_reset sync to happen.
But obviously that's code shared with KVM so we'd need to
check through the consequences.

thanks
-- PMM

