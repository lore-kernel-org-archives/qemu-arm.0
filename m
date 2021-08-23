Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2130994lfg;
        Mon, 23 Aug 2021 12:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznc/C+q61eUA41z83vbWMMeu1UMJXmfvjAqcBxUHB+003145A3mcvMCmHQD2J3Z4BiI2PY
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr6428360wrs.278.1629745372946;
        Mon, 23 Aug 2021 12:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745372; cv=none;
        d=google.com; s=arc-20160816;
        b=Wwh/VlXSWcNKEDVMtPa3IP1t7HDH/TtxZ/F5/nRlH8dp9uX65VBu84n5tvr2qV0Td3
         KIV0FWqIWAbcbbnku9aIvknBaMuq+uKXFZ5eZqKXBiloxf1vG/dg+oZ1tn1/VDHy7yYc
         9uIBA5pFtsPQpZ4VPtxtPPApajdBMQGjDUFglE1ICIzg7IrHoNdQjZw4pZl5RECvFKdF
         7jQu7cmyZ9v8PwU9A+FXcoxJESCRdXqHBkGLmvS1CvZXacrBEdvHBSUhgDxtgeapoVuR
         jHt9fouBphwbt2kE836KHdJQu4R85tI0dNH+mtHMGTy5z6z7n6jShvqxIhP/fZkI3E/k
         GZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=4Ro61zTs4YGXyXe+HqlOBXAB/k4drERQr7JHaZIZZsA=;
        b=mBJNt5eVPm+wQEWzqx/kzZZdoYDAr3pmx0v5d8vVCuF637Vz+PZAx6e/nDOhiBUbs/
         Vjvr7bUF4iuFYGRfX8yV7MW2gaHG0kgxbptQdbDlGMhHPzgAHdRcAJCn/U5+kCundU+g
         lnzaEmAEdZ5Mgygdl7xPV6Pr17Fev0GTkTTSOM3fr+6aXvf+q2CTNPkiAEMNcQt1jX2n
         AwId+AwVSTA0Jr6fMOGrOpfhUhstp7Z3etstVHB4FBWYasF5pYGROoFlg5mCDnDKcFRr
         T4I5iLdoKpmh/sWanbCBAYTs/YeI1eD2EMeV14TYo0hVSnUjd9c8b0sUou4IdZEknSDJ
         4L4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hYE7nHhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18si15268979ejt.663.2021.08.23.12.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hYE7nHhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFDf-0004mD-VQ
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 15:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFCD-0002nf-RL
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFCA-0008MC-Ub
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ro61zTs4YGXyXe+HqlOBXAB/k4drERQr7JHaZIZZsA=;
 b=hYE7nHhF6JhG6SY0ghYMckFlz/aedO2CQ3SXiAIajP1YEIAMloDMczB7poR0bQNYw6+r8k
 IDeNuX6dlP5gAjQIp3Qgqig+wsMhhGOKYRHeQbwxppMbZD0kBGvsjBn6BlfyWAh/HNO7dS
 J9tS0z6ukldxrDAwJ5ewA1k+CuKqb/U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-Cd5X856eM42LclGRVixmyw-1; Mon, 23 Aug 2021 15:01:14 -0400
X-MC-Unique: Cd5X856eM42LclGRVixmyw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i204-20020a1c22d5000000b002e74466ad9bso78229wmi.4
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 12:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4Ro61zTs4YGXyXe+HqlOBXAB/k4drERQr7JHaZIZZsA=;
 b=pAPWcZHjvQCFcoei5cLjbWPz8E5/3SJ9GDjHvfY7qYN5hkY8Eq/ohKYuiWpVDgTqe9
 gZhlySBUlgRyWSncxQnKoTfPzxMpdWmdr2UiWFO+HjQP0GKeWpz4nVT1K227M6ieEodz
 vkTipT8Co3QvBg65HAvw+H8iX0fzbluIXqrR3TYTtUOPz9QfUbzEy3MK5p+wpvbaBsvf
 d+eGfVaefdCPR3Jj5aB7nuzpGIdGgahcd2YvVlRCnTMvCBtmQgl3UnzBIrxgEJAvYtmF
 kQfYvHvWXRf5C3ax04e0wt2wHAETCTgEEqZYb+CaDCxzPxPRUBlnhQs4FwzunWnggTPh
 9tPw==
X-Gm-Message-State: AOAM532iiN3CqjDGbR7rqC2ebKGwoJsoypbBvn8xyL3SHphMHbcOsXGl
 WqdPstpAS0oZixnemyg/DUVH8nN0e3otw6/vsafNO4J1EEZ2zkc5plNR7SzcMANivYXxpRtdaT1
 xYQLVGs4Ueanj
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr7339767wrr.382.1629745273189; 
 Mon, 23 Aug 2021 12:01:13 -0700 (PDT)
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr7339735wrr.382.1629745273016; 
 Mon, 23 Aug 2021 12:01:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 k17sm534858wmj.0.2021.08.23.12.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:01:12 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK instead
 of MEMTX_ERROR
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-3-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <cece5f99-82c5-8e5a-a9c5-af691984f9d7@redhat.com>
Date: Mon, 23 Aug 2021 21:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oaWhC+AaDMHB

On 23.08.21 18:41, Philippe Mathieu-Daudé wrote:
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

