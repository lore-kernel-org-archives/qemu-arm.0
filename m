Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EC6CA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 16:56:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEUvx-000060-CO; Wed, 07 Oct 2026 12:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xEUvR-0008O8-KT
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 12:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xEUvP-00009a-64
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 12:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791392125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VL5W1eRn7bDnhNopgQYpgFIUvfysdptlcOdAW0y5Mic=;
 b=U3S7ET+bhUSZJFlhesVGoo6ThYV6rbZVUTyE2WfsgOA5QxNtT+5PYP1f8HP1d1NoGlqRn+
 ff2CG/ZXEiOGDJMf+TZJpDiCu7WyUO/PJIHR4ygaF8pJjtzhfhyx8U3F1aTskdc2cIyIvN
 S87WVjB9FEZZcjV9i47tCkq7ns5rw4Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-SuOtol3zP3moHwYqN0OQJw-1; Wed, 07 Oct 2026 12:55:24 -0400
X-MC-Unique: SuOtol3zP3moHwYqN0OQJw-1
X-Mimecast-MFC-AGG-ID: SuOtol3zP3moHwYqN0OQJw_1791392123
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-495689bfcc8so34635565e9.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 09:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791392123; x=1791996923;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VL5W1eRn7bDnhNopgQYpgFIUvfysdptlcOdAW0y5Mic=;
 b=t6rxZu8xLfSXKxL8xtRNgF8TA+dQ01HCe1aRVLc898fXklp5h7hOUJ2H2vO1oTH6Zk
 XEs+fiwgdGXW4m7yb04tdLZffeV85dUAHtLpzzykzyy03WQlqfA1ila8+TXIgwpEpHPA
 O0s4B0laPEEOo/6kCkYKTMAoqhdWY5OQBOvUFUHialC+u7a5SV8k4cNx9Ps+FVVkF88P
 DWpCidxs6tyeZjrXaT0zfP5F7VBI7/Xi3cM1pQ9QvU6VmTLLbNKbj7X/9BMUb8jTkKOp
 zjneSceKlJcPTrVd3vMEaqocMlNyh60QSrN5SnHGUsf4enzSXrsw/djwJW4ToTTOGG7H
 fSlg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw+YhfuYsL3XUc/JjwyBTffHb7BvuN7wvA9goqVZcZY4PziYIRyNjXg3z19lo1arliN2eH0nK/uGA==@nongnu.org
X-Gm-Message-State: AFuF++lYaG7NXcTXiUD9E+rjrycamL+cfn0COS+3t3ZandGyge5VfXP0
 Cfmm+aXsq6cvTmx1SK1XOft8FM/z9g/BRKSVwwlyPrjkO+2qjL9fTg9nvGX1NgkbpE4Lkyf1gN2
 vQO4c45fMjzJ4/WibWcWtDHE/OV5Dp3Ed5H2MetXQoEk884BezWiPqw==
X-Gm-Gg: AYBFou3HhNDz5M2Qa1O21iAk2855yBgISMeboAW4I2ocyjknWEEY+k7uhUy8iy87xuN
 KVdfYiqUx1dCEOmafHZG7M/u8sGzehYi3s10ADKEF+7bxFqoxVHSFFX/kAxn0nDwlIed22+cv8h
 wucTK9t3JiFBji/ixmm/CFpYZ8wJO127rJSKGV2QZOhOnXiOY+lc5rCyXOyrE29lZfg9ubqNl9A
 1iU2KWcksIcadT7GBufvYw6w4yHm8LwE9XLkh2Baqw9e8Z0Gi80Fm5xTg5tjR+SlvK9GDSUfWGV
 8eCEsf+aaNG491Hz1E6T9nlT8IhCclallIy5CBTM/prx2uCYDWolVkIL7g==
X-Received: by 2002:a05:600c:64c5:b0:49e:817a:ca7 with SMTP id
 5b1f17b1804b1-4a1802e960amr50642685e9.8.1791392123264; 
 Wed, 07 Oct 2026 09:55:23 -0700 (PDT)
