Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1AEC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 11:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wghvl-0002Wv-Op; Mon, 06 Jul 2026 07:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wghvf-0002Vw-Ob
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 07:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wghvd-0005xS-48
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 07:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783338958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lgYVW59/fDsCyALounqfA/qP/ubVHf62vYUx92E9MTY=;
 b=T2tM/xqyk4n+IfMBVdEkr+arTkOGSoGYviL5KgPGbNqVLRKD9XfnPQDuE4yAdwBhHFLG/I
 JwdoI6NllDl7pYWFOpwSVTjBYnve90b0tv4rFEuqED495yBt0CjJkpkfbwL/KfhwFBAiQB
 iiuz3lB2/FzWtDbk6aK7e/oKKJ+j1ew=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-A2krT_lCOjGmkJ0FrzvNkA-1; Mon, 06 Jul 2026 07:55:55 -0400
X-MC-Unique: A2krT_lCOjGmkJ0FrzvNkA-1
X-Mimecast-MFC-AGG-ID: A2krT_lCOjGmkJ0FrzvNkA_1783338954
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-493c619bb52so20977195e9.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 04:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783338954; x=1783943754;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lgYVW59/fDsCyALounqfA/qP/ubVHf62vYUx92E9MTY=;
 b=LkGereGbAubo4eCZRavsFiNgcSsJxU+06WZby3mXRvPNx0lMZbm7/C2UOMBe8z3MIT
 cpBTzSNa2xh2uV1kqqFK/f3giZ+9FaBWH02Of3Tt0ThcdtFA9ot67kikrTGwZkiG033g
 aWgnMMJU9TrF524VkFoYAyNhoxwFJyybhJi+9+dmbVM3+DUiy4hl6fJulivH2r77BRft
 neHPkhC0g1ujs5e6mkxgZi/THuw9Y+fKyAtrzcoqnX4XUd7UucEGXlYsYRmuQnaz+pUc
 PdB7ge4XWYgLEqeNt/DFEG702R1X3fIB8zfjkv5UHwMnMKcE8q6SeAHmWLJ3UyY1LCFZ
 /22w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBAzzVrevze521hZWFi+Ajg8umoX/PEj9//x1LYQ6MsrAU9R96W1yecNMXFOP8IHRHq87Q5mpx4w==@nongnu.org
X-Gm-Message-State: AOJu0Yz877bUYrIfhFUqD2RRBhwC+6mSVKmeQA1RSOapyTf7qOS+3uoJ
 NpNG/0dR1EpJkUrbQ3S877BrFqpgeY+WUjw3KTkaN1J3IN25Xa23MOy5MbdBbpORAumIzjNYR3i
 MQuMJRxZTOWSTrhPpACB1bBFX1HFIlqH+Qwxyakz31buD+XzYIMxdtA==
X-Gm-Gg: AfdE7ckFjiMJCUDYip+aXEcpNNvOZ3Bpq0teC/cIqX11XNVT6us9gHaE7Jhywiu5J9B
 +7x28ifKrbUs4rHxyvvpfsS35dR+cMm7rRVAbd7dUfzRPjylgv1ycISolyPhwPkVb8/AMCHP4TH
 AHp/jksHwNsbOK1NmjKFHSQVZCMgJfuEe8NOijsm1EuK4Mek0UXrytWv9LqwkT2Ha8PaEkEiuJ6
 +rFe/VJ3yhZVE3dLVPBM/d83rUkQFbahVjv8iihUKEpUf31X7B9b5AE7zrT2s9KNz6y/T8Nw1As
 F5japka0189hSjc63bpQFEMVgdhvZVCWGJtimPjCWw+BVtK1xaNzpCBkZ5yAYPbD5d7Ncl/vD/u
 KJVnuTwPAhIZSDZHk/qUCg0ifzxqjSN3lvzltcgTquPlgo+M5uanVkG1eJbif
X-Received: by 2002:a05:600c:4708:b0:493:bc4a:d5f5 with SMTP id
 5b1f17b1804b1-493df0885dbmr902615e9.39.1783338953935; 
 Mon, 06 Jul 2026 04:55:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4708:b0:493:bc4a:d5f5 with SMTP id
 5b1f17b1804b1-493df0885dbmr902355e9.39.1783338953586; 
 Mon, 06 Jul 2026 04:55:53 -0700 (PDT)
Received: from rh (p200300f6af371400309b667846b924fb.dip0.t-ipconnect.de.
 [2003:f6:af37:1400:309b:6678:46b9:24fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba971sm608724945e9.13.2026.07.06.04.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 04:55:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 13:55:51 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Eric Auger <eauger@redhat.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/3] arm: demuxed ID registers (CCSIDR_EL1)
In-Reply-To: <CAFEAcA_0KOc_4DHioDbXKrAy-R45PEyDg1iS_dz7XgB0=0m9jg@mail.gmail.com>
Message-ID: <45959999-1382-1ea8-355e-d088754f2896@redhat.com>
References: <20260702133606.34529-1-sebott@redhat.com>
 <CAFEAcA_0KOc_4DHioDbXKrAy-R45PEyDg1iS_dz7XgB0=0m9jg@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MQ5GlyfCI5fL8Xe6KEP5MAmpYSDF56NEmsj7SqO0A6c_1783338954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hello Peter,

On Fri, 3 Jul 2026, Peter Maydell wrote:
> On Thu, 2 Jul 2026 at 14:36, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Handle the demuxed ID register CCSIDR_EL1 as part of the
>> idregs array. V3 of this series was posted here:
>> https://lore.kernel.org/qemu-devel/20260622135627.40573-1-sebott@redhat.com/
>>
>> Changes V3->V4:
>> * added R-B from Eric
>> * incorporated suggestions from Eric
>
> Hi; there's no description in this cover letter of
> what the series is trying to accomplish. Could you
> explain a bit what the motivation is, please?

Sure!

"
To support efforts to generalize handling of writable System ID Registers
[1] this series addresses the demuxed registers that are kept outside of
ARMISARegisters namely CSSELR_EL1.

CSSELR_EL1 is moved within ARMISARegisters and accessors to retrieve
and set the demuxed values are provided. Initial values are gathered via
the usual KVM_GET_ONE_REG ioctl.
"

Thanks,
Sebastian

[1] https://lore.kernel.org/qemu-arm/20260616132625.1732031-1-eric.auger@redhat.com/


