Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1335645ejc;
        Fri, 13 Oct 2023 01:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIf9S00MjGTU9H9TsxU0aVG9CsLxZhVG21irnX9Ah62GCmBGxd51/eBs43pl6tZvPs6/Jn
X-Received: by 2002:ac8:7c53:0:b0:403:fee8:7fdc with SMTP id o19-20020ac87c53000000b00403fee87fdcmr33582674qtv.39.1697184162439;
        Fri, 13 Oct 2023 01:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184162; cv=none;
        d=google.com; s=arc-20160816;
        b=U4wU/nAtGgx5eOp4vkNaKCsATJvcJjR7iikvUGY+CnokiaeGwxf7599riBmhysyCcv
         H/q3CG+yKGAuEnozL4H3cdlrLOiT2gEByXSqpGaJ7PaUE/OlL+ZYoQw35gRhP7Xuhteu
         cOs2+ACiw3f3ay4HTFUeLqPS570oFNUapPNp3XWjxnxTcQGtE0jlOFZKeVXQnfSG5txt
         tKs2w8s+vRnuBTOfLebM90M/Acg8iyYqdBpht0VopYu9ZdwlGFFkfhbbq2EdEr8crYP2
         Eoau4rUf7afadIoyhygPDy+ixBh8pMO4bZsmLNDTzvXOA9QT32daZs0QEZV4JLd0SuX3
         GOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=cZ81yx83Esuspo/MllHZsYgpqECWGlfFwvTqA7xjPbY=;
        fh=0iDVQQaw7yScE9t7HisFkiQnT4/93Tm42b3vnuvZLzA=;
        b=ufu781XFH1xKQaTQnKKCQCAkrYc7o/10OjaE1EzYwesI9uHhuD2pW/iOwk2IgcoqFG
         wrNq1mqbb/FQRJcBPzGMi/KN2JJkCAR3J7t0OEcQ9UfqRAZ5LFzpRdsfIEP9inSiH3rG
         Q0PjjcOw8ihfKvAEuBDtLbexdaqeh5/UveTdSZ8gscw+7yljuf6mUGHnNyd5TpRowy/y
         PDSO2Dk3/VOr9OO0lbUNTL8KmMZDgBz6ocekS1bvtscD2pCUOblrmA2uAecdKM1dcd+F
         5B8FN14PbDadd4+GqBBLR8Fv1VZr8tNeVqfnvaP5n3YJtxypqO+yncgasNTvu04ilR3k
         AEMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fLBFQBHA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05622a011300b0041816d65a98si861346qtw.421.2023.10.13.01.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fLBFQBHA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrD3U-0005O6-Dm; Fri, 13 Oct 2023 03:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qrD39-0004rx-ES
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qrD33-0006dB-S9
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697183847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZ81yx83Esuspo/MllHZsYgpqECWGlfFwvTqA7xjPbY=;
 b=fLBFQBHAuKr2HrBuwa9NP7rivAeKrAbITNW00z6y8F8SYHP3ZyAP45+qYkqUKGGbJVsV/M
 KwJLJS0FQ0ZDpRPzHGJr3ztN7TMWNkTV0h9kLEojaSxC4+eQ2eoGZxC35gddOUK7KenxK7
 HhkB/TkLax7CkYwpKquMRnWc+AwgMYk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-hEHkE8VYOMiF9fMQ6K1PHQ-1; Fri, 13 Oct 2023 03:57:26 -0400
X-MC-Unique: hEHkE8VYOMiF9fMQ6K1PHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-327ab41de6cso1268425f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183845; x=1697788645;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZ81yx83Esuspo/MllHZsYgpqECWGlfFwvTqA7xjPbY=;
 b=RqMl2WL0M1w/PiUJbaZL/jx/+zrLdMjxm4m2KDnCaBW2xPJYYpWRjrGn/GXpnvmRrG
 TaYluUJchJmLBl6f1AkpQbW67lgsUsR2PU4twZLPohvHNGqjSGasBaoBCPmpVz9kbupb
 KWw9yXu5GcW84u3wSr3BsJhkanFlPlsRVpfFN7Tanp/CsYv6e0xB611fDMKBqoivz4JC
 VWLs3Yi182A7g7OlidwwlNPuE2vyVoVTe5h7rvbLS+xcc35CGD6GpbrJJKXNX3IP/Ne6
 ODIHVzi+P9ADAiiz2uymiLO9r0U6iGr8sVYekPa3OlNGUsoAYlIxtpPSiF5vWl3gTkKM
 dZ7Q==
X-Gm-Message-State: AOJu0YwkPIjAvAG/WKuRiCHAkHOYihU35j/zCgQJi0EeovZOmcodEq2N
 1bWEHjxzhRGysrYZ9X5DZE7QJM697+RrnLHmunnGMQ/2uA32a8CvXhdy7C/4Z5MzOPZNt6SJ54T
 Vfp7/V+5CKe66
X-Received: by 2002:a5d:470a:0:b0:321:4ab6:9b28 with SMTP id
 y10-20020a5d470a000000b003214ab69b28mr22314333wrq.16.1697183844996; 
 Fri, 13 Oct 2023 00:57:24 -0700 (PDT)
X-Received: by 2002:a5d:470a:0:b0:321:4ab6:9b28 with SMTP id
 y10-20020a5d470a000000b003214ab69b28mr22314317wrq.16.1697183844596; 
 Fri, 13 Oct 2023 00:57:24 -0700 (PDT)
Received: from [192.168.3.108] (p5b0c6028.dip0.t-ipconnect.de. [91.12.96.40])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0032179c4a46dsm20182313wrx.100.2023.10.13.00.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 00:57:24 -0700 (PDT)
Message-ID: <2c759236-876e-9169-624e-267d23da1405@redhat.com>
Date: Fri, 13 Oct 2023 09:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 26/78] target/s390x: add fallthrough pseudo-keyword
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <18070bd006c48fe9966502ef6877d12a489135f1.1697183082.git.manos.pitsidianakis@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <18070bd006c48fe9966502ef6877d12a489135f1.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: uLv02xLBOsD/

On 13.10.23 09:47, Emmanouil Pitsidianakis wrote:
> In preparation of raising -Wimplicit-fallthrough to 5, replace all
> fall-through comments with the fallthrough attribute pseudo-keyword.
> 
> Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

