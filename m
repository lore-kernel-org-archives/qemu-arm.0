Received: by 2002:a17:906:3a49:b0:7ae:545a:c862 with SMTP id a9csp3816838ejf;
        Tue, 24 Jan 2023 16:14:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/YbMRe1iM2yh8JZWoshh/GzdDVm3mlp3AlM4mrWTO3ahrsFP/v/If6C0keKLqAvg230t05
X-Received: by 2002:ad4:522a:0:b0:537:6597:44f6 with SMTP id r10-20020ad4522a000000b00537659744f6mr6718315qvq.5.1674605657487;
        Tue, 24 Jan 2023 16:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674605657; cv=none;
        d=google.com; s=arc-20160816;
        b=NZsE7dTd177jBogzxtb+AbGAavJDewjUkda6HFYjQpVlqE5BggC2z3AP8FZQYUkW3J
         iLPCcyQzJllefj7dIZ5oi08ZfSXRloFL2BzBL69pN8LxBA5q3r7RPINBxhmmIXffRfSj
         fczTOVjGXp8PLbn5IP1HNKCSy37LO+BxHWrNJWaNpBocB9jOBHjB/DBlVbn7jJH/iVv8
         /eLqCVl2jNYVmHPwOvjwmLwtASDkh00JISJt4cPeirZeW4ecQI6vk8e6Fm5ZzpsqVzcJ
         0Wn7DSuX7ThnRVHqgjXzsg+zJ7Nd8WyN/q0WDJnlHAiH2Gyx41sb346/2FNN0D/l0IdC
         FB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IAanV1cmzpvJ/BO7ybZI1dsSXlZ2W2XaMUYjkULGVBs=;
        b=kiimQ6laLE5IdlK14l3CLE8jQdh06yO/BtBvx5m1sBuOSIf/YjicRpc1i8Wb8DPXd3
         2rDuhU3Uol9apXx4Ynv7i4HUMxpby1zV3s56cIvy8LjQnBWWODfpazWpgMV8g593KS+k
         o0BX/jONoOvsVu8XXs78r31K0PjQio0rXLUi6in5msmm0blF6wYaxgkdZJGqT4uNHkgH
         j/5yQlCuYCwz3/pPcQytLDyBWdS30U80QjbGtflziZPUcUVxv2QKh7vVQQnhuhgyNt++
         JkgIIxIBnib15ZHX1Ycv/OXJbYPrh13mJiJq4Vd3QcbWayefkb/ndhGThfJCkDxIw13w
         lpHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8O09S39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b36-20020a05620a272400b006e043ac205asi2802171qkp.744.2023.01.24.16.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 16:14:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8O09S39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKTQ7-0003QN-7J; Tue, 24 Jan 2023 19:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTQ5-0003PS-O0
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 19:13:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTQ3-0002ZA-0R
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 19:13:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id m15so12646375wms.4
 for <qemu-arm@nongnu.org>; Tue, 24 Jan 2023 16:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IAanV1cmzpvJ/BO7ybZI1dsSXlZ2W2XaMUYjkULGVBs=;
 b=M8O09S39o0BdB2IT7y6xIXtqPhWOWkVzWbwIqPP7hgQ5QQ9xPgvhY80qgwnFjDp8Jx
 FPi4e3NqWmW7+WMqJqExMirrf7j4/1/hsjNSyxJHFDQWmNvV3psRaSfY4VA06wSPVXa8
 K8kMguUrPTbluO8t4/vTuz/gol0cAC+nhlfGsTp5CqAl2iS7nCkXzJ5rCfrmBYVjD5HI
 0sP6qHFBP7eQW0eVglRumz/Jfxg/oMvkgMQvWQvyfbdzoED8c5BlB699eryjmw/PpLtZ
 oGAvJ5EmpA7V1ze/K9J4hWV4yl8CEuSMZCxVk56m9DgQBRtO16wHKcQRLbmApjIoa3iB
 FKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IAanV1cmzpvJ/BO7ybZI1dsSXlZ2W2XaMUYjkULGVBs=;
 b=L5gUzk7Vw1AA/8hccmG90ve42lvetI5yGQEJCvFOdrP3CA7nSmsVUh44rXJtBo1erH
 RzzxiYJeQbEQJggu7ADeUUt7ff6p14yPS5z+S477Mf+Ryudbyh6ZOtEPMqQYO001BP93
 1nq+9SME+e7czVV9bcv12S1YQHusANFtXpIGuzoKa9x34wi3KWkbrXqtuKkX4of1SKrY
 t9qgjKVYD3Zp1yPWE180dmVck4Ks+5OP3Sfw9BS3+Md5KJGyeux6u6mCZ+xC8f4PaLXj
 neZnporY0LP1qdqJk93MP3tqqwDZKlpvnxkSgtmpIai/VdzO9rnhiBh+l7DavAEKwSUG
 A7TQ==
X-Gm-Message-State: AFqh2kpsCJ+k/vthJ2Nwgp6QzrbjgYwTRPibKvTWvPMJ5ELDXPe+24bT
 0HZf2sKpOfhq1DpX6/xivd7LGw==
X-Received: by 2002:a05:600c:5488:b0:3da:1e3e:1ce8 with SMTP id
 iv8-20020a05600c548800b003da1e3e1ce8mr29468908wmb.13.1674605617245; 
 Tue, 24 Jan 2023 16:13:37 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c430a00b003dc0d5b4f75sm189261wme.43.2023.01.24.16.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 16:13:36 -0800 (PST)
Message-ID: <a90ac6b8-77b0-7bf0-cef6-00c5bee4fa4a@linaro.org>
Date: Wed, 25 Jan 2023 01:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/36] tcg: Add temp allocation for TCGv_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: DvgBJpDdUjEY

On 8/1/23 03:36, Richard Henderson wrote:
> This enables allocation of i128.  The type is not yet
> usable, as we have not yet added data movement ops.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 32 +++++++++++++++++++++++++
>   tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
>   2 files changed, 74 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

