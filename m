Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2639915ejf;
        Tue, 27 Feb 2024 04:33:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1K0/uquKg1Wd2Vd/Fdgj7Vc9CY3WvufK9ke/hUJ941is78PB9aMh1uOhBk9KntHTzfZvisF40ug4jpo08Gw0YGV4/ar2P
X-Google-Smtp-Source: AGHT+IGY8Ocj2iJD8oZImuz/xJVSJE81yeBj6rG4VzlQ4D7lTGNSP7VE2eUmCkguq6mzbPLkzSk1
X-Received: by 2002:a25:26c3:0:b0:dcd:aee6:fa9 with SMTP id m186-20020a2526c3000000b00dcdaee60fa9mr2061149ybm.53.1709037238129;
        Tue, 27 Feb 2024 04:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709037238; cv=none;
        d=google.com; s=arc-20160816;
        b=beTp/x0UF1FUttkmMCeCigMw43ZcULUK0ArgRMCJNmkb6cCuf0ip58X5337Bx/E8B+
         aNiGrjFJvbfxiGxj3K28w+L3jqfgQ2P8SxBHZkyQfkkBAxh4KHOV5pCjGEYFqr1zwUIl
         c5JqRWOIyxVaFGQX05Wm9S1OFn8FSqKqbO1/vncleUVrFIXbQltlXIriHL/vE7rauZkx
         oFnATlyJxF5j6amcbMFPSBG4FuOOxjUVjxh8JjDctXkOWIcYzEnqqZ/oGGzdP78ZBtoV
         BcjVgyHpp4Dj5Uu1Fhg9+mkp4+A58tvXcnfHBzYNt+ROGH0xaYVcul/rnuUz3YlmC6Ts
         c2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=r23O8HIQb7dtjo/BiOJDwMMH5t6omzMtKOwdsa/Qpq0=;
        fh=/ffop55fjSEcrpkvY5NaxExy7nKr7EoYK/Y+rNUi2WU=;
        b=CplNoCbesyy9p8ETkX965vLlTVx0Ccu4z6EMb1/ANwuZMgFg1spRA7lyfoiOHh5gPE
         GmudMg6rreo2FU6KBgNOGaOC9tLxuIIzSnkH+buN4NbS7S1UwmoJuG7+WiAiIlswZ8vI
         SWqAU/vZZscE+MQq+4ecpd83NbZcuC6przNob2wIxr/yyVCNVwJQ1lmgcyfUlvVi4Qep
         HVBvo8fzhbod3HeiJzTEfadM311vYhSXVuRUnDkuILrjXCmUmMDoqwSwWvdmKbXWvnBh
         CJw1sUSdzRDDKj+trPrWNmBH000sxWIYLwwGYkqSTZazyxIa8+eGHScEBfN1JAGCg7/g
         Psag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXMkEYxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020ac85c49000000b0042e6c203e22si7811190qtj.483.2024.02.27.04.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 04:33:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXMkEYxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reweT-0001Xy-I8; Tue, 27 Feb 2024 07:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1reweS-0001XC-1E
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 07:33:40 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1reweQ-0007s6-27
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 07:33:39 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso5225992a12.2
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 04:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709037216; x=1709642016; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r23O8HIQb7dtjo/BiOJDwMMH5t6omzMtKOwdsa/Qpq0=;
 b=gXMkEYxvBIdJRN9jBmLUmwE80gSwh2Tw4l4pw4K9tmfhEl0x3Z9HzSXZ9ROyzrJWrB
 FAa68j/WyttE7kLtQI/puce0CYF76zyHz0RZgxw43SpNfp5iL02luF6Pucb83tsTrDNU
 KVVnfRxmhqWa75r9Da0OLTmfjbG2zfK98CIkD91cfoSDnCq+SGPHZIgXzqJgEA22iGXj
 a0Cq4MojxXavNJFYooSS4KQI5tg9VyPurOHL32+ExXtsWSdIQ/weIDK1zPE+6zruuZIZ
 eIlRXeeeUycjfZS5aUQlov4RLXDpv40ThTBFiqUgnMQH5xy+HGgdKLfJhoVJnGI2XTFa
 ZOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709037216; x=1709642016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r23O8HIQb7dtjo/BiOJDwMMH5t6omzMtKOwdsa/Qpq0=;
 b=JEwyYxHiMCSyuoacZ4TeXFCwd4Iwl2qT69FKS80pSrsZ/6MwiHb95+D8dRjThTM/cm
 lKKfUIPRm1ULTwfDvrysQ7HJ2z1oyj1lZ42GXWVHBuZHHvV6zd6reg9MGUpa0KBBmbUs
 btk9dhat3Nq+0zM99YXdicjqokZjBGLpkffJE8Q3UM6+zP3MLF6HMUMQqTnq6XaAZaPX
 xkL2seYVy0XNaqevfCXL4maV+wjG3tEZIapfz5KoUPLg8YR7Wzu83BJ9B4dnzM+p8Czo
 n8QSlS/BdW+XHvCdKNhyyJvhdlHEEdT89VLmCOz+00K+7q62mgE5zvsX+98e5jwG9hHf
 9fFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCiQyx8pOb6ZR21QotFXc6JssDY+i2fkYdScTXb+gw8faLMaeLd2vG52CWQDSJW+/Nd6tO1AgXBVfKF5m/R77voxvV
