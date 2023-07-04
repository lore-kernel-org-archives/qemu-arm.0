Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2901179ejy;
        Tue, 4 Jul 2023 06:15:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFC+1dHLi+O35d2hV2tghZYVeiZhG+fQJYcTqKLxznGEbD7Fd9PQgRBZRHfpbdEf5L7t/u9
X-Received: by 2002:ad4:46cf:0:b0:620:a1be:c74d with SMTP id pm15-20020ad446cf000000b00620a1bec74dmr10676655qvb.37.1688476554266;
        Tue, 04 Jul 2023 06:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688476554; cv=none;
        d=google.com; s=arc-20160816;
        b=gz57JhX9pNqXN45Xy+F/ktSCzndQ5XN/Mtvxm+gljhltuW2vtif0x6iM3nsHea6z4l
         y/ya9USWfeLgN3mPc69Xc4Bd2290WDXISXAywcCvFxqX5XmGAk/lHTsU0kdGzq041iWG
         beZOKLGoG9DmoW3gnCw9MinuUG7kbHfsMPyaebNZm9yeF30GOFVf6HgFIGJM6Uo6aNp2
         V9syimY7QEg8mAFqIZBzT2cUtvf9woM0ayq+TrBfU0YgH5XVEPYOC+jKz7v1L6BF7hC8
         gMk1qbyQjs4mxlJfwGQrXCNjv2zus1f5++Z1/0rAhRfga5m+c9T2dGcAfu1IbtjO0FjB
         a+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=duSIobqmJ+6xDh9LXiA95cPbM3Ke85YlO7/s8EEKSn8=;
        fh=AQXGUBcT0N97EA8iSl2gNjTGS0e2RNq/3s69kTQvUng=;
        b=jOctnbKNIkFL90/UoDdt5Ljnt0WLnHipve/EFxrTu/u/eE5XHTvI6JtyMOelV4V0SV
         ET9hY+c/f7OzXZB6xrMuC6LN8DidumpL3Z2HbaeBR26JdUP7kJ9GieGBGEFn43xa5By8
         guOe5S8vzTyS29H5H28Dv1w3ol51p5Muf0KOzP6R9u+F5uHJstmev/metXlG82NZuODR
         NYEmxW9kujkf87Hbw73EU/SLJN1VQ05LpZ4Aw6pBJ64d2XBr9Jxdm3UEDYZHq3x6xtob
         OkqngjGVGVDYZ77JDEgAteGEMY6c8j3izbWNFI3oZpjMas5IadWGOQaEKJyJ3qGb/mZ7
         7W1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JeKvD9om;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy12-20020a056214242c00b0063218553782si12425517qvb.614.2023.07.04.06.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 06:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JeKvD9om;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGfsf-0006Gf-E4; Tue, 04 Jul 2023 09:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfsc-0006B3-BL
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:15:44 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfsZ-0006F1-SN
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:15:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51d5569e4d1so5379386a12.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688476538; x=1691068538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=duSIobqmJ+6xDh9LXiA95cPbM3Ke85YlO7/s8EEKSn8=;
 b=JeKvD9omZveW6guUMQ09RNC/lqx62bG80WzBpLm3l5hdJ0YVu+FPX9FDqrUGvVZFZX
 Y+R5jzPYUmrcpSp1RTCaOPOOgZhNjhMtx5qHrWjI4ZcZQDpGnkbfSjxwAd4VfHygCChW
 enKpZeUcloDHDR02Pn06Lw3A0TV+8uZbzn9/DPKoAdO/5B4eH5tMz3lufUUpGLMkUlRp
 rzBElOUqxdShNvN6LU2/91Ls1XDVDR6RxAklLeHzdaakdEKh5i3D1rZGKpEZzcepUgOU
 EG0veGBaiuX9miN4QWRF2DG24/x2RJvGYsq9n5DLVWGQFGzGf9h3oNrp010AWvMrZSXY
 HjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688476538; x=1691068538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=duSIobqmJ+6xDh9LXiA95cPbM3Ke85YlO7/s8EEKSn8=;
 b=DsQC2e5rB01Ivi4x9geUbgN0NmqyIe0qgaFXIeNdllJU5ZGWcd4OEkaPw5QFKP+4Jv
 RvqExTs+oDjyItl/zvZkLlOX/Vlkzev6bcvyDnRX9f3HHJqawl/x1hLnHbsWNmZkOUpp
 FFazAIY2UgYreVucv/vIwcao84g6KCYfFTjclExuMy85WOymybSiHgR6rzc2fiLWDUNj
 veYf55BxsOlYXOxQCoY81GMZza8YmrqQWWXQBOi991mQapqeFh5KFo1ULPAZTfeljy6m
 CBz69+LP6+82Gro9gWopqXslQge35DtM4vGMSj3+QPPBpS7EGCq2aDXr3RQ7RkNzH90x
 kuEw==
X-Gm-Message-State: ABy/qLbCzWqfXbFjoaBUaxmFWrXpuRfZRITf1K2pH5jFSDppHdijRyxh
 ewtae0YJdl9x1/9w0M0BqFkidDC5nXdy1QCKCztWAw==
X-Received: by 2002:a05:6402:b2d:b0:51e:1a3c:e72e with SMTP id
 bo13-20020a0564020b2d00b0051e1a3ce72emr2163270edb.19.1688476537808; Tue, 04
 Jul 2023 06:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230628164821.16771-1-farosas@suse.de>
In-Reply-To: <20230628164821.16771-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 14:15:26 +0100
Message-ID: <CAFEAcA-Z+ThrYO7ycQxc7eVZzF5f+OinL7R=_Cm-SfQ3U8P6_Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HI1V978E2qjB

On Wed, 28 Jun 2023 at 17:48, Fabiano Rosas <farosas@suse.de> wrote:
>
> This code is only relevant when TCG is present in the build. Building
> with --disable-tcg --enable-xen on an x86 host we get:
>
> $ ../configure --target-list=x86_64-softmmu,aarch64-softmmu --disable-tcg --enable-xen
> $ make -j$(nproc)
> ...
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `m_sysreg_ptr':
>  ../target/arm/gdbstub.c:358: undefined reference to `arm_v7m_get_sp_ptr'
>  ../target/arm/gdbstub.c:361: undefined reference to `arm_v7m_get_sp_ptr'
>
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `arm_gdb_get_m_systemreg':
> ../target/arm/gdbstub.c:405: undefined reference to `arm_v7m_mrs_control'
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>



Applied to target-arm.next, thanks.

-- PMM
