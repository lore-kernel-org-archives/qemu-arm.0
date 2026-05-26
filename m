Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF8CCD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 15:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRtO9-00085g-KZ; Tue, 26 May 2026 11:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wRtO6-00084C-02
 for qemu-arm@nongnu.org; Tue, 26 May 2026 11:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wRtO3-0002X5-T5
 for qemu-arm@nongnu.org; Tue, 26 May 2026 11:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779808085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nTzMQSKdxFipCdF2ry9Ey+MwrneHn3RX2NvYnEq5DPA=;
 b=eeq8Ug2ie8cfddeY9bDbtfZI2MJjQ38RZ85b2sg47jr/jrOl2T1CvRoxN6EyWGrU34TquS
 9ev75Z0XXPkm+/hZauDd3bFEB12wAUJB2RXkRwcJr6ptfnVDUqhsmiXhYsi9yLeNxTgvfA
 /cEYUUNN0dGlZe9cHFc0CKXr9ePpu/k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-I_R_S2ifNcGZ14hilWVKNg-1; Tue, 26 May 2026 11:08:03 -0400
X-MC-Unique: I_R_S2ifNcGZ14hilWVKNg-1
X-Mimecast-MFC-AGG-ID: I_R_S2ifNcGZ14hilWVKNg_1779808083
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45e55c44ac1so8476541f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 08:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779808083; x=1780412883;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTzMQSKdxFipCdF2ry9Ey+MwrneHn3RX2NvYnEq5DPA=;
 b=DA3V03f6/xxSC2XK76bCU3tf4WNMXoPQ5NOkY5/0rfbQBD17x7pk8FdoYx7RwaVB60
 Z4EBXqu/iQ9gCafMd+8p6SC1OezQCgJ7hu6PklkQ0r+3wlIkxwYtfDetBGQHd5aws91F
 hZ9H8/QVXXqaOtD8QJi54QvqFIO+/9o5xDnX0ULKWduVpdti7sx6bu1ZcQpT2Tkf1MFj
 YnbfPkQdcduU/1PlzRf04DqvM66SYnBRxzys08JESmNzA/DZk5UOWHF7Q4wdw9+98RnF
 2po5l75njKll1nVmlopQI2rHlTXIDD0+judSn/cQz0NWdVqZFGLk+Ph5jvw6G7oejDmV
 r32A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jHZV71quougweN6kf9WM7oPcz+j10bpziSEqCpLiyhBCZQpbOb3sLQAPW7GeRdQAWV/FoD2fedw==@nongnu.org
X-Gm-Message-State: AOJu0YyQ07fCGVQ1Vq/qlUjTDR/EGgvCmxzgrqEaRm5CfkPW9qeEtb2K
 9HIg0+9bLJaaa30/3ywoeHBWqzDvrcbrWLlj7JeVbOstE5dZd0lSibxWjNW7YrOqmImQj3NPcxD
 o0S7+mjkdlF4myxqOhPPoU/yC/9H3YwfyyZq5L6jM4xX2zXJ342HwfA==
X-Gm-Gg: Acq92OE4K4SXVtnaAXAVE/F1YCpfIDEkbZ/4C3FwQVEMw5pnkOGEyz/ike0HLUevGJ8
 AjuOd9xFLLpmIf1Yo6HS4nRksx64nAD52qfww+Q2HOmxfmklqEZhpKfHgW+/gtTsYu5XniRKtiK
 K0L/Ed2ui2ezTpn9kWSHfooCkkjJsgneMWmk9gLhHzlyeYL8YEtanFR7iuZxdP+rnBZVI1snKR9
 j4R9TdMcCKF2ucap+4ahtbmWwv/3B1WBXAb+umxEpScLK/vuV3yuhIk6uNt3zHCb5vY5A5glYTQ
 LALgQMZCGbXhEUHdQZRKOPMQeCjcDxxl7amrha9vy5MZD36gtTHZRu762WLZ2hMAH3Hxc2uY4qV
 /UlQxxVQbqU/dYywwtr+vno9Ag+AG5FMSME7u2WuAF8bn3uQeSQtNwGunTqVq8J0YSkLmJMo=
X-Received: by 2002:a05:6000:4a10:b0:441:1fa5:457c with SMTP id
 ffacd0b85a97d-45eb367f9f6mr33776488f8f.5.1779808082597; 
 Tue, 26 May 2026 08:08:02 -0700 (PDT)
X-Received: by 2002:a05:6000:4a10:b0:441:1fa5:457c with SMTP id
 ffacd0b85a97d-45eb367f9f6mr33776417f8f.5.1779808082068; 
 Tue, 26 May 2026 08:08:02 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5cb9asm39251687f8f.27.2026.05.26.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 08:08:01 -0700 (PDT)
Date: Tue, 26 May 2026 17:08:00 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 14/18] target/arm/kvm: Special case REVIDR_EL1 and
 AIDR_EL1
In-Reply-To: <20260519132905.145643-15-eric.auger@redhat.com>
Message-ID: <5f6c1d59-f2d1-e21b-5d83-c5d64ab8a484@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-15-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sbA0nbrKDXF8Nqr3gjvQokDcxjXvkuSzqMa6uMqxTxU_1779808083
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

On Tue, 19 May 2026, Eric Auger wrote:
> Special case REVIDR_EL1 and AIDR_EL1 which are writable but
> does not expose named fields. They will need to be handled
> separately
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
> target/arm/kvm.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 960052e67e..6373a66bbd 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -472,7 +472,15 @@ void kvm_arm_expose_idreg_properties(ARMCPU *cpu, ARM64SysReg *regs)
>                 warn_report("%s: reg %d writable, but not in list of idregs?",
>                             __func__, i);
>             } else {
> -                decode_idreg_writemap(obj, i, mask, &regs[idx]);
> +                /*
> +                 * special case REVIDR_EL1 and AIDR_EL1 which are writable but
> +                 * does not expose named fields. They will need to be handled
> +                 * separately
> +                 */

"Special case REVIDR_EL1 and AIDR_EL1 which are writable but
do not expose named fields. They will need to be handled
separately."

Reviewed-by: Sebastian Ott <sebott@redhat.com>


