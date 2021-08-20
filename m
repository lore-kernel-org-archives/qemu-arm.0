Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1105579lfg;
        Fri, 20 Aug 2021 02:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR/S3er/vGQnalrxx+vtr6Jksc7EWNxCtBViAh/QdlFOima9VHId7dJWJcUq8ulIhHx5NQ
X-Received: by 2002:a05:6214:7b1:: with SMTP id v17mr19042332qvz.20.1629450348268;
        Fri, 20 Aug 2021 02:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629450348; cv=none;
        d=google.com; s=arc-20160816;
        b=u19heA13pQYavixMSC0l7faBBI8AoKvIYKhrS4+JS2BUtA3RPOso8qZGGhuI4FSI9h
         5PjkzP6Ph50SvwLCQ8meVDrl1XOSjadf/MHpezVEvkBrtRhjCAq/E1SlkcIFSMnn7/6g
         wWYOBPhVgewlyOUvamH055keaIdFbA54IoO8A//mzP/w260PSHIxYNrfSqd88spjiqP8
         Ao0hQIO3nGk7ISN5XfNXpS67WxBkAMJIIUmiHcE1d1m3J/v0OScR7sD+b0eo9ZRHgnp7
         AYZGosU2IS0pViWJwTgNjNoOh6ISIa5TZUhdo57tgcoFnImUBT4y+AuWgXAeU9RbGtDB
         /9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Oh50wmy6mNxPZgP1tb1Z+wfji93/59BgvYV3gABmscI=;
        b=YZDCjLOdAU883H8di5FmWNN6LafrFNgKzXFpmuJK/Cn9F4gkNzaRwm5RIdG9Z/iKeo
         MIoy1/+N0A9gXsGzXIRXIbAI7bMT1bkqnR3Z+578T2Nk7dmOdsYi4Yo0CnGrQWLIOkQ7
         +mOnjuZi0oOlrT4+tHzQ7qSg/7qxK93fNS55dn6UY/JUqmvHb9nglUeB9BrKr6TZ0Ke0
         mKjymEryXb23r6hxEn2MMNcJSMFN1mzjBsi6ueE8Nk6sXZuiORa7JiMRjp8axNOi+GDO
         GCJuJy5olp3n+ih5nEkuRszCIfGgup4gJR50JK9EzyxArqg2SPIrcUXfgIhZAEt+WDdA
         yY6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZD2+Nn7v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26si2819275qtp.339.2021.08.20.02.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 02:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZD2+Nn7v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH0TD-0002an-Hu
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 05:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0Qd-0000Qk-VC
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:03:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0Qc-0006Tw-HD
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:03:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id r19so12926789eds.13
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Oh50wmy6mNxPZgP1tb1Z+wfji93/59BgvYV3gABmscI=;
 b=ZD2+Nn7vvVfxqHmp6/elDKyG/JYlZSnC0N1LcyTMGYr0HVyeGc3DQBawhYgqK/oPWv
 XXN4SX1o2ID7ri4XIsfREQ60hkutX8gVqPj6FdPsX9VDowCWTyuaUDhjSackQOFGyZbO
 nFFFNdZAzn+6rW0m3uCCt4xNsM2txAkIjFrhy8BkkJbXVTciE3DKvhevKHEe5+MCljaG
 7WV1hW2ZFFKbSLxLooa8gC5LRreHODfKPIpcch4JP2VlXp0kqPy67pKtw/ZhsYsh37jx
 K2vQFdiUm1cK/M0HDKjpePtxuJNalDjR849vJPN4TW1sxGM2ViRb08/BwKXt7DFggkZX
 I09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Oh50wmy6mNxPZgP1tb1Z+wfji93/59BgvYV3gABmscI=;
 b=GdQEjdBgm1db6JqKeiyQShOSaqdUW+mcjCZtLbpYNyqzuPLUqILONhu00GjvyXnzsE
 NRUlv9OVt+Xjf+XLUJ5PnL2pxsNTz/pZkL2zjqzH5jF2IX02l4bWIJqfhCJpyRkjQq7l
 qEskzeukz0KKhYlqAUVo/L5joklc264CDRXv/XW334Ob4bVT4kTAhnJXeyE3aFN2WUhi
 1jqJNLFBLe99qH23OXwk1xMZ12w5KLLfbLyIjdJYb4lRFVGyppgFOIkU4eB9+oswwm60
 jhLg2vmlLBkR4CUsv6RPu7+zIPCzeqdgpAnujFFLs/f5gI1if0Nwo/aGLxTVuBmiLWS0
 VpQg==
X-Gm-Message-State: AOAM532UQlNEpVzpfIQUL5dJL89Kv/8s/APJwDzsUgpkuQTrxdmWcfQY
 L79ZExn3PQOSvlWRMelehxgsa9rmwbZkhWntIMw5dw==
X-Received: by 2002:a50:ff03:: with SMTP id a3mr20993581edu.100.1629450185259; 
 Fri, 20 Aug 2021 02:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
 <20210819163422.2863447-5-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-5-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:02:19 +0100
Message-ID: <CAFEAcA9rU_8L3j1_6yPL-v2O86FKqsRJ2iDCUkJJU9dNRDhiqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/dma/xlnx-zdma Always expect 'dma' link property
 to be set
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5zhc9vzB5Oc5

On Thu, 19 Aug 2021 at 17:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Simplify by always passing a MemoryRegion property to the device.
> Doing so we can move the AddressSpace field to the device struct,
> removing need for heap allocation.
>
> Update the Xilinx ZynqMP / Versal SoC models to pass the default
> system memory instead of a NULL value.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
