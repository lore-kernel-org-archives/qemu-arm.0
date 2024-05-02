Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1085563ejy;
        Thu, 2 May 2024 04:07:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnVHrlJ3h/W8Dg7QOq/CcDn8bPYaBJ6JCSJJVcg39s88Wtg9QPqPk5XqRSlauqjomkQSt5lVc4BQZqt0tLBcW1bCR7IKJj
X-Google-Smtp-Source: AGHT+IH9dG4REdbI3NUCeIOLG1Ku9TESWD5WojE0IeZobYaohZM1MjDMolk5elJPgnDqkiYRbg+R
X-Received: by 2002:a05:622a:13d0:b0:439:de63:29fb with SMTP id p16-20020a05622a13d000b00439de6329fbmr1610615qtk.62.1714648034711;
        Thu, 02 May 2024 04:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714648034; cv=none;
        d=google.com; s=arc-20160816;
        b=I2NzdgvcjuvdFY2bzewoOmCktnU/qx3fcbAwhT0rMnSjzFxU/ZGjnzb50fBRXOFkYn
         ZwgBlt/bdqtEKMJ2cGMD7ZAzdRA3d0p74bmwfvYWFyr3zxB6KLhvDM28L6aNcMjy+tBe
         c6Vd9RAW27k4hd0vfArfYzkNMzlYoAm2lNu+ml+Ktw6TBwY1Dmw7b8gRuu2wZPczvG0L
         CYAmrUsSNKBSqT5g4ZO5y7M3lON7QML6GV+dNroWgB/pWmwIxguNGu3KovdOeDKloKL9
         o7d7xq5pevVp/y+ndypFMKCwh++B+3dUWgg3AvVX7ZIlBpwp3vjgap3JHv3zhLyb9DfI
         0qlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q7kzzadqrntfpos9nisK+4dYLEVosfqKSlrzGaMi2Q0=;
        fh=hRdlhFkpaRejpYaEIPzGO3eCEgTsHwBi7Tm3IeaZ+iU=;
        b=dFyli6xFRMC3dga9onc2HGPmxBmqIOFEcWwioPVCT48MsLWaCD58gKuE8n6i59mow8
         AMIIXEo4EDKSs4tIGxqIG3/1OwF5pg12mLwwEhos3GWaKIE9mzzyeKcAsvvXxnBp/qWW
         HdYmkoIB7eyxmA1JTp59RrHdABZaHaGCBvWaFkZ7P8YMwDheiNK2T/hauNUU5ggNX166
         BjkJpk9L+1tODBCNUsrhRv3EM01vXoLmUYbG8JG8L0RgJQgiZkuGWZxPA/q1QBzMsTn9
         hqlVhp46KM5AwtQA6EWr8CLUpSit/T3zdQKgXQdjKk1iDAEwTq9OT6P8o0jvaS1ME7uf
         RDeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QZblJ/cb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a05622a020700b0043b0dc57b6bsi711672qtx.86.2024.05.02.04.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 04:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QZblJ/cb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2UHB-0007Hy-7W; Thu, 02 May 2024 07:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2UH8-0007F5-7T
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2UH6-0004Zy-LV
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714648011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q7kzzadqrntfpos9nisK+4dYLEVosfqKSlrzGaMi2Q0=;
 b=QZblJ/cbNqNShf3OFtO53OpxpM94oVsx1jkAzRZinlOvT4jMNyL8oqLWTiiNI/cbjYmeVu
 sxxCBFluN2Mbfju2JByy0g+wYHc/K2FhC/CArZvyuT6e3vS3FcSNetfu1px+FomS1eYuRv
 w7aeFx190dLWIkPt+M7iVd8dj+Z1NrI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-BL6SLEmLPSOlb3bSnPqYGA-1; Thu, 02 May 2024 07:06:50 -0400
X-MC-Unique: BL6SLEmLPSOlb3bSnPqYGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-418f5e7b9b2so32891065e9.3
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 04:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714648009; x=1715252809;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7kzzadqrntfpos9nisK+4dYLEVosfqKSlrzGaMi2Q0=;
 b=PkM4qbbo61MQrXdT/cj7JlwXUvWMiV4DaPHvk7RSIWTWULSVYfN+2JjIKrB0CumtmA
 IRvgK+yErCwvxtMVVv/FS9E76FPebouAVAwnmjGqcqxBzrtFkp4fySpaK9PzEPvzX94E
 i9GTRJaEzbw8aRwz24+O/MhNP/43uytDFQIDrAx9rzC/5e34M7dZlCKN5wwp0GrqxyTx
 j6o2RvAQWAyV1Ukw0d6FtxYHFAW5HhX3zSz6+wfhE9aKiwycfhSM2JAXQZpOPz1qzHrD
 ON8DsnNYePNgqnDEsiWGgv36TxbysvOdUejv7lnWxiSCKHAPMpV3q85l32coCzvRj9Uc
 Pb0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDXZhGtG01LU7YiQYLEXKroIMLKV7HcH7ICc/DfEn+fVAGSocMDAgAqNY70ZQC4iWNOGNAs4cdrUU3ziylRpI02OA0
X-Gm-Message-State: AOJu0YyhMvkBBDY0u22GlZ68jlV1Ii0B76vy5TgS8dkoR679p2KwKTJW
 AdjnxIzEt8vzb4LArChdlm10pf5basIF4riU9X51BHT6F7TfLB6iZSv4Bb18PKImDhfLgdlVtJg
 +3lNoe6ezYy/e4FakLosWSyu7v4DRz7cQCYBOi4ShR/VIJDyFNw==
X-Received: by 2002:a05:600c:35c5:b0:419:f3f9:8ed6 with SMTP id
 r5-20020a05600c35c500b00419f3f98ed6mr3628469wmq.4.1714648009469; 
 Thu, 02 May 2024 04:06:49 -0700 (PDT)
X-Received: by 2002:a05:600c:35c5:b0:419:f3f9:8ed6 with SMTP id
 r5-20020a05600c35c500b00419f3f98ed6mr3628441wmq.4.1714648009120; 
 Thu, 02 May 2024 04:06:49 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b0041c097e20f9sm5313590wmp.25.2024.05.02.04.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 04:06:48 -0700 (PDT)
Message-ID: <2dbe2a6f-a706-421a-aae4-5afd933f2fd9@redhat.com>
Date: Thu, 2 May 2024 13:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] hw: set deprecation info for all versioned machine
 types
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-11-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-11-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uUM6ZJD/Xi1g

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> This calls the MACHINE_VER_DEPRECATION() macro in the definition of
> all machine type classes which support versioning. This ensures
> that they will automatically get deprecation info set when they
> reach the appropriate point in their lifecycle.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c              | 1 +
>   hw/m68k/virt.c             | 1 +
>   hw/ppc/spapr.c             | 1 +
>   hw/s390x/s390-virtio-ccw.c | 1 +
>   include/hw/i386/pc.h       | 1 +
>   5 files changed, 5 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

