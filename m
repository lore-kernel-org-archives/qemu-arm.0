Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C641CD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMTX-00023Q-AQ; Tue, 16 Jun 2026 01:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMTV-00022m-Mx
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMTP-0005Ex-SW
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781588182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+PPFOMcVJhB8m9SShQxlFnwUOxbziE7tiZuxihlIFY=;
 b=QNu04gvtpvblcbIRBnBZrBAeNvMwqPuowvQ4ARzerBpWLd1hUWH1GTdZWjx6otKaNa6pDs
 pHOrMQJ+gYZUmY3qF9YVEufOXWVALEiBiBmSCAgEAm20dcfDj5Ti+WWqwX3cZU02jp3ZHi
 3TuIbp+up8k7aSch2EwScQ9irmA6k20=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-WZg8aIGZNM67jZXIja6z4Q-1; Tue, 16 Jun 2026 01:36:20 -0400
X-MC-Unique: WZg8aIGZNM67jZXIja6z4Q-1
X-Mimecast-MFC-AGG-ID: WZg8aIGZNM67jZXIja6z4Q_1781588180
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490abeb7298so46153085e9.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781588179; x=1782192979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+PPFOMcVJhB8m9SShQxlFnwUOxbziE7tiZuxihlIFY=;
 b=RSOliBxf1WTUZXxn/0enQc2x5VB/45Wu6dxRuCOxQveuP6DYiDxd88f1SvJCMztYgD
 wPryLzaXZ1DA6NoX0UYW434ObrEh58EUoC0/1gTCk7jWpPFMsaYV/jU8RQM2JDpbksDC
 L+6VSpe01Nf3HlG6VL50c6e90cpf26kJ4qeC6SqNMCJGD+wuU77GeQc8CpfH0FzSUSi7
 MqBlRUQHqUzf8CwRZJ1L91y6lZRzPB3jyUTIdIGvdxU+FwNzXBfS5sPaTdSvxbQcQ6lW
 w2qtpFc5KSpnqPbKv44aEmeywS3RkETb5YG+K/ojsk9VpO3FPcXY9Md55DIG2Wp+Pk6s
 8aAw==
X-Gm-Message-State: AOJu0Yxqfh9unjNpNy1fL3nr/GUCVsvBl2PGtwQOS3XHVfQKYlWFmaYG
 7cPqxaq4m8S/mmr6LYIaLgJuIL16t9hSxV2dldKRzZB4QnESCijnPUC/dxAH2rT9dBQMS8ycF1D
 OEZNxk/C8uW7y2p36bDavLnynQLahdh6AYGgO67n0No32cRWmsgYQnw==
X-Gm-Gg: Acq92OHVii6Cw2PbuelyA4tgwZYpHcT4O1c5TwWKoymJpPVvntkvICPIy+cSXCGU4SG
 N9RXWuEZd879gIlx3ko1yi39q3u42SMgX8ZoFKB6cWUMNt/F8X9CR5mY2S6rAgzRD0jZvkM9Gya
 mZ2L8vt6ruUIVl7VHOHPE2VDYpGPIdjyzg6oSKPTxrVQiTfl01hLMQIGB64lAxIKHA1COi7U8/S
 W9FOWakVeftqpKYksl650z+Wt2d9ghh0aYxPijXxITlGHrQiiKOySgvzyCqwABzCPwrubkya1wn
 waxek0eE4S9rW5x+hqFZp3wNdD2E8iGBg7gMPQBtqeSqCzmHCHCm4qXVymIb1NBX1mABFYUreyE
 WAzIsdS2X0849bLc+/MhmGEh9xtMHIAfCNZ4Zgl8Ms1E=
X-Received: by 2002:a05:600c:4e48:b0:490:e60b:6860 with SMTP id
 5b1f17b1804b1-4922005e235mr166699785e9.7.1781588179405; 
 Mon, 15 Jun 2026 22:36:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4e48:b0:490:e60b:6860 with SMTP id
 5b1f17b1804b1-4922005e235mr166699515e9.7.1781588179027; 
 Mon, 15 Jun 2026 22:36:19 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa47da9sm59813525e9.5.2026.06.15.22.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 22:36:18 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:36:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 0/2] system/memory: Make ram device region directly
 accessible
Message-ID: <20260616013359-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260616052552.389021-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UPHr-cVsRrJLwsPSJLfI-gF-euXDpPmXtMgujxwgEDI_1781588180
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Jun 16, 2026 at 03:25:50PM +1000, Gavin Shan wrote:
> All ram device regions was turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions").


What is missing here is the list of issues around
direct ram access and how we are solving them.

Thanks,
-- 
MST


