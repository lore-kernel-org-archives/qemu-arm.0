Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4396545ejc;
        Mon, 27 Feb 2023 00:11:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+qwxj+dGrc0jY4j9HxmAnyPfxxiAm7YJ4muu2gsxskDacZ2N51qcW7YLWMsHgmwPz74sVT
X-Received: by 2002:ac8:5a87:0:b0:3bd:1a4f:96b5 with SMTP id c7-20020ac85a87000000b003bd1a4f96b5mr32432042qtc.47.1677485471491;
        Mon, 27 Feb 2023 00:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485471; cv=none;
        d=google.com; s=arc-20160816;
        b=NsWFmCCjyWEHujQEFHt0b8JQQabA3nyUbUaZA1DwrN378tw+47mAFwi0hs2bge5Xi5
         JegHudXN/YcXXUUBb9g7/tEndj3RvOiza0qYOeRJRpAfQmR6KtwA84fE6BQlSTFKJM+y
         nofkl66vqB4lIYsgZQNa69u/0J3UZ76pnrHoaNzMnpml6XcXnwMdNJEh3R/KizWEe+GO
         2Gnkl9bkWx2PYLXa9wHLdStDczlwMqV+6aXyR5G4yJ75Eroa8jBSjGk3NlKaiqp61XJ1
         bNAzuyFgF/ZemjNgUoeyBgy7HyNAdefvpdiuFlFkvxyjInKalKnVtCza+nby3W9AsJVE
         q1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
        b=zYdQh1WKAqb4J7lKMisdrSA8y1GGcH13Q2Hs7EItIcbnEkdN8xiJ9kbbcbY0jmPCvm
         4j0MP4gb2flHze3RxQPNG0U6B0wXh/T1QdYzKPO/x7RnYy7CPwK9GQY8ZIlfiuvMS6Nk
         +cH06+Ty7Ka7v44YxLPkw5TM4N5C2qEhbjt3XWh5nXunTqGvRMeO3BPsHt7ZyHaoVpxA
         RWmumzrQO5MztgVS6LCAHRLdHmiRt6Hd1whGS3DRAknGFWk3ReR1aZPzkTxkYa8LFAFp
         s3hddZWnQmnhhmWcmUnBrM/yeKLmd8XQcuRcFq4XYaQt9/6VSlyg0GHxj2FNjWUZwIkS
         Pcuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SBr+t/MA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020ac8598a000000b003b9bf43fcfbsi6573178qte.74.2023.02.27.00.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:11:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SBr+t/MA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWSY-0004B7-G2; Mon, 27 Feb 2023 00:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWSW-00043I-7t
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:54:00 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWSS-00012z-W4
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:53:59 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso964030pjb.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
 b=SBr+t/MALQZ9qnmufvObgWPOsubZRVYbs55S8BhRjxJPUXj2JXghvMa0RfEX2WhLeD
 dEwapMF24ICG+D83wvrNu9uFqzvOeoSb/+QxGdFrPW0galCcScKlQEDS2ZcAayRBuqBT
 D10CZv8lfoOiNnI6FurP+zFKlY+dEkpDa3YVLtT5zctA3pJhcyvR/mu87hEaNDTQqfPP
 jpYD9r1oTx5T0M/Zh3dJOKkwHOwaNpgV7NnTZFucPGwFun5Vr/Lng/0iYnWOp0y1Yjxx
 lKDecEs6ClW7gDeTks9goLA26ivXtvrcx/21Dk7e1u0yf1Hi17A+neYRDdk6BHqI4y3o
 xdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
 b=LxDIUegVyOkVtdE1CfNegbe3Eh54hQkgZIaeRKKTz3PklmUR//ZU3s4Rjte1kN2SvD
 8tVjKi6lxWGT55VZWbpuicgeUAAGCSbs/jdI29eJpJgdIRe7vHPs8xUuSKanKgoFIImk
 JaHzZTXL8jouxGRuY11V5wiEVrNRqzZA7OyJHkFHhk8ceEtm2zVdqSMcmVl4mbK3Cr9b
 dgugWldMRn7g/afjCcAcLzW+lCDACXbAxqQ5AzKYE+AaomxMzofKvip6UfGX7awU1Cpc
 YRzQ20hznx/4m5DtGvXBUBel0WtOZPLsnNRF1QcWPpqWvxzorP620cUZBtoPiNNtQcTJ
 1y3g==
X-Gm-Message-State: AO0yUKUEVi/xhXT6qP/oXkWDKhPTYqq5gT4uUT11Y/cmQPdw6rrmHDKc
 lxH5l+M9THphgjcy+lE+Ja6GkA==
X-Received: by 2002:a05:6a20:440e:b0:cd:1e80:587d with SMTP id
 ce14-20020a056a20440e00b000cd1e80587dmr4665175pzb.23.1677477235401; 
 Sun, 26 Feb 2023 21:53:55 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f23-20020aa782d7000000b005dea362ed18sm3392389pfn.27.2023.02.26.21.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 21:53:54 -0800 (PST)
Message-ID: <10161680-21d9-3ac0-aa02-d62cab63cc20@linaro.org>
Date: Sun, 26 Feb 2023 19:53:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 58/70] target/tricore: Use min/max for saturate
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-59-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230227054233.390271-59-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LbfCmmj5WbUi

On 2/26/23 19:42, Richard Henderson wrote:
>   static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
>   {
> -    TCGv temp = tcg_const_i32(up);
> -    /* sat_neg = (arg > up ) ? up : arg; */
> -    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
> +    tcg_gen_umin_tl(ret, ret, tcg_constant_i32(up));

Second argument must be 'arg'.


r~

