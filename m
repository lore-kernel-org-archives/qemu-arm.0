Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp509619ejb;
        Thu, 1 Jun 2023 08:01:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CEGoud4gyuyk3RVERIjQfkHyGm9gEmYP2+9qig0Gdzaxqf0Ys6hR3XPFEEfk5E0CNPr9U
X-Received: by 2002:a05:620a:2cc9:b0:75b:2572:7aa with SMTP id tc9-20020a05620a2cc900b0075b257207aamr7655263qkn.40.1685631689982;
        Thu, 01 Jun 2023 08:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685631689; cv=none;
        d=google.com; s=arc-20160816;
        b=PogpLDX2fNFFmt+sUD8yN6L+MYmcpCVtBgTMAVig9wFy8BWPZ0n+zJ3ZV8E8vcLe+7
         8Cc6SE+tMADX+E4sC7SXQ3dNJleLFKR1HeHxr68sySKbMNDfRzYDtijh66KjD/oNpIsd
         H47cDdZAahv8fuBSSMcMnEQV1Fa2SMA2WG978HO/b98J5OixQODnl63hF5ojFIHXgd6o
         zvuTSstQRksZfVolEOwoSWMo6IHSNnjLNs2lvg0Oe98oJJneeXq/W4qAj06+H8HqSgdZ
         g5Y4f/a6pczK+68m105c6aqAKNio3S/XQeKVxDwFRgq0Gv5dj/NHz9bZ+O6Z+CMufKy6
         EkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+8rwAKfFTzaxsQnHIy4Xv+vjlBMMTYcf/gqqPYZmY4o=;
        b=v1gD7hYKXt53vy5q/wuA57tZ38/pRtv9zcTuYWBpzl9tWcxpaZkzFiGTgh90AkN+Mg
         KF5CwUq6wbSZznM6Y9iI8S9Uon7eohl0+TqeeeZf7BLwvdlXVdSY0Pu4Qps4H1loY7fq
         cG9CBCBry7iS5THYuRe4T7VdtBIXpwiHwwR/IPSgxUNG+2/qYuAa+MQIYMEN7N2QXTGg
         I1FvWs3BblMTFYqySyhp3WugQXOKbyx2eN41JSdHqyzrNVHJC6hhtNAwNaACRkrD+r3u
         0e4436xjsl1smeNM9yW1Okma5SSJOcbY1TOtev0JJ3jQdms2IoJA9qEX4b2BmUNxb7OZ
         hiQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jxNfv/5w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020a37c20c000000b0075cf704ed97si5034654qkm.619.2023.06.01.08.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 08:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jxNfv/5w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4jn6-0004FJ-L9; Thu, 01 Jun 2023 11:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4jmn-00047C-9g
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 11:00:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4jmk-0006cH-Dv
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 11:00:21 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64fd7723836so619743b3a.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jun 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685631616; x=1688223616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8rwAKfFTzaxsQnHIy4Xv+vjlBMMTYcf/gqqPYZmY4o=;
 b=jxNfv/5w9pF7kPvkuyV5NKv0mPhkn1KcuAtavuj0V3QACnFbL2kdTnqbs5ZOo70BqU
 zNFslfsH+5Dlty3Evon19OOSgOnF/4nP2jzFaS/HSZamZWhSaroN1aAGX+TOlmltCVRA
 +iw04ZdZgy79Yp3rWLpgj6/8AI1LVIleZnErJ+qn4T5pM5vV2+rdqaJFf/vqMP0lw1my
 qwq5+70KfHoYZZ0WG0c3Lz1l1Z387j6NgNJ+3oG/Ee+kHGhprl4OoJlnhMECxAIPGwqS
 wILxGy1IaUOrS+1/CnA3xIufaIWUZrM+zKsbiTtZ9KJ0/+7rmIpB4alg9RbmGUdmI2rf
 Op2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685631616; x=1688223616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8rwAKfFTzaxsQnHIy4Xv+vjlBMMTYcf/gqqPYZmY4o=;
 b=JZtEn03bRMky/qBryY5KdFk/vAbwiOrzEZMjDhVa0QXm0Nd7h1OpLDAwAg6mQhSCYk
 4/lkuwBpah46o7YzjmjE5/pVtjazA6GZ8hpW1TiWr7yfZioZIlodCTTmw1mz6j9vrjCA
 Boa44O1Sp5Uaw1kcm/jzGeVXjTETRqbbS73mAdPaCXPpy3ukA9+4Gx+66r+PSPZV0W3I
 hnRKtxOnBJcJhPB95rcQN4tYfR5La6Jk6Q98KhPR3Y08vlAOhi/hSz8tXneOzLDX9Xf/
 0ye9FFBe6aDh306vHPBGyid3LT+oVJnYR30qd6DgmQYxbVVpmf8MWwag4s9o663D7UnX
 qb1g==
X-Gm-Message-State: AC+VfDyoNof4+mq0rX6n7ETtvtKdx0orIEC7+LIiQLtZPAHsxjWIDGnF
 bX7T5ywU1YBk0DgDMGxa/iHK3A==
X-Received: by 2002:a05:6a00:c82:b0:64d:22db:1023 with SMTP id
 a2-20020a056a000c8200b0064d22db1023mr8813391pfv.22.1685631615716; 
 Thu, 01 Jun 2023 08:00:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c935:f07f:4b59:7091?
 ([2602:ae:1598:4c01:c935:f07f:4b59:7091])
 by smtp.gmail.com with ESMTPSA id
 j10-20020aa78d0a000000b0063b6cccd5dfsm4034446pfe.195.2023.06.01.08.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 08:00:15 -0700 (PDT)
Message-ID: <f2596b97-01e1-0ea4-c82e-1d53e5172dc1@linaro.org>
Date: Thu, 1 Jun 2023 08:00:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] bulk: Remove pointless QOM casts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
References: <20230601093452.38972-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230601093452.38972-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B3XaaCiRXZKU

On 6/1/23 02:34, Philippe Mathieu-Daudé wrote:
> As per Markus suggestion in [*], use Coccinelle to remove
> pointless QOM cast macro uses. Since we have more than 1000
> QOM types, add a script to generate the semantic patch.
> 
> [*]https://lore.kernel.org/qemu-devel/87mt1jafjt.fsf@pond.sub.org/
> 
> Philippe Mathieu-Daudé (2):
>    scripts: Add qom-cast-macro-clean-cocci-gen.py
>    bulk: Remove pointless QOM casts

Cool!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
