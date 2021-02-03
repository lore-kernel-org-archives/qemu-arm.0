Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp524465lfo;
        Wed, 3 Feb 2021 12:07:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPv5dpF6SgQrOmVmmWoYoKY/fyQY8qfyEtXVmktaRcmdq29RFRLsrIo0z9ttSuED8a8wMp
X-Received: by 2002:a25:abaa:: with SMTP id v39mr7144971ybi.448.1612382857663;
        Wed, 03 Feb 2021 12:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612382857; cv=none;
        d=google.com; s=arc-20160816;
        b=gN7qGgY+ugKG9EhYfaVxkIHK6kkRiC0/81yEaW5z+ds1mnduv1X4BNkhTQYITMUJoJ
         ynrTHQcWhCa4mIYHFjrNsN+eQhcZnTjP1z1gS3mFELnRm1GsR7Hpdjh8IT4ruvFUCWLw
         E1FN9RXFvhjSXp2U2er4tM6/onVn64wTzjTk+QX71pZ30D8FWoHK1U3W2Wt8/OLgdfSP
         mJofZDIYDSlYsBqkPNFmX0rr1pocQ5kW50foRjc2d6tCFZCacntcE73idqdGMpqPWISC
         zdUCVE7QesKGiTEu59djGvwMrHLb3GhInP2zWONCpUegY7xEQcybc22Pc1qrR9zq7pqZ
         nEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Pxx7LQTlq5PMU9Ms8u53ICDlFM3CSEIjeSJU2iB1uJw=;
        b=Sxec+O+FhK0T+hSlcU2Tds9C3L8BymhWNnnfsuOASw/YHdLGhmaGwAdwAEidEtKchO
         2+la11YuLLSsJ4Lij5Uk5S7OIZviPMLrLgADHpgsEjrJSfavFlTHAHY7d68I1jmD5wRx
         5AkFz0Km3aKXm5qUU0zAPObNjKC8wOaO+k3d2vXTjGqph1K6QoMlfbDygNy2VOWMP7b9
         25oPxDcUBzLHdIT3+43C9Uia/6gfmo7dsVFrBFp8LNnmzXG0viYj9W2pV+yzsAT9shE0
         j9mJTPWknVzqBzhfh+0ojWjd9PlJ+rwlPZ5YHjP6X72CQ+1uAdLKsUYPNOmDlV1gSSAy
         62Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DuaZIP3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si3019353ybt.336.2021.02.03.12.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 12:07:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DuaZIP3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7OR7-0008A2-08
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 15:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7OQG-0007eA-P9
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 15:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7OQC-0003P4-Nr
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 15:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612382799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pxx7LQTlq5PMU9Ms8u53ICDlFM3CSEIjeSJU2iB1uJw=;
 b=DuaZIP3avspniSJaQdjaryxtJsdOIUbA+IrBU9/hJbmM3VmSgHBG/dIpn9A1kanteXnnbw
 FGQMw/4NUNJJUf7TJMilwJ4TVZuveWISLyaxlKf62K22oCEa+bmlllu9jxPlNgutES5pjQ
 0S6/9l+eNIQEhmQOAyeUOOdvW02RtAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-MQBIT6fUND2ZNg_Lbve3vQ-1; Wed, 03 Feb 2021 15:06:37 -0500
X-MC-Unique: MQBIT6fUND2ZNg_Lbve3vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7712F107ACE3;
 Wed,  3 Feb 2021 20:06:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B4B4779D9;
 Wed,  3 Feb 2021 20:06:34 +0000 (UTC)
Date: Wed, 3 Feb 2021 21:06:31 +0100
From: Andrew Jones <drjones@redhat.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH] target/arm: Don't migrate CPUARMState.features
Message-ID: <20210203200631.ki2xr7ynhv3wturm@kamzik.brq.redhat.com>
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
 <20210203161340.55210-1-aaron@os.amperecomputing.com>
MIME-Version: 1.0
In-Reply-To: <20210203161340.55210-1-aaron@os.amperecomputing.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCZ7LtYKkQVm

On Wed, Feb 03, 2021 at 11:13:40AM -0500, Aaron Lindsay wrote:
> As feature flags are added or removed, the meanings of bits in the
> `features` field can change between QEMU versions, causing migration
> failures. Additionally, migrating the field is not useful because it is
> a constant function of the CPU being used.
> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index c9e9fd0a12..7f2511b6ed 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -834,7 +834,7 @@ const VMStateDescription vmstate_arm_cpu = {
>          VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_val, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_high, ARMCPU),
> -        VMSTATE_UINT64(env.features, ARMCPU),
> +        VMSTATE_UNUSED(sizeof(uint64_t)),
>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> -- 
> 2.17.1
>

I tested this with a KVM guest. Prior to this patch, a migration of a 4.1
guest from a 4.1 build of QEMU to a build of the latest bits of QEMU would
fail with a segmentation fault. With this patch, the migration succeeds.
However, migrating a virt-4.1 machine type from a QEMU of the latest bits
to a 4.1 build of QEMU still fails with

  qemu-system-aarch64: error while loading state for instance 0x0 of device 'pl011'
  qemu-system-aarch64: load of migration failed: No such file or directory

This means "ping-pong" migrations fail, which is another thing we would
prefer to work. But, as that appears to be a different bug, regarding this
patch

Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

