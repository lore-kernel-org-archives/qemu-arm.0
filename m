Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2052FF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 10:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHfu6-0004QZ-Ag; Tue, 28 Apr 2026 06:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHfu4-0004Px-CQ
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:42:56 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHfu1-0001G7-Lq
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:42:55 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-79ea87af213so172298937b3.0
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 03:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777372972; cv=none;
 d=google.com; s=arc-20240605;
 b=IvmIXA7nq6ujHfKR2LjFhfFkZgB5HRgJ0u4iW95PoEDg0TTQyqaOSUWbP4LAvTKKB1
 e4acLBmy7T8WY3s5dahf52W+wIPlbJnQQg48W+0veig/ulp63UPqg9vwl9+0syqi44fi
 EQfyylxIi+YfTp6TQDPAHwcKZSEnhcNey9LL0APLRJr3KM1MdHiZRMoiGSIKl9gX5ucl
 OkW33U+aHy2rphKX/DY6CpABUfpdSL4fQgmdVs9pMLFxMSIqo/9A1pEo3V3hOvO23bau
 9+omIjq+o5tSQXbBjlvGchEGwFP0kmvc7+2QBYy791PzsRoFY53aROEuZHA/RS0r2crQ
 FGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XyuLJ2acgigc4inJToIhuacAWML7bwST1UsRNbAvs/s=;
 fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
 b=aprpJT7+Do/D5WUSLXsVvLXdpxY5LuFn/vcJlprB8S2ADzOw1ycWV6xlA/zgp5N9PG
 iistypW4z8vKd/f9EjaaLvmJN1uSw9V3nFT73fAGmgndTq1gJDSeAXO8bJGKuS/mp5Zz
 3N+ftLdWuFkYU69iz/zpx/L3MSzxVEqzVbf4y1Diw5ejLf1QhE0U9Z4297bEMNJXKhYF
 N5xpuy5mOik3f7E1GhFI0Ag9h6GQQO/S4acvyG3UUB116D+vUeP9Q9qQLqKjaJ2aXvvG
 8FkiVQGnz0HopC+Uv6s9KJitI0M5zKrZNueeGI57wlTaryvdFHherQBeBRI+tY6ABwIW
 xd+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777372972; x=1777977772; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XyuLJ2acgigc4inJToIhuacAWML7bwST1UsRNbAvs/s=;
 b=IcOhjG9ZK6rGFrvlItPtUUA/UhBRqOwRjTRoPRhq1alHOc8mkKthJVSI6DdIkIbcnM
 nZL1vhvrUZRRNCvB+89SFufdf/PuWmSwetgh4kisx7hJjqxnUXLHLlcq+azb50Jgkx/T
 GFxS5tDevdMQGl/jhP1zFRrvQbdekerapbcxbztMTObIHJ+P223uURVrA1q5mXDqdO99
 2pCX47C4Bq4pFLKSRWXNz49H2vFX9xzBMY2fn/1N6oKu8T4VzEP/uovyr5h5PLB1LxPc
 3uT9qEwMYHWGSp0PUPazUr1mlrbMG+QylbkITtiJPRJLNJZnnMT2O5YaCWPZueumDzi5
 98mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777372972; x=1777977772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyuLJ2acgigc4inJToIhuacAWML7bwST1UsRNbAvs/s=;
 b=TcMJ382PjCe5Is6OtA/+NHn5HL9IoDqiJUDz9ExTmxA5s7a2/uM8O++p8XQXm/Ono9
 MVlkF50I2jxO5uhEc0rKUfPPmUxyymtjD46KTftdWrfFzZO+y8vMKYYf2K5zpCYyAeXS
 XaNiP4L+KDaxBUfWEboTZb4WJGUdlo32PNWRy2Aoif9vB02AFFgUEyIP93TpHuqUWKaO
 3HoN0ifoZ7twP+2ZwDm/rHmKXts+ayz/F0baQ+GDM9h9oDN9YG4xVDhSHAQ6eOsDjAZU
 AZqVlXN8QPeElMZFmTfUkfCpfqWhCL3d5DWtc+W5jwVCw0QxKetTcMwxiEcLXQrpm3wF
 x+zg==
X-Gm-Message-State: AOJu0YwPTzbKbANtEyA7rYPvTlElP8G6xkkyhirmQQRw3sdrGgn/dG1C
 o32uCLBB+GZv01xbgVLs9xCZN8D9Po1RyzKkX3M/iaH+9znAqEXhaFk0kVt3EzAOJAzGeJR1Jmf
 fpMic9GcGp82zDH8GdfEVvek/xapRmWkaPZDo6/+8+g==
