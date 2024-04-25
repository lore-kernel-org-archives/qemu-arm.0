Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1630720ejb;
        Thu, 25 Apr 2024 12:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkhXQ5SDIhmTyjXDrPBCL1fzWiUJap4Xb83VAFYrGcPJnAUqeYpx2rfh8TLNs6UfIXqxyO8h/AxqRckGnRxCusmTypmvQn
X-Google-Smtp-Source: AGHT+IGITJs7KW3BIWUD4I3l1Tv0Hx6nGNQ0W4e3aJJi4frcVGKpeOZu1xZPePFV4Fq6OmM2xCkz
X-Received: by 2002:a05:6214:19e2:b0:6a0:994a:7d7a with SMTP id q2-20020a05621419e200b006a0994a7d7amr892593qvc.58.1714073564686;
        Thu, 25 Apr 2024 12:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714073564; cv=none;
        d=google.com; s=arc-20160816;
        b=OzB0PQSV2jLqLYUWbnFS1DDgsho0RUHVAAI5MwbvUM9qWWha7np2c2ToXCbnjYkkF9
         ihCyYu5cL4uaWes86w/kOu9KEPm73sz1V+fX47AScfLrklv49Ym1c+9IsWh7xY3j3zqC
         emhJsF4P/NVGph+h61N861XGA3Nyso0t1sBjKnov55EZ333TYWMnH1sd4h0lcNjgfrEv
         w5VPxJzRMAdeCvAzYtw/mKvGc2Pwjc2S3HgkJaIJJOUWqplRZNJZbFMggnyQjJcjhq7d
         0dNdRhFCbxb1oEnUGxWEHjjJGl6oVXSPmA9709kB0/JquuHQ/NdMe5tzQq7bQLsW0tUA
         FlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KTZxjBualWG7G5uD513wTTeGOZBcOOhsfmHgW/cBn20=;
        fh=xv5hSDWlmYPIbGGLKFn63kZYf2VNkwSUVO+4tRduDBU=;
        b=y7WIEL3WKR1wSPzEkOFbajCNA9r/Y3miduZmkXHF/IyEbL9j0W93lVRTMLJK7tqqzH
         QzodMUj2FzH2S0I8/2awd6SyhFjZI4r/p+hwyp9BOnbBMrjOd3wjtoOJ4Gfx3AH1vtOw
         C5nsP0bCZhfWeuDtmWJgculD7WUyiCU+9ETk3SB7HfnWi+70o9DuXDmmZxM32L4VfQJd
         GWkyGQIS9Q6arCDcKZ/V/FEo4hxWm1B9AOZLZri4bp8VyqZaiuchmH0bItok6uyKGDC2
         w6s17/tX5RGfXfh0nVSPYGUcc6+4367jTUm4xvqfIfal6MUKCq62Erazcyi9XndmNoeb
         5Ffw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VuvUSnLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85903000000b0043a204c7db6si4387189qty.282.2024.04.25.12.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 12:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VuvUSnLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s04pI-0002zG-Mu; Thu, 25 Apr 2024 15:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s04pD-0002uO-8v
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 15:32:08 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s04p2-0006C7-72
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 15:32:04 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5194cebd6caso1574242e87.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714073509; x=1714678309; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KTZxjBualWG7G5uD513wTTeGOZBcOOhsfmHgW/cBn20=;
 b=VuvUSnLPT6zN4Xlrc0Uds4wJUa59O+u+mKuJTwqcikeypjvY413KWoSjeHRvjuQQ+0
 YRkisOVcFBSd/MaL2kRrMN6gzC/m6efzeA/gAdzlkPpEixxO+Fj/NiebIfqvZrO+IjdH
 M0SUlU6iW7zo0WzxSO3IgMCDFV9yVgNfq0O7+gdkg2eDjmu1Fau9fCbwOo2sh4xPgVOb
 RXDIPDEa0zuaAUKW/I4qw9b+YaCndQBlCzcIKLE9t/BrhVMHNy3N6GmK6GNposfam8h8
 3DmdZHiHY7cpHxNcZWwrkFokiLMtnb63JIs4b4vKiSvQVnWIJD9IxNJ3eDaKHmaOXxDJ
 oKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714073509; x=1714678309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KTZxjBualWG7G5uD513wTTeGOZBcOOhsfmHgW/cBn20=;
 b=PIcU77T7tL6nXXQMWdy9LMt8BmmCj5ZTZ2t0dJSRRwzFql94WCHakMoeB4tvoe77ZR
 HjEQv0tB3DvqLPV46F+BgxMmXA1kSLiVJBWN3hPQKj9QKwpwDRrb3DyjVwsRA3Su6+D6
 caIG3uICZuV2J5RtV0EJc37/v2ZMaYwT8a3Panf8VqVkgCqIDbre3uStwqHA+VCKIcXY
 Od6rBB6axmNbpcsEU74+2oO/JKVpl5OC8NX2UpFzLfOZ7suLXyrQPGzvCik4meiwBbK7
 ibNGbAiwJwS7LtfxUUW/5xWeNeSOs3DlOcxTNKCDnHPDx4ADDHg4Iqu2xfue7WqKmeB5
 h0GA==
