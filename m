Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3478CD5BDE
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 06:38:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wS7ti-0001qw-5g; Wed, 27 May 2026 02:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wS7tf-0001pB-ED
 for qemu-arm@nongnu.org; Wed, 27 May 2026 02:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wS7td-0005VC-02
 for qemu-arm@nongnu.org; Wed, 27 May 2026 02:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779863860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=99hv26laU3xOjDxYBDwbdj8sZVc8KA0FHocO0j3PfOc=;
 b=Koeic0uLWyHn+cxcfmsoyD4gNIFK9Y9xR+jQgcyUKHyTypUBdLtyJXFW+wvH07/XKElbzP
 DhtmSCf5e7VDi999fzEKNMVc6T/eUX2Tw4np3Ht0mYVOayRAYMTdBUSWIvO9eWNp4YmCCQ
 XJ1GTN4seefVDWtLkrsB6ziw2tPmpVE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-Gn7k4xyKMGuWSNcP2kK8Sw-1; Wed, 27 May 2026 02:37:36 -0400
X-MC-Unique: Gn7k4xyKMGuWSNcP2kK8Sw-1
X-Mimecast-MFC-AGG-ID: Gn7k4xyKMGuWSNcP2kK8Sw_1779863855
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43d7a5b9678so7060234f8f.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 23:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779863855; x=1780468655;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99hv26laU3xOjDxYBDwbdj8sZVc8KA0FHocO0j3PfOc=;
 b=QlcpoAIs1m+q9wPe+AOte9MRqvSB5Y5l05ngsaR2KiPcvzjyMNLKsy+bbai/O7VHaa
 mKtM91C346wv59ZX8DP1gaiHKQSj6jC9MRRR3B/nD3yMiggFNAT+oG41aySRbrs0j7Zd
 IXOKKqecrBnEZnCoOSSIr+xt8BbRfUP/tL7lnfNBv5V/3ZIYPKBDcZ4skmmGGOB0FSLx
 U+7sUvLHSjYEbEEUTgEXqvVbwTDa9K3J1NBG1vlzh+zy+Bva0HSS81bRAFWsTHS+D64m
 RyoMgos2H/gcrLJ3GtxxyVg6ijDjoQMI1C4DcCK7uwjUqmFbI+d7ZbnvjEtyWuhPZ8of
 70gQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xmdCLICRdsjbtrgJU8a/gZ5Xl8EAkiCfpG8cXd/7GCHSiob6QfMob5uN6WydShWu24WNu8HXwAg==@nongnu.org
X-Gm-Message-State: AOJu0Yzvg9ibBXrQ4YPWs7vr/2oU9WOTUSG18yaS6n74MAzNTaG7CSxb
 X8tzUWkAWlpQAvBwjtl0ER/NfFbyfSCuizaeb45at0iHo99RJuN3Orel7AtTLanZmJiHq/lXWrX
 AKtBEodZzk48CaJ4mQ8O7LKVl0nuTR8Y1rTx/8h+4XOhxlDR4V8FkYheoDNFuWA==
X-Gm-Gg: Acq92OHM5i6VhpjK3PuqpClDonRUHG7vW4pIIUdSI5SYEUjcGBk6ksSVz42F/2zZgiF
 b9p8rQkIit7bIkcpB/j79iETOFghEhuRR6PY6dJdF0sFq0UYg1lKy0ruHYJLPpY9HfQj65kgjJc
 1TFd1D4PKcn9JrYhkzFKlof3vZTnSZ3FKeKmDJ5VUjp912h5cUp/pGneilAa4MauBFUJbzIWRfP
 nlo0c7tbtaMN1mjuCg7SEKbKcX922NhAf6KaJzcUqSRraPcsdrykN8FNtHRJ2P0SPoF+EVHO+rr
 OH7+fZcd3bM3tynXCfTmqL7FMRGKSCTEzHuy5sEiwdb2rmxKxoDGqF/WmxBLTQLKN2AjBS5fbbN
 GSzm8rqLzYOStJHX9+Ajp0z55Us/sRG/boGfvECUvcyFhA/19PPX3cOCzSvi/MSzpNXU7JPM=
X-Received: by 2002:a05:600c:6209:b0:490:601f:d776 with SMTP id
 5b1f17b1804b1-490601fd9admr239463735e9.3.1779863855053; 
 Tue, 26 May 2026 23:37:35 -0700 (PDT)
X-Received: by 2002:a05:600c:6209:b0:490:601f:d776 with SMTP id
 5b1f17b1804b1-490601fd9admr239463355e9.3.1779863854687; 
 Tue, 26 May 2026 23:37:34 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a33dsm342690905e9.11.2026.05.26.23.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 23:37:34 -0700 (PDT)
Date: Wed, 27 May 2026 08:37:32 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 18/18] arm/cpu-features: document ID reg properties
In-Reply-To: <20260519132905.145643-19-eric.auger@redhat.com>
Message-ID: <1cc64955-1bc3-452b-b783-664acb2f8dea@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-19-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_xCJaUdUtQ6eUuM08UTbDDrIl6giHf5sdc4vWkNdgM_1779863855
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, 19 May 2026, Eric Auger wrote:
> From: Cornelia Huck <cohuck@redhat.com>
>
> Add some documentation for how individual ID registers can be
> configured with the host cpu model.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> docs/system/arm/cpu-features.rst | 106 ++++++++++++++++++++++++++++---
> 1 file changed, 98 insertions(+), 8 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 10b0eff27e..6203757781 100644
> --- a/docs/system/arm/cpu-features.rst
[...]
> +2. Additionally, the ``host`` CPU model on KVM allows to configure optional
> +CPU features via the corresponding ID registers. The host kernel allows
> +to write a subset of ID register fields. The host model exposes
> +properties for each writable ID register field. Those options are named
> +SYSREG_<IDREG>_<FIELD>. IDREG and FIELD names are those used in the
> +ARM ARM Reference Manual. Their availability depend on the host capability

^
ARM ARM

Reviewed-by: Sebastian Ott <sebott@redhat.com>


