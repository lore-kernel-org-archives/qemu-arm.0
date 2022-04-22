Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp121358lfk;
        Thu, 21 Apr 2022 19:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKws0apeWHyhGUm4SfXXo5wtgeuzokPm0GPLvAInUHe9bx90MJonKO8IEKdWsjuvthGQo2
X-Received: by 2002:a05:6214:21c1:b0:450:5583:6596 with SMTP id d1-20020a05621421c100b0045055836596mr2019346qvh.15.1650593649969;
        Thu, 21 Apr 2022 19:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650593649; cv=none;
        d=google.com; s=arc-20160816;
        b=VS6F6w9LND6mGhKEDEAvltPIRbItd8jVb0vckHUG4Ubrt/UgiVOwSm+9MBa2m5TYjH
         Yuzu3jVpiJNeLJzBC+rlEL7zfMtY07aKLQHi5luzfKPDypS04FvqVUlBD7FzOhHOJiyl
         yxcToavpvpc1p0dyJhWYabfZjkjarOhV0BsVfaRpvHZY6hhkwTEi+hQSaBCodfSR0DRl
         zyCZOkgJgh19wTCBkcp9GO8OBBd/EL2nD/RAnOxtSSWrFGGnmxsBDaQxk5kjYAvetxNG
         lUuz6LegQvli3Qx5EEpIztv3cUrM2+VHCHzP7LwyY6mutub8YdZAeg8u1C0F7GZyF9cq
         xgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1I+LQYReg0CnXp6WlfnRD0aOzelZmrk0tDVMoTysREY=;
        b=BPTUEoRxGXe05zoi9njEmbu0/ZW3NhIkmY9c/ZrysN0mdNpQTV0Lh9fp+AdCDYvDG8
         XxfFzVFUoti9CygfjC+4/Fj1vFVrk8uiW73E1JAXF8mTcKs1w4qkz/gZ8P9oRjPsMvRD
         RS9YkCFPxCnv9P3prFrk5PMrT7Skl+2Ezl57K7eMMBvG0YdkY+UjltsKRKrbTMTZiBfO
         ULScgmv8kh60JB5S3yeJRund/VvhczU1kZ0xlt5Ij4/p9Lx/9dQrDZAJKJDomuAlY5IS
         8QdFAv//IvCHJUMV3PiVM8krfiRZoxs7dAckLvWvy89NDhz+TufRX3WVz70Os+huw9gB
         NbKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=EWeTcOVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24-20020a05620a075800b0069e588e29aesi1701905qki.303.2022.04.21.19.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 19:14:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=EWeTcOVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhioD-0000sM-HO
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 22:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhinT-0008EA-9y; Thu, 21 Apr 2022 22:13:23 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:33184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhinR-0001cm-IH; Thu, 21 Apr 2022 22:13:22 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2eba37104a2so71857747b3.0; 
 Thu, 21 Apr 2022 19:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1I+LQYReg0CnXp6WlfnRD0aOzelZmrk0tDVMoTysREY=;
 b=EWeTcOVt/9rewS9qxUnjpFehj/M7IGTGnfYwd8IsFTBVlhqzBkFk5+D7CrB0G0vosn
 W8H6BFcKfyP20Fa/D3fnbWCQ1dX/G0+OEWyJD1M2rXRzNieOFE6JN6/nJM26bykzvEfU
 vamPrwQxFtBt5al7rEBfcmYo6WswOmjxBleF7ci9y/YJpM56AOxFvDtyG4YueJBMi1AR
 xh4NBkfZGUAjAOA2HjiC3G2aa0fp3euLtBSRNuMlqthTxEwT3ePP09R60Ej/6NhV4q25
 UM9PS4n84AbxuWdk7lsuUiSQ/Ax0Rpf/yUo3dpfsgZlbRLRRubScSKVRfiE/UYt3dhQ1
 +RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1I+LQYReg0CnXp6WlfnRD0aOzelZmrk0tDVMoTysREY=;
 b=uYKf0TnkuI/408oMl+4wQDbdh0/tuuNh33f/LiInBUYhTUvhzjWb0IIcxXByNuDM1W
 vTIsj0phOj9nZBeVnuX4F20SbRq+m4A/3t2E9315Un05/0tAnquFGM84GTZ3HpIdyoau
 vva73QuFtybhmnu54jk9MNIS1X+yvSXFmVwI92ecRQ6Ad7MCBroisT+8EmVgTVIifPkf
 v7E81Ti1+RvY9GuF5uCVTgx9fQq1NykJ+oHdpLvz3lzksvoF9N2gCJGWpMrGDh7p/6CR
 dKCdDjQ4FdQvXR+VSGcxAn0YorK/iD0z1AA4cHKG6SnRQTV+8D1sFXIQL2WvGWR/fWh8
 iTlg==
X-Gm-Message-State: AOAM530Vue3l0RT5hDii26YWhBD5BgFGOA/f2tqERvkB3pNa64JklMyR
 Ece0bl2MMdbhv/M1e6+08H2NJxgE2nz6Nn2b9mY=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr2713534ywk.209.1650593599848; Thu, 21
 Apr 2022 19:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:13:07 +0800
Message-ID: <CAEUhbmVRjbJWWRBEav1jEv79+rK-7f_89H=SKrnfw+COvMkZuQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/riscv: Enable TPM backends
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+/daN027NpA

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Imply the TPM sysbus devices. This allows users to add TPM devices to
> the RISC-V virt board.
>
> This was tested by first creating an emulated TPM device:
>
>     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
>         --ctrl type=unixio,path=swtpm-sock
>
> Then launching QEMU with:
>
>     -chardev socket,id=chrtpm,path=swtpm-sock \
>     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>     -device tpm-tis-device,tpmdev=tpm0
>
> The TPM device can be seen in the memory tree and the generated device
> tree.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/riscv/virt.c  | 4 ++++
>  hw/riscv/Kconfig | 1 +
>  2 files changed, 5 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
