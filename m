Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2D7C624D3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 15:29:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1QPd-0007Un-Mj; Tue, 01 Sep 2026 11:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QPc-0007SD-1T
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:28:36 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QPY-0001du-TA
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:28:35 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-81f36179d72so452557b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 08:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276508; cv=none;
 d=google.com; s=arc-20260327;
 b=HnXgwbcIisxecvVSZ52vtMxREhX3X/lst/KSkoHtCWBi4IAodaimsLGl2wh/NU8wHP
 svDY4Kmv/qUK1Hq+t+0puIbyh8rL1ymqaaficZYC3pJ20NqLyRPqvgXoI3DhtPHUDGjQ
 U5Q6Omsp1MRm335cN6QluM0GalTB83qTM4dElfgk+wCJ0mu4VhrUpjfE9ksg1a4Ic4Ms
 iKIiDx00LPLhB5bUEzyChxcqscxKTMzTxCErGHth41d5uYSfKCoET3RJcyf3Q0LSSnrb
 ARrp6x6Vk50LW33Ovei2qVNE4kAtObdWg8kltxQIGmRTDUrPdi5hDCtEypK+GDNshf24
 Zq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Shgzb5eJJo9lYhjmGyOmo/iUM2L9WckXZSOG7+edZvU=;
 fh=2yJTiOiCu6Er+02GTCjaJCeoITQaetLiXQBgABGa1ms=;
 b=WRFb47jqlALWVhS57xAjwSbtuPahmw99yGxwHmZt5Q9KuUSXGoo4z6tga1HyFz0lPV
 Yc8rPOD1xmv/c/stn3K7/q2F1rY77ktRe7SGCUghqQShLNOn5rf+LHaGQYsWUB7CKzMz
 fzBoN5Lh4VDxMMMPzid7+moK1j9CzFkmJhfEkL6ZFZ8/SrKAKXaV2qtwwUewib3O8IGf
 zVAwN7mB5fZexU6TFKs7EbPiK2srC47K6qHwGjcOjP9bz1CY6Ze+/mlFCecpLi/NIeZn
 9I+LlJ3vO9FoHk+eQfhRmKBSPbwIQ2XVDhcQ/q5ymhXpwy3TrtY3z7FLbERHcJf7r/VO
 XbyQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788276508; x=1788881308; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Shgzb5eJJo9lYhjmGyOmo/iUM2L9WckXZSOG7+edZvU=;
 b=ELOg+ZPm8pboWOsLFH2mbJ3itW6tczXGHAkFxkP9WSE1mOoqO89jQvnWEnsWpvOETk
 s5EYNxoWbBpIWQKkh+tytzMM6sbtu1jubhjilefA2Zg3PL42XRikaLTwMhJ+OXfPqJdP
 e5JzIxGm3GOd7KDzU5VE41qDTVKBaKwnJPcwPLamtLyZPcodlAyAJbfJOM7XQRir/h5M
 u00hMOBmkXYkduRO12RUSXxaeO4eSlxZejE8muEBgeyyB0xM/KKI48SzS8sDEsfYP2e2
 ZinjNalaIucwJwviaMTRYt/K3sVhaGWSx8gL/NB12KPQASqKVCre355oy5UTqo61WX33
 +gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788276508; x=1788881308;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Shgzb5eJJo9lYhjmGyOmo/iUM2L9WckXZSOG7+edZvU=;
 b=rscaWA0EjAbv86HV0+jRJrwxsZbJU2XhdddOb77fnNgWDPsekIXpciRCnCEU8lIiGI
 p3ysNkfDiucNrQLNEuoQMpqp5rtumjJimUZ2Fy1cxGNweCoL9BUdDWB6fObbdE42s2bL
 sODUosXBqcyK18xACIcMTKcdwcfUmxrVCxguF6otT//zFKaeo6dO8kr8e3SI7tbW9kh6
 9C29fg2/wyfRsa37LjCCa4ArDh0pi9QfaDQ9bZ9B81a2SBX44OTA+XLWmOGcnJdE+cl3
 WYOOiOxaUr3XJdl2Bz6XY6lsaDXSwgcjmew1gDy9ZCQG9/99IVo8dGPiMQEZYWy/o1mb
 7r8Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwvZHZKKquIYvqsCdgKMx3oprKrN4aoyYJVb+yAf9nopclsOhFxx+7vkjMMiOundLrwu+78Mnfow==@nongnu.org
