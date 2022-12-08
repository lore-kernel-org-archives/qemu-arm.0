Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp474651ejb;
        Thu, 8 Dec 2022 08:28:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5yIDiAwNLaa/npYxH/YhLrOZQs7DiSoXrq018uT0ZF6hv9xxEC5a1SYgrUzQHUoT9CraFf
X-Received: by 2002:a05:622a:580d:b0:3a5:fba4:96e6 with SMTP id fg13-20020a05622a580d00b003a5fba496e6mr2406793qtb.1.1670516912759;
        Thu, 08 Dec 2022 08:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670516912; cv=none;
        d=google.com; s=arc-20160816;
        b=JHj8u8xRV13NhURYOM1Lh1PyAcnEk/ibxmkvlHmZgYqRCbw96C+2xWPRNV3A+DrCUq
         fBDiMlIEMEObEhdYC2UEndV8TRS97YeDTxzuuisrAi8f9WgI+mw98IBM1ftkTRf0/ABw
         1JCqpveGq/1CrvY8DEa2/2HiVLYGKhbcTBlZA3wekrlH5whqfXpZynWOEaZl0mzfuDQy
         jpxMYSe9LvbBxGKbCebpHnLMGhBm20eXEWiTTJESGiHWG+lsZ5TcATbwzkH3e5wjA927
         zwk13ki81HKDWpcjeMjpHfadFeP3oOWk6Y0MHd6yHm0XNHw0q2iWFbFhIScITDMgqgag
         sKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qF3Tl1BtJngOjOEyRPlipms8qVGqIMWbgIg6xXE1r1M=;
        b=h52zLb5g7iQga2ADMOCRQE7vR0aqU/6+mk/Ul8X9mmZ6qeJofLK0eNpOQjP+UI1Ssc
         yd+HHULnzBBlE/5js2q+DO6sC1sZrYyGuBRRPXUdmOuEvcKguae8fgddFfORfZe0tIS9
         nE+I3De5YsSc0F0jy1alp+EO38OHpxzv00ekdo8z0BA1h/QyYYS7KKRyN5doK58m3AEV
         VrRWdjJpL5nUXj9SYElypNq6JFfp9Z2pbJ3+Kb/dWoDKNVyQUHhtq2YQZjzT1wdEnp2Z
         wkfIKucGkedPtgecmYurHHMeyyiv8h34DLv9i+Q0PdoOAg0LJ+jxZ5A8IpO6V954RaLF
         wzgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncotLYTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a05620a40c900b006fa43a7f5b3si12662952qko.626.2022.12.08.08.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Dec 2022 08:28:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncotLYTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3Jku-0002xh-3d; Thu, 08 Dec 2022 11:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3Jks-0002xN-D9
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 11:28:15 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3Jko-0007W9-QB
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 11:28:14 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so5170161pje.5
 for <qemu-arm@nongnu.org>; Thu, 08 Dec 2022 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qF3Tl1BtJngOjOEyRPlipms8qVGqIMWbgIg6xXE1r1M=;
 b=ncotLYTCwlzYKsuDekW5yq7jwCNW65b2t9njQDo+B8deu7kObBJMW3yCxcuh890K/0
 j/ZYTKy5tEK9ApZk3p+u9cY1OO9zuZ95r8skUbhgys7iHoH463Z9qp7F1A1XMOvtQktw
 3ijHJRGZESanhMfmWWYUSaW0hWrWNKus6mc5jx6unJdvvdwNnJz4WLA7EFIW4zUvxfay
 +U4WJdA/m2QhaLVzYod1eGTtJTDcziZ+Gh8+bw74kJsGnJLrppfT+RrOIGbG2z/yp0LA
 DI1ePKmuD+gHKQfZbRLvuG3Sco3gR+1Z9bKIPaVdeL1UVWeKjA/zsxmokJjmPE0YoILD
 ziyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qF3Tl1BtJngOjOEyRPlipms8qVGqIMWbgIg6xXE1r1M=;
 b=Ys2bbJBb5rtzVYrcxGqzBr3UFp3Bu4eyAGwr5pCUpfs2g0JFX/d0p6PDXLG03H0IW7
 wfur24qws1PdUYSSkjJz/fyOdjbk+t2AkLqgRiApyPFY8d/hZXlLKZto2zqRXgbE9reZ
 dU2Qi9kwQxyO77ym0FrG88CkTJUeRJK4nmA/m05QNMm8TwfkOj0ftbdXBQmvc5QPUl8L
 0Lv+0WzpGoCYNS2QGcChAcshujh5NyEd8dIrIOuAbiwL/cYv4kc0z7tzecfdHmqAhwyj
 H4GZZe9ObVDbBjdl3ZylNrinPs1ba2UW+r9TzuxqOi+SPDgxjexJ5ruBGoeY4zKabT3Y
 aqlQ==
