Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp204925nji;
        Thu, 11 Jul 2024 07:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI2/rzxOAqM67Z8+xKTDQt+vM3PKvk2xRW/jcvH3BtVXogtLz7DjJYkVUlCGhSLoVFxhWIDY73FcHOgZBuqRz/2jhIsGW1
X-Google-Smtp-Source: AGHT+IE9UX+NVbXOVMEQJcHA6RoglOpkTR5X4KC+dYPUuZ99E5pa7RkF5GF0onWsNlV0VR75YDRB
X-Received: by 2002:a37:e102:0:b0:79b:ea85:9f9f with SMTP id af79cd13be357-79f199e5a0bmr903789785a.2.1720706938716;
        Thu, 11 Jul 2024 07:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720706938; cv=none;
        d=google.com; s=arc-20160816;
        b=lzni8cKLZMftidOfeBmM3VHLfYvZw9NcyUo9hlBRoJT3HWqRUQ7GAmCqsKjfyismu/
         EI1/3bleCTtb87kfdNhneo1yJSlUi0HbXv/iMNiqp1OEPWjHTOJl7I0dCFTgjRWOSHQK
         Tyys24z5ugPBXnD9RnYExI4E+uIS2qpBh4C43I5/sjQ3ijJrj9XMD1Oxc7yiSD9YPdpj
         NIT1zwDOlONZaW0k4ZFh3W63/pALDUEma1foPGasyVodx363d3yimjYcAtahct/eqv7X
         ptwSzwCbOPuWcyzx8DnxGZRHQB/rW3TeXEn5wv8kvRPSZ2TlDjZxQycHLtTwlc0S0ZyF
         zk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e8bJ7MWKgdknqEJSg3JeWmibKxAGZJdlzW4ynd493gw=;
        fh=k3BUqoAmBGJeW09TSsUTxMpDF8WeWRVpy4zCJdF191M=;
        b=PqPxFidJkkhhLH4r6DdQEyk9MF2eOLJjpQYtYy4MMXdGzbB0UzM19O3cqdYvEVBLjc
         hDkhI/0mlWdFGwBayrKQ8VZ6xrW+2V3xYQPUSpQHoVwvPjVOrYVL7FtdmhUG2+npce0z
         AS1NyrckhP+dnBkQCrxLQqNH+5xn5Z2qE40cAjf3vXjgfUoH8noO/3Yyeuvhy9ZIT46u
         8wVk8/hKgzTCIasyo+oG4YN980AGPDcCk2uO8fRS0TMXgNO2KHFYv6nb4lpWCDnIlhjN
         CPELPFgmzRMSxP5hWFAZVqJXCAx7bYz6zxccrQW5BKhMtnXR/WzdrhyJU0evlalE7XwA
         9Bng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tFgF58Tw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f19028195si718701585a.160.2024.07.11.07.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 07:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tFgF58Tw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRuTX-0003dq-HG; Thu, 11 Jul 2024 10:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRuTV-0003cX-Ux
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 10:08:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRuTS-0001RA-Lf
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 10:08:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4267300145eso7101145e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720706920; x=1721311720; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e8bJ7MWKgdknqEJSg3JeWmibKxAGZJdlzW4ynd493gw=;
 b=tFgF58TwnEoN9S1jPo5Kl3YKwEL7YFyWUinFpTOv2j1rPkCZPHIonbohrZ0vUmZ868
 VMlcMZkcTgYL2ha1nqWmCMHw6kKc8R8nd7EfT0UHMBaf1d/xrsajBOgqR8JgmMRPS7by
 SCZ4vdyytYkJ0ymoBJUIP+k0DVV0C9p0tw+2iY9B3C2QHFsyhwfhpftXc+nG22k6hmXs
 K/cQhnQA8PEkK8sR/JEVp89t4hHYBSOVEAms7HXdsqCVh/lp1/RTj7UBFlCnJ+wzvG3q
 8f7XN4+2uH4pOIyfJldbpHxq6Vm8mKqx+E55yYnYV/oB9c3IQ+pGIBGlBMQzNd4k/XZl
 2cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720706920; x=1721311720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e8bJ7MWKgdknqEJSg3JeWmibKxAGZJdlzW4ynd493gw=;
 b=Ps8sf97NLUgV8BOyk7ZtIMOceOWIGb5V2F5bvGEDg5lqpoy1XJ9iOZZZNWWW4h9tc6
 QZgIfcOJD+plwtJfdgJPiayWehmzBFB/s5539hu0eLB7qF+ZEeLTnRr38FCCvo9vzqfx
 glMUyqKREPe/q33yEwKiYnEmFf5k8Lz0y+8bQ3dHH9c4MkK/43ql89y3Wx9EKPqYvbnx
 X26Eu6cD32T/r9UC01QyAuU6GY/h/6xlXGXCoCk1D2axSviaGsOyJ8v0vW+wL2kjvI4w
 Rtg/lzRK1xRnNjWsHYhXYovsXPDGagZFjF5LaQiY/0hCBsHzmJTdG9xJs+9uFAdF2yIR
 wqDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUab3+QS7Hz1nksh9GZht81gvj1mKiwhSpsFzCgxGIBOx6MpcdvZzwWntvfrnPHdw6CjFjlj+02SXm4BjpnQGKwPXr6
X-Gm-Message-State: AOJu0YzFljuobcoNijd+1BjKJ+jIxqbzIVYiqsFX05c1Rbhw5bPCmupU
 p6kaNZwl1DVdbxWjGpw0iD+n0B7SqfZMQvooOXGU1JBoQpnaPs8914Z7radceo4=
X-Received: by 2002:a05:600c:2152:b0:426:6f0f:2b21 with SMTP id
 5b1f17b1804b1-426707f892emr69040725e9.31.1720706920067; 
 Thu, 11 Jul 2024 07:08:40 -0700 (PDT)
Received: from [192.168.123.175] (212.red-88-29-184.dynamicip.rima-tde.net.
 [88.29.184.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279731a60dsm45896105e9.40.2024.07.11.07.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 07:08:39 -0700 (PDT)
Message-ID: <4252f0b9-8e5c-4f85-bb87-c8824e426037@linaro.org>
Date: Thu, 11 Jul 2024 16:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v48 00/12] hw/sd/sdcard: Add eMMC support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
References: <20240710141408.69275-1-philmd@linaro.org>
 <53939fdf-4361-47b1-a6a5-edd52ebf2100@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <53939fdf-4361-47b1-a6a5-edd52ebf2100@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MCkJA+KL873O

On 11/7/24 13:03, Cédric Le Goater wrote:
> Hello,
> 
> On 7/10/24 4:13 PM, Philippe Mathieu-Daudé wrote:
>> Tag to test Aspeed tree:
>>    https://gitlab.com/philmd/qemu/-/tags/aspeed_emmc-v8
> 
> I gave this branch a try and the rainier machine boots correctly with
> a baked emmc image :
> 
>    Tested-by: Cédric Le Goater <clg@redhat.com>
> 
> However, I am seeing a *lot* of printf messages :
> 
>    sd_blk_read: read error on host side
>    sd_blk_write: write error on host side

Ah, I noticed that too but thought it was trace events, not
fprintf.

> which were introduced by the initial implementation a1bb27b1e98a. This
> doesn't occur with my tree though.

I'll have a look (my first thought was latent issue exposed).

Thanks!

Phil.

