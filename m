Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp583649lfj;
        Fri, 14 Jan 2022 00:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB2mL2uRaPI88zUbH+DzI/yXcJYBof7RX7IEqJie4s0sWkudau7+/DDAwKaIX+aAFRHOe6
X-Received: by 2002:a25:4406:: with SMTP id r6mr11335915yba.180.1642150796206;
        Fri, 14 Jan 2022 00:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642150796; cv=none;
        d=google.com; s=arc-20160816;
        b=vqdiZx0RN3+pD2vOn78jW0jx7odJ4wiGprwNd2l7d1cXiL72aF1gKkE8X+43Yj4Nrs
         Cw1VWsDpGpd9lVixovGBiMN4CPUIu0IhmxEiGpr2awZufqm+vK5eBKwVTeWbNropQd41
         6/5GHHCm6MUnsQDachGs8P8vcF16bf74VFxeXz5X191A8ToJT2RzBl/5pIpyDsDXsTDc
         JvvI1fZGl4CMdctzy+2dQK+4JBRBSfvHIgrH0rkF5kSrHC0QefsBJAbyV0sDYEzEVUhv
         M93ktar2hftjN1f8526X73tXIEaHZTXrPV2XThHtNeE/hAan4Orhe+ubZS/5mXDH985y
         BFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=96a0o/zGn6+jmJgYuV2SaRYOmyrJsGqi1HSKr1shTYc=;
        b=QOcs7DVDUczKRPoIs/EA5Mmuar8+fsWoSZFv6DeN03H/KieSdkbiXsGFJVIpGYWzmF
         8P0pinQC2y4nkxCT8SmUwtXuBdumYzZRGhV1gQYejoudbLqVy3ZG1QEQXj1MPCJsPffJ
         2NkHImBSC5gQw9MMCWG4Iah+s7FCQCqFCoN7vUbX05xGedbipviRIwXNCixzQekyDGYt
         J3kUz3k2+icQ4Tc5bWl4NAk9r5gtXsdFpD/jb7SpH/4yQ6jC8rtNjez+ntZIGhN69gtP
         psaGVrsoXpmbYeLLqDkAq7LkkBPcDoV95Tx5RDQdOm3XK39Q6xgQSjsdFrUJ3Lf5JtZg
         XtxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KxoCq3Uk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si5870774ybu.614.2022.01.14.00.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 00:59:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KxoCq3Uk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8IR9-0007Hw-LE
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 03:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IM6-00019D-VC
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 03:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IM5-00006a-6y
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 03:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96a0o/zGn6+jmJgYuV2SaRYOmyrJsGqi1HSKr1shTYc=;
 b=KxoCq3UkrR5Cct1liPRm1dh+qraxxKlpODUdum9RdJD58vNk2Yg/yN9r9iM4MF0MwEmzOv
 y/wY3gd1i/tuN35mpizgaaSC4/eNbJB+/GsG9GHEehqIE+eGeUKWfGAo9wJb3B9G6Cbl3/
 WTczlI0pBH5ZU2Fhg1nfC9zRRxpccF8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-v5JmiKBtNAOPsGj2YonSrA-1; Fri, 14 Jan 2022 03:54:39 -0500
X-MC-Unique: v5JmiKBtNAOPsGj2YonSrA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so7623822wme.1
 for <qemu-arm@nongnu.org>; Fri, 14 Jan 2022 00:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=96a0o/zGn6+jmJgYuV2SaRYOmyrJsGqi1HSKr1shTYc=;
 b=loRIm2i/8ataEFYdu9Ybcp9s+1TuiTxv3DhN4Q1q7EL9H493nsvzsUWc4ocVMcrTF6
 YXf6MMxJ0zmplOwlYvmMLU3cXAoet3M9fhoa5ENO6HQ6WlEyzi4S1e749ZT1nNycZYwD
 2fTpa5pUsuTxxsH/b+mgC8vBRQ6kc4mxMnHf6Pit4GxEuZF/jQvDIsJ3drRsSwIPSli2
 QWLN+HXhxTp5TwiWKcc4BGYGXkKL5QHqVc2em7q+KZFwRjf5FE7ghNXAVLZQswbLqTge
 e+Xz0ZqD5sKDy/C3Oq9wJqBmVWa/GeUbgqgjpcYPBAOhrWHrLx+ElYDTiFfTM9+dlNo9
 tz8A==
X-Gm-Message-State: AOAM531Tcvy2O6k5AHrQ3SfcwsbMSJ1H08IRxK8OpF1KFG5XedYOYLKu
 rT3fZILe06Lv0UOucy8lJ8XjgZPW1RKlBYnpepuKfLZxJ7mkWu+JvQQBZWEHM6kQqno70Y6RWnM
 nI2ZQ6FwBFDbg
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr7341904wrs.322.1642150478481; 
 Fri, 14 Jan 2022 00:54:38 -0800 (PST)
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr7341887wrs.322.1642150478233; 
 Fri, 14 Jan 2022 00:54:38 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id v8sm4917050wrt.116.2022.01.14.00.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:54:37 -0800 (PST)
Message-ID: <9448f6b2-4ad3-162f-170d-d82f0a03455c@redhat.com>
Date: Fri, 14 Jan 2022 09:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/6] tests/qtest/libqos/pci: Introduce pio_limit
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-3-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bR0pqqQOHQMJ

On 10/01/2022 22.19, Eric Auger wrote:
> At the moment the IO space limit is hardcoded to
> QPCI_PIO_LIMIT = 0x10000. When accesses are performed to a bar,
> the base address of this latter is compared against the limit
> to decide whether we perform an IO or a memory access.
> 
> On ARM, we cannot keep this PIO limit as the arm-virt machine
> uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
> are mandated to allocate at 0x0.
> 
> Add a new flag in QPCIBar indicating whether it is an IO bar
> or a memory bar. This flag is set on QPCIBar allocation and
> provisionned based on the BAR configuration. Then the new flag
> is used in access functions and in iomap() function.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/libqos/pci-pc.c    |  1 +
>   tests/qtest/libqos/pci-spapr.c |  1 +
>   tests/qtest/libqos/pci.c       | 78 ++++++++++++++++++++++------------
>   tests/qtest/libqos/pci.h       |  5 +--
>   4 files changed, 54 insertions(+), 31 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

