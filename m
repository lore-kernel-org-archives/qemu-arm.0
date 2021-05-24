Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3650157lfm;
        Mon, 24 May 2021 08:22:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbNa7JFtuAVFNmiIE5SVOU7zbrEBgSMpMUIytHdGS6/aCvE72lmPnEQuFw54ITGx1dEVUx
X-Received: by 2002:a9f:2acd:: with SMTP id d13mr24301759uaj.7.1621869729755;
        Mon, 24 May 2021 08:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621869729; cv=none;
        d=google.com; s=arc-20160816;
        b=HHYWru5ADrg8DXmpYpXD4ETRwskHOHpxMX7uPqXWH2rULyy233CJlCCrRw0A02jwdV
         GrOuBhdzfhRWO3Bvwb7p2qeqyY5/D3cpfkJZtmWFwst7J9sMnrb+uRABzIkWq3u+fa5V
         ia93krhPk4xC9y4wOELeoKTSvB29y8PsCPykikgmGDB6wiKEg06Cxz7nMzJZUWmzjVVI
         Vd6tkdGVXdXsTP6yA9c9r7HeByWgtMyy9I3odWGGkHdt/ENkc/RsANuCfTLJuHyelFJq
         Vsi0/jQmQQIm1ZAM7+NPHRWrA98wM1+krsQiyGf2LPBilLADNNO8vABGEov7ULTRU9Am
         Qorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YiyFi5tqzZjVk+SKvZrMqCuPBH1GjFpR+NdP3Hbg9Oo=;
        b=q8J4xwhmvRUaAkRjL1yqn9z2RhLOcQeiAw2lDRfZnfZmg+Q9eAIW7ezpdofk2sLFvI
         uPpmxsSGmU/noICWWBuZ0ueXfomrfOVmP6ADHxGwUIeRolwY8aKYpRH8Y7Z4giU12TtH
         krrR5Hz3OyrTAUyQb0ZpUX3QP6WLtGo3sYc0Cc10hJvldSMXWSFUbxfKFf5kOaq83UFZ
         oQP8qGuIwA1B/wRmyJBbNPW5pdTBaYipqAsGOe3ctakk+bMpZE9cxntMFXPDOUcXiAui
         H9lp3vawAYtlLHfBphcJl2v8BTnv665OWI+cPld+D4M5BBfsg1rChZ2N86nCQD38n7KP
         TRHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oy//n7oQ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h27si6331267uac.203.2021.05.24.08.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 08:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oy//n7oQ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llCPA-0006q5-Sk
	for alex.bennee@linaro.org; Mon, 24 May 2021 11:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCOV-00068Q-If
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:21:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCOR-00083Q-R9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:21:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so11327386pjb.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YiyFi5tqzZjVk+SKvZrMqCuPBH1GjFpR+NdP3Hbg9Oo=;
 b=Oy//n7oQP0viSyeOGqKvSsL7nBASzqwXnQI2Een3XShH7pey2yiW6kva/NMyO+JE9G
 R4IvNDpn18nKsc+ozx5zRlCLjas2wVOS7oaoHW5ufx2e91jM4ENvawYjooW+1MkiyxaV
 1aNkW2uwvbTpW7oPp9/i5rSdj4c+n8SfkoswM5n56j1ab45q+BThzwx4T8uaUPNmhjvg
 jRBcAt9o8EoPjiypoR33dAXTyzbBlK1bkdomo8SYc4Wccb0pf+of1snZqGtLhObPpfOp
 /EadnQdwc7Ca9ABvPgkL8sBKLM2HSgO/uZwKB28PZ9gsbQ2dexIMLeEU+I3MgpX1iox1
 Jt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YiyFi5tqzZjVk+SKvZrMqCuPBH1GjFpR+NdP3Hbg9Oo=;
 b=b7yfeGzy+uVi5rjRMqTCgBn+R9k+DM7nhuRWEWX2lokM19xs2hwTEFYNujEMACwWLT
 oH5O3c/z72HAPoaxWVXpMRBVXuST7H7RSejvTJi1as0FDDDhXtTd02yUPqTh2QOnBCiR
 TO8TXfIWYgprmzHrgLXtG42syuLMpqPnHg2lpsUt39arl+4BGav+g2xeLR+3sXMABB0Z
 GG2sNOKV0z608JrF2YcRdWQN1nldPIxPEti7mzkqoWiy1MYp9PTfO7aRe0q1EciaoDha
 zHSSTSvASKBzx4I6ArbDDGKugCkUqAFJxnEVKIvLm1rbtVeMXKj8JlWva9fNTAlxfyfR
 +egA==
X-Gm-Message-State: AOAM530UcisalblHjg3VgVqlk21L8bo/0NZglFwyj7U5FmMbCxSsCOu4
 yiqqZrKLg5DMpM2EDdnCROpoHMSLucU9Cw==
X-Received: by 2002:a17:90a:8911:: with SMTP id
 u17mr25394423pjn.165.1621869682269; 
 Mon, 24 May 2021 08:21:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j20sm9368506pfj.40.2021.05.24.08.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 08:21:22 -0700 (PDT)
Subject: Re: [PATCH 1/9] target/arm: Add isar feature check functions for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bca110b4-220e-88b2-7d34-05d0475077ee@linaro.org>
Date: Mon, 24 May 2021 08:21:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 23oLB05TBrUe

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Add the isar feature check functions we will need for v8.1M MVE:
>   * a check for MVE present: this corresponds to the pseudocode's
>     CheckDecodeFaults(ExtType_Mve)
>   * a check for the optional floating-point part of MVE: this
>     corresponds to CheckDecodeFaults(ExtType_MveFp)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
