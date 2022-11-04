Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1119817ejx;
        Fri, 4 Nov 2022 18:02:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xONJXO+pjXkXNcss0PpJtxDZS2kOJwNcQSUNhMxRVlWWXbC0KS9QoM4GzPnpZMFe9Kgxu
X-Received: by 2002:a05:622a:5147:b0:3a5:2640:58ad with SMTP id ew7-20020a05622a514700b003a5264058admr24628679qtb.572.1667610144109;
        Fri, 04 Nov 2022 18:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667610144; cv=none;
        d=google.com; s=arc-20160816;
        b=yUqcCrPPUqU5z+wivCbfduncQ6jPeNsdPU/OsnrXWyn5m9tz9X+oD/h8/uxiytJ1YQ
         Vg42k95e3aU9OsDAI+XGjOtx2nVdP3AV0Ki80nshxGiZOHPJzfqRNGHAaESHmNr+e02m
         Sy7L53+qWpQQI3+J7D/sxe3Heu/rmiu9FNEy1i50vgjTfUdO13rZUt/mHZznKAheYGRA
         VhqUqg+KK3JgeFaD6DnK3bxGDglNrprJpShreZUVZPjDfoUWc/uoAeYtiP1ve1gFtqg7
         ZBgsCqCG240Awap1lBQuA4WysciNEDml/L63arWmYCsboybLEqCdKGEKfySBAnXyZspR
         g7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hkHIhcKpIBqFJ9IP7ONHZ3Bmh3vKBlK4LOwJH1e4uVE=;
        b=JTYBv1euHlT2+44gHJcTbQl4OZfu3fio8t4qjqe0yLpIHc5X2hfJDMkiaN6PiHc/go
         sklFsn+uYgZECU2R2vVvpNoGIgle68S3r1swN9dzpo6M+ILK5453JEXOR1HfbcDQO68V
         vZkQI/q2xd9Wlf7nVLR+snPI2oOpYK7VFGL3UFdzwe9U6OSLTClp9HVucPQG6C0kRbsJ
         3QBXqZe6wsbiKuKLDCWeLgbgYoYnF7kSyZu00nuCfUDMBR2t3Od9xCuFvPNscztmdqpE
         r7bRyZF2UX+1mLNKpi18OxAk5CQqBddB3DcvGLjpSOEnB5VE9er+hsh6+9lIW72jGA26
         7Yqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=okX9igMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm37-20020a05620a19a500b006ee9f809e1dsi495372qkb.85.2022.11.04.18.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Nov 2022 18:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=okX9igMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1or7Zb-0004xP-Qu; Fri, 04 Nov 2022 21:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kiron.r.sen@gmail.com>)
 id 1or4BB-0004BR-LD
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 17:24:45 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kiron.r.sen@gmail.com>)
 id 1or4B9-0000lM-UW
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 17:24:45 -0400
Received: by mail-vk1-xa31.google.com with SMTP id e16so3190308vkm.9
 for <qemu-arm@nongnu.org>; Fri, 04 Nov 2022 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hkHIhcKpIBqFJ9IP7ONHZ3Bmh3vKBlK4LOwJH1e4uVE=;
 b=okX9igMlsVG6+ILsHTkZVYAHTN2UfhVyuWGUmUjuBgJ8bjOy3GQ8dA8bbaRZUwZJ/K
 OqL8mC1o4SQM9JDGIEhQmvN23P4Z0HELOJdDdCGId859z7HX+aqHqJQaLhxpRWOaZtqA
 B8PN7SXcbqSmP7ycOew5YmetWsWX8tLfrLfZfgVnfu3ryK/zGUusw85Q7oXs2eguLZna
 a/1OUs7fVd6Z+7d9NpqFI41/57htkeQJtb3bz2QZOfrUPTZcf/pEuXLoDtkL3GoxkTrg
 gKMeBPVdioVFKY/urRjiCaFhhA8w8kynBCmcSfrFNUh1hLickfQHyAhIJdk0c8QoYtXT
 +vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkHIhcKpIBqFJ9IP7ONHZ3Bmh3vKBlK4LOwJH1e4uVE=;
 b=Ek56z52r4TFPVPMhuO/VMDfeAxQg55+qobelb7+wijiiQx3D9MzQqQpSW0D0Zax/OW
 40VWdP7pufz/iltX2IUlaXd/Pl78ibzlWNBSmN7OTHxXYO/tkjBfsfM7ikdtg8YGPUKd
 4TMZaXA+lWcGNMHr8ldPPKKkbCLCAWb0j0UVoxtzIxYeaNrC2nRNVJqVEvrqXbumSf8G
 71mKOgCXlW5T6GudEmcKIofFzUmVJX/HxX2fob6v+8g6SDzYZlp0u+TIyp2dHRawTYGx
 6l+xpd1SbMN0Bm4rdyIpQd99mNoAZaedA1Wl6gANb91MsDV8s4Z1EyFXXcE93mVGODzd
 GL5Q==