X-Gm-Message-State: AFuF++liCU1vV75uwsCIuftTasQLitNq/k0dveNU0ShWCSvuTNlyTTwD
 SlgBsfU80cFjxlkJCtaA6L2CPHw+isWjyzfe+G2FbbEyOgNKCajluptnO9lfV754eOsi42/jdka
 jIU9LIGw3VKWyxfpmEwQ3wQO5Df6XBrVt/79XvYeFpA==
X-Gm-Gg: AYBFou1dsGaP0WJVC5vqDMbgZSvb82W3S57UZopWKM8jUIIi3XcuEpR0wNNbzPn+UaY
 y5sYvtsZNOj985EDFE/5Sk/MbZQedEJSFTTw69XzdkNx2Sj30ixKtGmsk7uz65vybUcHZciDb+9
 hj7sJpITdPhXhChkv31iBCXLnoz4PkbaWpqskd1PWgLs1X2XVdu0NRDGl6aFsCWflWIJFod3WLy
 C+dJkgVW5uIR2eI9V1P7IU1kQiy0Ir/tMxON/aX4XtnHB2Yq5bHnraD7hxDctbqx7lapiJAG7Ma
 btLoxuLHijva+HAJIDw38Z6y/hLI04nihENNuOhCaAqP5DM3G/BUTqYUETMKnWvt1EnZYdEjD8B
 Q/G71DGkusa9e+7II7ZYxl9KBQ34R
X-Received: by 2002:a81:8a06:0:b0:866:7724:3bcd with SMTP id
 00721157ae682-86677244407mr47618307b3.16.1788276508474; Tue, 01 Sep 2026
 08:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-11-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:28:16 +0100
X-Gm-Features: AcwNN1UEijV3u2vwuPn9QJOEPmesDhDxIlcb0F-5KajZ3mCR4IXC3hbHoeP00Rs
Message-ID: <CAFEAcA-MVRya=Y8i+rURHqizQzJLh=Gp5tQxHSK_VNBUQCAzdg@mail.gmail.com>
Subject: Re: [RFC PATCH 10/18] accel/tcg: Replace size with first/last in
 probe_access_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
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

On Sat, 15 Aug 2026 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Propagate the API change down one step further within cputlb.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c2ea31a397..b8c23b2948 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1358,8 +1358,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
>      }
>  }
>
> -static int probe_access_internal(CPUState *cpu, vaddr addr,
> -                                 int fault_size, MMUAccessType access_type,
> +static int probe_access_internal(CPUState *cpu, vaddr addr, vaddr first,
> +                                 vaddr last, MMUAccessType access_type,
>                                   int mmu_idx, bool nonfault,
>                                   void **phost, CPUTLBEntryFull **pfull,
>                                   uintptr_t retaddr, bool check_mem_cbs)
> @@ -1375,7 +1375,7 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
>      if (!tlb_hit_page(tlb_addr, page_addr)) {
>          if (!victim_tlb_hit(cpu, mmu_idx, index, access_type, page_addr)) {
>              if (!tlb_fill_align(cpu, addr, access_type, mmu_idx,
> -                                0, fault_size, nonfault, retaddr)) {
> +                                0, last - addr + 1, nonfault, retaddr)) {
>                  /* Non-faulting page table read failed.  */
>                  *phost = NULL;
>                  *pfull = NULL;
> @@ -1423,7 +1423,7 @@ int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
>      assert(addr <= last);
>      assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
>
> -    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
> +    flags = probe_access_internal(env_cpu(env), addr, first, last,
>                                    access_type, mmu_idx, nonfault,
>                                    phost, pfull, retaddr, true);
>
> @@ -1440,6 +1440,7 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
>                            MMUAccessType access_type, int mmu_idx,
>                            void **phost, CPUTLBEntryFull **pfull)
>  {
> +    vaddr last = size ? addr + size - 1 : addr;

This can never overflow for the convenient reason that all four callers to
probe_access_full_mmu() pass a size of zero :-)

Do we update probe_access_full_mmu() to the first/last convention later
in this series ? I couldn't see anywhere we do that, but maybe I missed it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

