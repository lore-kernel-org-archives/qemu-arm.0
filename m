Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3621162njk;
        Tue, 3 Dec 2024 04:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVhB0W6vQ7TXzOSB8yakSwMZ6X/Gp5rYzD7Sa0lM/RP0WX99tPdaZEaySt5J9t0UTWXo/8hy0Kaskcgw==@linaro.org
X-Google-Smtp-Source: AGHT+IExIB8jrYdHx2xLPhcJUgsmt9nWHHVMCN/37RKRPwUCgJxjtz99hwZ5XMqjod7W3Ae1GKnk
X-Received: by 2002:a05:6214:29e6:b0:6d8:8bcd:d279 with SMTP id 6a1803df08f44-6d8b738c000mr24237236d6.27.1733227417855;
        Tue, 03 Dec 2024 04:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733227417; cv=none;
        d=google.com; s=arc-20240605;
        b=k1nKlhEJ095Kfar1KFrSj/+B2NyPVGAzm01rUorAXADlX27vsGxPNTXVEAGb9ZkYPO
         9i0rBscuhy749gP6oRwGdvESX8YkUXRNoohxRZDU0JnfBxjSmbB0aAqm3kuE/420+NUj
         Dt/J+ze7PdnMc9/4Tr6u8rMcMa+rrCxKZIRfp9DDnXdkGp1c0SeJdclrpj0soHfVqPUT
         zc4yGDnUfEEzcBWnAcphOZdBvvxjTEgSaTBhQm+G/zw8yEEz4dVzVmBF5FZKmrZJ1BBB
         k9mdsPLq5vYnCDvDiIxwrFm02K1ncTbjduFJAT5zoYWUYWtQxirkXrSDtOSNbb6Eo3NO
         nvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=4YQjTWNT2/ZULkAOQhIB/FrcUS2zmuZhKSNT4bwFCxU=;
        fh=sTRoISVgT01eb83NVZqZlyhs2qy9oDkW1+k/RnrNP/Y=;
        b=Fpb/yPrWVHA7OVYTIlgjXXcZbo1KXHiQV5Y9GtkgMdOe6SmeCLiat7aUVTAkoIyQxS
         NSdiTBsfRJ6YQtReO5NYHHCHbuDvHp3VzjH4HTGNua3tzKw3O4hQzHETzQajQstMAZI/
         G6lwurHkhn52EMY70zoKW5Clox6jN2Xj5MdJ9NCL8MCZaemYtVhf1aw8nN3dG+OFM7CT
         WjUtbHKVUDw52QSgcVu8FdqmXENLC7LELlQaHpxLIVRLdDy9TmtXAlk7/pWSnGMy597k
         1mV3abvgGfzajJD0YNXjULuf0AGgANzloio48ZDEicsN7jIODKouvzd5ycr1IZW6S7gR
         pPYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sf+KTBf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d89e82fb24si65323496d6.167.2024.12.03.04.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 04:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sf+KTBf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIRcp-0007T0-El; Tue, 03 Dec 2024 07:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIRcc-0007RP-Fh
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 07:03:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIRca-0003vc-R8
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 07:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733227396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YQjTWNT2/ZULkAOQhIB/FrcUS2zmuZhKSNT4bwFCxU=;
 b=Sf+KTBf2c19sKnukh/plKz8vjk1cHovRcxjEuUlzbGvnt6H75trdGO6ioziM0HDlx665lv
 sWGNH1dyKvRRseDCNTm+LFuIw1Ljxdj+Xqdt9E0rTYQhkL/E3+K3Ag+wqRTWx8B7LmVc6S
 jGDlgAae3JcnE31pNjc42P/BFkiuj28=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-d3nxSrWJPIiQTqzsaQ3Xsg-1; Tue, 03 Dec 2024 07:03:15 -0500
X-MC-Unique: d3nxSrWJPIiQTqzsaQ3Xsg-1
X-Mimecast-MFC-AGG-ID: d3nxSrWJPIiQTqzsaQ3Xsg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385dcadffebso2038238f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 04:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733227394; x=1733832194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4YQjTWNT2/ZULkAOQhIB/FrcUS2zmuZhKSNT4bwFCxU=;
 b=TEWsXCtkJSeTjTMRyKSPE64NGy6QYcFvt+0nbJis5LLYovdfiHXTRcH9GuC1TwIRvu
 9j+POHHsZOGcYBu/SqSXDbEa4gw6J/hnq3+EfxSPuJsbhMcY3H0ooAAMnsWM018UU+nt
 cXVoXj2G71f7JVNwPXQE/+YdOGkERJ0xZcOJrL4neQDKPVEa/0nPR68CzygvvH6z3os4
 4ti98tISNaGwHYg+yO3OG+I1xcld65s4ul+E1MZvLWiP+Dx+3rtG3rVhltjs3jigp03z
 EZHJRmJ6VVBxgED4ovHZn2vKUIA7EeOg07zBfyZFpdn87pyLDNsg48CkZjZIzzfr84p6
 0Fvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfYe3qAYlS9JYAKGN1VD5r0h5aWrTtA7dNlMl+NBmiiE2YXizwgTNcwAuksyZEeaIBxg1gUZYOHw==@nongnu.org
