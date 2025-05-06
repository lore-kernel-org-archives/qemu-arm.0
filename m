Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3155299njj;
        Tue, 6 May 2025 07:22:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUblAaVw1dzjIR6T9NQfMM0IbACuIIaeROgRiZxKy+sdYDI/al1LGiKEsC52l42AmvwtyKpw41wJyzdZA==@linaro.org
X-Google-Smtp-Source: AGHT+IG/Z7dwbT1rcsUYX+KChV9Uhiv9lrZ601wiSns/+X5XPm0w47TF/yA8BPFv+SvbASMF3V7K
X-Received: by 2002:a05:622a:6110:b0:476:fd53:287 with SMTP id d75a77b69052e-4910e1ca806mr48371001cf.44.1746541375339;
        Tue, 06 May 2025 07:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746541375; cv=none;
        d=google.com; s=arc-20240605;
        b=PSneaNRdE8mtmqoNMcW96PqdSXy0znbxRCUopQlby4NkpaLva02+bJQend66hR3YBT
         ci0AewHtn+RnV5BSsTMqejQn/BIBjGk7JSoZ2xhYpkruzj4rxPr/dd8Sr7HulpTW1qeh
         E/PT0zezvjYXfs402v+3W6HQQVsI1wuzJcygLWghI8mTGzOazhqG9r9PV/TbZckZ5p7Q
         AzRqX3GgwHf2Kx1VjoQhBaKiMIplN3fufWjjk1d3PDVoP4q/Ai6XsqAmREnSqe5OCRDK
         GiVTgJkTiWv+VL/VrKOOEhz4uC76FGV6DqOp4C9VuDlLtAXjYrGNW+9IBpimVJGCmOu2
         m3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=64Rnz8AtchK5mAHs45/m7F6frCvc++RT+Fb+aXU37TA=;
        fh=FXY2km0ss2oRZq6xYz6fU08HIb34qyzmox/BLlOb+M8=;
        b=Wi/qidEe+gSsqgbZp+QRbGDk8/KFHQVauNgbwlWjfHRCfUafqqXs1e/DLnKtXXrtXv
         UljCw55t6o9yIf4+WUomev0/o8q1VCs+C2XQA7NO1b9Wn7gFHXVzXPoBD9rsnpzhBSE+
         IB4rtkr7SFDx5W8KKMgKoRY1Jhv5b8+9a+mUfcPt0XJ9dmUO1VLIUhjRRrSpiJzn8VFO
         1LNfWzuoa7DdkTkNgnGBVWRlgxxOnYhvd0z2Wdynnuy4Sa57h3A8y29zOpUao2VSfac7
         7qNExkHa0tDNUdQo+E6j89I0KPvBXvnZYFob8wULezfmuu4O/5VkP3eiIE3HtoCmiFgW
         KpiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fL4YA10d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98246e13si122715781cf.249.2025.05.06.07.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 07:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fL4YA10d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCJBj-0006qO-80; Tue, 06 May 2025 10:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCJBh-0006pp-Li
 for qemu-arm@nongnu.org; Tue, 06 May 2025 10:22:25 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCJBf-0007O5-JZ
 for qemu-arm@nongnu.org; Tue, 06 May 2025 10:22:25 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6ff37565154so49577817b3.3
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746541342; x=1747146142; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64Rnz8AtchK5mAHs45/m7F6frCvc++RT+Fb+aXU37TA=;
 b=fL4YA10d2OoHjs7tQGAEdJ7Je23GjAcsJhy+2RIENH/XxSqaUQrrhIjl+b32q1u6m5
 Ba/4ODhbYpsZ0JH2gCyqimxhdy6uUUbbTD3be3KDbv0HrHUdKwFz6DeWYLK9fkUeqDBa
 TTzuS38oRu5Vh9SiOmhoIn7HvN4OR77vv1ZGxaKg5MT/bdBI6qCIw6n1Rnlaq0E4Gzz2
 p/qAKAXxd+ULMgQdq6GMO2NVnp34RrcIhf+vBsDuAq4kUt7hsnpbHMQWr7fGlG4yGtx4
 ebb3Mb373CmWUW/ZXEaZd4n6oXdnV6444W3UGCFpxlxQB28BV/Wr5F/Ry0U8kcr/ltxo
 CLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746541342; x=1747146142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64Rnz8AtchK5mAHs45/m7F6frCvc++RT+Fb+aXU37TA=;
 b=F+sNiuORw0bI19vz6MWBb4d1hbsmG9x4o+g0QNkEyFtFoTqh5YSWEsJw/ZrVFIsP2R
 4PrQk8ayTe3CACD//tECemTHjagnvAJKq/jEQkcTnls/CKRGtWuR0HHMvh9A+IQIRlOw
 e6eCjXsl29ueHus1akWx5KsCXdDQ6ImnAGYighOlieBZIPPhCXuqc0Y/BdP0Hu+jzlQD
 bpof3fyRg9q0cgqN7fIn9tI+dZ1+dxJIiTyeGpOG2qd6MRy/1KLqEJ/3Rfk+ZcVZddLI
 HVeijD6UFOXVGgqKUkCijlL9zaSkDYjyisA/7uBpGCabzr+DLqSgU/L78dKNIAoQX36B
 GHuA==
