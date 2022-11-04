Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1018640ejx;
        Fri, 4 Nov 2022 15:11:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6a08v5rqm7r3J96dNfVrdsB0Fq3JGuD6rhn1n/qGnfZaru95/85Y7uAbFJDDZfP1CffDuQ
X-Received: by 2002:a05:6214:3017:b0:4b4:61c2:497f with SMTP id ke23-20020a056214301700b004b461c2497fmr373320qvb.126.1667599913793;
        Fri, 04 Nov 2022 15:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667599913; cv=none;
        d=google.com; s=arc-20160816;
        b=CWvhzb4p86CZs1OA67KPtsx6XDIN7iP/Vf+/camDagAPQDYZvWRgsz73G9JBqNzkx4
         cm4216eMO54iUl+5MYNhm553V39pAJCIfcI6bg9A7QWpJ2+8FqKv6yrnCDyizLyiKMv1
         C7z2Q7eRkfPaT+vJug9XT4NiNPNoEC5JKOKCn83aFhhjs9U3q2b7ojfJ33wx6xvtP7Uk
         jfbVHJWHaxQEblc1nHRsRQ+TeDUuwJ5/3BqtTtH6DXM8Ma7spyh63orqSsCaKXARZcYs
         UkYKSlgx+KfNl3HXR2FgpXp/RDBmHcAAaGidDyQzQ4m9u+Wk3TCN02g0aA+q9n8uiw6A
         GcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y7QVdHhGWMg06XVCBwuPr4aU6JANhS+CWd+TwQLCYYM=;
        b=TO0COrm7f1Ka254VgZgYPeSwgdcU0XRYdoecAXrRfTlh19Pp/k5Zw0FhXNnckCi/jH
         G8GuPgXlYJtuOKCJDK1jrT9vblIFGHb9z1q6VmZn8m7kN+CPvePEaYZJoQltQywx07a3
         FJXxg+0AFJ9PLBAPqWJICebLJ17yRdrPYDn/MqsTvRydb2KlTiohvxLM3ePnqgQU1kj+
         2JyRf+hSIdpkKWRwTpq1Q/DNExp4rpqU89mfjT3IHh/ObSiJBPXfG6Bjw6ER4/8U+S8O
         ytua4FCwdQKQXFf+8ZXe6xHf53bxRV1DsH6K8l5ntnBJhbkqtiFCXzLL97ChAs8G97P6
         NRtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/Fj3DhL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a056214029100b004bbeefb2a0bsi129611qvv.186.2022.11.04.15.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Nov 2022 15:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/Fj3DhL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1or4uG-0006T7-DY; Fri, 04 Nov 2022 18:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4pQ-0002pi-V5
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 18:06:21 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4pP-0006R4-92
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 18:06:20 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so6997741fac.6
 for <qemu-arm@nongnu.org>; Fri, 04 Nov 2022 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7QVdHhGWMg06XVCBwuPr4aU6JANhS+CWd+TwQLCYYM=;
 b=r/Fj3DhLMdaD7yvXjQDIjoqxe46/gcZNj3bqpV25yoj3WDRkaCusDEkRja8rI66gpD
 svubwLrLDo+ZC2fWhyIRg4fZOOs+T1E0FPFTxIWdW8uIrLJhZVCPMpLxGH+SuGq6muSh
 UjLiSGodzs8hgEhYW0srqzwsjoY87QzgFNkxxZaWBn5AG9MQXVQkDeO3+SgnZA900nO1
 /MJoeBSMxvQx/87y2fXOjpFfY2feQ0jvizcdvob95sOfdZKCClCpkpnRnYyfE+uw7+nv
 15kIUcAQC7bsCuJZBAWrBFweZh4OVnOMazBcxjah6Hc07sqCPYrpS3+2LcCnYi2Rim/q
 8YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7QVdHhGWMg06XVCBwuPr4aU6JANhS+CWd+TwQLCYYM=;
 b=crlDv8fbyzZDhEYT6NPBtkLr7OCD7kw8Ef7erbf8AypXJz2ydmp6Q/+TR1HrPwGSTg
 0RVGLQAmruCWekme9M2jB+En13ytq3s1m8gSXHkLBNER0WckRvtW8OFAXZL5gxzhlpSh
 g45WWWt3XIA24Y+nxOUlc0Tb4qZguW1VgA+MPx3wAnG1lyFiTyqEDct7EpnRNT7P6Nh5
 Pe/qhcecWGrmXh1n2TVY/80SjnDl2NS/Ase5iUwtc2Ug6GOIfA/Pwz7Mvd7f7ULILwG2
 2eO1bd1yYIuROmc+QWS5ymN9Qn8VkOBv33tEV1c9o8pA44GCppb68wMRljphruJz+Dsm
 R7Gg==
X-Gm-Message-State: ACrzQf3ER/jq9tcElB6WbeMc34s7USeudGKCuzF6OUon2RIxX5kUGYrc
 ufqEioLbUrszHtp/8dxpdPR3NA==
X-Received: by 2002:a05:6870:c34e:b0:13c:19bc:6e41 with SMTP id
 e14-20020a056870c34e00b0013c19bc6e41mr33069676oak.115.1667599576945; 
 Fri, 04 Nov 2022 15:06:16 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a4aab05000000b0049ded99501bsm118791oon.40.2022.11.04.15.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:06:16 -0700 (PDT)
Message-ID: <4075c55b-3b1b-9fb6-c4fb-000c2d0a4591@linaro.org>
Date: Sat, 5 Nov 2022 09:06:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
 <2d9a7f5e-0ec0-89da-53f0-b5624f540ae8@linaro.org>
 <CAFEAcA-XqHm+bFk4QSzG=QJCwUncGmD43qxK0FBSXZbVaPY4pQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-XqHm+bFk4QSzG=QJCwUncGmD43qxK0FBSXZbVaPY4pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bBsasM2oK2V7

On 11/4/22 21:58, Peter Maydell wrote:
> OK. Do we ever do anything with the attrs for a phys tlb lookup
> except use them internally for details of the stage 2 tlb walk ?
> I guess they get used for the memory transaction to do the walk.
> That matches the old code that just had a local MemTxAttrs in
> arm_ldq_ptw() to do the walk which therefore implicitly got
> user == false.

Exactly.

I can't think of any reason .user would be apply outside of the stage1 lookup, which is 
what records the setting for any future mmio.


r~
