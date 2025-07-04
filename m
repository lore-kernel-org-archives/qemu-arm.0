Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1297305dyc;
        Fri, 4 Jul 2025 08:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcl1FVYkQP7QyYpD4bAdg1C9eEKIEyAdX7vJkmB01xu9GgtuDCt8kwyHx0AMcgHjUMyRxeK98PEDHO+w==@linaro.org
X-Google-Smtp-Source: AGHT+IGwy/A1bjJlg6JMkdotOycKT7HmsVC4z7DzV9WgXNARsOAKsoA1BLe/1H9AW6lK9HLAu5hh
X-Received: by 2002:ad4:5748:0:b0:6fa:fddf:7343 with SMTP id 6a1803df08f44-702c6d79d93mr43377096d6.23.1751643567487;
        Fri, 04 Jul 2025 08:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751643567; cv=none;
        d=google.com; s=arc-20240605;
        b=HXqSYAa2jG8NILEwdXsN8Ye/XM2ElqDK1CIEWAfL+z8lnWg641Q3sbOlCpeBQhecUN
         ngH0fV2PFIBBGUBYmRM4ponprkzmVmrrDsoWgAM6qAQMNfyoUXlzKRw8LveeCIEmZIOv
         s3yhnEHNSVDeAa58P5U7IseHpfN+wEynysHxUu2ozk848vLDPDg0CoxuisveuORQFjSM
         5zXBxocAWLUlmAU1lqVB8ce+W4mxAJfjvlwS8j8Jj1sYtF11nxAD4vgzD2OwSURwasGi
         371nfLzJ0ZpfctH4YrhjVsQk2ZjeooXRXRR8orZR1bfaQE7rXLY23NBJ0P7j3+oUDKU6
         LfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NHIDvLFsE01jmoXKQows53ZFy1xLZz1kAcDhK5XFIDs=;
        fh=zLvtcTKKIz5DGo6KzpTAPe4x+7LNCm1NxnrtbIaMFgo=;
        b=A+tmahYXOhD0a06+ZipHTSXgVsOLYx+riSEEtjEyEW2LyrVMv/YoR9YdKKa0OL+Vj5
         3CJz3tWmSZKGh2GeXbSAjS1V02jnuqwVTBBVX9wOFkdSS5G63ms9wAS5ECSf4+bEs8uS
         xoV5PxdNouADKFUOAOX9J+T6LE+lgTMTNQl1MFOey98ZI+6IUZTiFweG9kBp4mH+KtU6
         wuxqjozGd/8Lqas80HWafnuNIvW7Z3ncdL9I/vhxb3Cz6qCul2QvsgmvS7gCtvEgWytZ
         yDLyIU/obkgCe7GWmuxnzt3Rl5jEiwxqfVzOpwyIR4MmqpR1mHIb1Q83rvVFc6T7VMvP
         2juQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/Sc0JwI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbed6a6asi231591985a.435.2025.07.04.08.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 08:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/Sc0JwI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXiVK-0004y7-Fe; Fri, 04 Jul 2025 11:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiVG-0004wm-83
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:39:06 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiVE-0007OP-PN
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:39:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so899888f8f.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751643543; x=1752248343; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHIDvLFsE01jmoXKQows53ZFy1xLZz1kAcDhK5XFIDs=;
 b=R/Sc0JwI/TMEWLri888pDjcfELBg4rHFzydkv/6ht7gpzQi4aHWOUrMSlNC4Rx+qXN
 54aDWaOvhe5GR0BmIj9t4f3Y8vVpoZu/R+5Zbc7Y7m8KIM5xqWlgaENwreGia7ZEr039
 cAbWho+XOaDtOdaS8FhMFvCRV9BrnkVBblBWv7Z+N1QZv5BbXTNMyes+zm8xhi9LLAbR
 3WRC3I5gX0uGcJi5oKz+XBDVeUKQX5VSGkLV5XKE67+nLDwAhpT4eMbbAdbtFLH2GbPC
 DisydWGZaiNQ55xBYH1B5svLu+IKHJOrp2HGh1rYAC/InnHwdEj5WwzRU/YMLgZFlj1Y
 CftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751643543; x=1752248343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHIDvLFsE01jmoXKQows53ZFy1xLZz1kAcDhK5XFIDs=;
 b=IJGlyzNEN8jVxuhx/63kgETZWD0rIzPb8ILTzM55jZGJPEpY88/YrY4sgZ30A+BpRX
 3G7dHWsDOZ2VCTht4gB/LEU+804QjWTIIRGQeStuEMQwCinc6g2NT4LqSFVRqxlxIPma
 dz2z7T89uO8+ZMT5KhaoThkO4lh9/kbVB6xq/qcrALJ9tzN44NTW0nbd1jN4xICCBW2j
 ZCJzrgYGQNWZ2UyHHjQhsTJe42BPl7k1vQ27seSaKjBMD+r8qAduKLVY+HEOY2Q9uvMw
 7HOYJNYrGojbS+Cd73j+BpXRMkft6LFm0w5Ye7ho1F//TxDI37YX7VpbSnQ9zJ8PZVi0
 UJ5g==
X-Gm-Message-State: AOJu0Yw7Bnzf3gEdkjk3/THv+slMFB5rFv1bn6L3Q7VXu44MwK/fX7SK
 EJ+2MFVPYo97iSLeMBLAx7z9g9CGiaYE9brclMrivPacD17GPZZ5uFfXOBfUijqUMyg=
X-Gm-Gg: ASbGnct3pH1a11ObbS4E7iKOF7t20d8xv0ctQBD3kDAE0RcMQiGQZKQkNUPew9nR+J1
 KaP8RSh/ddV7py+kiDD73kqyyAqsrlk5XaIiCqzJQ61089CbL7521ClMx9TGKJklUgYu0nV5LeX
 RD/dbDLq5eCU4pwQlLu0eok13OmVfihvAd8QKWq11ifO2jcp4TnYG+2BosZGp5eLrCO/mnss60R
 x1iXFu4gf61fDy8SiCsfLDvTkB9Hmb4B3sjCfrl3VIORYLSc9jQyhYNf5W6u2eh0ZkpvtXsj84g
 oofhRebHh5uQgyTwpJCACihoFHoz00TSU9Gpyx1m6gA3+hc+XNx2bnR+ppxznyp0ND2uLNIG96X
 ecRB26+UrJ1MdMzIq4sMaWNAPPBBgulfZ4v0=
X-Received: by 2002:a05:6000:653:b0:3b4:9721:2b2b with SMTP id
 ffacd0b85a97d-3b497212ca8mr2781419f8f.12.1751643542964; 
 Fri, 04 Jul 2025 08:39:02 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030ba29sm2736541f8f.2.2025.07.04.08.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:39:02 -0700 (PDT)
Message-ID: <4b6ab777-9c25-4ad4-95c8-ea31c4c8ddec@linaro.org>
Date: Fri, 4 Jul 2025 17:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm/cpu: fix trailing ',' for SET_IDREG
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
 <20250704141927.38963-4-cohuck@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250704141927.38963-4-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: 9xPN8yIZHsB8

On 4/7/25 16:19, Cornelia Huck wrote:
> While a trailing comma is not broken for SET_IDREG invocations, it
> does look odd; use a semicolon instead.
> 
> Fixes: f1fd81291c91 ("arm/cpu: Store aa64mmfr0-3 into the idregs array")
> Fixes: def3f1c1026a ("arm/cpu: Store aa64dfr0/1 into the idregs array")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/tcg/cpu64.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

