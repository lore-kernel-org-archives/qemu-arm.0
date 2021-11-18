Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp330377lfk;
        Thu, 18 Nov 2021 01:09:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8tJErwVL0a9MV/kFekQCtjpXrYrHv7ISRFsidAz3IGyEUKQpnoCdLR+p34di7VYrVQzJy
X-Received: by 2002:a37:c20b:: with SMTP id i11mr19263290qkm.300.1637226592587;
        Thu, 18 Nov 2021 01:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637226592; cv=none;
        d=google.com; s=arc-20160816;
        b=WEHIjh2BT5u83os7BNf6Tlp6OKYXz/C8b1VgYonzWC+1qL5C+WGOw2nZL+UJX6sMZV
         ijwiQB6uV/D0dERHvHiqp0geAg0EHMKarGbMWxDZ4aa+en2FX1eN8xOWHsMZzITgqpYY
         GORy113owj0yHXszYMnBe/ptWDve8sNU3H3wrnRQX1sbCRqU8Xw2Z0+rVVT7RRD2Kq8O
         UWvyozmrl2JKRhU9j0THOxBs84AHM+VOuasO6MyRCuguv/vUquIw8aeALAyKE+T2VLj7
         M8jf05ymr4BVGZpdhVuvTKa5hUsqocXo+tcjeMkEjRyfvFEHKRMECJD0vyz1Q7Ei284J
         xvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=kfI+FCi0EqK/7iB5Rx4IZmwT2mYcKxiRGNfQ35/pOJA=;
        b=iz/TwyejB0amcyeuJzR1qMGZ4zfrPEPtqjy1D/onw4TAzV6v3j0Q7AKnmoCbUIZaGr
         ObShnMmHoS9dpGbo7Txy7vQHXgLrALhkedCYp6AGinB8H65seopDLP4KinKOATiR1dpj
         QEkqCXW7y1/DZEwnye/YitNkm3fMwYzX04xMshqWSFjyn1YwJ7V5duh4HeTguOkMpc7n
         hGDnGebyi7KPaYuA+5GyawinoSUNJ7pTgcoTURbq/91OvK2/Ow9maI/ceTGNDgCYnvz1
         jemJx53pPucpcs+ETL5rKkPxGTbRUcumooEYM6Jnqvhz5paeoO3Uh0H8kH6YrdoA7ZUD
         5WCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jAHLm44Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si4956121qtc.218.2021.11.18.01.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 01:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jAHLm44Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mndQW-00027e-4t
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 04:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mndQI-00022t-I1
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 04:09:38 -0500
Received: from [2a00:1450:4864:20::131] (port=39725
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mndQH-00012K-A3
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 04:09:38 -0500
Received: by mail-lf1-x131.google.com with SMTP id f18so22698749lfv.6
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 01:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=kfI+FCi0EqK/7iB5Rx4IZmwT2mYcKxiRGNfQ35/pOJA=;
 b=jAHLm44ZbXU+iDx+GYuiWVozWKQvdS1r8TbPc/EJ8WTmUoWUfW6nPsP9aHMKaFFMvN
 qopVIJYI39TOlZkEoqQAfRbNhToLQ2x8Dhojzw6XJVdVfcWjptBgj0VyYxu43nBc4a9J
 70i7tAMnkgXAqq+wKExWyi3Ywy0A4ACGzJXgb4JO6i8H2boS00eYACMrOhf0gXed/P0U
 1/vjdLXfTTxWRpZeemgBi89JhGS3TOA82y2L2CpKHZuYKdaPyu6syhbmlsFtcf13QHOE
 T9kJVbQiHknozfc4idYbJCL8pVl5PQaZygxLkbzfwI/0E4xo2hQ+hCGYRegQzfwG5c0f
 f0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kfI+FCi0EqK/7iB5Rx4IZmwT2mYcKxiRGNfQ35/pOJA=;
 b=73+C76X7PUEmXl94vshUIq1VTMnbDHescEEQD0DSkXPHkemFKLfXEJPUfge5mGtGST
 LAcLal+KEAdsB4KpZ/xpqWiADwXeP7mE+XInUaX/9lvLo+tBFEzwcrT+YtM/ZE/V9sNt
 uSs+HbQWOk3cUDLSFh64CIV60721sosqZ9xo/7eYLlPpeI1yS61kE5qZHcFQq2Odm33h
 KNAzIviw9bPV86JQzRCfFnVlnNgOzoKJfaBK2Nt1ty69xdmvt4+P2+rIhrzpxqy1mk4/
 z3ZSdYevlhIOLBPEYlHSKTAWkfO2/HlG7DOzWPes2ixdqs0Yk8dxDhkaMBtUY5bgKqaP
 i9Qg==
X-Gm-Message-State: AOAM530t9RvpSluT63SU5GAYpAmv7z+TEsgksq7EwBUA04G7S8vlQGh0
 5160oRWjkiANKrKo+CBootZ1/mXQ1aMd+09/khJNvcwTWOI=
X-Received: by 2002:a2e:964a:: with SMTP id z10mr15109441ljh.210.1637226572838; 
 Thu, 18 Nov 2021 01:09:32 -0800 (PST)
MIME-Version: 1.0
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Thu, 18 Nov 2021 11:09:21 +0200
Message-ID: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
Subject: softmmu 'at' instruction support
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zZgFTFOL9i0x

Hi,

This looks like a bug to me, please comment if I'm wrong:

0x0000000100004a3c <at_s12e1r+8>: 80 78 0c d5 at s12e1r, x0
0x0000000100004a40 <at_s12e1r+12>: 01 74 38 d5 mrs x1, par_el1

(gdb) info registers x0 x1
x0             0x0                 0
x1             0x809               2057

So that would be translation fault level 0, stage 1 if I'm not mistaken.

(gdb) info all-registers TCR_EL1 VTCR_EL2 TTBR1_EL1
TCR_EL1        0x400035b5503510    18014629184681232
VTCR_EL2       0x623590            6436240
TTBR1_EL1      0x304000041731001   217298683118686209

(gdb) p print_table(0x41731000)
000:0x000000ffff9803 256:0x000000fffff803 507:0x00000041fbc803
508:0x000000ff9ef803

First gigabyte is populated, yet the 'at' knows nothing about it. Did
I miss something?


--
Janne
