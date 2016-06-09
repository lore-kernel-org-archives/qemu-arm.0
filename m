Received: by 10.25.27.66 with SMTP id b63csp477892lfb;
        Thu, 9 Jun 2016 12:16:16 -0700 (PDT)
X-Received: by 10.55.39.146 with SMTP id n140mr11975600qkn.10.1465499776486;
        Thu, 09 Jun 2016 12:16:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19si4192000qge.112.2016.06.09.12.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 12:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB5R9-00022N-Rc
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 15:16:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christophe.lyon@linaro.org>) id 1bB5Pm-0007L0-JJ
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 15:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <christophe.lyon@linaro.org>) id 1bB5Pk-0007JI-0E
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 15:14:49 -0400
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c]:33601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christophe.lyon@linaro.org>) id 1bB5Pj-0007J0-9S
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 15:14:47 -0400
Received: by mail-qg0-x22c.google.com with SMTP id l44so24317132qgd.0
	for <qemu-devel@nongnu.org>; Thu, 09 Jun 2016 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GWE7JQEj599mCZ+NjOeVvJsJCbthZeR1Lx1J5Srncrc=;
	b=f2BnOCICSf5Tfih2Yf7XFm2Mq2aTQMYp76KEVenqbWyVxoO5D313vXBseQThwVe2MY
	bMBVFS/gnXks6EGiAyc3JP4PWR/HnS1pC4Q6U5+trpt/bYyGYuWAU7udN3l7uax0MBQC
	7f26At/j0y1nDloqaGIfMmZSpkSTleZ2YwcXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GWE7JQEj599mCZ+NjOeVvJsJCbthZeR1Lx1J5Srncrc=;
	b=coodJnV50gD5H9NZFyLfXwEgJJ8J7Fy8kd9ySeOuAX9XZuuFUh7ELsfiF7mlCngEl8
	tlS7DEhIgRqi7W+pOm1XxIdIr2qYX9tU4xpRDrteXYawmyUKdd4wRgpbVuKfTmQKrhpb
	VGyb3zDKaCXJuugdDVJ9fvQchTCqDNFGM6JQ3CSjMpVwJpzlR7tAceUYz/lccw00yYoS
	aGpq/TexX0RG5w5sOZwcEVuI7imhKTfjQf3bGL/Tm6x1GVkZi/SUa6loBn1mT3T5kZBb
	RQK9J/0TTIBKQsUoczuE53PKBrodfOW1jYq3rauX6qJkDQHjw8C2haGuX4GBqe08UJhO
	FSsA==
X-Gm-Message-State: ALyK8tKw+DzYGFvxXbjFJSKmRpHX3+gf2oQ76gATany/aanQkpf10iSNsBA8PZa6AMQeF62DyUGJAo+WZywWGp4T
X-Received: by 10.140.99.109 with SMTP id p100mr11003394qge.97.1465499686698; 
	Thu, 09 Jun 2016 12:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.39.47 with HTTP; Thu, 9 Jun 2016 12:14:46 -0700 (PDT)
In-Reply-To: <1465492511-9333-1-git-send-email-peter.maydell@linaro.org>
References: <1465492511-9333-1-git-send-email-peter.maydell@linaro.org>
From: Christophe Lyon <christophe.lyon@linaro.org>
Date: Thu, 9 Jun 2016 21:14:46 +0200
Message-ID: <CAKdteOZROxE5bk20Ubg3D-MEA2=wXctSU92k4nLdkvcvaYKe+A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22c
Subject: Re: [Qemu-devel] [PATCH] target-arm: Don't permit ARMv8-only Neon
 insns on ARMv7
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wDKDnNCygvmp

On 9 June 2016 at 19:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> The Neon instructions VCVTA, VCVTM, VCVTN, VCVTP, VRINTA, VRINTM,
> VRINTN, VRINTP, VRINTX, and VRINTZ were only introduced with ARMv8,
> so they need a guard to make them UNDEF if the CPU only supports ARMv7.
> (We got this right for all the other new-in-v8 insns, but forgot
> it for these Neon 2-reg-misc ops.)
>
> Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Christophe: I'd appreciate it if you could give this a quick test
> and confirm that it fixes the bug for you.
>

I confirm it does, thanks!


>  target-arm/translate.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 6815bc1..3e71467 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -5311,6 +5311,30 @@ static int neon_2rm_is_float_op(int op)
>              op >= NEON_2RM_VRECPE_F);
>  }
>
> +static bool neon_2rm_is_v8_op(int op)
> +{
> +    /* Return true if this neon 2reg-misc op is ARMv8 and up */
> +    switch (op) {
> +    case NEON_2RM_VRINTN:
> +    case NEON_2RM_VRINTA:
> +    case NEON_2RM_VRINTM:
> +    case NEON_2RM_VRINTP:
> +    case NEON_2RM_VRINTZ:
> +    case NEON_2RM_VRINTX:
> +    case NEON_2RM_VCVTAU:
> +    case NEON_2RM_VCVTAS:
> +    case NEON_2RM_VCVTNU:
> +    case NEON_2RM_VCVTNS:
> +    case NEON_2RM_VCVTPU:
> +    case NEON_2RM_VCVTPS:
> +    case NEON_2RM_VCVTMU:
> +    case NEON_2RM_VCVTMS:
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
>  /* Each entry in this array has bit n set if the insn allows
>   * size value n (otherwise it will UNDEF). Since unallocated
>   * op values will have no bits set they always UNDEF.
> @@ -6798,6 +6822,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>                  if ((neon_2rm_sizes[op] & (1 << size)) == 0) {
>                      return 1;
>                  }
> +                if (neon_2rm_is_v8_op(op) &&
> +                    !arm_dc_feature(s, ARM_FEATURE_V8)) {
> +                    return 1;
> +                }
>                  if ((op != NEON_2RM_VMOVN && op != NEON_2RM_VQMOVN) &&
>                      q && ((rm | rd) & 1)) {
>                      return 1;
> --
> 1.9.1
>
