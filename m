Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16822FF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHI6f-0008PR-VR; Mon, 27 Apr 2026 05:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHI6d-0008Mj-Gb
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:18:19 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHI6b-0003qX-V8
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:18:19 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-79a46260385so111694737b3.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777281496; cv=none;
 d=google.com; s=arc-20240605;
 b=g2wXxoNnDysiIxtrukbBewXdW5sZfrxaDEtzNQUUKcB3SywdepFVXSsgEwErMg77LR
 Afk7VR362XFKyPDf2tv7r78PQH03tNPSX8UFCaoKGjT1spmvrDWI9w36JThJTFcHR39S
 26BfF4Mm1f7l/O2GTTnkEExQzrIL3xoM9ON2exccGxSYWPez9RL1A1I+3enIX0SeLQ+L
 ZW23EwnKBy45YAnyONxOQBAnlZ/18c1o2yQneeLLvbiU5DMF+CNAP0Kjbvf2gJx0HOzH
 JM9YVcyhs3SXYG6Hm1JpZ+D3CzhWdTHn7cT9USfl9ycodbSLXIc5lkwNv/pPFwbLRoVB
 2zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4ZHD1rGHL9UN+4M1rvTNcKlJU3aVRlSVdfrxvxlbdxs=;
 fh=FaKOuisZccORqqZ7ZmiW3Uf/KPAU8K7N/VpYfUnRqWs=;
 b=b4WBjaiDH8ecA8b9JnbpkyhKyFm6CjMLPyh/Dqx93/i5GvL/ROoY6gTnLBZpUG+7ts
 rLV7wj+u4sXjlA4JC+hLZXCNbQ/TQDJRTd27XwgkdUim+FIIeEywAYlgd7JbeqUS4rWG
 n2/QYht3lF30/Q0G9jx3Cqw/QJo9sxZ54XdJu8bk4dW6LTr8T+kh0Z+NoI+c0uFhk5Au
 6vDmStHh+fBQ/cJR8o8Ym3cv0L+0VCG+KeZZbG3DzuM6JIlcpIGLM1m4wv0K3EwEJK7j
 p4ERwcwbG620NdCyx5VL3EfVPQ5KTCnu6E+VEtz+ZaIJUE/QGwaicMoISHL7kDrjcX7l
 Il1w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777281496; x=1777886296; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4ZHD1rGHL9UN+4M1rvTNcKlJU3aVRlSVdfrxvxlbdxs=;
 b=jU7FH2cLaKzhxubud4UN01mD+smE3fKLYUUyd1zZEhSdXGUKEWC4SwP6dAzEaP3GyO
 bJ+rOnfi3N3niuhl7EnBvqV83CyhPyz0RfSgj1oCcCDJaD9ypWVgldUGE34KTxYR7Ab3
 nb+j7uGRFSaTiY3zbUxlM5bABoMhPLWrXYx2sjcVr7gMly0rEr9xqZISc3j7q6DI30Wi
 lEHI6qgyheGPHyUDKT8bx45ANz2iAZzIWpiCPg8S5KlY4PAuSWBnn2CNsVghQ0ggO4R4
 AgChry8A5RtruiXd4Eli5RgohPnR8+quad5dWHRlLtyU35/+1h0pvUBvl4u8Np87SIru
 2bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777281496; x=1777886296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZHD1rGHL9UN+4M1rvTNcKlJU3aVRlSVdfrxvxlbdxs=;
 b=ACvbx2JHYX+ZHONk6QZLavWCi+PrfQl9VvBYQ9gmnYebq/xPMRlSgMKKVoIKt49Z5E
 GqOnWfwM5TphsLbF2a7+3vETczZyR/qor5zyp1zncobhuIwM47p+Pg5OxQ9nh3N7r2ou
 XpVu1bk918nqyzk+6JBhEwo96KXyGRf7TasEW474JCgwhS+YPXnJ7GW4/Gh5ntF6EzK/
 YsPFM226CZtjq3xLnciM+s35mGrIB/JFHf8CnkH6rnVQyFlVnRnDIkqOtXus48ewvcfd
 x7ARdSoxVX8i9yuF5LUBT/FW57V/Ee6znPDIC2XClvrTmVI0dCEvNy+Vopynj4Xxtl6E
 fUyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qdhuHDtBAcGWNa6XkdKvGs1ze9nNd2+tcyrdAVIBSxweY5w+AunvqhdvdkDMPqla0insaGimQKA==@nongnu.org
