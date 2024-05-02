Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1089838ejy;
        Thu, 2 May 2024 04:14:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXumElpR00abTjVA8RY5hIO+DF5B6FelrtBX5L/AEPPXINupQXYot3iTxMfcjLVLtE+kny35ZdFThC2Ipadfwv+T3J1Acc
X-Google-Smtp-Source: AGHT+IHXH5mFCElMCzWXc//Rn6wgmbUByQ0m0F30XEDkPpXzzjKM/C3SWC9zXmssFH4oWkY0NiQd
X-Received: by 2002:a05:6808:481:b0:3c8:4d54:946 with SMTP id z1-20020a056808048100b003c84d540946mr5436988oid.14.1714648440188;
        Thu, 02 May 2024 04:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714648440; cv=none;
        d=google.com; s=arc-20160816;
        b=lWDqIUf7AKHr38/YoD4DeyfdjWhWQFRUHov1Rw14ryGKOsZZ/LXCJz2hzXMoSQRIof
         INVaokaUV44NU/abwq3fwyEkK+j4HEOkCKbf7G7tgjfjcd4qTC061/TFUVjeT0D+u632
         e6WlkXnohWTJdx6ixls9vC1Q/T/5uWV7sSsYrgic5PP28GBXfXc5Y8ZDEdIkpAyXxBuJ
         n0KXe3/ZkhBG48Qb6l93YLLjRq1G1bOok73zM7DREwxTV6oAXrXtnfBe9AaFbW6cVICH
         ViX+xq8P8MNnKyw9z3fxGP1k0EFZcC4Ib5jQSlW19aodClGQwUEfLHnu3Zy6Ly/mU2Nw
         Q+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6LyOjJL6iQ4wQDKacGY/TJa6doBybJw4Jr5QAokNUkA=;
        fh=FhZ5OVHv37HScF/C1kOP4qc6AGln4tn9mQS4N5eV158=;
        b=itspjgEfUt0r5QkFWeE+MHvRkLLPqfDZ0JFUYOa4gyK15XbdwMTnZVRPa2HnamiU7i
         YUyYV+2f3Xmys4jzUxC7UlNo4h5AbmLmKWMQddLhjVaCHTxxMimwrTPxY/DGr1k87Z+T
         ThOuXv9UyE1gL7zGUJACoC1LW4PlAB2gwFIUswDdQqeix5VOmn9af28mJaqJLN/dpZZ5
         07SBi8o7epnWMGd1mwTG1Ch5GlHV0FDXsC/q0wkQMXt8/P5p/zOxsPm2BxmqmBHCJMZS
         g+9cDT1H5Ifk7ALFxiX1d7s+1F1iaJo4+CsMldbKyiqjnZKdatbFWiaummn6OI4Og7F/
         x3sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZP6XV3mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05621421cd00b0069940594bb6si682370qvh.146.2024.05.02.04.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 04:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZP6XV3mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2UNE-0001ib-20; Thu, 02 May 2024 07:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2UN9-0001i3-2h
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2UN5-0005rZ-Sn
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714648382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6LyOjJL6iQ4wQDKacGY/TJa6doBybJw4Jr5QAokNUkA=;
 b=ZP6XV3mQfEZGOi7hNX6LcoGjBN5fXTar/OwtDhDVSl3xw3WxED9cK0lnG/tQllAuOMmGq/
 KELJ61TsKsf9NH+TBRdZEKV6nWr0qy1FXbFlz+xyJ2lrs+tz4y2kyFSIb6dOUrPe1EUjEY
 WT9PMr6/tNOi1ln+QjShPNbSkvguoFM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-C-Uossv_MK2PGEGR1bXHUw-1; Thu, 02 May 2024 07:13:00 -0400
X-MC-Unique: C-Uossv_MK2PGEGR1bXHUw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-43ab6687212so61856521cf.2
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 04:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714648380; x=1715253180;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6LyOjJL6iQ4wQDKacGY/TJa6doBybJw4Jr5QAokNUkA=;
 b=m+s9bq127zzxhWvFNPJuLhLYTwGXareRBug0/NR4aFTAc0ht8Q0frSOO449nksMtxG
 fT+bSJEP/x71K3UAxGI/vLJZ23Fgn6GbKMuzSvMTKxuOGXysswQRX/qSKv37eBcv3vSx
 tXpeFEEfYw0V3MRsGDMWX4pIx4s5bTper2zecRj0j+rcr6rpgIW/2ieT6cJysrIspuQA
 wnWWoyG4HX88fTZ30o/At2sfVMVXQDdBX8W+BcJ+nOgLpznL6mZLr35fdrSyBjrNEJPr
 wPWzlwlAJR6g3ifp5UqZbdrxA4Fk4nLnkpfJgJYuLDtYCUgPuJj9DLYkArKaipB8sa3S
 py1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9uToQ/SzQFE4FxYR1thg87O6WUYEiQ04PEtXftAnFv+p+nmVIoPjzT6/Iko0Fl2g71IkJs7b1h3jpcAHmMCbwfJCO
X-Gm-Message-State: AOJu0YzRMDbPHjB+u6l9+bNI5QNJJvZsCLkS+b4gIzAgI33g1+GrZCUN
 2te8jxPD9qPDmR1nSgkPpkyFg3GR9i4eN3l/R7KDRmjrLzMJD+gXnHsaaq/qoLEhO7hSHAODQgS
 x8U89foUu4WgFkwu1IqRbnSguJnKA4/Z4AcEfwB75sca0Qa8N0Q==
X-Received: by 2002:ac8:590e:0:b0:43a:fd5a:9706 with SMTP id
 14-20020ac8590e000000b0043afd5a9706mr6605697qty.59.1714648380314; 
 Thu, 02 May 2024 04:13:00 -0700 (PDT)
X-Received: by 2002:ac8:590e:0:b0:43a:fd5a:9706 with SMTP id
 14-20020ac8590e000000b0043afd5a9706mr6605671qty.59.1714648379964; 
 Thu, 02 May 2024 04:12:59 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 jr9-20020a05622a800900b0043c728156fcsm364281qtb.93.2024.05.02.04.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 04:12:59 -0700 (PDT)
Message-ID: <85df15c5-a8cb-479e-a2de-9fce1103d75e@redhat.com>
Date: Thu, 2 May 2024 13:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] hw/s390x: convert 'ccw' machine definitions to use
 new macros
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
 <20240501182759.2934195-4-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-4-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
X-TUID: ydZbCDor0Xsr

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> This changes the DEFINE_CCW_MACHINE macro to use the common
> helpers for constructing versioned symbol names and strings,
> bringing greater consistency across targets.
> 
> The added benefit is that it avoids the need to repeat the
> version number twice in two different formats in the calls
> to DEFINE_CCW_MACHINE.
> 
> A DEFINE_CCW_MACHINE_AS_LATEST helper is added so that it
> is not required to pass 'false' for every single historical
> machine type.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/s390x/s390-virtio-ccw.c | 96 +++++++++++++++++++++-----------------
>   1 file changed, 53 insertions(+), 43 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

