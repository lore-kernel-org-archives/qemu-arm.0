Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp809918ejc;
        Thu, 26 Jan 2023 16:29:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/8Y1JosI2sbxZYwzj5YPFVtAzhcdMv9dXgAHfH1VohmFqf/oJdjjqxogt0Vww3Ihs9n8T2
X-Received: by 2002:a0c:e003:0:b0:537:6a1e:d822 with SMTP id j3-20020a0ce003000000b005376a1ed822mr17216761qvk.14.1674779348019;
        Thu, 26 Jan 2023 16:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674779348; cv=none;
        d=google.com; s=arc-20160816;
        b=Ydr+inXSOKeBz7yxNBbYELf+Fe9xwpuV56cg3S8cogDgXgBJhXsilRIkfBMUmDC8Bm
         A2sTa12i5F5wyGIv9f8xpXP0Fz5ddJxSOyMKWoP4ReBM7E880PgrACalRBHkl39QpD05
         sI6tpQfbv/Xh5DSXF856wV7bY913wjF/eG4FkaVj313lBucRYG7MvFB5DEvgSkecsUyg
         pIhkmZu9uOpeSGzHBUiSvqVZSHa+GIT237ULaNchtfSwcyLbVwmBb830MS4HFlkKH0ok
         /GkDVnxsN9bBOmqi+e4M0jzDeaTebdgsb6DDkim6o1M+Se8u4HIEaSenBPcJSX1eDmGn
         kpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dfpPtN/7SvtdOJ7T54E/0ir8OsVj0DPNn425A/+WzPs=;
        b=mgiz9XNsXxe4Lz5aQRD3FujB7rvdCh6iUE4Xdw9Kfim4sI2LkAaGIX/GtoHTKAxcmZ
         7VKjQnmSPr5+Crjfj88bY0Kq6CKDVCCg0PvP2wtnY9PuuWCtIO9b4hLNRO5WFnbA0rl0
         lIaJEP+psf//Z+6VIM48CJEE030fHrv/b7EIar7qBVWlQ8SsJNZSeHOBNB/t+YjNmX4W
         Ey5BvGRQeQiJXKT1XF9exyW5Ptv5mQT4A4rbwmOYtt9RTIhCeWwxmU0Q4BtUKbLmo1Hy
         YRQsgWOCxaQ6DAdl3JmGbzGbDx6ud9iG7q3KmF0bogc+o+dPROji/HFhahDwxBApF95c
         nSUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbnqra4U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m26-20020a05620a13ba00b0070655eb5c37si1822598qki.147.2023.01.26.16.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 16:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbnqra4U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLCbn-0008AD-Q6; Thu, 26 Jan 2023 19:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCbm-00089R-3V
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 19:28:46 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCbf-0004CJ-Dr
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 19:28:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso2344801wms.3
 for <qemu-arm@nongnu.org>; Thu, 26 Jan 2023 16:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dfpPtN/7SvtdOJ7T54E/0ir8OsVj0DPNn425A/+WzPs=;
 b=dbnqra4UdVj2kMxYOGNgUHEi/vfOm5+P0/pBGaXhDAsZQJSXWQsCWa1dYnIuQGWdSw
 Le6djH5mqgDH3s9pA40EkmgyBTa05WaCQjbKygr54h/7KyuWH3u9OJX0Ee2y38oJlvP1
 ye7p4RZ/L1TgH53LAWzeg6osAcA+vx/vAIXRyCS80CkurTByoVAKMFSs6YDS+iAyJkVF
 Tis9hDnJk/aCyU4W7xtOrwyRGiULd9Tx6eJMgEloKtdY9DkM4olarvLwsZKCOEhr8QRN
 oRgPVCthGbZRXCFzieTTV+RzSPp/FLm8ez4J+mKJg6XxVKlbgFCv194FwrneFg0tcUn+
 szmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfpPtN/7SvtdOJ7T54E/0ir8OsVj0DPNn425A/+WzPs=;
 b=ALHcDwpexog7idED4yWyTV5Mbp2/P5gx5kUSw4lQ9dWHF9EUeiyRHLTAPI8cF/pWaD
 i00U5+cDTndvgsUmID4ljwAqAdvdV7YgFSMoKOXzxEmMkCCOMhtuHY2idO6F5XIC0uKJ
 3KMJQWZ2QFAvX/4vmwXycvWWhxDfJ8HC2OSqk82FjyPI786IOONSt0f83b6od04otmzW
 ycJSSjarAIeMgKrUnkznJjfaIr6ga04vB1iz511yCTuYUMc6GNjp+XcFjWuAmEUr8Xtr
 0VUhlKawtOfds55H1zk0XHGhnYZas/hIcmzHPZXupFvcI592DOK5Tuocwlm76JwKh0N8
 IC1g==
X-Gm-Message-State: AO0yUKXmw0bUpjIa6jUMnkgg9HCEtya4n7eiFooqbaCNcK6fxlOSHI1N
 BlVZ9S0tL/gB9QIvvGnwqD4ti2fc3hUDX8qn
X-Received: by 2002:a05:600c:1c1f:b0:3dc:37d0:e9df with SMTP id
 j31-20020a05600c1c1f00b003dc37d0e9dfmr130560wms.14.1674779317836; 
 Thu, 26 Jan 2023 16:28:37 -0800 (PST)
Received: from [192.168.0.114] ([196.77.8.13])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003dc22ee5a2bsm3933201wmo.39.2023.01.26.16.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:28:37 -0800 (PST)
Message-ID: <67d5588e-af15-bbd3-affc-d504d396daf1@linaro.org>
Date: Fri, 27 Jan 2023 01:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Fix physical address resolution for Stage2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Sid Manning <sidneym@quicinc.com>
References: <20230126233134.103193-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126233134.103193-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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
X-TUID: YgTo6DLq3XJU

On 27/1/23 00:31, Richard Henderson wrote:
> Conversion to probe_access_full missed applying the page offset.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Sid Manning <sidneym@quicinc.com>
> Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 57f3615a66..2b125fff44 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>           if (unlikely(flags & TLB_INVALID_MASK)) {
>               goto fail;
>           }
> -        ptw->out_phys = full->phys_addr;
> +        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
>           ptw->out_rw = full->prot & PAGE_WRITE;
>           pte_attrs = full->pte_attrs;
>           pte_secure = full->attrs.secure;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

