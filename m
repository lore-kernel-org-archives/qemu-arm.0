Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5A4CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtL3-0004t1-P1; Fri, 15 May 2026 10:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtKs-0004pY-2I
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:16:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtKo-0005mm-7L
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:16:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so659471f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854573; cv=none;
 d=google.com; s=arc-20240605;
 b=GxhCpUpWeqfgAyQ5LteEbWXl1jBozZWmHzFwQ/xxUBXntaal0/aMlTt6tZ+zM9YYKD
 t6E2/dubMWFXo9jBCj5xwrjKNJd6tFWKAnQT0FMzqO8viWAZTH5nKdzaFzX71pgJEwGX
 Aor0kzmfjSu2Ru2uzeac+PVmpYOzyT8XreBTcl4Dw1d88t4S3cWd62YfVhmBu6pjFNJf
 kX1+FsYYoGyjDPeli1gZkD79BT9z+ZvpItb21rGLRYgeZutGklHWvebTXUX762JXljWb
 ngRM9olJMvMGX+Zec+hR2sSFKXQ8VviFHTJ76Lw5u8vis/UVoo7LddQ7AqdBmWzjRvah
 z6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PI64Z+S7qs3Vr59kQf17VMfI5L9uC9oeVjsWPxXubPk=;
 fh=LQr1/CWlzbpGCMdSrf1bdROVYsBsiaRavtK4uI+q4bU=;
 b=GcIiUsQmakFqOuwVgXyW0h8z0YQF4D+OujmHdPwoJkE8Bc+tDot8MOdzvRCgYUxs1Q
 pa+/PHw7CKrTuZMzweBBvBxprI+aReAJ3fjEdVEuwy1NljmCcAzYY2WueaFnEdXTYkst
 J5KBSCfOiQdXgt2wmWUoDdsGJOp1mDrpaaiuNQHHtMu0wiIZHWXvWvzOTr+Q04jkNZ0G
 L9zcEdcJWEDi+UP1I3RZp2qes2k53X5xdaYNMDkmpvabKCnrWEMXU6EPKMzNDa9MrKlw
 GxMJVu2AjaW0RQIb1H9C7rdNZNillvkFKOchJ1GLB1w/D6ZD4fpHi77GNwF802rG7shQ
 uZhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854573; x=1779459373; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PI64Z+S7qs3Vr59kQf17VMfI5L9uC9oeVjsWPxXubPk=;
 b=W4hqhb1DaLRscCE7k8XTzoO+dUw2Pz+Hs5wid1PSNjELs53cDg5h4eToqw7Oom2Vg8
 U/ac9hZVMUMrxOUGTkWxADwOgAudwirDx2jJWRhjBZP6e5uhNHW6+rKXj090kA7hVLOq
 Z2iOp5XNsSvIOrS+qqud766O2rrjOX6ZROjGkHprXUtL9LEZd4FELZInP6iYpBXyxbNM
 oW+eJLE0PJF6SvuFIWs9rNT+3hxh7ApC6kR2/JZnxrhlk01ftVc1+JXEsz3p3VPzYL57
 s5wdKTV7iWbegyxzbG+dinrcFPN8+RcbtbqURb8zr0bRzZ+QjRpLyRE9sH1jnKFDWm7H
 SZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854573; x=1779459373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PI64Z+S7qs3Vr59kQf17VMfI5L9uC9oeVjsWPxXubPk=;
 b=kRsVXqXVBtIWkGkqQbpxAiZnh0g7suXSAAIQb/VIJ0Ksdp+pfuiMbPlaKNMhdBUpzf
 ECoKZOpv4Zx/XBNGxF567Hm0B715uy+R04YzQteNuIcu5uZz+PVPOaC0esZTHthlQKWM
 qGGT28goMN1YAJ7haLXK+976UGnIppfWs44rLpCezoqFV2jhvNMzk3MJ4MYD0487oVB9
 zhqhZ4GS0cu09G9YRveSQhs1dayxTMlDF+E0aB+ZV4gKtBW27hf5VeKfrXeMZxHKBDsX
 NGga0+3UFA9ooKiyZwHtx+Vse5T/SJcwhE95cHZrKOORmNc0kBZXMzbk2xz62PGDaYTv
 hvTQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nsFuBuxX8zarnWGgvUsp42UbDlnu7qmoSwtGjt0g3AJ1fE/nfUND4gIsqI8JuCYejTRRiJJ1lZw==@nongnu.org
X-Gm-Message-State: AOJu0Yw7+v0pK01f8kQfBxDJng3vdfV35A9KDtPqCiOGqOeLLym3cAKK
 zdCsM/ew3EA6dvZV7pS1MnyReUEigifVda+T1IkSKzvJHiRUCY5DVlwcnsKMRH0zlfZssGenPZe
 PH5ir4b5sJoEUdA0NRExPMr3SslnFFPNiIU/7SqYObg==
X-Gm-Gg: Acq92OF8sasJWETg2vJ3GAsO3UcFBIHf6FUeg/SbNAXb8Nh2LB+ch2yeRfGUgjnIYpx
 4zdfBOw0oLGzVhs7YRYU+yc0cq7MtJpz3EFuLqK+qtAYWud7ux/1reTvciBANVlpxCSuYd8XI/z
 pkLv7M3/ZWesWeayJWMQ84qduj9veDUKP/TdiCrnPRax/QOKD1YU8YL8zJmXnOdRmTkcoefi/F8
 RvmvkXsJC0YT9LN7FiXBcLY8NVouJd59xhgvvVTJfW54cZMa9mgPpyoyMQyHDJKGYCX2jYJuCoc
 2XI9QhX4DNKz/yJM+u2Cxk5+ayZ0UNrs+Du4k9q9UetsSW9wYfNlCyxmI0Hd
