Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D0BCA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 16:56:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEUvw-00005c-S5; Wed, 07 Oct 2026 12:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xEUvf-0008Qr-8w
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 12:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xEUvd-0000An-Ob
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 12:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791392140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ku5thg3aChzpKTjHi3n1YmGTn1lkrgF8wd72zhF6Hs=;
 b=eGi2dZjEknGBHd/+WYr5ZnT1Nm27eJVBJBXeZXXIGz9XemoABp3CqyUuOwluTY6xZpmMyE
 DyS4/vHcZmBUn8HwEnjQwr6UH/jJzqQj7kjXKy/YQVLFZOiXfeXq7IcxkiWI2dPgvBoVxy
 5eMN6IixlXJ2R+jgc7LyQyYztaH17IQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-qVuQqH-VM-q_ljYfg0l-eg-1; Wed, 07 Oct 2026 12:55:37 -0400
X-MC-Unique: qVuQqH-VM-q_ljYfg0l-eg-1
X-Mimecast-MFC-AGG-ID: qVuQqH-VM-q_ljYfg0l-eg_1791392136
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48c4f6f6691so3640826f8f.2
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 09:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791392136; x=1791996936;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8ku5thg3aChzpKTjHi3n1YmGTn1lkrgF8wd72zhF6Hs=;
 b=tZUpDasznIIlasmqaI8ZvGmyOo4sLO84CYTHd675BDy1ccwrg6WhFbU22jHJmySRCn
 azQYwQrnTWE/Xl0lsYsE4sLzUycY00+ChUY/X7o9cdBmTCZQsYJWZdorbWJGY2jjXd/f
 juM5jTL4TwjpJJVLSGR2lBD4BI60jrxP+Ix7vlde2n69MCtQxyqdXQSYGq/6BWNdcgEa
 d+J9HopttIqj03+d9DknlK58Luas6EeKtp1InoP3E8XGSFILFpnESox0+Pm/hjcvoqzC
 I+PRH9rx36yTqxc+AZIpqQsYuf9lPw/SPlVVUMku1ESQnZGJwJoJnCvkV/QS+YS+sVNa
 OCHg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJCOf8SkRBCchlciGihOlgL5OEeDKrsHPujjA3navX/7O+h2ZX7D92sq8YyO/t8WB6r84MAt7huw==@nongnu.org
X-Gm-Message-State: AFq9FYLzFugP18cOC2biqeOrQ3BxnUav7v5jq0Ppv82kvz4UeX6CePxm
 qej12ul/JK67uE1YoQM3XoNC6aqrbvZaiC4G911ijoNVYxGMLJEGmdX2Ov/RVlTXKUuYBXhaGmq
 JtsILeAGJ3QhmRaLY06aZU9fYZBq8+SJPFtNax+HYp/s5dzX2QB3LFQ==
X-Gm-Gg: AYBFou2DANM305lvGrHsawV9evW2ES3aFgNL2Q5y7+DonOqlOuROR7gDbXi+Ykl34bt
 wDxJ7wYaCE293XkAY6kyJc3Zs+ppNBYTKYp3ItmTj6uLt3lP7T9eG/KPu2X2Qpj4rLtpNoz9N57
 BCE/x5tt4RfVO3ZpjyVD65HuGi4/yD6d5ubSGNslA9lktyS6rhNN5tScP9U92cM4vyP1vLWlM3f
 WMatNYdhrriQDx6vxLK67F/26KsBlWsgref+Ei2uTVAL5lPJCeKtmCGb2Bb19FiP4DpCKCK81rg
 dC9nqlMtNfsuH0Po4Py4zOJzbwq1ZAxQZbgQVB3GpN/F/UsvdGcGWKHh9A==
X-Received: by 2002:a05:6000:4b13:b0:488:8411:1d08 with SMTP id
 ffacd0b85a97d-48c7288d2a3mr6088623f8f.48.1791392136293; 
 Wed, 07 Oct 2026 09:55:36 -0700 (PDT)
