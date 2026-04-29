Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D139EFF887E
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 22:45:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIDeG-0004jD-9Q; Wed, 29 Apr 2026 18:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wIDeA-0004iO-GI
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 18:44:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wIDe9-0003Y2-2U
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 18:44:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-676d8582a13so579520a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 15:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777502683; cv=none;
 d=google.com; s=arc-20240605;
 b=cRuXC3722/LFbg44KsscN8jW+3keU1fIHoRRKNlcL1JiqFfovKAfsG8HEGCVz4SIyW
 whrJB8p7aInmzMOARacm/UCr8FGMQKDeBJkCqCV/ELlVU2RRWbwOiSzmkvxSbFUCdOzc
 b9/KNuQFjkNnIj8aTtoYzp/I8/QQjHEfyEpxsiPHRv1ELMYZ3bG5r2eVDd14xagmdeKp
 aZ7MhAtfe1Fk7zfT8jcRTvtA5I5ScepDjFzrgCz4OKns9KH90zE1/Flnfe6pqSqdQIK1
 9r3L2GGnZopuYuhFgujmM/wcD1LNNY73q0PG5WNhBJJBThTc3JROkBgt5lMeWpJBGTRm
 jKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RiiQ7SkseF/vyn7oi0284dmw9O+9SWKp9s3A/x6rPaY=;
 fh=lrWyeV1BqFSpff2/V3UDnV2Q4QRq3seApEGYhyjUAFo=;
 b=LA6IluV4tJoJE2BXdEuCKKmQ5ZiZPi0mxfkY7LVicWj1G0Wc/RKmpXkC2SXeeC90ON
 pkg+zbzVtOtHH2O3vEM68eX/PBSxqpjuQtG5yXv4hbaPCncf302MDplis6lOeTDUUMI+
 vVTlCOjm+9Zy3iD8DBrK3XfBG7CxXpO/S7MPa2pW4LlN+L3zW4b3YDa89haHCK1fjKTF
 8dVQT5Qpcrh0/YUxIi4v4hKBDc2HO0eTspaZb96X8bvrlno4a1gOcLWzJ7iZWH4hb4fj
 8ipEB6jqalX00LXlYnWe01Q9rHAlHPD5YGKZWMWU4RWzMG69J9cSH8GIh6Hd468ypGfZ
 LRKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777502683; x=1778107483; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RiiQ7SkseF/vyn7oi0284dmw9O+9SWKp9s3A/x6rPaY=;
 b=eTQC7xoQ20OdNHenvqBk92fi0AIz3g+Hrjoi9vysitMAyo39Kca+iTuSrliObbEGcA
 jGJ1TBwjDRt6TP6Y//P+IlToC9CUi793DQ1SO3S4BwAvKUrqwm6Ypb2b8+WCREBUPZ78
 QSiNRTusxddJb//kk4BF8pjcrtwndBvkL+/DCjR1UONNvmVdMHq07lACIIgHAxyb3zzA
 OKWUfrGfRnu8TK3oPujDIEDmVUyfqJxgX3l+aRMCNFNU6yX3wqY/nwf1mztwzSyXVviI
 tRy9/umgA4TulEeCYb0S5oH6/MXFtYpVgoEdZdxBVFgL8N48o/2tGpp01oYfRo5cL1K0
 z5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777502683; x=1778107483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RiiQ7SkseF/vyn7oi0284dmw9O+9SWKp9s3A/x6rPaY=;
 b=rIfRpqpd5a0nxcxz+6MS0yZ+xcA58z0ClthsjrwlfADPKNTwrnuMxsOS1QtkJbPSK3
 O0EXDjVeUmyB6uvSXYqpa3tMQzSeezeSrr8t4mItNYE5qR1vsqWdXF4AIKo7Am4RES6V
 FbU1euTac9LfDYuMlH+oaoSdKTc2OGIDZzEN6+ttGITzz9T08zvHEQM9KBGna+FOTXaR
 1BOVIEMJc8Deui/AQvnxv0RofsgU9/Y6yzhTA25meXSU7vYkLJvspf+BvaeCzupAmh2/
 VJX5wxE1GmOF/CwieMSRAFZcN6yXDLWh3DuhfMFZmnpSSDne69WiKOyyEkmQ2MHRbxC/
 4AYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+Y04fO/hOBiq0IBjFQQinOWbqUOqohUSYa6CMPL84/DN6vi1V/sBuwhp9HL3+4QMbg2qsFDyQ2w==@nongnu.org
X-Gm-Message-State: AOJu0YzzsbnHhNNXvf0/L4K1Ox+2yeYH8ttTAXEf8wkexCTkKnNjkdnP
 tczyJo0Ye96vmL/SHi8M5XRQe3m2Og0lL/ELwp2WIOu+qgxHy5IkrbH3MP+1IkXybNZX7WAejYm
 6evYYwHlzjqPykjCGDf0tILck40XgxMc=
X-Gm-Gg: AeBDieuIPdGn6qJP71nk5KATQI8fqcaH7AGphFVPPBkjMHhn35z0q9jvpDtGp4Jyymx
 MdhtJ28ZVUoXtH2KshegfN+Rjkl/e0+nMa0jnr0/qSMIs956OJ+xzJ1l7ghnqAhfebpJUY2QBBg
 z4RdkMQC358wcLP1vnlpDCU8O+aFeJfFTXVVa3I/8aZqzPPq6YjliTtMh9tWZUrj+tgiPd72Lon
 4PSe0DtP6nYOA0STidmJ0Ang5GsuWI25tWlTg2tmPRxjCXgo17Q5BsDcyu74JDmmwuUDvyLcWWM
 QAU8A3GpduQr/k9jolJXoYUFX89+i5zGB/ozT+zWUf/V/rbp
X-Received: by 2002:a17:907:788:b0:b9c:69df:4d8e with SMTP id
 a640c23a62f3a-bbac67c3a09mr35728566b.25.1777502683062; Wed, 29 Apr 2026
 15:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
 <20260428093339.2087081-2-peter.maydell@linaro.org>
In-Reply-To: <20260428093339.2087081-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Apr 2026 08:44:16 +1000
X-Gm-Features: AVHnY4JMvgeLa4UX5XYU4FPxq-BQ036Bb9DCcS718WyPBYE-52R61o8evfYiE2g
Message-ID: <CAKmqyKMhiaBu7TwAYZ-NgZ7TfFngs40NrimELwNqDbOw173ZNQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/riscv: iommu-trap: remove .impl.unaligned = true
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Tue, Apr 28, 2026 at 7:35=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> From: CJ Chen <cjchen@igel.co.jp>
>
> The riscv_iommu_trap_ops MemoryRegionOps specifies that
> unaligned accesses are not valid for this device but that
> it does implement them. This doesn't make much sense, and
> we want to add an assertion that registered MRs don't specify
> this invalid combination of settings.
>
> Drop .impl.unaligned =3D true, with no behaviour change.
>
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> [PMM: reworded commit message]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c3c9ed6469..f0de264a10 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2433,7 +2433,6 @@ static const MemoryRegionOps riscv_iommu_trap_ops =
=3D {
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 8,
> -        .unaligned =3D true,
>      },
>      .valid =3D {
>          .min_access_size =3D 4,
> --
> 2.43.0
>
>

