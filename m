Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6140944wrt;
        Tue, 16 Oct 2018 09:16:14 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63QbV/I75X18fsEyN3HHzItdPwvnZedO03pjAqCij1UunT4fmwa/F153zLq1pq9yc80XERW
X-Received: by 2002:ac8:6616:: with SMTP id c22-v6mr20304736qtp.199.1539706573959;
        Tue, 16 Oct 2018 09:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539706573; cv=none;
        d=google.com; s=arc-20160816;
        b=kGmyK6zgHoAkpyCJy3Hp9BXCiW/3Lg1NH4J5LYskxxsxWCIFld8OV5AnuGyq3idcxO
         4dyG4vy7VJ5EbtTZWHL42a5pflGFoiLOn8aUHa3UBO2iwupNcHdyaxhZVFMlWWHXtstH
         bc0TI79S4vpmjWOCoVa56nueeSdnCh94x9amxeBiU52FLojikp25EFiTsrXZH+an+ZDw
         VopGkj03KdgrJX2Dkc2nPa3WdxZ/fAj60gMX7iZdDhzTeNAtq0xSO0Bn4rF3zvFpUUBn
         vmrgnata2G6REJFAdvaKWCadlYhmmEBFMbUyaDXuFWkQoyITJYUYIyjTUdMEZY1F2mB7
         4jZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=OBagbrUWWQD0uDJlHlv1rJGy1fb6ns7g51dsVcM3XlU=;
        b=Gn/TvbJj/E8jYvcgiIUllLs+qLiHFKOm2cjdXRi+j3BfcRbzH/nk3jsTZnp2O3hJE9
         c1Ya03WPtgD08ZttGWOJ1irT95468XmeQWIpD+h1F8Xe/JDrjkxTRO8HM78T/FWxECTq
         iKzgFL0dopbnxvHJyfUNDs/ol8c4C8uGYDtKwn+Lg9mpiDHSC+VwnHPEuVvSF+Tz4R9m
         RLzpH1wR4zI1D1G/odoKPYFXOlFEE+eP3qLSed6IqG/SVuzlFBiDLK+01xp4M8xfNUVh
         NcRFr+0rdRpSXvTs/VIFi1j2q/Jgi/q8zVtY7vw4YzJqOanyt0oV/cGfpcH2R5W3Pzna
         dVtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="H9rW/HUS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l24-v6si1261194qtp.118.2018.10.16.09.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 09:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="H9rW/HUS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCS0z-0001Sb-Ez
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 12:16:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCS0n-0001Rv-Uk
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 12:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCS0m-0007cU-V4
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 12:16:01 -0400
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143]:52629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCS0l-0007WB-4x
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 12:16:00 -0400
Received: by mail-it1-x143.google.com with SMTP id 134-v6so33847674itz.2
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OBagbrUWWQD0uDJlHlv1rJGy1fb6ns7g51dsVcM3XlU=;
	b=H9rW/HUSKu+nC7BLeKdA7XBgiVpTkVMRZsHO3QYwkaB+/IZMAWF0DOlmTLSYRo44EX
	c3hp7a63cerwTQ0xsTdPMEl1xSymf2bImwhSZVmTLb1BY72NhkDI3g96e5cGrr05IOnQ
	2df6v8f74GowwI081j3XztRnHihjd3rNkNrGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OBagbrUWWQD0uDJlHlv1rJGy1fb6ns7g51dsVcM3XlU=;
	b=U1UfjQsDtNXULKKYV0VI8EWvE/KO+nGf6AYZv1AO9Y/KJ3QFV70S17oRiSUj7a0Lr3
	x7abeM7SCcdxYxR7p/R7mU0NuECwv44PI+Bd7/fjHb41dYCUbOm9amX/C2R4yLS3FDqU
	rmV1GxEb0jiAydRrgpRcYWJHLc2gXoekWqPrCe6kZ48RAEgMzhpYopAlP5D5rjy57SmJ
	NJUSmcPoclxXaHPBtYoN8uXFwcYIvMwvZkl2weM47b5KznTnoXfqPCNPrQsuWoJYbCQn
	PvH7jXGp/eTmk37g9h3y4hW42r7iIZiozbRN7Nq2KkJjAo96jHjiAaTsibnctgUezYma
	ZCLQ==
X-Gm-Message-State: ABuFfoiRGTIi4UcAQKl8Y/TAkOUARH/hyIKNhVPhrQ9HNpZtyOiaTjP2
	cX2AqXk89dg4OGMObWxcN5dQ87AI21ZFoRwjx4AYLA==
X-Received: by 2002:a02:88f7:: with SMTP id
	b52-v6mr16511068jak.25.1539706557070; 
	Tue, 16 Oct 2018 09:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:983d:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 09:15:36
	-0700 (PDT)
In-Reply-To: <20181011021931.4249-3-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
	<20181011021931.4249-3-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 17:15:36 +0100
Message-ID: <CAFEAcA_c8YiyTtb1pE_ToSF_r6DGjCbjbDHF+6OQeCccbwpc=A@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::143
Subject: Re: [Qemu-arm] [PATCH v2 02/12] net: cadence_gem: Announce
 availability of priority queues
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BvkHj39cKFQx

On 11 October 2018 at 03:19, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Announce the availability of the various priority queues.
> This fixes an issue where guest kernels would miss to
> configure secondary queues due to inproper feature bits.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index e560b7a142..901c173970 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1213,6 +1213,7 @@ static void gem_reset(DeviceState *d)
>      int i;
>      CadenceGEMState *s = CADENCE_GEM(d);
>      const uint8_t *a;
> +    uint32_t queues_mask;
>
>      DB_PRINT("\n");
>
> @@ -1229,7 +1230,10 @@ static void gem_reset(DeviceState *d)
>      s->regs[GEM_DESCONF] = 0x02500111;
>      s->regs[GEM_DESCONF2] = 0x2ab13fff;
>      s->regs[GEM_DESCONF5] = 0x002f2045;
> -    s->regs[GEM_DESCONF6] = 0x00000200;
> +    s->regs[GEM_DESCONF6] = 0x0;
> +
> +    queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
> +    s->regs[GEM_DESCONF6] |= queues_mask;

This causes the clang runtime sanitizer to complain:
  /aarch64/qom/xilinx-zynq-a9:
/home/petmay01/linaro/qemu-for-merges/hw/net/cadence_gem.c:1306:19:
runtime error: shift exponent 64 is too large for 64-bit type
'unsigned long long'

because s->num_priority_queues is 1, and so you've
asked for a zero-width mask, which MAKE_64BIT_MASK
doesn't permit. What was the intention of the code here?
I don't think any value of num_priority_queues can
produce the old 0x200 value for this ID register.

I'm going to drop this patch and "net: cadence_gem:
Announce 64bit addressing support" (which depends
on this one) from my pullreq.

thanks
-- PMM
