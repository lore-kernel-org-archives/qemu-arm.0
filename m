Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1453335ejb;
        Mon, 4 Sep 2023 09:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVlW7hix0A9SSRdk/UNIZw8tve/YZkE0RN/tQgBP9LYW5xhQpYaxnBsZHBCWPf4t3KMgUO
X-Received: by 2002:a05:6102:530:b0:44e:d415:76a3 with SMTP id m16-20020a056102053000b0044ed41576a3mr7976893vsa.11.1693845029007;
        Mon, 04 Sep 2023 09:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693845028; cv=none;
        d=google.com; s=arc-20160816;
        b=XVBRAX3Z0NXFDbJpOW8uMxXmN6v64SL5RKzNTPnK3znnSoJm1cTlB//Bc63PJSToki
         ca/OzY07FctBcP13YgTFwj+ML8B9EEKGecoPAdK2RX8HuPnuYfnXx2ghz14LlilE8jLm
         nJNXN2Sm3VfyBGa3RCZF40ODdGtODhDAPfN6vHwX/XJUZ5bUJ0XVhms+Hqj6v12yYqx5
         Y+aqX/aXl3hI1+3VPaYriiaZYOhC66M/vqo9DXIsJqp3qUDzcI12gL1eGIlA4R39erxC
         RUQ3HVSkRqm/DeIxmqeYsMCP7KS4mzdpCumquUquulTQ0s5+XZkBtPkfZCXojiutNvfX
         btKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NrnqPN7398ty7yLv/sczqA06bZUMw0IUliFG9AigZvE=;
        fh=ybSViRhqpP3DlVSewutOJOkWppnZicAzDlkFmRUROvU=;
        b=zLlaQuKVPpAEt+0womuEmtVb32LVMiTKErWxq35MeMddNZS2DYD5hKJar9GR+GGxiJ
         07sABHLGjSvZHdev772sYoe1b51kACjx9xIwCOWGJmCF/Rnr6ERbD8Ub731LGzV5AD03
         IJtcPwWWgIz9ChdgbavzB6JbXAax8kSnQgaelzsuY7JP/6HG15oQT70wQLhbkVtMltTo
         JDpv005beTKybpYB86LuZ5IP2Z4LqvB1zootfMBiYl/Qw9qKo8VYfNGSVCg5nYoz8VsL
         sYiRqcOPV3IksQ4xefMEeCccCa9sAqv+EwsbTb2kNk4wsu6PGgI2N+WF4kz1BXHBwy9t
         KImg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmRE3eH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a0cb549000000b006408e52cad5si6734295qvd.485.2023.09.04.09.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmRE3eH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCSs-0005Hs-9L; Mon, 04 Sep 2023 12:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCSV-0004VL-7I
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:29:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCSQ-0002Wo-OE
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:29:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso251960766b.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844985; x=1694449785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrnqPN7398ty7yLv/sczqA06bZUMw0IUliFG9AigZvE=;
 b=FmRE3eH2KFpWiokgzvAk77PYYwQZQNy07SF5jglpmnj7DLIEWNe4+4FUo84KJK/L5G
 +vcqniDcx2X2iGZN5P5ADkHNHfPVeeJey/IZbnO14T4zEBcXW5waqe8OkMDLIXplfRNK
 GM7eUNZJduq0G+z5yeoI4uawZYaSF43iRVTPMFxD1QZAFBn43cvVjLtQ/UxvwW81SLZj
 JE35GzlH1nFDGbc7ywLK4ZD61QI3tBqZsLAHOByYCAHHxARsFJI0NO3ImRfWMubnbcRF
 j+OlUUSKVoKrNJPqfScZAjZ3q8NMMQf6na8bjPWSPll2z9oBmZJiPVuOVTAqFAXP/lAu
 qoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844985; x=1694449785;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrnqPN7398ty7yLv/sczqA06bZUMw0IUliFG9AigZvE=;
 b=dLQDxxuhHrpp/Fa/0QAERhrZiAEsCgSfVKDpRX2sG4r2YQFGWko0VCz3Ep40k+z49X
 d397iMEJfCiuhtbJRqH3+1VDmmO0JriuvD1+jcV4jWErwaZd6XfjB1qUXR97yY/Xe9Ry
 PlLJL1d05NnkkKgU4x+TWoZnqLNYHlIcCgpEXBU6oo6A6UJ4bWnM9OBfEHR2bx+/k+fs
 v6pui7en+DzdIMDwSieTF0KOQofVq42lE8pMLPYNqJJ+bQ1M+5YmniMKh/steFTZ+YQ+
 T2wfN8o4EPl93B1xca/5Sn4fAabe2o5LkNp6iPOGm1ogUlcM5Y5kHFJxaIz9+DEZmxbK
 03ig==
X-Gm-Message-State: AOJu0YxhlotgqKpX6X1gg20hOxP6JFDZ2zwFyw9BCL3YuhDZgzmCyrXw
 4pzcsJfaXrT9p91aUqgRruI/YQ==
X-Received: by 2002:a17:906:189:b0:9a2:1df2:8e08 with SMTP id
 9-20020a170906018900b009a21df28e08mr7542096ejb.45.1693844984917; 
 Mon, 04 Sep 2023 09:29:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 ov22-20020a170906fc1600b00992c92af6f4sm6489916ejb.144.2023.09.04.09.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 09:29:44 -0700 (PDT)
Message-ID: <81b122d8-6653-f293-45cf-7e68762e7dd4@linaro.org>
Date: Mon, 4 Sep 2023 18:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 16/22] crypto/cipher-gnutls.c: Clean up local variable
 shadowing
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-17-philmd@linaro.org> <ZPYFfwYj6YgSf6Nb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZPYFfwYj6YgSf6Nb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: m1PX9HmphD+B

On 4/9/23 18:27, Daniel P. Berrangé wrote:
> On Mon, Sep 04, 2023 at 06:12:28PM +0200, Philippe Mathieu-Daudé wrote:
>> Fix:
>>
>>    In file included from crypto/cipher.c:140:
>>    crypto/cipher-gnutls.c.inc: In function ‘qcrypto_gnutls_cipher_encrypt’:
>>    crypto/cipher-gnutls.c.inc:116:17: warning: declaration of ‘err’ shadows a previous local [-Wshadow=compatible-local]
>>      116 |             int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
>>          |                 ^~~
>>    crypto/cipher-gnutls.c.inc:94:9: note: shadowed declaration is here
>>       94 |     int err;
>>          |         ^~~
>>         ---
>>
>>    crypto/cipher-gnutls.c.inc: In function ‘qcrypto_gnutls_cipher_decrypt’:
>>    crypto/cipher-gnutls.c.inc:177:17: warning: declaration of ‘err’ shadows a previous local [-Wshadow=compatible-local]
>>      177 |             int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
>>          |                 ^~~
>>    crypto/cipher-gnutls.c.inc:154:9: note: shadowed declaration is here
>>      154 |     int err;
>>          |         ^~~
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   crypto/cipher-gnutls.c.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> and if you want to include it in general pull request

Sure,

> Acked-by: Daniel P. Berrangé <berrange@redhat.com>

Thank you!

