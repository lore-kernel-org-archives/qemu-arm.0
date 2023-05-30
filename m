Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2134714ejb;
        Tue, 30 May 2023 05:24:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43CEwDphpiEl1v3WY26LuwXwK4x7cj2J9A7elQZoA5YMkjOjzZ2J484BWqNIoB9nLLjnO3
X-Received: by 2002:a05:620a:2541:b0:75b:23a1:3f5 with SMTP id s1-20020a05620a254100b0075b23a103f5mr1805026qko.11.1685449449214;
        Tue, 30 May 2023 05:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449449; cv=none;
        d=google.com; s=arc-20160816;
        b=ic3Kuiz44832pVGcy5Nb23ViRQ8w8OAwGV12S4pC0ttbVvdJ78wKlIsAxaCIt45o9h
         qW9WxVtdlkjQcJizdG+8PDk0gPG+uI1+dheURGUhJo4uZOmjvaNCdcKUSfSddMrtXtXo
         1goXspwqS96VB5HdfO5oxIXhJR46jMQ3pzZJC3Gu9UhJ/vtk0XD1YGCYwyxWWB6OdhtI
         Yt/AmVyI8gII+KJMJ5xfGsW+75bHXrB/68HCV31zqgdx4n90+BS4y6oGrb73oe7kZhtf
         Lw4FwrieJS4j9Vk3dJ2FUKnIPppbK5MijC4zdY3F0gR6Ua4UKQ/bUWMDy4IOlI/iJ6Ik
         NGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TcgUn3HHQH5E5gr43nISbrABGWYsHohZSLzGYj71h1Y=;
        b=Wv49YMH7/pbTalJknJTwxYhgP5oNRkuyVoHSbNjwEDkoH7CnS5/5/JUU4TGCGGwN+k
         0/5mvjJAqiSo1NmbDiW3lnkgCTiPcKwHgjmMaHjvIAkONHsYEmM0EfOnMxEMdCR4ei/+
         MMEiav1omirz7uZ7RMiNZSGpVtbut9MqQfCqkq83sMH7NH4VVZYIhaJAzN80qLi4EjSG
         dsgc1OzT0epbXmhswReDcaB1JJt5eSMajrSlH1pDOX5PoF8tkWlViM7iPVbRgQKDJD2c
         DYTtn/2dOcqZpIvEQwXMaJJ5x/L14dDmFDviNTJxv35VrBa+Up2TqdjMb9lMhXyZk2tE
         7trQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBmN+n+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1-20020a05620a108100b0075b1c871b8bsi6443043qkk.284.2023.05.30.05.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBmN+n+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yOS-0005tL-AI; Tue, 30 May 2023 08:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yOL-0005ra-7S
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:23:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yOI-00085i-J3
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:23:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30959c0dfd6so4425378f8f.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449433; x=1688041433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TcgUn3HHQH5E5gr43nISbrABGWYsHohZSLzGYj71h1Y=;
 b=FBmN+n+UVEVYXoMVSqcAYZkv4aDlOBHcMv2yMFptljMNuuX9ruD4tqXj2lv6FiWuxI
 Gc834XAk7ZAV9iWEw9vWoM90yfsHVIP2Z6sON/0DtI8CK0dvsXMeyzIwzizy4dhZwBRV
 bqr3vm4zheQ0fUoffD/oFBqiN+hnIYjQzYLufkoad+wG8VT8DuiqzbTSLXI//x46HZkP
 /sW7RVATguxN157JkCKfJunuCde0y/TTnmgeIjTMM+GT0Gyx8MX/n61Vp01No5LGU40T
 zR1PGCn7nJEjgXWDuNv37YvKeTmn6tdkgyVCeuwXMAN8huApRRjbW5azWudVNsU4MuNH
 33Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449433; x=1688041433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TcgUn3HHQH5E5gr43nISbrABGWYsHohZSLzGYj71h1Y=;
 b=dzCckJWc3WFSU8Bn5N/0VhTw2p55NJpSe0kwiyGOFq8n2mZzGJyMnl38d6T0ZFgpxq
 8BL0323IHiulb5HA3PyjjBEq7i2s5PBIl46xQKIxgfrFxYITU+vjaXCT+COBzi3TZveu
 B5ynp+AdfoQXwy48jve93xSn8oDiAgwCBSL/ag2IrvSJJ8i5rDm1qh+g2pzPYAtwC0Bg
 RzFd6ro0p5f0+gwBn/mNtRIrFycslHaSZe2R97yvQ/k2DLrqNXnEHtvH89CggN7HwtJk
 njcELNdlDoJy9dYK690WezDOvmStF3RAu0rGdC+d5L8E2LrWlEeNfgzfF51r3y9I9eKI
 v+qw==
X-Gm-Message-State: AC+VfDz7nkErK7ozWjxBxBfyoDJCcPbMHBFktG3vwxMAyjuDXimbG4JG
 RxKfkkrrUkazLFrHlTIp8sWTFA==
X-Received: by 2002:a5d:6188:0:b0:30a:f05f:ce46 with SMTP id
 j8-20020a5d6188000000b0030af05fce46mr1362055wru.8.1685449432967; 
 Tue, 30 May 2023 05:23:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a5d5272000000b002fb60c7995esm3154719wrc.8.2023.05.30.05.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:23:52 -0700 (PDT)
Message-ID: <77694e60-a811-3fd5-bf05-2c644995e2b6@linaro.org>
Date: Tue, 30 May 2023 14:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 10/10] memory-device: Track used region size in
 DeviceMemoryState
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
 <20230530113838.257755-11-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-11-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: oObP2puNSk3g

On 30/5/23 13:38, David Hildenbrand wrote:
> Let's avoid iterating over all devices and simply track it in the
> DeviceMemoryState.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/mem/memory-device.c | 22 +++-------------------
>   include/hw/boards.h    |  2 ++
>   2 files changed, 5 insertions(+), 19 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

