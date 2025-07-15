Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0E8C83F21
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 08:57:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbTj-0007KN-Qa; Tue, 15 Jul 2025 04:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbTV-0007Cf-Jk
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbTU-0000om-1b
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752569839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tpDCRdDUCzxc6AdghgUVNXaGz5CPdFgq95lQvt4giY0=;
 b=BOvoYYCKRiF329PhegIXFNWicsTFbKrUNzJRanlgQ57F67SVYknAHBRJZoD0cf4w36LeoL
 TGEgXbX3LhaY/v6yCV4O+qUziZwO9+QjjwnQWlnWTxnPnKRGUa/3Wo3b8FqMHRwE6cdxqP
 Q9kc3DdlKEb3Yo/YtPOVkAVSuTcO0EI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-oU64OVFkMXWR-JyW7LL6ag-1; Tue, 15 Jul 2025 04:57:18 -0400
X-MC-Unique: oU64OVFkMXWR-JyW7LL6ag-1
X-Mimecast-MFC-AGG-ID: oU64OVFkMXWR-JyW7LL6ag_1752569837
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f7f1b932so3076404f8f.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 01:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752569837; x=1753174637;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpDCRdDUCzxc6AdghgUVNXaGz5CPdFgq95lQvt4giY0=;
 b=fUAlqsn4Ss9gYITBYqCyy3qw5ve9JDsZqBTvZ+YyIu/3NAZRW91G0F3oEDaZzNJGrL
 8uHu6tST7IHc7qZAeadh8x/NOkoZcxRfDZUDDWMjyErCPs37bAt5yoh1sQ2BhTgziTXs
 vnj/dUn0iHQiAwqrES3/7NcnJhf31edwJ564ad+qZ5rKd7b6P8xK0eYbQPvlFhnxVaYe
 CAkdgn0pEs+OGak4RL4zCC/q/tMCxrVaQDXitaA1hdqjymCVSReHkSesDtdMZZZprmTy
 BdtoLTDPpmwUnjhll5kWOIe/RFtvFgkeRetJhxNIoSkgh8GRQoPZSkCgMHOB0GCQDB+T
 /NGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2r4pqKbHrEWR2e1FkKGNsF7hdj/OwL6d3bmSB/Y4Ngx2xFo3VN95P/u9aHwtYxL1Z031JkMkx1g==@nongnu.org
X-Gm-Message-State: AOJu0YwdMJDQomJNDBBsMBxUKimQwQwsVj+LLWhoNgFAPSIsCPyQQZee
 XQxTzUXavCO/Z9KAFKqcUPB7Eep8n7wa816OmoKKfFqIe0uCGfPAbnwUeFQYUJFCbuNrKQdrBp8
 KSQFuxShmksxW0xSWExIL7cOKbEe6KlirLHCMQ3pP9TKYc4Rt8k67AA==
X-Gm-Gg: ASbGncvqFAG90cGSqlGntfvym14nKjoQNzCNs3Kzl7BR8JTUQO3HR5XdXwYTd2LxD0H
 hWG+CIdLH7UtNGqojbs7meUtGc94vX0R4hyza6IktugGR/MPr1yQr0ckbs4KOYas6OKaIH/b2qq
 ln1BovHl3EYhR0mtrcS/dryLC9U3MT8PJ8klgYGdLVRl6OJxH+MratoVTf6qkO+tbxOl+j+sQPL
 Nf3XgCnaX6hqJ3UP4FKaIg4kUbZoIl178yzkiAzWAOF0e5aVF58mlPMPSxphNnkY74OL+/RQgN7
 p9Jkv/9eOIExPHlcsOreblXigUMhISdl+WeepWntEIevc5ZRFkuNW8bwtAIzE47o8GDqs2fRPf8
 =
X-Received: by 2002:a05:6000:3c1:b0:3a5:2cb5:63f8 with SMTP id
 ffacd0b85a97d-3b5f2dfd929mr10925216f8f.29.1752569836712; 
 Tue, 15 Jul 2025 01:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG8blftA21e29tuGweBe38fO2Oqftk3JrnZMsJxqrpNqvBVfyKvo/lDafvVgAlYKBJPucWwQ==
X-Received: by 2002:a05:6000:3c1:b0:3a5:2cb5:63f8 with SMTP id
 ffacd0b85a97d-3b5f2dfd929mr10925196f8f.29.1752569836251; 
 Tue, 15 Jul 2025 01:57:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:266c:b13b:afd7:40fd?
 ([2a01:e0a:165:d60:266c:b13b:afd7:40fd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456278a4460sm9975265e9.1.2025.07.15.01.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 01:57:15 -0700 (PDT)
Message-ID: <7339beb6-141d-4f81-b87d-87e7c32ec957@redhat.com>
Date: Tue, 15 Jul 2025 10:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vfio/migration: Max in-flight VFIO device state
 buffer count limit
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Avihai Horon <avihaih@nvidia.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <0e88a253e06647f6c01bdeba45848501b3631bd3.1750787338.git.maciej.szmigiero@oracle.com>
 <4fbc3288-edb4-4942-b3dc-df7beb1e3f24@nvidia.com>
 <cb4049d8-b6e4-46ab-956e-5f65029e50bf@maciej.szmigiero.name>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <cb4049d8-b6e4-46ab-956e-5f65029e50bf@maciej.szmigiero.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zibwijuGwSCwygYiNsPc4dyzYjrVv-GDJ1MmZQ7ubHQ_1752569837
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

>> But do we really need both x-migration-max-queued-buffers and x-migration-max-queued-buffers-size?
>> I think one is sufficient.
>>
>> I vote for x-migration-max-queued-buffers-size as the actual memory limit won't change depending on VFIO migration buffer size.
> 
> If just one of these limits were to be implemented my vote would be also for the size limit rather than the count limit.

Let's keep the size limit only.

Thanks,

C.


