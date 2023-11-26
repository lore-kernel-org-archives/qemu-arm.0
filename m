Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp648242ejt;
        Sun, 26 Nov 2023 15:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjYOVjG/k2bm6XQfCu+YFCvEyjib6pYxl3dV10Th9TKgQ5IRGJFJ+iKphUuC98o7GsYXkY
X-Received: by 2002:a05:622a:5506:b0:423:ac13:5564 with SMTP id fj6-20020a05622a550600b00423ac135564mr7444743qtb.27.1701042548162;
        Sun, 26 Nov 2023 15:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701042548; cv=none;
        d=google.com; s=arc-20160816;
        b=iJxTR+OB7ZZhLI9mox73rwBcUfY0XqNj2v/SzgsFD4G19A0UqDuTFSrcH9mviqNXLp
         X9JWqmaIdExVKMcwuJ125oiSfnazlMOek0YFvb3saFI7NRFdfqk+1aFLkX0NkvvVq3ZB
         jabZlZYj0m9grp6kmXkShGgjvM4WgNsgQ6JEmh8xC5rjY98OoKlL4eXihgaCogPzfBQv
         JDtm4ECgzILG2QQy37I6GsQbuBYtsgMAQ/jiyx4A+4yVxLWf9Gyo9cuDW1DaRPP5Kwq1
         iUgvZprEOOM8T8fBYLO0KSpXWx/dsmFfcCOCTQNCEk51e+BZ+XyVsH+WxtSZ+BiB1WN+
         d7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FbnrR726rByRQIiBcu2gh9kRjvyVp2tP/jXqpC6/BNw=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=xlI1/gMf8sUyDB9ZrcejkH6sM++Yop/ZWiXdxfulI1oHjh0hf0TFbeBnv+CNBdd2fk
         4ZjrcbYhG6HuzRXmkNCtPR8CsKWy6AyZXRikN9gGMpBNw4An2zHaAIijZETq2lgme8vE
         K29uPTlyPqaf81zUm4FyHcVl7l/sY0PAsdY8EPbIBNGHB0DCCF/hUse8IBCKgw/OaL5S
         VJs1IK+VdjEG75lSUachCeAXL+FGOWxxcCP25Vw3CvVs9GX986aW80hG98vZr4K9nGBl
         jhfFnrJmZfzgC7QOEHSzIpwRe/dq6xaQvAOEcHGPB1gU5q9LePr+rnXQgP8vUv5lrlWo
         3hRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MHHsmr6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05622a131300b0042374a3b289si8183589qtk.199.2023.11.26.15.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:49:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MHHsmr6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7Ort-0008Uq-QO; Sun, 26 Nov 2023 18:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Ors-0008UY-8y
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Orq-0003Sg-Ui
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701042529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbnrR726rByRQIiBcu2gh9kRjvyVp2tP/jXqpC6/BNw=;
 b=MHHsmr6FUGTks7UibjOEhO3tLlEiDEvSbzgv+11sIIaHHTmn/7xuWr2bXNtpJk9kHqyAco
 m6S4usk3+sgTfVpTXBeMrD9Low91yNN97ft46jr745iRPhQg8Z3yRnuUtcYlYOiODr5W/+
 shLCAcbFw5egXMQBVcHt4l3YKy9qLzg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-uYa2Yo47NwWEeOO7xkAQwA-1; Sun, 26 Nov 2023 18:48:48 -0500
X-MC-Unique: uYa2Yo47NwWEeOO7xkAQwA-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-285a0c1cd26so1745082a91.1
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701042527; x=1701647327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbnrR726rByRQIiBcu2gh9kRjvyVp2tP/jXqpC6/BNw=;
 b=g6+U96qmmcY4oUp1CXsTVWtm1N5cuzlkERSzyIy7cH3oVrEVWQJSPmEYxQSk/CEbwQ
 YOlhws5lSCt+3T3jJZ86HL09Rjl78aMe7ubUW3mKBg3piyRjjYREEWtqb4jg+ogn77FZ
 2IllqPuwK5AhtBh+EBMksY53G51I6rX2d+JaL+fXjRgZJKfgGR7tmmHiN1T71QqnRwrY
 GntJz/HPPNZgD2G9NKcVkDapIALtH6JoY3DzDdiPowzwYS19mnq7lVaSbvjIIZ8lDdsK
 Tb+oWghsBZL5fj9W/rC1SoReWK/y2T9M0XA9bMAVl3nfV+r2vndYvz6JVNGILviYPEPo
 aJww==
X-Gm-Message-State: AOJu0YyCcpDgZ0pFr0kLy2vcwuXE2aJwBpTup1H2Wg9qVVle0KjtWQ6O
 XtHIQ4GuXUih9nR7sKlzZeKbdmkyn0apnqBxNAJY7FZOkt5XipDQ19JWku3XcG0uMyH/1wAbVBZ
 sV3rmb0X252ek
X-Received: by 2002:a17:90b:1d09:b0:281:d84:a97e with SMTP id
 on9-20020a17090b1d0900b002810d84a97emr13711162pjb.2.1701042526921; 
 Sun, 26 Nov 2023 15:48:46 -0800 (PST)
X-Received: by 2002:a17:90b:1d09:b0:281:d84:a97e with SMTP id
 on9-20020a17090b1d0900b002810d84a97emr13711150pjb.2.1701042526651; 
 Sun, 26 Nov 2023 15:48:46 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902748700b001c5dea67c26sm6852867pll.233.2023.11.26.15.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:48:46 -0800 (PST)
Message-ID: <39eea212-80da-4e7e-ad43-92070f1af035@redhat.com>
Date: Mon, 27 Nov 2023 10:48:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] target/arm/kvm: Move kvm_arm_copy_hw_debug_data and
 unexport
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-6-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-6-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8VZ6DvQJQYHl

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 10 ----------
>   target/arm/kvm.c     | 24 ++++++++++++++++++++++++
>   target/arm/kvm64.c   | 17 -----------------
>   3 files changed, 24 insertions(+), 27 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

