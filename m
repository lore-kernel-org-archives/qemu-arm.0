Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9B8CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 14:02:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKzJE-0004Tr-Vq; Thu, 07 May 2026 10:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wKzJC-0004TY-LZ
 for qemu-arm@nongnu.org; Thu, 07 May 2026 10:02:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wKzJA-0007gZ-Sr
 for qemu-arm@nongnu.org; Thu, 07 May 2026 10:02:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so7863005e9.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 07:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778162550; cv=none;
 d=google.com; s=arc-20240605;
 b=bkFHR2Qva1Wzynriu0w5yqdzZnUROFJfgxP5FAgKCKNYmtWs48K2olC3cD6CE/zCBS
 8N2INIkjiXWrOiai3nladxxlpHJu9I3Dt6dT0CxmkV90P0LDEzEED3hJfda7DS6gMLdz
 CZVPqp2KZIsGXoTKf08tQc7ws4mQVMZdQf79pZ3InKCu6JWvcJMiWQkoWzq6JKzMvk3g
 vqjmffchj3dEQQT7Wo1R8wJ959//2Wn4cUOe+Yo01HjrPfWdGMI6FSNucfs5ubCo4M82
 40bUmza9QPlz+tFUm2GbkmhdfYPmCEH5vw5QanE7B6lefAdKZCSR3NLrZS47Lz3jkIh1
 HVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kcYoS7iDnWCSuGS9NNa2Nr9l+Es5VwNe8YSURL9XLdk=;
 fh=D4yKdPIZ6enSfOyhGVyimeZXYcu+IYztms6JU+pmKEo=;
 b=URsXg/G7b2sLCUh4I59psrBxfR3NgX8SSLz5AkFGfj3q4oe850l6sqmXfF7l+Xnxxa
 qLR/kw6IiVdN7fAVW4hpK3QH8LrCk3GO13rtT1kdXJLvnBMlofP7lnzyCHGgGhNIPYJd
 kQLpw8oh232os2VzS1cfzWs3K/kvD6yzpOlChCdofC0BucGACtz7xeJ1zPjjm/Avuoc7
 flB2G8aGL2YhEV1mHDAsO9geGr5P09428RYh3JAjZ1yhNN/9TcRxBy9xPCOSAtOqOoAS
 UDRXh5MKuvYGWuWXhEYFKqdnN1X0KZl/i6ZR/zqUI4vj37iMgd0QWdEfOp/GDqZE6Wkb
 NGJA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778162550; x=1778767350; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcYoS7iDnWCSuGS9NNa2Nr9l+Es5VwNe8YSURL9XLdk=;
 b=b6wFWo3JCIVvmiY5DkIbOIUegC76e5cCREyVZiEQOJ6ZMRg79KxNhWrIUWIVLPPNGC
 zx2EypUNKVADKX3/YKF1QG9jQX0ShCfwfWsXLWs0b+JGSCSd1D5i9e5RgI/4Wtdm0/XH
 0OvP8lFQGjnNHr/u/ypdH6kaKOTAz56iEkK6MC3LuyVq/HHQBea0M3oM3p/llL+cLe6I
 /Eqe3iHFO7epqAmwUxRnt2RRJwZqE071RIPuy/4YM/xUhA4hdlXJeBOK3BlUgm2ecdMi
 WVlyeIXJgH3aoKUu9XNhTIV95hI+VBXQkQvgd+TwWnsBoVX701Trcu24GbXB18rqYfAk
 CNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778162550; x=1778767350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kcYoS7iDnWCSuGS9NNa2Nr9l+Es5VwNe8YSURL9XLdk=;
 b=E9onVsCBeJp7BmhC+Bx71vjqm/Ol5p8O4YQW27YutarK41Xa0PO1h6ZPZAOUqpIUYw
 Rh5mWL3N006ttVEIMQNOYGv5H6bM0OIcWIQY5ma4ThDcz9lOcOQGkRA+0DjAZr1v2MWs
 5PXupeKxEb53UYVVCTZeHgoshb1KUV0+UJHj9Z2SCwbcGnPTNEFqHlsNDWc+6taY/27e
 pzayT5vR0bKFmHPixam31fNvy/XzeHtz8vPoWGo8f+XAUNsne2+HgUhQetUHuIHBZA2U
 jFxtt5Dj68eKDmc5JgYYIQ0OBoxhK6xNpdqmu5uBcHFcHFzD3Fzd6hrFb2iOqfUzBS8L
 zwug==
