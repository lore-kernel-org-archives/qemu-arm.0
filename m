Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3053543ejb;
        Sun, 18 Dec 2022 14:58:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuARO9lkaiuyzQzUQRJGkF1Ybxxy4Ov5SjwbxhcKe4pkseCezTjHgq8pwlC3njCig1H04gZ
X-Received: by 2002:a05:622a:5988:b0:3a9:7ce2:4c53 with SMTP id gb8-20020a05622a598800b003a97ce24c53mr10051913qtb.51.1671404281728;
        Sun, 18 Dec 2022 14:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671404281; cv=none;
        d=google.com; s=arc-20160816;
        b=sXUz0upAPLIRrefhpg26HWDVxu8b2AYJJYrdba8EDOqFFWMmQozpGfjz0lyOWj9X50
         DtpfdxhziyZQN3u+QUmnmX/z2pE40D9/JUgxtjJrUGHbNv4wyTjrk3Fd2Hlg/W3ola1j
         HvQZiX5yNS7r133WfaY5byyxPA6IxqVVQwhfv8R7xAKs6DeibMHZ8LYLD4rtGprzWKnh
         Uo9dA6KwgUZFX2Wi8aDpgp8qkgjLP8JtdCmy2Oo3gGKfBxRYT+qXvHzHdZsRJHZ+fUbu
         po+DdjhXmsL1Tlh79bkJvD24rVN/M0xDWyq7STqdTkle9unEVbvbGABts7rcIVJRRWII
         zKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VfDRzlacng2hzCqiBZS4SZGnuAAu26j9vz4rHY9/+vg=;
        b=gSucfDsZgP/GOQI+KbFLu5KMvmv+8qzpN29Crk88DNZR/WRBADYkW009028/od/tBN
         6eGr5Fupqc6cfecHZ8/605Mb4vo1n5xJAUxZKx22xLG0biMJlp4YJP4t8RgBU0/dDk/U
         jkAXLyAI8SlSmIoXwD6wXxaGxFnJOGDyArvAhJo8/Q+ILny3KlMoelbzyuBisKXr9l1O
         UrHET3IOZPT46cKPveYTsrJ0azlNIyebgxgzVwv6akAU5sJvA6yWCJlU+Gs39YdMh5+d
         rZKsKqW+pd9Ws7mvepIqek/RRnMvtSpnWvAcOTOmJPGs+JbRhKQZY4QeXWEtwEWcajco
         VY7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PtPLraLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea10-20020a05620a488a00b006fa124531c0si1793206qkb.205.2022.12.18.14.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 14:58:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PtPLraLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p72bJ-0003XJ-2q; Sun, 18 Dec 2022 17:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p72bC-0003Wu-IT; Sun, 18 Dec 2022 17:57:38 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p72bB-0003Zz-0I; Sun, 18 Dec 2022 17:57:38 -0500
Received: by mail-ed1-x52f.google.com with SMTP id d20so10747655edn.0;
 Sun, 18 Dec 2022 14:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfDRzlacng2hzCqiBZS4SZGnuAAu26j9vz4rHY9/+vg=;
 b=PtPLraLBbXKdOipgMCIE7wiZqG3Mm8MXTf2oLdApvBCdb4lHmHdGtCf8I5PYunOqoc
 isQpYvdCE+EY0njuW22DNDanky8ld6+oZe0Qfy/143r2CIdjv/Lld1Q8UkmoOOjdHLfQ
 cp7OwE5PDfvmK2+JuOlrWlu14dnkuKwmOBB5idi7rv7nzx7dPVXqoZzrRxmhIMdThbRE
 FoiZxQVKs0b4iGUCF96wbdW8Y37Br4A67PoUgy6v7lcoENo29Guo9eSOLyL30iFgHsDL
 Otw4cFdiaoS4+ziJzj3ksNi5GPpBM2i4scRcQRQef0zd56JXTs6emz+cu2ldv8s6GlEq
 ppCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfDRzlacng2hzCqiBZS4SZGnuAAu26j9vz4rHY9/+vg=;
 b=KPybFZNFIMpri0ZNAHDF3MvLVGcHKJjz8dSZu2I8vetRGuRJlnFRoqUcH/laNpSn0x
 HxDboB+7sNRNIdJ6qgWXMJKOzQrP9UUP/wTgRerhyFRt/Jsf0a9y/g0WSCXjL+jHDMq9
 kgZNQ7oDKosTfuvPSZzjOtIy5xkJ5RB6WDMKsc6PXNrqxCcjMAdEf3NrQNRAdH427C18
 diuaJWts9i4pHoQI/Vgx7DqXVIY74mOjvtoriX9j0XHxJyIIGuAmI/XNs+QmUfKDZ7W8
 LIEbcqaSLxAS6027a+Z0M25KkGIuZvsbV7pDNS+DICcTYGjpD+gd5UQ7C6nrmQnJ9gRQ
 Cl7g==
