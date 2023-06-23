Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp268784ejn;
        Fri, 23 Jun 2023 10:37:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pBqwoLh6ADMY0kPtnDZQMzKoHzdTHK9M13Hz+Zql6zyD8Ci+kier50ULjcfZVKyIgZo9k
X-Received: by 2002:ad4:5be5:0:b0:634:6e1f:29ec with SMTP id k5-20020ad45be5000000b006346e1f29ecmr276237qvc.37.1687541846109;
        Fri, 23 Jun 2023 10:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687541846; cv=none;
        d=google.com; s=arc-20160816;
        b=PrvF7x0xWpB9hb6g8Zw99xpl5vFY5gi1XFOO6Jxwge/oG1hGYH+pUhvGyCEd/HXAu0
         /1yR5SsbeUnIz7SbSKk5xskAj6yiOVyy+skQMLa38t4OaS0wH1dV7lulSQ6t3aC4uFqN
         yDBWn3rSILZ7aoE6QjXCE1LTwOWKYLSl04cO2NLvsJ057SKdW5g3aBiNs9nJ0IG4ZRNT
         rXP0gZTsN/JY8s9Sw+W3dOpf7BJ0LWvnfc1YJdCdFhr7SyJs4fYF3hXfIZ9bjzJGa+fe
         6jphMN6uevFvxjdUKKIjJrkEZj+qyxJGG0Dep2GFzR/wSPBaLe3jvLmatlf+tqqUyHCt
         N2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=kvbYavrrZ/b3ZYTQHWLJz2aS3Re5dZbFrgauqNrMUZw=;
        b=phpL2kO6hP5O4KVqxRYh910BFbqjk9MApuqFWKWZEnTdhzM0FVlMF5e8fRE3XxUDBv
         sHkILIsLksL6+GOZ3Lbekormgu0opKZqUel3bqtHd1eu20PxOrvmEebZMtRcNSLLLBUr
         NFe0vb3IrkBQ9GRc9ovDbiTw3Mr9jR+Pmm4rVZ8hMJ3O1WRCnq72zGnyUAMnzRfk5Ca9
         ts+Ffq3lR1NBVrdBQ7ApFqic/P3QuO8ev3pqQPtAEMn7LU0pAWHXY3l7EvX3nq5AvdeK
         ILtWRB8S1aiRGFe8iwfHlL5Qdmg+FjC4WzfcJZaFf2FBOO5LI4kcIcUKqTkhEf0nJj/F
         twHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b="YJ+SYi/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a05622a110a00b003f86195769dsi3784016qty.408.2023.06.23.10.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 10:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b="YJ+SYi/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCkid-0003aI-Nj; Fri, 23 Jun 2023 13:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qCkiU-0003Zm-D4; Fri, 23 Jun 2023 13:37:03 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qCkiR-0008W7-VH; Fri, 23 Jun 2023 13:37:01 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b72329b63eso758962a34.0; 
 Fri, 23 Jun 2023 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687541817; x=1690133817;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kvbYavrrZ/b3ZYTQHWLJz2aS3Re5dZbFrgauqNrMUZw=;
 b=YJ+SYi/RbZe9gNYO/e2O0m/NmKr7Dlc9wKZLVKW3xXqCnSSaznZNvEhsFPS8MCok6y
 WTtZgAGD/ZXwM0afFvfGna/WROY13qnClFi76Ek1aks0WV6vnPYLgwxxhOgAmsPcGScd
 oi+gNv3B8MR58otMKjExKnVuD699LEfUvKMzzfNI9B634xID4QA78WK8PYWBTxLnPdUN
 Ro+BEAcdTWDvMJTWWvXQee7jMFUZZgCkg7g5kIHeC2OK8Nrd2GaXSQu2C6HRKtpLqR3m
 J97BbHIo9l0mmoAwjzap3njiUosaqxU6B2HZQ8PN4vrqEjh/QrEKNFM+QlG3HFbZyiFA
 YsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687541817; x=1690133817;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvbYavrrZ/b3ZYTQHWLJz2aS3Re5dZbFrgauqNrMUZw=;
 b=dFo2TkzgmjtHoq9lRgrkweUMN0SppUZwtqjkUjs4fpWKiQ27HgGgG7zKdFz/xx7vfI
 EpH1wgg9vDpLwK84aZxnLJ/R8wv+qtwccdJMu4JHCSflyLRxEGvofVSCAe+pVesKtBBZ
 3E0eTvhzlV25cBF1Fp0c7LeDbLbWQFvI3WnJ7l3ns6PZPuVMFN89+ozZbA37sxXrS1yo
 nYK+3C+/++SOMuYClPP+dBaOSCqGG71NghjkPZtDESb5jcIE9Kxk5v/rim64ediJ5DtF
 YK6Ew8B+xTzSSDKbAPdcxuMwAU8e0ArUZrDljqmoDwpPGfp2RspjmqZnbXQDuueWPy+9
 rRtw==
