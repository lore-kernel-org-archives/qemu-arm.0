Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3607645ejb;
        Tue, 6 Jun 2023 09:32:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lCHBKnhCmZMFW1ZSzYhX3cG28wBCKBb2/xWLrhcefK5jWqcwjCZE7kM/JIRR6L2SpLbt1
X-Received: by 2002:a05:620a:4896:b0:75d:ff00:5948 with SMTP id ea22-20020a05620a489600b0075dff005948mr141060qkb.74.1686069138211;
        Tue, 06 Jun 2023 09:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686069138; cv=none;
        d=google.com; s=arc-20160816;
        b=pbk/t7f60HEvSqXeI7SlZU+d5oV5knpPqyMUcDWzTCflw8PNPN/kNnDmyf1ID/bi6X
         f7fyxb1H6dRTTb3sDkJS4oIROhNnxH8mr56VfgceksApxMTHQd8denRqkkpKyUVJZoIC
         RzPbC6cwuKpJ2Y1t03bD1TXRFgJnZV5HFZUXFdZp9GTh8dMC4gIIoIaRl2aVvrNpqO8P
         kPMc+9xnHGGM2enU/eMqgNBhdqHF2n6CgLWwZN6hxN3Mf1uJO6A6jNNAOpl9piPInt6c
         39yTUQ+89cvP4Pnlvn/kv6d2GB8qiufqgrxZDOrzX0bcTtebaTFz7lOgrSeJIVWHJZ6M
         5sSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CCSZOC3ace9mgIPiCLtuSJqT1KrCOoXa+Sft6OEDda0=;
        b=beQjf6Ty3p+56rYyqmwx8IqbxpMFVPSYrRbt/U1Ck+ZnckEMp/oOJuduX9cmkJA/tm
         c9AHK76v2ZRZLp2uaKZyqSh3kAldKnWtC48ONznnpY4DTK4Fw+F03v9TLOy/qqP1TJMO
         XU5Zf/wu5KYOXp3ni4MGU1SzN6L5e2lsxM3IFfVuiBffYmXa4PvtaS7yXCKnKvqVTKOJ
         SAz3Ovsd0+Rfybq7LVvERtKkJWrFzdKdqOg5j0S2BpaxY1+c7zJLGegEZPcVU+vif4n2
         JHLnwCVRGcEo9rug9Y7W5gS9WWP8mHOtpljunnAIb4lzSSlCuceCU4W2gOBCL4oQyKLH
         eb6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcLupTDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a37e307000000b0075bcc49f7b7si6258320qki.165.2023.06.06.09.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 09:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcLupTDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Zb2-00059r-Na; Tue, 06 Jun 2023 12:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Zb0-00058o-S2
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 12:31:46 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Zaz-0003A8-2j
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 12:31:46 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b1bf83095aso20281305ad.3
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686069103; x=1688661103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CCSZOC3ace9mgIPiCLtuSJqT1KrCOoXa+Sft6OEDda0=;
 b=wcLupTDwB2WAZsscImkXoR6/nE2UCz6/svrkcLEob5Oa9SCKK+zDA0W3LMFIMcXBhO
 hHUVMxUDnQ9EwWiFkiDX3Cldo7R1h9bFctvsiadHmd99TIdJF3lkMvEbWi4vB/BrN9d8
 9lykGd1OxqctDPgOfL5zao1zOcMFUetIsc1R5l3AmAsz/Ma5R3L9CiFaDnq9+KNaLVU4
 Gawv8/brAtNSNT0v22LNsQesjtCuyNxg52qnGTEohGnGiESInH4alGdH3mvsHj4XGn7C
 s3sxFsd6V3NdwxKVD2rKXOSTwRIK7simShiZ8WWcJ1fj3hMzSPSad1tpNyWR2YCcymeV
 fziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686069103; x=1688661103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCSZOC3ace9mgIPiCLtuSJqT1KrCOoXa+Sft6OEDda0=;
 b=ZmR1RRlD6d2ZxtHnS/Q4Aikdt1N6Mn/GD3QmRy1NyU79fXlD6c0JukH2dDZ+oQWxYw
 9J45cyyCaMjXoeagy5VgQfDteXBFI1e9b0uznRFLsY5u7rZQz/RPtlpCDrX5rk9LF3k5
 pmeMUlbDEB8YS+R092rrtqTVNSND4wMI2oQO2paeV98VAdHL4uODi0HGQHB75wE7d5uW
 dIFSbpXjwOPr6CFfZCpUHSuzHc9pfMfwA/sNK/SG4M0/e0xNvXuNlIK3rj6Xw7sND79x
 Z+wgaK1wt6Y9icnSGb4aPXESerf/UP4gmt9jlW7CUv1/8PsHv1EyW2tGAKGaMTmhL7+e
 Zaxw==
X-Gm-Message-State: AC+VfDwx07iEVdw1mEFEB4ofgWVkSqzNbr1GBC5kIG1lvlD2MVsjAVOi
 dxyNYFQpgloD0RJiAlvBQ54hPzVMPufG+y0IEfQ=
X-Received: by 2002:a17:902:7c92:b0:1ac:8be5:8787 with SMTP id
 y18-20020a1709027c9200b001ac8be58787mr1060626pll.21.1686069103125; 
 Tue, 06 Jun 2023 09:31:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b001ab1b7bae5asm8777394pld.184.2023.06.06.09.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 09:31:42 -0700 (PDT)
Message-ID: <5642acfc-46b3-c471-f8e9-1dbcc512e61a@linaro.org>
Date: Tue, 6 Jun 2023 09:31:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
 <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
 <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SI7p7jH/7vhX

On 6/6/23 08:49, Philippe Mathieu-Daudé wrote:
> For example in translate-a64.c handle_msr_i(SVCR) calls
> gen_helper_set_svcr() which is declared in helper-sme.h.

The placement in helper-sme.h was not done with consideration as to which compilation 
units might need to use it, since that wasn't a thing at the time.


r~