X-Received: by 2002:a05:600c:83c7:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-48fe53a8eccmr59746825e9.16.1778854572680; Fri, 15 May 2026
 07:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-4-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-4-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:15:46 +0300
X-Gm-Features: AVHnY4JBvfbKB7kq0kY0Xz_ckzco2wKsYWSCmPBx8-EFeqeEj4NHrsm6QBusHhE
Message-ID: <CAAjaMXaMSqJ_xquWOqFJsMu0xqynP8a4c-sDCGVy+s98+fN0hQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/20] hw/arm/raspi: Build objects once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, May 15, 2026 at 5:10=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Now than Raspi machines can be filtered when running a
> qemu-system-arm or qemu-system-aarch64 binary, we can
> remove the TARGET_AARCH64 #ifdef'ry and compile the
> aspeed.c file once, moving it from arm_ss[] source set
> to arm_common_ss[]. Note, we expose the TYPE_BCM2837
> and TYPE_BCM2838 types to qemu-system-arm, but they are
> not user-creatable, so not an issue.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/arm/bcm2836.c   | 4 ----
>  hw/arm/raspi.c     | 4 ----
>  hw/arm/meson.build | 8 ++++++--
>  3 files changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 03825e69d06..f4ecea908bd 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -195,7 +195,6 @@ static void bcm2836_class_init(ObjectClass *oc, const=
 void *data)
>      dc->realize =3D bcm2836_realize;
>  };
>
> -#ifdef TARGET_AARCH64
>  static void bcm2837_class_init(ObjectClass *oc, const void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
> @@ -208,7 +207,6 @@ static void bcm2837_class_init(ObjectClass *oc, const=
 void *data)
>      bc->clusterid =3D 0x0;
>      dc->realize =3D bcm2836_realize;
>  };
> -#endif
>
>  static const TypeInfo bcm283x_types[] =3D {
>      {
> @@ -219,12 +217,10 @@ static const TypeInfo bcm283x_types[] =3D {
>          .name           =3D TYPE_BCM2836,
>          .parent         =3D TYPE_BCM283X,
>          .class_init     =3D bcm2836_class_init,
> -#ifdef TARGET_AARCH64
>      }, {
>          .name           =3D TYPE_BCM2837,
>          .parent         =3D TYPE_BCM283X,
>          .class_init     =3D bcm2837_class_init,
> -#endif
>      }, {
>          .name           =3D TYPE_BCM283X,
>          .parent         =3D TYPE_BCM283X_BASE,
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 00e4a10466a..3f99e87428c 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -367,7 +367,6 @@ static void raspi2b_machine_class_init(ObjectClass *o=
c, const void *data)
>      raspi_machine_class_init(mc, rmc->board_rev);
>  };
>
> -#ifdef TARGET_AARCH64
>  static void raspi3ap_machine_class_init(ObjectClass *oc, const void *dat=
a)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -387,7 +386,6 @@ static void raspi3b_machine_class_init(ObjectClass *o=
c, const void *data)
>      rmc->board_rev =3D 0xa02082;
>      raspi_machine_class_init(mc, rmc->board_rev);
>  };
> -#endif /* TARGET_AARCH64 */
>
>  static const TypeInfo raspi_machine_types[] =3D {
>      {
> @@ -405,7 +403,6 @@ static const TypeInfo raspi_machine_types[] =3D {
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi2b_machine_class_init,
>          .interfaces     =3D arm_machine_interfaces,
> -#ifdef TARGET_AARCH64
>      }, {
>          .name           =3D MACHINE_TYPE_NAME("raspi3ap"),
>          .parent         =3D TYPE_RASPI_MACHINE,
> @@ -416,7 +413,6 @@ static const TypeInfo raspi_machine_types[] =3D {
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi3b_machine_class_init,
>          .interfaces     =3D aarch64_machine_interfaces,
> -#endif
>      }, {
>          .name           =3D TYPE_RASPI_MACHINE,
>          .parent         =3D TYPE_RASPI_BASE_MACHINE,
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 80068f70bb9..144e4827660 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -27,8 +27,12 @@ arm_common_ss.add(when: 'CONFIG_ALLWINNER_A10', if_tru=
e: files('allwinner-a10.c'
>  arm_common_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner=
-h3.c', 'orangepi.c'))
>  arm_common_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinne=
r-r40.c', 'bananapi_m2u.c'))
>  arm_common_ss.add(when: 'CONFIG_MAX78000_SOC', if_true: files('max78000_=
soc.c'))
> -arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
> -arm_common_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: fil=
es('bcm2838.c', 'raspi4b.c'))
> +arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files(
> +  'bcm2836.c',
> +  'bcm2838.c',
> +  'raspi.c',
> +  'raspi4b.c'
> +))
>  arm_common_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f10=
0_soc.c'))
>  arm_common_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f20=
5_soc.c'))
>  arm_common_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f40=
5_soc.c'))
> --
> 2.53.0
>

