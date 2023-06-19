Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2984364ejt;
        Mon, 19 Jun 2023 12:59:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vZbSJdEezjQm7MluIdSgmHrpyAh/Nyb9S6OaMiYm1WxfWfkBqizSoakhWxpfsvL8eFeZ6
X-Received: by 2002:a05:622a:1105:b0:3f5:1495:1a98 with SMTP id e5-20020a05622a110500b003f514951a98mr13713051qty.37.1687204754849;
        Mon, 19 Jun 2023 12:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687204754; cv=none;
        d=google.com; s=arc-20160816;
        b=EuRBGcsFQdQLFEMS6RCt6AkockrM3IuAOd/SAwyBduSHyXV6wTdnvvG/U3ctqVpk+1
         s2rA0HFv/YH45TcYp3040cHNIsgLLiY0fJ9xgvkdjTbxwX8XX2B6xsVP9tcpQ0tfYg6h
         rZ5wuRCF7Donv51nokLXcTfr7KfuvzO8sOZ9GOI/G5aGclGv1+NEy/dFrPyW3Ddkw8BG
         wJ9JFtO3aNEVskrEZI3uctW7jA/mAe62jvydQ/wd1TQ4qnbq2IgtrLm7frzV+sGI3Z94
         6AVfO5PzeDQQjrgTBudz0w2yK497xIHm2NYMaD/064rF7lDnghaC1nXf2KApkSiQOkIr
         I50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=BtWsPacLo8k9pMoTcdb8p8UvjUBnHMC6X+MWzfmePek=;
        b=f5lFzgwdQHSP+CIv2sz7uAA4rcbUMXye8eT87OHRo33NPTAe98hz9XfUcbpP84467D
         GsqErxHpEmAtYmAlwiSZ1og3VRZKjbrtGAd7TvPeTq7yXMIWwaOdQB/Wat/lYgS8AVs/
         d3PSrP41pjGP9N8UqTd2E3V1/s7sMIdJ/EgbRTwtYSLBA/69BtOxcPBsECXZgUob9BJS
         UQgqTTO+mLqGTpMVXDaa52Vj5h0go0vyG6h5RZ0YRJhOBH1kLJ1jKGBgFDXXrXw1Z5V6
         2AIZ/6VMowdtpHsAC/yAQP8iZwE1YLsS0W6Y7vOevVf7y0aKapLIXGtRjJwVucW7IleO
         6rwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="WoH/PlIU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5-20020a05622a018500b003ff24ecf4a8si171934qtw.368.2023.06.19.12.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 12:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="WoH/PlIU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBL1T-0005nS-5n; Mon, 19 Jun 2023 15:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1qBL1S-0005mv-HQ
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 15:58:46 -0400
Received: from pv50p00im-zteg10011501.me.com ([17.58.6.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1qBL1Q-0000ds-US
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 15:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1687204723; bh=BtWsPacLo8k9pMoTcdb8p8UvjUBnHMC6X+MWzfmePek=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=WoH/PlIU/HISr9gk+ssq2+nMKf0Jip8Aqr8LUNJXDhNDAON4H+nnVsvI5Sm0wWkyF
 v9X3jBqyddIBxNPTfXZif58F7vV5ejU3exdImfELm1i4bwhI7vIJBQE30YL/DWltZX
 HmUzYgqcJrvfmngaEn0cRJ0Pr650dIUo3/LY+JHoT4FG8fXx/ztaaIew/D4aRYBCbf
 6lR+Y6Z7eXVXp7L7gAvCRORrkl8PsXPGaC3hVJWuTG9whVOYw05AfAVO6HGJYl/AQV
 BEFonYOQsOnXCULXFfyPEeZsSq0I8joA23IPtpWGgRzmvx6kXDHx2hk0FG/PLKIgUb
 XuJpRQCMUd6jg==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id D3D764A034F;
 Mon, 19 Jun 2023 19:58:41 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] target/arm: Restructure has_vfp_d32 test
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230619140216.402530-1-richard.henderson@linaro.org>
Date: Mon, 19 Jun 2023 21:58:28 +0200
Cc: qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B70FF45-6810-441C-9514-BC4347FF5F36@ynddal.dk>
References: <20230619140216.402530-1-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Proofpoint-GUID: NiqYD2SlN5CdbVTp3rw0wn4wGNhPxjo3
X-Proofpoint-ORIG-GUID: NiqYD2SlN5CdbVTp3rw0wn4wGNhPxjo3
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 clxscore=1030 phishscore=0 spamscore=0 mlxlogscore=879
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306190184
Received-SPF: pass client-ip=17.58.6.42; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-zteg10011501.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: ae71YBmGsUxp


> On 19 Jun 2023, at 16.02, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> One cannot test for feature aa32_simd_r32 without first
> testing if AArch32 mode is supported at all.  This leads to
>=20
> qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or =
neither
>=20
> for Apple M1 cpus.
>=20
> We already have a check for ARMv8-A never setting vfp-d32 true,
> so restructure the code so that AArch64 avoids the test entirely.
>=20
> Reported-by: Mads Ynddal <mads@ynddal.dk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> target/arm/cpu.c | 28 +++++++++++++++-------------
> 1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 353fc48567..706dbd37b1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1402,25 +1402,27 @@ void arm_cpu_post_init(Object *obj)
>      * KVM does not currently allow us to lie to the guest about its
>      * ID/feature registers, so the guest always sees what the host =
has.
>      */
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
> -        ? cpu_isar_feature(aa64_fp_simd, cpu)
> -        : cpu_isar_feature(aa32_vfp, cpu)) {
> -        cpu->has_vfp =3D true;
> -        if (!kvm_enabled()) {
> -            qdev_property_add_static(DEVICE(obj), =
&arm_cpu_has_vfp_property);
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        if (cpu_isar_feature(aa64_fp_simd, cpu)) {
> +            cpu->has_vfp =3D true;
> +            cpu->has_vfp_d32 =3D true;
> +            if (tcg_enabled() || qtest_enabled()) {
> +                qdev_property_add_static(DEVICE(obj),
> +                                         &arm_cpu_has_vfp_property);
> +            }
>         }
> -    }
> -
> -    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
> -        cpu->has_vfp_d32 =3D true;
> -        if (!kvm_enabled()) {
> +    } else if (cpu_isar_feature(aa32_vfp, cpu)) {
> +        cpu->has_vfp =3D true;
> +        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
> +            cpu->has_vfp_d32 =3D true;
>             /*
>              * The permitted values of the SIMDReg bits [3:0] on
>              * Armv8-A are either 0b0000 and 0b0010. On such CPUs,
>              * make sure that has_vfp_d32 can not be set to false.
>              */
> -            if (!(arm_feature(&cpu->env, ARM_FEATURE_V8) &&
> -                  !arm_feature(&cpu->env, ARM_FEATURE_M))) {
> +            if ((tcg_enabled() || qtest_enabled())
> +                && !(arm_feature(&cpu->env, ARM_FEATURE_V8)
> +                     && !arm_feature(&cpu->env, ARM_FEATURE_M))) {
>                 qdev_property_add_static(DEVICE(obj),
>                                          =
&arm_cpu_has_vfp_d32_property);
>             }
> --=20
> 2.34.1
>=20

Perfect! This seems to do it for Apple M1.

Tested-by: Mads Ynddal <m.ynddal@samsung.com>
Reviewed-by: Mads Ynddal <m.ynddal@samsung.com>

