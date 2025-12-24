Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F92E7545F
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 14:27:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYPpL-0003o3-C4; Wed, 24 Dec 2025 09:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYPoZ-0003VJ-Bb
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 09:26:15 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYPoT-0006Kx-Ml
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 09:26:07 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso9116241a12.1
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 06:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766586364; x=1767191164; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A372ZdRxGvYCj4eLyeuk2dNu7PCYAJNxfaa506SwjbQ=;
 b=ZQc2AJzAxSjTU5CFQc/BGANA7Ylgl7o9xGutqBb7Hgsxzowp7VzKf581nMG5ZYdL9Q
 2nQhBSR/E0u7lLCIgHMWAtl+hFuj7DHkNocnvlc2HhHUfVXp7JZanSzVYgC6ULq85vxv
 po2qHloUioTWcTfSoQp9D7GvUkJ7dky0Efsdu2uhtz4F6lXQlB+4Yh+vvPERreoKJykw
 zjYJ1WrKeghb+CkCymHdP/gDnGNF035JBPFCWqvPqzu3+PzMkQKnSzKfO1j9rsPoDMTx
 yRhkj7OJ3aZBRt0GhLG3ysJLfXdkZ60V3p3NyBViOsR0WjyzH7svMBdy5kt6F1vvEO9b
 j/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766586364; x=1767191164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A372ZdRxGvYCj4eLyeuk2dNu7PCYAJNxfaa506SwjbQ=;
 b=iafIYCf4o3TJMG2SXCX4ypUc9b4lAZM89ZomXwzEkV2/i12JoIh7wadgowleYXnhRT
 TJETBVyWcyRvL+DdH3+a+Zjk/Ooj6tEVtBUDjlORONNicqY4fNP22rJFdUe7uxTeg985
 t/gURuSOBBZ4OyKoQjWg7zLgacogsrawBccu93/ZdxRv4fpOb3ilQioWnaxUvm0geYUA
 yNKmSwg9q1AQOlQsVZgP9MtBsU9MiQUJCFU8LaC57WWLlCSEXVzcW8lWtnd4yhanoo6+
 so1rB7Jt/1HYOlk0sEJZyaWDG+TF/F/W/iqFUeckU3fulDiuVMCJ/pzuWPS3HYfRePtd
 zXAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxGrdZV8OM6txG4armpG//LMdw0mmRqKhIQ73c8JKygrLkw96rVtOgcmdtyOVd7CdeF+/gx3lqKQ==@nongnu.org
X-Gm-Message-State: AOJu0YybvDANblBaH6vvCzlZtbnoLLXPqaVMrf5kaEfFVFbPKuIsWOP8
 AGGT4H5aH3zxzFfPzCPzXSPDtnxhQhRM2Nu51c2lXxzcOg/8RYN63fQZnl11GG9bPF+1LnYvsdi
 hoa9bTCNKktr9eM2GR6+iwvUMXXc39WC6g+MozklWnA==
X-Gm-Gg: AY/fxX5WyMFbcJObUSMifNt3a1340cMk2SPEfazoqlyG0lVpBExf1bbNjnGrY/eDLqN
 21iEW0qenQxpb5Et5YGexR0wGx9fLFYO3+51twLkChuInS5w5ESel9EI0Fex6JnuACLhHxOrw3p
 Zrpqeutj5mtfNycMs9chyoo4BmRrvGb0bUjuQ/7fwxz3YY6Bhfh+PYdngKJTDMrKg6LakojT/Wl
 24i6+7EZU61yWpu+ubwmT1rZX2iaNEVsd13IlvNT5RfAL3SUQYpluUm14dAyEevuyGeXUE=
X-Google-Smtp-Source: AGHT+IHN1AN67Pz+zD7Jpd4dklo7bAm7KW+3LcjnhS09W90R6ohBEvbQ85seWLRV4mIOFsAahr/jysodY/a0jnDXbpY=
X-Received: by 2002:a17:906:c145:b0:b79:f984:1557 with SMTP id
 a640c23a62f3a-b8037180307mr1894445366b.46.1766586363567; Wed, 24 Dec 2025
 06:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20251224134644.85582-1-philmd@linaro.org>
 <20251224134644.85582-8-philmd@linaro.org>
In-Reply-To: <20251224134644.85582-8-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 24 Dec 2025 16:25:37 +0200
X-Gm-Features: AQt7F2p0MVL9vho_iDpnT9577RMEKAoVCeoNLltHU_qLfFiQ39NNbHXXPh9IZdc
Message-ID: <CAAjaMXZiYtyc1ucfs5hqxwqVFNNE-ebJeQvd4KZfZwdrBTegXg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust/system: Stop exposing bogus
 DEVICE_NATIVE_ENDIAN symbol
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>, 
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, Dec 24, 2025 at 3:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> We want to remove the bogus DEVICE_NATIVE_ENDIAN definition
> (by only having it explicit, either big or little one). Stop
> exposing it to rust devices to avoid it spreading further.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  rust/system/src/memory.rs | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/rust/system/src/memory.rs b/rust/system/src/memory.rs
> index 4b3316bf767..4e06c16a0b5 100644
> --- a/rust/system/src/memory.rs
> +++ b/rust/system/src/memory.rs
> @@ -78,12 +78,6 @@ pub const fn little_endian(mut self) -> Self {
>          self
>      }
>
> -    #[must_use]
> -    pub const fn native_endian(mut self) -> Self {
> -        self.0.endianness =3D device_endian::DEVICE_NATIVE_ENDIAN;
> -        self
> -    }
> -
>      #[must_use]
>      pub const fn valid_sizes(mut self, min: u32, max: u32) -> Self {
>          self.0.valid.min_access_size =3D min;
> --
> 2.52.0
>