X-Received: by 2002:a05:600c:64c5:b0:49e:817a:ca7 with SMTP id
 5b1f17b1804b1-4a1802e960amr50642425e9.8.1791392122904; 
 Wed, 07 Oct 2026 09:55:22 -0700 (PDT)
Received: from x1 ([151.67.89.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17fc4a588sm64202585e9.1.2026.10.07.09.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 09:55:22 -0700 (PDT)
Date: Wed, 7 Oct 2026 18:55:19 +0200
From: Gustavo Romero <gromero@redhat.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Will Deacon <will@kernel.org>, Itaru Kitayama <itaru.kitayama@linux.dev>, 
 Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 1/3] target/arm: Clear TTBR[5:0] from a 52-bit table
 base address
Message-ID: <tebrqylcupcfka4lqbmtfnhabyhcylpvynzqkqzbhab5zh63qg@kinh5l5u2j4o>
References: <20261007080019.350315-1-fuad.tabba@linux.dev>
 <20261007080019.350315-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261007080019.350315-2-fuad.tabba@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WNtVmYc7DPZQKHvUuWJSnq7JOpBjnFlnfbfk36rwP2s_1791392123
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Fuad,

Thanks for separating the fixes from the tests.

On Wed, Oct 07, 2026 at 09:00:17AM +0100, Fuad Tabba wrote:
> get_phys_addr_lpae() can read the first descriptor of a walk from the
> wrong address. This happens with a 52-bit OA when the initial lookup
> table has fewer than eight entries and its base address has bit 51 set,
> or bit 50 for a two-entry table. The walk then faults or translates
> through whatever that address holds. VTTBR walks for stage 2 take the
> same path.
> 
> For example, the 16KB granule with a 48-bit VA has a two-entry level 0
> (FEAT_LPA2). The 64KB granule with a 44-bit VA has a four-entry level 1
> (FEAT_LPA). KVM's page_fault_test hangs on this in its 16KB, 52-bit PA
> guest mode under TCG, as reported on kvmarm.
> 
> With a 52-bit OA, TTBR[5:2] hold bits [51:48] of the base address. Such
> a table is 64-byte aligned (R_KBLCR), so bits [5:0] of the base address
> are zero. get_phys_addr_lpae() ORs TTBR[5:2] into bits [51:48], but
> then clears only the bits in indexmask. For these tables indexmask
> covers fewer than six bits, so TTBR[5] stays in the address, and
> TTBR[4] too for a two-entry table.
> 
> Clear TTBR[5:0] when forming a 52-bit table base address.
> 
> Reported-by: Itaru Kitayama <itaru.kitayama@linux.dev>
> Link: https://lore.kernel.org/kvmarm/B4C0AC3E-6A4F-4A7B-B7BC-81207539115E@linux.dev/
> Fixes: 7a928f43d872 ("target/arm: Implement FEAT_LPA")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  target/arm/ptw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index de0435a58b..6cff52d592 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2107,13 +2107,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr = extract64(ttbr, 0, 48);
>  
>      /*
> -     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
> +     * With a 52-bit OA (FEAT_LPA or FEAT_LPA2), bits [51:48] of descaddr are
> +     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: a table
> +     * under 64 bytes is still 64-byte aligned (R_KBLCR).
>       *
>       * Otherwise, if the base address is out of range, raise AddressSizeFault.
>       * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
>       * but we've just cleared the bits above 47, so simplify the test.
>       */
>      if (outputsize > 48) {
> +        descaddr &= ~MAKE_64BIT_MASK(0, 6);
>          descaddr |= extract64(ttbr, 2, 4) << 48;
>      } else if (descaddr >> outputsize) {
>          level = 0;
> -- 
> 2.39.5
> 

Reviewed-by: Gustavo Romero <gromero@redhat.com>


Cheers,
Gustavo


