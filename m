Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2434128lff;
        Thu, 5 Dec 2019 10:18:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEDxbMXjzgTW0x75hfb13iaWeSkaBcSxYuJOej1fRaEOXfptLg71M3gSw/IuPP6YqKTRbY
X-Received: by 2002:aed:2a39:: with SMTP id c54mr8925956qtd.339.1575569918155;
        Thu, 05 Dec 2019 10:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575569918; cv=none;
        d=google.com; s=arc-20160816;
        b=VLynu3Qql7Z9jxAl/KDdNUC0xu/lMuYwqtlfKsvL2crhLEjqNsEK2hYjHr0MPbNbz+
         u1ltkDi9Frg0YaWaQ7SIS4mqzl6HnF/hktrOO9x6+NNaGoLsnlHEpJAG4G/nRhhPzv5f
         WpPk6Ori00vLnhUeGsWHghN7y5DxzP0NTAvLsi7MatvEd0SBZwaeLUwx4Zfhl6BDmuZz
         VpGmnMQzhX/aFxLGqCWKgA9JSpdQ8w5lby8hMIeqbeTq6gDRNG1/r4uY608xQcFOvVgI
         4XwCNAFilcfyhDHsdhr9xQxKSG/eqMqt2I9XWhp7bC7hdASOzSjNYANjgMv10ttcw4pu
         As8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZ4Mv11SbDP5AhWiY1/9jeSZG9dC8AF0VxMGlBUfvlo=;
        b=0TsM6xc0EIhve96AD4Nm91wD11tKGg89Heku1xK1yF61TsmqRZ7X8qF+3KLRK3891c
         kIQM866GDvuIjtf8cpQXtfr4J+unElgdeoQddwRqAGGMCUM0KFDp36vGR0DP/M4hsu6F
         Bj7l3cGCBXROKhY1YDTrevmqI1k77l7Wm6Xi7kpT9nYuYX4hrI71qTviZc4AmWr+WX8W
         yWNj0hJ6nwIJ/D9HC41+QUexxsCKRWNleLjn5agXio+SImNJdzOxBs2rLCjBzUDl1ptp
         AsMd9eCSTsOB9B8i8sbV1QjS9UMa+o8bOnGprt5Vs/wPRiI89SVvN1IN3s9hJb2+y0b3
         6TnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ipl2EU0N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si7217575qkj.278.2019.12.05.10.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 10:18:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ipl2EU0N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icvi1-0005qZ-Hl
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 13:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icvh7-0005om-Iq
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:17:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icvh5-0001DR-QY
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:17:41 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icvh5-00019g-Jx
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:17:39 -0500
Received: by mail-ot1-x341.google.com with SMTP id r27so3423709otc.8
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2019 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZ4Mv11SbDP5AhWiY1/9jeSZG9dC8AF0VxMGlBUfvlo=;
 b=Ipl2EU0Nj4ZgDIEFzKSAjPGLxvdDU6FB7z0H+28C46+NaH88JCG/94tMI2O2DIT1eG
 f4JN8+xm2HKsjFudmLkE/0rzk2E3ZaW5p8JcIey0JDKhbluASgJNJxTpDe3xe79DKTwO
 FWrMHErCqvaBecO+jZe1ROvWw0N0Tv4KfNbxS2JJGJpZN6+rU1fi1UQGy7rOggyTcNJ/
 UDcU4fv/KCZd09zWix0UmGIzDxCBOtOf3CnpGvU+QbOXg1sZwPr0QpWPynqAFpjiEmbV
 UO8ybBBRzgrYWsDk3h5z/DyQGDHAwH94mn57pVT/pijUw5nccb1hcgwb6moJe9ugRb+5
 cScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZ4Mv11SbDP5AhWiY1/9jeSZG9dC8AF0VxMGlBUfvlo=;
 b=i4c18hEntP1JuIAwDk+kygMAwpDOSwZjGe/wwFUpbGecXtsqt7I3ahyS4hEN+8+NyZ
 OYzlrvF3IrVJTz9cBEm6K7TZE4u8qq9io7/dXiDB9SuDQXCtj8j3fv/t46mTSTCOnLrf
 isBkIYwdxbKPAlYgeAxKRUTYX3nRxqpOw59QDPLpbnoAtXgAq+TXp00tsuJ1wykCa99a
 KVCyeJbslzG4tlwZN9HfRUFJ6/kxli4jPZtjub66QQGgC1VOG++q8qHDZKRupzhvwEEO
 lWeclmPHiBJsjO2gQUxKIpKjG8Md8coc2o31BLQ1lwvBMvxTxHFsrcthOOP4Uxqkbv4p
 Fzww==
