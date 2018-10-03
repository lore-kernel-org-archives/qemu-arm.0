Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6161583wrt;
        Wed, 3 Oct 2018 04:04:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63VSJaFftbAITtuYas8OrU5yU+p90NxVMBvoQqX3Ycaoq3Gd6cT9JJ1sYFFCvi4D+tSHTex
X-Received: by 2002:a37:b101:: with SMTP id a1-v6mr639148qkf.222.1538564645638;
        Wed, 03 Oct 2018 04:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538564645; cv=none;
        d=google.com; s=arc-20160816;
        b=X6pJb/2Xii76uJVj4aAVQpfeCCdEypRu1GBRetHzXyZP2YEApAV/tW8yTMiPd2lrfc
         EGItE7KyqJaNNzqqobA6/Vt2Hqe3GuvrLCNaXtrK/VfQA0yVWVQ5kPmrRBSmIUqCzZe5
         9dw5KHmOPj4CIyW7aDLuAqaLaaTxHeZM7i6TSIM7mEVsVUXLZLpcaJdxJoOTt/mQT6mW
         N8ZWVugCcBQGN2Hanzr+8ExHy8wmTVRvXObBGLIhw5HBSqrNpEld0glFwaXJwKVWp/V0
         MVPySQct5VOQOQHZ/gjcb9TSxbz/X1uBTAkH8gmkrWZFBLlA4FA4N1IUMm81Qq2S3raD
         yUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=sMZ9vGrvFyChoxKEE4JPUzSv9FP+es2+9680npWDpzE=;
        b=XGedz/ZwLF69wPsMPHEHYEUyZd3sc+m2MLDCw3L7NMG7401NHE9HVlO1Rl1rATIg+1
         WeySNesCCvGjeDxp0C9kA/9Bn9VCs9gnExn6CI6MNdmD/5WhoTLP4ZS+eWBPILBE/FrC
         gK9HgXvNG6EK2l9VZwtDlUySJwSh00B495GxDsCxLoPL/edsXueyo9aRzAN/AWC+Rl1y
         +GIut/3PLT8MB2fANTg4eVUb+vPlm4Hnt3UXR/7YRjdiYLajFeP4rYOoqECcPIXqXzm0
         7g7QCe7JTXPZSbSBOzayJ6buy/tRPM5bK+VH9I0+rAReGbxjsGhDFd0pxAlnQ6UDHJgh
         y/kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16-v6si622892qvh.46.2018.10.03.04.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 04:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ewn-0004zH-5k
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 07:04:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7erB-0007hq-C1
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:58:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7edm-0000vL-Mu
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:44:32 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7edl-0000uL-TZ
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:44:26 -0400
Received: by mail-wm1-f66.google.com with SMTP id b19-v6so5220683wme.3
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 03:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sMZ9vGrvFyChoxKEE4JPUzSv9FP+es2+9680npWDpzE=;
	b=FZR7FLX5ZAkWy6RPTe2WldXO1bMaUtV20O32lBKvKCaGRKBa9uy2ydEjEcYVHQPY2m
	ac90P3D4eEN+I5x0vgRqMPXlC+t/GPelZmmULsraKgDPaR0PC+6Y7rmyBdfVh/bqPBdZ
	I3FpdfuPDBLpQfskp+9huLh9BxZWA4YPSaEUjw6t34NMAcPzPA3GDbhI6Ic4qRtyXP+W
	NoC/dy5Lci1WgLbuJpoAdpY7v8KpMICzzgmXjet7DMUjGV03LnvBPLL8X/xDsWQwBh10
	Q1vs0koPkX0NU5xA6EaKDtXaACw/tPcSoUh0ED2h0QlwRLAuMxeCvQ/MU2hcelz0Zd6G
	oWFg==
X-Gm-Message-State: ABuFfoirU0KB5pVM1QRmVgWgT2gGjh5v7oIahK2tzzxzcQVkpOV323A1
	xHHoiF2J/ppeFjrKLQMlgSW0VQ==
X-Received: by 2002:a1c:1d6:: with SMTP id
	205-v6mr1034906wmb.151.1538563463844; 
	Wed, 03 Oct 2018 03:44:23 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	w2-v6sm1603357wre.46.2018.10.03.03.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 03:44:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd541478-05e2-fcc3-98d8-0f4cb9f126f3@redhat.com>
Date: Wed, 3 Oct 2018 12:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/13] target/arm: Add v8M stack
 checks for T32 load/store single
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
X-TUID: ANkuerT9zotq

On 02/10/2018 18:35, Peter Maydell wrote:
> Add v8M stack checks for the instructions in the T32
> "load/store single" encoding class: these are the
> "immediate pre-indexed" and "immediate, post-indexed"
> LDR and STR instructions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 3fb378a492d..65df8d6975c 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11624,7 +11624,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                      imm = -imm;
>                      /* Fall through.  */
>                  case 0xf: /* Pre-increment.  */
> -                    tcg_gen_addi_i32(addr, addr, imm);
>                      writeback = 1;
>                      break;
>                  default:
> @@ -11636,6 +11635,28 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>  
>          issinfo = writeback ? ISSInvalid : rs;
>  
> +        if (s->v8m_stackcheck && rn == 13 && writeback) {
> +            /*
> +             * Stackcheck. Here we know 'addr' is the current SP;
> +             * if imm is +ve we're moving SP up, else down. It is

TIL +ve is a short form for positive, and -ve for negative.

> +             * UNKNOWN whether the limit check triggers when SP starts
> +             * below the limit and ends up above it; we chose to do so.
> +             */
> +            if ((int32_t)imm < 0) {
> +                TCGv_i32 newsp = tcg_temp_new_i32();
> +
> +                tcg_gen_addi_i32(newsp, addr, imm);
> +                gen_helper_v8m_stackcheck(cpu_env, newsp);
> +                tcg_temp_free_i32(newsp);
> +            } else {
> +                gen_helper_v8m_stackcheck(cpu_env, addr);
> +            }
> +        }
> +
> +        if (writeback && !postinc) {
> +            tcg_gen_addi_i32(addr, addr, imm);
> +        }
> +
>          if (insn & (1 << 20)) {
>              /* Load.  */
>              tmp = tcg_temp_new_i32();
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
