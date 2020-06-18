Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1657042lfm;
        Thu, 18 Jun 2020 06:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZqmfXIH5krPqoo7ozGlvslzVuvT/VsNA7b1zdoBrn3fyWP1F8/NHxrKx35TZEDMQAqpKG
X-Received: by 2002:a5b:707:: with SMTP id g7mr6323592ybq.136.1592487890284;
        Thu, 18 Jun 2020 06:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592487890; cv=none;
        d=google.com; s=arc-20160816;
        b=oGo0WCzReIfLOGOe3O5QNQGQTw9iFLBqhw7CEoLwcxcth3ZgpbYoz5igqzYuaPJ19Z
         yOYDKA7bRTLxAip45wnsTt2gUEI3hQtMxaWolaVeOHQD6xsgaPCNSZi4BGDQBbhcVSG5
         5I5+OMc+O5/SjVWJPoFXvJqYJB9GwAyeStTnTEDNZI7a53EX2EtyzENPZ2gCedmbv8DX
         JW3jeEH7Esibt3yfU8qsJp24OQE2QYAQu8dBuuENeDmTjMA8EoUQLHyXTXy1BLLTYtRc
         VN30maNuJp79hGio72YNdPNjSUzjGkgDDmMmv8LEo1fiOIJC3f12NzEH8qG6vnj+5wR5
         71Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fkjHCDpYTARpMaa7D3EA8CbN8CCSa+lbQaizLJq9WzQ=;
        b=mVA6LuKnT7H6oBWVu/xkhl0HQbCF/AYYM/Ds/xcsIm0wUBWL/A2dpr6yrQTKIyH829
         SM67wLLRg1ssjFYvbD9B5eHt7HBv9UqSC7lXfIbzwTOKDyVeW/FFvOs9BS/8yYn8Pa+V
         RgQFWhAacITnvL36bSFYfY+J2bzaPj4ucGJZI7ylzKfxZ33mIrYEN8lYU57l0O8jF8jX
         U1HVyRQ6hscW9q4RRmSRY7HkHUo2JtPHC0BtbR0vuwyzYXJQcuS/A/AZ2nb9AmPnURe2
         PadpxyMCxuX75OlSXeB/RwIV2G+nXhf8MdErEyyJMU18ZzFViUh1Gb9zYrFv50GczpEw
         sErw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=neU5bLcQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si2273321ybd.465.2020.06.18.06.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 06:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=neU5bLcQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jluqX-0003tp-Ml
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 09:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jludy-0006s1-5m
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:31:50 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jludv-0007iX-JP
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:31:49 -0400
Received: by mail-oi1-x242.google.com with SMTP id t25so5048416oij.7
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fkjHCDpYTARpMaa7D3EA8CbN8CCSa+lbQaizLJq9WzQ=;
 b=neU5bLcQUTRTlbiT92KjLzVjMtyn9VDgYDJtL7V7VKulrYO0RQAPd7n8bpen501Ihy
 lfz3d5OejwmMdU67R/dxKyPpMpwd0sDxIPBEDX5wA072/pUHRnFEahxFMaKq5dZITcw2
 lzX0jeGvTPaicf5WqjNleyF6ha7+UOg/JEuiusmn3A18iwL9vpCTjfxLglAGO9CcD8Q/
 Sb7fvxCAaaPQMdZKFkvD2mwDwMkFzjzM9qiZULGW2FkTV5/3lbrKDi5tYorhh7MQ+IXW
 oKtmDLVeaUn9VrlEJNuYGpFSYAEJN6Q2VqOS0sqqjcQ4fqzPRbdicF+E+BnHs+U/G6W4
 mMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fkjHCDpYTARpMaa7D3EA8CbN8CCSa+lbQaizLJq9WzQ=;
 b=Vkg6/ggiKffUTr+LUf3biJIybrNa4DySlcBJDEDHIwIOER3S+xucXiVVzkRsLKEyAj
 1lATKWGpur2bS5Na9qZp4Wm2YihOOcbfeE2HXn6mlr3QFF2QtQIA27HkSX4lF5MI6noQ
 esR36C6wjmW9grGsZzJ8DRA7GHhQra0+ySpm/Ul174LXFfYdykTTGHugk0JVmRk9y2Mv
 gFtLtsh1uWxWKfurcXWRO6YFmKipzCa17MX9qs3mvqGfZ2N8S848M19rthIl4TzVJ+Pu
 LIfk57aniaiaRils+NBl/MqLfvkW2TpYisChbX4vHYaaRHNiRZ6tUG5uepblGqJl75wV
 OmxA==
X-Gm-Message-State: AOAM531Msty/ie6gT9b6NheqmFk5e4jdC2V+pEQmWOnANg0FpkofxoYe
 EU0Qbt/pXavd3yF6Fmv3UyszYi6jWykHrpP9znjpFw==
X-Received: by 2002:aca:5152:: with SMTP id f79mr2780017oib.146.1592487106235; 
 Thu, 18 Jun 2020 06:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-14-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 14:31:35 +0100
Message-ID: <CAFEAcA86dH_utZzXdbvwhB_67OgVGc249tO6TOBtfw+nWi2-7g@mail.gmail.com>
Subject: Re: [PATCH v7 13/42] target/arm: Define arm_cpu_do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tmhJa6gP500

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need this to raise unaligned exceptions from user mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Use EXCP_UNALIGNED for user-only and update cpu_loop.c.

Could you update the comment in cpu.h, maybe something like:
#define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault; also linux-user */

and also update the string printed by arm_log_exception():
#ifdef CONFIG_USER_ONLY
            [EXCP_UNALIGNED] = "linux-user unaligned access fault",
#else
            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
#endif

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
