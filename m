Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2303722ejc;
        Wed, 27 Sep 2023 21:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo5QnbHhuyzNIVr2NPxmkT0DxlLGLXhRrg2ZYLEdybXt6kFSMMtLDc/UCIIY7cqIplBAbV
X-Received: by 2002:a0c:aa08:0:b0:647:42ac:d7f2 with SMTP id d8-20020a0caa08000000b0064742acd7f2mr114158qvb.63.1695876321809;
        Wed, 27 Sep 2023 21:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695876321; cv=none;
        d=google.com; s=arc-20160816;
        b=yoGg4tLkW9pHhtQggV5+XjNDgrQeNukSNA4Q7HtOHiLGhxALjUR/PAhhJzjOXibvQi
         zC/c6P9EzPl7vM8X+5cV3OQgog0CofyMiq9gWqFKafSi6OJn9eHrnSjVD2dBFCwLPSoV
         KIUaom+a8QipdSmMDVtdzFdpqzmW133WvGq+3vW2DwXWcMlw2WKE14MkW+9ZGGqLdVYx
         z3PbTnOCdNlgDa1UOigxl7u4xgYVr+FL5BOFSk9uIXM8gl3uMpz17U4tKsOBK4J9CqIB
         GVyAXLceFGjjWwDDHnzNvSL1Ch/7ZzijxAgrePch86Lx025JvKTRk0fJfhn7lOy3EBoZ
         uW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=thDvK5Hgj2T2cNkzShCy/Wh0ECz471UVKJZt73urqsQ=;
        fh=GUPjxW4fQaT3DFhTiIvwAKlXuS5cVVc6mPehwpozP2E=;
        b=Oc9PZOSWLGXe76SkzBpq5Q4tg/0OkeetPG0uPsBGg8zjiy9TJ7oyVkS9xn7kh5H5HC
         zejBmoNQMcvl8fwh3tz9yOqsyirOwB9fHFX6oovKTJoDQgPM5fgnKcaPK8LeQhufYrM8
         4F0081+edah03kM4JXV8bLXO8Hyz40RcX7eu3/TSEnmy9lLfUPOJ1XGWifG0nawDAl0X
         mNhay+ylcxGo9rUaL/gXcP2jfp2o3TrEw0+GrlFdFccsbcW0nXoiQKKAl6pV6V679ouN
         wNKsWzJ4fzLv882ImP+zDTmKZOoiGGSlQv5HBpeSsRmjMcOxMFtSWgIPq2UDjtmbSqk8
         aL2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mvv57YNB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a05620a280400b00773bb585660si8699184qkp.348.2023.09.27.21.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 21:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mvv57YNB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlita-0000MZ-I0; Thu, 28 Sep 2023 00:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qlitY-0000Ly-2r
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qlitV-0005xW-9B
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695876296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thDvK5Hgj2T2cNkzShCy/Wh0ECz471UVKJZt73urqsQ=;
 b=Mvv57YNBTei1Edy8KSOla9zE3BfBq3ha5HTpBaq58xkrKx2SFMmJgaratipySh8gxd1dnN
 e0DuxOGjdJybym1W6qd8ONlJ2k5NGgTajbQBnYmzW7nRo2HoTeiP2DyHbPeQ9ycqc93qJx
 IyUEHJDYVY6Vds3M5DJ6cMrbcqP3MeQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-58m3nuqOMz2CrcXMvqP8tw-1; Thu, 28 Sep 2023 00:44:55 -0400
X-MC-Unique: 58m3nuqOMz2CrcXMvqP8tw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50420b22ff4so19365303e87.1
 for <qemu-arm@nongnu.org>; Wed, 27 Sep 2023 21:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695876293; x=1696481093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thDvK5Hgj2T2cNkzShCy/Wh0ECz471UVKJZt73urqsQ=;
 b=XIuwwXOtSZAWszOBYTK/L1wR4jDiZmNmApFQcpyrmjgStycgxZ/pLW9Dw5yn71ui2d
 wBYE2Zq7TKRLmWtRWtLB+ChynN8AVOBFqwfrJsd5+uDL9/NiT7eSNjoMCWywyD2cigmE
 Gp1PcBJY/uQxlgf1yeJWS2vRjyudjQI/+jV90jL+8HDiSE/KsFMOcU2t1ezpXqtfZz8a
 Bs+2YRZl0dtzWWmd90rvC+iUgFtyqm71KNF9TwEU8bNc6zdkgk68IMAUwcQ5oJE/lset
 YgqDPOebAospcL47u+rHdJ8nNmkvpL4IfvPAxK/ouQ3j+eR1jx59Wn6yY4HMhJqWmala
 0PMw==
X-Gm-Message-State: AOJu0Yx6iZgPMQl/i4BJQ2oCum0z7nVINYFi0zAMinQl5Rt+AE/LcLrm
 MT2W0V52j4zyYfmNINQkik9c7s71ZbPZxOlJ0yepsuivNKiZseDSnt/26jKlCOD9v7ILCt+usSx
 Meq3GdC0DswAz
X-Received: by 2002:a05:6512:2521:b0:4f8:6abe:5249 with SMTP id
 be33-20020a056512252100b004f86abe5249mr117476lfb.3.1695876293591; 
 Wed, 27 Sep 2023 21:44:53 -0700 (PDT)
X-Received: by 2002:a05:6512:2521:b0:4f8:6abe:5249 with SMTP id
 be33-20020a056512252100b004f86abe5249mr117463lfb.3.1695876293240; 
 Wed, 27 Sep 2023 21:44:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-123.web.vodafone.de.
 [109.43.177.123]) by smtp.gmail.com with ESMTPSA id
 e9-20020a50ec89000000b0052c9f1d3cfasm9041946edr.84.2023.09.27.21.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 21:44:52 -0700 (PDT)
Message-ID: <e5ddb46e-e677-3fc8-4f32-0f59e85eb304@redhat.com>
Date: Thu, 28 Sep 2023 06:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] tests/qtest: Fix npcm7xx_timer-test.c flaky test
To: Chris Rauer <crauer@google.com>, kfting@nuvoton.com, wuhaotsh@google.com, 
 lvivier@redhat.com, pbonzini@redhat.com, stefanha@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230928034505.255480-1-crauer@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230928034505.255480-1-crauer@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: urBugQ/6KbSq

On 28/09/2023 05.45, Chris Rauer wrote:

Could you please add a proper patch description how this is fixing the issue?

  Thanks,
   Thomas


> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1897
> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>   tests/qtest/npcm7xx_timer-test.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
> index 43711049ca..58f58c2f71 100644
> --- a/tests/qtest/npcm7xx_timer-test.c
> +++ b/tests/qtest/npcm7xx_timer-test.c
> @@ -465,6 +465,7 @@ static void test_periodic_interrupt(gconstpointer test_data)
>       int i;
>   
>       tim_reset(td);
> +    clock_step_next();
>   
>       tim_write_ticr(td, count);
>       tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));

