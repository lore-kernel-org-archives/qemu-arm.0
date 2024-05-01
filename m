Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp754945ejy;
        Wed, 1 May 2024 15:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWemHIuHtZgpV+vbR59NTLpc0CcX0y09ghmm5660ko6MgdVi3stk2OmuSLX2739I5YNsnEdOQ9fG+skRaJsmsAyh9ZnB39n
X-Google-Smtp-Source: AGHT+IGjwkeDhPPVM/vJOpNfRd7UESPPCQad+P5lTDHHwOuR+TXqE3gR8wuvF6+Q4fDkPmAdub56
X-Received: by 2002:a05:6808:4285:b0:3c7:148d:660b with SMTP id dq5-20020a056808428500b003c7148d660bmr269425oib.59.1714601533186;
        Wed, 01 May 2024 15:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714601533; cv=none;
        d=google.com; s=arc-20160816;
        b=qNguE30JEorAjx4Kucg9GTRGNxJ9kxTvmNTRL34lWd8B2E3rNam8TcioKj8B4xvyKy
         YwGr526GWiqkZbbqgkeVKebhrXb3zR4uNGwcu7Dw+zGWkwChpA9PKFh8CL1ZKvVyESd6
         CPMLDthX22nlENmeV/EHV3LbZlVay19LeYfeCSllL7ZjNfU0rIttEqCdwDyqoRmSJP7H
         kJrdykIFHoTcbVEnJbRBtWvM8pXkd92VtMM6BjHLSz43YerPe5BT0F6ztypdE47jXAEr
         +eDhGiwYQjaN7RPxjsvDIeTyFaMnCxNfQDg9mgASCjh7HYXBFL8ZI2riTrlFSGSB6WzT
         67bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=hZg/dZR0vkvk2HcXhAWlMFGydx9gxdnr+bRvPv7OkAY=;
        fh=cd/Pd2JYiqD4PIRpN/zWzYUzRciApr1BpTuFdki24A0=;
        b=rQ9baaqTQGgwR9TlEkILV0sAf+Uw6p/+0A4eXNn73dKfo5TJMZYQ6zWZhAj/Ipm/Cb
         K4sSZMKgi464HK7ByJ/xCTWV4nAxmzwlZi7aINn2PWzjkxmXL73hjKfNWOK1EguCi3HJ
         LIa4ALMyo54wgtKhaavtLtIzk1xMDELQUPXBl4Vk1+Zc4inEth2ZYZMYKhGICzYWzw1D
         l2LMdp7QK/gcO89EWcQvA3uAFzJChJjfOXf3AosxWtOfw4jlkczDbJlzmEd1jcHqYjV6
         siLr+gdMnAydnRH5ijTD5kKmc0BgemsicudiGxScd4fhNQyXuxKObbU1xTZ9UR8x4thJ
         WiwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MDdirIhw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw9-20020a0562140f0900b0069b66fdd254si32372170qvb.309.2024.05.01.15.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2024 15:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MDdirIhw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2IBI-0005VB-Bc; Wed, 01 May 2024 18:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1s2IBH-0005Uz-Ox; Wed, 01 May 2024 18:12:03 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1s2IBG-0006aR-2x; Wed, 01 May 2024 18:12:03 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 128006199A;
 Wed,  1 May 2024 22:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF35C072AA;
 Wed,  1 May 2024 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714601519;
 bh=oczYVEObSp0SwvIKnSVleIAmfuVMgFghBTCjRwOLx6c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MDdirIhwF+icqMf5tLMx7XIap1CCkJDe5s4NqlnhZk5fHNP8QzgcxzmTfZtujatuL
 /50f+4OCUDA4ZYnQZChhv53/l9oD2Ij2UYYcsiWPDLzqnmCLYH0IYys5gexQBQ3xVW
 9Km/gIkzVAGi2YmfuKUn1NyvSQmIuq3qsCCgX5kXq+434qFYUrLf/rHi5bAQbz2jar
 odrJ0WbcnNW+0UCSYxinTvax7bXxpKZWUYVIRAYdYKqIQwrHDKXcoBA9OQwIiQMop0
 VehvLlhR/24R+ruQSLDTr5SSPuUSTiT0p0XT0yhhhBD8yg4w4SgP/EaGSW07tsFnq0
 uE6kHxu+Qjlsg==
Date: Wed, 1 May 2024 15:11:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 17/17] hw/arm: xen: Enable use of grant mappings
In-Reply-To: <20240430164939.925307-18-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011511040.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-18-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-TUID: ZkVeePHUB3ux

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 15fa7dfa84..6fad829ede 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -125,6 +125,11 @@ static void xen_init_ram(MachineState *machine)
>                                   GUEST_RAM1_BASE, ram_size[1]);
>          memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
>      }
> +
> +    /* Setup support for grants.  */
> +    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
> +                           &error_fatal);
> +    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
>  }
>  
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> -- 
> 2.40.1
> 
