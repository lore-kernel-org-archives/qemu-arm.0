Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp297306ocs;
        Wed, 28 Sep 2022 06:40:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+YpWmDt2UjAvoj+7g/Ve+w8VdIIwCWIY8vmm+nN/t4gjg19uBzOAKG/2PlD/EmfjY9675
X-Received: by 2002:a05:622a:20a:b0:35c:f6db:722f with SMTP id b10-20020a05622a020a00b0035cf6db722fmr27600434qtx.389.1664372429834;
        Wed, 28 Sep 2022 06:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664372429; cv=none;
        d=google.com; s=arc-20160816;
        b=km8aDkUM2pBxOL+zKAZcnkRVU3Gl0KuLlzFpHKDIPKUKK44BuQ4nl7wE7/v6SfkePB
         mdlGa7ptJbgE0N16HfXFyypw2I2nUKSSlDWpNn8dkU8jxP5jcPQ7O0688Wai2hJ8wF3r
         rMPW8ZjfkvVUJRc+ndWAVPbrLIXm2t2M/vh7wovATnU40mn1iyliPwSz1EQ3V2H81CSE
         y3Zbk7t3A48WN+TVwnnQs5FJ473kbDIT9ziyoP73OhPrsIdKMb83NnzVglFZiw6aGKsz
         fVgQAFrV/CuELhuWi7Ql4ml7Sw6aYWSiw8+6bvRXYCeKEJ5ntUC4758ZAnZkm3PMteUg
         r5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JBv4OJZaUU3HWheQvz90LN7h5LlrfeugSxtPjqjuFfI=;
        b=q5FJSRp5g4jh1pWlXlGwqMO/xEvhgPCPw6wYevaTQPSMStfkgL6nLxc1gU7Ju2IxpX
         2bXjIYt74JlnlBu2BwKcYaNnXwHBK8jz62sqkyaGqbqcJ+f/AYw5wCeODgSPpN0eo8Va
         jcWjFsigomxHBNxj0X0eIjXEsqS1pDRE/0wwq+8lLK/OJILYjlhxA/twu6FLTSCkewpe
         yiMIxhfr6lq1zOqnNJqxPFnRDx3hfInRq7vqeoFUSs01dX9jjirX3892bjEW9//lYZhk
         Tvn97hIzyxu9Yj96Z/4TPX2FAA6HaPYL3c2xZTQzTc6SyMMk3F+DwkcLwgjfPhuX/dEe
         yvcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hk4PgO2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020ad45bca000000b0049b72516f20si2544531qvt.277.2022.09.28.06.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 06:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hk4PgO2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odXIb-00062S-CH
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 09:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVuJ-0003zt-Ax
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:11:27 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVuH-0003I3-38
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:11:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id w20so11574364ply.12
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JBv4OJZaUU3HWheQvz90LN7h5LlrfeugSxtPjqjuFfI=;
 b=hk4PgO2R8P14Cfe/4dR+2ZZ0eBmhQSXLElk0gLZIK3pl5Twq/V53Pp3mlKtko2rlkV
 1fNVoaTKNMcEOo397Mq2a6D8K/LYy/H+snA+Q/Y4qxkJrg57IyQlpK2MKSSMkhXhKLsQ
 Bi33fDfvE2fYy1I6PkUeYP70fBhKqK2gHp72gV6Z2gvQpyBY1l4MAHT2YKMbmCtEcj6M
 gqMNo7I2gy9x3zTYBwbQlr2fqRtjYUNEpINtV1LQjqRqjQ/zqYJ8pohdzGBkPYBOaObZ
 TAT7h14OItFNZMr4i7C+V540W9Zbs6OPNwU55j5LCqJFaHOCJ/7k/wgcTnKBPXNW+P90
 LmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JBv4OJZaUU3HWheQvz90LN7h5LlrfeugSxtPjqjuFfI=;
 b=bUSRdE80VEYgQUUBweAVYfAB9oIvRZcprNFPcybXec25bn6Yduszow3SD0rZIJ19RA
 K/DVCAYQ4xu6VmI1w9NDh0aU+9I2yuqZhv1dxkRT9bpb0yOiG+LzAml2Jq5ANkpMXkxr
 urtwKCXdiSipBHySCN5kHJVF8T/3F8en7rKIS9v0E6GmCu9iFOCc/ftD4hvLrJWSXALD
 Cjb15AjsrNmRPLratPw29cQGgGG9dyZOCw9c2EEX7faG13b5zdGd9317d8F8I+my+UOs
 rezI+pcUzvXVf1UxktBrOYXzMYBzL8hhWbGFD6p2X6oKdHl1n+LPBuw0VBisavW/BCdd
 urZg==
X-Gm-Message-State: ACrzQf1fBnYtkqwVpVDkJ7Rvz3F1f4Fs0ISqfcUqxjIp7ESMOOeaGW0Y
 58IP19+CiopOyq1sPzn8mV6R8Q==
X-Received: by 2002:a17:90b:4acd:b0:202:e381:e650 with SMTP id
 mh13-20020a17090b4acd00b00202e381e650mr10426934pjb.204.1664367075279; 
 Wed, 28 Sep 2022 05:11:15 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b0017691eb7e17sm3531737pln.239.2022.09.28.05.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:11:14 -0700 (PDT)
Message-ID: <e4c42def-a1a0-25cb-c3bb-7ace33e1a9ff@linaro.org>
Date: Wed, 28 Sep 2022 05:11:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] target/arm: Mark registers which call pmu_op_start()
 as ARM_CP_IO
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
 <20220923123412.1214041-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923123412.1214041-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nKaT9D2IETgQ

On 9/23/22 05:34, Peter Maydell wrote:
> In commit 01765386a888 we made some system register write functions
> call pmu_op_start()/pmu_op_finish(). This means that they now touch
> timers, so for icount to work these registers must have the ARM_CP_IO
> flag set.
> 
> This fixes a bug where when icount is enabled a guest that touches
> MDCR_EL3, MDCR_EL2, PMCNTENSET_EL0 or PMCNTENCLR_EL0 would cause
> QEMU to print an error message and exit, for example:
> 
> [    2.495971] TCP: Hash tables configured (established 1024 bind 1024)
> [    2.496213] UDP hash table entries: 256 (order: 1, 8192 bytes)
> [    2.496386] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
> [    2.496917] NET: Registered protocol family 1
> qemu-system-aarch64: Bad icount read
> 
> Reported-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
