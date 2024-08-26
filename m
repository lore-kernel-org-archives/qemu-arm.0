Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp984417njb;
        Mon, 26 Aug 2024 02:59:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOWKQlVOO62lHQlkf12riz2YLql3QsO8d/964U98fzn+MyghZDWVRgTnYEImjaXLx2tM8azypBqCjy4A==@linaro.org
X-Google-Smtp-Source: AGHT+IEVyLD6nMQm1LvfrL2UkVOtwlEMBkpHrM5Z5F8jGDrqBFlHRInEYIPOybfQKKhDROZ2PU3z
X-Received: by 2002:a05:690c:2905:b0:6b2:d72a:9de6 with SMTP id 00721157ae682-6c627d0882dmr92171397b3.32.1724666375593;
        Mon, 26 Aug 2024 02:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724666375; cv=none;
        d=google.com; s=arc-20160816;
        b=s4aoZ+PEOaRHZnND4DqYfe5XtIQePclOccL7tYdaocsfODG0Vs5X9dlaUcEqsiVWa5
         N199k1YtWqYgkyeW1CSwzEL3uARV4SLvXtwFR0+4Q724YfvHDw3e9EOLkEOtrJLf23fq
         K2gnp6MhlEHiQWhXG00/Ah4+KEEwy0DoVQOBVUtcAGh+jv0bMWlNIQbwR2aRs5DfiCvm
         d+HhkiWoqH8wkGSrtb3ZlkCsfRN+Pgry7MYPDjl5KDS/PoRnBfm2DRa3FLH/TXmrYZLl
         2LSJpHigxiEewsa2NRsCXkdqDaOhWIP/stjVu3/QAev7Nmu+csK9orhp29V0RpPQcuWU
         nXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fT72gMaFME0vEI+lskxQABj2puN0glmxGVGG+rztaqE=;
        fh=X1uXDNS3CVGBdW6R1BqR8daGVf13cPHGzH8O2/MCgr4=;
        b=wMrW3ywgDHyW1UDZSnjMjZ2M3pMAfLbna8Wxtr7D9/jjA10HSyMam+h5nCRYKQ0XcX
         Ne8p8eH8FApyhxnFdranpSzXdajoHjtQaeeCNieJKKdPeuAW33nttnA+YVvs5iwjEQn5
         n1GrNXznrCsHv95VFPGSQNt/BlAMoC0FhvCLtsp69H5zBf5Yjji+P2ffSV2O/CQZXGI1
         e3Qz+zuSMuC3ezrF1vF1yRf0gsYOZ6uyxps7BQmj5/eJnruw0v6fCDPaBBPjd6gzYmFx
         yZK5rPCPhxtzHjigAGFNHxVeWOkDvzHeQxDZbMtp8BbLuavY4+GhyY0JNfwTNs2UWb8o
         l3iQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iMjxQJtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3520fcsi1009878785a.213.2024.08.26.02.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 02:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iMjxQJtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siWVB-000538-UQ; Mon, 26 Aug 2024 05:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1siWVA-000528-Nu
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 05:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1siWV5-0000Wa-MU
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 05:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724666341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fT72gMaFME0vEI+lskxQABj2puN0glmxGVGG+rztaqE=;
 b=iMjxQJtlK6G4nrQ570yFsiFFkpYE579voj1VtofpIolHlJtLcV/RwzHLFEIVDoejLB8aO0
 DN4Z/f/13RqH7tc33G+PlT0/xufVA1yi1YP3VsS4dsIJ6gcU5JnuouG3VrhtJi2mTEO/RD
 J5hS1IiBpXGfmoaedjubdQyKQLyBsWQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-eRdYmOwgNvWvE32jgIZS8w-1; Mon, 26 Aug 2024 05:58:59 -0400
X-MC-Unique: eRdYmOwgNvWvE32jgIZS8w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3717ddcae71so2533397f8f.3
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 02:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724666338; x=1725271138;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fT72gMaFME0vEI+lskxQABj2puN0glmxGVGG+rztaqE=;
 b=wgSEjmh+Pv5STiGK8TKVkiQxRm68yEwJSsIshGVqB5ASe+e5x21R9vtE2sJGGcFrTW
 TINmT7UqjgMLz3beJMZ7YKwwlIi4++y0LOZQo514w4UB1fANB/soGh7YNS+Q+qFFuyt7
 lJJCxndtutTpabv1S41/n3I8T3t6smomXVuDk5oWVoI6lDt5dRhtFReyaTqnzUdCkyOp
 B9pf0M5mPdl6sZBBoFx5QYrINbqGzqPIX+a0cFVcm6i+8FeOQ8gvd18m5V8biWHo6xsG
 /OJwdsVzJn2c+VhPd2t0Z8GDBk1yAF9i4tAqG2M9cXygDv82xzNoz2igF+YMxUWmmd7f
 TaDg==
X-Gm-Message-State: AOJu0YxjXT9PIfiEo41nnl6yLvb78lXsBO6xMcjyWMliKMCVF9LowtwW
 LDGvfswoGDEw6LPJC7TRJqhe9AjKZK3ha3IXvqhNcXEJNJ7sRfJws0WZ/XOfjXHSeZT4yxG7jOh
 c2/7Q1TFuA2wS6B2UP2dTowQxXThxlBX8FylpBQa/uIKToRVLxQ==
X-Received: by 2002:adf:f143:0:b0:371:7e19:b9de with SMTP id
 ffacd0b85a97d-37311878689mr5273609f8f.32.1724666337799; 
 Mon, 26 Aug 2024 02:58:57 -0700 (PDT)
X-Received: by 2002:adf:f143:0:b0:371:7e19:b9de with SMTP id
 ffacd0b85a97d-37311878689mr5273595f8f.32.1724666337348; 
 Mon, 26 Aug 2024 02:58:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:3f78:514a:4f03:fdc0?
 ([2a01:e0a:280:24f0:3f78:514a:4f03:fdc0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c5edsm10364173f8f.31.2024.08.26.02.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 02:58:56 -0700 (PDT)
Message-ID: <5fb7342b-fa67-4cb2-b6fd-2241b7b76d03@redhat.com>
Date: Mon, 26 Aug 2024 11:58:55 +0200
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
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <4e04f930-e7af-4084-99a8-2a3139e2bf43@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: G2Y4pJ1Q39Eh

Hello Guenter,

On 8/9/24 00:05, Guenter Roeck wrote:
> Hi,
> 
> On Tue, Jun 25, 2024 at 09:08:30AM +0200, Cédric Le Goater wrote:
>> The tacoma-bmc machine was a board including an AST2600 SoC based BMC
>> and a witherspoon like OpenPOWER system. It was used for bring up of
>> the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
>> machine which is part of a real product offering.
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> 
> I have been using tacoma-bmc to test tcg,tpm-tis-i2c functionality
> on arm. rainier-bmc doesn't support that, and other IBM BMCs which
> do support it (bonnell, everest, system1) are not supported in qemu.
> 
> Do you have a suggested alternative ?

Could you use the ast2600-evb machine instead ? as done in
machine_aspeed.py, see routine test_arm_ast2600_evb_buildroot_tpm.

We can't add a "tpm-tis-i2c" device to the tacoma-bmc machine init
routine because a TPM backend is required.

Thanks,

C.


