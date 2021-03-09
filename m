Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2920799lfg;
        Tue, 9 Mar 2021 07:39:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbA1/MMCFHv4kqr4eYgq93NyePRSngf1X6EazsWYzlVFlf3xxxBFZdSeNRn6ehXNWE1X/E
X-Received: by 2002:a9f:258e:: with SMTP id 14mr16576323uaf.128.1615304399370;
        Tue, 09 Mar 2021 07:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615304399; cv=none;
        d=google.com; s=arc-20160816;
        b=o4SWKefw6CV2evYHYO7ZQdc1q8yIZMIlCaqECfZVgHftOm1s7cWgo/ZBnNaMRlzeCW
         fha9mklBE/LU1Se1V93W9y782WqPL3Y4/u0dofHTCk+1zIYStLq4QaP8k8LaLq+KxQ8z
         hta7WKaOOsN7ooPRGDqZxVQIHHaaWhR5rIgjrbAPNbI2C5IeATnujn1W0DeKe84kZzsE
         cPGpvs5uENzpiVV1cZFugJbVGrsYbOCQeCrB3+VXakBBpZLZrEjR2ninIpu/DD0lbijt
         ACNlo6SMtsIQ0Jg/qgP1EaNvIpfPBcZQb3f/jyg0hVkFgi2oTi09P/cqhCCmF0N7mGVD
         dNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CezqnxXRYtaCxPTztJEnGsM8L4NDy6bEHTl2hiTBHOw=;
        b=G21F+B/aOkud/vQ3z88VDh5UUF7iDW2fF7Dbyq1p0FPW/3Dq9FquKK7mHzhycavmJj
         rgjskvOJi8T+iDBrd+jAG38CrOK+h9yfRvbzAb1B1wCM9QZ0BA4rB0DqWqMky2M8zTTx
         Fxdy3UmV0zfINOGIaCW75GNwqN4/vAeJVZLnhP8lSQPhsh8rFV2A5ztLIhEMhoVW0UEx
         Pl5/oHfNgWU41lJAdTjdbnak05OvRXQ9bC03dLaNbr69X6MpuIduOOYaXnVSklVOCunw
         SDpSo+tIw45O4qSERn/JtsjwU/05jQt3MQM6urHhX9O7RKVko7TtfDoQKsZeoyplC2PD
         X+lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=DufxvXxk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si2337247vsk.192.2021.03.09.07.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 07:39:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=DufxvXxk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJeSk-0003CK-HI
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 10:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJe5C-0000We-MR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:15:40 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJe59-0001zC-J6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:15:38 -0500
Received: by mail-io1-xd36.google.com with SMTP id a7so14231886iok.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CezqnxXRYtaCxPTztJEnGsM8L4NDy6bEHTl2hiTBHOw=;
 b=DufxvXxkZ2nirEzFFV2Wjrfn1SqInHQPBrzYRWk4JX8ZrY94V45MVQF52HyZeD4fW8
 Q+GsZG2cuSIoNDD4z7YsFS0K2vdFNlHVKTXkKNAvZ5KN57B8JfQosD/AuKAb5foOICeq
 Z1VwiiHs8oN2uSznYxkNflbOBHC+KPtXekayWMuhehONLMC9Ifp780PZPWLDcFrGibrK
 u8uGUnnVr0hfgg6WezJUXMeJHtB64CVDUKBof389+S4xoHAwfCZOyWwFNryVj7U5k2xD
 rdVb4FLa1FgH1Q3jhUlHK9Vz+xGp6sWAqsbiq8pNLjbXJXk4EVwU8o+ML5J1MlKFm0eV
 7tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CezqnxXRYtaCxPTztJEnGsM8L4NDy6bEHTl2hiTBHOw=;
 b=HN9+2Vp+u5qppGiAMFWV29c5QiIsqzIMLCrlRG2/EDozrO4n2j1uf8Ipj62qyPBtSo
 ZeB2OvSudVwOGgQL97eNEGq+DVMngJxuGQQKDJvFCc4U0jEthLQjoTxJEizk3AUb7BFe
 R05kUNJDDfvhTISyjQSkOMjWsMdyQI8GjR/ueFHFb1kYWY8x5ODO4wy63UbJ7raG56nH
 w8DZF1qYQ9cWSkzZqNmnYXgT1vRNJ+mas6IumtgEwgvhA2J6MvxfHwuRzL1i8xQt1RFl
 fQIdvtglaknOVD7mqUqxKIaWieAcJVSwUiFgTtwiIhXnTTsXK69UIVK/uJ/JnH/QJqEX
 JiNA==
X-Gm-Message-State: AOAM530IV9KgxpCwZdOynLuwPLXAGRLqHKD2zz3T463jbzT2AuNQPvyn
 C+VJMzCs6VUIFbned++ANR1aYyM0rHUIkmVHZrYvfPBdCUcsmdoT5ZmMT/2sbN3inxdjztGNheH
 S5JiNmn2C+dFABh/naPHoHGsh0XzE2QAQJB6s5ctoojY4dnNp6Yl4ZnSGaipYb6iZ/O9fxW0=
X-Received: by 2002:a05:6638:ec7:: with SMTP id
 q7mr29117458jas.54.1615302933334; 
 Tue, 09 Mar 2021 07:15:33 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id x16sm7886868ilp.44.2021.03.09.07.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 07:15:33 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20210308231117.12650-1-rebecca@nuviainc.com>
 <20210308231117.12650-2-rebecca@nuviainc.com>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <59c3c36f-6fce-510b-654f-28d7838baadb@nuviainc.com>
Date: Tue, 9 Mar 2021 08:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308231117.12650-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: voxn9Dgluub5

On 3/8/21 4:11 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
> maintenance instructions that apply to a range of input addresses.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>

I realized this only partially addresses the feedback from v1.
Specifically, it still doesn't take TBI into account.

-- 
Rebecca Cran
