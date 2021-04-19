Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1407533lfb;
        Mon, 19 Apr 2021 11:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Zl8ufLTI3ww0TFYRP+iogTR3xVZmzAhNysfzysVksvnvIdv5dmvmUs8+BBlcflLqpb3u
X-Received: by 2002:a02:662b:: with SMTP id k43mr17253051jac.139.1618856749881;
        Mon, 19 Apr 2021 11:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618856749; cv=none;
        d=google.com; s=arc-20160816;
        b=D6Nhg0YEyBjR7fnuQSyOtohvFL4+PgjXVwFWGiXVeAi4CumCoy9uR1Zl6i4hnHFIGg
         gcSnsLHFRyHobuFsRsN+JKm8mxS8yIg4tSP0hgjQX4z5NDzAPBAOCPuzxES9SVEzFk2V
         1f1e+sDYDDUHjGqu2+hUTF5n3qwAQAD5KH4vLhUptr7N/lpBCi4uhAOVxNy3+Kf7+dgH
         3b7zlNUz7D2beeAs7ftwHEDVYGF8BHBFjmE304uaDrg43NNqkPvY+0HcnYjpxMB2Ht0s
         OEd4hqy5XSRp9XUs5V+hJhpDY16DtJrVPrW+MLmiFHSQGilmzqA+75Q8DUS63QxYvFoy
         4prQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=P9JcEs8oySBw5uinY7JwsMWOr1xj+luiYwH7dH9G1q4=;
        b=jOFhQ74r7fpImPJIZVJQxIhL0W2bjrTsq+orJLIYwJY+YQ5+UCcUeURyU+ToP5tSc4
         fYJnqu8cXlgJh+1yAaWN5BFf0Imu+BCA96uYcDR5kJYTVHfxJTjPGSBJY4RhW6Ig++VS
         aA39amAJ5EC9JO2B9f2UBX4xpIwhy74uwtvuBN5ARmxJ/UJOy0cjpBAG82U/dg5m1/Jo
         WtjWoxsLsTqaxOX9oqEg85Fdq25imVXWaB/gtNSgfyWseDUJ7aR0DsbdomT9cb1oxu7j
         RT9k7r6Sh+TsI/EQmvbqsxvaDwBzWUWcvt/0SP7MbE6Is3NwLf+qZof38YzM1NC8JhoS
         EdqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zroldLjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si17391097ioj.4.2021.04.19.11.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 11:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zroldLjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYYaj-0006j5-6o
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 14:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYYZc-0006YE-DV
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 14:24:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYYZZ-0003nY-JS
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 14:24:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id p67so18814671pfp.10
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P9JcEs8oySBw5uinY7JwsMWOr1xj+luiYwH7dH9G1q4=;
 b=zroldLjJk7lpmkbl7J3Wo0vJq7CFxwx9S71EfTF5gyegbJZGrvLA+h4lWdPJc50NAw
 QbUh/IgpkQcY8FOJeBdiVR/pzO3f16KyV2r7uZQKmAckceR4gzw0Dzu2SRiQPtQM8AN/
 hEVl7uGk83+R0yqJSAWpYgXPFH1CTI8/mrLuKWRZmPf3O4xQBdsp7de8EQUkhIOhxwlx
 PylWFXvUai/9JDaGthF4LhjxhEtmdH63c0lnU3ue7ukdHBZCNqAS5s3Yr9Na1X1OqA2V
 +G/cIU+RBz8vpo13O6IrpmmQrkzxs60PuyoqdYJoEZvHbkC0dSoWy2zRnCsn74aidOQl
 ohZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9JcEs8oySBw5uinY7JwsMWOr1xj+luiYwH7dH9G1q4=;
 b=B4FkPW4PqXsLDKPQl196lg9cSigWd5D8n17mM5QSyIbm9iT+Fk5RiwoBLfzQN+Nx+7
 KCdMIGlbdBn7hrXMAeZ8FesfxkLFSZ+TD5cDLb0Y2utYAExuwRsWyIYkGoa6/F225vsR
 OWWWat3xrGHkLMvkzzJOj72Rg1gWSQVzDGpRUE0ryEV0gLkkNor3IDEjgo77wSQROD7j
 X6SfRYg4R4Ywo1Y9PxK4BdgNyG9cS8TnEgsTSjWFSuvzwXL/DOSOCjncgXZoQGQh8M5m
 jiCqGx2/sqFXeELyyxyn9TO5yN3f/DEOnB41dlImIqxuY2vSIFXlRFIPbFpUnhkSjS3h
 P1Tw==
X-Gm-Message-State: AOAM530RJ+SuMRrhqeG9QshHb1nubwR4LuOy20I2dsFY4xquCK3ZJBxw
 VSZgFM/5aWJ4CaFiWz7wpFWsEP2MulCWEA==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id
 k7-20020a056a001687b0290253f4174dbamr21097696pfc.5.1618856676134; 
 Mon, 19 Apr 2021 11:24:36 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id p126sm12726888pfb.32.2021.04.19.11.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 11:24:35 -0700 (PDT)
Subject: Re: [PATCH v4 06/30] target/arm: Move mode specific TB flags to
 tb->cs_base
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-7-richard.henderson@linaro.org>
 <CAFEAcA_fXNEJXKAnktMuZTRGngToaGqL6QQHk592VJzjRrnstQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b492c7ae-65d3-8763-42a4-6f91c4b5d435@linaro.org>
Date: Mon, 19 Apr 2021 11:24:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fXNEJXKAnktMuZTRGngToaGqL6QQHk592VJzjRrnstQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9yoFLcw3ntZ8

On 4/19/21 10:08 AM, Peter Maydell wrote:
> Don't you also need to make assert_hflags_rebuild_correctly()
> check flags2 now ?

Oops, yes.  Thanks.


r~
