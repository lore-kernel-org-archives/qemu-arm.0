Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp410324ejq;
        Fri, 5 May 2023 06:16:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55v66lkw6YQHNKna4eekaRoDpfhc5ohG75UMyAE9Qgb+Bj5ObAhG2vzMQbd0+9py3SiYKu
X-Received: by 2002:ac8:5891:0:b0:3f2:a58:7a7a with SMTP id t17-20020ac85891000000b003f20a587a7amr2482314qta.58.1683292566597;
        Fri, 05 May 2023 06:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292566; cv=none;
        d=google.com; s=arc-20160816;
        b=z/W8mXOkK4PyakChZZwFiptYBTBcJEN3nxZ+1sMIGe7HK4vsc7trcFldvDcidzQPO0
         REBvSXwDF4KihbvGArpkMHHPGOhZq70PKFNMg6/+gxqOe8q0my9jMrFto5Tu9s3dBjbJ
         oT6qbhVb55D1H/8Ogcw/9Mk0L9FTrbTyckf7OCgyZZ1FQzn7C6/8Sy+2Q2OqUnbc7fHD
         fHcKmQOnqD8JrcEvhJLrjNy2yFkm8mCmV5cOcoh8UhTjEBcry/3TQWcLbmrBdLCYqCuW
         Lpm8xhDG3Uc0+Hpwzef2ElEjX8ayJ9vdz8397RCLX6r8Hgox7gFP2Jcyxq3uZ624Z/n/
         sPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
        b=D6fp8dAB0biaV8JSSzw/IVsqyzdYsM53E2VRHWRMoqUeijIWHnKdWHxnX0fGSu8x+r
         FmeXmluK5VD9kDqung2a+GA/GibAsQeSe/DLqJUpOhsAnG8QyBCizE1JwFTDwL+ow9Z5
         HCsgc65QRQdRjCSxIGJJOETyXgTYyquVwZGRzvvNIvfcVddRAaHuNFLZS/GQMx3xRPL3
         zBQVypwXvQOndKCDVeRI7N+KbrplWwLhxIqlMR4+LtWKBHoZ/C1KyGm7qqb9mxp/c02N
         aJtY0/dxcPhC8tOkunTyhxE3FSx8zBsJ/Aag/y21JNo7w+KOFFVEim0dDLZUozQm2O6U
         XKTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vKMG8Q3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020ae9ec04000000b0074cae16a805si616547qkg.674.2023.05.05.06.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vKMG8Q3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvHa-0004f5-TI; Fri, 05 May 2023 09:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvHX-0004Ym-Lq
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:15:31 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvHW-0005Pp-0N
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:15:31 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso3356549a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292527; x=1685884527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
 b=vKMG8Q3RdXfgKfEJw1opUK9Oa2+2gv6MxQ/ZVAKbfMW40Z7riFuKFev+D3GH/GjJfp
 NP6n9j3vX16W5w+uxnbuv4G8jxOkuQcXHjZlhrJAtU0e9oCQXkQsuvJOBCnWqwNuHvLh
 F9C5YeRirypXubGtLiB1vz6IMGPVpD89G17HqEReXtg/XmBNAJdQLSGSvbmKFA071wD8
 djiZ3sztKubkardC5LMgUwT+/XdXL8ULkb/hjNMXdmTDCb5nk7IO2U0CrTeGnov8/qT2
 JPCiGcZTavAWFpyNGeBSgaoGudLuVCq1iouvvc69O1r9z8yRvlxItX07S1rfwsa8AC3H
 Nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292527; x=1685884527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
 b=jNPDXBK6yzzQ3Zu1I2SMj5YqsD10ngO0ARcNBkwtQ7JfM/ziJMEJHUrEHqyZUY3YWO
 5ns4WRXy4q9gXS7MlEr29AAY8L+83jLBh+8RBzhB9yn3VXEOvQ4rncsQ9BhaRWm4x+4j
 w1f1ivaei7P7KnoHp+v7MF7HQA53cg5s/RnT4M3awA/3aKZW68DxbqiSPB6dNw4HvkPi
 0wiMhTa/MGtSpJGx8G2AvJsnYWb7Vlv7DTL/B7yznz5p6PcZqZFs9Z3bC1MrWaQrsy68
 79QBa2yFlxZTsVVZGLFLRPwnOiUprCx0+tDWlym/Kdk3pv16Vaoz+aAUk3SnnZXbsP1o
 BTQQ==
X-Gm-Message-State: AC+VfDy45O/cs9MZ4uPyPn4ln8bh80INc31sEt1rj53yKYPevLCaKe6S
 napaBohf9Nrucb1N9OhmqMAXZbyBoy/XMqJLt8hl1w==
X-Received: by 2002:a05:6402:1343:b0:50b:caf9:4b85 with SMTP id
 y3-20020a056402134300b0050bcaf94b85mr1278854edw.18.1683292527550; Fri, 05 May
 2023 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-45-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:15:16 +0100
Message-ID: <CAFEAcA9a8L=FgECxpdk=4N9Uu_p-Ah=s2wa5bLsEebX6oijC+g@mail.gmail.com>
Subject: Re: [PATCH v4 44/57] tcg/aarch64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bv4NGUgL1LoV

On Wed, 3 May 2023 at 08:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 38 +++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
