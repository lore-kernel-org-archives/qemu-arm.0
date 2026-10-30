Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1A60A260B
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 05:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MnGTdp/M
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMf8o-0007fL-QH; Fri, 30 Oct 2026 01:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1xMf8n-0007ev-5l
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 01:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1xMf8l-0003N6-Jb
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 01:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793338019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRsNbAHpudxEenLMORDVEFfulu4vxVjp8oQNw/o1bgI=;
 b=MnGTdp/MMB2nVzA1vUEKUzOuCbQGzTNCmzaINKd5WuvxEsnN/2qXiMGhHSUmfMPCg7OR8q
 fslmBKujaq1VfNNFkjifdow0b8A7r6nzxZmZjYFVbcuC+1Idf+SX2qVXgvKJ7qljb9cP9B
 KnshWDbs3drKqKyrsSp5/Z+YEYPhYB4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-nrDBdJ7GMp6vHiP1wr_d3g-1; Fri, 30 Oct 2026 01:26:57 -0400
X-MC-Unique: nrDBdJ7GMp6vHiP1wr_d3g-1
X-Mimecast-MFC-AGG-ID: nrDBdJ7GMp6vHiP1wr_d3g_1793338016
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ea381ce04fso5025685ad.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 22:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793338016; x=1793942816;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mRsNbAHpudxEenLMORDVEFfulu4vxVjp8oQNw/o1bgI=;
 b=m3ZpxyYO3FNv0LZyjthYdz3X39gejjKKLtWCjefB4qNupkKj1d0CR7jwZe/AAP0srX
 U6EMzdPIIkjikg7bz6StTR2Kx+FJp0C+Fh3Xk4PLgxq9JejCrlvph99O5cV15XG9BG2H
 NJF8g7dUFqKYpf7G0G7CxoTLrsfQ7gMk4f2QlbIzGDpeelau9e6lnELHrgY/KWSJ4IQY
 BpRSRaAZHWEuTQimIBACdxhTB/p+Oa+VrKyfsaahmfNtT9CL7Z78/Lb47p0Tios2SZ8k
 fidW5NEDpOVLbCtN0xfh29Kz7eve/IlXrT+R6WKwLArKd5s7/HhUPjINQ3aSKKSFzv7V
 tLlw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzUeqahBh0qN5NWzOSWqLtfZXspznP0rmKxtKJFT91XaVGpNzpRL1JKhKY7ai4U5kybvmPYT4xdqw==@nongnu.org
X-Gm-Message-State: AFq9FYIm5oTkA/1cCnxme9dDa2lvBp8WxVvdHb5hoTREsMxBVDBaUp4U
 DVMT2cF5vXh/M5IprVm8UMIxdEAxmShZY7SSkB9zjiBmxp/ZMNQBz4QnLaO3AW+W83rpFa53gq2
 GjU40aNnR4C8WyXKulasrvrzXaImVOmBZgQ/ClXMWPYve1lXNlbXpNntpT4tGDOAUGU6tTd6pZM
 D8cD1ydA9pBUGnkkKPWhC5ryzj+MzAUoEx596d/W7nRQ==
X-Gm-Gg: AYBFou1C4srO9xMr4qr/G0MLgjnwVwo+x0SCsh+lP/5P35Wak0nUhLfzV5dge2/3ppA
 nHqisk8sjRBhNNXdL7AaiJtRC7qLn/Rro3vtcrYnm6aHgVSq5M5RsR1mMrVey8L3997t4I5zsYD
 LhQkdm6OHD/oSYfQB0ny3LXRTShusoVr3Jo2GXLITdZW0SiToHRKZHrDIzyu+yaf3FC/zDRMau3
 SkM5JGkV8HE5vob
X-Received: by 2002:a17:903:1786:b0:2e2:d3ef:125 with SMTP id
 d9443c01a7336-2eb3640f000mr11804815ad.5.1793338016407; 
 Thu, 29 Oct 2026 22:26:56 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2e2:d3ef:125 with SMTP id
 d9443c01a7336-2eb3640f000mr11804705ad.5.1793338015962; Thu, 29 Oct 2026
 22:26:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029143742.294275-1-eric.auger@redhat.com>
 <20261029143742.294275-10-eric.auger@redhat.com>
In-Reply-To: <20261029143742.294275-10-eric.auger@redhat.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Fri, 30 Oct 2026 10:56:39 +0530
X-Gm-Features: AclHuK8IchFk1YCWtlGSwksthnpix-UcaExYdZJoq4kbbQKvsBekB7r_RPWOGRQ
Message-ID: <CAJg9KkydH099qM7vFeYOkEMwus7a1hYODEy+5gE+z37+xdhCHQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-11.2 9/9] hw/arm/virt: Make sure virt_get_caches()
 keeps on reading CLIDR_EL1 as 0
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, alireza.sanaee@huawei.com, armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6nZJO7B7ZrMPDswcd4zhRukVjDiy19JYfo1uY47u0Sk_1793338016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:08=E2=80=AFPM Eric Auger <eric.auger@redhat.com> =
wrote:
>
> In KVM mode, virt_get_caches() currently gets a zero value for the
> CLIDR_EL1 register. This is due to the fact CLIDR is never read from
> host. This is a bug.
>
> Soon we will initialize all writable isar.idreg[] from host and this
> includes CLIDR_EL1. However, we cannot directly fix the initialization,
> first because it would change the way caches are exposed to guest in
> DT/ACPI descriptions and because some host values would be rejected
> by the current QEMU code, especially in the case host has a unified
> L1 cache which is currently not supported and triggers the following
> error: "Unified type is not implemented at level 1" error.
>
> So this issue will be fixed separately.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Khushit Shah <khushit.shah@nutanix.com>
> Reviewed-by: Gustavo Romero <gromero@redhat.com>
>
> ---
>
> v1 -> v2:
> - fix the commit msg and improved comment (Gustavo)
> ---
>  hw/arm/virt.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0d56197dac..a80c60f3fa 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -338,6 +338,21 @@ unsigned int virt_get_caches(const VirtMachineState =
*vms, CPUCoreCaches *caches)
>      ARMISARegisters *isar =3D &armcpu->isar;
>      uint32_t clidr =3D GET_IDREG(isar, CLIDR);
>
> +    /*
> +     * Commit f669de70011 ("hw/arm/virt: add cache hierarchy to device t=
ree")
> +     * read the CLIDR value from the isar array. However, in KVM mode, w=
e failed
> +     * to initialize that register value from host and the resulting bug=
 is that
> +     * we have always read 0.
> +     *
> +     * Soon we will initialize all writable isar.idreg[] from host, incl=
uding
> +     * CLIDR_EL1 but we will need to handle compat properly and also ext=
end the
> +     * support to unified L1 cache. For now do not pretend we have somet=
hing
> +     * different from 0.
> +     */
> +    if (kvm_enabled()) {
> +        clidr =3D 0;
> +    }
> +
>      for (int cache_level =3D 1; cache_level <=3D CLIDR_CTYPE_MAX_CACHE_L=
EVEL;
>           cache_level++) {
>          uint8_t ctype =3D
> --
> 2.53.0
>
Reviewed-by: Mohammadfaiz Bawa <mbawa@redhat.com>


