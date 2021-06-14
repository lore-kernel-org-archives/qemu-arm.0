Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2249625lff;
        Mon, 14 Jun 2021 12:21:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXXhAzMh7P3Q9E5QrRW9rIPVKqmnQ1MqzVv0cwsLEwoGJi6NO9FgWhNq6I4iDswvmmjrfg
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr20636591wrc.38.1623698488637;
        Mon, 14 Jun 2021 12:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623698488; cv=none;
        d=google.com; s=arc-20160816;
        b=jxWLHjZ9faOKAoe1/ij7iKWIno23MgvanRKUB/xO5VxDPKJsX4oV7+s2CwaEe37vlD
         nN7ROcBVW/HyH8/kfJrWzCitvuR9bNYJf4WZOOp/ddAakOvl9Zv7Sok1T3/fPe4wnJTd
         YQXybdWML41pW2sPV3cla9OU14lzRL8O7nCHnJ3xJNkxcTDmHWG43M9xc+RA1PjOMKLN
         xZF3R/RBrQmPfDBTbta7lSxuf2jeteP+LJjH+FORIckeUs9/s9Kw1uqv/GHXZTxehNo+
         P0v0lxZvZ9ZGvGRfr5izYy80FvRcvIczJ3ELvX1MwsRGmZnAQe4cqAfFuAYJMike4//o
         d6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SNdXnr1gFQuDYNXy35VNpIVS6LJ2vn/tLdKps1dm1Uw=;
        b=J7YPtgKWX/huY1JXR827NY/scSkfSuH7K3+I7UZ2vWaQd9TpUSBeEshQLDluF348rt
         pnA7YXP+7jBK3iBujyw7E54rycWWgxmgy3PqYC6BJcsbBBn7Z0v7EopmunCNfqITbOEj
         uuMt78WnfSlHU0IA0GU5eKuVIhnpj2bBPpqa40accUTzvCqVKmeEItpZQZtfzNZLljqF
         LeVfGbHSiDF4JXTARlqAZxdcHrdsqZgO63kkvpk2Qf1xtgdqzVBcrcBsVn4N/brMGgGN
         9s+ason0qw2Hgc+Vil3KHmE83A+LSn9dYW0jmhemIH9cVMnbFavzdULiOZgIAQDo6LMd
         /2Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzvFZBp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si16640094wrw.122.2021.06.14.12.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 12:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzvFZBp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lss9H-0007ro-Pp
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 15:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lss8w-0007oz-66
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 15:21:06 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lss8s-00065t-Q4
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 15:21:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id y15so11317928pfl.4
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 12:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SNdXnr1gFQuDYNXy35VNpIVS6LJ2vn/tLdKps1dm1Uw=;
 b=vzvFZBp1CErX+EcQOc5/Nuwm2a0+T0yp9j3OPw7zqN1ckl5jvkSspIkZqsEkQcBb9D
 fN20VU40ASPwk/mIvZ2GvzXcw5bmHXDIa1/Gbc4/99w5OrJdCe3NeQVkAfLoFWFzDcF7
 Q2moRPEs/1cLV18KfYWi3hBxMYOh7fwvMzGvTj2ExU1fNSiRopjCkg6uhizwR60p9+Y5
 LbcjJ+GOyrui5fDG6JL6w7+raTpyLpjKlpjWF1ybAmueebl1Tz6UO4At1QHjKwsJH/RE
 MAypM+FkkeRaJsbtTa8FmFVPRZp8hx8xcWbCd3sEHgk+moYVqXJQgVOBFFwJaBrASTcX
 OkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SNdXnr1gFQuDYNXy35VNpIVS6LJ2vn/tLdKps1dm1Uw=;
 b=rRxRtctxyU7IVhGt7mtt80LC0UdurB8jQcaUbEo1Ir5eTMzejmnLiYeRIHMhOAY9/9
 /OjQUOsP5GW8DXxsKACvyywOGHL6WUh02j3jqVBMkLVhVG7FJz0lHe0e8i7+UAV1lqw7
 mwd8MACiKqGC/iIOQkK1Q9Lt/xIAcaFOHQjQxUplueR8xndzb47yFDnR+qrGu2mRHU9U
 uul1epTGfMVtynr/d4VSKVFU9QoxlOiKyYNVeT7mEMsbPOCz2D+rpAVNX3ctfuWxZHhE
 5S4PJUP5ut6TFeI2Ee7DBOSijCQIbhD8YQt1EOcaE/U5XvaifSWC8NXWuCm/tAthbZkR
 b5pg==
X-Gm-Message-State: AOAM530IzES5BB9uzWjVecqR5s09na74qkgFPkkHtwbYOUC6d89vRCsB
 fR1zXD7i5jk9OlxWg3ZO8jKQjw==
X-Received: by 2002:a65:47ca:: with SMTP id f10mr10749983pgs.94.1623698461213; 
 Mon, 14 Jun 2021 12:21:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v8sm276103pff.34.2021.06.14.12.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:21:01 -0700 (PDT)
Subject: Re: [PATCH v2 07/57] target/arm: Implement MVE WLSTP insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d66f483-cc5c-9e75-a469-d933a1e601c2@linaro.org>
Date: Mon, 14 Jun 2021 12:20:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: f3dvO3rHidhv

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE WLSTP insn; this is like the existing WLS insn,
> except that it specifies a size value which is used to set
> FPSCR.LTPSIZE.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2: swapped LE/WLS lines in t32.decode; added missing return
> ---
>   target/arm/t32.decode  |  8 ++++++--
>   target/arm/translate.c | 37 ++++++++++++++++++++++++++++++++++++-
>   2 files changed, 42 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