X-Gm-Message-State: APjAAAVIqSA3ar4y3OhX2KG2pWYVuECyc9ussDAX4EM0lAt9UlXYMUxr
 6EYElvtMngFlBka90ytsRw6GMkNBeFtU6aiibZSK+w==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr1878403otd.91.1575569858679; 
 Thu, 05 Dec 2019 10:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-17-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 18:17:27 +0000
Message-ID: <CAFEAcA_K4wreQRXxEdDB4M-NCBC3NmGTyT0aEZxfAwBbSp23Rg@mail.gmail.com>
Subject: Re: [PATCH v5 16/22] target/arm: Implement data cache set allocation
 tags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ua3fQ0jcKKE1

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is DC GVA and DC GZVA.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Use allocation_tag_mem + memset.
> v3: Require pre-cleaned addresses.
> ---

> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index f1315bae37..e8d8a6bedb 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -510,3 +510,31 @@ void HELPER(stzgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
>          }
>      }
>  }
> +
> +void HELPER(dc_gva)(CPUARMState *env, uint64_t ptr)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +    size_t blocklen = 4 << cpu->dcz_blocksize;
> +    int el;
> +    uint64_t sctlr;
> +    uint8_t *mem;
> +    int rtag;
> +
> +    ptr = QEMU_ALIGN_DOWN(ptr, blocklen);
> +
> +    /* Trap if accessing an invalid page.  */
> +    mem = allocation_tag_mem(env, ptr, true, GETPC());
> +
> +    /* No action if page does not support tags, or if access is disabled.  */
> +    el = arm_current_el(env);
> +    sctlr = arm_sctlr(env, el);
> +    if (!mem || !allocation_tag_access_enabled(env, el, sctlr)) {
> +        return;
> +    }
> +
> +    rtag = allocation_tag_from_addr(ptr);
> +    rtag |= rtag << 4;
> +
> +    assert(QEMU_IS_ALIGNED(blocklen, 2 * TAG_GRANULE));

Could we assert this on CPU init rather than in this helper?
That way if anybody tries to create a CPU whose dcz_blocksize
doesn't work with the TAG_GRANULE they'll realize immediately
rather than only if they happen to run a guest workload that
use DC GVA or DC GZVA.

I also had to think a bit to work out which way round this
assert is checking: it's testing that the ZVA block length
(usually 64 bytes) is a multiple of (twice the TAG_GRANULE),
which is to say a multiple of 32. Given that the blocksize
is stored as a log2 value, this can only fail for blocksizes
16, 8, 4, 2 or 1, which are all fairly unlikely.

> +    memset(mem, rtag, blocklen / (2 * TAG_GRANULE));
> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 49817b96ae..31260f97f9 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1769,6 +1769,15 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
>          tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
>          gen_helper_dc_zva(cpu_env, tcg_rt);
>          return;
> +    case ARM_CP_DC_GVA:
> +        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
> +        gen_helper_dc_gva(cpu_env, tcg_rt);
> +        return;
> +    case ARM_CP_DC_GZVA:
> +        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
> +        gen_helper_dc_zva(cpu_env, tcg_rt);
> +        gen_helper_dc_gva(cpu_env, tcg_rt);

I think this means that if there's a watchpoint set on the memory
partway through the block we're zeroing then we'll take the
watchpoint with some of the memory zeroed but without the
corresponding tags having been updated. But that's probably OK
(at any rate I wouldn't worry about it for now...)

> +        return;
>      default:
>          break;
>      }
> --

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