X-Gm-Message-State: ACrzQf2IxN8todtaU36ZNtUpRrju/vwt2ySTYBmnB2UUZfPsLWuoZYci
 d4J4RqtYFTrBetiVGxmhnHigSrC5e1/Yp+QHrNBPICW8eewAH9ju
X-Received: by 2002:a1f:aa42:0:b0:3ab:81ee:8fa9 with SMTP id
 t63-20020a1faa42000000b003ab81ee8fa9mr20630676vke.17.1667597082212; Fri, 04
 Nov 2022 14:24:42 -0700 (PDT)
MIME-Version: 1.0
From: Kiron Sen <kiron.r.sen@gmail.com>
Date: Fri, 4 Nov 2022 14:24:31 -0700
Message-ID: <CAEpbZuxvrNf1c_DB9SpkTnRL-qoGbyq+c6boT3pHxc1jTs1rew@mail.gmail.com>
Subject: Resolution for past Cortex-M issues
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=kiron.r.sen@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 21:02:10 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: adOX+ZacpQLg

Hi there,

I'm interested in using QEMU for Cortex-M microcontroller
applications. I found the QEMU support for STM32, Nordic nRF, MPS2/3
and Stellaris platforms with Cortex-M. I have some concerns about the
state of Cortex-M support in QEMU after coming across this thread
from 2016:
https://qemu-devel.nongnu.narkive.com/jL3tKvyB/arm-cortex-m-issues#post2

> Our M profile interrupt code is really badly mismodelled. It was
> written many years ago as a hack based on modifying the A profile
> support and GIC code, but really M profile is different (the
> interrupt and exception model is an integrated part of the CPU)...
> For M profile, NMI is just one of the many interrupt/exceptions; we
> don't really get it right because we're mis-modelling this with
> interrupts in an external interrupt controller and exceptions in the
> CPU model.

This led me to investigate the Pebble QEMU fork
(https://github.com/pebble/qemu) and the issues they ran into in 2015
bringing up an STM32F2:
https://web.archive.org/web/20161207161142/https://developer.pebble.com/blog/2015/01/30/Development-Of-The-Pebble-Emulator/

> The ARM processor has two operating modes (handler mode and thread
> mode) and two different stack pointers it can use (MSP and PSP). In
> handler mode, it always uses the MSP and in thread mode, it can use
> either one, depending on the setting of a bit in one of the control
> registers. It turns out there was a bug in the ARM emulation such
> that the control bit was being used to determine which stack pointer
> to use even when in handler mode.

The Pebble fork is based on QEMU 2.5.0 - I wasn't able to map
Pebble's fixes to the current state of QEMU 7.1.50 (other than the
BASEPRI fix in bug #696094). I was wondering if these problems have
been fixed and what the current state of Cortex-M support looks like.
Thank you!

Best,
Kiron
