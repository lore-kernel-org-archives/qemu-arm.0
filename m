Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp49073njg;
        Tue, 17 Sep 2024 02:06:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTMTUnHm7rjJ5XWeKfhSBi36C7ypA51cEjZOQ7+ldMx6TBYz1AqCbVIkYzk4RAuBTJBSfdUgYb3gwl8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG0QRTzq8kKE4nYB5XHfo00af0YtX+pVce0T45JCKGwiG/FL97pP07VmeAIodnm+F8wLmto
X-Received: by 2002:a05:620a:4624:b0:7a8:554:c368 with SMTP id af79cd13be357-7a9bf95d7a6mr2935543485a.6.1726564015195;
        Tue, 17 Sep 2024 02:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726564015; cv=none;
        d=google.com; s=arc-20240605;
        b=dfmTWsrJloUbxqc2xqhfAM9NQKucqmjAI924ngTuCsU96K23HfzyCCt92HivFI4siL
         iBeCZe/x/DULtCljciNeERW0LPfwLrn325dqiRq/9n4nJGqvGWTAsMay8hYcG2ZGbOYz
         ElHvQ9PncQ6nG7JKBNwyyYY+XIuhqQVUkU+dyRnEbsrUwTf7FBZ7ehiuHxz+kjh+p3MA
         SorwX7bNIG20F2JP4BILCWaSFkkG00zvsepMFuE7RI+0lGiXOmTLvR2LtviWFnvPwhyK
         cJ186IDJ5U8REdSGFJ1P4EulB/7mlnSZiZF49Y+Q2Zf2Baj0oNj055pUd6JcNlIIRGbn
         j5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=VcXNELtKRwpKjT0IExYVkzrZFce+R0XhLLupbOgfRBQ=;
        fh=luR8zG8J8wa4Nv8dvgKmborzM8NIplg1oKjMaJENBew=;
        b=ZCU+Jf5WJnAGihvJ8/QxZfh1y7W2gCTbPMuQD/p/RXMhVOdG2cytDiYIU1QiD4dcHS
         kZt4GDYzJHHwCTMY/lDpIYEybkI8Qi+q8A43G9ENE6AFlFG5epBBzF+90OSeUolrO3Cz
         t3T/WQ95MPWydMuwwbQ5T4UwanUqbbtnTTJGfMKWrz6kVtCMCRptDO7a89uiP1vWzFQz
         5048yrqoodD/Ks2z+mYuzLf60ihvGYkdso+qfp3m0QL+8n2TMdxZDa8Pvki85b5FREdd
         g8yX/anNR9UddHHy/JGCeV4fihRJjmbDtk/OGjiwAMYA/IiGLVkmdJMG9bQq6oonj2IU
         Dq2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ab3eb56f90si779571685a.257.2024.09.17.02.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 02:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqU9g-0006F1-5g; Tue, 17 Sep 2024 05:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sqU9e-00065T-NK; Tue, 17 Sep 2024 05:05:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sqU8D-00020w-Mu; Tue, 17 Sep 2024 05:05:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 07C3D8F9A0;
 Tue, 17 Sep 2024 12:03:46 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id ED93913DCDB;
 Tue, 17 Sep 2024 12:04:00 +0300 (MSK)
Message-ID: <14345b34-f83e-4e55-b932-e3dc90addfcd@tls.msk.ru>
Date: Tue, 17 Sep 2024 12:04:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/virtio/Kconfig: Include vhost-user-scmi only on arm
 targets
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mzamazal@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org
References: <20240913131858.418407-1-thuth@redhat.com>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20240913131858.418407-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-TUID: 1WVjNM4cBp1B

On 13.09.2024 16:18, Thomas Huth wrote:
> The System Control and Management Interface is specific to arm
> machines, so don't include this device in non-arm targets.

Picked up for trivial-patches tree, thanks!

/mjt