X-Gm-Message-State: AC+VfDyFpblBpCKhX1CAKMPBpjaBRiXlo1/OFtRk+lcCMeXJUySWpWbq
 4vDkdBp9ETYHKTks+fT4Lko=
X-Received: by 2002:a05:6359:282:b0:123:26fe:3346 with SMTP id
 ek2-20020a056359028200b0012326fe3346mr16317905rwb.2.1687541817383; 
 Fri, 23 Jun 2023 10:36:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a63f017000000b00528513c6bbcsm6642494pgh.28.2023.06.23.10.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 10:36:56 -0700 (PDT)
Date: Fri, 23 Jun 2023 10:36:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: qianfan <qianfanguijin@163.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH v5 01/11] hw: arm: Add bananapi M2-Ultra and
 allwinner-r40 support
Message-ID: <b8954841-db12-46ae-b92a-d805eb446a69@roeck-us.net>
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <20230523100508.32564-2-qianfanguijin@163.com>
 <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
 <10cf3c5e-655d-fc8b-cf48-3949588c2dcf@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10cf3c5e-655d-fc8b-cf48-3949588c2dcf@163.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-TUID: sNMTFstHrpd/

On Sun, Jun 18, 2023 at 08:40:28AM +0800, qianfan wrote:
> 
> 在 2023/6/18 0:29, Guenter Roeck 写道:
> > Hi,
> > 
> > On Tue, May 23, 2023 at 06:04:58PM +0800, qianfanguijin@163.com wrote:
> > > From: qianfan Zhao <qianfanguijin@163.com>
> > > 
> > > Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,
> > > and a Mali400 MP2 GPU from ARM. It's also known as the Allwinner T3
> > > for In-Car Entertainment usage, A40i and A40pro are variants that
> > > differ in applicable temperatures range (industrial and military).
> > > 
> > > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > > Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > I tried this in mainline linux with the following command.
> > 
> > qemu-system-arm -M bpim2u \
> > 	-kernel arch/arm/boot/zImage -no-reboot \
> > 	-snapshot -drive file=rootfs-armv7a.ext2,format=raw,if=sd \
> > 	-nic user \
> > 	--append "root=/dev/mmcblk0 rootwait console=ttyS0,115200" \
> > 	-dtb arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb \
> > 	-nographic -monitor null -serial stdio
> > 
> > Main problem is that the SD card gets instantiated randomly to
> > mmc0, mmc1, or mmc2, making it all but impossible to specify a
> > root file system device. The non-instantiated cards are always
> > reported as non-removable, including mmc0. Example:
> > 
> > mmc0: Failed to initialize a non-removable card
> > 
> > Using "-sd <file>" instead of "-drive file=<file>" does not
> > make a difference.
> > 
> > I can fix (work around ?) the problem by adding the following information
> > to the devicetree file.
> > 
> >          aliases {
> >                  ethernet0 = &gmac;
> >                  serial0 = &uart0;
> > +               mmc0 = &mmc0;
> > +               mmc1 = &mmc1;
> > +               mmc2 = &mmc2;
> >          };
> > 
> > Linux upstream commits fa2d0aa96941 and 2a43322ca7f3 describe the
> > logic behind this change.
> > 
> > Is this a bug in the Linux kernel, or a problem with the qemu emulation ?
> 
> On my work, the linux kenrel doesn't startup ext4 rootfs directly, it start
> 
> a custom ramdisk and we can handle this in ramdisk scripts.
> 

That won't help for automated testing.
I guess that means the answer to my question below is "no".

Thanks,
Guenter

> > Either case, is there a way to specify a qemu command line that doesn't
> > result in random assignments of the provided drive to mmc0/1/2 ?
> > 
> > Thanks,
> > Guenter
> 
