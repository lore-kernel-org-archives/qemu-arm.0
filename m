Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp166496njf;
        Fri, 30 Aug 2024 01:09:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJi+knXp1/NnFAfvNlX9BlZzcjIhxk8+LAsF3qt1r4WbEmJkcKwJRRSWNBkpd3szh3/T7B7kz0NfbJ0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGvmXe8c/BYdCMpoUSq+SiB+vnNuzZfPEf4l1WaSgjGZU07krQ1plV5Q6U4JS3UOZhIFaHb
X-Received: by 2002:a05:6214:5b0e:b0:6c3:33b1:20dd with SMTP id 6a1803df08f44-6c33e69612dmr64499286d6.53.1725005393856;
        Fri, 30 Aug 2024 01:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725005393; cv=none;
        d=google.com; s=arc-20160816;
        b=IpWJEnjQSzMGpFwbsIDheG1On8NHQHr/Dvhn4SEA+lLKYles/JepDUuN2A762nSeFG
         8hWPhnhXRQyifhtKykrdoNxrRURUzmxispzdvhpuvIn0+jGLsWYl6gWWgPstGcGkjVOC
         G7qS5UEJ4SgYWupttFo8/k2Qm+ouQJphFgYWeK9dsAVdhHgtQTqRYDshersCuMhMKTYY
         dpXlY4Uf5K0fY5hgQSrW+qewwLl6Vn/s0BGp9Mbj8s1fBkGq2LJXuc7oMqLTP8xex6DL
         nh6669Ixv3lwY9Ef5j7lzrfRcNNXd/LBydHktNmu4/4onpODzgu5v3/KvQa7Ab98ClC/
         AvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cRM0z2YiEimXmzOjezTcVGa11bxpmbinpvMckbeEPP8=;
        fh=X1uXDNS3CVGBdW6R1BqR8daGVf13cPHGzH8O2/MCgr4=;
        b=FlXIpg4ArOsZIvGH51NDKhROmO1xrKBqc8Nf39bPJ488JhVY3ZYbE3WiJ6iA6lydWD
         legJMGhyziOqmsd/JKm4t5MEYEXY9f7/6ZCKqtKpWNp4BaK89Xb51nAywGSxxWmzvNqe
         1VvP3CWrwNsueidwi5xPhVdWT6K3oRUk7nLYpaXGnrsPZomPVj5cnrxTOu5r+tlrhlrG
         +OTlqAp5luOZU5zeKUfus5zWVJXZ5XCKrF7EsSBjxChAP6rrejMIT/cE/IumWujpa7rB
         m9fWV8Z+3hloMzmGSOsGkLVbckr4F8rrloCLcMAO1793aTQbiQsxjGn0pGC0TnCpJ6gm
         rzXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSGoHF1X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340ca4611si34144196d6.394.2024.08.30.01.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 01:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSGoHF1X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjwhM-0002el-7B; Fri, 30 Aug 2024 04:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sjwhK-0002bF-V1
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 04:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sjwhJ-00025D-9q
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 04:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725005370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRM0z2YiEimXmzOjezTcVGa11bxpmbinpvMckbeEPP8=;
 b=CSGoHF1XOhbXYFNT66RIHaUuQD4NLyQCYjshQETtxwSCT1FY2oT96oP88Sls65ijF6uwUf
 PxxLmvXpjlZZ+whZjPhfFW8krrHSSXt2rz3T2+Pf9/5HdMibgh7b0gcT1zW9RPhLuofo1e
 TWyfMIbcvBHmJGZNJhG66pwP/V9BZuc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-t39AU0pBPqan4XE1yq4Iyg-1; Fri, 30 Aug 2024 04:09:29 -0400
X-MC-Unique: t39AU0pBPqan4XE1yq4Iyg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6bf8d9867a3so18152776d6.1
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 01:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725005368; x=1725610168;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cRM0z2YiEimXmzOjezTcVGa11bxpmbinpvMckbeEPP8=;
 b=Aj4xHz05KImUv5iKfrtPyMkcSmkJ6e1vzfYCexQYHeofIAIGELKoKiDQFlDsKM34KQ
 rv1IJy7c0EhQAqlA7kui3siphCuUm11vag3KhDut+OYYX1KY+KshUsA310SLlF8k4ecT
 3CCZzR+Pzgt5O29y6aXilK55+x/vtxo6if6RMFZbDsCrjuRM8DsBqf2Bl6eg2jOMQmr3
 xlu0Q4kJC1g1mf4r8LPGe26bXkJGh4KtsA/p+Z/sRfvVn4aalAa6qQewYRZlVwafloDA
 6U69LRKadEc5tB2a+ADR6YYHEOVXiFVvY6cZC/WPZI7y7/ZCinYnm5HR8QiAHo9yaHgV
 nGFg==
X-Gm-Message-State: AOJu0YxGPoUErPxfrjxEAy+wkU4HM6ePty0pf6gII7MKxDNyLDq6NZ02
 yyImyLLZXQDW7Szf4l46bJjg675lgBQAztp96fHxH47B/2s0N7An6+fBvJ36an9tmwzLrxTm7Mf
 P0ojAKHIdGrVYtiZ1aewfknbleBJLWrU1x9n3pYlzVrCSO6bTPQ==
X-Received: by 2002:a05:6214:3f90:b0:6c3:4851:36a4 with SMTP id
 6a1803df08f44-6c348513c18mr22577626d6.26.1725005368443; 
 Fri, 30 Aug 2024 01:09:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3f90:b0:6c3:4851:36a4 with SMTP id
 6a1803df08f44-6c348513c18mr22577436d6.26.1725005368091; 
 Fri, 30 Aug 2024 01:09:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:3f78:514a:4f03:fdc0?
 ([2a01:e0a:280:24f0:3f78:514a:4f03:fdc0])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c340c00310sm12564466d6.52.2024.08.30.01.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:09:27 -0700 (PDT)
Message-ID: <bdb443f9-376e-4d4e-8c06-9ba0c5482c5e@redhat.com>
Date: Fri, 30 Aug 2024 10:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aspeed: Deprecate the tacoma-bmc machine
To: Guenter Roeck <linux@roeck-us.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240625070830.492251-1-clg@redhat.com>
 <4e04f930-e7af-4084-99a8-2a3139e2bf43@roeck-us.net>
 <5fb7342b-fa67-4cb2-b6fd-2241b7b76d03@redhat.com>
 <f70cb39f-3567-4322-b1c4-1bc5991d91fa@roeck-us.net>
 <8d1fd867-647b-4827-a2b2-a239618a7743@redhat.com>
 <014b83a8-d733-442b-ba33-a24c35e46f3f@roeck-us.net>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <014b83a8-d733-442b-ba33-a24c35e46f3f@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2Vkmaw4sEUHN

Hello,


>>> I solved the problem by adding support for IBM Bonnell (which instantiates
>>> the TPM chip through its devicetree file, similar to tacoma-bmc) to my local
>>> copy of qemu. 
>>
>> Hmm, did you copy the rainier-bmc machine definition ?
>>
> For aspeed_machine_bonnell_class_init(), pretty much yes, since I don't know
> the actual hardware. For I2C initialization I used the devicetree file.
> You can find the patch in the master-local or v9.1.0-local branches
> of my qemu clone at https://github.com/groeck/qemu if you are interested.

Oh nice ! Let's merge the IBM Bonnell machine. We can ask IBM to help fixing
the definitions (strapping). Enabling the PCA9554 is good to have too.

Why are you keeping the tmp105 changes ? LGTM. Same for the new tmp models,
they could be upstreamed.


Thanks,

C.

