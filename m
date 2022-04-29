Received: by 2002:a0c:cc02:0:0:0:0:0 with SMTP id r2csp1702453qvk;
        Fri, 29 Apr 2022 11:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW/rR8wZvU9z6/xgrQ1DXA0x7ChiUHGR4ILHrkiqWo4OICZo8sWAEDmXlY7oZSspPfyhcT
X-Received: by 2002:a81:7b05:0:b0:2f4:e45a:b06e with SMTP id w5-20020a817b05000000b002f4e45ab06emr516161ywc.458.1651255616167;
        Fri, 29 Apr 2022 11:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651255616; cv=none;
        d=google.com; s=arc-20160816;
        b=RX/+rlciLXhjNUosZO95PmgojpgKTQaHtBZla3C9uAooVKwTuNvVuv1Wu3ovwK0vkr
         +P1O+0H6MONoDElYCPs5Y7qBb3sN4BqHvf8l8V5N1ZL4pHr6CBBHs9sL2w22VrXw2u86
         jZ+k8gqu2/kpz/VMFT8eAdBIEQHOA0SEc6bc69xWeUQZ5xDSsxgFIWt1GBsjKUzZlQ7O
         6XdNEzK2MpOfDoMA+v8D4KA8/Icch5xz4QLYqxXoeSEmmnS+9gOayB1kvw3uywNm0239
         PPOnT/DKGmuCQBSAKLr9tNUbFJ4L88eforQJQ1AA5zLUbFsggPcARLya3NF/4skvQ0DG
         zDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9pDj1mxizGcS/INj2rkHoqC7vf0kkvUVAue+SZF6PDU=;
        b=qxQOhHOMdNJRHtlMUfc9X7nv8H7PwJv4kclMGeMZvRxAHj6RzHsRRgExy5kbYLDQKx
         FAQPmRa7bgYzNKrF/a8FOdGMUzcQFss7sFAQWwXRMdw/woFWE7UEIZouVDHx1qY2KK8f
         Imj+RzoruHnRI6OzDs8jmwGIFoI6tW6PPVdJhBACBB1+HO6W7Mzs2IOJ7cRs3wDHnlo1
         i6dU636XLmQd731KovtAspivDZrx7PiidgEK0XH/d/z8htqcXuAeDKgqg8hdHBjTlMZi
         A9Cm5iqNnT5//dAvvQ5ldj6jSWqazV3CpT6BZj2RVZTgxy+HL++Iq2sb55LK5/PxtOOY
         DZ8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cai5VKQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020a811e12000000b002f4d6c28c0dsi6528496ywe.126.2022.04.29.11.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Apr 2022 11:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cai5VKQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nkV15-0007YR-Kt
	for alex.bennee@linaro.org; Fri, 29 Apr 2022 14:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkV0e-0007Xd-Vj
 for qemu-arm@nongnu.org; Fri, 29 Apr 2022 14:06:29 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkV0d-0006L2-BU
 for qemu-arm@nongnu.org; Fri, 29 Apr 2022 14:06:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x52so5994677pfu.11
 for <qemu-arm@nongnu.org>; Fri, 29 Apr 2022 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9pDj1mxizGcS/INj2rkHoqC7vf0kkvUVAue+SZF6PDU=;
 b=cai5VKQSdT46aRWoNJU2wzgqkHPfdX0RojAp/+cki877eiKR0bPEWz7ZxdwczGq9QO
 EM7EwpBpGPqzsB8DWqIwLzrAn3QP5CXlLCETy1/83BVfbjOQhT5FHqZb8RmCsc5hNZN1
 /Z2Wf90kiXru5dix5vr+YXzCpnuzMjfzD129h8xsjoPAK7NYIBpxryv94n6v2DU5H7Nt
 FT7xErob4h0EMtBC9BwnXgyqD/JOxJ0jG+rB0MosEWj0DWD4lI1JqQNhyG8OeMMBhD3i
 yPmJp1upd1Jj72PcMrt9NSh1m4ZoKIbhWWv8i1iekM/JPfR1JPXCxeJMqeYfRPKythRL
 wROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9pDj1mxizGcS/INj2rkHoqC7vf0kkvUVAue+SZF6PDU=;
 b=ui0X5e7K78UtDlEJ1WC+bTgnSqE1b8nRvuQhqDuALINb85Z7PYx9q/2LRZZ01KwYxq
 HpMQKt/IMEqbKiueJk4xmSa/9jjI2xrf3zNLndUW/2L4cxlVf5vMiXImW+aSjyhxWq7l
 ISbduzmLUCWpIipXx2DEHsHBS0kRolo5LuOkegi7w12H+R/4ARue15w+s4PVc3cIjzyA
 mhffODhhZ4eBy97/a69IE37NnmWlnEu3krK0oMKmxh/MCGIXW2jYGOp7Y8dHEnzyY/k8
 +orT0oS/wL1ZQCFrGCzH3MYuA7C/sqnLEfCmZgF63S9MT93awFaZ2U5OGi0hFPJleyAT
 KMFA==
X-Gm-Message-State: AOAM530wMgLHImhstH3rNGKZt9WKbK03NDrcG14koX9FOzTrLlG7XAV4
 biCTIM8L3nxnhXE8GJddsONPoZZFbrMNUA==
X-Received: by 2002:a63:3f4e:0:b0:3aa:193b:8c5d with SMTP id
 m75-20020a633f4e000000b003aa193b8c5dmr469811pga.624.1651255585400; 
 Fri, 29 Apr 2022 11:06:25 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a17090a1d0500b001cd4989ff69sm10709924pjd.48.2022.04.29.11.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 11:06:24 -0700 (PDT)
Message-ID: <9a9e8adc-32b3-dc39-6cac-d37a2e5a8a7f@linaro.org>
Date: Fri, 29 Apr 2022 11:06:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 56/60] target/arm: Enable FEAT_CSV2_2 for -cpu max
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-57-richard.henderson@linaro.org>
 <9c515174-a203-ecbd-1fd3-c8aa1913be4c@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9c515174-a203-ecbd-1fd3-c8aa1913be4c@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1u1o42MKJ2DX

On 4/29/22 02:52, Damien Hedde wrote:
> The following checks are missing:
>     + for HFG[W/R]TR_EL2.SCXTNUM_EL0/1

We do not yet support FEAT_FGT.

>     + HCR_EL2.<NV2,NV1,NV> when accessing SCXTNUM_EL1, but maybe these are always 
> guaranteed to fail because we don't support the features ?
>     + HCR_EL2.NV when accessing SCXTNUM_EL2

We do not yet support FEAT_NV or FEAT_NV2.

>> +            if (arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
> This case is also present when accessing SCXTNUM_EL0 from el1 (but without "(hcr & 
> (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)" precondition)

Quite right.  Will fix.


r~
