Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67325606A324
	for <qemu-arm@archiver.kernel.org>; Sun,  1 Nov 2026 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsN1hthj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNM3G-00037m-HH; Sat, 31 Oct 2026 23:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNM3E-00035t-5m
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 23:16:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNM3A-0000K4-Ga
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 23:16:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6a642495d81so2936381a12.2
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 20:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793502957; cv=none;
 d=google.com; s=arc-20260327;
 b=cJ3F94TWUFrv8jcZS/GJMmaDyCWw8KoVMdzkY4Uf9cWpLTR/Cm/KB3VKieYyluYFED
 Py5OLsMqRmbHkNA1hAJwhk4fWnSu8fSgiOWplaG/Ps5peA7o7w+zTwulvB7FM9DxKheJ
 pFS2Y3CkFByJTRyS+JSTIFgpYOgBtqdsrMgib7KcwP1IRJNDdzrHNY3zPhGR1xwrAtdM
 3GGDDG8dFh2Zfd1e3Fza8/S6V9xULndm9x07UQ1C9Z3h1PGg6QqgdUvhopiTlsy/s/iq
 ncAbAyNpbUQphRW0TQN9gYhC/CUId/UYmB3l4G28JhJDlfRlIk0DhrIowaEhiij6Ou5r
 inJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=r9RUt2IXHKg06Mu1ZGYuVCpKJ9eEOlApJVqg4Ts1TkM=;
 fh=TwoyBpi8oCFcINRrIoWzrZl/nedTXaUs4kYvmgSC6sw=;
 b=dbFZ8tt7/PRsmnE/T8l1vj8DgItPh9obWf8ROtMkATJiZgMcYs9Upk7rmdzkXdB8ZP
 lurSSa9qUtcrnj06zPJF3W4vX53OWxjJ4qK+wIIm0SP5P/uMgTUuyvUZ+4b4pOEkqHBk
 Jhrd1a1XPrYRFCaSWbh3RCUJb4/zCQz2u010jXI59zSkDr0fAWtaxJ6YBSsLqVmDE1Ay
 MFsCjI9dhnhh/npYCTllBWI2CgrO0UNmhvuVGVb4QKXunuB0ksy52nM7vi6uSQAjv8uy
 B8RLtbFFRQgSI+lFrjDAbUIE500NA+kKr3ZyyF2N980w5mrJjo1ava78xHitZpI9JLj4
 vxfQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793502957; x=1794107757; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=r9RUt2IXHKg06Mu1ZGYuVCpKJ9eEOlApJVqg4Ts1TkM=;
 b=IsN1hthjfBwZUvnVied+YVhcaNfQHy7BWQcBqtJkBv3U5T5iSTLhJUiHe24ZOBQvmz
 NZXyj8j9zXwEO63oizlYojmBMxknCe6OJzZgPindWkzaGQ4qGFs4Eda3sTCIWJEAAvKP
 tDcyZ3p5qehN1+hW/6pEtME3dfW0zvdCCLR3Rn49VLjojqO4g7IRIDvpJGQnT0OnI7pf
 26vKRubk2jKFBbDRULEknzKy2QdX+vqf2na2UndZLnB684ejl5tLAI8sJ2AkVmxBkVul
 izTZv2mJ2JaoDRsBLaRpBVqgA3tcJaIyvg4k52T9305ZxTzM7SDhnykoJbY2BiYGakx6
 4y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793502957; x=1794107757;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=r9RUt2IXHKg06Mu1ZGYuVCpKJ9eEOlApJVqg4Ts1TkM=;
 b=EU7nYtPvhEb3Z5WL1sp8H/Bj92nFjG8aQDsbZvlAA/Yxrm1lCNTviRpcmvqvUwCkGT
 x//DohVZHtfuIV6ukQZNsr/V7bCVctC7vNYGfpXYkhNjeos6s2/2CEkSdWWsprOEguNU
 RcmRn+TUEoEFNsB+LybUJvJt70kGZyZDpXmWWEUcOWfcvgb7kGXGujLQvjPYkTB+0JXc
 WOIlJM0fl/GXfig9CcOGZWLUDXyAWRa4V9DiQDr09omMjmnAC6nKBfy4hCG+bxb6VEGs
 hi6g1mi6eCfcM/TEfgnPuVViA3UR/oV9qnuS2daHfIfJMJCq2JOwJaHKh2eEvBR3MSDD
 0/AQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBylHQ+Xl3KdOsg0v5PtZAbxUHlGeplASFTa1Bdf/gMDr+Aw8zaoKL5aaQUW9TWlR/WLQZEfqHb7Ig==@nongnu.org
