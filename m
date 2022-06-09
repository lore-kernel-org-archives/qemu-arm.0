Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp750272lfb;
        Thu, 9 Jun 2022 15:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrwBTUUR9k3JnWOqDMtz5sIZCEYJToM6grysU0HNCloiZ4bLQAW3Icjxh2vAx2hWFWDdbT
X-Received: by 2002:a05:620a:1306:b0:6a6:b06c:c718 with SMTP id o6-20020a05620a130600b006a6b06cc718mr18590823qkj.695.1654815573866;
        Thu, 09 Jun 2022 15:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654815573; cv=none;
        d=google.com; s=arc-20160816;
        b=q2YUIE8mTFNu6wubmfbDDMqpM/1Xd5AWinp9WoqWX2aMPVmhnE8zXGqt6qFof2sclb
         e+U91PtVwcHSX9ozT/Kv8K/94Sf6PFmYXpL4TrJU+Ri3QvUj0fXngI3gn79P4NVyLT1U
         RXlPpCakhkGyCpe9ucmISIHfeVFx6/OsTy9PSv++SYmqfMYm7Hi+cHep8J7njwgPlhmG
         pf9OIVx/m38TOnE9hTFy/YXFRVkyKPX+R6E4Nl2TsrTQe2fbYOTYorwSs1Y6YVn7PRNg
         /hyt50UHOpyP/GWd/VTYcsm7X7Hu7Nau5uTeHH5mCAQuAZ6KwMKbrpH8AIEKZMPucT88
         fheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OUk6EXX/Zs7xZIPdALEzfp1X2IAIBxIjbyPqS7rOwJQ=;
        b=KYojZXBAbHgk8wEF5GUdJfnrxcMnfwpZ53JpJrtQOJeYD3R3KDfJEtYXdLPPYEs9az
         d9W4AD9Gx79fEN5ENA9IX+DtwQ33Qo/CeR/zgL5HH1ViBw93dmoYQwx+NPNQ3ggD8/FR
         XEpZ8q/4O0WYw8PCG5kDUXNQtd67fTpsWE2wxbnfnN2N7FZSKyh0hh1zRuAbkMA01slW
         v6z0AZKyi0vHmFnLVvQ5SrRtFxrQXE6xC3tmwBow5eZzzTmrIGDXOnZLmiBJ7je4/eVf
         JK5uHE66NALLsGTUbY/cYjrQqa4nytds8AxAPdkKb27ZtKUSd8RhjJUzadKLuY/WTGgT
         EqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b53rAlY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a05622a034c00b00304f687600csi5597085qtw.587.2022.06.09.15.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 15:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b53rAlY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzR7l-0005f7-Ad
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 18:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzR7G-0005eZ-01
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 18:59:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzR7E-0006al-B6
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 18:59:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id e11so22315633pfj.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OUk6EXX/Zs7xZIPdALEzfp1X2IAIBxIjbyPqS7rOwJQ=;
 b=b53rAlY6510RkXlKsQgId2LP7O/uvQAH39PHfDGe5tajTM9OUnEdwqiHrILMM7ivQ9
 3N/xVhRzVtshQQwLUnH3lDFQT9FPZtC174EDH39RDgb53W9m2tgYosvcGOMIecroquQk
 iZ6Mh5YfTDTozud4Z80y6vx6OqYnlymA6bVf2kKwuCg6d0CAHdeFajk00EhPItkJVf/G
 dsa2r0xbYJnLtS+BW3MCIorthTUSkW29HDULM8Sx88gIyOMk5QGS83rYkMmUO9qRsjOP
 oY9BSEyoDw2BjbaFVMdJSg65LkTpSanEtZzeF2xZbh7umUZBcA7NJetdFEuqkJNpQcAQ
 bC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUk6EXX/Zs7xZIPdALEzfp1X2IAIBxIjbyPqS7rOwJQ=;
 b=VAuvKVxoiFu6KhXzkSlSvH8xIi8kIrEVzjSf9My5IPWxNEgOLAo/nnzMVFhyfK7F/9
 lkucUUb+ZNV+Bl0tLMYzIoNlFSEyslrfNVQlc/SEOokWj4HG4MyNOwR3K6xyab1R0QHU
 UwuuEGx6YnMcm6wfIZ1dIiF/V0iVFc7o37134ANoXGBmtitcpAC4cq7c0VBN9H+BJ1jY
 /Gr+NKC5eaq5zh6T6LWDq1ze8k1eeK56vBbINDqQK5gNw1xltSK8T/nesQS0lnvJCTqz
 I6rmYOjR/Xa9mX2e3Htsl6tQCdDKrxWAxRIZ8hLMJ8m9MMXhvPK4Ld8pknN7bTEzRxcr
 Ak3g==
X-Gm-Message-State: AOAM5303jj7YMLqtPBX49ZVL9f8r2k+Bpox2KCBJW2RcCAN3Koiswa7H
 1mCN615xtftn7iKltfPcc3ZrOw==
X-Received: by 2002:a65:6bd3:0:b0:3fd:63c3:a84b with SMTP id
 e19-20020a656bd3000000b003fd63c3a84bmr25254780pgw.572.1654815538596; 
 Thu, 09 Jun 2022 15:58:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170902a50b00b001661f9ada6dsm17125335plq.143.2022.06.09.15.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 15:58:57 -0700 (PDT)
Message-ID: <7404df97-1116-2c13-4c86-f327cda96eb7@linaro.org>
Date: Thu, 9 Jun 2022 15:58:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 41/71] target/arm: Add infrastructure for disas_sme
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-42-richard.henderson@linaro.org>
 <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6dcZJ22YDWx8

On 6/9/22 08:35, Peter Maydell wrote:
>> +        if (!disas_sme(s, insn)) {
>> +            unallocated_encoding(s);
>> +        }
>> +        break;
> 
> I still think we should check bit 31 here.

We don't do anything similar over in a32, where we've done the full conversion:

         if (disas_a32_uncond(s, insn) ||

             disas_vfp_uncond(s, insn) ||

             disas_neon_dp(s, insn) ||

             disas_neon_ls(s, insn) ||

             disas_neon_shared(s, insn)) {

             return;

         }


and there's nothing else within major opcode 0 to conflict.

But if you insist, ok.


r~