X-Gm-Message-State: AOJu0YycximkrT7rFUY4CWt/KvKt/wc3y6RIhzpjJ2a8ellzR5DTS321
 4q9J/q/p7/nD+SD1T9G1WxvnRk7/AkZT7OwaTyGejquLROkFFUIq4ai10QUyuC2T9JOmaBrJWg0
 h8/sK4W4vBwKU8ghrS8AQ2n6FerixkuGawYJLfmCUQDdZXhd/3Q==
X-Gm-Gg: ASbGncup0+j3zwfo5KIIA1cHEESy8iCAfK2Gh2Nv5bmnu5DcRUSu6PBvH5YWmK9YqUo
 0MJtcaSGGTzKD0j9Gy/Gq/ynsJR1Kofsz8FZcx3lGDItjCWtoK5YFRcZnuujNNXUvsLfOQemNVj
 jfyf/FN+nuA3egDxpttLitW+iSXynT8+9EpvGjrs4lsAgFwFHUeK0rX3SzxVZLo0mwqclPuhYOy
 VCcHp4VCeFnxHgwb/0QAHkY9TW9fZAKbBkOH067d1Ga7rRtAlhGT0Ar5lxRWYKg5y9Z7W94SS4A
 msgs9CDYgRjCK5KAxWBRxQ==
X-Received: by 2002:a05:6000:1fae:b0:385:fa3d:19c6 with SMTP id
 ffacd0b85a97d-385fd419e15mr1905612f8f.38.1733227392536; 
 Tue, 03 Dec 2024 04:03:12 -0800 (PST)
X-Received: by 2002:a05:6000:1fae:b0:385:fa3d:19c6 with SMTP id
 ffacd0b85a97d-385fd419e15mr1905565f8f.38.1733227392047; 
 Tue, 03 Dec 2024 04:03:12 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e06c485fsm12038499f8f.83.2024.12.03.04.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 04:03:11 -0800 (PST)
Date: Tue, 3 Dec 2024 13:03:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao
 Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/5] Change ghes driver to use HEST-based offsets
Message-ID: <20241203130310.0bde48c0@imammedo.users.ipa.redhat.com>
In-Reply-To: <cover.1732281080.git.mchehab+huawei@kernel.org>
References: <cover.1732281080.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hIY_SEY6NkjTpqJML4oDJr1d3FIsFRTS4wb8gxrfut4_1733227394
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 6q20xijtK5+k

On Fri, 22 Nov 2024 14:14:10 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This  series was part of the previous PR to add generic error injection
> support on GHES. It depends on a cleanup patch series sent earlier
> today:
> 
> 	https://lore.kernel.org/qemu-devel/cover.1732266152.git.mchehab+huawei@kernel.org/T/#t
> 
> It contains the changes of the math used to calculate offsets at HEST table 
> and hardware_error firmware file. It prepares for the addition of GHES
> error injection.
> 
> The first patch was previously at the cleanup series. It prepares
> the logic to support multiple sources.
> 
> The second patch adds a new firmware file to store HEST address.
> 
> The third patch use the new firmware to calculate offsets using
> HEST table.
> 
> Patches 4 and 5 add migration support. They assume that this
> series will be merged for qemu 9.2 (maybe it is too late for that,
> as QEMU is now on soft freeze). 
> 
> I tested migration using both virt-9.1 and virt-9.2 machines
> on qemu 9.2.
> 
> I also tested migration with:
> 

> 	qemu-9.1 -M virt-9.1 -cpu cortex-a57 => qemu-9.2 -M virt-9.1 -cpu cortex-a57
> 	qemu-9.2 -M virt-9.1 -cpu cortex-a57 => qemu-9.1 -M virt-9.1 -cpu cortex-a57
was that with HEST enabled (it's 'ras' machine option),
It would be better to provide full CLI used 

> 
> ---
> 
> v2:
>   - some whitespace and comment changes
>   - patch 3/6 (acpi/ghes: rename the function which gets hw error offsets)
>     was merged on the cleanup series.
> 
> Mauro Carvalho Chehab (5):
>   acpi/ghes: Prepare to support multiple sources on ghes
>   acpi/ghes: add a firmware file with HEST address
>   acpi/ghes: Use HEST table offsets when preparing GHES records
>   acpi/generic_event_device: Update GHES migration to cover hest addr
>   acpi/generic_event_device: add logic to detect if HEST addr is
>     available
> 
>  hw/acpi/generic_event_device.c |  30 +++++++
>  hw/acpi/ghes.c                 | 156 +++++++++++++++++++++++++++++----
>  hw/arm/virt-acpi-build.c       |  33 ++++++-
>  hw/core/machine.c              |   2 +
>  include/hw/acpi/ghes.h         |  23 +++--
>  5 files changed, 216 insertions(+), 28 deletions(-)
> 