X-Received: by 2002:a05:6000:4b13:b0:488:8411:1d08 with SMTP id
 ffacd0b85a97d-48c7288d2a3mr6088577f8f.48.1791392135822; 
 Wed, 07 Oct 2026 09:55:35 -0700 (PDT)
Received: from x1 ([151.67.89.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d3f05asm8612186f8f.55.2026.10.07.09.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 09:55:33 -0700 (PDT)
Date: Wed, 7 Oct 2026 18:55:30 +0200
From: Gustavo Romero <gromero@redhat.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Will Deacon <will@kernel.org>, Itaru Kitayama <itaru.kitayama@linux.dev>, 
 Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 2/3] target/arm: Use the 52-bit TTBR base address
 layout when TCR.DS is set
Message-ID: <vpyo5tvkaqof5mzv3fm6albieapn6vlmontktvvmig6hcgulla@43jfwowmhpso>
References: <20261007080019.350315-1-fuad.tabba@linux.dev>
 <20261007080019.350315-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261007080019.350315-3-fuad.tabba@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JIszv6x1U-U6rXG-HAZotomwNizX7GiHcC17kVhEA5A_1791392136
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Oct 07, 2026 at 09:00:18AM +0100, Fuad Tabba wrote:
> With TCR.DS set, TTBR[5:2] hold bits [51:48] of the translation table
> base address, whatever the OA size. If the effective OA size is below
> 52 bits, setting any of them is a level 0 Address size fault
> (AArch64_S1TTBaseAddress(), AArch64_S1Walk()).
> 
> get_phys_addr_lpae() uses the 52-bit layout only when the OA size is
> over 48 bits. With TCR.DS set and an IPS of 48 bits, it takes TTBR[5:2]
> as base address bits [5:2] instead. A guest that sets them gets no
> fault: the walk either succeeds with TTBR[5:2] ignored, or reads its
> first descriptor from the wrong address. VTTBR walks with VTCR.DS take
> the same path.
> 
> Use the 52-bit layout whenever TCR.DS is set, and check the whole base
> address against the OA size.
> 
> Fixes: ef56c2425e5f ("target/arm: Implement FEAT_LPA2")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  target/arm/ptw.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 6cff52d592..2e67d02493 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2107,18 +2107,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr = extract64(ttbr, 0, 48);
>  
>      /*
> -     * With a 52-bit OA (FEAT_LPA or FEAT_LPA2), bits [51:48] of descaddr are
> -     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: a table
> -     * under 64 bytes is still 64-byte aligned (R_KBLCR).
> +     * With a 52-bit OA (FEAT_LPA or FEAT_LPA2), or with TCR.DS set at any OA
> +     * size, bits [51:48] of descaddr are in [5:2] of TTBR, and bits [5:0] of
> +     * the base address are zero: a table under 64 bytes is still 64-byte
> +     * aligned (R_KBLCR).
>       *
> -     * Otherwise, if the base address is out of range, raise AddressSizeFault.
> -     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
> -     * but we've just cleared the bits above 47, so simplify the test.
> +     * If the base address is out of range, raise AddressSizeFault.
> +     * In the pseudocode, this is !IsZero(address<NUM_PABITS-1:outputsize>)
> +     * in AArch64_OAOutOfRange(), but descaddr has no bits set above 51,
> +     * so simplify the test.
>       */
> -    if (outputsize > 48) {
> +    if (outputsize > 48 || param.ds) {
>          descaddr &= ~MAKE_64BIT_MASK(0, 6);
>          descaddr |= extract64(ttbr, 2, 4) << 48;
> -    } else if (descaddr >> outputsize) {
> +    }
> +    if (descaddr >> outputsize) {
>          level = 0;
>          fi->type = ARMFault_AddressSize;
>          goto do_fault;
> -- 
> 2.39.5
>

Reviewed-by: Gustavo Romero <gromero@redhat.com>


Cheers,
Gustavo


