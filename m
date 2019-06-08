Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1555207wrg;
        Sat, 8 Jun 2019 12:50:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfbybSczUSysXDuU58WlT502tloLV9FEazHUXAL5+8op3cZlDdDAQNoaA+YIiGQlXVy8Q3
X-Received: by 2002:ac8:849:: with SMTP id x9mr3607757qth.16.1560023408499;
        Sat, 08 Jun 2019 12:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560023408; cv=none;
        d=google.com; s=arc-20160816;
        b=eIaxVDC8bCE8QBmkwAg5GpkS25ExSww47JRrSs6Uv/Xqzia9K2m2jZV0XPMHmRPYNq
         IDy+c1uWMCWVLQl6VnFAv4dF2hYWauhKU4RQx8hF5Z4zxpWAGsWc1qBi/F9rB/UB8RV8
         k8ltHmOQ4hukJ6CE6QEfJ2Jrwd5f95WVmPxxtq70KKq4/eZXefYQftCekfHj3KYlNChF
         Y3L202IHqVKq7ViBYoPr/fUrJtYAbSt9DO0170Mjp9shBRPNK5BFcQ84YUKUsfWOiKHA
         8DkpoAZCkJWsG3oNOUHJ/inp56G9HuUyCRe3pfMlCPSI6wDa4QU/GrueBOdEEwWyQmjg
         Y82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=28aRdCFqEvQ6Z1IlpC6uH60hpevYqn5m/CqBKdbiIa4=;
        b=Y0tP6bznEfyu/8SaTpMuCupZNbpZ8w6oqCIcx8uLkWhlwve8HBdXK7bDZ0Ca/VXgXd
         lktpsyep1bYhoWpXnTRT+wNYce0cJ6QJMdwAIlU/4lNaP1e6hIoLvftallJpcKSj1hVv
         WxTYU/mzZi3Xb2UXs29ulikAiqZF0ThQhqRvHS9HOSM+9OijV3LvilpPQvfGmQypMOE3
         5vXeZa7svikGwQqKAu7l47sfDLRYtlRE+7JmBZeSfmVASKsv/haiVqG9NlYqiXFyVhIx
         EoIQWWspWQ0bBXMZOspGjSrCxBuRE5uncarHRhUWauoxqxaDY1rbY8tCmojKumIh8toi
         xKDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iiifs0Ap;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28si3585729qkj.169.2019.06.08.12.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iiifs0Ap;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhLs-0007Uq-1K
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh28-0007Tw-7Q
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh27-0007qq-3C
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:44 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh26-0007q9-8u
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:42 -0400
Received: by mail-ot1-x341.google.com with SMTP id 107so4911816otj.8
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=28aRdCFqEvQ6Z1IlpC6uH60hpevYqn5m/CqBKdbiIa4=;
 b=Iiifs0Aps2xxqNNCpjchQYAC0kwhoycHjyQ4JjZYWQH3bM2zIw/YNj5/wOvNBtPX1X
 89eNOzP2AeTIZHZMPjGL22Ijjy/+KckNoM8CWnO7mElTZMPR8r8K5D+LEH7OkFvydTin
 1w7AK2b0oLmsEJHUcwq+lP9Iiv5wgFvgXYGwGXmr1wOjEf+S8xvzjTHHfoCwnf7dGnLI
 s7BAisYqd+r6GBt7YuEoT7DRpm1oog+qV1xT6d+wFDGc8wUBBpUXY1WfxeVbemMELpvk
 hMV3JQ27X8oy5fn0nzlCJWhFg7geK3+3OhtqXO340HZBrzXo+dwcRmqBDI51ov6duFh2
 10Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28aRdCFqEvQ6Z1IlpC6uH60hpevYqn5m/CqBKdbiIa4=;
 b=Rq54zxtFZUMB2t9j3eT0X9roowS5r58kqfvNsmbOyyrnCJHWkovmvDCaCO24OeiGbu
 tuSjpfuHTjmdGylwXXeEFsrNRq/0aD11In/02rP7QkK8kmxFNZ7NTWYN4f39xRyqc+vk
 /rdyPxDs3DCsp+7/KA3WjzOEr/Cp40/O6HnziU9cmol+Di0rrYhNAry9VLZDTHe8HFRu
 nwQKFXdpVoMdEYNx+GKbSpiGX2cyA8IiUdqCKadehFSpl8q8ZJqQ/SpaMXSXYVJ5A9Np
 ttA/1NEw4I6466YAYa+TrPg6iiLq163rvDftz4in9w0auWziWJnAgQvl4iLLJoMvsocT
 ghtQ==
X-Gm-Message-State: APjAAAUqoU8FwamsYaAVAiA/cvIQirlYqQZPwM+5Pfb5WmaxNQ1fSHaf
 vxR6XxTUPyXO4W2sRS/ye/aKkk8nZVpwLA==
X-Received: by 2002:a9d:7a53:: with SMTP id z19mr12687598otm.134.1560022181065; 
 Sat, 08 Jun 2019 12:29:41 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id k17sm2088081otl.13.2019.06.08.12.29.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:29:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee156448-67ee-2c60-5e41-0775bbd61914@linaro.org>
Date: Sat, 8 Jun 2019 14:00:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 32/42] target/arm: Convert VMOV (register)
 to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jq9OGNcWdwv

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 10 ++++++++++
>  target/arm/translate.c         |  8 +-------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
