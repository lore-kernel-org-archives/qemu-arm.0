Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5243CA5FB3
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 09:54:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCDUg-0002Bd-Vr; Thu, 01 Oct 2026 05:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCDUY-0002Au-Qz
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 05:54:20 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCDUX-0004rU-5s
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 05:54:18 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8ac8a2ac52bso4917117b3.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 02:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790848450; cv=none;
 d=google.com; s=arc-20260327;
 b=ntBU7YVDRGyyqA6yhFr+ScLsb9SOwRgm2/DkIPpTuMsxqCKWtu6r8Q4Lm1WcqIzHFU
 fvsrI58CGEQHVtzHom4Vaqd/jkNoLM3PLI0DGeR00v/8GPxeJ8BRLQ5AvZb7jFRpcoRb
 QSN3c+6dht87TVXD7fWfRTp8780qCeyq0WvLF3y1tue1JL+cIz1dtkzO/qaVxTDeYmHc
 093H/3uwjz/kBEIrlY8AicL/eThaUpsps/n5nqQsZDLtXLhnCRDx9PKX4ReLBBn6Fk6W
 yqOEtJ13NUZ701Bq2DiHJPfniaaaqfsyWsDcfRWWzpGOBbvseVdKkfBnDJaC44oa4eD+
 P/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WrZ4og2iqhMmChmov0L+16CZKmGg2p7xKWkxhtoUHFU=;
 fh=khYNcxNgS/2AF85NcpBuvCKCZxE9Cy6GxbHict5Qcdk=;
 b=OTn5c2S/lBvsYa/PjGWXCpbYM/IO92rlWeKF991y6VpnrTMSEU0S/zjNAZHFpzKBLE
 nrUCh1GEMIp/HSVOqpYnG2HkmJrgsGfOYP2yZ1AjG+FOIFamq6toAH6U2/2/cLf9PJgQ
 X+G+1HGVka8RyR3CxXxYGupLIhqzVhKR56d+9JT7J11KhQpkBuKcyZOqBF2z7r3AMAfT
 cjdiB+rJSlIEJtTvdmKvPShFi/Gf7kWL6I5Ui1GncWAwc4+3ypMxadw2laPl7q3wfbHh
 WLuJJYOLd7JBm3dxhkSZwfgVgAZqP0yuLhYBvxnYduVj/a0Q+MNDazPPA1+fL6JX0uMC
 //4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790848450; x=1791453250; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WrZ4og2iqhMmChmov0L+16CZKmGg2p7xKWkxhtoUHFU=;
 b=tSVaJuDjg82rYiiOYUHAWABIC+umkY8QLwd9PB1HaglHsiZ1l3dq0jGW1n3cj4TcLM
 HHvMI7wr+JFsU5/Tf1W/s5oAcQcGzWIc/YIgM9kJjOA14Z5Beco7+gaXhVnx8k8lIazG
 29wKXetAAYpihJi2+FWEpt+lvpTWRr+yuRID/QhUP24xmzfFhmGCu/tcOvfyPtEIh9uf
 D2E9I9VcH20FQv7mY/7yQfFzDHqUCT3v5YedmZI5aS/K3LoVIMYKqWugySC9E37rvl9y
 MRug+B0oYm+JgD6cxS22107LKdexqBW+wClJn3N5Zc3Uq7U62QcsmYn5qg1nXRVsCfEA
 I4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790848450; x=1791453250;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WrZ4og2iqhMmChmov0L+16CZKmGg2p7xKWkxhtoUHFU=;
 b=aVWzGem2QlCWjeGtj2oLgddQBajLlcYCL7ca2w+Hokrj48rwM7zR9PxD/z/FAfHXI7
 E07UGZybvHAP0UWpqAEbwtYBTTQIj4+JMYrp1nlw2ApFWzXt66TCNGGwhvsEP6dOHOYR
 7LkL239lkGUGfCVuyNQvcz1wACTJz6iHePoIxdmPGXS+xNUQOmUE7Py2T3TltcVjzkl/
 yga6ym36/VLBf72uLPBLszAvyOyHd9C+bF0qxuae/9de7VftlUoFG8kwKP4U+GAAd/mI
 9Pn1qglGqPUS1JrYWlHiEkqTK8DNZaRLerpKVk4SrTTCxnlC0Np67HJ3qUPEKA54Pxug
 KCTw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4BnPANtA13C4I3im7wRKfXLTLa23IiAhZ3qRmr9J6Gre9n4sB4lVKA8nTdmqTN0jwsj5ZsPysUQ==@nongnu.org
