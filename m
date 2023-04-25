Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3587944ejm;
        Tue, 25 Apr 2023 08:45:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YONDoauj43/SaUiMwRTpOlDC5QQ6PYUcEjRvJgLFVcaqhZF9h4DKv6KeqShEj+bJ2nidyR
X-Received: by 2002:a05:622a:1aa0:b0:3ee:d59e:24d3 with SMTP id s32-20020a05622a1aa000b003eed59e24d3mr29745664qtc.45.1682437544534;
        Tue, 25 Apr 2023 08:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682437544; cv=none;
        d=google.com; s=arc-20160816;
        b=qUi8VihsV1biwLnAce67pFkpqaP5vbq/padxyllUBY9gBk/NLxV+/3QyhHd6L09x6C
         1cwXnhS60PSJU4VBJQCI/Si/75IjO2lipOs0Z5nsUPYli7HLOEiqz2y7qUCToD3MoIW9
         rAZw02nAmGjkY54LLoOfgFvS2cKg9cfrliowtL9Zd4zI88R4Q1w79Ke1olddW7ztr6iS
         jgpudD7XBTXBYg4sS3EP9Z64HxEd10GAW6YAPX1GjKkvkmG+VlLlb+VMzwIWDTYaqOfs
         Mc5hRUNQ7SUBJmpyfvMnQWInGR/vP4O5xUf+JHtLPimiQISMqbMVleH4l3XLm57sjNGl
         EgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4ZTpiSETY/gxfvYakifCyylKGxZlL086A5De6UCg9ew=;
        b=fDio40/0daqmLzX3qLi9uG982RrFGVhgPcF6mtcV+ai3UjQoRkx5OAfM+Uj+FEtBYr
         2+ZjCNlCJjP/6tcrhqICGObcdywtKLsWdOyqKT67u1JTh8T6GI2CmoMNHjcz+WVkAVxg
         NA0lKvZtOTJ4yw/lS0jfsNlo+H2ROcXQVFtafgynt5T57DCXiyGwsUtUHh/IsNpKrhXl
         N1sVXymAWK05T/45cqfM1CQhJ+KwZRM33uq2sY7fT9e5bBREcaXkyqBylbnODZF9dkNR
         Uvk/mjk1GccZPjmUGh62gtifixsgjq3FmDVRMk554iv2lAqUMATZLISFwWro2I13XQUM
         tdpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f685SAtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22-20020ac85b56000000b003e387a06148si8697090qtw.586.2023.04.25.08.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 08:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f685SAtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prKrE-0003fY-OI; Tue, 25 Apr 2023 11:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKr8-0003bb-IO
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:45:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKr6-0006CF-7j
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:45:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso1392702f8f.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437519; x=1685029519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ZTpiSETY/gxfvYakifCyylKGxZlL086A5De6UCg9ew=;
 b=f685SAtxwvlvSOCa1aabkWQ6djKfej/ODDUD2jU9bcIL5/FQtqXSnFjymd67llKLlb
 Y67EZGRKyRPhxbD3/YWbPOwgN1uC1lOd/NuLi0aGVugcYusxeb0bZNyZR4qBA7WdKUbo
 QyP2yRMZOOOU8jSDHc4OrR75GjGlseTDyaojsXzc3o+Xbs9xTgFH7aQydWBwSOOkJAy/
 rCOpfHW1tXtkGQEsz3dyUzNRvfaJjzWIx7fKooO6CG9Jxb/y0z+F/qcJVjjXjGogmhLk
 o8Fnc+JG5++KBv6YmsPQG9TMRfER8N77LeoefhDOEQE1lZIZF2xl2wqk6+zNFTBtsRCZ
 wyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437519; x=1685029519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ZTpiSETY/gxfvYakifCyylKGxZlL086A5De6UCg9ew=;
 b=eo2te71jaiU1Sd16OMbW/WiqPi0pPOkcMxxfDKesH8oAEJWRzGIa3T3NRUYPrumxYj
 Hgej4hxslZAr8Aj7AIBOtqClUxJL8sfnW1vPrNdnnhd3GUWbHfmO3dbRyeTRwsVmQm/9
 xL3VDiCx6mtuF0NOcublDPrriXTM86j1rC2Dxrs0mV+2+V5HKp09R8MlKAAhkIevG4Te
 IkV+YUb87yQrF8hmtI1ekc58uKMj8dez8r8yhgSrWQtcLSsUbJTFTGTu0p/IPuyE5Ngy
 xtr05PaYzblgSX/TbGpY7oV827jwIQJkmYUqMk2PEe3j+1cD38fAPlir6TDknCvlMHgJ
 cEOQ==
X-Gm-Message-State: AAQBX9dpoi6ae5mE50/n8Prk2pQ02nhbuVnsI+WjtqCvPtt35A52SGzs
 OhgYiRGpj+INssDFdxjx1p+HUQ==
X-Received: by 2002:a5d:6407:0:b0:2fe:fde1:23a2 with SMTP id
 z7-20020a5d6407000000b002fefde123a2mr13740077wru.50.1682437519419; 
 Tue, 25 Apr 2023 08:45:19 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 jb12-20020a05600c54ec00b003f17003e26esm18664538wmb.15.2023.04.25.08.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:45:19 -0700 (PDT)
Message-ID: <a1a0e5bc-bddf-51b8-9aab-2bb83a201888@linaro.org>
Date: Tue, 25 Apr 2023 16:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424165053.1428857-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
X-TUID: 5nf4fHIr7KTc

On 24/4/23 18:50, Peter Maydell wrote:
> In allwinner-sun8i-emac we just read directly from guest memory into
> a host FrameDescriptor struct and back.  This only works on
> little-endian hosts.  Reading and writing of descriptors is already
> abstracted into functions; make those functions also handle the
> byte-swapping so that TransferDescriptor structs as seen by the rest
> of the code are always in host-order, and fix two places that were
> doing ad-hoc descriptor reading without using the functions.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

