Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1209566ejb;
        Tue, 20 Feb 2024 02:41:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXamSbDHulukf9CjM9P7BPZf9B+Xrahgobu78ckkZFNBIIvPcTAVl+CIyRZQMkfSkXat48VpsEnwRQvJd2wfrouMHBPxtM3
X-Google-Smtp-Source: AGHT+IG6J9y8Y5HFqBZRLo797SAeA+xvpJDw6WoIh4p+zCtZCEvmKR1+KLGahLMthFabzVLvyvGG
X-Received: by 2002:ac8:5bc7:0:b0:42e:21ed:43ec with SMTP id b7-20020ac85bc7000000b0042e21ed43ecmr3118531qtb.23.1708425702657;
        Tue, 20 Feb 2024 02:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708425702; cv=none;
        d=google.com; s=arc-20160816;
        b=ngB4DiKJwzvezzEjule6AiasuN9VJ50ZUoTlTod/CBCll/NMGbK3J3roiP8smzr89m
         nYTa7TntxQhEDqFXSMeGUdGZNb+s1MKR7S6XukNUkRrSjVLN7F9I5utw1pXAfJr8pBC9
         j4X+2oEEhU0zUkMC9j/YWqbNMn/3C/H+W0YwRNOguezTsKh6E4d31LX+nF92UdNRybk7
         gKSFazm3qbkIg9jecu9JsJaww4WQVavB6hv2Ymxbu1aWHZqMqBx4sdbMU4Q5NSSS1FPM
         hWLYTOeaKU4WcVn/ShwqwvKf6uxkzTGCeVCHZp1wMoZ3DplyNBfB/DagMJF++mjEUKOY
         IIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=tS28AKmYaQCY4E+wjJOUAKHL1MXT7cM3NTOL2MiU4+I=;
        fh=TtlmLaVN6xWSEyK4RrzoUJiiSocvJe30p0W4BLgDXDg=;
        b=l1ERpbiBY5zxvsUrSvl1yh+LqutD4bKmMQcS6q88t1H+oZXDDrb2bljC+YRTjFBbyK
         HhqJW4e8nH9Gu0iGxlGj4a0fnlYT2fdEhTQ0f0PaZ7xAxckttAA0yTTXEntgNdPmlVEn
         xS3lkTmE6aVSXPNj2I+0h+3ihcPyc1z8m+7i6/w6u6VxyxqxfpoF55PZT8VlfVhgeW8I
         3N2Lwhi/96GTaqg7LC9/bIvWK5lnZWARNR7HhZrn69FOf08aoUVI7QCvqSaDm5FDwGJp
         grmNBY/6m4qTfN79b9gjsuspP3VIDkG4hqmKMyxqm6m5NkogpXMquHK7HoyjHdJpM7iK
         4O8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a/YF/1I5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34-20020a05622a18a200b0042e2d462880si355076qtc.425.2024.02.20.02.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Feb 2024 02:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a/YF/1I5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcNZ8-00057s-2I; Tue, 20 Feb 2024 05:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rcNZ6-00057S-JJ
 for qemu-devel@nongnu.org; Tue, 20 Feb 2024 05:41:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rcNZ5-0001y5-1S
 for qemu-devel@nongnu.org; Tue, 20 Feb 2024 05:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708425690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tS28AKmYaQCY4E+wjJOUAKHL1MXT7cM3NTOL2MiU4+I=;
 b=a/YF/1I5b53+EzO2j1eZ24Eczu7AVYjc8LVEa4mmkRTAPqSFJDgTkx22BW9AjbSmSUA6IN
 ivltexAQ5qG1C2xua09VRIEcIa2HJ4XwwEJX/V5UI6ifIqAHs4j+YB+Zu/oXTd2mB6hVbj
 ZCV/VoWRmIc5Os0Hl4M7ETJhuc+rJ/E=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-72J6aYuPO2eudVNIUPYR7Q-1; Tue, 20 Feb 2024 05:41:28 -0500
X-MC-Unique: 72J6aYuPO2eudVNIUPYR7Q-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3c15bef104bso2403228b6e.1
 for <qemu-devel@nongnu.org>; Tue, 20 Feb 2024 02:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708425687; x=1709030487;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tS28AKmYaQCY4E+wjJOUAKHL1MXT7cM3NTOL2MiU4+I=;
 b=Pg331QnI1bleRTTSko89Cp6S8SVHZbnNM/WA/036+1VIFYRTcrWe5LK4qfVeGSA0Hj
 FIV2TxYHXEM0CbY+bliNNx/NDRHS719VSElf/E8NAB5omv1UTNNqFbjxnzLqiKBrc2iR
 NSrK1IzWTRCKZ+5nr1kf3Pj2VaaQ+d/dyloOxlqQCYuDuzX10n1+M2fJfGATSGzDD/0i
 UsmqXqINKVI+QaE8yPa9mfZ4AWVhtcSOGT9MikzpQM60CzKrz5G1dTTtyJu12jr6RzXc
 MB4vp88X1zgFWqqMXaDXj8mbHk9qpBDAMGABuODFKMoSJhdeikDo53wRQSE3nFcolfY3
 Wiuw==
X-Gm-Message-State: AOJu0YwX2CGoPWsUFGF816WH5ieADBuNjRJKxcB/4NtS+zIjTKj1eUrH
 pIAdE3AYKf9zDivzi25ygpB0ULHzC9yRZeUlGH9itXm46GnoMgiSogdGUT9n0QrUTZvjc3XV2/P
 kiFuk0j5nwEdi+goJR+ffVefGGg4tZh4ySfrFcwB2rdlnX3hT/wHU
X-Received: by 2002:a05:6808:3092:b0:3c1:5f15:2c74 with SMTP id
 bl18-20020a056808309200b003c15f152c74mr4366917oib.40.1708425687793; 
 Tue, 20 Feb 2024 02:41:27 -0800 (PST)
X-Received: by 2002:a05:6808:3092:b0:3c1:5f15:2c74 with SMTP id
 bl18-20020a056808309200b003c15f152c74mr4366900oib.40.1708425687445; 
 Tue, 20 Feb 2024 02:41:27 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-100.web.vodafone.de.
 [109.43.178.100]) by smtp.gmail.com with ESMTPSA id
 ld11-20020a056214418b00b00686ac3c9db4sm4251417qvb.98.2024.02.20.02.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:41:27 -0800 (PST)
Message-ID: <ac390641-2588-4b9a-8d77-91753f79e851@redhat.com>
Date: Tue, 20 Feb 2024 11:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/qtest: Add testcase for BCM2835 BSC
Content-Language: en-US
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20240219225958.2421873-1-rayhan.faizel@gmail.com>
 <20240219225958.2421873-4-rayhan.faizel@gmail.com>
 <e61e02ee-e181-4ea3-b079-638b50889742@redhat.com>
 <CAKUh+Qf5=kgUC3H9uWy6fAxB=76Tai28D6hPQ=qMwxc92YpNyA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAKUh+Qf5=kgUC3H9uWy6fAxB=76Tai28D6hPQ=qMwxc92YpNyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.072,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xZkwc/Cy1z0M

On 20/02/2024 11.30, Rayhan Faizel wrote:
> Hi Thomas,
> 
> Do you want me to add an SPDX line to the other two commits or will just 
> this one suffice?

I think it wouldn't hurt to add them to the new files there, too, but 
there's no rule in the QEMU development process that you have to do it, so 
it's up to you.

  Thomas


