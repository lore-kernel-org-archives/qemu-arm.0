Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3723287ejm;
        Tue, 25 Apr 2023 12:48:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3X432S4pUXgE7HGapC2BngajqcRoOR3KG49BcUbdEQ+PsxzXEVtWNLrskmWWkrWusZQYp
X-Received: by 2002:a05:6214:29cd:b0:5b1:a698:43c6 with SMTP id gh13-20020a05621429cd00b005b1a69843c6mr30636862qvb.18.1682452113722;
        Tue, 25 Apr 2023 12:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682452113; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0J0HpxDfUKtr3ReL6FLWGMHIu0VDid+5KAyqO/Pzr+CiBykS2LB0ybHc+w1lVzNxc
         vy9fmD14C8GTtyXtyQ9dUAfNVbQixd5KnejLl1s+B7zK6HguFx9bFgk9cHGYv9IQsKs3
         OV13i73XZQiR4/27rjzXvKuCOyImeqZiYxnl84KwoLVKUyfBjDrdZTLHs2qeVAOJFyOl
         F2x5EtT7aY7oLUyIlIpadXz0xKONppJeVU4HNWu901/Mhn5PLnFLgSWXikoxKZmo3Uvh
         O7Lkc8Bbt5FzGLaeiX+ge94hs/XrgUxNnpcLfyYLnaRNyNP1s1NrQJeX82gF9w6JT/xT
         XveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=atGh+rgwfi3iASVIBedqBgwyvqcP9fe7NaOf0ff5Psc=;
        b=saBnrBmbnzAwTyvkpEE6jyF1rR7QA1gY28jwAOjYKQOtXFZO8i2ccIbD28PqG1wmGs
         4K0i+Tpz843CNiYyc/TDR9GRd03ug8W+Kn6V8YGBCJotA/w2KN4zLEM/6X+OgDfk8Uym
         /dEKqK7vX88CAIIaJXFP0r8/qZTszzYNEhzWwVMYMrCwtaCKMFfk/pVFWfctyWRhcQek
         agknDmIURrQCL0Ej6ocUsTRT5M6rjGP38cSp25XjSe0e9BSlbFp00Zqot8P552RZKysh
         yb5E0EOlLXbpuSmn7WrvBTbY8d7b1hP/T9lfL7T6SJkE4o9D6zZTC5ZDtpZOn5XzdJ9O
         7nSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=voxfVpmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020a056214040500b00535479e9d53si9406463qvx.590.2023.04.25.12.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=voxfVpmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOd0-0002y6-Qm; Tue, 25 Apr 2023 15:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOd0-0002vj-0y
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:47:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOct-0000Qi-6g
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:47:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso41933925e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682452017; x=1685044017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atGh+rgwfi3iASVIBedqBgwyvqcP9fe7NaOf0ff5Psc=;
 b=voxfVpmcP9YwWoBqiBMDSvX3rWvsJ5z2YzVUGzrJRctihc1EEH/l+9eFzpi/P1pUt6
 WFqEXZ9JG65I7nDWFOeEQo2PQVyX36WaKg4UdGRZgSK9vGECAYS7ykpngqQNR8KPjnF7
 NOdjKZ92KrFUC60yjsv78w+CBTmSbdKnHTWr6Dje9OOoEr0/CCEKQGhDKCjRWDKWCBpy
 V4LSQaTEcc224g+iYqFZcE5/S0AfO+huNeZWksAgZ52VSYM/5EF5qgrxsOWbdYWbDI4k
 Huo2pJWENiRcRoQ1RrcTf74XTAs5FVKthsYW8j9FxxFm+a3zbrUhx90uYYobyNDG3avW
 Fx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682452017; x=1685044017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atGh+rgwfi3iASVIBedqBgwyvqcP9fe7NaOf0ff5Psc=;
 b=aXFbaAtnmU9VXzXEeWjSm+dTPIoxvKtkFCBFdhmKUUZBFSEkjuT7WJ5/K71OL/dNHz
 Ezg+vxBNUDRlI9+RCgi2ottUoImFUHkbZ8FDhUPRBZx1ImWRyoDi3Wsx3BMe2YXIyGSs
 hG14Z6x4BGjDMVKUDT0rrO6ccPOdRp9hRIqEMVoBUr4RZ42vvf4N+9IX6OewuE1BBYI0
 vxHT3tha9+ui1qTjI4B/BvUY0IAiuRE7pGR1pHXE7kTdM58QMckWy4QCvWG5CTAD0lbZ
 QyngGPE7ql6YgE1+cNY2kdATWzyWm54pe3E/DPnCnYNYbS7YY9oe5kYUeKTfpUOk4U7K
 Minw==
X-Gm-Message-State: AAQBX9eDFrOTIC+AKmvss9fZf0WZDJk2ZaxhJzof2mJ97MapiXaiZma+
 aCYsSnZiShhMBFpSVfErGmZKoQ==
X-Received: by 2002:a7b:ce92:0:b0:3f1:bb10:c865 with SMTP id
 q18-20020a7bce92000000b003f1bb10c865mr6366301wmj.38.1682452017598; 
 Tue, 25 Apr 2023 12:46:57 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm15854425wml.11.2023.04.25.12.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:46:57 -0700 (PDT)
Message-ID: <7dfc54d8-ac8d-9041-b25d-6409b9d5c0d8@linaro.org>
Date: Tue, 25 Apr 2023 20:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 04/57] tcg: Introduce tcg_out_movext2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SjjpjpWSL3VF

On 24/4/23 07:40, Richard Henderson wrote:
> This is common code in most qemu_{ld,st} slow paths, moving two
> registers when there may be overlap between sources and destinations.
> At present, this is only used by 32-bit hosts for 64-bit data,
> but will shortly be used for more than that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 69 ++++++++++++++++++++++++++++++++++++---
>   tcg/arm/tcg-target.c.inc  | 44 ++++++++++---------------
>   tcg/i386/tcg-target.c.inc | 19 +++++------
>   3 files changed, 90 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

