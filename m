Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC125CD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:44:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMav-00042J-JS; Tue, 16 Jun 2026 01:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZMad-00040s-L8
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZMaa-00070n-9f
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781588633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Z8zc84+Y8S4dKvEtmYWFQFZZlFP8XnxlBQvAP6/aQ0=;
 b=OVj1m98JTdpFoR0+jBA2sP3tlWlntWJcztw2Eq1tIVnasqX8kKlwsYBmO3/AljyzkZ7YBT
 WtZTbFUhJTyLy6/OAvqo1o/xyOcOw/G/LUvasEcZDim4UPZjACO7EJsH1MG/RHCiB0w3KM
 q4zhEEmxqh6ayL2iHNsKSYhPF+YToL0=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-GnWzPzOpMC2V91qnA9-gdw-1; Tue, 16 Jun 2026 01:43:51 -0400
X-MC-Unique: GnWzPzOpMC2V91qnA9-gdw-1
X-Mimecast-MFC-AGG-ID: GnWzPzOpMC2V91qnA9-gdw_1781588630
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-137e49e896aso3622756c88.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781588630; x=1782193430;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Z8zc84+Y8S4dKvEtmYWFQFZZlFP8XnxlBQvAP6/aQ0=;
 b=tY7QUfxuSVeA/VgoPim5AUbumdpTIzy7XzCHTYNQZgjru4jrcqmj1uy/aBUMNP1F+r
 o+CJjvsS1y7K5PIOBcXj+2DpXfMvwiqX0D4ByaaQRwTg6g61c3sElQMdhbL0iJkm72G1
 XyqCu8M5jRD3ecpZTXCEZfs+6w8EMiWo1aat8eBHmGizy3QdOOu+QGcHthLpmGvZBK8R
 NBdF+LcU0VtxvDcPoiw3gJNCNbf0GLTQ0v73fadeqps5fBD7+Zutt4qBwuBagum4tAc4
 t3y7HHWJZodDP5VBGES+7ti2oilnIoBrtW7wg93ix3fFUkSYgjrUIIgdx1k54USLj8OQ
 h9bg==
X-Gm-Message-State: AOJu0Yxh2h2v9XTzRFHsBtyFH77NNGaIfKj8Q19Vchy2uygG7nD1M2Oo
 H0Zge8dV6rdNq76jyUASXg4YZ0YYKak0juY2rwxIWna6fxCFCsKtqpy06ybzUZcpjDd7LP/AL6O
 sJ2UYsGmHoaMyp2wui+mAARPcVkY1iR4OfqhGyFzmvV7PWHtQECOcmA==
X-Gm-Gg: Acq92OH9npw6UerofGve9fCECcwJh0bgKxZ6I+Va5ecX8fop1WUDXTZSGn3CpvSlfqD
 GhZtVBGZGk3CjfgYMRAFA6w0/zJlSKAZkcXCmU7zHRqradniXmzJZ/pzDDmxvppXkLqljQiECOB
 mF5UU+WjaYE09RSgGDQzPsugdM75/rUMGXEMrOvX8rmJU9TbXLEbloT2MEXurHBMmfv4ImqRuZy
 0rSrIvCGdx+uhQQ0dL/eSmKeFzE1EmjYu64ErFvXeE1fGkoNlOOUoeZJ2TGR7nZnsJbu3CGY3Kj
 VyJ9F8f6LROvFsINGOEx+C/RHkQF6RcG2mLwWvK8iMy52qF5qmAhcf2S7v8cfkMCmA+8edT9tv1
 oZCjULJ1Lh8pKdetY2WWdyoHrHVBDcpd439EENbSmw9UqBG9mEgNTMjr0d1ULgbos
X-Received: by 2002:a05:7022:913:b0:132:133f:63a7 with SMTP id
 a92af1059eb24-139857d69f1mr1083214c88.8.1781588629783; 
 Mon, 15 Jun 2026 22:43:49 -0700 (PDT)
X-Received: by 2002:a05:7022:913:b0:132:133f:63a7 with SMTP id
 a92af1059eb24-139857d69f1mr1083193c88.8.1781588629180; 
 Mon, 15 Jun 2026 22:43:49 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1384b9815a6sm12822286c88.15.2026.06.15.22.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 22:43:48 -0700 (PDT)
Message-ID: <72af3afa-c4da-4060-b039-bf732ef4f4e5@redhat.com>
Date: Tue, 16 Jun 2026 15:43:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] system/memory: Make ram device region directly
 accessible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org, peter.maydell@linaro.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616013359-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260616013359-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E3CuQyMjI2VA-b57hkXEKd1omLRaszhQKxWmZUI-V3Y_1781588630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


On 6/16/26 3:36 PM, Michael S. Tsirkin wrote:
> On Tue, Jun 16, 2026 at 03:25:50PM +1000, Gavin Shan wrote:
>> All ram device regions was turned to be indirectly accessible by commit
>> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions").
> 
> 
> What is missing here is the list of issues around
> direct ram access and how we are solving them.
> 

Sorry that I saw your request for the inclusion after v3 series was
posted. They have been appended to the thread as a reply.

Thanks,
Gavin

> Thanks,


