Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261EC61DB6
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 08:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wymux-0003Z5-Vw; Tue, 25 Aug 2026 04:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1wymuw-0003YI-Rk
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 04:54:02 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1wymuu-0001km-LO
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 04:54:02 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-93695893ac1so268444385a.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 01:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787648039; cv=none;
 d=google.com; s=arc-20260327;
 b=XI4F2/aIEayijAmRCWCvQ6P2Xc/NfQ6J839qzwLrEiNskhU1k4zeIyyPvVnMT5pLHJ
 tPUvqzRQYMX04UV3+QhAX7VtYqzZsb4o2hXTrW3099P5x51OE0B0XwZ5gevhlq/5ONK1
 EQvkw2U4n4Rzy6Sz8wRxJLIH1v9itK8vrQymI+cdM8Gz+syeF5RdhdrgVzemfTEmIuq7
 7Cr/Q55bykCAFeOATEbxpnrJXIZTLblClWNEjFA/YwMtGhYt3Ik/da+SWrC2HlUGFb0T
 9sFm3SpgPLmjjejJ87fPxG14mfpRjb9AJqJ6k5ZBKsAfdQBHUWDv4I3NsZCJLZymhbdq
 jiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IxATitYurc8EbXYI2BSj9Hs3kEcBruMDQ56bb7ZIbcg=;
 fh=Li7OcrCFNzvtI0l5mw+hZ8EFhP8OjgOBRSMI7K99rng=;
 b=RO/JFmFIsCP6utghOJVCFDKwP0/DN0gRIzHpCQs5A2CL8v8jCpZvKHjuPrwyXrvPNQ
 voIOXm7Mp7OFbo4nAPQZmangVAKAB6Tn70t3o9nqvcAso4MYlsKra+tqdvrUmemK6Sgb
 bInJJNRaO/EY+6UAv/ICvLhV3XAVmwfiBWgyKzbzrtqQ/I/PWjmZLW/ohit5l/z8BS5y
 UshNXo5afdXzx8bxz37Mez8vbWFDqCL9C7Vi3Vna2QlwLZ2xdOhGV0i2V5q2yNxAh7X4
 yor01deaVcosnD/p5wDvpzCl9CF7eFJfWHPcx7Pie/KehcNFZYjz42lCOCnlH4Ds/kO9
 I73Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787648039; x=1788252839; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IxATitYurc8EbXYI2BSj9Hs3kEcBruMDQ56bb7ZIbcg=;
 b=AFyq+X6RZmIcRuxrROboRrqv2KFoTUZWAaDeTnYk7RYWKogNzohIynNze0Howa7oJc
 wdU03bDSRwaESW3iyIorvznlu3DpqmDVLJQX73Q3xAMU2UEkHKNLgk9uJY+L9kQL4w6t
 IBIygnJTv/cfTgdx0b+7mDO1AeJo60J2Efq3cZX+GeovwdxWNKdwiv38WHyfDDnXRPez
 vd9kE7yhvfBUnR1wOW2rY4udSbpurfxkwNoAjV6zLDg0S9rYIksIWzldYegdazMYq3MJ
 7yo8KXSP0gJB7nIqL638sWfU+cUHU5nkCU0UFDfsi+R52smt3CSBPfuCO2PhX2N/98Z8
 QBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787648039; x=1788252839;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IxATitYurc8EbXYI2BSj9Hs3kEcBruMDQ56bb7ZIbcg=;
 b=IsONs7zS/7fe9LXBp/JjCt4A0KiKlKBUubzSyL2IG/hL6cN7oh7guYc/oEvIcfFguS
 8tvy9wngM6Jb0KYHSOeXqhynmOnc9Okhk9TweXOKWMm/xwG2aQOiNlYHnJHtlcrkfriZ
 7mrfhLrL9qqfL738FLdOefGYH5D58umo1FemMmP+dK72O8KKW7Ajae08uVfkMa/tgYgW
 3bFCxdJEYknpztpGQ0JyROMqMt59WfO9/fu0Vj6FgNHeNVBSz10aRh2kIVQdRfNpG61b
 EZHsb+Q1Da2Bj4CyFYBkq0qPF1YCWrRMrOu2IzpjMd1uZrJoUsq+zir+pZTEo9YQiY+/
 8bgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/LMQHK30CaLTjIG6II5/4FKlKEjvoo7TtgPv6wagsgcNMKunJaw4u+HM5Jnf5Q0C6wW436AtLWA==@nongnu.org
X-Gm-Message-State: AFuF++kGjCrd4F3ikLgG4iS+rimUTLlkPRoTwAumFWBYlqNaqlqaj6HW
 0p+n4smsffI+PUQvR3cCYNvumVwtIz84tDjCCEkFFdMvZbm+yjntSb20FPcGOyNXxsiMYktH7kv
 aVrM10tFomjlXNwXOrJuMfzehsJhFtgw=
X-Gm-Gg: AR+sD11CJdNTKSjurXUykaXA2xJaz/zGbOwYAkBTdKMcLduMwS+r9hAq7CRD85MXz60
 kJzllNMMZcWbrZ1cIwJGGoU7Z/VxtabvFOv4n+gt88Zn/qx/NFeddusUyiRccQJxKkufVr/LUH1
 xqQKeyA9vI/dtC79x2YfW8v47TpNTdy3CjQjBB50EF9HVEpa0jKC17UO+kMP9zoF/2FHrqwEfRQ
 uE1SC6IEECw59numWVlGndfrI1whyo+Pb3YxEC5j73W10ZrIB2Xx50YtAu1lmaNCoJ89z56q29i
 Wmpo6MvdbP0Me7oGU7tZItlAT/QJ+wZeiq2G98qwUIfRDZTrlUCnBZg9eTeEwTrM/aqoXKQcCUf
 zAqwITTaXIGY3Vv5Mgx6mjJVHjDTz0dp2KS1ZRhpOTCqlZ8Kq/luTSQHg+yW6hNE=
X-Received: by 2002:a05:620a:1a1d:b0:937:6771:e7e7 with SMTP id
 af79cd13be357-9376771e8damr829132685a.30.1787648039244; Tue, 25 Aug 2026
 01:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
 <20260824111711.26297-19-philmd@oss.qualcomm.com>
In-Reply-To: <20260824111711.26297-19-philmd@oss.qualcomm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 25 Aug 2026 01:53:47 -0700
X-Gm-Features: AcwNN1WEwK2DUZH45Zj_m2ROUpqkMXxheouHHKZZ_3nAzeD16f7z7iGe_QZUvgg
Message-ID: <CAMo8BfL88QP4WCRc_X3AXHZNjXp5L_6W1spUpZg06vQjR_fceg@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] target/xtensa: Constify CPUXtensaState in
 xtensa_replicate_windowstart()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.004, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Aug 24, 2026 at 4:20=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Add the const qualifier to CPUXtensaState when the
> argument is accessed without modification.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/xtensa/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 442e98bd1ba..49d6ad9083d 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -708,7 +708,7 @@ void xtensa_set_abi_call0(void);
>  bool xtensa_abi_call0(void);
>  #endif
>
> -static inline uint32_t xtensa_replicate_windowstart(CPUXtensaState *env)
> +static inline uint32_t xtensa_replicate_windowstart(const CPUXtensaState=
 *env)
>  {
>      return env->sregs[WINDOW_START] |
>          (env->sregs[WINDOW_START] << env->config->nareg / 4);
> --
> 2.53.0
>

--=20
Thanks.
-- Max

