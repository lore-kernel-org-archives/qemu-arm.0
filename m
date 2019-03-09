Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8983993wrx;
        Fri, 8 Mar 2019 16:45:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYqKl8nI7b3/JDcvFslJDNrm2/tlwBjKL/9c6uk3xVMkkDx8rdC05+hHqAJmZnTlzBs6WU
X-Received: by 2002:a81:25d4:: with SMTP id l203mr16681109ywl.279.1552092354390;
        Fri, 08 Mar 2019 16:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552092354; cv=none;
        d=google.com; s=arc-20160816;
        b=uZOMw2isyOAZDZ6eP7SDgSx3DBh4r7fuNzJ6vdO8cBYh6vLbNdn1QVTatPM9eGOdDi
         BoWyKzBonTp/SAAiukFWSYU5VhGU/JWpqy/PwES7pnPnKSFLpyplPAamaHsvNr9j3QBq
         2sUQDwX6458wRC/5NzRS3p0fG3vAwdxJj3Kgwq1dFhmsKiYwB7ztbzifXsiddb8UQ0Nu
         wd7VuiU7SnXbKa3Agdv5tL8aSyD+vpD2vSw/jKR4OwUpDZZpxgmXXFgVcpgu0xxG4Mjv
         K5ERiarfC8avmzZPsyC3IcVc2Kn0CSygxZXyUjadjFQMGF2d8ptUxdSD9cTlEsY1iFMi
         +Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=xfvoNQ1extiUI8d00iB78lGZa/wNK/eOopu7rJYLiNo=;
        b=VVm2s4/9jpwo7hl8Sps6phV5EOP+WNTbcWd92DLfRJzPr1KoYGG0uG3SomiivMgwbs
         5CdZ6jvPKuupEhdIWb/rHelCxf+vU4Cv/TEW+FBN3GkYMreqQF5iS/mQ2ntwT/rWHJjD
         sNbdVLLeRpwP0keJxsJV6ZqBQDiAeLKn7nVpIGE7U0evGyTslgm8SdkEwHL+j2a8eb0A
         aWJO0lTyz3R8yu1ubcQVDdQ/so4qgaCh26RyR6HKX1c1v+Iia7rZkyiJLF0F0THdIGdK
         Kwc4JNt7cKEXEEf7vIiPieE7UWZ9DphYVUWn3sa0qA5QYXASyHPq+LblkFH7jsfb1Qc6
         Zirw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P16WDcYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q126si2315863ywd.303.2019.03.08.16.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 16:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P16WDcYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Q7c-0007jd-Qf
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 19:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h2Q7O-0007jV-RR
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 19:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h2Q7N-0006rK-Ty
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 19:45:38 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:32899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h2Q7N-0006qJ-NY; Fri, 08 Mar 2019 19:45:37 -0500
Received: by mail-wr1-x441.google.com with SMTP id i8so84351wrm.0;
	Fri, 08 Mar 2019 16:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xfvoNQ1extiUI8d00iB78lGZa/wNK/eOopu7rJYLiNo=;
	b=P16WDcYDZMh0Xo5cvq39G31xfh8KRmXWgqqnC1dseG76XTfLyVHgVkwoCGQnwQkIdj
	TW883MOswNhB3ql6jilJyQgtstZuj1WOkGlVoQkWIXlJjFguVRU9rpodgaQs3gZ8tnPW
	kC0OoFiYX8nlyx0tWsZOWyNs5G80JHmGoWrKvodEkotbPZ75QKVCq9c/KRrPEUXXwkLq
	3IFgrNaGw+PkOl33adbBg+rMd/+Sx/zx6xI5+wVc1vvliYiQkonTRS76MPljc4JwCyz4
	g1l2S7K7p1ZcjyPcCE1FqtQ0udt8kOgo3uuZaUbmLMbjW0iVhqrWdIJACYEOVlFTecIq
	rFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xfvoNQ1extiUI8d00iB78lGZa/wNK/eOopu7rJYLiNo=;
	b=h43ruXlWx46OrztMi1+SxcSH+QsS1GTdXXMODkMK2fYkoGXcnATLrRQgCFcyrWVOT1
	fviuyLbQ9tSP0nUG65CJnoX1rlus6aAyzcp/1PDdPgQsqzarSyVcbgEeynhuE2SRKSOf
	GImKuPf0/jsrSLIro4q1AhLbRQRMqWHNiSJAbdfYKGXAEh/I0It027VKef1zbP9Y04ns
	I8HOFBxw9uKMEIHK9Mpc3Cie5jxLLSuYd7H2hlk5ZefNQxietwQxwKa7odvauK1zlQ4o
	YnKDuocp3rrr+WRa1JfLKEwiaIcWg7gYhgZ+QNYLNmn+/mxfFmNDMADXwHK0Zwbh2iCO
	7z0A==
X-Gm-Message-State: APjAAAVYp1bg7NTIUqn27GkW22axkZ7+owJifNehGsfrWUH+MxGrmm1l
	igN8druX0DaLC/YgpKHkzDE=
X-Received: by 2002:adf:e78d:: with SMTP id n13mr6107859wrm.75.1552092336352; 
	Fri, 08 Mar 2019 16:45:36 -0800 (PST)
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	p6sm26156004wre.63.2019.03.08.16.45.34
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 16:45:35 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190307144126.31847-1-richard.henderson@linaro.org>
	<20190307144126.31847-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <906cb044-a5ef-21a2-3ccc-2b7492c2301c@amsat.org>
Date: Sat, 9 Mar 2019 01:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307144126.31847-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [PATCH 9/9] target/arm: Simplify BFXIL expansion
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	david@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yXU0+WvhcwjN

On 3/7/19 3:41 PM, Richard Henderson wrote:
> The mask implied by the extract is redundant with the one
> implied by the deposit.  Also, fix spelling of BFXIL.

This spelling fix also help understanding the context!

> 
> Cc: qemu-arm@nongnu.org 
> Cc: Peter Maydell <peter.maydell@linaro.org> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 54fe94c436..39e0512d21 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -4043,8 +4043,8 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
>              tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
>              return;
>          }
> -        /* opc == 1, BXFIL fall through to deposit */
> -        tcg_gen_extract_i64(tcg_tmp, tcg_tmp, ri, len);
> +        /* opc == 1, BFXIL fall through to deposit */
> +        tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
>          pos = 0;
>      } else {
>          /* Handle the ri > si case with a deposit
> @@ -4062,7 +4062,7 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
>          len = ri;
>      }
>  
> -    if (opc == 1) { /* BFM, BXFIL */
> +    if (opc == 1) { /* BFM, BFXIL */
>          tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);

Fall through and use deposit of len indeed. So the previous SHRI is enough.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

This function uses hardcore optimizations btw, un chef d'oeuvre :)

>      } else {
>          /* SBFM or UBFM: We start with zero, and we haven't modified
> 
