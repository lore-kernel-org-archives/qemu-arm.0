Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2042927ejt;
        Sat, 17 Jun 2023 09:29:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QB7eQR72pgkDwPnTxrI7ERiUgsAiQtoyeOEHR+aCcQGh15Na8Uh0l3S6hKUZNaZ9ONFBG
X-Received: by 2002:a05:620a:2794:b0:762:3914:c228 with SMTP id g20-20020a05620a279400b007623914c228mr4926193qkp.25.1687019396813;
        Sat, 17 Jun 2023 09:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687019396; cv=none;
        d=google.com; s=arc-20160816;
        b=jUS8cNNVtAiTafJ+UfPF1oQkCJ+xFBwVu3bZ5NoQG1QD/VsgL4mBc6zeyy2A9p3dD5
         /j+bGb2JBHX/HbLacMeFt9WEGrG5W0eVGmK50hLfi6Y3WjIe32KFndnMdxrhq3nw6vJ6
         DG+DTmXyBU8T4EsaBuEOyw7z6qipQuFEUscWm5z3eQxxRWPwr8oz5hvknI6hbyII0p1f
         KJHzv1/vj1sZu7Dvmlxs+MNGP+B8wnSBIZ1nfcStubTea+v06CFJ0tcizpnTsyi03Slo
         8m3EEiKwB2V+USzaEPt1Zv+KCbn+0ddmcGfhIxwrBY1M4W3/83KZ5ljyYueS/P+6L67H
         JKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=UC0WZ1iLB7KfiKCzBrUpb7aP74SXGeOkUlOI7XZOdnE=;
        b=xcobUGirV8E+KUlHbJLjSEvIdFAPUrh208StIE2TW9NJln6nLxGYJQRBvP1GsFCroa
         tmcW8tJShbtOI8jNjjQ4W674hZT724NSBg04HSJUPmlcIf5nkvrhDSyP2Gfd0VghmXDI
         YR7NjPqZggj8sJdi42ypYTwrPGRZlI+rFAlTb2sYrVjOZ8kM3FZ5PSF5lR7GU0TE5kW6
         Pemx9WwPeRVLBHy9FZFYLWn4p8rmw9H56WPQHV+1Tqm1UkOS2d1uClPZWaoMqGSujC1b
         +uzS/1W4j/PPTixbe1VRgwUnxG4lJEQOTPiqkq4QSae4wwVuU5o5YGPC+YYGxQ59Xc6p
         mTrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=PSA9rh6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a37e209000000b0075f50f549b5si8662115qki.638.2023.06.17.09.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jun 2023 09:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=PSA9rh6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qAYo2-0001Wz-NU; Sat, 17 Jun 2023 12:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qAYo1-0001WF-P6; Sat, 17 Jun 2023 12:29:41 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qAYnz-0003TU-Ik; Sat, 17 Jun 2023 12:29:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-666ecb21f86so1074947b3a.3; 
 Sat, 17 Jun 2023 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687019377; x=1689611377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=UC0WZ1iLB7KfiKCzBrUpb7aP74SXGeOkUlOI7XZOdnE=;
 b=PSA9rh6IttZKgUQztJpkD2Q7u1P7GxQaQ0ektW4q7AasRaBPxyIDfiarvRwkEEJg1H
 4F/fuIoThEQUxHZlXJEEvIt6tgy2slxNkXen1v0uMAeGRsZJLsiMyadhAWAY38N9DCB7
 uSanqd1ehzf9h4JQSnjPpwAPsoKlHHVSC5Mf82deXysXMKoTraLvnV/88T0lPnyutwtz
 bquuJayI5asQNf31BpvkEEH5i6x+MZd9GaVOpWAdrzy82K6IttudQvYc1QVXvNnRnmur
 L2QknaDmxeTF7GcTyha23kXmGnWsdVHu5OFYxpzH4RPK6yndCS7o9Jj0tNI9NEvUfj8+
 84nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687019377; x=1689611377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UC0WZ1iLB7KfiKCzBrUpb7aP74SXGeOkUlOI7XZOdnE=;
 b=dtOgyDQ/y7oc945XvbwSzv0B9OF0EYkWTue9vnEBbQZ3khaK3+GmGDSi9EHuk4h2Nn
 NUFArEF3LQ+7SQBzkO9HgZNAy9CCultrU4p392toIw04RvDh7bz5KLljMHCkq9TtUR7m
 J4MmMOeCk3gKq0rx1QR31Pz09kksCuLGsx1nPAK4ZFFuOReqqGAFQYjIXrLwrDzMmDEV
 pHxvioKvOkd5pfG1SS7/KrclO2VErPMiOhBur4wDf6ATRWjkoHLCjBH6/rJyrq8GdnKN
 fCvBLBquwAhqw2TVAofsXcSGWacqfMbKn4hr5SJhsDIj/uBapbM3cH8UdCQSCNsc7WE/
 /ZNQ==
X-Gm-Message-State: AC+VfDx6tQSQBDu4YIMlaSVfUrC9KnFT7L4YGB5CbZkeueb75rJaaY84
 IFXCPcIvpayAYT5j6jtGw8o=
X-Received: by 2002:a05:6a20:2454:b0:10b:ca02:1a5e with SMTP id
 t20-20020a056a20245400b0010bca021a5emr6757027pzc.55.1687019377445; 
 Sat, 17 Jun 2023 09:29:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a63ff52000000b0054fa8539681sm8842317pgk.34.2023.06.17.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 09:29:36 -0700 (PDT)
Date: Sat, 17 Jun 2023 09:29:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH v5 01/11] hw: arm: Add bananapi M2-Ultra and
 allwinner-r40 support
Message-ID: <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <20230523100508.32564-2-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523100508.32564-2-qianfanguijin@163.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: reUNcAyWX+5o

Hi,

On Tue, May 23, 2023 at 06:04:58PM +0800, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,
> and a Mali400 MP2 GPU from ARM. It's also known as the Allwinner T3
> for In-Car Entertainment usage, A40i and A40pro are variants that
> differ in applicable temperatures range (industrial and military).
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

I tried this in mainline linux with the following command.

qemu-system-arm -M bpim2u \
	-kernel arch/arm/boot/zImage -no-reboot \
	-snapshot -drive file=rootfs-armv7a.ext2,format=raw,if=sd \
	-nic user \
	--append "root=/dev/mmcblk0 rootwait console=ttyS0,115200" \
	-dtb arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb \
	-nographic -monitor null -serial stdio

Main problem is that the SD card gets instantiated randomly to
mmc0, mmc1, or mmc2, making it all but impossible to specify a
root file system device. The non-instantiated cards are always
reported as non-removable, including mmc0. Example:

mmc0: Failed to initialize a non-removable card

Using "-sd <file>" instead of "-drive file=<file>" does not
make a difference.

I can fix (work around ?) the problem by adding the following information
to the devicetree file.

        aliases {
                ethernet0 = &gmac;
                serial0 = &uart0;
+               mmc0 = &mmc0;
+               mmc1 = &mmc1;
+               mmc2 = &mmc2;
        };

Linux upstream commits fa2d0aa96941 and 2a43322ca7f3 describe the
logic behind this change.

Is this a bug in the Linux kernel, or a problem with the qemu emulation ?
Either case, is there a way to specify a qemu command line that doesn't
result in random assignments of the provided drive to mmc0/1/2 ?

Thanks,
Guenter
