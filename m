Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2848111lfm;
        Sun, 12 Jul 2020 18:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGhhbj1KQUA2rPnjni9yl7MdnesEQ07gQ8ItMpmjMVRQtNOZ0OMlpiuVpKJ0Bnh/OUvMLT
X-Received: by 2002:a25:ac02:: with SMTP id w2mr68917587ybi.57.1594604697923;
        Sun, 12 Jul 2020 18:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594604697; cv=none;
        d=google.com; s=arc-20160816;
        b=eIlsZ2nSwDJm+hMrRhONuTvH74YksU3UT7wYWRyINfS9S9YRZF9hRG9LttYfurDTWY
         g5ued4de2eamK/fdF5PehwKrmi0VkZ3Ha3BwbCv+oPXKjBqKJsTRO3MGWI8IrYOQGkfw
         KgwPZ7cGsBCVvypfVaXvRgjZIKaeOJDfh7yNwTpl75Wa26gdNU9eeqgPwZ3g1MpMSCVD
         /ZCMIGSUrt7rUKguaL57U99aZwl5g8yNv/zPcFA2bH1TQL2tJM16Hard2/42q/B6QAhQ
         ns25yrNOu0+nfWT/+Bn3jNim3nwDOyR5FC1DjNDKsLw0z7293D+c5htOk81FnghSsgt8
         VGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0LpMcHYGe3bGLl/q8DNXv2WZvgyqHk5ZJvsjH53l/P0=;
        b=GSVflQdV9LLlymrHv2bMrsjtGgf5GwCcsscn24w9UO0W9LxbWy8v57h0gZ3DmM4uNU
         NJSlK96yqw3njq8fAhBMNmQXcUnjwWm8R1kreW0+l7ylaAZ7JMI9nw+SAvd4cDEj8QDs
         4ll7y58d76NMf7YaL7OQwSco0ZhwlS/+qwyp6f7FTEYI+qFYJJFiczdQcMphpvb0doKd
         hhbYBoHTI0bLY4P9OzhTdD2cZoXcP+fQxI+O3kjX03UnD/mLc5kPtVcC4CJLA14iH/pX
         i0i5Mu/2P2XM6wsehk/iWr90aeQeaOIkUFgQL88CiPAi7vAojVZm/rE5jBBjVGZtyfiF
         6P5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m/bJhMVz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w69si13501498ybg.387.2020.07.12.18.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jul 2020 18:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m/bJhMVz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1junWb-0004pm-9j
	for alex.bennee@linaro.org; Sun, 12 Jul 2020 21:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1junWU-0004pX-EV
 for qemu-arm@nongnu.org; Sun, 12 Jul 2020 21:44:50 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:56227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1junWS-0004kL-P6
 for qemu-arm@nongnu.org; Sun, 12 Jul 2020 21:44:50 -0400
Received: by mail-pj1-x1041.google.com with SMTP id ch3so5390113pjb.5
 for <qemu-arm@nongnu.org>; Sun, 12 Jul 2020 18:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0LpMcHYGe3bGLl/q8DNXv2WZvgyqHk5ZJvsjH53l/P0=;
 b=m/bJhMVz/rCb1obA3PRSsjZjY3yuTRy4eAnWI7sAHA3T94IPv9AXtcJh9EoEGMfYna
 wJu4DPM17boMXVeHY61oM1Pm39TqapCWgVrAWsadZxxH4Nta8W34+OGLceKiODBr0vG4
 Pxgci77HgNImuyTXrRJXd0YlF5bjGFmtiQB9M1ojmqZK32fKMKocbu9XWIi7Mi/iVCg8
 fc+vdtTUGnv3RP2o2T1LGdg7Unf4fd9u4LD/eN1yUd5TT6ejr+OLHiU/FDovhO66hX9X
 Z9YrdqK+Nxuyku8vUSmxjBs0CrWzlSvKlYtHk7xFjNYvtBtcUGt51jSRXGVs63CDoigc
 4uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0LpMcHYGe3bGLl/q8DNXv2WZvgyqHk5ZJvsjH53l/P0=;
 b=O9ozZuxOk3ve8e5+msiRJjRy9Mnu16geglNy/gpet0oesMgORW5/JkdYhRYTIcpK3n
 nV9nauAg69NnRvG0PT7LyuN2Jk242SzqKMEts1Oy+ld6xa2feZ+vx6SosBPK9xMuXBxC
 8aHBlEv8RweDZh2GoYlUVsJMuZuVhwSp9yjh9KI9AnRVtpSBOlVHZE25Ct5GpCdNO4SC
 MtAb0JnrPckyZVtIdWJrNReBDZyNsQnJMuIB8YjdrpUndBEvwsFTe8GQfbHn/LWeifxc
 0w5G6BjJ6ua0xy2SRnHB7IKPYZUUUJAlfhlQuEb6pAF99p+HY1nTWBhuGVRZGeWiuB7R
 k8Cg==
X-Gm-Message-State: AOAM533DWen18RxTmIK6JZCJHyd8wVjGlswr9pTfDBZILzeoRaifGDDz
 y8n+2ygFzh/nysLttpl0oQKAVQ==
X-Received: by 2002:a17:90a:ff03:: with SMTP id
 ce3mr18748386pjb.174.1594604687048; 
 Sun, 12 Jul 2020 18:44:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o18sm14034098pfu.138.2020.07.12.18.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2020 18:44:45 -0700 (PDT)
Subject: Re: [PATCH v2 01/17] tcg: Introduce target-specific page data for
 user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-2-richard.henderson@linaro.org>
 <CAFEAcA-qybDD6GWYPFB6tMfTb9Kj+_bCKCxPyDYMZBr8EwbDmQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b7b64a7-2aaf-7886-bbf4-1d228a7199e1@linaro.org>
Date: Sun, 12 Jul 2020 18:44:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-qybDD6GWYPFB6tMfTb9Kj+_bCKCxPyDYMZBr8EwbDmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T/mLoIrdoam+

On 6/25/20 9:20 AM, Peter Maydell wrote:
> On Fri, 5 Jun 2020 at 05:17, Richard Henderson
>> @@ -787,9 +788,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>>          new_addr = -1;
>>      } else {
>>          new_addr = h2g(host_addr);
>> +        /* FIXME: Move page flags and target_data for each page.  */
> 
> Is this something we're going to address later in the patchset?

I've removed the comment.

The mremap system call is not as general as I think it should be.  It only
applies to MAP_SHARED vmas and returns EINVAL on MAP_PRIVATE.  Therefore, at
least for the MTE usage of target_data, there cannot be any.


r~
