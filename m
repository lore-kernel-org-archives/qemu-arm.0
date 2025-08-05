Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B25C87FD1
	for <qemu-arm@archiver.kernel.org>; Tue,  5 Aug 2025 20:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujNqU-0006Fc-CA; Tue, 05 Aug 2025 16:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ujNqR-0006Cl-NI
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 16:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ujNqO-0003UL-79
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 16:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754424063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zShoLhc7QdLofb7EBM16GdCEn/h1ODh8peITA4SPWeA=;
 b=Y0+F2KsKHlEMFLbWCPJq7HrNyyfcYoGE8fAChvFFBBy1Zpdnlk8eqYE7mn6sLKuaaNDc+/
 hgtABYwHMJJFdrtXc/F3XhOTZmsdak/tfTqV9/H+rFxCqLahvo0Y84GIWMZMNZssMh3ZU/
 TTM6bh4W01v/LhHDgjw7HI4zc8djfOs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-tvVZVY9hPD6yWXPjhKuiVg-1; Tue, 05 Aug 2025 16:01:01 -0400
X-MC-Unique: tvVZVY9hPD6yWXPjhKuiVg-1
X-Mimecast-MFC-AGG-ID: tvVZVY9hPD6yWXPjhKuiVg_1754424061
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e69a0a8bcbso682841185a.0
 for <qemu-arm@nongnu.org>; Tue, 05 Aug 2025 13:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754424061; x=1755028861;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zShoLhc7QdLofb7EBM16GdCEn/h1ODh8peITA4SPWeA=;
 b=Wg5HUAzx4TN8xWWtbdK/iGFRLX3UM/GZuiLkqoyO1EM85X7Kk6e3dTcCPCb2e7ff3V
 8Hbp94zcfvaxkHxJuGvKIKNAgnRMwummG2KbGtrfqu25KEQ5xjD8o8A5cEgtvFmEzBYD
 FLBNqn5C7LzawzVqkvbSuvHglim537uYmfCsT5mkSgobLvofsyTPgH7N0qS6lzcKT7oY
 smQIb9jzZuCjS8B9nuAADVJoySkrtUJm0oIe7VpCCNquF3qY3kFZRK5O7SMb8hPx7hEQ
 ndyNCfO6FlzKWuKtXgPEFiOpRium7a9CYhT/HMHrSzkf6GAm3NNDQWiELmLWzKTuviLD
 jsfw==
X-Gm-Message-State: AOJu0YzXmbIzmihEpubiL/PPu+nqoFCuVcaTDZPKCEWkw2e5JgpCwLCP
 6WYCsieGrZU9V7HI8ZvFGl34OMoFAOxJr4guHDibJi4+s5wU27t7W3/65nzeSvHGD4Go6XJEuDp
 FhcVIVFd66+aqg/9JT883doFUAHxR9XlN+yWqraYw5Qx8/4BrhUdOvQ==
X-Gm-Gg: ASbGncvtpfh8GmQ0RTwGrGSwosrHqTPjkj+QLyVzumTIkJm0EjXTH6mqVKwMWdnPiGR
 X2UHP0+LIc+AbeILCZ2UVIlUguRytSmsXtYZKylxWeMZp0D76y8VQtJroqKaMa1T1gTQ8lV9B5B
 QbhXy4mBgHwxzD7zMmtdCyqKPvOHO7qnvvzi5L7DCT8VsFSE9MOB1On3vrOsxJk3JeyRyI7SI8E
 eEKk6SS3qyTu4CrP8ozIGZ7ef9T0kVX4cQRKugNVResDvuhsQ2SHabOuKHH9TmdSeY5x234kQNH
 cmYkjZ+a1TZalmpGHPcHXFk28FUvilUXO6eK+QfbrQhj5iGjcGGwoDth3lPLTUqRv/Kgq7HaGgE
 =
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id
 af79cd13be357-7e814eec6ddmr63987385a.34.1754424061399; 
 Tue, 05 Aug 2025 13:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgU3KGaF9lAXhF99U5wF/pQEmwfbpPx2Br1IGWuW8nwc1mWumfrd6/vkQrUAEw1GW69sG3HQ==
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id
 af79cd13be357-7e814eec6ddmr63983385a.34.1754424060861; 
 Tue, 05 Aug 2025 13:01:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:bbdd:3c5e:7d8b:3f72?
 ([2a01:e0a:165:d60:bbdd:3c5e:7d8b:3f72])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f753489sm717889285a.77.2025.08.05.13.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 13:01:00 -0700 (PDT)
Message-ID: <82833ff9-1f78-4929-82d6-f59a3b056626@redhat.com>
Date: Tue, 5 Aug 2025 22:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.2] hw/arm/virt: Include 'system/system.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250731144019.1403591-1-clg@redhat.com>
 <f9a79dda-83a8-4cbf-9a3d-dde4fcc0eb48@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <f9a79dda-83a8-4cbf-9a3d-dde4fcc0eb48@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rmhB-S9MxB5m5Y8gwJhgY2QrtQfHiMNKdazljf6KqbQ_1754424061
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 8/5/25 16:16, Philippe Mathieu-Daudé wrote:
> On 31/7/25 16:40, Cédric Le Goater wrote:
>> hw/arm/virt.c should include 'system/system.h' for :
>>
>>    serial_hd()
> 
> 3 other files miss it:
> 
> $ git grep -L system/system $(git grep -wl serial_hd)
> hw/arm/virt.c
> hw/isa/isa-superio.c
> hw/mips/loongson3_virt.c
> hw/mips/malta.c
> include/system/system.h

OK. This deserves a v2. Will work on it.

Thanks,

C.


