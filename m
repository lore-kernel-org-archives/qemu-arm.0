Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp258286ocs;
        Wed, 28 Sep 2022 05:43:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7eGxZq11woyVOVQ8nLHeFL5DYmjYqJlm51OKKA1+3M8KS5fTBrqUyyCq7tZAxt7OmXlrD1
X-Received: by 2002:a05:622a:1189:b0:35b:b923:3667 with SMTP id m9-20020a05622a118900b0035bb9233667mr26324720qtk.165.1664369023404;
        Wed, 28 Sep 2022 05:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664369023; cv=none;
        d=google.com; s=arc-20160816;
        b=YDFZEOTEFXNHSpbtmxi1g4b44AcL7scL6OCYG0TKNoaiN8ZJG8w7Yg5mZJEfcRv6p3
         M9gukaAufObyW3c2vaG1EkzSvR5F+DMbJvNeQcD+tloGTWKSMa9sTdcuRnuDmrTP/Tsf
         oEQPgrGCOmtNPc+ng+EQaH6YDljj616a+9cG9S+IrgnR55CQQ55+H0gWCh3P8zrGlfYS
         JpuNdMWOebrCSK+RdGDEkE9VoH6lt28CSDzXRaChZfLZgYP1hTP9skCQjQDqJRhslplp
         K59+kOLyFmLb2rxvt04oqD64T+eLmP/kzE5GN1kka1sJA7nimrXbR0R/5Tcy1lpp/t4I
         XRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hZZzk2h0DXLhS5kIUscxiCbkj1nfwKlpBBur/BWrcpQ=;
        b=vRqSRa0fzPar7VfdqHj40yBmtwHfbAPm+ha0XJF+Ida2HYNGGWk2lGNFDfndGHwpSy
         wgfzCZbSLfEKnkW0fSUlVWMIm7TWzHVE1HK3o8hCDLVyXUyBqQe5xJYzPouJxy8YImUT
         kmFaDxKyt404tvVUsCxCZYZiTHHvaR/fS0oeM/uHMYyOWR/xD1fBy3Tz8z0eW/JZdDsk
         RfKF2eCTn3RdcyH00GGZNmsWhCrXr22dXjgI80w5PZVugtDsXQC1H/wrSewjlXmuuMFS
         Mrm10GCSEObwWGS5RN9Rom724YnZh/R6Oib9kRkCdUeTvaRcgoTNppVdWgM9iDZZ0qd2
         ozJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrvyeQeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a014a00b0035bbac7a2a0si3110413qtw.471.2022.09.28.05.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 05:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrvyeQeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odWPe-00051k-VC
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 08:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVzp-0006aJ-5R
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:17:03 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVzm-0004I1-5J
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:17:00 -0400
Received: by mail-pg1-x534.google.com with SMTP id bh13so12059043pgb.4
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hZZzk2h0DXLhS5kIUscxiCbkj1nfwKlpBBur/BWrcpQ=;
 b=jrvyeQeBTHSvXCWA4xXnk8d58gJrni3//pR8QAG5hjfijMxYapJVMs1UkleHdQhTi7
 nVwcBQd11SR8NfF+tLEC6UADk9pYMUkRevkCFK2O+l33dHMvJqwz1ff3LjK+aoFEI6k4
 bYU2OjTkmljHuYz0I9naLf3YoRxhMPCU4UTS13+Rpce2BeD9yTT6JE/DivnMEW9szyQe
 0wuQEUSfeJqhk3fOP+8TK6QPSl8BpUM4V2aQ77A5Xg3ivXDlCahqQfkH+dLYV6n/O6Qf
 CPSmwTJwaseDuj4UoD7t7tvpn2F8htoZbmYvIS86/rY62QD+WEIAtMIGUC15wpj3vOM5
 czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hZZzk2h0DXLhS5kIUscxiCbkj1nfwKlpBBur/BWrcpQ=;
 b=uimJwmgGuEDW0qjUoecCPkdjzRZiu3dl0WMsg+T2jrph1gykF7D35QSKMJPTLfWEw0
 8PpHMCu3jRgEvWlX21+rih21Ht71Ag+p0ljSB/JO2+AbhgDB3vc1l7vmZPZ1SOtKr7J8
 QLq3bo7w5LIhspQO9HpzMtIy25ijDRs9U7WwgyTCfG7dLwh8Gvcj/z27AwfYGEgTHmCL
 eT0GKClWezyiFvJ+omcNREgB4ys9Te7XZQMwR90zaoYZ+J9r5sqSR64Ihhfb5CxdHj47
 L/RJYttgvvGEzEqtsNwgVajHbUMMYyWNVkN9m2YD7ac8EqN4RJArzddrVSLM2olobGSZ
 X9cg==
X-Gm-Message-State: ACrzQf2ZHuq2s0XLtoS31K5uxrRUJcbEq14hxAUiDJMbDomYHpfBDTVg
 mXBfZzxsUWRciZUnISsP2Dbwcw==
X-Received: by 2002:a05:6a00:1c72:b0:543:239c:b602 with SMTP id
 s50-20020a056a001c7200b00543239cb602mr34589795pfw.75.1664367414244; 
 Wed, 28 Sep 2022 05:16:54 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 1-20020a630d41000000b0043c9da02729sm3459114pgn.6.2022.09.28.05.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:16:53 -0700 (PDT)
Message-ID: <a2714c98-56ba-5cee-2a69-8e70c769e0b1@linaro.org>
Date: Wed, 28 Sep 2022 05:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] target/arm: Update SDCR_VALID_MASK to include SCCD
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
 <20220923123412.1214041-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923123412.1214041-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HlJbwmzVcb/o

On 9/23/22 05:34, Peter Maydell wrote:
> Our SDCR_VALID_MASK doesn't include all of the bits which are defined
> by the current architecture.  In particular in commit 0b42f4fab9d3 we
> forgot to add SCCD, which meant that an AArch32 guest couldn't
> actually use the SCCD bit to disable counting in Secure state.
> 
> Add all the currently defined bits; we don't implement all of them,
> but this makes them be reads-as-written, which is architecturally
> valid and matches how we currently handle most of the others in the
> mask.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
