Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4229863lfh;
        Wed, 1 Jun 2022 07:16:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI6XNCU1KkKZNsc4qsPH/TG5L/PbIs9ManzZyST+7q+mZf2qDQ7pbBKp7iujSurySJdYSJ
X-Received: by 2002:a0c:e887:0:b0:464:5710:7f77 with SMTP id b7-20020a0ce887000000b0046457107f77mr11155876qvo.68.1654092985799;
        Wed, 01 Jun 2022 07:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654092985; cv=none;
        d=google.com; s=arc-20160816;
        b=dPby+YWYnfJrOw9IB5TCwOeiwI7IrqQ9YOhUVli/Hb5K16BLcNyJh03yY1wGtKZdhm
         XlhrA0C07zZeVB3iAF3UBVZ7QXsIZGmfTe999jAnHmvg80j1bSb//k4RkBfzvtS1fCCt
         EKD46iqa/Ye78rMP7dc3zmEWEjEK5wilreAAq0V8OhqdFO1mnzAw58zLgpMMMPIhpT4p
         sAO3u5vCr/0FV0kw0S/dVFvllCOE2UWe38ik5cA1QdZWW1VbhdqmXbhtUSLr73YWtiO1
         vZ6lY5C772sw5UouWf0d1SWvR/qr/6v5G0HOZZgZTgDackgf/Sww7QKrv7D+AooIIBXu
         M24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=0/HCyR1guHv2jP3KD5yzI5ejOxqdJDUYDoX6gQ26rhM=;
        b=GD4kU8vEUESrWBHqfwqNfTFxMLBJrrAu+yZmwYx1Ix6rOcTElYn1AR3gQp2KKfFBFe
         sNMorwK8MMKP6ilvAQmLtSd+YN5fnnmBPYO+Yn92W7GnRtfoNj3WaKW2vl215PTyCfEe
         12qY3kAGW5OLbyvLD9DFSBUfsPFwZIw81vmAo9Bg0YRHVXXHTrUGsZzI3M7TXZVFbdch
         sNOOsDFL1CyC/jPizCE678K+7Ho9Sbu1NdJMVm0JSj6GELJCywgvnpM+OMi7UN6E4MLS
         5ghPsaWerBnPgnLcRTx5nSq0tBXcLJc8symcvk6/XcJ9lf5cyeagrdhltpQemLXSRpdn
         sDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac84e8d000000b00303312408fdsi1048505qtp.768.2022.06.01.07.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 07:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwP97-00051j-6o
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 10:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nwP5l-0003Dg-UT
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:12:58 -0400
Received: from [187.72.171.209] (port=42702 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1nwP5j-0007oo-TT
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:12:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 1 Jun 2022 11:12:48 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4C5A780006A;
 Wed,  1 Jun 2022 11:12:48 -0300 (-03)
Message-ID: <62dfa218-f61c-7fd3-6ee9-8e5b11598750@eldorado.org.br>
Date: Wed, 1 Jun 2022 11:12:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tcg: Add tcg_gen_mov_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220531032103.406203-1-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220531032103.406203-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 01 Jun 2022 14:12:48.0632 (UTC)
 FILETIME=[AC3E1F80:01D875C1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5fNmDtlWVRSQ

On 31/05/2022 00:21, Richard Henderson wrote:
> Add an interface to perform moves between TCGv_ptr.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This will be required for target/arm FEAT_SME.
> 
> r~
> 
> ---
>   include/tcg/tcg-op.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index b09b8b4a05..209e168305 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -1288,6 +1288,11 @@ static inline void tcg_gen_addi_ptr(TCGv_ptr r, TCGv_ptr a, intptr_t b)
>       glue(tcg_gen_addi_,PTR)((NAT)r, (NAT)a, b);
>   }
> 
> +static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
> +{
> +    glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
> +}
> +
>   static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
>                                          intptr_t b, TCGLabel *label)
>   {
> --
> 2.34.1
> 
> 

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
