Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FDEC5AD5A
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 14:52:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvFkc-0007yj-0K; Sat, 15 Aug 2026 10:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFkZ-0007yJ-4Q
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 10:52:43 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFkV-00077j-7A
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 10:52:41 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8111c0c7561so24691777b3.3
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 07:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786805555; cv=none;
 d=google.com; s=arc-20260327;
 b=o1B6TKG12GWiLnnmzhzV4Bu+WsAeaf/WF+VNAkT17D91q4TZdWttCSSYMrOaChF014
 Y/mtPKF1lGmPyuOT5ofd6b0xkA27ufufiq0SWdAHqu1j+cpXDwul5toVUbavqe/bWDZ/
 EFzo2+C1Q2ozdeak2Do7q+fwJi/6cHcET2chXISd9zq+o4n7NsBC7FW1j1eMZYllY+Xz
 dUbIzca3hVY43AfjuL5ZPguRn5i0o3Iv+aVKZLhb9YFRWRPm5b5Okca0udeehpy7b7Dz
 0MoiHCRgWoaIi9x1Y+c49NBBiKmlsyY9M/dpBXdkgFSumAB33m+v8HaY36YShebTMeC4
 WR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/9w4J8FONwnQfziILi382EWPo/uUwicBt+DKZkBiozM=;
 fh=tRO0HVMUaJwEs+TCpHK3vH7JUYFxxPABcSmf0uYZR4I=;
 b=OqQmsMRV+jOophQEu8vfRJ4eOPzPE0CnH9Iacrqx5pZCu5Gd50TqHVqBQ65kwdvzO8
 6utTSWpljE/FAvPiojxxnD5lu3NKct5bRrNkq40ITCd1AF5Pw/ZLLSmHoQS+N9e+8KzM
 B2uz3nOKutkUH0GRCfkiHiOAX3y4MpKTqy81ifglcGxKJbQcNlrtBjnYoT7XHiTWd3u/
 BVufRnuKSiBGHUy5N76magoge1UqCdX5BgHviMWvtEXFgMBIvDgyK4e22GQ1Ar7np4VL
 mL3mOe3WEHiOkl5kPsfhptN0BMG1RF0+Ik06YN66XWpoXw7ETtovD/UX6O0xi81UFqS+
 zOpg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786805555; x=1787410355; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/9w4J8FONwnQfziILi382EWPo/uUwicBt+DKZkBiozM=;
 b=wOJZ5EQPsJGdi0jO6NYR2btMJta+BYlgwAWBlp4yoRSTTsSEdzddflkg5WnLil+y5U
 hb9A8It+mBZQja9fTeBvmq/l2Ex32VF3tkFA5MebvQVNrJ5cxeMMApgNBj5ES6vyB7N4
 QbxEAbs8ZNGMVGcirqOGhtCCBGj0JTXTi+dHPLM//bCaSQibx2FVFBjdRYNOWDfg+8nN
 jvu+pWTpAyKYai1/530EOXJ2HXaz9438YHO1G0KeW3cC34NKm4S8bQGhHhp9dDu1p7OX
 ZY8x1J3/A5rHCCdRGKF+R7rT6vQraUUyqBCojd4DfkCWNGuF41cLgBGBtTIODIW7JAj2
 in6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786805555; x=1787410355;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/9w4J8FONwnQfziILi382EWPo/uUwicBt+DKZkBiozM=;
 b=jwgltdGk0Vu7N1mjA1oel9XLiiG2N33fomeudBdG3k8RBgYPnGgUL+tI8SFm98yv0m
 3wBaYr9HijgMn+6F9kGpritTtgtUpEvPiwpIWVPj4gh+gDuEtQRDWSoMCH4MYLRp640a
 UmNgRmnUunLl0NTBPW2Gc9pSm+4p/g+QBeHDBsgogfMKIJ+9VEVAf0nUC7Kx06MiNIJ1
 PtQISJuNtA04cMi9ZYvtHO57ln9M1WjwKDQzEa1j8pdkHnvNx+D62ZD58gueZvn1UWmK
 gS/WiAAPy5cDjOJTEBgs0ZTm5wH8b8dvcGoEeCastpJUYz/ShQamWD90PX9bzRj7hK0N
 TSUQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOR4G7Is8k61gGetbMaZirhjoPty9jynLjLt5P9xh25Durp9Ai3n5hGgp3wayCgj6BO9jmi4wCIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwFeDuCcgn4GaLXkuxP0NCIgYoUiEi27/UicAC2/qqs+Lj4E9OV
 Hqc73YTPyZ1ijG4+oaNVZReXlC6TMJaUyisDSmiwTYLYmK3kcrRx/4lJBfVfPqK7cB7dIoMJahp
 0k+t9bvKsdYd4jYLY6XW0BLKaK0b2FB1QsP5K0KB/Yw==
