Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp912548lfj;
        Thu, 5 May 2022 01:55:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1iSWbAxP1TspsADTce9CiBBflAakY6+8VkYFkcWK+muuSuW1aRXbWFSzUISIkcqmgsT8L
X-Received: by 2002:a05:6214:e6a:b0:446:154a:7e02 with SMTP id jz10-20020a0562140e6a00b00446154a7e02mr21095558qvb.82.1651740914608;
        Thu, 05 May 2022 01:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651740914; cv=none;
        d=google.com; s=arc-20160816;
        b=s+I5AR5mUvEKxhSObTsFXNuoJQO5Q5Sg35ocYnI6lKnSYy4LIR4g1XLeTttnerTIt1
         dYkqpFbmfQHtOasQ9ifw7gy3k9iRJmSUX7kFrLfM1X1Ix4OpUcbQIkFAGFL7jFQl4x4v
         HOOEw768VJjwkMq/MT803SdMoJccv1oFT5jx2CTzQFR/ISzCBb3ktbTi/buyqlpgQG8I
         VnIvmISV2yfI+6NXXySwaxaau9/S28a0JNUWD9brFVZB2zXMrYenNGI9nNzNdZeGSxYL
         G+H02PxXx4ENqjleALzYmjw8fOy3XHlxl+KzPhwEe0s79+U6nWuX/2CsyZ30LeEgC/mn
         18UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2OUAkmqd3TtLJ9iASsoXg/T6HT031NA44UWZejGJNkw=;
        b=sVc/Y5chn8rpIgT3BK70hkg+j0yM1A4ktCDJI1linRfZHItYQu3tekAZZJKWI1lanR
         3C9PWJOViI9KYqc3JPmVJfxd84pgh5YvwJwQK2myL3cCmrk8WLEcdWnYtfv0mHxRvCfq
         MpbY6Lb0R5eY7TPTpH8hdEYToKa8LYsPWDsqvHiH0ix/hU9DM6g1yBJkbIB5UOzbkHov
         ky5u+nwNPtDHYxhiSavH+lSjMgn6IqrBhSv9WnRQHwmjhAq6JJyaoeSTSUArOZiGg6AE
         RB51XxiIp2KHu35MSmJowAAGvD5y53cg4PVwfifgaVARneleDPHLDPr3cClxYWGoAdfj
         mK0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tNH226wC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a37a10d000000b0069ffe8784cdsi445372qke.153.2022.05.05.01.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 01:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tNH226wC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmXGT-0002wo-UX
	for alex.bennee@linaro.org; Thu, 05 May 2022 04:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWz1-0004bT-WD
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:37:13 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWyw-0003nH-Uy
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:37:09 -0400
Received: by mail-yb1-xb35.google.com with SMTP id m128so6429737ybm.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OUAkmqd3TtLJ9iASsoXg/T6HT031NA44UWZejGJNkw=;
 b=tNH226wCxGwwG0aYTLDibDNB+qffgIoWSvyOG5RTTkd83aSU0sE+PlAb3zxpoYYraT
 C4Csw0dkmo1TG0wl6fbcFD3SvmbHKN/9CvztA4BYEDANc1ng5DFXg1NJRBIx+2caDM6J
 g6AD0s9li0JwMPI0e2kdpGE0lOP0mOGQiEQoHioeOAPNGZL4ipTmv3WpVBmRWHs9Uuio
 suESSNsH7LK4cZpIZpBhvVqR+LYWG4iAp6qu/ifg+e3pRT/1Dtp6aotbrEAZw92sDrmZ
 5j5Uv13nKRQ+cioHgL1eS+1Pt8R6xsIyXu2xrQexjTXi8lbc8QNo05MhkleAtRumnhox
 GEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OUAkmqd3TtLJ9iASsoXg/T6HT031NA44UWZejGJNkw=;
 b=mDo64kh1I/IbSNiP4PvlhkcheZYRmpJVggxWdI5iJ5Z8JGFNI9N0oWzBiEVdW0Nfwq
 sbX4HGYkiEzffvwj8RCVHDke4wv9+tq8y63kV51CRWMGFcplhpq6sDijEI33nx/0Z1R1
 KA6Pscb57RDhFVAm+uPcB+sPIGTeG829t9pq7q9kzu005pVnSiRt6asObUG1QAMcmY3S
 5coWeR5dwZE+sNdWTVEv51RY0xbMOP3304x8pjkwjWfK32j67g1xxe/l9jU7AhkGFiRP
 b7BVRn2A03+uMLItW9TFJu02CAwHW8lMZI9qldYNbhKAtjy9ZPg05DmRHuDOg8EbXh8n
 C/Nw==
X-Gm-Message-State: AOAM533HI6Qh05L7f9qi0kznGWBz20oRybTuThh2yB1f2Tk2yx7O+Clt
 TZf52DeZ2n9TUJkgwixkjVEfUDgJttf1UN+ZluT77Q==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr20855991ybq.67.1651739825939; Thu, 05
 May 2022 01:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220428132717.84190-1-alex.zuepke@tum.de>
In-Reply-To: <20220428132717.84190-1-alex.zuepke@tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:36:55 +0100
Message-ID: <CAFEAcA_vtq2M7X2o2QydkcEZbaVtmA6FdOqxgYLmdSwfYsNBUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: read access to performance counters from EL0
To: Alex Zuepke <alex.zuepke@tum.de>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+IVC1NzSHV4

On Thu, 28 Apr 2022 at 14:28, Alex Zuepke <alex.zuepke@tum.de> wrote:
>
> The ARMv8 manual defines that PMUSERENR_EL0.ER enables read-access
> to both PMXEVCNTR_EL0 and PMEVCNTR<n>_EL0 registers, however,
> we only use it for PMXEVCNTR_EL0. Extend to PMEVCNTR<n>_EL0 as well.
>
> Signed-off-by: Alex Zuepke <alex.zuepke@tum.de>
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