X-Forwarded-Encrypted: i=1;
 AFNElJ+gP07bRawdLs7aeqmmZTzoRTytkpMSkt4Cp7S20OsqzV01ZN1b/bJIrHMbRcdLWma1OCNLxllmYw==@nongnu.org
X-Gm-Message-State: AOJu0YzqJlM4fVhh2jj+S6OYreW8Zh+7pupqtt/2ZBUPgBcGiPol3NEp
 dVfAgqdztOYrBdRAznZeUWt9UwDTlbHSP71EuewExgXCVKP9QgPGjGrSXw2v/PQ5HyTqZ5E+tWy
 AuF5+BPXOsezMHMad6TzIGy0+fuVAfna6i7s+biUe6w==
X-Gm-Gg: AeBDieu04G12aN14zDX84UD+3IaiqGM2U5AI6jn63Wo3c0e/0cCZHb39oAKMFU6Es/d
 W5TfengHfPvjbXEiCCoYecx7DIJiEU3Bp6011Mwea7rS5zQBeRiTcr5t+l1Q9XaqO4eoZj3S7ia
 3ad1Gdr9TfnPV6YSE0oDIHOe21qjg7V2Yit/ssfvvyJktaCPB5D3381ZGjoLPMsSPTDjA3FSpre
 TXG9Z89/fz/vAJ+7/LCTSGL73cI/hgEGANyOzQn3DfGbghvZ+8qWmb4Alsq+A6RuZXkgDuFo+sv
 Dx7Zeh/+QUTDmSq9OonKv6f2cZRAsBYLANcYARmUxYARqWIl6it2rUDhXw3o
X-Received: by 2002:a05:600c:8485:b0:487:55c:e0c1 with SMTP id
 5b1f17b1804b1-48e51f2f853mr142220085e9.14.1778162549731; Thu, 07 May 2026
 07:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260507135816.71171-1-philmd@linaro.org>
In-Reply-To: <20260507135816.71171-1-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 7 May 2026 17:02:03 +0300
X-Gm-Features: AVHnY4K93owjtKHnushYsimnrxVqYWeMKGAQGtDKMelg5FNJR4ybRvL5pI9ZmuM
Message-ID: <CAAjaMXb2biOk7wZDVAfkb+qJm3_-HJeCdepfAFyr6pJe_sHztg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Build ARM/HVF GICv3 stub once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
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

On Thu, May 7, 2026 at 4:58=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Move arm_gicv3_hvf_stub.c, introduced in commit 48396ad6ce9
> ("hw/intc: arm_gicv3_hvf: save/restore Apple GIC state"), to
> the global stub_ss[] source set which holds stub files being
> built once for all binaries, instead of one time per system
> binary. This prevents symbol clash when trying to build a
> single QEMU system binary:
>
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>   duplicate symbol '_vmstate_gicv3_hvf' in:
>       libqemu-aarch64-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
>       libqemu-arm-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
>   ld: 1 duplicate symbols
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/intc/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index c6de2d9d00c..25a4144c83e 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -43,7 +43,7 @@ arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: fi=
les('arm_gicv3_cpuif.c'))
>  specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.=
c'))
>  specific_ss.add(when: ['CONFIG_WHPX', 'TARGET_AARCH64'], if_true: files(=
'arm_gicv3_whpx.c'))
>  specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files=
('arm_gicv3_hvf.c'))
> -specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_false: file=
s('arm_gicv3_hvf_stub.c'))
> +stub_ss.add(files('arm_gicv3_hvf_stub.c'))
>  specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true:=
 files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
>  arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'=
))
>  specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
> --
> 2.53.0
>

