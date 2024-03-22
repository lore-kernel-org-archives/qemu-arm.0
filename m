Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1007502ejv;
        Fri, 22 Mar 2024 00:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUC8Ok+ITyrd7tfLSDOgI12Ggrl1P8KUHTsQ6RZ5JuaJnAmC0AyZijlMskPwG7fxLYbTksb9F0/iAfYGUsNdbnkmhwwjX2W
X-Google-Smtp-Source: AGHT+IEVHAJIS1CTVfSZiCz6Ym34dPeVXhf89N2hRVnIwn/WjP1MpGtpLBMFy+rtx5g6LSs1GRlS
X-Received: by 2002:a05:6214:e8d:b0:696:4207:a6c9 with SMTP id hf13-20020a0562140e8d00b006964207a6c9mr1886779qvb.35.1711093813229;
        Fri, 22 Mar 2024 00:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711093813; cv=none;
        d=google.com; s=arc-20160816;
        b=kk10gYSO1kKc4+JBQzdHLLe4V++0l14pSqYfjLC2BmpkZYILcteJnOZhZWzvWmTjNP
         RxsPXKcSHytFPo/AFviA24k39Q5TTJ7TEkIDcMrt0Kk7uRWSW04/jDguEuKieEjh/0+X
         4AJDLf9ujs+UB94ZIZ8kGjNHSi4MyiZnwqqDKs5Mk4Ac+C0kixZIr35FjBeAVJSs2SWm
         +rSlQq5V5bcwM64ZcaqcXwRtpA/p+dH6+0eLPSMOLotmlvi5Qr/BYHcHbhxad8uj3bHd
         mhkuAFhIWNgYbJ1mCvy79TrCn7xiDarxvKPXkyozsg9dUJXFCDTn2dM7lJ2ybcJ6D8Km
         PCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jzKLMicNWycf3oA0gDzmt2LQfjKd7VPVTIC6wfZR9HM=;
        fh=b7jD714dBnPZOZSIUpohe50iRwSK+KmOPoqlQMVz/70=;
        b=sX/brZYN3xjfbQSc4YoDng5Om3UlHzlOuWnsqYtOIZRONysQ9btgNJNBEjpC4PSNmX
         3U7ATPJ9BBYwjQU22yVHvQ+FGXponHbgIy086YtqmvkELiId7m8fnFydxXaD73EN9i/J
         me2MirdyprvKmSGKUco4jQsfWkBKPUZWs0qHPK5rP3mb0rAd1NC2nL7NNelte4g5Od9V
         2iHP2lf+D6L/9M9iCpsO78nIUtN/81+RhxfeHNCp1FiIhUzyzthmcYHnmv8geehDG2EX
         ZUVFR3PU8wrOoXu90i4hW52PwUMP9YDx7w+qoik+vU//wUvVejdcC/Xt93E5ikXLyndz
         nH5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HsQElxNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a056214202500b0068f5bff0abesi1654990qvf.442.2024.03.22.00.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 00:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HsQElxNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnZf6-0006wA-Oi; Fri, 22 Mar 2024 03:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rnZf2-0006vH-Dg
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 03:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rnZez-0003ru-7q
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 03:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711093791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzKLMicNWycf3oA0gDzmt2LQfjKd7VPVTIC6wfZR9HM=;
 b=HsQElxNikfu+rRpHJywBuMsgMhkisHuKlSO+gMIb7AtFNsN6Sg06e1N/9DN5ZAUJe3Mn9u
 OG017DeOjDpSjU70/o+T46W1/l5HsOm6NuPmQjc9Rx8twxRa9Zd1gnoJ7q5ajTmVU9pGVL
 6kQ00sSmzNfzcdk+leZC60fZy7PMG90=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-WtyoJQ4qOZm2eOo4uDySng-1; Fri, 22 Mar 2024 03:49:49 -0400
