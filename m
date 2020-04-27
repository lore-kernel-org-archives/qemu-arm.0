Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3875541lfm;
        Mon, 27 Apr 2020 02:29:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypIcaPIClxzkz0oJ5QvQ7ZfQovJd4SrfmDPULfx7Rz0fNJ8gz7o4AwWbPh3lpW5J7NWwu7gI
X-Received: by 2002:ac8:3928:: with SMTP id s37mr22118959qtb.115.1587979772658;
        Mon, 27 Apr 2020 02:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587979772; cv=none;
        d=google.com; s=arc-20160816;
        b=AssiD8eWcn6lprpcCU98pIVe2gGYomYYU+CAD0hmH3xHdl20KK4HbHqJ3jbfC5TPhH
         Fcn1UxuTK9QQ11eO3wzUdxW2l2iqsyzT6T0qU5LHyK7rvLJtjjI1lYeizdYcAIryhs/a
         wZ3uU8iCMWX0vzPQ35S0ymC/4SmE6PQooG+I/QiBAPdcD1hy/IIPMJB9/pNi+JHv85gF
         lzlDE8uiwGRrpXuMo7neAIwyg6s6woh3AmudULBTSfTeKw6e6ODb9OvDJqUzX+df8rl0
         H2BfqCyERBoizobY2Ma3seMd11FBCBNTimVMJCQFvWvz1OEA6HBFSGcWy5z1RUxrm95u
         Izfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/Pvvd9YuVSkjU51nhuEjAcNwQ3wEACDyG45mPpqrv0=;
        b=e3fRuLfhmtePyG8blRV6+z1Wh8YX8bbjO2AaVbPY/Uvb1asZBVqfR/aQiU8mLvgQGr
         1kX+ufT9vHIoFlDMWwVrVmT/0xkPDHFZZgeUvNMK+hHpalN7BF8m7KPmNEbhOWpKUidw
         1iRVtF9CCdZC78nNRxNqwYld3MsM6IKMqaEm3DQ5+dadCmfjJ99cVzVoyR10XHuoGkUt
         sLchH8rijc24YaBnMwilUzmFTK8rxY0uxV3GzSycOaH3Y8AZD0Y4FUYKbvzeFI/bFQg1
         /Er3BrsHcH4lOo+n/xIwZfbBjoebJkRhDu4/oBCfaNdl2vUnmkl0LaGvvZsnjQ/DriEg
         OZJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D5gCg8QI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si7962611qkv.100.2020.04.27.02.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 02:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D5gCg8QI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT04x-0007p0-Tk
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 05:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT04o-0007oj-Hl
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 05:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT04Z-0001U4-TK
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 05:29:22 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT04Z-0001Td-HB
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 05:29:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id j4so25052088otr.11
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9/Pvvd9YuVSkjU51nhuEjAcNwQ3wEACDyG45mPpqrv0=;
 b=D5gCg8QIGFiGkQEquebuEjKyaF5PZSBF3XjnS3x3CdKEzB5EbqrFXBckysCBDkvW6g
 iEZTim8IAftsUU1ShYQZgeQK+LUwKZ0+OFNz79vYMiUlIy7Z1dVXPIBE0R8pkgxRoYhV
 G8jUphgfJBSZK4iDOAntJQrdDwel/1rudWqV2SZ0NohwUJAPRL82N4odno1F3ImV5aA8
 ZC/xfHQvCz/MBF3fxM71Fu+MGbMFTXx8BA5kIoCMLQsWWE3q/JxDzyIerd/oM0p4Jy5V
 vYUyMA49FY3CipRS6wCV3iyIQ41jLsCzMLYWXq/uVMN6xqGKAQWr7XIuM98mwx6iHOfp
 9c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9/Pvvd9YuVSkjU51nhuEjAcNwQ3wEACDyG45mPpqrv0=;
 b=aMy5dG67oalJ/+xS76st8njK/F9LndOtk3sUA3xyaDNXJsZcbR/JVSPq0MokiYeJry
 685wP7lybEFiTZbKLAEiW7XxjsVD7ByDCHq4jgR8ynBkIOm2MHXlpGm5EIf3jAIpYgBM
 LhWgZTQK8uqJnHFFDvU9uhM2or0Tt2b4jHG9pPmBr9erohABkjrylQNpPsHwvdqUdmou
 lYtEoP0L6HVvm0RvxN75caGLeUFgBJcCNF8JOZRmp36JaEyObq2Ehxm9764eqGJpXauE
 HD2zTZS8+vrRopRQ1GC6bkLxT2pUaC4MGXMujKDTKe8f+HmiVens22muXs4UiwyJ5d4j
 X2aQ==
X-Gm-Message-State: AGi0Pub8Pg8nFJBZW8dpWCjdjw3wz9O696y1DwTaPQQKZt5BOfvDp/wF
 eM30r3pFDcVbauKfY8+x2TE80QsZ6Y59r7V4L/xEfA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr17254586otj.91.1587979746399; 
 Mon, 27 Apr 2020 02:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-3-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 10:28:55 +0100
Message-ID: <CAFEAcA-aG-vRG14pTbpGnRqzJjGFiuTgKQ0qm-OdLOFPmVBYEA@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] exec: Fix cpu_watchpoint_address_matches address
 length
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z1C40esZ+BDI

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only caller of cpu_watchpoint_address_matches passes
> TARGET_PAGE_SIZE, so the bug is not currently visible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
