Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3078386lfo;
        Tue, 15 Mar 2022 11:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCRhI9t9u7dhfUI6zfDMcwUD3RMAVhw8p27NN1ccga/bw9uMvk8DovcMSFvCKU1T2o8j6o
X-Received: by 2002:a25:664f:0:b0:629:2387:cd3c with SMTP id z15-20020a25664f000000b006292387cd3cmr24888522ybm.593.1647369156087;
        Tue, 15 Mar 2022 11:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647369156; cv=none;
        d=google.com; s=arc-20160816;
        b=1GBg4z9AgiYbBNgn7gOoo2Hm3wRPbYzaSG4cdaitAfTJOBbsYrzAqWxvvaY/gC/in5
         zTW4tzowFjdsOXZeAL0pDyeuhcRg5xMYaQlaSkriMedwGgcKHuxDQUdBXXvUyctx2uEz
         hnMKGWhSWlxx0gx7Fn6lB6WFIrFeY0PA6V5ACGaQEpf7JnLX+nhTvx6wethiPqqY4ded
         eHe5DkTDjyh/qZuve3mfMJSodjQXt0LmXTt8uxqctikXp+YAsbP0eFFccqDzVcr/8iej
         StdHkxFu+svNJCMDKoMbGiLcVcCvGUcjM71k8/P3vq7ZaUflPb2P27Myn6oFeT5JIXI4
         FYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=7aLZzfLlS5VnBfl4PdKBny5F4Y7tGcpGiEVcQMX10x8=;
        b=pXhZNt/qIwuetlwGxivOisM27mMWyViCgRVUd+pAmYj9ezrPskhenv/G/gjx7PdYrI
         5pAuEzGuWqOAjxGEMOBask0ucl88Xl8XTiPJ4KaZt5rV3YaUGPgucZVN8VW2ADOxV99W
         uwxjUpCzZCQ9hROpFvtYThPVxlAe+ofji5HEsAIfQ7ODhZbQ8W/zc68eyfNRhjZ01zDr
         hDFxME+HB3qX8qNe/wEDMdkfUELCuqTMXx57R0ERsN3V06MY9Mp8gTcF3qmRfFR6xO9B
         xkfUN5V7LjgOX3k6GfGfvsrHw6AgemQi0xnjsLc9yJfZN3MIfooGivZT5wlRehNnXMx5
         lbXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pNQRu/q9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k128-20020a819386000000b002dc09fe8a0asi14715605ywg.450.2022.03.15.11.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 11:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pNQRu/q9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUByF-0005Zq-GQ
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 14:32:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUBxm-0005ZN-Eh
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:32:07 -0400
Received: from [2607:f8b0:4864:20::435] (port=36402
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUBxk-0003rn-02
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:32:05 -0400
Received: by mail-pf1-x435.google.com with SMTP id z16so366568pfh.3
 for <qemu-arm@nongnu.org>; Tue, 15 Mar 2022 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7aLZzfLlS5VnBfl4PdKBny5F4Y7tGcpGiEVcQMX10x8=;
 b=pNQRu/q9bzNE5HinS2GO8s7jv32Z1Qa5myxG4WhEawKFk/qPg317rURHmtywO5xCXB
 yTQAup24MamMi+MmTKdvq1C3+YmlzQtd+VdZVIiWQ0tacpoTiGKWvhR7S1Fw1IUaMMDG
 zMvsPFw0PMUlhR5eMaIeGP4hEeBCiIMeVIDNRQMHVfTK8SQ7ImGZb8OeJz4HzhibailW
 wXjK0ND1KusGalyLLGRedIjclFBzm4/x1heMLpBMnJ+Tp7iaB7LC3vaV/9h/c63+oWBc
 1duvvo7JAwV0VMmCF7fgcpOMteEljftphPDbKLo76kVX+A/YfmY5PFAAP3HDZp0CK3IQ
 wynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7aLZzfLlS5VnBfl4PdKBny5F4Y7tGcpGiEVcQMX10x8=;
 b=Bhgn32dzeW7KyBabreBe1GfVLKY9aQl2OCDmi2GfhTKX+NPU8Mh+SU4LsJYPxOMOgg
 tlfGPdaiX6sblR5bQPxTH7+WGW/KPtA4KXLGJda4g6ZcEiiTUp0Fkv7t7JOEXIGZvPdC
 r/v8tAFU0Jpsr49GB6CePvBqInOJy4k5qHQj7pEWx+pFWPvu3GVkGdS6EX1u32m9IoQI
 eOzm8WHSgQ57N3bDkLLGhoVgq6yI1vd6+S8AvcSy+RvA4Jc2x2Hzihevn3EU9dNapRR7
 LZo+qPawhsfhyedsojbgfRSXpfZlIH1xGxTviIzBqveWa9TvVYJqaYLsma4qwtsL5jxC
 qrkQ==
X-Gm-Message-State: AOAM530BZkRqcEhNoSut3lHqi/NKjadClV59g8h27HC8GQ6Df8pevoHd
 xjpVWAHwMFxXm2ktTCRxs/V2nw==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr29764256pfm.3.1647369121618; 
 Tue, 15 Mar 2022 11:32:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004cdccd3da08sm26168241pfl.44.2022.03.15.11.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 11:32:01 -0700 (PDT)
Message-ID: <75a17177-557c-6a47-9724-2a8bb5aa6dbb@linaro.org>
Date: Tue, 15 Mar 2022 11:31:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with
 host atomics
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-4-richard.henderson@linaro.org>
 <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGR17NPefYV2

On 3/15/22 11:18, Peter Maydell wrote:
>> -segv:
>> -    end_exclusive();
>> -    /* We get the PC of the entry address - which is as good as anything,
>> -       on a real kernel what you get depends on which mode it uses. */
> 
> This comment about the PC the guest signal handler is going
> to see when we take the SEGV is still valid, I think ?

Yes.  I guess I could move it to the block comment in front of atomic_mmu_lookup, because 
it would apply to both the SEGV and the BUS raised there.


r~