X-Gm-Gg: AR+sD11gE6IYAll+ievcjvRZ4AmbkEbO615dwHtHOGHvKB2fG5zO4X4SITJj0Q4Syeq
 e7UJLSmJwYesztn9LdCCW/I2jD+jSq9ZTSdxieIIQZ7xJVKYec3kP9c0aQFmc1L347tySpeYqm8
 ZOO1OJXhvDfYth2Qm/hDxR+r8xOsgbvYAOI84xoVIXWyTHJf+KiMnWH2jCN252csVt9SoNfpNM+
 t2Wm+ZYgAqpTIuJ2iZydW/VCI0H4WV8J0/3N2Rr3iACqLh4sNZEqAxL0k9JbF1Dx4kBBFMGMY+4
 2OOW8dd0oXSp2ld7aEuwW+bN8Ec7wJr2ry0Gitmre5025L74rJCBYX4HymUGT+5FNXHuWiYkRlZ
 aJ5MJlD0qTUv+MZuy8qKs0lyAfYbB6jcstXwUgUYi
X-Received: by 2002:a05:690c:c58c:b0:833:801:f715 with SMTP id
 00721157ae682-8371125d0cbmr38983667b3.18.1786805554653; Sat, 15 Aug 2026
 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260812200308.289238-1-richard.henderson@linaro.org>
 <ae5c387b-a12c-4a13-b3d3-7ce1a91d81d3@linaro.org>
In-Reply-To: <ae5c387b-a12c-4a13-b3d3-7ce1a91d81d3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Aug 2026 15:52:23 +0100
X-Gm-Features: AcwNN1XfWsjLOT30DnEj4meMi3CNGrpRWCy9ISRKB1F6K3V_99wEx5TXFoCTZQE
Message-ID: <CAFEAcA9qKQ9405fZRjDG4Ji2=Zw7ZsG35UuEV3vwmKTNKMSWqg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Fix arm kvm gicv3 selection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Wed, 12 Aug 2026 at 21:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/12/26 13:03, Richard Henderson wrote:
> > While 39a8c3941e may have fixed WHPX, it certainly didn't help KVM:
> >
> >    $ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
> >    ...
> >    qemu-system-aarch64: unknown type 'kvm-arm-gicv3'
> >
> > That patch did remove a test for TARGET_AARCH64, which is fine because
> > it has been a long time since we supported KVM for AArch32.
> >
> > Fixes: 39a8c3941e ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX")
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   hw/intc/meson.build | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > index a1401cb521..faf63a0145 100644
> > --- a/hw/intc/meson.build
> > +++ b/hw/intc/meson.build
> > @@ -48,7 +48,7 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> >   specific_ss.add(when: ['CONFIG_WHPX', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_whpx.c'))
> >   specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_hvf.c'))
> >   stub_ss.add(files('arm_gicv3_hvf_stub.c'))
> > -specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
> > +specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
> >   arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
> >   specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
> >   specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
>
> Alternately, we need to adjust
>
> config ARM_GIC
>      bool
>      select ARM_GICV3 if TCG
>      select ARM_GIC_KVM if KVM
>      select MSI_NONBROKEN
>
> Though I'm not sure how ARM_GICV3 + WHPX would ever get selected?
>
> Alternately, given the very tight connection between all GIC revisions and the cpu, how
> does it make sense for any version of GIC to be non-selected?  Just remove all the GIC
> configury and include it with just TARGET_AARCH64 (not vs TARGET_ARM, but vs any other
> valid virtualization host).

I think the rationale behind the kconfig handling here is that for a
KVM-only build we would prefer not to compile in all the emulated GICv3
code (only the base class and the KVM subclass), so that in that
more security-sensitive configuration a user/distro/etc can be
confident that all that emulation code is not in the binary at all.

thanks
-- PMM

