Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D8DCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:28:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtVN-0000q0-LZ; Fri, 15 May 2026 10:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtVH-0000N3-Jl
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:27:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtVF-0001cn-NO
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:27:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso106546805e9.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855220; cv=none;
 d=google.com; s=arc-20240605;
 b=jBdYAGRKZMVkzaCqYY6wSdso3Rl8isq/dlqlEJb2nB19k0/padXX0EyZjhqzbXUd/+
 jdYVIF5np3pWFbgyP5yoSCC2g806qg1Hn9px9rH+DE7aE45/dtx8i1lQ34eIKvfwrdFL
 2GM0yryK4Zrq+cRDhsv17JAjHNZSQibX4WdtozCJHQYjcHwZYNm3yUOnTv3IY+ERgW0u
 CariUDd6n2PiJGxRDWUdqzVQsIVOTlI0GK45ReGxyXCCOShNAqYmaVhZoAIw92Sgicqo
 OBvwJgYEfPF+0tWV3/Pcoxf6K18fhuHIn/HF88O1P+wYbu9tuVeSsf9KdO1E8BLTtmUl
 ruGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=r+OPeYtnjVAwulfMkaBJo0TXzswXscHBEQPnsT5w7/o=;
 fh=FcbPzJxEpMx5XmRvo8lkPa9bJBGjvwc2lozzWmKgkdc=;
 b=NYA8oC5xvT4+R5VtCV0L/rwJNT2oeyUHc6dqny6Wrk7JNWeHI9IimzJkp10mkxIs4R
 M8ltXXC3n0h8UHwe+mubnAsfeNXRZtHXU+51ft8NPtHrtsng74urU/tJZYRygVQ8BD1j
 HqFezQmcpFS1q0aqebtkpQbK2YnbRPvIRO6ug2XMpT7171xeDetMFi+D8hDSAFewQhW6
 gAF7TzVotfRCit+YR2vLku5JQBJLiuuN4ctZTElVoBOxvz5WQw7Am6yKNENMAASmRhmn
 4+nS35r8hqbnr0+ENTpgKntpYt3gXt3oq0QaKZikpBS1LJJpTUduSYZ1FCiGMpNWYz0Y
 8oqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855220; x=1779460020; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+OPeYtnjVAwulfMkaBJo0TXzswXscHBEQPnsT5w7/o=;
 b=OYVIIBVCzPe2QbiH90zCQksBYfMQtyh5kczp0CfyzSvMpLZcR61hx3WtdJYgIDi59B
 W4JA5J82FwsDQ0T3EiB7hacfhXpU9qHfN+VQCPNe4nhjHiB4S0UTNGvPaUFsTVvrCZDk
 MhTGZHFHUne+IRMafwu05HHenop215vXSt9+8Egk19DTYm7jkDU5stmvC31CsWVuJMLX
 elZxdyh3TB+DFJTwvDlVI8Pl7+RwRfDZFwSUsxTsrvPWpG1+R3gWXoUdfu4lfCZ0H2zE
 paXhqxEGoAOI56pWn0/7kYba2z3iO7G+lKyHyDWsP+EjPHvJh1ZdisuiAs+cZqQDbjvv
 /7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855220; x=1779460020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r+OPeYtnjVAwulfMkaBJo0TXzswXscHBEQPnsT5w7/o=;
 b=Iuye3rT5Ux44f8wGNX7Fp4nN2ZJTfTKBMAHEXTrxDe+W+GojfN6/WmDEHikbEqCC5i
 RYH5IVNtGAfMpDGaOD+iHwrOgx3T/XP4K7NJBtfmpr5JywO7NEv0Hxlmrlue8WyY86qw
 yQJBWXv6A3hr5YlhUXcdpTMtr8n8GBG/+AKUsXbZBfuYxKFYx8DrAwRfNhT9mg2uuoY8
 QvD/q4MzAnAZL9I3MpmuvC68vYkj3odC8NeDEvw8lzuP+ZDaA8mJhVkt5e+Lpr8Zkhrb
 z4yF51DoOYbHRrCe15EXb5UTCJ61FlPYint4M+JqWmWVLgJW5MCm0KEWXfAF40Qwlpy7
 Uj/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/C4hwU088XvEybQ2wxG6luLVjypzSv8oxME7yf+u9JrYd8JMl954eCkYsbZdKXi2Xg4swcmklO6A==@nongnu.org
X-Gm-Message-State: AOJu0YxcjsRPfM3Z0Ucp3jq+JIFJKw/qBJREWe10SPsz8MuNN1giB/kA
 II0VaDGnGfn3pPc3IiGdSeeCTVfQVLfMdTcePO5JoVcFICowjN1O5q0PQhZFH/rYzW7/bgX/Lwb
 fN67CBcUCIQsTcODj5gdX4/DOm6qz2g8OGvE0UYxFrA==
X-Gm-Gg: Acq92OFMa5Vl7WTqaiDVyLW1gSTUU319csCvPPAVm0sra+9Av+7DcUnqWOiGf/1VljP
 EYYCUtlOEbcNjY40fLwFXjonU5i7BsL7KIUDcUCoRf16OvBilkhXK6mE7FKxnqx3bGNd9KUGcNd
 2F+JKFAwkcbPAUpTn+R8CXPwcd8Ryy3CEMLzAT2jhBANv5dpeVvx6Y/RIZND2p7LDmLD0CdS+2E
 qjy1OHCv6+fYSjcSjGbPhBKs7Keha+O7O1kVjW6oDyZ/aoYJLgNHiOsFvmGwpW24ec8FUF3Lxpo
 SwhcydeKSXAhkh8W+8k4x57SSQWw1MC9bluSQvNRL24XXL7RqQ==
X-Received: by 2002:a05:600d:8:b0:48f:e6b9:c740 with SMTP id
 5b1f17b1804b1-48fe6b9c811mr56771145e9.30.1778855220222; Fri, 15 May 2026
 07:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-16-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-16-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:26:33 +0300
X-Gm-Features: AVHnY4IOVe2TuJk0qecob8y1iCMOMIo4za2mj-OsBCB5Gq2L92DoJPcgG4zvgio
Message-ID: <CAAjaMXYWZwvBOVQ_qepOMVfMaATqBTf2z5cKfvfjEsGKQ_zzQw@mail.gmail.com>
Subject: Re: [PATCH v6 15/20] target/arm: Only set %kvm_target when KVM is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x329.google.com
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

On Fri, May 15, 2026 at 5:12=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/cpu64.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index b38a78aac3f..7b2f09cf8ec 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -701,7 +701,9 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
> -    cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A57;
> +    if (kvm_enabled()) {
> +        cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A57;
> +    }
>      cpu->midr =3D 0x411fd070;
>      cpu->revidr =3D 0x00000000;
>      cpu->reset_fpsid =3D 0x41034070;
> --
> 2.53.0
>

