Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2133894ejb;
        Tue, 30 May 2023 05:22:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5GYKCXAvhMltNQ0wA7KfztWnZTDDWf0zBbksS92jFwwdbxi5rb8pPHmMSQdjPx1LZqbxUN
X-Received: by 2002:a05:6214:2aa3:b0:625:aa49:c346 with SMTP id js3-20020a0562142aa300b00625aa49c346mr1626583qvb.58.1685449360853;
        Tue, 30 May 2023 05:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449360; cv=none;
        d=google.com; s=arc-20160816;
        b=UgXv6qmfqJ6M7G3z8o66V4yUi4ppYL56f95Ry1nNKbn6QbN9Iuw9fWxr+4zEX1jxyq
         Pae1anVkBd9RqAitvz9q8pwKerZ4xmOysD2p8Gl5Sk0a7wzyZSBjLiN7plLr2/ZYqXPo
         LV7AKRENxHNmm7X2e2MMXiMJ7/FdALJ4ffSRkmo9Ff9DruxXta1sGUePjMWoMEDJe7wR
         2aSBBGX5PdjyPdKAlWHBjnlD2sKNm2ZewLS8nTY11LYUD/t6x/vYyxJp0gkOh+hcRiCI
         ybBTTEhZyk0sXBid6moTGtgRmjfvrEHKR2ivZvHVmFIWAhJMI03OkKcy4lfbryeSuD0i
         rTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D1LKyft2/91dJcophWImOTWMocrtI2x+nbhDwIJH+7I=;
        b=TOtfbWvegdOvPQ8dJXQbVoJ6xVd4OsLGogLFIbZDoheInPln3p0iPMmMkKP6PLzjk8
         lTon/C+HdNV83UeO0ASoEejDBeCalBIc6HPB756ITmNC/ImqK0yDP8qIBCPIcq975ZJQ
         2hyQIVxMWklk0BcYGITbJmQfLfOZQnOWGJ7Jk0/TWfRf5E1z4ixvzkPmwM1rni5DMziV
         5L+tdb8u7eSGLz/ARaXPqKpqfxbxdLUm/LAPckNEvYWQyLEVFnDygSewiRBa0Ay2rBgI
         bcE4rOiajuz9efnTRXbE8L/LY8/+UHhGKuwJNukJrRtXZYno1s1ZRNAa4EUgzkr+tiYk
         OXTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fbSWlfab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy10-20020a0562140f6a00b005adb460bc9bsi6342008qvb.412.2023.05.30.05.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:22:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fbSWlfab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yMz-0002yw-OP; Tue, 30 May 2023 08:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yMx-0002pJ-7F
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:22:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yMv-0007ld-50
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:22:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30af0aa4812so1161731f8f.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449347; x=1688041347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D1LKyft2/91dJcophWImOTWMocrtI2x+nbhDwIJH+7I=;
 b=fbSWlfabF4A6S0jbrrLQPr0y7m2vrj6+aceNV4pEY20cEyMckwoy+wzPj1VzWT1zGe
 j424UWV5TUAXaA3Z225KTOrji1e5AB2fY27kN+CbmkVLDb++Yc2dkLNN9CcBM9c16oKm
 oPyTR1kHZxZck7RPBZdgtA9rrA6ebMpwe2ubiJYLS0fkFkY+977els3Eg2qyBwUuBnmq
 xB+Lov3ooil0Iteb7ESBTK61vMHTqL+rnMrcKCiaO8asfOOi3S464IDfvlhDqkzSkY2p
 LmPNGO6i3WjMRemaKqO7aaX7ygHaiUWjoOE6Wpo3Hyi9o083E8K7l4yOrfMa+lQrivAt
 seXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449347; x=1688041347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D1LKyft2/91dJcophWImOTWMocrtI2x+nbhDwIJH+7I=;
 b=U6U7DqCZ9hGm3KkIy9KixD/cXOf7AvooKwqWOKtPe2WBrHvEyyJKA0NopzTDgXi4GI
 JvVjJjvX3p8J4qrKJTpaAT1nJlti7m70P4gULOib0KUnycumdZxTxqeMGrKXrmsKf2+m
 +MjNh4DFLImMGt7EQnwVUcmaDTUKeWFNqWt8gxD5TNPVBjm6Uh9a29vHYrNF83zGq2Y1
 1R6IoVjes7XuqbQ9yP6lLq3pIXDebh9Jip8Znk+Plp0OaWNfhs/gWNKezKj5OJ+GVq0Q
 fr+4ZHO8rIUMQ810D/iXzDLJBK0wxSPnUaXz04AsDDHa8uLSYoWZtK8mg3S+X5xqFgUO
 V93Q==
X-Gm-Message-State: AC+VfDzgnrzl+mXozjSXUgHwE9sLLYaYAqLybRz05dpDY5jauZiT/VVp
 y95TZ/mtfQHXJRiXgHIcRFI+WnffEF4qaAKt8wYjWQ==
X-Received: by 2002:adf:f404:0:b0:30a:d8df:6800 with SMTP id
 g4-20020adff404000000b0030ad8df6800mr1413209wro.33.1685449347478; 
 Tue, 30 May 2023 05:22:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a5d544c000000b002fed865c55esm3086126wrv.56.2023.05.30.05.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:22:27 -0700 (PDT)
Message-ID: <c9406bef-2a9b-1c21-c11d-bcf8a85bec96@linaro.org>
Date: Tue, 30 May 2023 14:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 08/10] hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-9-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-9-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YYm2aim6kkT7

On 30/5/23 13:38, David Hildenbrand wrote:
> There are no remaining users in the tree, so let's remove it.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/i386/pc.c         | 19 -------------------
>   include/hw/i386/pc.h |  1 -
>   2 files changed, 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