X-Gm-Message-State: ANoB5plupll5c5Vv50o5le+XMy/qGhZ/I8ayutDqOl0QSL3/kIX45wjd
 nWlXdJCdLtVGOytPR1uYCEFf7CCuOmZ4h/UJMZE=
X-Received: by 2002:aa7:dd45:0:b0:45a:3c66:b0e4 with SMTP id
 o5-20020aa7dd45000000b0045a3c66b0e4mr89921184edw.33.1671404254748; Sun, 18
 Dec 2022 14:57:34 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
 <CABtshVRUevNjOucUwtKW-sccUAADRe-9JBbYHd8UMGf0YPJXSw@mail.gmail.com>
In-Reply-To: <CABtshVRUevNjOucUwtKW-sccUAADRe-9JBbYHd8UMGf0YPJXSw@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 23:57:23 +0100
Message-ID: <CABtshVSY+UxMEfh_=NCw9ws0VrEnjkgzoMspg4wfG9Jr_ZZc=w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: DOAmLVpyQmsz

Hi,

I just looked around a bit more. Would OpenWrt image be acceptable?
It looks like there are releases for cubieboard that are kept for a
longer time, and I just checked that they work properly, so I could
add them to the acceptance test.

Best regards,
Strahinja

On Sun, Dec 18, 2022 at 11:34 PM Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> Hi,
>
>
> On Sun, Dec 18, 2022 at 11:17 PM Philippe Mathieu-Daud=C3=A9
> <philmd@linaro.org> wrote:
> >
> > On 18/12/22 22:19, Strahinja Jankovic wrote:
> > > This patch series adds missing Allwinner A10 modules needed for
> > > successful SPL boot:
> > > - Clock controller module
> > > - DRAM controller
> > > - I2C0 controller (added also for Allwinner H3 since it is the same)
> > > - AXP-209 connected to I2C0 bus
> > >
> > > It also updates Allwinner A10 emulation so SPL is copied from attache=
d
> > > SD card if `-kernel` parameter is not passed when starting QEMU
> > > (approach adapted from Allwinner H3 implementation).
> > >
> > > Boot from SD card has been tested with Cubieboard Armbian SD card ima=
ge and custom
> > > Yocto image built for Cubieboard.
> > > Example usage for Armbian image:
> > > qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_=
Cubieboard_kinetic_edge_6.0.7.img
> >
> > As a follow-up, could you add a test similar to
> > test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.py=
?
> >
> > This test could be refactored as do_test_arm_allwinner_armbian(), calle=
d
> > for orangepi and cubieboard with the corresponding url / hash.
>
> I was planning to do it (I already have a patch for cubieboard), but
> there is a problem with finding a stable-enough image for cubieboard
> for automated testing.
> Unfortunately, Cubieboard does not have supported Armbian images as
> OrangePi-PC has (it only has weekly builds). From the images that can
> be found on archive.armbian.com, there is only one bionic image
> (21.02) and it won't boot because it hangs due to the musb issue (I
> tried both with my patches and without, by extracting
> kernel/dtb/initrd). Other images are focal, but for some reason, in
> those images it is impossible to interrupt U-Boot (tested with 21.08),
> so I could not append to bootcmd to make boot process more verbose and
> easier to monitor for automated testing.
>
> That is why, for now, I would suggest not updating the SPL/SD boot
> test for Cubieboard.
>
> Best regards,
> Strahinja