X-Gm-Message-State: AOJu0Yy4jALL2sEM8l2A5YLOBg+RS2l1Vc5KTeX8S/P1iwEmubsgV6xI
 m+4huzXDkrkg+klwajNDBrs3jZwKGGEjsBstqR01Z8MTEqGVzqe8Lt78dcjWithlvdcxxmd3BnV
 aDNBkQLoM3rRJsadixd0wKmmTeGgnBLySeLgEtdXJ4oK5Rwd9
X-Received: by 2002:a05:6512:480f:b0:51b:f0c7:a95c with SMTP id
 eo15-20020a056512480f00b0051bf0c7a95cmr219985lfb.8.1714073509261; Thu, 25 Apr
 2024 12:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240415151845.1564201-1-peter.maydell@linaro.org>
In-Reply-To: <20240415151845.1564201-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Apr 2024 20:31:38 +0100
Message-ID: <CAFEAcA86Frw=GcWdjOgXsbP+9dgGjQpxP79k=nKshPm9LK0QVQ@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: update sunxi kernel from armbian to 6.6.16
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZF6RDMmx79Wc

Whoops, forgot to cc the allwinner maintainers/reviewers on this.
Ping for review, please?

thanks
-- PMM

On Mon, 15 Apr 2024 at 16:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Linux kernel 5.10.16 binary for sunxi has been removed from
> apt.armbian.com. This means that the avocado tests for these machines
> will be skipped (status CANCEL) if the old binary isn't present in
> the avocado cache.
>
> Update to 6.6.16, in the same way we did in commit e384db41d8661
> when we moved to 5.10.16 in 2021.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2284
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> At this point in the release cycle I don't think I really want
> to put this into 9.0, though I could just about squeeze it in.
>
> cc'ing stable as an FYI -- since the tests fall back to the
> CANCEL status this doesn't break CI, so it's not a requirement
> to backport to any stable branches. But it would probably be
> preferable to get the coverage back on the stable branches so
> we can detect if we get something wrong on a backport of a
> patch that affects these machines.
> ---
>  tests/avocado/boot_linux_console.py | 70 ++++++++++++++---------------
>  tests/avocado/replay_kernel.py      |  8 ++--
>  2 files changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 989b65111c0..d0ab5aaa83a 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -646,12 +646,12 @@ def test_arm_cubieboard_initrd(self):
>          :avocado: tags=accel:tcg
>          """
>          deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>                        '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> @@ -690,12 +690,12 @@ def test_arm_cubieboard_sata(self):
>          :avocado: tags=accel:tcg
>          """
>          deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
>                        '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> @@ -872,13 +872,13 @@ def test_arm_bpim2u(self):
>          :avocado: tags=machine:bpim2u
>          :avocado: tags=accel:tcg
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
> -                   'linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = ('/usr/lib/linux-image-6.6.16-current-sunxi/'
>                      'sun8i-r40-bananapi-m2-ultra.dtb')
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>
> @@ -899,13 +899,13 @@ def test_arm_bpim2u_initrd(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=machine:bpim2u
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
> -                   'linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = ('/usr/lib/linux-image-6.6.16-current-sunxi/'
>                      'sun8i-r40-bananapi-m2-ultra.dtb')
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -946,13 +946,13 @@ def test_arm_bpim2u_gmac(self):
>          """
>          self.require_netdev('user')
>
> -        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
> -                   'linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = ('/usr/lib/linux-image-6.6.16-current-sunxi/'
>                      'sun8i-r40-bananapi-m2-ultra.dtb')
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
> @@ -1049,12 +1049,12 @@ def test_arm_orangepi(self):
>          :avocado: tags=accel:tcg
>          """
>          deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>
>          self.vm.set_console()
> @@ -1075,12 +1075,12 @@ def test_arm_orangepi_initrd(self):
>          :avocado: tags=machine:orangepi-pc
>          """
>          deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>                        '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> @@ -1121,12 +1121,12 @@ def test_arm_orangepi_sd(self):
>          self.require_netdev('user')
>
>          deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
>                        'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 10d99403a4c..0474f7b7c8e 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -203,12 +203,12 @@ def test_arm_cubieboard_initrd(self):
>          :avocado: tags=machine:cubieboard
>          """
>          deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
> -        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
> +        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-5.10.16-sunxi')
> -        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
> +                                            '/boot/vmlinuz-6.6.16-current-sunxi')
> +        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>                        '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> --
> 2.34.1
>
