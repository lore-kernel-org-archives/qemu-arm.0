Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E74C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 14:17:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whT5j-0007ea-1E; Wed, 08 Jul 2026 10:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1whT5Z-0007VR-Gh
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1whT5X-0005YN-Vj
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783520242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n59jMt2lctejhvE9sQWjQSAcIDnSAtinJezXAj4dDNs=;
 b=hCbvXMduNfbTZ4RjZJyUPXHaQDh3YS+AByHT2f4sGwDmToxtybz2rhwNrh8lt08EToO+aK
 RJ7pseRWw06syKaLh2nCQdfIeeV+bGDIP9QUKZFZ8LRAiZQvQIISUfuijzARTF8+KreumP
 Y49Zd26rNpKkFzeAujo1tzsvPZxHchU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-ECT5H4ZWO7W0E903WoKzwQ-1; Wed, 08 Jul 2026 10:17:20 -0400
X-MC-Unique: ECT5H4ZWO7W0E903WoKzwQ-1
X-Mimecast-MFC-AGG-ID: ECT5H4ZWO7W0E903WoKzwQ_1783520239
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4731a357b0aso617505f8f.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 07:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783520239; x=1784125039;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n59jMt2lctejhvE9sQWjQSAcIDnSAtinJezXAj4dDNs=;
 b=sd99a05fWCvdIAt1yv53/+HXvA6/PfFtilt+6LJK6/QQ58fO1JIq+bcBHGjp0tz7FG
 DV3mt6irkhuQbeVhujNL9v/4YkyN4UUsRlxv9yLrMoQEaPJKdvZiE2GLsZtjz4yyoEEh
 XhAgyIrve3n1NLQCzKhjkM5sObK4DSS4tscVF992NUub0KpIi/pecMxSvWpqFBzNXv68
 J45eCbgcwH3kCNWvSe4pfSYVBGgDNBr3QR52wv5P5doK93IJjWbQIZbpx7OTDjWemJfC
 MA8fISzsOKkDESBh1qrEyUlnzf9CzrF0gFwUlAvllzVH495CxJ6xb08VUTKyToad4jfj
 OrLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRdzroIm1k34mPqtkBTkoNVUFLKlsDgyfosVgkUj5dJ6E/RdrOFlEowPzggvmZ/laEzU+Nt26M9w==@nongnu.org
X-Gm-Message-State: AOJu0Yw72k2lG8rBc50SSlt9GXInb08MV7h5Mj7m+Kr/GMVeuGZwqqF3
 cSPCk+pfWMAY2mQUrGddMXaO2v8hmGJfFBs+p9qR1ZfBFmtW7AVBOclExUl7/IsGtRBbH3N0CVO
 6a0SmyT8KFC6MDQYUZnB6xNrxO73TpRk7AggSTEr5zBu911fcGSFZoQ==
X-Gm-Gg: AfdE7clpr5lfsJzLHCBnzApi+wI2UBmQQRKZdRrefUl0mV5NLxSE91WnawCY/k1T1vB
 R03W1WNk9w0dXIWSOSOVURrXAsv09UD6FdK/d1h4+BPonJKjKA3b+HInR3eDaSwkXPSZZi3Vxah
 nQhzdlTX+Rgif2qJN259Xxs0wrBHM6PU1Eq7QoxrjXixVKP0LKjUc3+4uReV2bMnMrMd69W/kq+
 nA5T+YoA09Mesh8636ids506fpkYEmasy+MlD1gMMUTxC5S5v5VUce4Cik5uhslb9d6XMBTeUG8
 D64WEj/TTkl/4/EQSRh3v5QDrxWVaJmm/2WneQ7v8bbdPDiIeysm6thFPjItHT6mXe9QSGKvVaL
 H/OJKnOt/hZYfBxiQzGyLKLAnwZMy8EiraBIOLjVieYncyRzcmT9ZKC/nI1gk
X-Received: by 2002:a05:600c:c4a7:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-493e688c7c9mr28112345e9.4.1783520238814; 
 Wed, 08 Jul 2026 07:17:18 -0700 (PDT)
X-Received: by 2002:a05:600c:c4a7:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-493e688c7c9mr28111925e9.4.1783520238390; 
 Wed, 08 Jul 2026 07:17:18 -0700 (PDT)
Received: from rh (p200300f6af371400309b667846b924fb.dip0.t-ipconnect.de.
 [2003:f6:af37:1400:309b:6678:46b9:24fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a6240fsm46592525e9.2.2026.07.08.07.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:17:17 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:17:16 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eauger@redhat.com>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] arm/kvm: get demuxed ID registers from kvm
In-Reply-To: <7ab742c2-2354-4316-a727-a56175a321b9@redhat.com>
Message-ID: <9673dc6e-a15c-69bd-0850-5eced2174f17@redhat.com>
References: <20260702133606.34529-1-sebott@redhat.com>
 <20260702133606.34529-4-sebott@redhat.com>
 <7ab742c2-2354-4316-a727-a56175a321b9@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qcVvBX3UGplXHX6iSoRXdWRVtbKj_tyF4pmqWoUx_EA_1783520239
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hej Eric,

On Tue, 7 Jul 2026, Eric Auger wrote:
> On 7/2/26 3:36 PM, Sebastian Ott wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> We now have the infrastructure in place to handle demuxed ID registers
>> from kvm. Use it to get the values that kvm emulates for CCSIDR_EL1.
>
> I wonder whether that patch is needed at this point. Were previous
> ccsidr[i] initialized from KVM before?

Nope. They were not.

> What is the actual motivation to read them in this series.

Consistency I guess. Qemu maintains a view of the register values as
seen by the guest. This patch does the same for the demuxed regs.

> Doesn't it bring the risk to expose new values to the guest?

I don't see how. We obtain register values from kvm, we don't modify
them nor write them back.

>
> For instance, in [RFC PATCH v6 11/17] arm/kvm: Initialize all writable
> ID registers from host, I generalized the initialization of all writable
> id regs and I noticed that the new initialization of CLIDR from KVM
> broke the execution (which is not the case for the CCSIDR because I did
> it a try) because CLIDR was previously uninitialized and null.

I'm currently playing around with that..

Thanks,
Sebastian


