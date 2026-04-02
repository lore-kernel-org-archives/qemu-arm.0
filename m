Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A1E1112246
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 00:46:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w86Bw-000191-E2; Wed, 01 Apr 2026 20:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w86Br-00016Q-Hx
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 20:45:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w86Bo-0002KK-Hx
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 20:45:42 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so50963566b.0
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 17:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775090739; cv=none;
 d=google.com; s=arc-20240605;
 b=CpzFNX/wB6bFJeyQzrdLVJnTbJkbqp3ZYER/TfuJBStWTBWhDM+b85TnDvT8TGetb+
 almEgq1gS1ufLbYwg5BuO0RFkWEdt3tV5u/S2F0u2XmRJm/PdrhyXS+7bP2Mo8s7SV5y
 vBJ+ZuPSvaxlSKohzD91OgTmD1qupea/nEzfEbp4cf0nlEcxdoHfGqeMYHIHT2IIjPvx
 RfGXom8a5FoMEqni2RBtDt+ytJk9bqag+n/5tqQ86gDWhkkHvPzbFqykG3MksnJS7/SI
 l+SAK1BnSpYq6CtP+xqiCW9ZDn2jFHVwS8vp7etaDAYCiUZIQRNiazuf7OSMa3LkTyYt
 7oCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5LdM4uR5mS1ZaeLcLWrAhMvuDpyTdPvmVDGk7/JwB14=;
 fh=DhDz1SYXo/4s3QIXEy06eYA7GMZGCvQ8vrYc7yIp10o=;
 b=BbiQSvu3CVJwQW45cU1jz1QLGssYXnnbpldRzI0c8IemEKQpEnHDARxtIHLITdYDJK
 YVYNvEJnFUbKsPVW1TMmPIolCG6Ki7mLMc9DIHogI6ci5QWCYWHi7aISgQE81eerGLKi
 VarZ5NLyxMLWQ4M92gHedD0gKq2SnkopNHSO8Cgf35S2ZEAVJAnQFN3RGioOcbX3rvCM
 /C1ifTbIxRSUB29oFia6MjyUsnDK+m+v/1W+sFQUlFy4LKKVNMbGLOyq8igCH7VbLCKq
 pUsUU3yKOliMJiU7ng8OSR0bGmUscdlU1StFFHzOhD4AYsKm2QKcYmgT573yJqVwLlaQ
 vAfw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775090739; x=1775695539; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LdM4uR5mS1ZaeLcLWrAhMvuDpyTdPvmVDGk7/JwB14=;
 b=GXrdxNnHKp7DSfRhYpb0h3P2u9HDaGcr9iYm/ufUfEr2/VPVAHRJUcFRTMPMNbsHVt
 yy01OM22X5uL7xksqF7yP/7Isqk84oADycbWxEVHoSt1fO34jd/ZybnSIlwpjomsVXWd
 OlK+pDVl5PBPb68sePqip//MdmlCxuuCZMSAb/ffnS96Dh/TPTsgJscKb2AjnSKNKorr
 oTuCMaEkO4tDJQwtUlttG535nCASUN62kP7xwhnTJ3lOvsfRFNRBhdvly8tTY6GmGkmm
 B/14WuGsA2Z1Oztxf1yk58znfSE4zj0gWKzBTkabac4bqg7D5dPZ4e+yyJUcA9gW/B3p
 PAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775090739; x=1775695539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5LdM4uR5mS1ZaeLcLWrAhMvuDpyTdPvmVDGk7/JwB14=;
 b=n00qQKo9jp7SbTnM/DoitF8ljwEDBL4sbckp6nn051b0ZsI4uXiTsFS41vKGMYAOnJ
 JMOBSaoIL9Ks3bv0tAGdbNRK6AjER5ciufg6xZLPwy4R69JaBVI48gcHgHRhBGVdQp48
 Z6i+1Ddij4sIzc6EV83a1SdIaMdLDrtcsJEjJJbhXO4LU6YzhDSq3E/rv8RPVa/7SJEI
 /DEfrZ6CSlEOW/H5E72RiIqKjTeII8kEIDLgffaFMPb30Clra6YRdi0Lo2fn0mGsbZbD
 /rvrTUEmxHZzaCs7uMWCFQP5ZXGafs6cVsffG5SCIWhRxQkcjOqc7xypj+rfd8NZpdED
 LVeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPwESXt34UWaFWNZz7KGCJjKJPWw77hilYiSiiiDqodFUZVoHLPE5JW3jW0OcPiqTE4139/NBP3w==@nongnu.org
