Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp266209ejc;
        Thu, 19 Jan 2023 03:52:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtnCFH+zFPDvB7aHLswDp9U9j3DbeUuzjMBqJCNZMMv/3kJRIiudEU0F8a5NxMFVWjO2XDx
X-Received: by 2002:ac8:6b0b:0:b0:3b6:30b6:b897 with SMTP id w11-20020ac86b0b000000b003b630b6b897mr13961863qts.21.1674129141783;
        Thu, 19 Jan 2023 03:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674129141; cv=none;
        d=google.com; s=arc-20160816;
        b=EZgcWELmCX/QhcTtHRcOIyKrupAi0IFccdowdEVVeWnBKGu+2RTxqS0Fq6Cv5xCtgY
         p6OFAJwyrGOnYaM9gGw3C5PEWzL71GZRh/ak4/Sj+0o+x2riy6JRPXYCEmtKqudBiPSq
         QtdOS3/YSVEfOlZno43xJe96XcO3hy/5VSKVGffzzyHQawzjRQRXpc6O322o/dSjZ2ys
         qpf+JRb2MJ745q0E/9pmiwzmAXiL2Ky8qQPCkrRBFcKIQN1NbgHjgWuTiq3KoIbJo1ZI
         HyrnT1R2d4dhOlhR5Z6l2dTVyl2CfRT+Oi7ztfZ4VFzXQUXo5qpeaK7KUD/MWtG08tc9
         nHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/EXAhfnbsT5kAq+2ynIx5wkhU6EGV1+SBLzOXFS+PG4=;
        b=Kufa9mOdGwVaMxfyEapaUAU7PZvP2sShI+dhrpqySts4buse8WHLo17XyPjXz6JK1/
         VrfBGFlN1xjd6nn3mSPuTju60hUR8zNLceKfl3a34wGWAU29osa2BlMRxg/80wwZlIGa
         DY9DQCcyheEODXAh2riAeMaUuFuTb4Xj+pyQWrakUqlUc4WABeHZvBfCdxVYEP6WegTH
         eUGVX9nXRz5BJ/fo+rv53s4dDCillSsmVguxfsnelu4Tlu2KCCjI2wr7F34gXu41XH8Y
         GxfiLyr6LmNDDruS45bOJAOvRdrDHg5wkItpvXQ5uBCsXfyZmtFSzs//VXrFX8JJt6iT
         7tjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B1/KJAtQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05620a454900b006fba891058asi23835671qkp.486.2023.01.19.03.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 03:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B1/KJAtQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pITSm-0002u7-9h; Thu, 19 Jan 2023 06:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITSk-0002tL-Ug
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:52:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITSi-0008Fi-10
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:52:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id q10so1615406wrs.2
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/EXAhfnbsT5kAq+2ynIx5wkhU6EGV1+SBLzOXFS+PG4=;
 b=B1/KJAtQCcvexuZ25WEA/XaaKMCjVuuveAqZs7uLOc2nsgrC8de9/4dX6cJihp8UZG
 knW2yRLDKBGNTkfNIzPygZlFvo7p0DSBuyUNj9KMdrsS1aRU2H03MtYueQnHThsMrBKc
 fQ0q40Mu5I/vUNTA2pUKdyfkxDl3HDlQali3F7YI0Zixlaucrpu7qMJOASWY4jYCHPrI
 QE/HxbxKaL0CBMTTxHPcfO9siFff4j4a9JaMLXmwOpJxCrP0MSm7bugkZEIGBI+9yM3a
 nbhphmFuOG3yocxUn30jjlk6vIxWG02AwrK6JRVn4NLh+bMD5q3O8yEnOYqMhLXE01zM
 03zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/EXAhfnbsT5kAq+2ynIx5wkhU6EGV1+SBLzOXFS+PG4=;
 b=36klAoPTIRqwxKIAVdRhAbeWPtEgDixyL34LqhbnYnvnNc3KrqgIt23pOWHCn0FAjU
 5e38+HckXInXAC6WqBaqSJrwesqqfki+pzgc2pee/aolMxBRsnzH5FEk0i+Lrz9SXz+0
 iYlRG0+SQfAdIny+b/wVNa9/zmRqUfeSOLjbNKRwLU3/yt9CM0NlrtJTdTeP6GV5ksxy
 SwO8aJysBxq22BI9hVmWsjze5naTXnjgfmYHKm5kY9UOnpXP6UE0Akefyoq3htB472yg
 12PUY5K9rBSNrB3jDPE8PH9jhwdZHarZNdHqKae9yi0icgMehq7sQUGSMRZvt5jmO1Nq
 Wi0Q==
X-Gm-Message-State: AFqh2kraErhq1g5WHHyu+pm7vOhPCoWpYTPQhem1uhCimjQDR95uzPzw
 qCn9cDnkp9IGVx/azN5OAR/Ruw==
X-Received: by 2002:a5d:4606:0:b0:2bd:e960:9855 with SMTP id
 t6-20020a5d4606000000b002bde9609855mr9276409wrq.18.1674129124978; 
 Thu, 19 Jan 2023 03:52:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v14-20020adff68e000000b002365730eae8sm33765775wrp.55.2023.01.19.03.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:52:04 -0800 (PST)
Message-ID: <fc965afb-5e58-bad3-429d-d77e866d9f18@linaro.org>
Date: Thu, 19 Jan 2023 12:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
 <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org>
 <873586u4yj.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <873586u4yj.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: RJt/qojjnVW4

On 19/1/23 12:41, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 19/1/23 07:59, Markus Armbruster wrote:
>>> This commit was created with scripts/clean-includes.
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> [...]
> 
>> Up to here:
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> diff --git a/util/async-teardown.c b/util/async-teardown.c
>>> index 62bfce1b3c..62cdeb0f20 100644
>>> --- a/util/async-teardown.c
>>> +++ b/util/async-teardown.c
>>> @@ -10,16 +10,12 @@
>>>     * option) any later version.  See the COPYING file in the top-level directory.
>>>     *
>>>     */
>>> -#include <stdlib.h>
>>> -#include <stdio.h>
>>> -#include <sys/types.h>
>>> -#include <dirent.h>
>>> -#include <sys/prctl.h>
>>> -#include <signal.h>
>>> -#include <sched.h>
>>> -#include <unistd.h>
>>>   
>>>   #include "qemu/osdep.h"
>>> +#include <dirent.h>
>>> +#include <sys/prctl.h>
>>> +#include <sched.h>
>>> +
>>>    #include "qemu/async-teardown.h"
>>
>> This file has more changes.
> 
> I'm not sure I understand.
> 
> The patch does two related things:
> 
> 1. It puts qemu/osdep.h first.  The diff makes it look like we leave it
>     in place and move other stuff across, but that's the same.
> 
> 2. It deletes inclusions of headers qemu/osdep.h already includes:
> 
>      <stdlib.h>
>      <stdio.h>
>      <sys/types.h>
>      <signal.h>
>      <unistd.h>

Ah, the other files get this done in the "Drop duplicate #include" patch.
