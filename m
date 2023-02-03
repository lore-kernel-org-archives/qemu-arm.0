Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1298438ejb;
        Fri, 3 Feb 2023 03:38:52 -0800 (PST)
X-Google-Smtp-Source: AK7set88cejs5aMWf2ijoRPU1KEPMAMS70CAQdY2oknViqRggAKPuP1CHFxKCIJOkloHhr+eIT0H
X-Received: by 2002:a05:622a:11d5:b0:3b8:251f:4cda with SMTP id n21-20020a05622a11d500b003b8251f4cdamr16777042qtk.58.1675424332490;
        Fri, 03 Feb 2023 03:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675424332; cv=none;
        d=google.com; s=arc-20160816;
        b=I34/3fdTuMgKGrmmWvBiBfSlVmR2zlxpfOyUSj6DSXFskUewTfHJ3SLfbLSZI4y/3T
         OqksPCTfc+jhecyj3AAXZf8ZMGZeTyCQxY7fCtek30rC2OneHTygFSMS8qkk8EmYvLW8
         hZimyPgwN6HBzrUSncP8tPjOg9BF2/Uw+b/ECnib+Zs/MvXrySgNhTgITkc/81vXzFtd
         IADJs+wOdRpbVmned/3EjkapQwo3zLNKMn3GeQeWC8WX/S1891y2vNUXto9cnX1oTiQc
         NvLmEsdcxkil9J7fPR/aH2W9PpZsaW2/lP+SxymrrQivZ2x6x3tOlDqzapk2b1eR32kz
         N/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VPD7V+KyEAzCsUjhERtTeI+99lerqoilvBDQoa41FOo=;
        b=itclXIFxT8kgQkmCGuOM2r1jqevjZPGmhlLXxRXnCrOINaAmEApjOjflgbrG3a1bM6
         DHzvq5Z9mN41bUuMHZZMQj1f+ocmSzXq1kkUCbAKyErhiQmvByUvS2gbaX+qcfvjSI4Q
         7TzJQQ4qtXAu0XupC4xX1xkzM1lKuusQX5lFsc0Ozn+g8IrkPYfGEl5ieZeT/pzegk6F
         NqW/x/o9WgwnZB2hX/ot4SWy7CXXhcVtdxUnP1h9QQ2RTEy8hY59mNqsrF60gEC6pUB5
         J5ZWwTF3Mo0RKVuzcutk1Vx+OltFb809Px6bI/NSew3Ot9NOv06UH+GZuuQl0ajxmSNI
         rh0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vzn0/sBI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a05620a0b8b00b007065816b171si70046qkh.371.2023.02.03.03.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 03:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vzn0/sBI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNuOz-0002XO-A4; Fri, 03 Feb 2023 06:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNuOw-00029V-W8
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:38:43 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNuOt-0001Pb-Ne
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:38:42 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n2so3352923pfo.3
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 03:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VPD7V+KyEAzCsUjhERtTeI+99lerqoilvBDQoa41FOo=;
 b=vzn0/sBIjRNFZ9VSKwn7LjE4Uj4abAM4+yW8cXAvmnE1knW+ZnZywVyoo1ADW0q5C2
 3Sn3jKcEjL7LAzv59/+dpHSmMNVeEgseA85dY52LQ23DbHUQR1PLTQTVg9ZJOnKGEI6o
 xCfGhZ0Io+OMTseMQ/UNTjIwwtQ7h+9EaEm6UCAiw2aNudevALOUy6bLJ+Ptp8Dnm3Uc
 OAYh+npCe/yA69Img27ilB6fEEXRPHwiVn/odTHhjKxa0fR3BG08RYhyfn/gysyAqHZE
 KF08PPCfVt982Wk1OMwE0TTQykDhH4U/QrMSLvmTAbTjpGQz+vdegXCnPWkmieAUgEFq
 0zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VPD7V+KyEAzCsUjhERtTeI+99lerqoilvBDQoa41FOo=;
 b=aCAQ1lbSBxFy+AxXncJhtoYS+EQP1d0t/d9u5zkNDgyLU6W8brH/ItMFCq8teXrx4X
 Phuk+VSEYSq+530PqCjwHohXsRj8fyXukOFp3q6jryyYP0ImcOPuMIr/Tw1A8vfO0gqR
 K6aN8JE9eEVyoaNJWGjs67Mgsglk1+SVOyYLm4g9RWkACpYLg4UPKlRoCdqFhUwpZ+oO
 n7t8xdXw3XrVwTZqStoNXflG/wrhTRga32EVCf/6VRTMbBwoLUGinrye2v2x/lkHEfHt
 SPKCIBY/OJ+54a1ooLVaju9guuPEXrPgYqaVdZBqfBc6IyeutIH6TYp5BlxY0r6M3mDh
 Fw/g==
X-Gm-Message-State: AO0yUKUjHywUQ+xZVptra5/o80JBP6mddYBHl36HJXyYF5UhkullAp5u
 wNa9nLAsOjzDzdnY22LkUKOS9Du2e6trXxAI/zxtxw==
X-Received: by 2002:a63:1a51:0:b0:4da:e1c7:99be with SMTP id
 a17-20020a631a51000000b004dae1c799bemr1608672pgm.37.1675424318167; Fri, 03
 Feb 2023 03:38:38 -0800 (PST)
MIME-Version: 1.0
References: <167398464577.10345.18365355650640365165-0@git.sr.ht>
In-Reply-To: <167398464577.10345.18365355650640365165-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 11:38:26 +0000
Message-ID: <CAFEAcA82V7ctOWGcqWFB5A220rUUX8VnB2G_x6vOOmhC9kCFBA@mail.gmail.com>
Subject: Re: [PATCH qemu v2 0/3] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: Ly2UYxKz4N98

On Tue, 17 Jan 2023 at 19:44, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> Patch 1/3 was already accepted, but it seems is not in master yet.
>
> Comments addressed in patches 2 and 3.
> Let me know if you'd like me to split out a separate commit
> for renaming arm_v7m_get_sp_ptr.

Hi; these patches look good to me. If you could respin
to fix the thing RTH pointed out about using NULL instead
of "" for "not present" then I'll take them.

thanks
-- PMM
