Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4A606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HIBWA/WQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOmL-0007sq-Ss; Thu, 29 Oct 2026 07:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMMyL-0001LP-UO
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMMyK-00018K-IG
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793268179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lgon1Y0wjM4ESolQGuvJRA7H9Oh0UjareY777hr+/cc=;
 b=HIBWA/WQZ6X43W26JjMjXfXKUQF7B6cEB1Fr4eLT1wJWuy4hg63f6CgpM4VKCZABwPvM7r
 TJZxY0W4B37VRQmPmk5KGfWzRkFT+7I/aMj55VvIfUV8v9YPsecB2sfDuUzCCWGB9ESGbN
 mqNLmiqQtA+mDqiWlhjOwcXxOdpBT9o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-LqD7rvc3OHOXbBFfylvkhg-1; Thu, 29 Oct 2026 06:02:58 -0400
X-MC-Unique: LqD7rvc3OHOXbBFfylvkhg-1
X-Mimecast-MFC-AGG-ID: LqD7rvc3OHOXbBFfylvkhg_1793268177
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-c25edb54d22so232489366b.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 03:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793268177; x=1793872977;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lgon1Y0wjM4ESolQGuvJRA7H9Oh0UjareY777hr+/cc=;
 b=F2WsRsTTlzsSqC2ui3nSodEtZgnMUD2HDPKFofk5Kr9t2eDrthXWwEN76LHFjdJofY
 1E6DjXtBVAGHC7PWGtoXN9SRjpZFVL0MLzh9MF089Sg/qbTZuZEJHRTlARRFyShs4z48
 9wlm8bqlCpH0Sog97NEeJK0O0gwy/EVHBQoj+dYjSl/eNbZ93WGhvsBY3Wi0CNS9c1yk
 2ted0gwbJdDsCePOc46lfJ9AtkJCezzZaXE8Uk+EfHFdECaWGGagArKepajWcV7k1LPc
 Vn4N6VPT8cqqQzo77tYpA2rYB/fuONwvm/eQc5G8JKT6z0zQbmzNVKlQ3Y9Hmf8Yhoq0
 LpOA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw4c0NmgpRXTzSQ2Q2KRrMwV2DkXOfvgdK10rJX6C3wfaI5ab54De2CPJzunhn6EOO0YSqBeXgWKw==@nongnu.org
X-Gm-Message-State: AFq9FYLT4aqj/yI25YYxDw8SWwpDX40f7aRwtnmiohm9ZxvwEEHu3rtJ
 IPMKB3h8JtV6QUErvWlPDZyIQ8ayf54pJGlxsQ/pfSibSWwV7i4OLpcAZ3qanJ9aabNVlJzWEXx
 TQDRjSTzOkEVEA9aJ41LYcaDow55dfFaUiVOY1spK/jt4A7lvlnKNyw==
X-Gm-Gg: AYBFou102T22FAvorwpEZhkXp/mN6fcSl1dAxxTPGETn7DxHml5SfRQIPjPPwC6J1Bf
 XREJFEvXj7DDUwfV6FvUdN4U0rp3QZedg+Hg5/OXxe9+rFpyEGxhCdvrbQ2MEWYsFVt68krKUZx
 EMKx8Do5OMRsFEPVM1xczBZG1LivFyhSPS2PHNPgfWt78+N6V4nIjJDSSMfyzLqbtUD5x0auv6f
 DyZMCvShC4XtWOS7DQplaZIWY0SQ8y1w0tq8PNoRYhtFjvwKhJn1M8e/8tPvqJbr69sZ2N/l248
 SyfSKx4X8cEWXBPYE1C88wuEQOvqj/G9rZEIWVyKqvj+yqWo7aWcUkPHIy7fzudGjYzNYSHulmv
 06O6DCFzYHq/c8vvQEU8/I4RMkV2RmDYBgTSJIXxc39adXYJi8w3O9yA36ZGHqjuwsn5kvzTDqd
 ZVRAbbglmcHzZAQCi87wj+djce8hUXqCuLzl8su+w=
X-Received: by 2002:a17:907:d26:b0:c48:9228:bdcb with SMTP id
 a640c23a62f3a-c49bddadefbmr468805666b.3.1793268177275; 
 Thu, 29 Oct 2026 03:02:57 -0700 (PDT)
X-Received: by 2002:a17:907:d26:b0:c48:9228:bdcb with SMTP id
 a640c23a62f3a-c49bddadefbmr468801466b.3.1793268176814; 
 Thu, 29 Oct 2026 03:02:56 -0700 (PDT)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3a1csm33912683f8f.16.2026.10.29.03.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 03:02:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:02:54 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, 
 khushit.shah@nutanix.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 7746591750@163.com, maobibo@loongson.cn, harshpb@linux.ibm.com, 
 amachhiw@linux.ibm.com, daniel.barboza@oss.qualcomm.com, 
 milesg@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com, 
 armbru@redhat.com, mbawa@redhat.com
Subject: Re: [PATCH for-11.2 3/9] target/arm: Move MIDR into isar.idregs[]
 storage
In-Reply-To: <20261029092307.281287-4-eric.auger@redhat.com>
Message-ID: <e743a8c0-a2da-570c-2ffa-6d45863f4996@redhat.com>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-4-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jMWua7jpqAimARxKE80yrPY_i63E51IrAxoAhD0zVDI_1793268177
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=seott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2026 07:58:06 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, Eric Auger wrote:

> Move MIDR into the isar.idregs[] array as other ID registers.
> This will allow to overwrite it as others.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Khushit Shah <khushit.shah@nutanix.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


