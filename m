Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7201BC88E75
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 07:46:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7TIP-0001Lh-7K; Fri, 18 Sep 2026 03:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1x7TIN-0001LN-1v
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 03:46:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1x7TIK-0007yr-Tc
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 03:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789717562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qZv+exKqyNjMxq3hyq93Xj2Gw1BgKFVEeuRR/mK2ME=;
 b=Oevo6UjvkE4+HMslPsRznighFZloVxlym+BqkR4y+CaiwDJDoAlNLfpMGktNGgVfZYtQwo
 NWPh+4vyvpPqQINQTeUX2szx1Z9E1xuuSHjGsg/Qj1pouO5qttISb8tQdeL5zRyGv3ZOZh
 bwxXoL6Hu0I5vj4OzH7fJUqeQhERLFE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-ylpka-ogOneEBst2iZB2sw-1; Fri, 18 Sep 2026 03:44:24 -0400
X-MC-Unique: ylpka-ogOneEBst2iZB2sw-1
X-Mimecast-MFC-AGG-ID: ylpka-ogOneEBst2iZB2sw_1789717464
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7f8931a803cso432693a34.0
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 00:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789717463; x=1790322263;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+qZv+exKqyNjMxq3hyq93Xj2Gw1BgKFVEeuRR/mK2ME=;
 b=ROsfgkkxhUi/uhft++3ne/i/3H2GOXhdwY4EcCRLuerF9X9IB/viG9Z0d6JnqWwGOh
 H0BUhd4zKc6i3+PYZuoJeEEzVIvCvOZdOrua2G1LdMZ0fsCRAukumaxciwmYS9DA+yYk
 2ORqgQ/1I92l1EG7R0LepEm8lBjussqf63id3ClAKTG6oVoSdfrcIrRJjRlD0aSxEBl1
 ahx5qPs1kBHyfPQ2agVGkkP6Obglzxod/a7vcgYw79sAk/o0KJWY10yehh4fhzaad+fZ
 nGgQnVr4LZGFLKBSSzbZL02BOTYSMin9MBuXXvYD7bbC0j/iwKLjZpzQzMOjUbglDTsZ
 YpFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqiKN2ONq6Xnjm2aHlZQHaqA1syNBJCUaU0kDP0ukbVSwJPOEl0bl8pbb34h5tAPgT7bEMhV9d/Q==@nongnu.org
X-Gm-Message-State: AFuF++mjnnpXLdlpRxfN1/ldl1tHyCRsiuLEU1G2uUgR4VdEsR5WwXYC
 WhlhR0KQalH1F8D2yihbKoP+4aA5YlgelSLLFAjKEcg+pCO71YihsVXH66VVwKamFCfWnFWZGKT
 L7ZjHAqSRqIO/81xfm9UQOs8qgugCYFyrdq7a12KeW4YV2hckQpH2uBrz8Yf06qm1ijiPTDynwv
 UHQhgiDuH75RLw7Lso+/LffivSz9Po
X-Gm-Gg: AYBFou3VJt8P12lc1sTaMUIzgkwA1u6GjFBv2voeH8jwETRxCh4PPetGICprAzT8JGz
 RtC+hou+w0CNNEsgLjOTvfGxLxfRjfUSrzeU3OUzc1RXeh3dIOt/8SFEL9xZsBRbI/rJXqvopPn
 oU7oYkaWSX7JXu4U/+yZCVsI6QYUpVgcRHkf4ZAVBf9cD6gOmmZG1rhy85zA==
X-Received: by 2002:a05:6820:4d06:b0:6b7:46e9:9703 with SMTP id
 006d021491bc7-6ca9c84e82amr1604084eaf.51.1789717463548; 
 Fri, 18 Sep 2026 00:44:23 -0700 (PDT)
X-Received: by 2002:a05:6820:4d06:b0:6b7:46e9:9703 with SMTP id
 006d021491bc7-6ca9c84e82amr1604072eaf.51.1789717463140; Fri, 18 Sep 2026
 00:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260721122135.6288-1-philmd@oss.qualcomm.com>
 <20260721122135.6288-4-philmd@oss.qualcomm.com>
In-Reply-To: <20260721122135.6288-4-philmd@oss.qualcomm.com>
From: Miroslav Rezanina <mrezanin@redhat.com>
Date: Fri, 18 Sep 2026 09:44:12 +0200
X-Gm-Features: AcwNN1V1QzfHhOgeL-HCPscnU3IMGupzuwJKmfRaIQ1HW7parCukC29xzHF9Ids
Message-ID: <CAKRGJ0CnGvU3Je5B3duHF-vUOZGXeMk5f0YFQbC+=vbGp++j0g@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Only compile gicv5-cpuif.c when GICv5 is
 selected
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ltI_ya1dyiBXMuqopVAIHdmnnbOQL5wP3IeUtOizZ1E_1789717464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

looks like this patch was applied incorrectly. I do not see removal of
gicv5-cpuif.c from unconditional adding. Is this being fixed?

Mirek

On Tue, Jul 21, 2026 at 2:24=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Only compile gicv5-cpuif.c when ARM_GICV5 is Kconfig-selected,
> otherwise we get when building with --without-default-devices:
>
>   Undefined symbols for architecture arm64:
>     "_gicv5_activate", referenced from:
>         _gicr_cdia_read in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_deactivate", referenced from:
>         _gic_cddi_write in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_get_hppi", referenced from:
>         _gic_hppi in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_request_config", referenced from:
>         _gic_cdrcfg_write in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_set_enabled", referenced from:
>         _gic_cddis_write in target_arm_tcg_gicv5-cpuif.c.o
>         _gic_cden_write in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_set_handling", referenced from:
>         _gic_cdhm_write in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_set_pending", referenced from:
>         _gic_cdpend_write in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_set_priority", referenced from:
>         _gic_cdpri_write in target_arm_tcg_gicv5-cpuif.c.o
>     "_gicv5_set_target", referenced from:
>         _gic_cdaff_write in target_arm_tcg_gicv5-cpuif.c.o
>
> Fixes: ee0f1ce00db ("target/arm: GICv5 cpuif: Initial skeleton and GSB ba=
rrier insns")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/arm/tcg/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 573e8b5af48..1cd98c1b857 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -83,11 +83,13 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64',=
 if_true: files(
>  arm_common_system_ss.add(files(
>    'cpregs-at.c',
>    'cpu32-system.c',
> -  'gicv5-cpuif.c',
>    'psci.c',
>    'tlb_helper.c',
>    'tlb-insns.c',
>  ))
> +arm_common_system_ss.add(when: 'CONFIG_ARM_GICV5', if_true: files(
> +  'gicv5-cpuif.c',
> +))
>  arm_user_ss.add(files(
>    'tlb_helper.c',
>  ))
> --
> 2.53.0
>
>


--=20
Miroslav =C5=98ezanina
Virtualization Team - Maintainer


