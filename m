Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1671153lfm;
        Mon, 15 Jun 2020 06:04:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQXD1mE61HDoCPk6W32ZYbGq+xSlb6vQfRSt3DQqxNRuLM65z/xY+Igx52UuSR2P20J5hV
X-Received: by 2002:a25:51c5:: with SMTP id f188mr39861926ybb.300.1592226286311;
        Mon, 15 Jun 2020 06:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592226286; cv=none;
        d=google.com; s=arc-20160816;
        b=EoJJ5otG1nO2OuEY79nMYx6V4r5bydMYDevPaKqvawLjOywA/EipnXmVcHEyYWw3Zq
         paETJSDdob/AFAreZjOnqgv1YZOuWUsMgsmL5oo7Si7YWzINU09IKcp4NwIKIyX5+ku7
         6+1N9CfEVE5HTm3OslRl+SQ6xU9sULSEQA9oHLrRQvDvCKtw7mJP2VfAJUH4m679pTwG
         gU/gEJwHwtS3JPLBHSknKHHyK8nvMYtuH3zUopMX7hMB149x0OVMCIYbt5JmSVcGJnQW
         BjPFrjuzbl1voWUx/EseiHA/dOCJMPQe7+Bnq7diuSYQrS5w387PdL/en3XI/ZGVlpcT
         l9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JguV7BhL78zJ/2cdSQDchhaNUbr/PRxGfGj+dwMzKjk=;
        b=tVwGMev959f7Ndzqruyohmu6gAeWBoFGACGAEo9EYpiuxR2LDaMbFp+Fk1ETfZRS6A
         TJ6mZdXM9oqwUhYGjhCGZAToX9cSw4HhtNAP9hAN2KXWs6Dw41sKVudLrjNF4xTbRsSG
         pdjP9uiOuqq4jLl47U/Cnw0f/m3c5eitHkUKgf4Wr6RnWV43filq26FjSPVqfjkscuCj
         ED3wELUd3aiZYmsvpjfx/DJbip5yJcwAsS71tmH6sYGRzRjnzVzavmdmdH5WT6EzGbpP
         rwCaAJ1NZSfQJ/Xarm03t2whgDmYUCQVVsYuhYQHTfAEeTHSsp2G9M7aIZj+rBYh2bIh
         UdPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWIGTMdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i133si13799833ybg.408.2020.06.15.06.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 06:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWIGTMdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkon7-0005Mv-K0
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 09:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkon0-0005LR-28
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:04:38 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkomy-0008Rw-2Q
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:04:37 -0400
Received: by mail-ot1-x343.google.com with SMTP id s13so13011152otd.7
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JguV7BhL78zJ/2cdSQDchhaNUbr/PRxGfGj+dwMzKjk=;
 b=aWIGTMdPUOntIKTS12QO93f6m/5v9V45LSVHh7mM3TU1kyFP2B+qy4iAY/oal7qTkj
 1dSfEyT+YCSrWzDZHrsnLBEv+LUNlPbNvHKd5DyRqvPjwnKruIBwo13ClcS3MDF4zHeK
 E/P9tMnOHuqVNTthBkOtPwk56eXzbJDmwDC8G+fn6o0oif3x2F1w0+WLRazTIARzfLIu
 lmkufGK1RbSAbi+0vqTPoq2tMNlO95C7yW5d7BDNJHum7zVtrf/cY/s2GE0Gp0/2vJO/
 pcIuCvxdsof0vl2+w8LQyGEMLlz/uTk/preQ7ZBugVTSaMObs6hASkSWVhkVDuEZX39T
 D/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JguV7BhL78zJ/2cdSQDchhaNUbr/PRxGfGj+dwMzKjk=;
 b=OI4zhPqANqBmAFzTCE/V4UuPuBpUFBkgDJmbZCegATG9VzoQOitGhL8QC8l1vAGcGR
 mjcnv5ZHi6jpa6877qWbcpNFyzqCgIWSlBYYWZQApnFKvZc7csO1CSop2fBj7Elubf1w
 zb/PzJBSRS0ySK0IiGSuwDP5mWLssn+G16t+SUxxUv+jdSGThFRNFTuFn5opJBYqMGtj
 INuhvvvaVdULeBGt3Njbdw8jrIzTkKF7uJIYynHhvymG+tXmy+DXjzd494+pCMzH13nx
 U2AeGGrwQXXgAfUAkDNzQnPvifGpkcUtQLX3muQ+OKFfJwA10VedJeE2X+LIMBI8EIRE
 1mIQ==
X-Gm-Message-State: AOAM532z/+g1qQm3d3Swd/XZ2oHbpI8b52uFX71++TyXq0DU3LP3AdT5
 I13kbt9t07yuYvRFAduhpwX4O9rN3IAF6b3SzzQwCRHim0Y=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr20366752otn.221.1592226274970; 
 Mon, 15 Jun 2020 06:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591272275.git.jcd@tribudubois.net>
In-Reply-To: <cover.1591272275.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 14:04:23 +0100
Message-ID: <CAFEAcA_zXdpCNnR-v3FQU1zKb6qYm5v1tAsNm__yiC1tqPWyzA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] hw/net/imx_fec: improve the imx fec emulator
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LEcS6scLN8FX

On Thu, 4 Jun 2020 at 13:39, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> This series of path makes various improvement to the i.MX FEC ethernet
> emulator.
>
>  * PATCH 1: Convert the Ethernet emulator debug output to trace event
>  * PATCH 2: Allow Ethernet PHY to be at any position on the MDIO bus
>  * PATCH 3: Improve the i.MX FEC related PHY emulator by using standard
>             header symbols instead of hardcoded values.
>
> Jean-Christophe Dubois (3):
>   hw/net/imx_fec: Convert debug fprintf() to trace events
>   hw/net/imx_fec: Allow phy not to be the first device on the mii bus.
>   hw/net/imx_fec: improve PHY implementation.

Hi; I've applied patch 1 to target-arm.next and left review comments
for patches 2 and 3.

thanks
-- PMM