X-Gm-Message-State: AFq9FYKSWfP8ZL4o+6mLTrN2AYi443/r8w+lzO+l/YYC8qa85Nrdpno0
 Fq/lfmr/nsmkbk2xb39SWsPJUmFdH7nRrMgjw3JsUBqFd7zO2N+VME/TvrD5AbNKORNLeV08OG4
 jEWUDVPvF+luSetXY2CH+KAJAceZz0eM96ziY5joMbA==
X-Gm-Gg: AYBFou1AUpuiO7B7ar4x1uL6fNtl+3D40FNNlhgTiDlSSiHRjjqiTViLG/yrwnlyrdF
 9iYsH7ltGRe6aP/b/vcwLNVQv7+Wu5a39/HehMYWUGkhpKsnvVylBl1jMzGxZr7X0u+mhKGhOGC
 j8IBjpFiGazRLvimTAdWjMO584hsPytg1LLlJuOHBsXZspznfiVrN7ajeDaC+LIh39OCzSUNk6v
 4BZMjpEsoPxnAMqVSEMWFzMVfkl9qCBQ/tpkBZ81BmDOh4ZAe2+xchzrJNiW9ZnK17aduc8j+Ii
 wT2G978owKZAmdnUPPBvkZq2gcnZJ0bBKdgx8jwWCA7B7d+FkRLo+4agbSDo47MmuB9ADPhCENz
 5xH7dW6a2h65iKqQ98oBknqTYkxwZBU77NLpKNvUDLF6Asl0KWg==
X-Received: by 2002:a05:690c:e3ed:b0:8a8:93e9:381f with SMTP id
 00721157ae682-8acdaee44f8mr10634387b3.22.1790848450256; Thu, 01 Oct 2026
 02:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
 <20260930174946.82195-10-philmd@oss.qualcomm.com>
In-Reply-To: <20260930174946.82195-10-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2026 10:53:58 +0100
X-Gm-Features: AclHuK-AQIrHsn86uBQIqSqBHDz3HBv4x_KwjFung085t5QqnfzZ5LMfCBD62IY
Message-ID: <CAFEAcA81kUriHYPj2EBNYiBsJUMmgknCGRif0q0cc5sndro2dg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] target/arm: Kick vCPU after updating PSCI power
 state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Wed, 30 Sept 2026 at 18:50, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> PSCI can update the power state of a vCPU other than the caller.
> arm_cpu_has_work() reads env->halt_reason to decide whether that
> vCPU has work to do, and is called from the vCPU thread without the
> BQL held. A remote power_state/halt_reason update is therefore not
> observed until the target vCPU is rescheduled, so the vCPU stays
> halted and a PSCI CPU_ON of a secondary vCPU can hang.
>
> Kick the vCPU after changing its state so it re-evaluates promptly.
>
> Reported-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/arm/arm-powerctl.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index ef14a1f8a94..1ba5277b023 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -48,9 +48,14 @@ struct CpuOnInfo {
>  void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
>  {
>      CPUARMState *env =3D &cpu->env;
> +    CPUState *cs =3D CPU(cpu);
>
>      qatomic_set(&cpu->power_state, state);
>      qatomic_set(&env->halt_reason, state =3D=3D PSCI_OFF ? HALT_PSCI : N=
OT_HALTED);
> +
> +    if (!qemu_cpu_is_self(cs)) {
> +        qemu_cpu_kick(cs);
> +    }
>  }

Looking at the callsites of this function:

 * three places in arm-powerctl.c call it from an async_run_on_cpu
   callback function which runs it in the context of the vCPU it
   is changing the power state for
 * target/arm/cpu.c calls it from within reset for the vCPU being
   reset, so we definitely don't want to kick the vCPU
 * target/arm/kvm.c calls it as part of the "sync the vCPU state
   to/from KVM" function, which should only be running from
   that vCPU's thread
 * target/arm/machine.c calls it as part of an inbound migration
   to set the vCPU's power-state to whatever it was on the source

So I think that in the cases where we're actually running the VM
the if() check will fail and we do nothing anyway, and in the other
cases (reset, migration) we don't want to be kicking the vCPU.

thanks
-- PMM

