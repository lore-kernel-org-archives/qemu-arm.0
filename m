Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp852896lfm;
        Fri, 19 Jun 2020 11:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDKlW3DR3w8De3HsZyEL38QS68xOSRiA45XnU1v61/t9WLPOS24UYwVnAPc5SWPJm2aJMN
X-Received: by 2002:a25:50cc:: with SMTP id e195mr8225970ybb.452.1592592451230;
        Fri, 19 Jun 2020 11:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592592451; cv=none;
        d=google.com; s=arc-20160816;
        b=jUgryJx5iUqvHVOAkHZ5VlhHUrz1ow9n+d0FUaazrT9XTiCitKuPfjNt0+S4hnmeVE
         doKMJqqj+lfW9UXRc6PCR8cZMNkIM6fEiwVZgGBPNXWSWkXM2qn+vinnU0Q441W85rx5
         DpEr166NIPB1ytxb+xFxG2+7DxCuOFz02HQp1B53itL+fhh3eN1NnR1XYp04mPAgAloK
         6ht29OfwaHhjHwaD3NY28+SJmOKFJkpuLQke6WqwsQ0gZ/r4dE26SaYU90QiJi8xvPv6
         j9SrSWziCJynBjNHbfIs/XzMsnNGCx08ECgTK0vsHyGkLkhbIPXxMN4audMRC37o5uYU
         8/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cfFZTJh7SWZaZSP+mXD+NHvfl/ZASrDnfLHQUefSvXM=;
        b=FBLmPafGl0v7eNjMcI4BEvkOs2EuoFzM3Vzc7MWuiYg9eZMtNguty1E4ZwYzE6vdN7
         Yqmi2ujkTXsFRGgcjZWjL05D33jkd/HXkp5LqSpJhcMCRTEYofcPo4T/rmkUVLCjcZde
         s14Ec0rtW2LDfBpPPAiQxOeyxLcBg2xDeksTmgXUpTYuQdVLMX4u3eKJKZY7fSrWlRlm
         gG0aqVZviLzZ8jYUFiyD79WHhmNom+UnIR0RTVltoz0+X7LUBiwSnhCEiLSTrJqEZzjP
         LcOPodryVEA1mBZhYKXWhP9oG3SqPnjK+x9Wr0VvyvKDcUFrpT/zSARFMZYUFHsZRJX8
         ahtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eAFoJzo+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si5813452ybk.39.2020.06.19.11.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 11:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eAFoJzo+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmM30-000519-Ka
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 14:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmM2q-00050g-4t; Fri, 19 Jun 2020 14:47:20 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmM2o-0004cU-KY; Fri, 19 Jun 2020 14:47:19 -0400
Received: by mail-wr1-x441.google.com with SMTP id q11so10682610wrp.3;
 Fri, 19 Jun 2020 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cfFZTJh7SWZaZSP+mXD+NHvfl/ZASrDnfLHQUefSvXM=;
 b=eAFoJzo+GfNwohAp8B66mzA8cXiChGcnVUfa5qwNcUOk09TuJKJ7ex43Zpj21OrvQV
 DpZxDt/QdXI2vLrNg/CvO/WIseZNWZhLrVWJqvURdUlbOEOo43u5NMGxCAtGb4DiBMm5
 mXll9101go6D84mQxmlXJNaaKZrEOu9TG6x1Y9F0HSVvEMW45GYCQbZHOE/eY8vdAIQI
 STS5IpZKWXxXLG/aT76MajfWkiyoLBRSSr+4GaTxAM90zx0csWHEwkwsz59YjPX4qVHt
 moE5ci90ovOZnK+f7vCRKIrXEB9IhVjbp38h/DVN6/gRE+ARY9NuxLADGGNB5RgqUxK5
 gD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cfFZTJh7SWZaZSP+mXD+NHvfl/ZASrDnfLHQUefSvXM=;
 b=RztEgVfHf4a0s3BM86E+TO5tW1BhSXj0WhtT1sIID7+3OLBwR4vxplvujHj0HntQoj
 1xeoeYS4sToXaCtVFIGce9SZnfMJaC9U4GT4giX57sZyCUiaqg0CYBTvvu7NIcXGBuiI
 Opc3ADpaqsgxS7vsBmYJhDdyning1NadFXNOiRXQDYUnsQqSwfcQNs1s1s4c6jCjvZdo
 oA/NnQCoaJ9rkQgxTcd27EnibQer6abAPrMllZi49DA57vkpp4K4kfeSthfqffCdd9oF
 753mX+FiOybPIcU04RmDdr6Pccu7gpOFsPxPDMJhPMr0DSEbCorQoMFf3VXKWlSqEw0z
 tWdA==
X-Gm-Message-State: AOAM530r2PvH5xadARPiQJc0USLls3BNdXOgePfHcfjHkbdoLgmwUyAZ
 xuRtRynx71dpkaHNFIr0dMc=
X-Received: by 2002:adf:a111:: with SMTP id o17mr5416791wro.257.1592592435337; 
 Fri, 19 Jun 2020 11:47:15 -0700 (PDT)
Received: from [192.168.1.37] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id g19sm7413287wmh.29.2020.06.19.11.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 11:47:14 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Remove dead code relating to SABA and UABA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200619171547.29780-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d08f0a0c-a819-18f6-bdd4-bacfc34c5797@amsat.org>
Date: Fri, 19 Jun 2020 20:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200619171547.29780-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VLbTdpkYygcB

On 6/19/20 7:15 PM, Peter Maydell wrote:
> In commit cfdb2c0c95ae9205b0 ("target/arm: Vectorize SABA/UABA") we
> replaced the old handling of SABA/UABA with a vectorized implementation
> which returns early rather than falling into the loop-ever-elements
> code. We forgot to delete the part of the old looping code that
> did the accumulate step, and Coverity correctly warns (CID 1428955)
> that this code is now dead. Delete it.
> 
> Fixes: cfdb2c0c95ae9205b0
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a64.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index a0e72ad6942..01d59164d68 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11370,18 +11370,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
>                  genfn(tcg_res, tcg_op1, tcg_op2);
>              }
>  
> -            if (opcode == 0xf) {
> -                /* SABA, UABA: accumulating ops */
> -                static NeonGenTwoOpFn * const fns[3] = {
> -                    gen_helper_neon_add_u8,
> -                    gen_helper_neon_add_u16,
> -                    tcg_gen_add_i32,
> -                };
> -
> -                read_vec_element_i32(s, tcg_op1, rd, pass, MO_32);
> -                fns[size](tcg_res, tcg_op1, tcg_res);
> -            }
> -
>              write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
>  
>              tcg_temp_free_i32(tcg_res);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