X-Gm-Message-State: AOJu0YyUKF+zSyWpYZAZuSqtXL7e+2+Rd/2MtbPPERc6Z+i2JlrdAEGT
 Y3UtPwvqUGoYXNx5+8/G1DKbxjzUltlcUjHJUs2h34nXRHS4wufcwWXP4LjTiusdXzvXcgSidfq
 NzNdxXxZVUoHSSONazRcX3J3iDe12A7U263ypED7q+w==
X-Gm-Gg: AeBDies0BY7AJZMt7u8+FuOsNa13+SPN8pr51TvLHHkUjFp3FoaePGi0iXlXQQArxDA
 a4hvDhQ6UKAdBEOfKmr7vYehujUsz95QD01vKQiE3pu8xYZdGlsyjra6+/UDG3Hk3ps/NlKiiTJ
 4FGrNntLwBXtOtmRezBzUXWlVxnBkOo+vVWQsi4WVO5nVwNQYFVCcu67hJJ3SCJfPeqvPpwfg6R
 iRQrZJL8CZj9LOIB7+X4/eDI6PBZA4DDzqBqPAKG0MsUc/IyRCt872zvDrsGRWcDzgty7lA0rHC
 uyGalb5pusUGmarJAth3d5m0c8fVw36eY7ow+k4IXu59bcfewmC7Cp0kfiTT/A8Ed2dcIB1Ogvl
 ngfhvQVNsUSpx
X-Received: by 2002:a05:690e:b8b:b0:652:f16e:952e with SMTP id
 956f58d0204a3-6531080a41fmr36002187d50.14.1777281496623; Mon, 27 Apr 2026
 02:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260420140552.104369-1-eric.auger@redhat.com>
 <20260420140552.104369-6-eric.auger@redhat.com>
In-Reply-To: <20260420140552.104369-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:18:05 +0100
X-Gm-Features: AVHnY4Jk2G_QaUXXF-ToRhKsty7cByPhEM1z72OjTIi4V98G6qYyhT2FKUf-ujc
Message-ID: <CAFEAcA-HXmw8Jj2roq311B8-0VLjO+-vWO6yDpJ9UkpiztWO7Q@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] target/arm/cpu64: Define cpreg migration
 tolerance for KVM_REG_ARM_VENDOR_HYP_BMAP_2
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 20 Apr 2026 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
> from v6.15 onwards. Backward migration from a >= v6.15 to an older
> kernel would fail without cpreg migration tolerance definition
> for this register. If the register is present on source but not
> on destination, its value must be checked to make sure it matches
> the reset value, ie. 0, meaning no service is exposed to the guest,
> hence the choice of a ToleranceOnlySrcTestValue migration
> tolerance.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v9 -> v10
> - Use ToleranceOnlySrcTestValue
> ---
>  target/arm/cpu64.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index e7014022df4..a93ad2da5ad 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -834,6 +834,17 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
>                                       0, 0, ToleranceNotOnBothEnds);
>      arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
>                                       0, 0, ToleranceNotOnBothEnds);
> +
> +    /*
> +     * KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
> +     * from v6.15 onwards. Backward migration from a >= v6.15 to an older
> +     * kernel would fail without cpreg migration tolerance definition.
> +     * If the register is present on source but not on destination, make
> +     * sure it has its reset value, ie. 0, meaning no service is exposed
> +     * to the guest.
> +     */
> +    arm_register_cpreg_mig_tolerance(cpu, KVM_REG_ARM_FW_FEAT_BMAP_REG(3),
> +                                     UINT64_MAX, 0, ToleranceOnlySrcTestValue);
>  }
>  #endif

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

