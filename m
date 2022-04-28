Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1646472lfu;
        Thu, 28 Apr 2022 04:13:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR8TQDSMhr+pRdQPPNZyyICrAPp9EIeeegzJcuNNiWbOflJKYUbRGC/XR6c1r4bbgGVq7Y
X-Received: by 2002:a05:6214:2427:b0:456:3f8f:afa2 with SMTP id gy7-20020a056214242700b004563f8fafa2mr11881846qvb.49.1651144411457;
        Thu, 28 Apr 2022 04:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651144411; cv=none;
        d=google.com; s=arc-20160816;
        b=xIG+nhhN8M9W9v5/N7sVfE2TgZCeJDJkATmICYZ6hpvEJJaPdiBbnmdZ/PxRQeJjeI
         BUxzc1chqIH4+EWbsRL7p4rGswYFjqTgJlORTkV7iZ0ayh1dNYVgsxKlaFvug+PDNjW+
         Hpgsxty5+vUrqGTyV3UgeBKKdEPDTEng3VqmE2pQS6EIHyd38qcxSqO7I0DE84lo/KXk
         WieWwrkmT4icihH7wk1A2bmCDmA1mNyc/sAj8f6JCeEDLuxvmvsunf84TKjNkv5WfatZ
         SvoS/H6PNNyhiQ4qDInjSKyWqdakAsE45IJ8EDhgHN11knY10YDmLD4HUpR+v+PgK/xH
         tZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfaqFGYSmUWDoTVIJBIrhuCCHtdKf4KB0WH5Ybu8bLc=;
        b=hrd3avKIOWxxc6/JFTlRmajphJ+IjUsvmFUB1FY+N881OCzcZvHE9ktzAqxMOpfUzb
         J7X0Z3vUrpuDl1iak9iFkwcnGMvyy5TBKR6aVv4tsSRCiMAW3xaobB5KVfXfZNiYmOsh
         ZBV7x2phCy2LO3zsomysQ5HTpZ6Ci/Tx0v7Jq2e7ia0Gg/djS5aHHaep0wKFNq+z0G6P
         hksY866Yfw6oh3/qxZ1b2JaGZrLjH8GDehVi4veCoq7gdiJS3u9DG/mRPAFKNkGqeSPz
         ipLr1oKtCMHIwu6k7gv3jQgPe0vJMj7e5WE8CF7CpzNxnZSAX+4WonNpQQQaUN7kaPJT
         DhyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ParEaFu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a0cf00c000000b004563a1ebd0dsi1459267qvk.542.2022.04.28.04.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:13:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ParEaFu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk25S-0002hC-Ty
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1ZD-0001Mg-Nz
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:40:12 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1ZB-0000l2-I1
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:40:10 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7ca2ce255so47936757b3.7
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfaqFGYSmUWDoTVIJBIrhuCCHtdKf4KB0WH5Ybu8bLc=;
 b=ParEaFu4HEn1ooqip+dn5rF9B6LVRGTX/QRZZHNlKeZXcDG6hjig07C3fZ1vud20QO
 YU10Ps6pmffEY7e8CU+6Q7vn+zH0hm4ocimY3Klhk8xleVc6aLECNcHT4J2XjCRaDKpp
 mTyq6hN5ku8a7ivfZAlOwoGY1FqANKGYy53zhfxzp2gkCsAeXOYMV2yNe48FJYC1UVRc
 AOxmmU3WaQKoUtgFdcaRH5f0nmqteEPZ3p4iXo5jAaYA9qmVD4uoyg+KprFkbEHCgs1u
 S8Tjse1iUjbdNlMowqk1pCfTuy1qj099mZx6zY5ai4hCYtIx1jMTdMn87IPQSZkjlq8S
 P6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfaqFGYSmUWDoTVIJBIrhuCCHtdKf4KB0WH5Ybu8bLc=;
 b=CNZn6gnpDMi+99GsLoW/tDRhM8kiPmCRBt6T6oYuYnuT22HQkpb0jkkgOaoBRcODUw
 yCB9++wW5ygb992HpjGczZOYywCpv+wv24KFd7TWh1II2dfXXp0ZK4DK6BY0Atn1fPIe
 04jSydFdDozoyFnaN4GThPZ1ftwLbJsgHoXD7u7DOUbhKAa+q4VpsREKXoAufG4BOGvQ
 yqX3MhmPBq5/hBB/GhBls+64JrTAPC3ZTeCYi9dMDq0YKnYoNnBF4zwnMMhSfX6kyDRt
 TbHkD8giCCaScYHHMfcc16Qyoa+6uJ4gZZ59xp/INCCLEkP0q0x1xPAx8c62CqSojhI7
 E0pA==
X-Gm-Message-State: AOAM533ORh72eRmbJi2oNrfjB/qeN8FaDDroLthLYPo4t6JSik4mEyTy
 PS2Tkgq4Sst7mIFJhyEEZB0zlTPNSt46DIADvz1+OQ==
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr23137831ywb.469.1651142408337; Thu, 28
 Apr 2022 03:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-36-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:39:57 +0100
Message-ID: <CAFEAcA__A62QXfAQv9E_QrK7fNftkupiOHjjvOqy5Zr9W=zDYg@mail.gmail.com>
Subject: Re: [PATCH 35/47] target/arm: Use tcg_constant in trans_CSEL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kMEAvJMd27NF

On Tue, 26 Apr 2022 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
