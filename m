Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4960068ejc;
        Mon, 27 Feb 2023 11:27:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9I/uww/motqOHofryoSwJ6soBjvbV2mBhOu5ow0u4xURgKKqiDWukp9HRg6lbwSXGUrEOQ
X-Received: by 2002:a05:6214:5299:b0:56e:7bc1:69f2 with SMTP id kj25-20020a056214529900b0056e7bc169f2mr1111024qvb.5.1677526047843;
        Mon, 27 Feb 2023 11:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677526047; cv=none;
        d=google.com; s=arc-20160816;
        b=rtMtQSyq+Mvjd8ul1qQ6eyz+OdvPApdnHPcWsWjNJgwF+GgNu8UyTF3H2jksY5fVo0
         s/ivMDrEy8/zTu4GkGP7brbXC/ECVwTD5EI6WI4SMkkey/C5Gpk4TrauvmHbXT+Be6XU
         V4OSSI09XL4oLyFBRXGiyGugwhrET6OXrBnqIre8kDCjCXLQ52SYfzlgg6m86TDLPfFf
         FvN712P/d5KOLjpu3i5AI6K3cetuCOL9TBvs/b2xpBI6iQm4sKBBucJpFlyQBDAZBz6h
         9BsqKOnDfhRXoD1iROKdYGGEp3Al5yGfuHlpXOd1YLO7X7lMS35Vema/STxNmk4nyl74
         ehsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kqYO+7y/VtfWRw+KQ3HbANz+57CkpBoY1Ad7grkR4Ck=;
        b=TuQzvUiau/fuXS4enwHaiknxj4gAZ6Igt2SG8Ienoi6mR1lhMuqr87+F7s7bj+3KHs
         ai+IMS3lQDtSBIEsXiX6xKh4VGQrAoaiS8z7iz6HqZOGnBZhAp2oZIb22Pvugnf1B1nb
         xzsUBGdvxp2QsJHj8V8UN2413KIQQ7NOsqTajhuxXUHW1Xqc6rflM6IZsYcO/UWQl3UF
         xG3aSEggrceR3vLg5nlpoNgqVOntyIh8x4YBVGQ4eQpA4nx64zTCAERmk4uEzpmaIdUm
         GstV3T8cciYyVb4mzIamdRm3fhnitr9Bt1p8SfnnjyjdKkSv2qEa3I+gW+SJ8p1Bt3SY
         Vjpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kuKdL5HK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020a0cf251000000b0056e98baddd8si6964752qvl.109.2023.02.27.11.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 11:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kuKdL5HK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWj9Z-0003UD-Vy; Mon, 27 Feb 2023 14:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj9Z-0003Th-5N
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 14:27:17 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj9X-0002VZ-MB
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 14:27:16 -0500
Received: by mail-pj1-x1041.google.com with SMTP id c23so7289386pjo.4
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kqYO+7y/VtfWRw+KQ3HbANz+57CkpBoY1Ad7grkR4Ck=;
 b=kuKdL5HKqoFCpU05aMO4lWPIbeLrh5la56Vbr5iA4hkcagWEfsAmG+SuX+rdAZVWu0
 EBvDLlS+2g5CQTm6QPs7y6u6nqYg5J9l/r8Cc+Dg+JRwBGf0A8XFFfRxbe79D15ECEJb
 CM7E1IxSJp1HGIoeYmPOj2SVbAsyEvK1A27hCR7AaWG1QfrhADTcK99XHTOjVjEOxt5k
 kUC75GZJlM1uqstlf95fQB8pVrS6oW4FgQtx9QNxNbxGCyiYKWysJoMoig0l8O9hShKC
 qCTQ2aycDdRT5yYnml1nDy8q0ljL5ddrspk70pkAeTebr5KlgPTiBDtMzpDW7fk/uwd/
 Vgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqYO+7y/VtfWRw+KQ3HbANz+57CkpBoY1Ad7grkR4Ck=;
 b=0lK9aWN75Fo/yMqAaK5DzQWbPmOqVUvPa2FLv2Hrom7bvzWJbPQR2pDQkLyjo+K78j
 vUv2HOWnQGHD7aZydG4xqL8vwfZ5uEZNHhXf5JTV+H685i/4GDbIkTBlWmPoQy1OjTX4
 zlDBFBeLUJLJCu9YWZj6E6E9OmjfdIOxJNSgYufk4vrl6Ywz2o3jpwizfE48JxjHNo0T
 VK4WbfRJCaoSsDeAz2BcytNn+Xi5J5IbAvC9NYU9FHnP+UmAmEpcgXARmLkgGxGnfGUs
 d1seKBHvD2Tmn5/Ujt/y+vhgr6kPBHTDqd4DR9YNI4TBTsdejJHoJxWmPa6Kb8SkJdof
 B1tA==
X-Gm-Message-State: AO0yUKX3KWVQRp1Cy6LfSpcN+2EUugG24EqAujFFo88mVSZrD2HGAigL
 CA9+x6vqWuN2Q9IWe/88vEM37w==
X-Received: by 2002:a17:902:e5c9:b0:19e:2d25:897e with SMTP id
 u9-20020a170902e5c900b0019e2d25897emr70177plf.13.1677526034243; 
 Mon, 27 Feb 2023 11:27:14 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170902d90400b00196807b5189sm4960277plz.292.2023.02.27.11.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:27:13 -0800 (PST)
Message-ID: <787401ce-475c-9fe4-8712-abf8347ef500@linaro.org>
Date: Mon, 27 Feb 2023 09:27:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 3/5] target/arm/kvm: add helper to detect EL2 when
 using KVM
Content-Language: en-US
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-4-miguel.luis@oracle.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227163718.62003-4-miguel.luis@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: r+ZZXPE0Z256

On 2/27/23 06:37, Miguel Luis wrote:
> From: Haibo Xu<haibo.xu@linaro.org>
> 
> Introduce query support for KVM_CAP_ARM_EL2.
> 
> Ref:https://lore.kernel.org/qemu-devel/65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org/
> 
> Signed-off-by: Haibo Xu<haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis<miguel.luis@oracle.com>
> ---
>   target/arm/kvm64.c   |  5 +++++
>   target/arm/kvm_arm.h | 12 ++++++++++++
>   2 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
