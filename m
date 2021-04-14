Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp6147605lfr;
        Wed, 14 Apr 2021 12:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMTbAo7Jkdj2/TB53dgucoFPBGDnjk45Ayld4kFLaP9fG0d/w5F3daNPpwTCsRjGs3Jhp+
X-Received: by 2002:a5d:83cf:: with SMTP id u15mr31776668ior.34.1618429430355;
        Wed, 14 Apr 2021 12:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618429430; cv=none;
        d=google.com; s=arc-20160816;
        b=ocsyMCOQXyBd8djUFPSDQk80lZ5mR8yZsQ2aasPjpetSlGC3QsaDI1cpCd9jrTgADT
         y9s/hOsxImS2tHIiPaS4SSMgl3kIJG8waJXmEKUYPcf2ZZ1sGltRr0WmC30kn0J6nagR
         DjBNBVfTYy+nslCH1CJ/0b1uwaeaSWKh03dgI9aH9AzBqBz6CtQ3FbTe8Jt6qVjcy5To
         5ZiK3WZqphx+5oAV1wd3BLJo8WWNkHasibYcSCRa0k8RJ4i9GKapMD3RlmJ1yKnlEx9J
         qtANxhMT/7XVU0X7LT/n40Ebn7oIsF3M1Vsbf2UF5DT9cHp9QclL51aE1DxMACX9VFgC
         biFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eNA2Ob+heu1g2KPcoi5xolm6BDBRd/FEA1b2k9xu/jM=;
        b=ouAaemTunS4/4/SyVb5RSsUToFNC4BC3rwRtTAJZk7FW2SJbVMzg+DhozmJyuFnoep
         QJZxklpxIAWbNjSlQTMDCA6E2aHMKNiY3ZQLkHJmzbGdTyqMXYyMT5n+0KaQXvrB+8si
         Spw4llbEiYn85Gms1ofmaoJNUueejOG5shcZd+Fq/U1lbdudDwvi2ubRxd2IUVd9Ylis
         qVa28WuCDuYzhlEU0EIsFVY9eAvEimOtXHUnIoEz+vXcb+VMVgLtHTqg7n8SfSei0TwY
         Oy7DBBvHDKXPLzqE5zvt2IwUzzDDOkpyQnOj74d3Yl9L+HBpJwKNTbpJlOstOvidofZb
         r6Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zJqkzJ3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si410312jan.106.2021.04.14.12.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 12:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zJqkzJ3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWlQT-0001Ok-N8
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 15:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlPq-0001OO-Fr
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 15:43:10 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlPo-00013H-Mu
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 15:43:10 -0400
Received: by mail-pl1-x632.google.com with SMTP id 20so6772948pll.7
 for <qemu-arm@nongnu.org>; Wed, 14 Apr 2021 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eNA2Ob+heu1g2KPcoi5xolm6BDBRd/FEA1b2k9xu/jM=;
 b=zJqkzJ3KfU+TUbsjdcmrTfuZHi2yFkhRen4DlKZvh7fq92D7ycSzyxSGrsY+0aeTcG
 +/XvKOUrhM8jz0wr/CHIft1sjlOr+Xxxs7hxqMXc5B4HixVtD/ofjUcqnYIEQPfb1QOq
 gt/keos83cIzI2s0kUDWnIyO9Y9oY1HzlyLP7k6NStpEO3bo+LHVwbN4eJLpLFQme0/9
 8vmjSa5hZ9KWPnBeRlZUF0iQS1GEmQQ+eirlvCiKxG0fGcI+dY9CQ48uahrO4faW6TFX
 TopRNtSMB7CeDMhFkN6plxDGM5NvX9bR8QPgC4U6MehzjcCmCReU/trQLdYxdHonIwYy
 fFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eNA2Ob+heu1g2KPcoi5xolm6BDBRd/FEA1b2k9xu/jM=;
 b=f4e5YDVI/dLekU1HDzLS13rirXEB66duSYp0zaDgc+drJlxyX+60W6ao1YQpcvSAU4
 L/mIpayTV4/udOks48B8Jy41pIMaJEAvu0ukgS8p2fVIF4dmfmuF1pkqgXm1Nr5Ea/IB
 51vp0tNOqgHQV/2E+stoBQvjWeXv15RhzukN5p9RaX6ftwvA2l83/67DJa5Do8QaJ/fM
 yvPzRouVdP/jFs3p0IYyVc1P/4cWX8OwId3bEPrE7cIXyH9g11kCWO5Vr2q6CZ67V+RY
 t98fcF27tuvXHzND37Q3tCUDEPD55nI31dtJP7QeMQ2NXdy/pVvghedhRP/cy7L/aW6j
 TbYg==
X-Gm-Message-State: AOAM532jljrhItv2X0yYrIomyNnITADkeyNIg3uYGpnBoy5jtp8ysF3R
 4HbeyxM8mzoAdl9BoNqjjM8x5w==
X-Received: by 2002:a17:90a:ec03:: with SMTP id
 l3mr3341927pjy.61.1618429387138; 
 Wed, 14 Apr 2021 12:43:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b14sm194491pft.211.2021.04.14.12.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 12:43:06 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Max Filippov <jcmvbkbc@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
Date: Wed, 14 Apr 2021 12:43:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kaIVDk3Nocb

On 4/14/21 11:03 AM, Max Filippov wrote:
> On Wed, Apr 14, 2021 at 9:51 AM Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>> On Wed, 2021-04-14 at 16:48 +0200, David Hildenbrand wrote:
>>> Did you double-check the xtensa issue?
>>
>> Oh, I'm sorry, I completely forgot about that one. I just ran the
>> test locally, and apparently it fails because of this new assert, so
>> I'll have to write the 4th patch now. Thanks!
> 
> Just curious, what xtensa issue?

Returning from xtensa_tr_translate_insn with tb->size == 0.

Basically, dc->base.pc_next needs to be incremented even for illegal 
instructions, preferably by the number of bytes consumed while determining that 
the insn is illegal.


r~
