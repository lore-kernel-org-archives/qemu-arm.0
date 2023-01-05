Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp255857ejb;
        Thu, 5 Jan 2023 04:09:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu9G7BIw1s+v9V73P8/9O1VbqC/UqcBCIKhn3hWCq6fhFAvLACWKalugthzqd53qAk55pmH
X-Received: by 2002:a0c:fdc9:0:b0:531:b7b1:c31e with SMTP id g9-20020a0cfdc9000000b00531b7b1c31emr26041097qvs.38.1672920565082;
        Thu, 05 Jan 2023 04:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920565; cv=none;
        d=google.com; s=arc-20160816;
        b=fpYVRiQAGhNnWyI0drOPVO6ybpMHr3zBn1pWuKYbabNDhMlMpBy7adtR/5QKY31LZ0
         17e1P79CiPOQlK/WDDYXJQqLRlPl9dbTONVobfnurhbZJg4VdrMfvPv3WIYzoKdKlp52
         3i+Ll+WI75xhTykCUPn5Y7lOSjYG+xwgRghS5D7CAN0jp+D2oYdq42qAmKeczkFSDp1/
         RoQ8atpckKVYl5MroIUr45YpuIyevi2wuZZzKROgMA4aUwCa3oHQtZeWvnvHc6NDMQbr
         cXLA6G2D/KM6MwjQWsnYgl/SlmSBuFJ6jCOAW1L9kAO9pIRbkm02uO1/or3wElqjRe73
         W4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4zUYZNjpnzAONC6x1VSQ74oyRwP63RRosniNkdwYtz0=;
        b=S0X/i5IRkVl2GDZ068LJ2fnJ3/YoLeG+y+zrj6OX68x2qpnQYHiq/04uAbkMHhpfHn
         iOolskGUO8xi2Lk0TY13GLClgAbjJhqQhgYo0vUGMJEL87fTAAcNpuAdCge2Km+0Lk9Y
         S+5Udw5T7hJ6goWs0XUOajRN7gEwUAoxn6XsmGL766PqKKpIR5PG10ZqzfDbaCzxbvNr
         CU8ZB46ss92GiVrKEOqQgfRKSiJDrx1XKnrDjDjdBgdeg59X8rpsgQ9KjnaVw8dWR3NJ
         pDLtzN/s0hD9o+SFpjttasJQPFpKm+4uuAcgood5u2i68UCybxifnsQEk6jQHJjWl/Ig
         tr/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QisTFh6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo27-20020a056214501b00b004796ba3f0cbsi18764814qvb.136.2023.01.05.04.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:09:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QisTFh6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDP3e-0006TF-IU; Thu, 05 Jan 2023 07:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDP3Y-0006RA-FC
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:09:12 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDP3W-0004R1-TR
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:09:12 -0500
Received: by mail-pf1-x430.google.com with SMTP id a30so9544299pfr.6
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4zUYZNjpnzAONC6x1VSQ74oyRwP63RRosniNkdwYtz0=;
 b=QisTFh6wtlifhj3tvsxbPi2AXPz+gw2f897VkpAdv6FrBTdIydopkGIbLrxXwx9r46
 AwKV4KFbJckqLZg1UtiTZZVrjzc/c3TfmS43ztrioYk8NTOIKiDDsJzNgoCzCdYSgkki
 w+rSLWsCt0D6oe0PdjJooOurm6r+RMSjeY71KlKjgh80Jv/3LIjbCaFM1hhgYTNXOWG1
 juJcjNnGj5IwlztspKfkItorD2H7qepDRmDSiwOPFekY+yC68PB+knttgVUz0sCPtatq
 ucb0sMWgcakrCiPXIECc40Xra1qpVVhqr6ZmaChWPjJzAPmnMVbYIO1STA6BIJupk+Aq
 55jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zUYZNjpnzAONC6x1VSQ74oyRwP63RRosniNkdwYtz0=;
 b=1gmgK39+/tu74EWmDVYYhsCnfs5O6RgYS3SvuLxuEx1SzMPkvF8DN0en06zWxPg6Et
 2cBHvl/3PHjr3n12/P06xEGr9ltSho8c4Fdwwb5t3ed9HuLPjK2A4bj+5ZVQJkLJuROp
 HpuXNCku7GTM0NFSY0ZdQzeBOde86ZXIUPe6KM6BoxxFrGMf/x3pNt6x0tT+2lAqImJB
 IMkDZLbCrgqsjyJrVz+JyLanEYAyA5H8ihYTTc5AzH+IV2ALDLWKikXL47Z5c5fOhMr1
 86fen1Hvdadr4IJ8nRgGFuy4zG6cdgCvN0K12z98dadd6eULxHerQHFLMT5guUidXhhn
 tVtw==
X-Gm-Message-State: AFqh2kq+384pB8xNJnm7IxOpb87LzstRb4px2/sUUAzfdDXRPM7UovTy
 qVgMBGrKD+y95uEUwI7iHbdrTTTrPBcTiEI933I2+A==
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2313145pgd.192.1672920548737; Thu, 05
 Jan 2023 04:09:08 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-7@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-7@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:08:57 +0000
Message-ID: <CAFEAcA_bXUFZi1hBO22pC7vxHHoPiKS-aTheJxBQu=-+nctSXA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 7/8] hw/timer/imx_epit: remove explicit fields
 cnt and freq
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: 1cyWpWUp/nWp

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> The CNT register is a read-only register. There is no need to
> store it's value, it can be calculated on demand.
> The calculated frequency is needed temporarily only.
>
> Note that this is a migration compatibility break for all boards
> types that use the EPIT peripheral.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