X-Gm-Message-State: AOJu0YzMnX2CX9BRHH432Vll+Wafy7s9KaD1cHFRqROZXveR/HW8zTrg
 j4ojvtwClyMuvuRvtK7x4jBc0YI0ZuiZTVf5S2TrLRvXUd3uX2ILqpXkoJqe21Yd/97E4b1LEOq
 jH4+iwpOtcJZans/ysS44QGnC7X7iOgk=
X-Gm-Gg: ATEYQzwy1kQV1FR1mINdpQBDWcGf0Qg4l/dYcmX8BQqToew2N/0zj1mAN0h1PKGSrru
 H3iEEkgN2UWDtaI/+dWRLWHe7VeEv8W2xWPUWvowl1IEB6f9wj04etofRe/RRgcKx1E2pthduYM
 30vnx7VOy4EdzpDLYtz+DI+Xuy3Fi/D56RbNwtpqqLJEzHSL6eE2zFlo6otRsTBMe68F+9+YKQ4
 LAJFvTsxfj+jOkhboupzw5Zlm2YqxFBRpQeEr0HykJVtlo+aNoE8lDuouMFfvoBePT2ibIz1Xfn
 ZT7HNkMajnot3Uk4YPHl92Btyt72id0eZo9LUA==
X-Received: by 2002:a17:906:a50:b0:b98:8d3a:7d26 with SMTP id
 a640c23a62f3a-b9c138fa8bemr271649866b.15.1775090738694; Wed, 01 Apr 2026
 17:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260401201753.92290-1-philmd@linaro.org>
 <20260401201753.92290-2-philmd@linaro.org>
In-Reply-To: <20260401201753.92290-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Apr 2026 10:45:12 +1000
X-Gm-Features: AQROBzCgjpsbOMdvqO6Me5z7QKdDwVgBMzoXedFW2J4bujABd0nif11HRMEEc1A
Message-ID: <CAKmqyKM0aBzpg2E8h+HziPDTL2sDQSNdu2aZfhPfhRiFw1gf+g@mail.gmail.com>
Subject: Re: [PATCH-for-11.1 1/8] accel/kvm: Include missing 'exec/vaddr.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-riscv@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Anton Johansson <anjo@rev.ng>, 
 Song Gao <gaosong@loongson.cn>, Weiwei Li <liwei1518@gmail.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Bibo Mao <maobibo@loongson.cn>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Apr 2, 2026 at 6:18=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Commit b67be03e3ac ("accel/kvm: Widen pc/saved_insn for
> kvm_sw_breakpoint") used the vaddr type in the kvm_sw_breakpoint
> structure but forgot to include the header defining it. Do it
> now in order to avoid when refactoring unrelated headers:
>
>   include/system/kvm.h:404:5: error: unknown type name 'vaddr'
>     404 |     vaddr pc;
>         |     ^~~~~
>   include/system/kvm.h:405:5: error: unknown type name 'vaddr'
>     405 |     vaddr saved_insn;
>         |     ^~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/system/kvm.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/system/kvm.h b/include/system/kvm.h
> index 5fa33eddda3..12f7fc8fb58 100644
> --- a/include/system/kvm.h
> +++ b/include/system/kvm.h
> @@ -17,6 +17,7 @@
>  #define QEMU_KVM_H
>
>  #include "exec/memattrs.h"
> +#include "exec/vaddr.h"
>  #include "qemu/accel.h"
>  #include "qom/object.h"
>
> --
> 2.53.0
>
>

