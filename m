Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3919327ejc;
        Wed, 11 Jan 2023 03:41:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs52g7eY5PwEqr6PNRorGckAoFH+WXTh9/wf2KJqKQrWTRqii4/ek/9Pry3BkPK52vCXzJ/
X-Received: by 2002:ac8:7351:0:b0:3a7:e9dc:699d with SMTP id q17-20020ac87351000000b003a7e9dc699dmr95961287qtp.20.1673437303840;
        Wed, 11 Jan 2023 03:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673437303; cv=none;
        d=google.com; s=arc-20160816;
        b=DW8glnU5Lto2oy6+AHEHZeRhJNrPzGX2hTUg+9I8JhR0x6Sb6rLp7IPSUesltcU2P3
         YJ0Ixoi/LzcMboyTWinQSuaHdJ0dYJUqijEnYtNujjWipiyFlev7169iONR71zEgrG4f
         vD+QlgyH6pMnJWUfyOnVechaYbzJU0Efe7LkflEEaAETuHX7xnf295xEQkTq69kWMLlc
         xx53ruLMMkKwYOmoYOLC+PGB0yHKUPC9swO+kRcfVOm6s5sIitYAMlUuXVo0+PpVkNRq
         dOU18L3ZaR9YmW/cheHvOa7d0SRHEuQDEHjIb/btRMrLV0/3pygJ3tIXLNDIiHBVRkle
         2Cqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jwTeo3ZkkxI+L+of6rcWdga3jb4dqhIZoBJkzpl+m3g=;
        b=Iqlomd/Jpya8knfgbf9ynsfDfwNuBkdUBSR3rRsnqJ3Kv3q44rMSe3oB5xs8ON3xfP
         An6WUOvE6Gcy6NApaw+EeUQyffV3VBsuoOI+QhCPH3wH0X/TRP/cque3JcRwHmH6RoVV
         tPrUXRcNsSnKObrxLHGffu4CRz5XAIQo6/5oKWJzHn9fO3vy3vRIuISs7r3tEKxvTWsh
         LjOP9iE1o8s4feYnWU1uqO2i7iH5fH4+JVU/4SQRr7cdWzzYgboEvzqaxtjz36BR2EFj
         czvfmqUUPXEBbezZ8kBovU2A5Tuwxx5uU0Qyh1+fWYkFeeojOAIIjUWjb80xY1qisHxa
         s10A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=USROVS1B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id em20-20020a05622a439400b003ab5e70e436si1181860qtb.394.2023.01.11.03.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 03:41:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=USROVS1B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFZU0-0000DL-DM; Wed, 11 Jan 2023 06:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZTk-00009B-11
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 06:41:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZTc-0000AN-TY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 06:41:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id ja17so10892734wmb.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwTeo3ZkkxI+L+of6rcWdga3jb4dqhIZoBJkzpl+m3g=;
 b=USROVS1BnmiHm/9acqM+GJyIU8S/06ZWVF2CGncEYVUvPoDEyaUk5uB8XuTFXsZVQQ
 1sNYOwQmF7lzMN18hUGLL0C9r3qO0Xqq5h4TVJwFUW6Z8dMyhcr32Anl+FprPbXYcDJ3
 z2GH9Wu0/ZG94Ebej+Nf9gZ/aCCv2Jzad2/HkFt75uQ++0Vi8Jp/RI4KvyspwOwSCFKK
 RlRZeH5IJaAiZ/ArPvlz3tZLdYQMLhmdZ2SOC26dxqeLeG+aMzxoSb9CHpt9zfyZlhRz
 AwSyzinGOTaF9uIxXtElNOFvEfiBWy5gdScbpGVj0Tfr+8hkGF8hySwRqIPsLYkKPXwM
 owFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jwTeo3ZkkxI+L+of6rcWdga3jb4dqhIZoBJkzpl+m3g=;
 b=mpuxjeMMW1L9DaJh7azOJ681oukC68JCeDnAtFdXTYwIIfurWednbZ6VbXlcdTSdmF
 tHQ3IIJwGyZUtiJOeinQ0J2p6N6aEqn6y0/k9xtOZL3FlqXtemEKHebxtBRFGQ+qPBXb
 QgbEn21bb4FZtftKB1fI3hjc7bZFGQxleOQPmX5Q8rKqwkpru0mjFrywPHHyobRMs7TS
 onQyq4kPhXEgkQeJQM2rqgwjmBIJiDH1P0R0MptueIEcjPf2C9mFW2wi4kAvfjmapnET
 Q/v4yZ4ngoI6DmKiVJrQUCygPMb2TsR7OEaJw/WaADn/KbgfftG92VUqe/+rp+8BKqPh
 WmAQ==
X-Gm-Message-State: AFqh2korvSGJNp5Jgo7eqmbGNR+lRTQWo2VU11aNXog2+EwEkcri9BZe
 oehB57QksSuDOu3A/xwSgqQiEg==
X-Received: by 2002:a05:600c:3545:b0:3d9:a145:9ab with SMTP id
 i5-20020a05600c354500b003d9a14509abmr32835792wmq.39.1673437263364; 
 Wed, 11 Jan 2023 03:41:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm25007665wmq.32.2023.01.11.03.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 03:41:02 -0800 (PST)
Message-ID: <4aa7f3f1-551e-edf3-c1e1-1604fc42d3f4@linaro.org>
Date: Wed, 11 Jan 2023 12:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 14/36] tcg: Add basic data movement for TCGv_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ndZUkLtFnmY2

On 8/1/23 03:36, Richard Henderson wrote:
> Add code generation functions for data movement between
> TCGv_i128 (mov) and to/from TCGv_i64 (concat, extract).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h |  4 ++++
>   tcg/tcg-internal.h   | 13 +++++++++++++
>   tcg/tcg-op.c         | 20 ++++++++++++++++++++
>   3 files changed, 37 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

