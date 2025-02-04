Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp406660njb;
        Tue, 4 Feb 2025 10:28:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYHTWjFsyie8m81h1OpLUxDzY8/54zDjBkA54uAfl6eACI5wXm6ZDsrKkkU+9gxLdO+j7zZWOR9Fbrqw==@linaro.org
X-Google-Smtp-Source: AGHT+IEE95uXJt+VoDgZhkkSzdePBVhSaG8qXimBXx9bh5uScPXfV5vjE0/NrF7dWpZy41CAbRJe
X-Received: by 2002:a05:6102:dce:b0:4b2:bcea:dce2 with SMTP id ada2fe7eead31-4ba478986a2mr131823137.10.1738693696291;
        Tue, 04 Feb 2025 10:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693696; cv=none;
        d=google.com; s=arc-20240605;
        b=XvXC2eFI6CwqUhTSVMQPmjCH3+hg08dSATPWeNRMiU2jhH2IeWPyjwfLt8h56qkGot
         mQynaqbGCa+RAnZu4BnUaQjqhXeZGYjVouaClHotuF/s301RiGFtYws4awx8xG768Eat
         B8rG9k3pLSVR87mOLeuoxL4sszWQ7rjm9QCV9i4G06IIPVKcJTuczjqt2l7GwztKMqIh
         3tdijBddC1xH+13t1yq31dghTXIkdasNDnmrm6FWZFiqG88S4p55/igULJGsDG9bOnab
         4Z3RUMrfX1HV5POAWXfJjRTD075J4rTMcKB4RMcFuOivZBhgGW/l6mOgdSw10miD2Gqr
         doHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=WXp4akxJ/cyQ8iMEiQOrjKd1+VRa0ubwv6rlUgw6HGQ=;
        fh=x56Hdbt6TDQf+G00W5S7XP9p0ttSrS0QPv2iNuqefZ8=;
        b=Xdie3FIWohGJ90dDD0BaBd36GqPetQ3/+HaTJbnjiP7CLMSp6bEZb9hgmJUEw0pO6y
         w/hae45K5euQoDfYwBRVmHoGB4HP26lSEuyn6gMy8Qj9NnFqOX5lC02Un+RvfjGXbR5P
         bxaJ+dJNhHQl1Z/r1ZtW710UnkH7fruAmh1eJJojPe7MxmF/MD08VX40VImDOuP0kB9o
         g5Des5KDob4XowhqkmIKnTstHbusq6uYv0LlLATWS73IPbJhf01CCOlGjg0jgF0loksE
         43pB/iVgitWn2tnTZVVbaPtUg15Q/D0rie2mulRNvu7O68TPVBP6tg+QAqAWpRfFvkVq
         uMIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LEQpgEHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b9baab4a48si2497395137.202.2025.02.04.10.28.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:28:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LEQpgEHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNeN-0007PM-7p; Tue, 04 Feb 2025 13:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNeL-0007Kp-AJ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNeJ-0004EN-Ij
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738693670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXp4akxJ/cyQ8iMEiQOrjKd1+VRa0ubwv6rlUgw6HGQ=;
 b=LEQpgEHyWGOSKD/7hkMgBxWzmP7GFtMHx332+TMn7uRBame/n5YC6VfHCw9aFzS7PlGvRv
 W5IpQb2jaw7vmU85jHvL+lkysktXSakTrHN+rL9bPc1U28Nm6nReGzsPgdtf3DK2v44gNe
 oLn71jLca5VlsyvISk1Bq+xnLUB0Wlc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-W1_wWuNeN3CGv-yN_VWtiw-1; Tue, 04 Feb 2025 13:27:48 -0500
