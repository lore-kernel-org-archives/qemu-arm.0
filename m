Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21A60A2615
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Na4tS6jI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVU32-0006xz-1j; Mon, 23 Nov 2026 08:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xVU2v-0006va-76
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 08:25:25 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xVU2t-00044a-8T
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 08:25:24 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6b86fcbd647so5184953a12.1
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 05:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795440320; x=1796045120; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5uBHfXxarlQxThHI3qmHMfwnqha/W1yW36nDRLB1Shc=;
 b=Na4tS6jIQwBy0qAa9NGnAFETeh3kuflzkWZpuWPmfq3QkQtUKf9d+XehFMwagExZZQ
 lFur+x89PiKLsIufawUh9gkQ0WAOGbiEe3w/8h0/WgeqaUv/QImUSTSkJV4WGmuhwqde
 Mzl5eO81J8G1MO5DKmh76cvuba8/MDuTN1JSVVobFarfggFiMYnYmnUN2TdTM5BhBbvD
 ncXS5GPeAkA41Vv6wjKR+1NZzV2vW+z9qFcE0NfTfyS6pOkSro56h5kUsN53GNSegGxg
 QJ3TC4wB6ELmcaY6yBWeYOx44hZZNvTvMnUvzWbiJJYs7wx5Z8XELT+/dsQk2O5Qn0V3
 urfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795440320; x=1796045120;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5uBHfXxarlQxThHI3qmHMfwnqha/W1yW36nDRLB1Shc=;
 b=PZJ5fFswVDX868J+iY1A24TnqGeCe3YKtaagHf9a9Wu6dTjbyMI+jO+7KdTfLvg+5c
 edMAe4ol0e682loYEzwBajQoOdhUcfq60TGHCwRemGEF2FN8r6OaWWm8VveqM4LRFdNj
 5bskjj9ymyeI2nEjD6w4qgIARDyNr3fIc0LvuHowcPmkG4swjJJOpohzwWtijD8FTSBZ
 m10mT3zk0I4HyW//BBBxDpvxR8tVMtNLnezX73rLnCqfHMwXwo7g0oPSRM69Rd01kirU
 v6JHB8fIMl5xA/rr/x4umHYUBvE+wxjeOirnWDbldUgzGE2af0q3AwdkbfZCPJ4g2Jxi
 HYRg==
X-Gm-Message-State: APuU4Z9oR5uGub3iOZZOsxm+AakPSgBc7aEznkmozCvOxYVTTqURGsQc
 gc1r2slcSFegL+OLUObj1hn5WhaBQAjT+quiF4r1GFUfekfXc0CmGZGDd2iUAFY+v7w=
X-Gm-Gg: AZFdTZdU66edQJv2H4lNMzODqzSUUEP54JQXVEFr+KCC5oYRHGplmL+M0HUEHizGVHC
 Fdlc2MlEl9UDLW+9LOTpAdKkZ97yvGWiqXnblV77XO+jx58jtM/Ga6FlJuOBr1tiXiYBfZ34Baq
 G1ASw1mNNIJKtWgF4T5OJwkxj+IF//6zlCi96Ek7mhfLoufdIgM0CRaaXEoIsAguaSBebEn0Ka2
 pxxMtObQZ7iVd5s1r9dHEn0g/zDtLvHA3ETiES5idL2QUCRKJzuB3BhcR279DGcfaV2hM4DaZDY
 4ye9KrAGZOJW+LRpqMzSsFAffDem42xukcmfjIg2Hu9XmDo8VN4w+Lgg6uFAnQ1Dk/QD7sN/81y
 HuKsq7dw0SVVCuAL/Bkn39xeHm64tMOTLfxDc4iaeldVp/8BG4+zo2GUYWrqiWNAtfKK4m75LaT
 7lXvyuMewvoM+WFCeFjmOzDAOZK2Q5K3otghcZt6nyDTijyD19gQB21bEnW1UverF+V+XCDSfoe
 d3lnhCrwGlCG3crf9shGBrQid/QDmROGjCKBlpZO3siRG7lTFCJ3kANyYiiXAbwT7UyHqMUPYXU
 QhNlzarfn3hHbx37Zzvnun65J+32rXG2
X-Received: by 2002:a05:6402:13d6:b0:6ba:a799:d9bb with SMTP id
 4fb4d7f45d1cf-6baa799dc20mr2261300a12.9.1795440320194; 
 Mon, 23 Nov 2026 05:25:20 -0800 (PST)
Received: from linaro.org ([2a10:d582:31e:0:638f:5754:a31d:8f22])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba370cd368sm5325860a12.8.2026.11.23.05.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 05:25:19 -0800 (PST)
Date: Mon, 23 Nov 2026 13:25:18 +0000
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
Message-ID: <awQ-vnYjY8BEAdFi@linaro.org>
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119165546.3050013-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 04:55:46PM +0000, Peter Maydell wrote:
> In various test functions for VMSTATE_VALIDATE() fields, we check
> whether the migrated region number register is within bounds (i.e.
> less than the total number of configured regions).  These tests fail
> spuriously if there are zero configured regions, because then "x <
> cpu->pmsav7_dregion" is always false.
> 
> When we allowed v6M CPUs to have PMSAv7 in commit 157f6c69edd06, this
> exposed a bug, because we now have a CPU which has PMSAv7 according
> to the pmsav7_needed() function but which is configured with 0 PMSA
> regions: the Cortex-M0.
> 
> We could fix this by having pmsav7_needed() return false if there
> are 0 regions; however, the cpu/m-security vmstate struct does
> migration of the secure equivalents of these fields, and we also do
> a VMSTATE_VALIDATE that checks against the number of MPU regions
> there. Making those fields be migrated only if there is more than
> one region would be awkward (we'd need to pull them out into their
> own vmstate struct), and it's unnecessary -- migrating something
> that's all zeroes and not used isn't a problem.
> 
> So instead we relax the checks to handle the "no configured regions"
> case, insisting then that the rnr field in the CPU state (which
> should never be used) is zero.
> 
> Similarly, we adjust the check in sau_rnr_vmstate_validate against
> sau_sregion; this one is currently theoretical as all our CPUs which
> implement the Security Extension have at least one SAU region, but
> architecturally it is permitted to implemnt no SAU regions.
> 
> Fixes: 157f6c69edd06 ("target/arm: extend PMSAv7 support to v6-M CPUs")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index c3aef3f3301..d624425c0dd 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -593,7 +593,8 @@ static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
>  {
>      ARMCPU *cpu = opaque;
>  
> -    return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion;
> +    return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
> +        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
>  }
>  
>  static const VMStateDescription vmstate_pmsav7 = {
> @@ -693,14 +694,16 @@ static bool s_rnr_vmstate_validate(void *opaque, int version_id)
>  {
>      ARMCPU *cpu = opaque;
>  
> -    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion;
> +    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> +        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
>  }
>  
>  static bool sau_rnr_vmstate_validate(void *opaque, int version_id)
>  {
>      ARMCPU *cpu = opaque;
>  
> -    return cpu->env.sau.rnr < cpu->sau_sregion;
> +    return cpu->env.sau.rnr < cpu->sau_sregion ||
> +        (cpu->sau_sregion == 0 && cpu->env.sau.rnr == 0);
>  }
>  
>  static bool m_security_needed(void *opaque)
> -- 
> 2.43.0
> 
> 

The logic makes sense; it would be nice to have a comment in there explaining
that RNR==0 indicates an unused value rather than a genuine region numbered
0, but I'm OK with this being applied as is.

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>

Jim

