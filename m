Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6682299lfb;
        Tue, 28 Dec 2021 11:27:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3Y+sLa9G56dUm7EglZulkD9O0Th8G/iKF9FwAXQ2tZ5N/0Br5mb0YlECCwaSqtH1x6UHe
X-Received: by 2002:a25:b3cb:: with SMTP id x11mr31885503ybf.597.1640719651894;
        Tue, 28 Dec 2021 11:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640719651; cv=none;
        d=google.com; s=arc-20160816;
        b=JqWCytK/XyVkeW3gBj6q7VvMepU8NqS5CzPdAkFCb29NGabGdZQzIiF4mPaweaNdCC
         Zc7oa5I4kQvQ90l6HFgG09+znSlvMnDVi4vDysFrUW6fbcdYi6At366hXFwZRSXXi1jY
         BZI661vYSaDZdRAaOLMXLljC300SrzSBfFqHYp0I/rwqfuKKH6dn9o3YhExOFTFvFK0i
         clWfHXftNdWV6X2t3RayLlyk3XWIoeyIi5/Pm4ElMhizjBdUbxq/onxebeDdDjbBXBBK
         7kdycROcB1Bqs0cfzqVkb2zXSzQdPqHiy78aDOvKOnoop7wXb0AeXgQLeRRFOfnc7JQu
         UXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NXQSBjrSm98vjpWfGDxxfqGgz7Gdxfzcr7bG4Ey24MA=;
        b=dVjt1sj6j5z2o4LpkhXuJusAyiH5M4Hp8zAFS2NaYHpI3nWmiyxtu4erLVC4TM8jZ/
         1dIJBD/wMNL785KSyiFKyo4stsOPNfzHGHS+C3QmsGRyuvmEWo1gweT3b4G0D9n42gNY
         CJhO4vaw5K1vfOBYVxlfnKsRKo0I4O2NLkvD2qIMX4zKXA7XD6CqJxceeQUSn1hO0HWU
         u8T6UiIPmrGd14dDam/aKZLYzOXI3+CYjFStMJibe7sR/gUC2tVv4AG3cCgeJRXc0mtn
         uEXY2DUfY8eqYJbS1o8w6OT/751rspnpoNihun7hw731+yotQBWTKmPyzplM0V+akp/B
         DHOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+TOaGBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si4435720ybs.1.2021.12.28.11.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 11:27:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+TOaGBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2I8B-00072c-Bm
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 14:27:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I7F-00068X-Lm
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I7E-0002os-6W
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXQSBjrSm98vjpWfGDxxfqGgz7Gdxfzcr7bG4Ey24MA=;
 b=b+TOaGBY+WZfQXUU6PqpmiNM2ye3iBc96ZWtjTy2NctkudIs5V7lzD/tusz/HMRsrGmIkB
 Vpm2hmQ8+RbFDk2KlRLu/BsLo3EwuvNSRu1xfHPo9hhBZnYHKEmqnsALo5wEsEk755dCnh
 GhRuy8cZLz71QnXOw1QFFDDnkUpDqI4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-HKWTySKqNU651M1DM55YgA-1; Tue, 28 Dec 2021 14:26:30 -0500
X-MC-Unique: HKWTySKqNU651M1DM55YgA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so4213491wrd.1
 for <qemu-arm@nongnu.org>; Tue, 28 Dec 2021 11:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NXQSBjrSm98vjpWfGDxxfqGgz7Gdxfzcr7bG4Ey24MA=;
 b=mGzZ4YMkvAt97+GO98m7RTBWEx7JOBKtDW/+3TtrQCK/LK99tm3gVfYp7WGgqIwUVQ
 pjF1ZXHhoHABNudll/ZFjifAB2nc1PrBGkBw4uzUScU9yXDer5MB4PL+kjGsn2D6/HZa
 /6TOdHHR+Qxtlht4Q/lazYBUCRwxobBwFBiDuH5rzO/lKdpWZWP81uDlQaRcxYXYlm8J
 u9P06/2FFC/+t2Aryx9uDEkNvrBHWb+gVS65iMsYoRKr0nHywrblbYOtEv30TLn/8zAg
 v/U3uwsoMhAm59Ufsze12DkXML/e2nMKYjgvFVWFQ3Zb4naut9VyGixzS0hQneOq5sZN
 kANQ==
X-Gm-Message-State: AOAM532gTns3x1FRCDBMSRQW7Vlcyr7ktDgTDOjXI9nsoBWvAFkd6Vdq
 AT6uSBECfEtbX5n292Sm8bFDnysddftiISq00Pfzv5ZHsj/GE+zPb3Mr1aIUoN1DW0nURJHjtFf
 +GwGexxRKHNLN
X-Received: by 2002:a5d:4563:: with SMTP id a3mr18326098wrc.371.1640719589325; 
 Tue, 28 Dec 2021 11:26:29 -0800 (PST)
X-Received: by 2002:a5d:4563:: with SMTP id a3mr18326065wrc.371.1640719589096; 
 Tue, 28 Dec 2021 11:26:29 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id k7sm18871860wrg.105.2021.12.28.11.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:26:28 -0800 (PST)
Message-ID: <85f7e33d-3ddb-6504-35e5-60f44f667fc2@redhat.com>
Date: Tue, 28 Dec 2021 20:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 04/14] tests/unit/test-smp-parse: Add testcases for CPU
 clusters
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-5-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1tfXraMMdqMI

On 12/28/21 10:22, Yanan Wang wrote:
> Add testcases for parsing of the four-level CPU topology hierarchy,
> ie sockets/clusters/cores/threads, which will be supported on ARM
> virt machines.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 130 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 123 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