X-Gm-Message-State: ANoB5plw+kPeniyfad3AcOh/UrZvGnCYZouU6g18pGP4WpqTm+QUJj8z
 uyzgm8bJtzM/5nyJksRZ7L4zm9DHRTrzDPsERBvmhg==
X-Received: by 2002:a17:90a:ac0b:b0:219:9874:c7d3 with SMTP id
 o11-20020a17090aac0b00b002199874c7d3mr27683065pjq.221.1670516889025; Thu, 08
 Dec 2022 08:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20221208161152.28976-1-philmd@linaro.org>
In-Reply-To: <20221208161152.28976-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Dec 2022 16:27:57 +0000
Message-ID: <CAFEAcA8jC_tXvN6WwcO1YHmBw_L5iDiCa8HUMLAo3H_vmbieRQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0] hw: Avoid using inlined functions with
 external linkage
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Babu Moger <babu.moger@amd.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QlXSjr0R6P/P

On Thu, 8 Dec 2022 at 16:11, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
> and building with -Wall we get:
>
>   hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove=
_by_asid_iova' is used in an inline function with external linkage [-Wstati=
c-in-inline]
>   hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function =
'smmu_iotlb_inv_iova' internal linkage
>     void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>     ^
>     static
>
> None of our code base require / use inlined functions with external
> linkage. Some places use internal inlining in the hot path. These
> two functions are certainly not in any hot path and don't justify
> any inlining.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC: Any better justification?

I don't really understand what the warning is trying to warn
about, and googling didn't enlighten me. Does anybody understand it?

In any case, it does seem weird to define a function inline and
also have it be defined in a C file rather than as a 'static inline'
in a header file, so these are likely oversights rather than
intentional.

> ---
>  hw/arm/smmu-common.c | 10 +++++-----
>  hw/i386/x86.c        |  3 +--
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e09b9c13b7..298e021cd3 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -116,7 +116,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *c=
fg, SMMUTLBEntry *new)
>      g_hash_table_insert(bs->iotlb, key, new);
>  }
>
> -inline void smmu_iotlb_inv_all(SMMUState *s)
> +void smmu_iotlb_inv_all(SMMUState *s)
>  {
>      trace_smmu_iotlb_inv_all();
>      g_hash_table_remove_all(s->iotlb);
> @@ -146,7 +146,7 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointe=
r key, gpointer value,
>             ((entry->iova & ~info->mask) =3D=3D info->iova);
>  }
>
> -inline void
> +void
>  smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                      uint8_t tg, uint64_t num_pages, uint8_t ttl)

While we're changing this, can we put the "void" on the same line as
the rest of the function prototype, to match the style of these other
functions ?

>  {
> @@ -174,7 +174,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_=
t iova,
>                                  &info);
>  }
>
> -inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asi=
d);
> @@ -374,7 +374,7 @@ error:
>   *
>   * return 0 on success
>   */
> -inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags=
 perm,
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>                      SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)

This second line now needs re-indenting.

>  {
>      if (!cfg->aa64) {
> @@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *=
n)
>  }
>
>  /* Unmap all notifiers attached to @mr */
> -inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
> +void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
>  {
>      IOMMUNotifier *n;

> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 78cc131926..9ac1680180 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -64,8 +64,7 @@
>  /* Physical Address of PVH entry point read from kernel ELF NOTE */
>  static size_t pvh_start_addr;
>
> -inline void init_topo_info(X86CPUTopoInfo *topo_info,
> -                           const X86MachineState *x86ms)
> +void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x8=
6ms)
>  {
>      MachineState *ms =3D MACHINE(x86ms);

This function is not used anywhere outside this file, so we
can delete the prototype from include/hw/i386/x86.h and
make the function "static void".

With those changes,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