X-Gm-Message-State: AFq9FYLNFZSUz4B+89BIFd/1jPDqs32bWZfhD4wZAE7lEWzKVGBnMa9B
 XdkpLhbqZUbH/OBm8v3Txe/wBEsrl38OwtiGHT+DMSyzc0O7R8/oxUJ99VOQSQX0Z2qKxOTT5RF
 l/y6WFAQw793JPkqQRQhq+oX1jTTAu66tSQpl3E0=
X-Gm-Gg: AYBFou2Fg/1xne5zjg+rVp1U4SHwM/uaQsU40H6wSGjujBaQy4w6Y9H+62gh+ZZ8Oh+
 FsNnBiGwjHrzj5qfPjcZey75UZ69XYKPLj8strjni9CDJ8I8Bs2Wdwx65aQv+IX7NAhRlKF8EgD
 c3h/3+7Xkh9OYbypBYB4gnuLdVrMscUiGixDbpPmbweCfW0ztTv4aetls1IRgC16BRkFvxUSkPE
 04yQ2aqYmu5+6dH+afBihTubE6YDPNapgm0f2elxDbmeIP8OLMLDjC0VHxH/0mADN02IxjgAN7d
 RubTuRfurzeMypYueTmGcXawR2LFObuih9jqkVH9nBw0dAemKrvAiRc7TRWavzQgBAqdS7rWHN7
 MhrNRxUgcVW7m2mT6KAUHNljbxp5XWbtFi25M
X-Received: by 2002:a05:6402:a6c1:20b0:6b4:be3f:51b3 with SMTP id
 4fb4d7f45d1cf-6b4d4686eebmr3117352a12.12.1793502956445; Sat, 31 Oct 2026
 20:15:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031164009.2048-1-luoyonggang@gmail.com>
 <20261031164009.2048-5-luoyonggang@gmail.com>
In-Reply-To: <20261031164009.2048-5-luoyonggang@gmail.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 1 Nov 2026 11:15:44 +0800
X-Gm-Features: AclHuK8CM7KX5nUvQA8vJ9Qk2qxRZGPQLFv1TDJEYuTjHitxrrjGnHE_UY4e4fU
Message-ID: <CAE2XoE8W+UXtfUi9VqfN9k9oA6KaQP1RTk4L9Mr0NnJNHiJjZA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] hw/xtensa: expand DEFINE_MACHINE in virt.c
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eric Farman <farman@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 12:40=E2=80=AFAM Yonggang Luo <luoyonggang@gmail.com=
> wrote:
>
> Expand DEFINE_MACHINE() in hw/xtensa/virt.c to xtensa_virt_machine_typein=
fo
> and xtensa_virt_machine_register_types() calling type_register_static().
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/xtensa/virt.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
> index 271f06e0953..8c8fdad72f0 100644
> --- a/hw/xtensa/virt.c
> +++ b/hw/xtensa/virt.c
> @@ -115,8 +115,10 @@ static void xtensa_virt_init(MachineState *machine)
>      xtensa_sim_load_kernel(cpu, machine);
>  }
>
> -static void xtensa_virt_machine_init(MachineClass *mc)
> +static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *=
data)
>  {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>      mc->desc =3D "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
>      mc->init =3D xtensa_virt_init;
>      mc->max_cpus =3D 32;
> @@ -124,4 +126,16 @@ static void xtensa_virt_machine_init(MachineClass *m=
c)
>      mc->default_nic =3D "virtio-net-pci";
>  }
>
> -DEFINE_MACHINE("virt", xtensa_virt_machine_init)
> +static const TypeInfo xtensa_virt_machine_typeinfo =3D {
> +    .name       =3D MACHINE_TYPE_NAME("virt"),
> +    .parent     =3D TYPE_MACHINE,
> +    .class_init =3D xtensa_virt_machine_class_init,
> +    .instance_size =3D sizeof(MachineState),
> +};

In case I forgot,     .instance_size =3D sizeof(MachineState), should be re=
moved
from this, it's redundant. And maybe for less boilerplate, we should
use DEFINE_TYPES
instead.


> +
> +static void xtensa_virt_machine_register_types(void)
> +{
> +    type_register_static(&xtensa_virt_machine_typeinfo);
> +}
> +
> +type_init(xtensa_virt_machine_register_types)
> --
> 2.55.0.windows.3
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

