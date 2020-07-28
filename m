Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp394771lfy;
        Tue, 28 Jul 2020 01:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6iBbU2WQnJ4EJwrhDLwIREkbO1bsdJJaXJ1MIx4TYMiZVJxq69VjGs4TOudTdT/QAlgC9
X-Received: by 2002:a05:6902:512:: with SMTP id x18mr11610207ybs.496.1595926101174;
        Tue, 28 Jul 2020 01:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595926101; cv=none;
        d=google.com; s=arc-20160816;
        b=RIAX/iIYRBtMwXKLEjbsJuVAdgvwK2Fb8ov4enz02etdK4N7SeF79Hpt8g7DSwL4WG
         PWu8ONJbfyRUC3W9G6f5UC7/dPpSYwx49jRSk23cPAOtkNZEQmTXKyiPHHDTQ0QSJb2e
         lEiSkp1QWe3yKk3dvbAq0/uUatIRBdDk3yoRLlD21BcXjIe3QRh5kyBedApMf0nm136y
         pPw2aTrdGqVWzn6yq8xAIK2+h234nhxH/Y5gB1Zw4wVTZ0yJAqKxHZL/GTywELFaXjzP
         Hopuq0PBIvi1Xi8AfPx64pPousZVMKNqVZroif/oUwpQVxSwkp4PsxGc1i1QfYZGdKLq
         lZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=ao3c9TQKb+juCT9/UCqPiTX4wcTHfvLH4i6SAgssd44=;
        b=cnQIsLBPER5a1q7h8sE5hnVVeSbHHQb4C18HZTABUXL0oRvnfLUmQGWXIw3ZlOps/P
         +l7tBXSTLTNuFqgdSj8qDaVJ8+ajPlunLlG6F47SxPqerhWOgdHYvapibgSFetood4WS
         mSUqe3eTJbvmLFtLJo3CnKl/CapNX1yb9G5gbDx1whkauhmAHIANxX3WoZVTcMBtMVPt
         C1lZfBfpi4r5YTM7qeV9gb6EtzLWzfIHcuvgDLpAQZCtcdov2J2KfUaZ4ICw8KVaT2B3
         wHLZBFmL+g9HbETfAYLGLp2TJlCanusOQuRXVj9s7T4B/1d1qGveXXEoJaUf1/Dw5hSi
         mtdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ri4EUOTd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n68si12339789ybf.148.2020.07.28.01.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 01:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ri4EUOTd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0LHY-0007FV-Ig
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 04:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0LHR-0007Ev-6O
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 04:48:13 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27842
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0LHP-0003f2-Ne
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 04:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595926090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=ao3c9TQKb+juCT9/UCqPiTX4wcTHfvLH4i6SAgssd44=;
 b=Ri4EUOTdu/mkGhCJQMY7Uq8eyPkjB3jSyQy3edpBsRmgUNPW0u1ggpjNAm5dIaOgvmoT6E
 fpnQb5zBO7a/4/HWgR4YX8Ox587n4id/qpd3umSpvXmeGGWmlnxdLrZhM0o7WH1Ijkvtkw
 xxvX3t1SRFgzW80f/ygk17zeP7HcBl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-I9n3-TntMqu6TfwaycGEJw-1; Tue, 28 Jul 2020 04:48:06 -0400
X-MC-Unique: I9n3-TntMqu6TfwaycGEJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2548D8014D7;
 Tue, 28 Jul 2020 08:48:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-161.ams2.redhat.com [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA3C560CD0;
 Tue, 28 Jul 2020 08:48:02 +0000 (UTC)
Subject: Re: [PATCH] bugfix: irq: Avoid covering object refcount of qemu_irq
To: Peter Maydell <peter.maydell@linaro.org>,
 Keqian Zhu <zhukeqian1@huawei.com>
References: <20200727130225.32640-1-zhukeqian1@huawei.com>
 <CAFEAcA9vQMP0YLAuzdPW2m3RcRNySxA0gJQZmeXBUYRy4=Dk+w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <92e8dc9b-deed-afb8-89ae-f50b68bbafa8@redhat.com>
Date: Tue, 28 Jul 2020 10:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vQMP0YLAuzdPW2m3RcRNySxA0gJQZmeXBUYRy4=Dk+w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 00:06:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: yezengruan@huawei.com, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tOg/CmI0BDUJ

On 27/07/2020 16.41, Peter Maydell wrote:
> On Mon, 27 Jul 2020 at 14:03, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>>
>> Avoid covering object refcount of qemu_irq, otherwise it may causes
>> memory leak.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  hw/core/irq.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/core/irq.c b/hw/core/irq.c
>> index fb3045b912..59af4dfc74 100644
>> --- a/hw/core/irq.c
>> +++ b/hw/core/irq.c
>> @@ -125,7 +125,9 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
>>      int i;
>>      qemu_irq *old_irqs = qemu_allocate_irqs(NULL, NULL, n);
>>      for (i = 0; i < n; i++) {
>> -        *old_irqs[i] = *gpio_in[i];
>> +        old_irqs[i]->handler = gpio_in[i]->handler;
>> +        old_irqs[i]->opaque = gpio_in[i]->opaque;
>> +
>>          gpio_in[i]->handler = handler;
>>          gpio_in[i]->opaque = &old_irqs[i];
>>      }
> 
> This function is leaky by design, because it doesn't do anything
> with the old_irqs array and there's no function for un-intercepting
> the IRQs (which would need to free that memory). This is not ideal
> but OK because it's only used in the test suite.

I think this could better be done without calling qemu_allocate_irqs():
Simply call qemu_allocate_irq() (without "s" at the end) within the
for-loop for each irq instead. What do you think?

 Thomas

