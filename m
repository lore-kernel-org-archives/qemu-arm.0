Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp158788lfg;
        Thu, 8 Jul 2021 02:51:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB6j6Hhft3SIp4LgGGor3OJkkBB4g6rhUsmoDXIrX0Fx1K8W402zQqL5R52zY8skmXAuEB
X-Received: by 2002:a17:907:868c:: with SMTP id qa12mr29653967ejc.76.1625737896460;
        Thu, 08 Jul 2021 02:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625737896; cv=none;
        d=google.com; s=arc-20160816;
        b=Rwsb4XbZvZ72V6XBLLsA0IvSeQQR510xhwUHJX3bvvSxij2Lwx3N6SbsNWGI2LFHvV
         /ukSUYbjDGOALRz4cfKM/NvBiw0NQyVD0vUxkhkISkU7O1WK9wqIEOqf7L4Xqcaqo9Yu
         IfYAltduop3U9manEG86Yt2CIM/zeDObso3iiJpFGHNjYuaJMes9O4bNEi5Ox684Z7i1
         lev0YfVHho76+N63/kK4645eL/q2DMnjL9XBauJPQm/t8XgBM+OYGhOiG6hPNvwAX2/F
         yLB9iWOqzjYL0Sgt9AvjSfIexiFrnucJ8W7iXXRH+FMzvBwIddvJSXlt5fMAnTy8/FOQ
         LNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BjJJvPpQr6BiqmxhiY/cBLZTaUp6wG4zpInNYnFLhw=;
        b=peuIcOdJqgodsRSWfz7X5QJAfVNGDGnrmJLFyvN0R8PxFcr1egoB1OYSivdi/xxYI6
         Ny1OM5QaE9CBWul2Pt0FlM4fifg5ZLOeSIvz7mdWR6sKujtEYaXEagwv6h29fvjHzjcr
         t4mHrzb9eWLbRYN1zCOtzd5TsnNBf06fzqDfd/GPOPghU8b6LyZ8/5suPbHEoIxewWU5
         ttG8WOzyB0S+G+7M02qJTDamXQMYtgjKdYA1RMuNY41qtTq2t67G4K84GAFrjUklSqvl
         BcnhxS3uhlgJUyIxzvNyvzmoDK8EZ6EM5zTUylwcbNrdJER7hxx74mS7/lMFUVKjE9Dj
         kCiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lnqFkLQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id co20si2639736edb.324.2021.07.08.02.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 02:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lnqFkLQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Qgx-0006gS-HK
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 05:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Qgo-0006g0-SU
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 05:51:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Qgn-0004Wl-6e
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 05:51:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id he13so8515452ejc.11
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0BjJJvPpQr6BiqmxhiY/cBLZTaUp6wG4zpInNYnFLhw=;
 b=lnqFkLQxeXwRm/MeOP1Hvhwe3Oe0VhGdRY36RzNM4UqnRuF5gzON/vICTDy097CGxS
 Nh2Qs+tFO/C+aAuOl37ajXUVzuNBN3lGjK/1Dk/zUNyQRVlyu8BYdR+cdmo0LDREmNZW
 8t8l8MzmVjsdFsPRSEusfG1i/bLumd+JTE0oweCO81BuWmXWuW9xL9kYeDMKiWivBTRd
 +MDf0ZEG7oPcISyMhbU8JlWMr5vkRZpSEYGTuBtWAhQuEd6mEqAvjKRoxInLYjNJ8Vy8
 mLuA4ovbCV77fuTtNP84MVc2wamjAujW6kFvKV19BQ1vkb5eR9W2CkkFkCInbVYb+urh
 Gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0BjJJvPpQr6BiqmxhiY/cBLZTaUp6wG4zpInNYnFLhw=;
 b=sDNrlra1CHnSvIIv0kkSEBF3r36FRlp4LkkcztlhLYPvW6rzy8YKIQkNO1VNByztaH
 +xrxQ6qAqHSkastufwuaXeOcCYhTeZijH4qwBbZXUWmnGNXqufr+si8tYmT71Rgd5J7s
 2c489NG3FUvaUWxQpgpqMHlrJYTQIk/ySvN5Akcxnq95R02HGrymnSZvHdPnxFm3btuo
 y7hsWN/EuSuNKgIBgNBikRx7JryTH/11nvto5T4980Vwe6weMQBZiQx/ahqz8qJIpvLA
 fJ4MxC3ujTX+4W80lBBLjztWmEHrrqYtY/IHn4RlIBfZ5jTZx+qzbpLoicCBSk9y9rb0
 U8KQ==
X-Gm-Message-State: AOAM530SHMntAzDGoMJUUztrEeCpR+leTJW9hkgqxS/2+bJscfzovTyQ
 8xv9fzeJWbVA4X9pU0GxXIqI9z72eSSvZDoB8Jfviw==
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr8608303ejb.482.1625737883689; 
 Thu, 08 Jul 2021 02:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210706134457.81059-1-hnick@vmware.com>
In-Reply-To: <20210706134457.81059-1-hnick@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:50:45 +0100
Message-ID: <CAFEAcA9Cqzh716p6bhed5MHGcQXpki0SrQZQS3NSLOGwoF3fkg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Correct the encoding of MDCCSR_EL0 and
 DBGDSCRint
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0G9IIcs2MClm

On Tue, 6 Jul 2021 at 14:45, <hnick@vmware.com> wrote:
>
> Signed-off-by: Nick Hudson <hnick@vmware.com>
> ---
>  target/arm/helper.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a66c1f0b9e..910ace4274 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6326,11 +6326,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .access = PL1_RW, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
>        .resetvalue = 0 },
> -    /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
> +    /*
> +     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
> +     * Debug Communication Channel is not implemented.
> +     */
> +    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
> +      .access = PL0_R, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    /*
> +     * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
> +     * it is unlikely a guest will care.
>       * We don't implement the configurable EL0 access.
>       */
> -    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
> +      .cp = 14, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
>        .access = PL1_R, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },



Applied to target-arm.next, thanks.

-- PMM
