Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2119475ejc;
        Mon, 16 Jan 2023 23:21:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxgktJ4bqDayuVMRYfpY/GlI1k5HoNQa6HL+A3QgvrR2WO9XwTUArJVrCDK+VmeoptJgtG
X-Received: by 2002:a17:907:75cf:b0:7aa:76a:fb3 with SMTP id jl15-20020a17090775cf00b007aa076a0fb3mr1679788ejc.66.1673940116818;
        Mon, 16 Jan 2023 23:21:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673940116; cv=none;
        d=google.com; s=arc-20160816;
        b=eQfyJszKLVAKvlz1AnK4VPTpE+QiODbAbe1lYGzcAwPZYUtgjDPr9dgHIK7EUMnRb4
         a4b/h0zLHq/4urZXZTf2W5GNYHCpgaydN6J+s9dEpsFj8YGEEHvQW0TO9R8CwVG8ZKlb
         +XoCH6aFgFzZC9e1n+V+MoCD+CW0mNSt1r6wU1n6UOGXPPn9EQrbV43fYLJ8D94g/uxB
         f5SEILleb1k2GjfVYHIYPTN58e8eV9Sr92q3Wh6JEockJhmlvM5Fgi/ONQRLwGGiExku
         WijzyVqaJka4yT4hneYnEuW2/7BDr9jJM0INYSJm+dbXlwjtIeoV1HRGv3zVnHtAso7J
         Fe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=IYK/nQC07kIXJuVOxh4RJkITmazo+pChDR0p2flp/O4=;
        b=Wzi1qGEmKK7GH/RhyYBz/gRRD1QN4nfIE3lw63BBhXb/qeXy+dTIFPlUThUnl9BsTj
         aChlwWoswMTDHvhUAwIE7sDOvHl6z2j5sLeYRrae8Czeeb7VB6diIPvraJ7Kb0vx1lSX
         ytGaUi4++wW8JqfdRvhoFOaQGf0Qeh8JHFDFxXb2PQnr49awhejE9dws4v9Gq9X7bTkK
         D/c7KAQyYX5CMdDXCsRRcUByv4WFx5YLpeC92Ot9JRjA/ZeWLSzxBNdN7gd3gkuQ9h+e
         w/7IG6JCYkO3iyKEO6E/m+SquDOFSxFqVMhg/PXQBX2Y3jwGiDtR4rJOEDmMRvCBGEUi
         czQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ecuKJ/Xm";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id di6-20020a170906730600b00857c01c6b3fsi24319144ejc.164.2023.01.16.23.21.56;
        Mon, 16 Jan 2023 23:21:56 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ecuKJ/Xm";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbjAQHVy (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Tue, 17 Jan 2023 02:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbjAQHVu (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 17 Jan 2023 02:21:50 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C9022A38
        for <kvm@vger.kernel.org>; Mon, 16 Jan 2023 23:21:49 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d2so9468209wrp.8
        for <kvm@vger.kernel.org>; Mon, 16 Jan 2023 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYK/nQC07kIXJuVOxh4RJkITmazo+pChDR0p2flp/O4=;
        b=ecuKJ/XmVYYqvlJwSjcrMFqGGGT0Sv43bs2oPlN/IRlABuZn7yGA5rpllK+ctCj4GF
         GzMKSYZcFxC7bgOI1UoFecqosdJLkUUhmqdRMllqBR8Mc+vEuNgd0qAIqkq6gNihodjp
         C9amJbE6XPO/uo7KVLxjKBPHwpMYaihQGh5VKT0Unu4o9992meTjFaQvaAj0ymTZakg5
         CcdEia3M3n7k6C20Q4E//NpeiU3bu67Lz1Lzs0YbfyBd1YvnILWUP5A69jCsSP33GR+2
         drTFF3ot/MXUraeo/Pysnos1wvx8dpFKfQFrrh35b64eYICKfPfsrMfL6h7IccEosAuP
         +JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYK/nQC07kIXJuVOxh4RJkITmazo+pChDR0p2flp/O4=;
        b=ZbYHIfT+LqkgotgdlemkdeGwIHQclGRwU0sZ/jJ7w0J381UxF0e+AmS5nwXiEyiiMS
         l5L26+KFvHRLQnIiyTMBXWGkGWN34YR2j3K5TH5dxH0X3c1YpF7Se7HcEF422QVtnzCY
         hKbfQkKuWIlDbxHXBr4l+33NAh7Fvu7yX3AAOEo61h8qrKMsDm+qd4VgGpeOZdKgjHrU
         TLNjVv56Q56UrbUKvvKkBxDJ49ZF23ij7VFatxyB/OfGnFEtXb5tCbVfevvBsi+3xSJg
         lctRUx7dKLU67woUOf3GiQijkOIgw6333yHjr6zF+OilGy3UIL7j7pWfC2YJmuukMNvD
         +N+w==
X-Gm-Message-State: AFqh2krAzr1baOcBGeSIXSxcW9wAO+HLpdQZMVx+eyyPYNn7mF2mufrh
        c9mlITa3nOV+rzRjc8526DOD7A==
X-Received: by 2002:adf:fc0f:0:b0:2bc:7ec3:8a8 with SMTP id i15-20020adffc0f000000b002bc7ec308a8mr1917902wrr.44.1673940107978;
        Mon, 16 Jan 2023 23:21:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id az35-20020a05600c602300b003dafb0c8dfbsm6889603wmb.14.2023.01.16.23.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 23:21:47 -0800 (PST)
Message-ID: <2dc89f14-d38b-2220-64ff-d3480d85057e@linaro.org>
Date:   Tue, 17 Jan 2023 08:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/2] qtests/arm: add some mte tests
Content-Language: en-US
To:     Cornelia Huck <cohuck@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-3-cohuck@redhat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111161317.52250-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8zVlC2M8OLlP

On 11/1/23 17:13, Cornelia Huck wrote:
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