X-Gm-Gg: AeBDiesjXVnoTE/mQOXpwcvA+oD2MavrLHnzr40+nYY0q9ctbXLdAFkwJ1kvkuVudUQ
 MUbLa3p1l3F4uZKz4qWDKfv+5A1Ioo89yahyeVLQ1iuHSET4qGf8yezuU1Rjvlemu2spiVWHVaG
 NXDPUvSA6FphB4jS8Qu3pgYFLKa+zztqVikoPslwbo89K61G8/QBYPEuJnwW3y5J+8OIiFe8N/d
 SFlWCeACwY60DStN4hWT+wX59//d8yu8azTNpywjh7/sg+9CRhtl5Xi8RloYiOV8sEi9dRGtET1
 BEna2Bb6fV9qJoPWhJ7o6KfEGlwmg+vwNzSN3Ja0MzqCd6Y2gVKAVqLI9/oPxn4YPz7HmeTowtV
 TJw==
X-Received: by 2002:a05:690e:140f:b0:651:c221:9649 with SMTP id
 956f58d0204a3-65bee79ad34mr1754987d50.19.1777372972016; Tue, 28 Apr 2026
 03:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-15-peter.maydell@linaro.org>
 <09da5690-5b9a-4930-8fd5-cecf1e3b8eb2@linaro.org>
In-Reply-To: <09da5690-5b9a-4930-8fd5-cecf1e3b8eb2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 11:42:38 +0100
X-Gm-Features: AVHnY4JtrHZuJtxqxJ4E0rMQpdCF9R8l3F06nd1BOiw9dHd2UWWMt4DHF_H2XTo
Message-ID: <CAFEAcA9-HLzGBFpZu58Z+Y9PNEGQFVBAYiM8Y3oCcYRHdGhsTg@mail.gmail.com>
Subject: Re: [PATCH 14/17] hw/core: Implement new cpu_translate_for_debug()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 23 Apr 2026 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/18/26 03:31, Peter Maydell wrote:
> > In cpu_memory_rw_debug() we need to do a virtual-to-physical address
> > translation for debug access.  Currently we assume that the
> > translation is valid for an entire guest page, but this may not be
> > true if the target implements some protection regions that have
> > sub-page granularity. (Currently the only such target is the Arm
> > CPUs when using an MPU, as in R-profile and M-profile.)
>
> RISC-V has sub-page granularity via Physical Memory Protection (target/riscv/pmp.c).

If it does, it isn't implementing it properly, because nothing
in target/riscv sets CPUTLBEntryFull::lg_page_size as far as
I can see.

> > +bool cpu_translate_for_debug(CPUState *cpu, vaddr addr,
> > +                             TranslateForDebugResult *result)
>
> Whee!  Thanks for the new API to address my comment vs patch 10.
>
> > +{
> > +    if (cpu->cc->sysemu_ops->translate_for_debug) {
> > +        return cpu->cc->sysemu_ops->translate_for_debug(cpu, addr, result);
> > +    } else {
> > +        /* Fallbacks for CPUs which don't implement translate_for_debug */
> > +        if (cpu->cc->sysemu_ops->get_phys_addr_attrs_debug) {
> > +            result->physaddr =
> > +                cpu->cc->sysemu_ops->get_phys_addr_attrs_debug(cpu, addr,
> > +                                                               &result->attrs);
> > +        } else {
> > +            result->physaddr
> > +                = cpu->cc->sysemu_ops->get_phys_addr_debug(cpu, addr);
> > +            result->attrs = MEMTXATTRS_UNSPECIFIED;
> > +        }
>
> We should really make a point of getting rid of the fallbacks.

Yeah; as I mention in the cover letter I think that would
be a good idea, but I wanted feedback on this API before I
went to the effort of converting other targets to it.

> Would it be less churn to drop the get_phys_page_debug to get_phys_addr_debug rename, and
> OR in the page offset here?  That plugs the -1 ambiguity in the short term.

My preference I think would be to take this series basically
as-is (as you say, -1 isn't actually a valid address for
our current targets) and then update things to use this new API.
A corner-case problem with the old API is less important if we
are going to get rid of it / limit it to targets where we
know -1 isn't valid.

> I realize that microblaze must be converted to the new hook, because of its tlb oddity.
>
> With arm and microblaze converted, only x86 still has get_phys_page_attrs_debug, so that's
> an easy hook to eliminate.  We can be slower about converting the others if you prefer.
>
>
> > +        if (result->physaddr == -1) {
> > +            return false;
> > +        }
> > +        /* Indicate that this is a debug access. */
> > +        result->attrs.debug = 1;
>
> Does MEMTXATTRS_UNSPECIFIED.debug make sense?

It's what cpu_get_phys_page_attrs_debug() already does for the
"CPU only has get_phys_page_debug()" hook; this is just inlining
that existing code so I don't call cpu_get_phys_page_attrs_debug()
directly. It's a bit odd but really the only thing that we use
the .unspecified field for is that the IOMMUs check it to see if
they can look at attrs.requester_id etc. Debug accesses are not
going to be going through an IOMMU.

> > +        /*
> > +         * Assume memory access permissions are valid for the whole page.
> > +         * Targets where this isn't true should implement the
> > +         * translate_for_debug method.
> > +         */
> > +        result->lg_page_size = TARGET_PAGE_SIZE;
>
> TARGET_PAGE_BITS.

Whoops.

-- PMM

