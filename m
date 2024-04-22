Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4112107ejd;
        Mon, 22 Apr 2024 02:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5ZaIY8bxnbAK7uSAaD+S8tjDr5SPhIFJxVJVRc9Th8nbKuGjhfKc4Z9bMW/qC0kuGUH4wi86LtjXBoP5YpUBTNo2MgnKp
X-Google-Smtp-Source: AGHT+IFu9+plA5kVLwuuKJdznaPOP7+EMe5NPuFHFm1EV9EsLZJBowLx5VhY/tTmRLYPnwYhcw23
X-Received: by 2002:a05:620a:1115:b0:78d:5185:48ca with SMTP id o21-20020a05620a111500b0078d518548camr10546026qkk.46.1713778269594;
        Mon, 22 Apr 2024 02:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713778269; cv=none;
        d=google.com; s=arc-20160816;
        b=UFJa9Pq1/fFUO3y34ZKHskdLSkqcZhZn+WuWAZ9ymQjWgHLx2AtK4Bu0VamuZB3jAo
         mSq2mRE5c0cRrEtRPpxXZZZr2eIzIuuJhEp/BhyNQsBnaBd8QJES/GB6clhPsOO7UXpL
         1SspgN8d1A8sINQA0tf85CSJwmkCAzssAwf6iy8NYmFnJVaG9SwT0F44ooNPSp8RpE3X
         i1Z0eXzUVRrlHHmSStg3psja9aQZZR8l6YdqdSSGWVZoBHvpxq/W2lfwwEaXpx9w/d1g
         neTluGCZfrK8EqP2TEgNru116eJe2vsONRdmHEFfGkAWpM+hUjhygzB9/3qAIv71M2Rz
         l95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=M0lTlovALFtDrD/9nHFFARggRw0Hmes0UOkWRkfP5v0=;
        fh=CvchfUC+IvxUFW3xcPq3ZcbjuPFFDkLY8RpAnUMNDFk=;
        b=yuYfMF0VGwzWTHfG6SNl3Bsdafe+5qfIei4HBVdxpaFbfFMs+M98NRFUK+kxQfLlBt
         1+5K9S+yGG6d10y69Fk9cavYvQfuXBXUPBz3ZPnz2JjsHsnnr2kQHqiHj5h0LozWR5a+
         EcAgkZDgIC86tyEbNwkpm+0DqaUZdeYkPnqRKdj+VGE0dQt0aNezr4e6BWVJizxvYwvz
         yHjO4yUG13z03ckses9aOxXXkHb0zkejA72hRVgUEZjc0rnkwx/+UThrvwzlhn/9FBmH
         Lt4KkEvcyR0GJ28Eu9AIHb2MsGoSzgIRKsJZWhqbl8ijiwQKSDOkKdCiAw9bJvWZxh9t
         OBQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a37e314000000b0078ecf9c3480si9319374qki.555.2024.04.22.02.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 02:31:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryq0h-00029X-8M; Mon, 22 Apr 2024 05:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ryq0e-00029A-Li
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 05:30:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ryq0c-0001OC-2z
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 05:30:48 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VNKgF2TVFz6JBNX;
 Mon, 22 Apr 2024 17:28:25 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id B3DDC140B18;
 Mon, 22 Apr 2024 17:30:38 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 22 Apr
 2024 10:30:38 +0100
Date: Mon, 22 Apr 2024 10:30:37 +0100
To: Ard Biesheuvel <ardb+git@google.com>
CC: <devel@edk2.groups.io>, <quic_llindhol@quicinc.com>, Ard Biesheuvel
 <ardb@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Philippe
 Mathieu-Daud_ <philmd@linaro.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 <qemu-arm@nongnu.org>, <salil.mehta@huawei.com>
Subject: Re: [PATCH] ArmVirtPkg/ArmVirtQemu: always build XIP code with
 strict alignment
Message-ID: <20240422103037.00000a96@Huawei.com>
In-Reply-To: <20240419175013.3983824-1-ardb+git@google.com>
References: <20240419175013.3983824-1-ardb+git@google.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5lUUG5jqgVgr

On Fri, 19 Apr 2024 19:50:13 +0200
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> The optimization that enabled entry with MMU and caches enabled at EL1
> removed the strict alignment requirement for XIP code (roughly, any code
> that might execute with the MMU and caches off, which means SEC and PEI
> phase modules but also *all* BASE libraries), on the basis that QEMU can
> only run guest payloads at EL2 in TCG emulation, which used to ignore
> alignment violations, and execution at EL1 would always occur with the
> MMU enabled.
>=20
> This assumption no longer holds: not only does QEMU now enforce strict
> alignment for memory accesses with device semantics, there are also
> cases where this code might execute at EL2 under virtualization (i.e.,
> under NV2 nested virtualization) where the strict alignment is required
> too.
>=20
> The latter case could be optimized too, by enabling VHE and pretending
> execution is occurring at EL1, which would allow the existing logic for
> entry with the MMU enabled to be reused. However, this would leave
> non-VHE CPUs behind.
>=20
> So in summary, strict alignment needs to be enforced for any code that
> may execute with the MMU off, so drop the override that sets the XIP
> flags to the empty string.
>=20
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daud=EF=BF=BD <philmd@linaro.org>
> Cc: Idan Horowitz <idan.horowitz@gmail.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

This matches what I was testing with locally. Thanks sorting this
out.

Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  ArmVirtPkg/ArmVirtQemu.dsc | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/ArmVirtPkg/ArmVirtQemu.dsc b/ArmVirtPkg/ArmVirtQemu.dsc
> index e48c75b5e99f..f6f78359552d 100644
> --- a/ArmVirtPkg/ArmVirtQemu.dsc
> +++ b/ArmVirtPkg/ArmVirtQemu.dsc
> @@ -124,8 +124,6 @@ [LibraryClasses.common.UEFI_DRIVER]
>  [BuildOptions]
>=20
>  !if $(CAVIUM_ERRATUM_27456) =3D=3D TRUE
>=20
>    GCC:*_*_AARCH64_PP_FLAGS =3D -DCAVIUM_ERRATUM_27456
>=20
> -!else
>=20
> -  GCC:*_*_AARCH64_CC_XIPFLAGS =3D=3D
>=20
>  !endif
>=20
> =20
>=20
>  !include NetworkPkg/NetworkBuildOptions.dsc.inc
>=20
> --
> 2.44.0.769.g3c40516874-goog
>=20

