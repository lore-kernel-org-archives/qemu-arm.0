Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2019717lfm;
        Thu, 18 Jun 2020 14:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfZ1bjuBjsU0wgL7YEuyhCvLYd6rm1ez/m0SklniuQcwUMiJIbIOP7UPsKg0I839PgBjLq
X-Received: by 2002:a25:7086:: with SMTP id l128mr961084ybc.34.1592514118543;
        Thu, 18 Jun 2020 14:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592514118; cv=none;
        d=google.com; s=arc-20160816;
        b=uErV+d/ty8y4pVz+KI1S15VlQWQvD/hQ8BoVMV6WCIQKYd8qT7tVtbx4BfLnjUN9pc
         HcQE4Gy5ILuDEcpZlPeytEKouhp9UgMULKu6d7uzePApQrdrh1EMRIwhqPERm2h2+t3C
         pKyGDggKu19ziJpfNuKZetgiDsjiZ54iPEJWcd9XJnlAPBM645FPn36079ATaY+JROEY
         PLxeFazMqS2s2kUf6vrkZtMV/SiET0YsldnRhcknQujl/iQX8k1/cpCoxTKfQ998ps0/
         5CioH24LyXB5IDoI2U4aNzDvMMjLyTKF5wZUR3ZW7h3HQLcmszL1xJztzOMb6u3q7NpN
         ThKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=hwgPUtRzG+9mqL5mf5xuEp2lhRog1U5rMYXCwlYMQ+8=;
        b=HkUlw+yno+D+/zXRcKmnQB+SZYE3kQc0/X7/HnlkY5zXfP2dGtqwZqyF1Mlq+k94tA
         vXqSVP0/mgLpgFfUk3Do/LpLydwE2iIN6MOHlonF9mKF1n3t39BTRLWrnP18O+1RT6Yl
         ZnLrFCZN+hZ91EuUj+JayrETo4fCAg98GKNnChLbXNuWzj1LxOAnZkutAp1X0AGVGHnW
         c5tvQ2+9xIzcb9PVvE4p2gsn5/6yCXvWnC71+Pz66qpwTTYRcj/O6QHmZpAN3hZHlOIC
         G9D0wicRYhftPlH8syaKqWV1gVH588Pf1lat8/XFzCGffhe9SMO/xCxV7jWPS8y6By+h
         66HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tjULQryV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si3190864yba.182.2020.06.18.14.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 14:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tjULQryV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jm1fZ-0007mq-Sq
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 17:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm1fD-0007mL-4C
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 17:01:35 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm1fA-0001Pm-Li
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 17:01:34 -0400
Received: by mail-pl1-x644.google.com with SMTP id y18so2978887plr.4
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hwgPUtRzG+9mqL5mf5xuEp2lhRog1U5rMYXCwlYMQ+8=;
 b=tjULQryVm/zRhUVWCUC95ECmkJvB4Ti6gyRbset2JMqmBl3FMuyoKuUvmcSWIBbpcL
 Xdm8qYvB596ebcWK+IG9LtT8/43WSRM15/5n8Afy9pky7nSBBvNcF0lEE4w/k9EDFN0W
 ZpR3x4DltzbAwTA7JjUI6tx2G7W9ttA6mbU1SfUIQns/HTHtH5A9OTPl42zbq08p3JB/
 V1Rxbc+vd0piaMjJej/B8TouYVkiNpPI3OXXRyxxjG1j2v+rLkIe0QPN5FKN/8AJjNa9
 EvmU5RstClYEQI9WW+on0/I52svaqT83Y1t9eSinaFyMhS1tl81RghimFdbx2BA1VxJ4
 pv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hwgPUtRzG+9mqL5mf5xuEp2lhRog1U5rMYXCwlYMQ+8=;
 b=BJoqFaiOyVxdiXXSc/4tZRV68qrJFtsMZ4cEM579zeu/AWE/mn9ZfT907vDbbnjUvD
 NHHOR7yyHZrguX62DnlwAzH+VqW/1SBAXeV15/YevnWaaxpajHBtZlEgcaC0iUPfLMkD
 Vli1Y9Uv1lNtFm5xHKiGOmHXABOAPit9/qAoNiELkpduhCh20lZncCePmfITf3VGM48n
 pAskwbLJYTUczlK1ntQiF/tRHprWmzjkG/+1pBZSCv+HvtJMOvF4twJGotFEkKc8VAwn
 rlwI9+I6QT5SDiSJPA7KmzGEPrKH294oYGzo9T8KR+/IinmYy/gaUm3osAQ+hPD/f64p
 /hyQ==
X-Gm-Message-State: AOAM5306bmildKX+8qK/2uXBL3nZYQuwBpmIS8VYikiO4ptYOjwehOY0
 4mkbrg0ZDLt9gtYWf8FhybVrAg==
X-Received: by 2002:a17:90a:32d1:: with SMTP id
 l75mr201003pjb.85.1592514090455; 
 Thu, 18 Jun 2020 14:01:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i19sm3443227pjz.4.2020.06.18.14.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 14:01:29 -0700 (PDT)
Subject: Re: [PATCH v7 13/42] target/arm: Define arm_cpu_do_unaligned_access
 for user-only
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-14-richard.henderson@linaro.org>
 <CAFEAcA86dH_utZzXdbvwhB_67OgVGc249tO6TOBtfw+nWi2-7g@mail.gmail.com>
 <bc120bc8-a08a-3b8e-cc31-e7c09e06a3a0@linaro.org>
Message-ID: <fdcc5868-e8fd-5288-9a42-73fe09ea6d94@linaro.org>
Date: Thu, 18 Jun 2020 14:01:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bc120bc8-a08a-3b8e-cc31-e7c09e06a3a0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /vYHNMWNndug

On 6/18/20 10:03 AM, Richard Henderson wrote:
> First, this could definitely be delayed to the follow-on linux-user patch set.

Bah, no, I need the function to be defined at least,
even if it isn't reachable yet.


r~
