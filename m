Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6055257wrt;
        Wed, 3 Oct 2018 02:09:06 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60CNQnXq0dX/ZpUfph6HIrIqILbqbMag2LA5YT+EnKekHhaHeoRfbxLlhNJySbQH2x2ZWds
X-Received: by 2002:a0c:d48d:: with SMTP id u13-v6mr371557qvh.165.1538557746542;
        Wed, 03 Oct 2018 02:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538557746; cv=none;
        d=google.com; s=arc-20160816;
        b=cFb3OR4AQOFeT3JEYljKgxbqR4SukK5EPISP5C78XVuLv7+e89wEDAi0O6bDUsDqCp
         bUFWDDwjmfV0rJRAH00kySPKarEqcz/wH/rj+vN2TOnNlpnL5KJD8A+ePZPelQ4XXgpV
         GfZWIKj5TuCsMC4PvW17GbZ7FRfvdj449F61JaucHa1Q2E04Oknd/YnOkLU0A4ZBlQH+
         +zupGgfJV+5TMpYCXWSqfWcAOkpdse+SHHUmcCtxS9u1jduP5hSCOGTy9iK88nfqs0+G
         7MUgS+5HvhfYt+lm/BRJ4Cati6m5ec24dt8JbctnhraN9+j3UNZ4Iz27FCJXhBowWyxG
         1Rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=rONKTRv7s8Sx99rgQ06hezetyS7eXUHNURtyqD3+tAU=;
        b=pCVg0Nb7szx+mGEo4jrzaUDMP4WlLwTbvkSgMprj2VdnxPpELz6kElToE0Q6ew8EVU
         j7SFVzgkLd40QnOZFB++sIOd4NQkpWeZHAA52GW3jk0i/sU6JtU7Bt6y72pW1o15ny5G
         HWWpoOL7ACUwaXGLnU4nDjPDUq+aMH29/H7E8pYGq3kHKfAGZPtCqgon++B2J9wRGuKa
         NWPMc3X4/V4kiwe07/5P0gP/bxnuFYqAiKXbCxj3oe5pOX/ipZvOeraAlPa5GkQCZj6l
         pG6JahNPk0VdfQkLmnKt1+jJXagZW9DaQRxOxm8HGJdlmRaZltmRmexia9BMWafkRWql
         VShg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2-v6si489513qvp.41.2018.10.03.02.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 02:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7d9W-0006vZ-0G
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 05:09:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7d8u-0006uz-Pm
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 05:08:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7d8o-0001go-Qx
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 05:08:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7d8i-0001dR-Ez
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 05:08:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id z204-v6so3993435wmc.5
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 02:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rONKTRv7s8Sx99rgQ06hezetyS7eXUHNURtyqD3+tAU=;
	b=H+QMsrEAvx/iTGj3CQu10cHNXpP8+dlrIexmp7+m+PUk3drY2bVL8CZzkVYcNZwTx/
	s4AlJVqCTSyKAWT1gLANLLBuRI/8cK/8gUnA7Z4Z2ubtIjCfsz2Fw7V51xJBJEKeg9B6
	Dngjvr/v5iW1m/66WElFogTEc+Z5fg4hzJF8zK3LJnVHag1XfqD7vsCGoDLOiDw2mKWD
	nz8Nzv2wQA7VjaZXN+Hj3uJc/kDAWYJQRPJ6VuOqLWFYoWV+T4RiQK3zXH9OOVpChRke
	QOMFXSrt+8Zx70AetjGVrzEpJ1ZWKgkROfOtbirJM1zRL2Mv6Ow3cMEOnu4DfryxTscQ
	9M5A==
X-Gm-Message-State: ABuFfohCX+6U8ikBB7HWly4rafub5ixPfQIGgfOuUTfAREsKNtLHk9Wz
	hc/1Mjtl/F1TH8QcNteZtjtq1w==
X-Received: by 2002:a1c:f016:: with SMTP id a22-v6mr762200wmb.76.1538557694292;
	Wed, 03 Oct 2018 02:08:14 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	20-v6sm1633911wml.10.2018.10.03.02.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 02:08:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <12ba5ed0-a35e-65db-47c5-76b87c522ec1@redhat.com>
Date: Wed, 3 Oct 2018 11:08:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH 09/13] target/arm: Add v8M stack checks for
 Thumb2 LDM/STM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DzWNOy87Wt06

On 02/10/2018 18:35, Peter Maydell wrote:
> Add the v8M stack checks for:
>  * LDM (T2 encoding)
>  * STM (T2 encoding)
> 
> This includes the 32-bit encodings of the instructions listed
> in v8M ARM ARM rule R_YVWT as
>  * LDM, LDMIA, LDMFD
>  * LDMDB, LDMEA
>  * POP (multiple registers)
>  * PUSH (muliple registers)
>  * STM, STMIA, STMEA
>  * STMDB, STMFD
> 
> We perform the stack limit before doing any other part
> of the load or store.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/translate.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index c16d6075d94..3fb378a492d 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10524,6 +10524,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>              } else {
>                  int i, loaded_base = 0;
>                  TCGv_i32 loaded_var;
> +                bool wback = extract32(insn, 21, 1);
>                  /* Load/store multiple.  */
>                  addr = load_reg(s, rn);
>                  offset = 0;
> @@ -10531,10 +10532,26 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                      if (insn & (1 << i))
>                          offset += 4;
>                  }
> +
>                  if (insn & (1 << 24)) {
>                      tcg_gen_addi_i32(addr, addr, -offset);
>                  }
>  
> +                if (s->v8m_stackcheck && rn == 13 && wback) {
> +                    /*
> +                     * If the writeback is incrementing SP rather than
> +                     * decrementing it, and the initial SP is below the
> +                     * stack limit but the final written-back SP would
> +                     * be above, then then we must not perform any memory
> +                     * accesses, but it is IMPDEF whether we generate
> +                     * an exception. We choose to do so in this case.
> +                     * At this point 'addr' is the lowest address, so
> +                     * either the original SP (if incrementing) or our
> +                     * final SP (if decrementing), so that's what we check.
> +                     */
> +                    gen_helper_v8m_stackcheck(cpu_env, addr);
> +                }
> +
>                  loaded_var = NULL;
>                  for (i = 0; i < 16; i++) {
>                      if ((insn & (1 << i)) == 0)
> @@ -10562,7 +10579,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                  if (loaded_base) {
>                      store_reg(s, rn, loaded_var);
>                  }
> -                if (insn & (1 << 21)) {
> +                if (wback) {
>                      /* Base register writeback.  */
>                      if (insn & (1 << 24)) {
>                          tcg_gen_addi_i32(addr, addr, -offset);
> 
