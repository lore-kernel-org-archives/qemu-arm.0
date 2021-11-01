Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2409657lfv;
        Mon, 1 Nov 2021 11:47:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySwAmx/mKQI3xomevSV9kxlAstc+iL7v7zEPZCdLJQuv+awZYTzWb3RAWfwH6bG+IeP8Wx
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr617034oia.95.1635792474354;
        Mon, 01 Nov 2021 11:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635792474; cv=none;
        d=google.com; s=arc-20160816;
        b=BFZa+1mT9bm3XzidPh0QzLvDJ61pIhwdYgCDHb2Zb/z3qHAcvRvKvO3J9yKJk6hnhp
         XNy99tXvKjgH9lAd2vAkOpxw/rbBzGQiVKa4GqDLm8UDEDypMmnAR0m/a/xmdSMtcBib
         5603XiNFAy5r2plpPNsltgTnpqI+qqjhRqodvRrLLQN3fxK4YphD/UwQrcebWByfd7g/
         9OLLn1o35IUkfcj415Sne0X5F6jedSGlSfeuft/UwUUtLQK0EovPnfhNdbsdTYq0LG4S
         AobT1dEjE4R9XS8ONNJxciuIbgBrH6KOdvGUdWtNe3JYuBX0lGprlMHkCD4H0Kc8w/m6
         9iZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XzX08mkc8lICHGgJm+2F9Q1wLQnL+YOVx1G6IsUiEWY=;
        b=nzJyQsI9AHwSwFaeo6KPMHSx4Ca/2PqOcteNakNgUDaPWzcMqdQPv0DXB9Sr4db0SY
         ANlddOsFFCm/MfsGCw8A4m9UgKlwwAOHcYvlJSBUagbTWutla4PjEISkQtt2zwbn/72V
         Yah3yKOJwv8pWXkoxSlbuR0SR6s2RLU5UpJrHNl4ZmhLKTPLEK2NOYevUJBwUKYQt4ta
         uiq6jgZOKDJEyN0H8nloWYmQELTG7olNaGcvC/oLBcleDc4UvYis50GgS7biB1/+wY+0
         Mklg7ZZXuBE31MoMvt3dv6grY7Wfag9qi8c4zpCVgpl2wq9Zw19zCjoxtBO5l0fljlh5
         lq7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VYuogH6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si5702741oiv.230.2021.11.01.11.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VYuogH6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcLZ-0001fH-Ms
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbNq-0003t0-E9
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:46:10 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbNn-0007n7-Jk
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:46:09 -0400
Received: by mail-qt1-x82a.google.com with SMTP id h14so15776676qtb.3
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XzX08mkc8lICHGgJm+2F9Q1wLQnL+YOVx1G6IsUiEWY=;
 b=VYuogH6wHZspmYqmf7Rk8Lb1QNvxtqccOmSqiuz6np/fAfEzxNqH0pA1eigGwHlCBs
 +UwKacUVFB1H+DK0h5k+IUUjLYL8fSkhDdWKE8qCDuOB+QaaS651g/bwp6G6LKOlRPZW
 yKr+boseW7JJMFEFsijmXKiTj4iJz/tvOg9r18BjFB4vtomLwNXb//kpEsW2jaMCQtA1
 4pLaQxOQ/WGPfrFsWJHjQRhkhHRRBVXd/tAPGSnlXiPMf164tHCYiiJMlgq52poFbG84
 IV6Y/WqptPpRT2PGP/G0/jg8xHxABwP3wvonwh2iSLyjyO/o7TsA9lM3qaMDfX/Qa+w9
 AvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XzX08mkc8lICHGgJm+2F9Q1wLQnL+YOVx1G6IsUiEWY=;
 b=XZH8qeL921Zua7XR0mxaU4Io42ymwX6wtJB29QTw5Jt60cVs42CjoKCoawj/PcmGr5
 knzC7HKYfTZCjjANNbuOKq2A/P7FA0evAGIAeEKgZmwB6kzYxn9tDyJzG+pYbGIsu+R+
 0AYOYwUwYpG6hygfJUm2Rs4GbXIWQahxs0eDF3vDSz4zN/GMuHTYoaovyMa67syLcInV
 eZq0Cdgr82l9+o81dAxbOH3Gzh0nn4jMWxe46mnOD8wh0zqeB3jI0Gtxr8klInG6MNYm
 MfVoP96RAaOrymttPD8lKAj9hWagAer/K3PGjwWiiklzu32A2NselJX46UbnArLJZnRj
 D0tA==
X-Gm-Message-State: AOAM53117NrZxkX4kB3rZr3mAdkghsfcPD7X5YOVKjr8Tu8nbk+ZKODQ
 Vepx8h+8QUV5HE2ig8nqO6oQ2A==
X-Received: by 2002:ac8:5d86:: with SMTP id d6mr31310734qtx.194.1635788766511; 
 Mon, 01 Nov 2021 10:46:06 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d9sm6654321qtd.21.2021.11.01.10.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:46:05 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/virt: Rename default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
References: <20211026093733.2144161-1-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d3143ba-e91b-0f85-bd8b-4b551e966ff6@linaro.org>
Date: Mon, 1 Nov 2021 13:46:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026093733.2144161-1-jean-philippe@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 38AXe/G8y7CS

On 10/26/21 5:37 AM, Jean-Philippe Brucker wrote:
> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> parameter definitions cannot use underscores, because keyval_dashify()
> transforms them to dashes and the parser doesn't find the parameter.
> 
> This affects option default_bus_bypass_iommu which was introduced in the
> same release:
> 
> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
> 
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
> 
> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> Reviewed-by: Eric Auger<eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Tested-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
> v2: Resending to be merged separately from the equivalent x86 fix,
>      already queued by Paolo [2]. No change other than added review tag.
> v1:https://lore.kernel.org/qemu-devel/20211013160607.649990-2-jean-philippe@linaro.org/
> 
> [2]https://lore.kernel.org/qemu-devel/55e7387a-4bc0-1743-1013-19c38a6ceb77@redhat.com/
> ---
>   hw/arm/virt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to target-arm.next.


r~