X-MC-Unique: WtyoJQ4qOZm2eOo4uDySng-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d47f385ce1so17991911fa.3
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 00:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711093788; x=1711698588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jzKLMicNWycf3oA0gDzmt2LQfjKd7VPVTIC6wfZR9HM=;
 b=GcvlxY/HPJddmrGESis0N6NGvGNQUQYix+JABKSqecSvgq8zJUqWFO8uBJHkSuqlpK
 6hBgxP/ZSq3Q8BzJlNyLJxx4hEsOR6J5ejBMfEBdwPXB00YHC8gJicC2u+R6A8+PTjFV
 WTRRlwqUoMRONEh/Yd++lwcxTkzc2UZlRaq6l2PHzswR25Do4+xi+Ph4AIc+I/ePFq7B
 07R5tWmcNkEGNNw+K0NVB+XiapWc2yTJzR5hOHWCSuuo1Ft7bwYLre1a7GR4bupthiQN
 ExULRlIB8uomwIrG1SB/WWGcYRRLGbGPbiVPXgweWcngp/jCjrJ+op6JP4wLZIGQwbkg
 SSEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC1Pkqa452BPGZlxiGv5GZCmYobK6d9zAV4yEpT2Unsur3G12Lkv9LpY5Jh3DlQlUBdL1vgpD9Kw3iWRE65mzq2Mdv
X-Gm-Message-State: AOJu0YwrA2ySVMfB+MGqTfgYCABrVNT8QqKKhvQSUVTYKxTr1npYxUaW
 zTRufatOzFeLJ3l44N8LcbNZs0JaqnOK7xW3BzdvCPKIcEfFlJ4yj7OpeK0XU/QI2eYatwpPOmw
 HKj7vbsK/e8PyVxk+x04YjfANHg5NtIzTFVPMRymJSLZSp9S2ZQ==
X-Received: by 2002:a05:651c:1037:b0:2d4:5c0c:77db with SMTP id
 w23-20020a05651c103700b002d45c0c77dbmr1168479ljm.3.1711093788169; 
 Fri, 22 Mar 2024 00:49:48 -0700 (PDT)
X-Received: by 2002:a05:651c:1037:b0:2d4:5c0c:77db with SMTP id
 w23-20020a05651c103700b002d45c0c77dbmr1168469ljm.3.1711093787765; 
 Fri, 22 Mar 2024 00:49:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 bp10-20020a5d5a8a000000b0033dedd63382sm1426285wrb.101.2024.03.22.00.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 00:49:47 -0700 (PDT)
Message-ID: <43de228d-0fa7-465e-b8bf-5bab08de2f0a@redhat.com>
Date: Fri, 22 Mar 2024 08:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca9554: Fix check of pin range value in property
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240321160154.901829-1-clg@redhat.com>
 <f74d141d-69aa-4d7a-8536-5378e4353db3@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <f74d141d-69aa-4d7a-8536-5378e4353db3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: L2eVasa2Tg6u

On 3/21/24 18:15, Philippe Mathieu-Daudé wrote:
> On 21/3/24 17:01, Cédric Le Goater wrote:
>> Coverity detected an "Integer handling" issue with the pin value :
>>
>>    In expression "state >> pin", right shifting "state" by more than 7
>>    bits always yields zero.  The shift amount, "pin", is as much as 8.
>>
>> In practice, this should not happen because the properties "pin8" and
>> above are not created. Nevertheless, fix the range to avoid this warning.
>>
>> Fixes: CID 1534917
>> Fixes: de0c7d543bca ("misc: Add a pca9554 GPIO device model")
>> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/misc/pca9554.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Isn't it the one Peter fixed in
> https://lore.kernel.org/qemu-devel/20240312183810.557768-5-peter.maydell@linaro.org/?

Oh yes. I missed it. Hopefully, they are similar. Let's keep Peter's.

However, what I would like to do as a follow-up is to move the
hw/misc/pca955* models under hw/gpio/. Is it something we can do
for 9.0 ?

Thanks,

C.




