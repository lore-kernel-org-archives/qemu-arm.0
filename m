Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6395662wrt;
        Wed, 3 Oct 2018 07:39:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV631V3wxzypp8qikG00tsHZdpyd2+8X69mPv2gd12ZFNxzxrcArWMsxn/cEzbHZ6uhuHY9mL
X-Received: by 2002:a0c:e88f:: with SMTP id b15-v6mr1506062qvo.103.1538577547679;
        Wed, 03 Oct 2018 07:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538577547; cv=none;
        d=google.com; s=arc-20160816;
        b=bWeF6WwDNTa1fPcMtkZ7fhDGYH5FF5PZLQ8qITFe4uy7FxkYZPaiaur8LHSnX3jweT
         4gXIgwwC573BHCN7YY9qnwgxScjqbtLrYlAx7aGFr5ez+iJZezd+xdTYejriuz8uo9mH
         g1eKL56+JsuaFXnhvj7TTd1TPABqBnZPA7dJyACa7IqnU2fULuO+dcvW2Tj4kc7Ngn0V
         6oqY1oOTT11Gst0eV8+jwUN1X6mtXKTCGQB3NX1ui+7mnCAWNI6VAO0zQPndZaf239Bt
         dxeUbEPsfEX0szqEEyNrahxt+U3DhSqtnTmEtV6srAQDuRir9v5jcobvmlVagISnOsif
         DELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=E7vGCgndugw2UJbscgZ1BqGZ728hvR1120dsahJifLQ=;
        b=fH03b8viLNr908S4LPvl1iwWjEGx6rSSDf8wMQcBcxjCummPrjr9aOxZCJQSJ7a7NA
         fkhPs6yuMT1lPAyjF+1USqwLEHvMelvrMFdFDwPFEmjxypPnNWdPhKYYyPU4SWfNLooS
         LC2KX6x3aDSWOeLySkCoyDd/LbWULfbeK3ZWIEktZtJFA+jirwRMshvu2uk2r//3L8Nj
         bLPPJgBR0PvnR79ufVtlGFuSz5AtTpRh/KhYHEvJn51MHs2VpjdktgUhvswDEqazaJbE
         BFCIcOnsm13lplBpXkK7/UXyOKdo29jON7bqc7QcjTia92IfnrhyGCYSmKfwZbpHf/sZ
         HgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m129-v6si977824qkc.196.2018.10.03.07.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 07:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7iIt-00063a-5i
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 10:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7iIf-00061u-So
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 10:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7iId-0001HJ-3q
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 10:38:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7iIc-0001Gq-RL
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 10:38:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id y16so6436499wrw.3
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 07:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=E7vGCgndugw2UJbscgZ1BqGZ728hvR1120dsahJifLQ=;
	b=SVKuu/g1ET1TZC1FEdivpuQcpVOVoqRoczgMWOSlTshmafhiSvAo3o1aqj+iobKSdX
	eNt1tNI9J5CGYvmY9H6WTL8sgKsu9d+A5f70WONyREcohQ3fCryR6LjKEFLH2uoEkpiz
	FjIA2z/870Sx7OLwaFbvAwUoJxodh2YslaAJ+a9pcYN01+9R6uGhEYzzHHQIPFxHFj22
	4rgj+jdR14Q2u1zdugjIQbew6DDZynhGi49cWq4w4GE3P/zz33NXZRgaqMssZLtHvDga
	lhV9ZboeT3p2XkYC05krrFL2iM/kB6z+KEr3GOohnJuMcTIm89u510Z/wZ3LJ/7TA51c
	pArg==
X-Gm-Message-State: ABuFfojLo3QjhjUVHohTohasI6PKTfW5ZcJwfPBD3qrdEe5ffh1APvNP
	x3mCVSFBtc08Z9pVc/1o/ITYLg==
X-Received: by 2002:a5d:4605:: with SMTP id t5-v6mr1472009wrq.52.1538577529693;
	Wed, 03 Oct 2018 07:38:49 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	r134-v6sm1190403wmg.9.2018.10.03.07.38.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 07:38:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <33b48c15-4667-3390-6abd-2f7978ac5c88@redhat.com>
Date: Wed, 3 Oct 2018 16:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/13] target/arm: Add v8M stack
 checks for LDRD/STRD (imm)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNN8tnRl3E5l

On 02/10/2018 18:35, Peter Maydell wrote:
> Add the v8M stack checks for:
>  * LDRD (immediate)
>  * STRD (immediate)
> 
> Loads and stores are more complicated than ADD/SUB/MOV, because we
> must ensure that memory accesses below the stack limit are not
> performed, so we can't simply do the check when we actually update
> SP.
> 
> For these instructions, if the stack limit check triggers
> we must not:
>  * perform any memory access below the SP limit
>  * update PC, SP or the load/store base register
> but it is IMPDEF whether we:
>  * perform any accesses above or equal to the SP limit
>  * update destination registers for loads
> 
> For QEMU we choose to always check the limit before doing any other
> part of the load or store, so we won't update any registers or
> perform any memory accesses.
> 
> It is UNKNOWN whether the limit check triggers for a load or store
> where the initial SP value is below the limit and one of the stores
> would be below the limit, but the writeback moves SP to above the
> limit.  For QEMU we choose to trigger the check in this situation.
> 
> Note that limit checks happen only for loads and stores which update
> SP via writeback; they do not happen for loads and stores which
> simply use SP as a base register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/translate.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index fcb33b8a503..c16d6075d94 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10278,6 +10278,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                   * 0b1111_1001_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
>                   *  - load/store dual (pre-indexed)
>                   */
> +                bool wback = extract32(insn, 21, 1);
> +
>                  if (rn == 15) {
>                      if (insn & (1 << 21)) {
>                          /* UNPREDICTABLE */
> @@ -10289,8 +10291,29 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                      addr = load_reg(s, rn);
>                  }
>                  offset = (insn & 0xff) * 4;
> -                if ((insn & (1 << 23)) == 0)
> +                if ((insn & (1 << 23)) == 0) {
>                      offset = -offset;
> +                }
> +
> +                if (s->v8m_stackcheck && rn == 13 && wback) {
> +                    /*
> +                     * Here 'addr' is the current SP; if offset is +ve we're
> +                     * moving SP up, else down. It is UNKNOWN whether the limit
> +                     * check triggers when SP starts below the limit and ends
> +                     * up above it; check whichever of the current and final
> +                     * SP is lower, so QEMU will trigger in that situation.
> +                     */
> +                    if ((int32_t)offset < 0) {
> +                        TCGv_i32 newsp = tcg_temp_new_i32();
> +
> +                        tcg_gen_addi_i32(newsp, addr, offset);
> +                        gen_helper_v8m_stackcheck(cpu_env, newsp);
> +                        tcg_temp_free_i32(newsp);
> +                    } else {
> +                        gen_helper_v8m_stackcheck(cpu_env, addr);
> +                    }
> +                }
> +
>                  if (insn & (1 << 24)) {
>                      tcg_gen_addi_i32(addr, addr, offset);
>                      offset = 0;
> @@ -10314,7 +10337,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                      gen_aa32_st32(s, tmp, addr, get_mem_index(s));
>                      tcg_temp_free_i32(tmp);
>                  }
> -                if (insn & (1 << 21)) {
> +                if (wback) {
>                      /* Base writeback.  */
>                      tcg_gen_addi_i32(addr, addr, offset - 4);
>                      store_reg(s, rn, addr);
> 
