Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp489605lfm;
        Fri, 10 Jul 2020 02:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5Kp1wFhftGVvZEEPqgLX0/S8SWLZaU9rYt/Tgqi2IRv/9C1Xnv0rhfIGQFENFIvGUuxS8
X-Received: by 2002:a25:5b57:: with SMTP id p84mr65243662ybb.37.1594372162311;
        Fri, 10 Jul 2020 02:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594372162; cv=none;
        d=google.com; s=arc-20160816;
        b=wy9wPkb61yTeLxO0Ko1bUgEc3Y2oFkyEUKdmL6xMDar2AMITol2QHj4o8SvdWpiR/X
         UUsYskc2Kwa6XR7cA07QG6vQ4aFG7DXvnZ5zQ13tVt89loepTu22z3Ti/YhOJAMO12ub
         Q07TLIL5Jw03U/OvvTSguwzehl1xab1i8ya1Sk7ssw10Kes1HWYg6faj0v+hB9B6FF5s
         /+n6s5J+GiE1LN//OrCw28Ofn84gseuajCqpOZu5Qw4U9WYEMaynKqhgCcnRzJzfFrvl
         2uUPelqakre2mTZSPuErKFP5cW4FqyPkkDC5ZICpbMI0qoKTYLkHKWkHwZDaeLpL9x3d
         jhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFlTUurTb7NC3EwCFkAS7OGriVpClScNo0C60XFKlEM=;
        b=GNygrnVj6ZR+suU44bMVtBLUtySxaKqUYdhLEnQY7Qm0wz+PK3hh/IL+AMafl/kjG0
         5Cede5wwHaZxO5Ir74oP8wheNszhjojBFEfUfveiB+7E8wrrehtYqcjS0wVsAM9eY5dH
         +U8WU5oN9viO/Qf/V4FQ1dUlztdRk416kT+C596i/GAatR913A1Nliz69jFgygQJdJYe
         HhmdDnwRo5X3anj71ygoY7jxRL7OvT2ogLhu/3qplNSIBPkrIaWSDjOzQwjvLvsMzjaH
         3MllZcNEyTZUtrjKj3/SGJImfDwimwfo/4RwdSMDt6JFPLEE2CXJe39hSZcfg6Xgpt7h
         rcAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OIyymd/Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si5905082ybc.403.2020.07.10.02.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OIyymd/Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtp21-0002Id-M0
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtp1q-0002I0-Fq
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:09:10 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtp1o-0001yB-UM
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:09:10 -0400
Received: by mail-ot1-x343.google.com with SMTP id 95so3695521otw.10
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFlTUurTb7NC3EwCFkAS7OGriVpClScNo0C60XFKlEM=;
 b=OIyymd/Q4ENsB3X2C3veJSHK2avBcFATGF+65QXQWoSMr06Ncxy8usi171nRJc2XXS
 jhl/r3FNKdARYK+9H6j4KUJHGx90hyz9bQXJioRk4jUNbjD7gLLw78epzCgsfFUSw+cA
 +0f4L5OfVpHIFNSwHhbYW1QvQ9/OqIjCGE6lztr2REtazdU1wiWycnAmw/qvD6UGR2VK
 YwNAii79NVJsYeqWWownJ19JEk1AtXPIA+M2yaRX1pO6k/jym1HvaKkRs9M5JmYLevZ8
 Mli8iUE0KYLCkkWJLwhAA4PZs/RQfEO25AvwoGQAwPDMBMY+vsUqHiUUf3ooQXrJc+gR
 gXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFlTUurTb7NC3EwCFkAS7OGriVpClScNo0C60XFKlEM=;
 b=i0TRiQDoYzkrt8L6yScM2YdNa+ILuZ0iUFt/BP17DYyk0Iv0hmi12PqE3Aj6VBQU/v
 V6n6eNXFeccYImkMWetkiUZqbXOZZ0P5+qcsi1gudtR+gqZ/e4G95wqdhSKrNfxMKWXN
 9SvrQdsdhGA1qgq+SdRNKDVnwTH9Yojg7Olqqa1OZ44YiBD2Id1LP+3ZogVt6ch8YtkR
 FS9dbd6Isemnf/GeyHp2M5EgemvNch8XD4vT2bY+rL6EzKlBJwv2VRsjmZs1rQVinTYF
 EdvgEeLSQc9x6n1Qv90XNxc8YD933/fOZByMoBMlqA1WaZeHnVx0dpDSrnhhirAqbpFN
 kc7Q==
X-Gm-Message-State: AOAM5317+TG/tOQgHQr3FxpLMmXgL4ewoPOUcr/Td/z4v2V1hTpPSzg+
 4lzMQkp3Y2hlzgG7vwCBHvZ2CbJm42zpsrj56gI0dA==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr50564976oto.135.1594372147592; 
 Fri, 10 Jul 2020 02:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-9-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-9-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:08:56 +0100
Message-ID: <CAFEAcA-2MyyVmfTPKUH7NBXEkMokaNGnbhK+v9MB2kL1UP+tpw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] hw/arm/smmuv3: Fix IIDR offset
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ihzL38TAoMt2

On Wed, 8 Jul 2020 at 15:20, Eric Auger <eric.auger@redhat.com> wrote:
>
> The SMMU IIDR register is at 0x018 offset.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 10a83cb9887 ("hw/arm/smmuv3: Skeleton")
> ---
>  hw/arm/smmuv3-internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 5babf72f7d..ef093eaff5 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -63,7 +63,7 @@ REG32(IDR5,                0x14)
>
>  #define SMMU_IDR5_OAS 4
>
> -REG32(IIDR,                0x1c)
> +REG32(IIDR,                0x18)
>  REG32(CR0,                 0x20)
>      FIELD(CR0, SMMU_ENABLE,   0, 1)
>      FIELD(CR0, EVENTQEN,      2, 1)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
