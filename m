Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2898242lft;
        Thu, 23 Jun 2022 05:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1segIT2RpHKZeubGAXe7altAKUfaSNUstP2YCU/BUyyplImRPyo5/EMgaGhIIGggs8EkvyZ
X-Received: by 2002:a17:907:7f1a:b0:726:2b37:7b82 with SMTP id qf26-20020a1709077f1a00b007262b377b82mr585799ejc.366.1655986203539;
        Thu, 23 Jun 2022 05:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655986203; cv=none;
        d=google.com; s=arc-20160816;
        b=JmlMt96JqXNjQUntd1Dqc46nf01lQ8lUivU2BFJNjDYCxC6PB3CWwlRRcfx97psj8c
         JZihP3OMreNNZN3ByMC0OwsILBRulYEBCHG4TJmqLYBXWiDGmkEymWEtSPFFjE2Hs41l
         I5MCwvJdMRGangcmusC5cHPyj550aPPdhWUK6x93gcBAuXg2v0j6ZKP/0emIsEwL/0az
         EAv/JTOsssQp5RGimvEwvCUn/AgMb64xwNr8cxw1sEXJFyHqFWAmL53zWqC3G9uwf95O
         dSbrHLXChGnsozWyGJN2LJiqa9x2whfBO1qbPA2lKm11/yv/fHrvgMGLA1e+A/+c2g2t
         PZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Rj2IQIRXEwPO3MqdpLjbc2Opunh49LwrJk1NZLdjUA0=;
        b=he2fJKWtXXt6+7P6kdlWS+8yASFHsgcx+3HdJ+W5R3KYD6M/H1y1sO5WRg7pzAN2mh
         QGyE1/VKWP4jVNw4v3oxe6bJCfU9bATdJW/u6FdhvJA+115pqD2v4MOGCa+a0yeX6rs7
         ir9hq1eYEsspQnFT+0F3nLodqtBgfqUvQ8SE44nS9IfVmBEcVr8m7Cj69KAikbtDdLD+
         9ia4FSA6seYZXDgqoB/JNr8ombNW3JfpEEs8iM52nLFL7os3KltHZt1yg61hoxzYWcjx
         HjEnZQnfkn1c+3h/RqX2aHoQE1O2bd5Ork/9pCLTQNt4CvR69p9x4/AT08nRyrBPutw7
         qYPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qOxVxK5b;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id he32-20020a1709073da000b006f3ac80590dsi17922907ejc.526.2022.06.23.05.10.03;
        Thu, 23 Jun 2022 05:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qOxVxK5b;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiFWMKB (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 23 Jun 2022 08:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiFWMKA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:10:00 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6540A4DF6F
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:09:59 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3177f4ce3e2so168205207b3.5
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rj2IQIRXEwPO3MqdpLjbc2Opunh49LwrJk1NZLdjUA0=;
        b=qOxVxK5b14uQCqT5tdHZOo8VILOVSdjdE2TuIRKvnDEnD7HjwP9kfRqbUx9jnZZptC
         IqRhbxc4Oz1T2vhU0cLlKtOy4QNi6avs9VpMLX3eRY2uGLdzMucyDeMhR1sUvUjdniyb
         /QAXcMX65NkF0UpDSCnZrsASMm6pWR6bHQ+jfpBZkDbSyx1j5NfGz49+MdGp0TL5DBB9
         CGbXAK9qZcjabJW5LE/d4yLbKcP1KsOc6seyt6Z+++RF7se6HKXlKsJt7CoGKLAgctbU
         HJcpX0JtcyoR/oLIDFknhKYW6d7VN1NBIRTViwPo9Im1b53ZEySoLr3UZ1hy9C6ylhQ5
         1XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rj2IQIRXEwPO3MqdpLjbc2Opunh49LwrJk1NZLdjUA0=;
        b=w9ZWlgAvCmdj7v2AMjWNyeG8Ql+INJGBsUm3dQSDNWSDeZGln9Qz7FKWkT483sJAH7
         kql0BZJsh4xa54fvGxrG880pEbxKkS9vtprfTwdWrNABkutpusAkNLeLuBi2VScYeFHr
         kxBy4bsQrV53hPeToq5J87236rR7PoKKxdeREOcgPy5KWQBShj7MApwV089NKzijF7ib
         JrV9z5Fc2Hh6NGTseDsq9IJBApPXnkAOnDWkFExayBwdN1jBpxDOA6dALRO8zqy85sq8
         /C0JoAritOOEcFnp65+zdp98Rpb4PzFKDO7O+Ex/2EWvCkNX8t8CqzBfk+N7EuwdRXip
         fOtQ==
X-Gm-Message-State: AJIora9WMZP5BEeWk5T2igzsSeNeIUE2rGsUB7oUfvPH4qIWqz0P0+51
        wLmMJnaXxOnjt7t7VHDNOfZjqBJJV5+hs7Zl30ghXp+7qEs=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr10191655ywf.455.1655986198507; Thu, 23
 Jun 2022 05:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220623095825.2038562-1-pdel@fb.com> <20220623095825.2038562-2-pdel@fb.com>
In-Reply-To: <20220623095825.2038562-2-pdel@fb.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 23 Jun 2022 13:09:47 +0100
Message-ID: <CAFEAcA_V5m4dfmKgO9vgPHr5cg_MWp_MqOsZNJcGnA9t1JmS=A@mail.gmail.com>
Subject: Re: [PATCH 01/14] sysbus: Remove sysbus_mmio_unmap
To:     Peter Delevoryas <pdel@fb.com>
Cc:     clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
        berrange@redhat.com, eduardo@habkost.net,
        marcel.apfelbaum@gmail.com, richard.henderson@linaro.org,
        f4bug@amsat.org, ani@anisinha.ca, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Bule6aEQYxzC

On Thu, 23 Jun 2022 at 11:59, Peter Delevoryas <pdel@fb.com> wrote:
>
> Cedric removed usage of this function in a previous commit.
>
> Fixes: 981b1c6266c6 ("spapr/xive: rework the mapping the KVM memory regions")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

We only added this function for the XIVE in the first place
so I guess it makes sense to remove it now it's unused.
(People doing complicated stuff that needs to unmap MRs
should probably not be using sysbus_mmio_map()/unmap()
anyway...)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
