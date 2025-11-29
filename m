Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3054D116E2
	for <qemu-arm@archiver.kernel.org>; Sat, 29 Nov 2025 01:23:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vP9gj-00030k-2s; Fri, 28 Nov 2025 20:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vP9gK-0002rg-8L
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 20:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vP9gI-0001iT-Qw
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 20:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764379402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZz0QzStaYQHqZm8kSZreJc4ro68jES1JxZ7eYeKKhs=;
 b=Xy/oZpzqF+VNZy//xTHAxP0LDw1a/7+HkaBDG4SZZY0s5IXvaLqf7zW0zkrnsqkJyYz1cu
 3jHDeYMnkbfyw2HaCg6221Uv9FJlSfXrFA4oE5ArVhoqU9j67Tyg/AvGYzDUFWj7D0UPlq
 y+QzKEdXPPSxsBajN2bZ4Rcmbr+XSxc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-LCEWzZ1SPy6LPe_XmfuwyA-1; Fri, 28 Nov 2025 20:23:20 -0500
X-MC-Unique: LCEWzZ1SPy6LPe_XmfuwyA-1
X-Mimecast-MFC-AGG-ID: LCEWzZ1SPy6LPe_XmfuwyA_1764379399
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-297fbfb4e53so35957495ad.1
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 17:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764379399; x=1764984199;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZz0QzStaYQHqZm8kSZreJc4ro68jES1JxZ7eYeKKhs=;
 b=VWTJsKuoQK/yLWGObRwCirT9VV8I4VNI8y4gQP5ntOQ8E7JylpxQ+CZTHCYecm3fjy
 Ku0QdSLQ3FcoMzVVKaESstX6GIyl7VbD+Ecuasfe1gomeHGYjEFzRe3UaXt3gtJsVCm+
 W9Tlr9sjOqasMdbjHB9LYgvPVEfWpaItku8EmY/WWsdIETzG3xWNa6s752UBqtWfarga
 lxwX8rWRAOAdOUOh61Hxm9kIL1pIRIZnjWs9IQJNeDTmbs0sQ5xKdR9v1efNW7tNsnp+
 cdvJY9DIHmzjhcSlyCw+T0hePD0u//9A6fPZaJkrDJRmvf67eK+Ah7tSg88wciKvzXPF
 dixg==
X-Gm-Message-State: AOJu0Yy8pK8PxzYK2NDUMVvCQAquXWve2HMKfJjD1FuUbu13mBIEhLJj
 3K65bN61cCHygZrRdNwiH7pq/Q5YS6p+KBarh17aFA97d4U5TNOhmEWo4EnaHJ2dps6hM+vK5WT
 iobTMmj+O9ipoE1+JfiMf3Y/AQKHdmFMecB1X48T2bWGPMt6lhRkjcg==
X-Gm-Gg: ASbGncvJdoaFwkn1pGA0XtoL1tUURSD8AlYwUjudtU/PFHTeCjfFLYFpyOawLb3oNgf
 +20kPdflYetG4Xdlt0fa+h6TUax8LqhOLzKbjdqpDMk/vflUggb583Ceaqqy6qXrmIjDYk7yzcB
 C8eyI43kAqlqH5ITxHWJPCuhfo4xpn6tpHTCRprm8/JwZFkfFPbOy9YkjE2h1jTmpzlhy1bHIPq
 kHPjeB71sY0gXb50hhd0vKFrTCv5AJbOuY9C4T6KyUy0EV7kVbaD3pl14J6kikAowvoU0IfqF18
 vkrJJz87fKIY+oSbb2qROP8Uypv3IBMos8OnNinlpsAqYmRK6bYYk2izk0tE5E4Gh7nwIhrUmsJ
 LtVfNNTUKdsY/Ye6QotxhM1Z+PSLDR+wmCy8UoJz74cJU6K/Uiw==
X-Received: by 2002:a17:903:40cf:b0:295:ac70:10c4 with SMTP id
 d9443c01a7336-29bab1a5ad8mr192788905ad.47.1764379399479; 
 Fri, 28 Nov 2025 17:23:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9ErO/CDJBlfmUPt3o86QVVKmhR0iK5xwzLo4jc97GKsTFe0R6+LOhyiYNviTBkWA2V6aN2A==
X-Received: by 2002:a17:903:40cf:b0:295:ac70:10c4 with SMTP id
 d9443c01a7336-29bab1a5ad8mr192788565ad.47.1764379398974; 
 Fri, 28 Nov 2025 17:23:18 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be4fbb0094dsm5886210a12.10.2025.11.28.17.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 17:23:18 -0800 (PST)
Message-ID: <a003599b-a539-4856-8b35-1439eb92ae90@redhat.com>
Date: Sat, 29 Nov 2025 11:23:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] acpi/ghes: Use error_fatal in
 acpi_ghes_memory_errors()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-6-gshan@redhat.com> <87o6on7uzd.fsf@pond.sub.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <87o6on7uzd.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A2zqILcTjZhWCuWgBQWtoIw5IZdX56AKwhKSFIbstXg_1764379399
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.014,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Hi Markus,

On 11/27/25 6:14 PM, Markus Armbruster wrote:
> Gavin Shan <gshan@redhat.com> writes:
> 
>> Use error_fatal in acpi_ghes_memory_errors() so that the caller needn't
>> explicitly call exit(). The return value of acpi_ghes_memory_errors()
>> and ghes_record_cper_errors() is changed to 'bool' indicating an error
>> has been raised, to be compatible with what's documented in error.h.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> I figure I would've split this for easier review, say 1. return bool,
> 2. convert acpi_ghes_memory_errors to Error.  Since you already got
> review, it's probably not worthwhile now.  Next time :)
> 

Nice point, thanks for your review. Lets try to do that next time :)

Thanks,
Gavin


