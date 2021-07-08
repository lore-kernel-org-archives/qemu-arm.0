Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp413921lfg;
        Thu, 8 Jul 2021 08:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIR4Ti+2FZ6nYuAGt1egX+JLUsyp48GX2rPm7VI8FCuY2a54qp+HnmbK1ybNWwUFv5iRNo
X-Received: by 2002:a17:906:e088:: with SMTP id gh8mr9412324ejb.125.1625756855486;
        Thu, 08 Jul 2021 08:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625756855; cv=none;
        d=google.com; s=arc-20160816;
        b=C4PeR2ixFkYxEIdgPMyx3GxrOu5b/GpwyzkoYRZBwAgp0yudI/2BxLPywcCSflm6Fw
         occy3sbETWYQb+uTvDKjbLOYxUH1ruUMALsxaQwZVti5zEKzxm+r3/re3xqspgeXP1XS
         yECXY3qHuVWc95zCjxaGEcNdQtStgiQzSFM5/vbkdjtkXB9i2denVozW2SwGMTSqE14M
         YUYeGt+AHEvuD+GZsF7HtjaKSwBQntUH7XbaG1lWEhgdDZSrmmUoi+JsznT8bXozqwkE
         4fZHknt8ON9OHO/y/ByYzELBVQxKsyOzoBV51OG/JlltseJHfMl49k6xjvDnr4+xzxap
         32AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=o6WZ5lx8n+X2gsaQTNg7vziGoWQl4U084iFeXoFp2xc=;
        b=Xi8PcjVeKqrnqsaJrS69zv42b1nKkC/iYAJGuhLTOFpEA7Cx0J6uga92ARZbe6fJkN
         JW72Bpk5Zb7Su2idcq3fSY+dE6V6SW1pFq2hJhRn8dJEfG3ddfW02eULl8MWL92t/DCJ
         vpMEfOVa01sxGnbrkj6etKUc9r439wvOt2gMC5tXFrJ+TwjpsyRKMVViU8bmUFpBp/yo
         l7MUOKS4rRm3O+0lA+TzJlq1iMVMTKPgUh1MrYMVG3ohOmcdmmrFgOBEpYtMxB1hfe2n
         PTJorOhSczm/LGAMpyXte1Hl4LxUDEKEelw/xtck4BRjCKTR+xgvd7uCqUY8YL27Mec8
         hdDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TTQC0S2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27si3193676eja.1.2021.07.08.08.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 08:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TTQC0S2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Vck-0002rb-L5
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 11:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1VcZ-0002rO-Df
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 11:07:23 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1VcW-0004fr-Sz
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 11:07:23 -0400
Received: by mail-pg1-x534.google.com with SMTP id h4so6261985pgp.5
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o6WZ5lx8n+X2gsaQTNg7vziGoWQl4U084iFeXoFp2xc=;
 b=TTQC0S2UxuVh5CYDkPg0SyU2SJgznicZRtuk+lUmsv74mh15H9feBfsq8+0AfJdZP2
 LJRPhtZqnssgNXP8k5qJCmeX66ytM3UXjviRbtrngMXngsDhHX0MXx3dSJPi5q+Ugckt
 1wRVQEjgYXzhAGb0FJrD+QgBoImOzlUeK3ofY9kfdas/WoxyLpRE0bFXNeDvYmeXTfCt
 F5jD+FcKeYG8DV7jxVSFBOmgQWw/zV0N2nocrDMrami1NKEynOS8mPZp1wt6ljDfp1bw
 TYA7r1wuGsTRmNyf/pIe/TQJtZffPYsmc3DYaCtO39UwTYf/AzUybRwho/02kKBLhCho
 ROtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o6WZ5lx8n+X2gsaQTNg7vziGoWQl4U084iFeXoFp2xc=;
 b=r0vg1kYI/tN8B9rQa5G80qEaa4nEsr0BHuiGjOtkaGSswx3NGOih9KVzv+J6H2Yz20
 fOAVht7OP4qTZDuCfdRN0pM5EZ8FMIWGRUdTmh57KKdYHN5rHYhXoIjYuh91H1F8fn1D
 UibK1v493bLPn7ErCmFZNZmcDlV460AjXs1LK7xGMNTXoOOTa0ZXzNHfeCnm/tmU0y0u
 NBq1ZKsiDVS+THVN8Scxk6eUXwlVKC9YA932FeGk6LE4MXl/kFOsTdePoNRzYNFtNOnQ
 B817VBJYdAVSCAITptDSmEhbSOrsRgzXS8B+5qCYxUWjhh0oAJpAK+mbqO7uhd9h46p4
 NDkg==
X-Gm-Message-State: AOAM530Iku/PazBB94IYfQnU4azKqMq9nKVtt3FdGPfA5kU3aNThFyQw
 7E+8+2wYxvEyDl72EKBp9u9ogA==
X-Received: by 2002:a63:fc02:: with SMTP id j2mr26193522pgi.235.1625756837550; 
 Thu, 08 Jul 2021 08:07:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm3187032pfj.168.2021.07.08.08.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:07:17 -0700 (PDT)
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
 <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
 <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
 <137e8616-f4d9-9824-56aa-b20f8c784305@linaro.org>
 <CAFEAcA-r_RAVHtL_4v8K3ZXF+-wCgwrBNoNebA-qnWHfykHR8g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <891e597f-95ce-7c37-26cc-85b67f1bf120@linaro.org>
Date: Thu, 8 Jul 2021 08:07:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-r_RAVHtL_4v8K3ZXF+-wCgwrBNoNebA-qnWHfykHR8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xx8uFLP6UIur

On 7/8/21 2:39 AM, Peter Maydell wrote:
> Makes sense. I propose to squash this diff into this patch, which
> should make it a no-behaviour-change refactor, and then queue the
> series to target-arm.next, since it's now all reviewed except for
> patch 11 which is a comment-only change.

Sounds good.


r~
