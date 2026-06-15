Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706D8CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 16:16:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ9yk-0003Hb-8N; Mon, 15 Jun 2026 12:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wZ9yi-0003H1-QG
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wZ9yg-0004ll-V3
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781540157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTtlP/QqSsUw2EpG04vwnXGEzoXHtHIDItfhdWtKU7s=;
 b=Y22rYQgFO1uzI2VokN/SM2sHRDRDj10bm8XE5/qyUjaSy/xGfZlBuA6n9co9WvnFMYdv7F
 luZ7P7gh2kJgrHAS9wv+CahJvmz9HBB9DaAi14yTXNJ3j8rX0pTW0qZWYXaWgv7kqIWdzi
 Puh4MHvTUdBqXtGPqoCfRho/CCixM8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-9D3QSKeWP6S_LJMdG7_yZg-1; Mon, 15 Jun 2026 12:15:56 -0400
X-MC-Unique: 9D3QSKeWP6S_LJMdG7_yZg-1
X-Mimecast-MFC-AGG-ID: 9D3QSKeWP6S_LJMdG7_yZg_1781540155
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b37e1f48so23910175e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 09:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781540155; x=1782144955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTtlP/QqSsUw2EpG04vwnXGEzoXHtHIDItfhdWtKU7s=;
 b=DGOiP8TuwRhQv119wNYxMMamGMfLgXyYzAum5SMoMITXO0RsJTC/d6gEqhvwV2BE4U
 iP5GGdMCm9sETd+QY1zZz8fo3AUz1rRfJ3fUaR/sd2XEAf2ZG8qtWjtRlHOPRsvqthKz
 E+Frmiq/P82lwFiqZ0qzHI+whWL11AKpGZ3RqtqmlJGv0lLvztibSIP6ON+hYmx6UKAK
 hLWuVSRIgE+MgEoyDJ3TwlbT9N8MEXY5cO5NncsN1kP5UZMMPP9EFy/AP/eJBgQYgjuH
 Vt7QhsUpsmMKrPy4UayXkNM9RYLfXzQ6KpJXT3Cuyes5gI/PLaO0XggqfWLW2BZmBUq0
 WERQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8B97lmPIow45PbF+aLBSFJeG0OGOjkxK4eYm6GMFsi9pGeXT/qFA+V83Mw8d8alB/ViMRPhSp9Ww==@nongnu.org
X-Gm-Message-State: AOJu0YxTrs9Y+tTdeCKWxeRoaemvIRKu4TLSTbhnoihalguk0+bKfSfF
 ox1J1+QVUjYCWt9YVbYYBZ63lwsFkWS/wo9hCwyYCHZEG3Unnsq/gkjIx+ekNuMr6x7Vkx4fdkV
 2N3fbD52AzxOvdU/x9PPdQqwh+qKMNFCdfAAQyn+UXmcpKFnZNzDFow==
X-Gm-Gg: Acq92OGlEg2IpzUX/iFyYw3Q22u1hfmRWW33mXSdaZ0N39FNkXTyqH+nkAh6V+EabSw
 d99zKsxn3ZekQnWPagSmFoGW8/5qbYfNMWtZ4LoGEmrFbRauKuhwrabamCVM6rJN0/+LnMiW4ef
 2v2zBGJ5SiJCowfdOaGuz0THjDtGH6rTE65wDVGwkZW9nRsuNoUiDX6xgV5IH/TMUd4/I5RPShO
 a1UQf6aAVcWakifmPAW1WIB47xIR7WI7tu0NcXAS37ST+Mf4eWbP/rKzMRjsGgAgTqKjfirFVSc
 2fZjTiyLDpMbdeFOsS6NSZUtPFMoHRXe4Vus/G//OlEyMXOE6hVKKFzAR13IaDmafsArdOHwKEQ
 2Jclx+hYX+mXEBRuyhtZyhAivwzQmqoZxyC7P89PVt4ng7c+l9qkuNbI/hb8Jfu8RVLR1LQ==
X-Received: by 2002:a05:600c:6d8b:b0:492:1e36:bb03 with SMTP id
 5b1f17b1804b1-4922011dfd7mr118352805e9.36.1781540155083; 
 Mon, 15 Jun 2026 09:15:55 -0700 (PDT)
X-Received: by 2002:a05:600c:6d8b:b0:492:1e36:bb03 with SMTP id
 5b1f17b1804b1-4922011dfd7mr118352165e9.36.1781540154539; 
 Mon, 15 Jun 2026 09:15:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0c10sm36563089f8f.21.2026.06.15.09.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 09:15:53 -0700 (PDT)
Message-ID: <a21e48fd-c614-4bcd-b5d3-9e5a72a9343a@redhat.com>
Date: Mon, 15 Jun 2026 18:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/29] target/arm: Named CPU models for Arm64 on KVM
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 Gavin Shan <gshan@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Sebastian Ott <sebott@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jinqian Yang <yangjinqian1@huawei.com>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
References: <20260605083358.1320563-1-khushit.shah@nutanix.com>
 <eb5f98a0-1fc4-4a5a-839f-8bc3afc44165@redhat.com>
 <C0A0943B-12A4-40CF-97E6-BF272A61AC36@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <C0A0943B-12A4-40CF-97E6-BF272A61AC36@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZEXe-e_ZgJkaX7X27aZvi37XDyvX3uj4gvXNZBTGGcU_1781540155
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Khushit,

On 6/15/26 7:45 AM, Khushit Shah wrote:
>
>> On 12 Jun 2026, at 8:20 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Please could you share a branch. This fails to apply on mainline due to
>> recent changes
>
> Here is the v2 branch:
> https://github.com/khushit-shah-nx/qemu/tree/upstream-checkout-2

thank you very much.

I should be able to send my v6 on Tuesday or Wed.

Eric
>
> Please do let me know if you also want v1 branch.
>
> Warm Regards,
> Khushit
>


