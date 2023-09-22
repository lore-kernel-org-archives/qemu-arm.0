Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1404184ejm;
        Fri, 22 Sep 2023 08:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXIgOVhuBGKRQSDowCD6zO4HGvKNVP9Mf3n2e0qAU9wDE0SxlIH+1KviqJ78+BByXMcmA6
X-Received: by 2002:a05:620a:29cd:b0:773:fa62:39fe with SMTP id s13-20020a05620a29cd00b00773fa6239femr3771753qkp.1.1695397114016;
        Fri, 22 Sep 2023 08:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695397114; cv=none;
        d=google.com; s=arc-20160816;
        b=BvpTwfS/v9pqr/RCLTj0whCW9Zh2gnn9dBSoD4CDCYoiETSgI1HDjTZXO6lrHrEzG7
         VStV4CUxAm2I4Mgh/SpPMR2VYj5m1UOaWP3JwGPSzbSoA86UAVkNt7UGni6/tasauUKd
         kmPZ/929uRWYi7E6GjozXnzjyM1N4lLcPYsv87QZlE1ZA9INidMB61QE/z3ZOuXWxtXq
         tY/gLJLwSYxBgcU4byuKSAJoOC4Miie6YSR8hC2XooQVK/u8vCa+Cy2lHQ1T0ukFp571
         YYpUKABo+3kjCxEYaJFv8ElOmPxrWn0a4G4nyY+7EtrG40bevquP+m+ziYlYuUkYWSGO
         fs4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=i8Zh9/3x4DnRqh/6bnvahbjfL/ZVTviF6p8gd36Zex4=;
        fh=vSFYUDMPKebNxmLyxRDie694dMHU8rn9DIgzC+PKU5o=;
        b=t0/Nzp5MjoA7pYY7/0tRJ5jkdVZzPJRwYGQJQHTsHrZ0+uE8hiEpbZlKowEteypA88
         sFxHkRPGQCXNvG+FIIyhM2+QAbrltY8upjwGjsxzC06ZUF8/1Ccnff8+kV/LRHxAZ1ic
         sSmY/uaplUub1+Ehs1jjQ27ZI3vs/0wXvL5dw5azP2gRkBmRJnNbl0JuLee3ZIVAe+MA
         nOtc/SJNHdxo4AGgn81zR//04CTjoGe8d7CtjVnKY+6rVvj7C5RDlFMhKkQlGGdHBKNZ
         SZuuxDv8qniBEBybgCU05qAjw5oCUrJ9qas8Un68pe300cV0YY9nSkLhmYKZwWoTRCb7
         NStw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ln65Y1Yz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv16-20020a05622a4a1000b004180387dcc0si430645qtb.605.2023.09.22.08.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ln65Y1Yz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjiEP-00054E-8b; Fri, 22 Sep 2023 11:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjiEN-0004tl-8A
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:38:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjiEL-0001ih-Lv
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:38:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3215f19a13aso2221360f8f.3
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695397088; x=1696001888; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i8Zh9/3x4DnRqh/6bnvahbjfL/ZVTviF6p8gd36Zex4=;
 b=ln65Y1Yzr12OaUTmoh/SCrOW7MOl6e8Czu/KUtdSoqF5VRO4mjYPIbaieku7Ss/BKV
 B22oEANA6OyzhiNCBkaDBpO2UPnNURRMdPqQyj/0O5gfS37U6iIF2vHihBt91vm4Nbxa
 h3f47dcBmBuGcZV/hOUym12oFT6Zqok8Wq2hQyAwEgQxhOOqQ/Q2ClILTsv+veA6wGG8
 fYYPbm6ZzAFGg3AmZ+xH62GbbSQpYTsrBzqVIHx7FFvxQgr041qtgByfbAa6U0k/kxsS
 Hs2iZJz9dAHaA3xI+hsVvfQ18Nlt4I55Ms4LoFpMDUggqkPBEJHtvtz/86OlGdqsw051
 vMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695397088; x=1696001888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i8Zh9/3x4DnRqh/6bnvahbjfL/ZVTviF6p8gd36Zex4=;
 b=SKloWJ4fTakG0ZiViZkEPyYSpjgRex/A310xdiOcV9J48Nzjt3lGWSHgsAdictWCYa
 jReXqv2ENJZQUepzVBGLy1uppCKUW8jFJF2egmO7nqC4ubLl78lfHMzdR+/3mk6FXN60
 M/xj7xdbMx5MZS39Vex3KGTXCcsTk+Pgth2/1Ra2vBb1NG3RM2b1iyRZZWv4wFtoFJsG
 OHMWpg1W1kwfpHfnYxIz2KyhzJjPxykYifdOSdPX7trMhx/wtQ0KanbgtvNZ7QucRCQw
 3cjsvBYLn9WLdl7o5uknopbEgP3kaxPLbGeJoeU5hSWYImoVT85Wp5RZzVgc6KWjg57w
 eJ3A==
X-Gm-Message-State: AOJu0YyOcRvfrixo89OODaoSuVXD3sHSAOBxB+XFvgpsvASwCmyMnyhC
 MciW/WQc7rTG8WlR76WXDf/iBw==
X-Received: by 2002:a5d:58e1:0:b0:31f:fed4:d79d with SMTP id
 f1-20020a5d58e1000000b0031ffed4d79dmr25137wrd.30.1695397088105; 
 Fri, 22 Sep 2023 08:38:08 -0700 (PDT)
Received: from [192.168.250.175] (234.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.234]) by smtp.gmail.com with ESMTPSA id
 k6-20020adfe3c6000000b003196e992567sm4719289wrm.115.2023.09.22.08.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 08:38:07 -0700 (PDT)
Message-ID: <6d0d88ac-66a3-cc57-25bb-3c9092679326@linaro.org>
Date: Fri, 22 Sep 2023 17:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] hw/intc/arm_gicv3_its: Avoid shadowing variable in
 do_process_its_cmd()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922152944.3583438-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: qLZtakpZMo7W

On 22/9/23 17:29, Peter Maydell wrote:
> Avoid shadowing a local variable in do_process_its_cmd():
> 
> ../../hw/intc/arm_gicv3_its.c:548:17: warning: declaration of ‘ite’ shadows a previous local [-Wshadow=compatible-local]
>    548 |         ITEntry ite = {};
>        |                 ^~~
> ../../hw/intc/arm_gicv3_its.c:518:13: note: shadowed declaration is here
>    518 |     ITEntry ite;
>        |             ^~~
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