X-Gm-Message-State: AOJu0Ywaq0Uh8x3njM6Bv7uQLYbwzdLoh5lGS5G3+F7/TUYXfjCA+X77
 cuSACG4NcgUoXag88ewfQfnhP9C8eBnvBYoATDYkw6IIu5l/z9kyza4O1axIYSplmV8uLzBOVRI
 a0Lv/ir+fdmJ/KHx2TsOKgT/vij4u/ouwU9EysA==
X-Received: by 2002:aa7:c908:0:b0:565:edd9:1acb with SMTP id
 b8-20020aa7c908000000b00565edd91acbmr4080278edt.23.1709037216608; Tue, 27 Feb
 2024 04:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20240227083948.5427-1-philmd@linaro.org>
 <CAFEAcA_SzY7nJd_s670g8qttsszLxynDiVXH-=7feyq-vVfixQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_SzY7nJd_s670g8qttsszLxynDiVXH-=7feyq-vVfixQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2024 12:33:25 +0000
Message-ID: <CAFEAcA8emi5=ra=LQrFYNO4_GdXCQbnaYS+4-m4SC2AQJ3E7gA@mail.gmail.com>
Subject: Re: [PULL 00/30] Misc HW patches for 2024-02-27
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: zC1nv5CqJq0g

On Tue, 27 Feb 2024 at 12:33, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 27 Feb 2024 at 08:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > The following changes since commit 03d496a992d98650315af41be7c0ca6de2a2=
8da1:
> >
> >   Merge tag 'pull-qapi-2024-02-26' of https://repo.or.cz/qemu/armbru in=
to staging (2024-02-26 11:22:32 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/philmd/qemu.git tags/hw-misc-20240227
> >
> > for you to fetch changes up to 0316482e876988f7526ebe62d579ad069f485957=
:
> >
> >   hw/ide: Include 'ide-internal.h' from current path (2024-02-27 09:37:=
30 +0100)
> >
> > ----------------------------------------------------------------
> > Misc HW patch queue
> >
> > hw: Remove sysbus_address_space() (Phil)
> > hw/nubus: Add nubus-virtio-mmio device (Mark)
> > hw/usb: Remove usb_bus_find() (Paolo)
> > hw/usb: Extract sysbus-ohci from ohci (Paolo)
> > hw/nvme: Fix invalid endian conversion
> > hw/i386: More PC machine housekeeping (Bernhard, Phil)
> > hw/ide: Restrict "ide-internal.h" (Zoltan, Phil)
> > qom: Expose object_resolve_type_unambiguous() (Paolo)
> >
> > ----------------------------------------------------------------
> >
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Whoops, wrong canned response again. I meant:


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