X-Gm-Message-State: AOJu0Yzh8HrNfYlXaioFSMU8fL4wMxFQbzjv+jIHaISXy4oTHGDcJW4C
 zmsrOzLsfZKilkrzY1xh8YV4LHEj+mF+/K71WGJvkhX4N0Xu96Ay2jeC8DHBgPKHSeAHdM7EKOY
 sBWHKb6OezI24grMy9tB37qoaZEwUgbCxE8SX4g==
X-Gm-Gg: ASbGncu40ZYvCXghmZwNlb8zfY8e9zWH6PVwOr96AZlTLmgKUuHkhvzwahSmNgyxyRJ
 DYS1UjzeoPFzDZzXZEPKCzbLfh+CADoAGLzxIHim6BFvT0tqCMUVlcsS4aVwGfmY3ncVX0z7v3V
 WvRqZ3yuiq1ABwszNHCVnqp/Y=
X-Received: by 2002:a05:690c:62c4:b0:6fe:c803:b471 with SMTP id
 00721157ae682-70919c48b14mr48462687b3.16.1746541341783; Tue, 06 May 2025
 07:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250505090635.778785-1-clg@redhat.com>
 <20250505090635.778785-23-clg@redhat.com>
In-Reply-To: <20250505090635.778785-23-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2025 15:22:09 +0100
X-Gm-Features: ATxdqUF8rVeFBKjoziXfEyTHC2du38Wk199AYHqKl3AJmkbrTmojp2bxdCqWoF8
Message-ID: <CAFEAcA8wmqAtcgfPvyMY8nujTWNCSC0DYO64aA5up-sTWCr_jA@mail.gmail.com>
Subject: Re: [PULL 22/23] tests/function/aspeed: Add functional test for
 ast2700fc
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Steven Lee <steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: 7TIfJgc49bNj

On Mon, 5 May 2025 at 10:12, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> From: Steven Lee <steven_lee@aspeedtech.com>
>
> Introduce a new test suite for ast2700fc machine.
> Rename the original test_aarch64_aspeed.py to
> test_aarch64_aspeed_ast2700.py.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Change-Id: I3855f55c9f6e5cca1270c179445f549f8d81f36c
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/20250505030618.3612042-1-steven_=
lee@aspeedtech.com
> [ clg: Added new tests in meson.build ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>

Hi; this new test seems to trigger an error in a clang-sanitizer
build; would you mind having a look?

 Output: qemu-system-aarch64: warning: hub port hub0port0 has no peer
qemu-system-aarch64: warning: hub 0 with no nics
qemu-system-aarch64: warning: netdev hub0port0 has no peer
qemu-system-aarch64: warning: nic ftgmac100.0 has no peer
qemu-system-aarch64: warning: nic ftgmac100.1 has no peer
qemu-system-aarch64: warning: nic ftgmac100.2 has no peer
qemu-system-aarch64: warning: requested NIC (#net038, model
unspecified) was not created (not supported by this machine?)
../../system/memory.c:2798:27: runtime error: null pointer passed as
argument 2, which is declared to never be null
/usr/include/stdlib.h:962:6: note: nonnull attribute specified here
    #0 0x617e4121b113 in flatview_lookup
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mem=
ory.c:2798:12
    #1 0x617e4121b113 in memory_region_find_rcu
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mem=
ory.c:2833:10
    #2 0x617e4121a5a9 in memory_region_find
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mem=
ory.c:2860:11
    #3 0x617e411c21ea in rom_check_and_register_reset
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/core/lo=
ader.c:1317:19
    #4 0x617e411d5ec7 in qdev_machine_creation_done
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/core/ma=
chine.c:1756:9
    #5 0x617e403d4877 in qemu_machine_creation_done
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.=
c:2782:5
    #6 0x617e403d4877 in qmp_x_exit_preconfig
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.=
c:2810:10
    #7 0x617e403d9a3c in qemu_init
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.=
c:3844:9
    #8 0x617e41301126 in main
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mai=
n.c:71:5
    #9 0x7faf8202a1c9 in __libc_start_call_main
csu/../sysdeps/nptl/libc_start_call_main.h:58:16
    #10 0x7faf8202a28a in __libc_start_main csu/../csu/libc-start.c:360:3
    #11 0x617e3f920654 in _start
(/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-aar=
ch64+0x161d654)
(BuildId: f3f8c2ca821e695937a615bee293c4a5a336a6bd)

SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
../../system/memory.c:2798:27


thanks
-- PMM
