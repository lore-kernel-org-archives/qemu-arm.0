Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1526910ejc;
        Fri, 11 Aug 2023 10:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhtJ5F5sJMwPqj1oizJnheTefghjUiA9Y0V8n4iMBVclrSggSCxNy1aIW53Ao/3QzZHksZ
X-Received: by 2002:ac8:580a:0:b0:3ff:2923:48a with SMTP id g10-20020ac8580a000000b003ff2923048amr3295655qtg.3.1691775048387;
        Fri, 11 Aug 2023 10:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691775048; cv=none;
        d=google.com; s=arc-20160816;
        b=uNxVHPvNEfcnrx3UHYc8PqzP7W81crV5eUpS3dKevo3M8uNbzrZN49AwG2dC+ma9lz
         2dCLeeZe7kvu37vxkhCna3W0vbzRgeF+tgCfrWCwHxGEFfEVyhL2Ce2SO35CxWT1a6XL
         3/chcmjnr0DCeOu/g7BHpDJ8eX4L7b8CV6Spry85FIFJ/h21fuxm/rpcqDZTaYmEzy6d
         rbkuAsR1brKLhWuMmPQXcYN+EemssF0s21Vc0jfI6eRMbEyR706VBCI7hSc/awZl5AXL
         f5iPXUekIjKJDYWtzdx/TCehtd4Kak80Ndic8beACY6pqZ0wLkwJ/4LMH+Y4WTAhZXlg
         JGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nLc7FbLhOnq2DIpEXkd5oX3SDFqmQkc87Ir3u2nOo0Q=;
        fh=/5hvLOtwf3ttgpRABJl/whYaKrYuVuKqgBf3BPtM9uQ=;
        b=k+AYftNwi1ztTSnA28X6/5Vd1oaLPcVQTqp5duxLJ1T7EWwHaSMcnzp7uDUTZU1DN2
         xvBSr2370Kx1XdZw3E7CGJuWnH7mrzQIBaxBz24plABrELo5draTJVJqEfFTEdsiPcq2
         //52KWbvtxtoHjkVD1J2zeTV7cFeL6OLiLKJfpiB0J5Wn1Jpg5+MV8e4MmyxjMnXs1lf
         doQAXVpVXaB1SF1OvCWX6XB20+mBTteNESQOV8mVNvg3psNhNyf48YPBtBVXnRKMzf/Q
         gmlt57CIhr9KbR9GuhIKeQqN4Nv3km4/IXo5FDwIRezJDKr6iCPhsFga0LxBayPsa3yw
         b/mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGNLs0D+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a05622a01c200b0040c34202141si2506153qtw.504.2023.08.11.10.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 10:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGNLs0D+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUVy2-00086V-FN; Fri, 11 Aug 2023 13:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qUVxz-00085i-CP
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 13:30:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qUVxq-0001Od-Ns
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 13:30:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so1962124f8f.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 10:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691775017; x=1692379817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nLc7FbLhOnq2DIpEXkd5oX3SDFqmQkc87Ir3u2nOo0Q=;
 b=eGNLs0D+gSKeANK+bRRqlH2twcyDQ+2ATenZIoBU/O7lBwGHgM8RK/PQSfn8gGG4WO
 CoDVaBqltMRgJHS4JR1nhcu2MixoUoEfdEP0BIfiLYTA/QKdv3kjeQ9ebNvyouLub8WF
 uGovQRWyNRp9kq0CG9eNDkvsc92/kEolpFAEpc4RdK8Fl5hGkphkuQOR0swKmhVAO9+S
 Jyww4AJLBQGRl9L83s7Uw/5cZsr8Hk/KHcjtbuABtwWG2cLR8RxVjFm3pBkj2sn0c0vG
 AxHGU66PUvcq6jJerp6vD2CqpYQWyHn4v0p08bOGd3U4KkqjDwjjzf6f8Yf8jcf2ngvS
 1Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691775017; x=1692379817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLc7FbLhOnq2DIpEXkd5oX3SDFqmQkc87Ir3u2nOo0Q=;
 b=HGt9wzcNvq/clV4qSNH0KSrnP6bwXwaQby/Ih+RU6KPaLrCKo+mxuWpOoYs1xLgMbG
 cMsZanlqVvURErDz9Jlv7HntsOoqOC4GmzHyB/7Q1UWRi4mtYAbcqOYC58x3Uj5iYph+
 xlWXmTBQz1qskcQo+qJ0z5uXAvYCTWt/ihqB2ucqdMD0FDKFUxWBilGrRW9BjcfET+Vv
 /Mr8iFgAhWbTuruHhMpqrKSrHPjTQevXWrG4kj2Y6mDY/vj+wX4629PZd/la9BxDfL76
 UljtTa7oE8V0HsvhdIOsGTxYw6ICJmxToLl/bV/C0jRPbeWkXIhyTPqqMQEiCeC+Y9AS
 OdCg==
X-Gm-Message-State: AOJu0Yw1NnR8c5a+F6fOtF5wDhglbqqdG3pHzS4LrRwsGc+vwSmRQfId
 tu2ekEfLT3skF8UugAfuE5Rc6Q==
X-Received: by 2002:a05:6000:137c:b0:317:5c82:10c2 with SMTP id
 q28-20020a056000137c00b003175c8210c2mr2086439wrz.59.1691775016767; 
 Fri, 11 Aug 2023 10:30:16 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.219.164])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5089000000b0031434c08bb7sm6069567wrt.105.2023.08.11.10.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 10:30:16 -0700 (PDT)
Message-ID: <410cf104-74a8-08d1-2907-7c015a156327@linaro.org>
Date: Fri, 11 Aug 2023 19:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PULL 1/2] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Chien <jason.chien@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jason Wang <jasowang@redhat.com>, Chien@redhat.com, &lt@redhat.com,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <cover.1691770630.git.mst@redhat.com>
 <3d449bc6030904ead784a4e4644c9640c2152796.1691770630.git.mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3d449bc6030904ead784a4e4644c9640c2152796.1691770630.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +v6RRuqVb8Cd

On 11/8/23 18:18, Michael S. Tsirkin wrote:
> From: Jason Chien <jason.chien@sifive.com>
> 
> In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> the root PCIe bus. Thus, the extended configuration space is not accessible
> on "dw-pcie". The issue can be resolved by adding the
> PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> Message-Id: <20230809102257.25121-1-jason.chien@sifive.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Jason Chien &lt;<a href="mailto:jason.chien@sifive.com" target="_blank">jason.chien@sifive.com</a>&gt;<br>

<8^)

> ---
>   hw/pci-host/designware.c | 1 +
>   1 file changed, 1 insertion(+)


