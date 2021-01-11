Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3083248lfq;
        Mon, 11 Jan 2021 15:54:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZiWqwAcOjujG0lh7W4NydNyjW3OxhBefy2EbT4w45B/tKkQGO+EOBjZwjsfEKr/0PUm9y
X-Received: by 2002:a25:3d81:: with SMTP id k123mr2952625yba.430.1610409297300;
        Mon, 11 Jan 2021 15:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409297; cv=none;
        d=google.com; s=arc-20160816;
        b=P3EoLehL0u3a3/Gon+19i/uU/r/vlizzO6Zqd4nL/S6fdiGQRrKpYx4bTqNjxwg/dA
         lTL8JWd/Xvkh1mG8aY2g3ZapPdqanekV7STmMViYMdLZHLMfCmhdTmBlVokK+NO7INZX
         cjudP3g1kmBp5OdrK1FkqHGOw2NPKhoVCZAOaB2qdr4xmXrUqEID7AWdFIIM99Yz+M6V
         soa5AcifhdhE+vA5Rm50hyrQElzi9OR13u7+LfKMxPbcvs8AfNsWDAW+r4MRueSV2K4m
         j81QPsh7e2NK98GU01q5TMKHQD4nDBkBftZZD3DkQQg+bHON7VqtHzqU+YJVDcyytzZh
         8knA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KP9sn3FFz6LwmXS4mve5uxiwRAGtey2SxLi8HC8Ezfc=;
        b=mDWoytO01Eno2mkpB7zXqqWizy4HuG++zrI6blopC2J0REVZRqFCcIoHtGOxzMnFM0
         mkv7/EkYjXFom4VMqJ+2JMmRs7L3M2BtuTTKqpK1n3fn761tVpf8rln4WhQ3iavcWJL4
         qiJdh+79d7uMQqVIU75ZnhEy8YRCVLmDABOkGZ3we0b/IHqxeVfUA+iFceg4q9Q5f3pt
         sMM8o59m1FNQLmkC/IlqU/d/UbLzZX9e9vnsWMLKu5V2+naIUa5+2jmJHmfDWMjTgHtE
         gJszApLuQ52ZiC6j8ltK4OHXZjekuMIQnj/hDqBHbVdswTSpcz4mNceVX9GHnug35Orp
         QcgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ASpKcEYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si1350377ybc.14.2021.01.11.15.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 15:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ASpKcEYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz71U-0003b8-Nz
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 18:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz71I-0003aI-5Z
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:54:45 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz71D-00037t-UM
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:54:43 -0500
Received: by mail-pl1-x633.google.com with SMTP id t6so401096plq.1
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KP9sn3FFz6LwmXS4mve5uxiwRAGtey2SxLi8HC8Ezfc=;
 b=ASpKcEYwWgwtkUAj9hBNbhXC9BcsuZnDLQlNPEEiKVdSQxOtrldqx4q/0PwcIm0rJV
 yW/kDz0cyqtpUABuPdGX7qgANctJHlz7SqG/9sRhNuLuEplg4SpnAgk3lFlUp0g6khot
 SOHUMy8HuhjolXgRa8q4Gio5E+ZQflbx16m2SY8R5RFsxr1CGLpD4hXXiPbMDd/XsRhM
 FbB6paRsGsiCoOvpcnjQIwZMK9RvLNHrF3FsyO39fMbd12Scx6X3Pb4G++9fq15gc+RN
 Tgt59iPmlTuJ+RYwAeT+93i6qB0nV4VTjv9r+7XGQsJoj9UBYSAW3UdwSdUXpwsBo0w3
 j5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KP9sn3FFz6LwmXS4mve5uxiwRAGtey2SxLi8HC8Ezfc=;
 b=Fn8YsjnDlQaPIs4eDsVVWKL/rd7O5wIqBsRaJwqwgBNhurfH59pbr4vHB3AmfIJ9/z
 06YkaHZV05Onvyd6XSwvcrI9WhSb0wSp6lSAyB05NVSjv6CrrT4hB7HX/rgPErtqndhM
 EhfH0KIoDWw5C+DG7khE9iC+q4I7zjZjzHU/ysTJYrMvtuJrqB8nOZ9AT1/+cUIKMMoD
 jR9cbqJi3fOBwWy3cVmGify6AIGtwvmr2qzdOa4O/u4MSU7Fl1aNPON89R7TT4qGViB9
 w5lH2Z2f9X57jkgEDGFUwYbJtmBIhqa8GCkcrx2rUUyJ4ywhQFnWNs6cgg1TIUtuXb+Z
 2VDQ==
X-Gm-Message-State: AOAM530wWssJiVvVaUnjcBRSRxYaW+n71MWVcBPszLA1S440lfSShMhB
 OF/1Tvbl2tZixjEhBHRMsy/gyUnpinB9+g==
X-Received: by 2002:a17:902:b213:b029:db:3a3e:d8ad with SMTP id
 t19-20020a170902b213b02900db3a3ed8admr2185277plr.73.1610409277592; 
 Mon, 11 Jan 2021 15:54:37 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b11sm543050pjl.41.2021.01.11.15.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 15:54:37 -0800 (PST)
Subject: Re: [PATCH v6 2/3] target/arm: Add cpu properties to control pauth
To: Andrew Jones <drjones@redhat.com>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
 <20210111231108.461088-3-richard.henderson@linaro.org>
 <20210111235310.bbeis2rh25kud2kz@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80b2ff9f-3614-07d1-88a2-686854d55555@linaro.org>
Date: Mon, 11 Jan 2021 13:54:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111235310.bbeis2rh25kud2kz@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f8pmoZOKR7wY

On 1/11/21 1:53 PM, Andrew Jones wrote:
>> -    "kvm-no-adjvtime", "kvm-steal-time",
>> +    "kvm-no-adjvtime",
> Looks like a rebase error; kvm-steal-time is getting dropped.
> 

Whoops.  Will fix.


r~