X-MC-Unique: W1_wWuNeN3CGv-yN_VWtiw-1
X-Mimecast-MFC-AGG-ID: W1_wWuNeN3CGv-yN_VWtiw
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa689b88293so182355566b.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693667; x=1739298467;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXp4akxJ/cyQ8iMEiQOrjKd1+VRa0ubwv6rlUgw6HGQ=;
 b=MQP6ynrxpN4mwWwHuz2HuX7iRpQwVlhikSDDpBIjTQBxd55F6TUvC5lCm9YRqxWP37
 0y4omekUbuQwdqPTfmt9wq15GDHqAq5RTiNtwNPo//dgfkhj9qQddsglL6Iit6OGpq2p
 Zzvgtj0K8YRoRfuplV4j175nAoYX7i/dcxzK81B6BZhETOCvFWgHx4WFdkRmahWzrUrH
 nxXum+22Jeip0A4Cibxa2j4RelT6LVloSmp91M2ubhZfwXhPQ02TwLjUgSx/0wYEXvF1
 jxtYzdz6OfMZ1tcwsFdEPuwrc4ya3a55RQNALl0AOqzgIvADyXgN7ht0BKa6JeL7di2Z
 +e2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXf7SXetiKFoFI/ltTjhtFBTN78r8B6ojAxC7pz+X1O0qN2JCPT8f/YFRSiXpgF6p20JJAPNzaZg==@nongnu.org
X-Gm-Message-State: AOJu0YxI6UMU512LSCiAS0aE+Y9wC947D8Ep0Pyv+cNak4mZlSQW8fTt
 ZSeYqCwrzuHDaSiozEi06AVguCAtwjt/3gpYaThkXgpOWNFCQfZTr/KOW6J9YIyi0OD6+qivcsa
 Kbd/r6C34CyUG9oukMdZpxGWNnDfMcZCyQ3ksWcTfaH7TowCYEw==
X-Gm-Gg: ASbGncvZZb59GVmV39x7r5CjCIq4kpKKpNPU/9Oxcp/Jz6KgqVXRPqFipuNTyF6jNyU
 V0R3xQ63dhMMq2I2PfBcQsN0h3Nr8ofsCgb89sfgGcnuDW3pe51eFbK86/i7b4NqhF7LNonJhBn
 zPpjN9UDJzp9cYHvQNk9cJJv2XV0MJ4LcTFfdBL+ay6A4zEM5J0KY+fRHiuU9YkYL9VGqAp+lrE
 7zPn0cDBGwXvGZnkx8JwV/cijiCqRdhDMxk2VzrEbNlDi3tbzDu/YFsueuPawu9LLLoCc1GSjCJ
 pb43U0G/MUxYituLJZE/BhHziGT5SIDhW64n
X-Received: by 2002:a17:907:2ce5:b0:ab2:c0c8:383f with SMTP id
 a640c23a62f3a-ab6cfcc514emr2829758966b.1.1738693667681; 
 Tue, 04 Feb 2025 10:27:47 -0800 (PST)
X-Received: by 2002:a17:907:2ce5:b0:ab2:c0c8:383f with SMTP id
 a640c23a62f3a-ab6cfcc514emr2829756166b.1.1738693667281; 
 Tue, 04 Feb 2025 10:27:47 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47cf930sm971116666b.54.2025.02.04.10.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:27:46 -0800 (PST)
Message-ID: <608af675-4c8d-456f-941a-a1e8d1e1bb60@redhat.com>
Date: Tue, 4 Feb 2025 19:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] hw/ppc/e500: Remove empty
 ppce500_machine_class_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-6-philmd@linaro.org>
 <4c200141-d9c9-4a8f-832e-38f4aeeb0ed0@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <4c200141-d9c9-4a8f-832e-38f4aeeb0ed0@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1vq1Scn5eSbBNIatusallzHI0qFNxn3qfKfuUP_RyDg_1738693668
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Y9GIE1hIPa3K

On 04/02/2025 19.12, Philippe Mathieu-Daudé wrote:
> On 4/2/25 19:07, Philippe Mathieu-Daudé wrote:
>> Previous commit left this method empty, remove it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/ppc/e500.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index 59208da87de..26933e0457e 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -1285,10 +1285,6 @@ static void e500_ccsr_initfn(Object *obj)
>>                          MPC8544_CCSRBAR_SIZE);
>>   }
>> -static void ppce500_machine_class_init(ObjectClass *oc, void *data)
>> -{
>> -}
> 
> Hmm I think it is a left-over and shouldn't be necessary in patch #2.

In case you want to keep it (or want to squash it into the previous patch):

Reviewed-by: Thomas Huth <thuth@redhat.com>

