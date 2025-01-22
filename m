Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp685074njc;
        Wed, 22 Jan 2025 02:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTWiy8Nh6Dj3sCovxeY0S/GFHQylkBF7oN/ZK1HejlMh5yiF9d6ewI1jlTjhEnlA8H25vLubsAwBwuNw==@linaro.org
X-Google-Smtp-Source: AGHT+IGMej41AI6jgRHSVuxminID/MGTaewgNHYxKHJfbAqJ8PGA8PWRAWh3D5BYELNFmmjkQtmy
X-Received: by 2002:a05:6214:5b09:b0:6d8:8a0b:db25 with SMTP id 6a1803df08f44-6e1b27a47d5mr345344356d6.21.1737542811445;
        Wed, 22 Jan 2025 02:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737542811; cv=none;
        d=google.com; s=arc-20240605;
        b=Kz95ZZysTXRqe1yduWUQ3rTOAqZCOQHQAhj2sqwEzchTY6k+FcdwHXzzG5E62YgAJi
         Q6eCD1GsjlTn7r/X1IzapVIODwMSYGgoCtG3rXAOBFR4PIN8H5+fX8YBeA5G/ptvXDJJ
         bwCqd41Zipd6i/dGb/pbeGV4RCiNg5u5+TjAcw+OVJ6xo2cvRKjKBj5tAz6AVTVkA3yk
         Zia+OW/ccxAdbYRJvHhCqN8ugpGcGLPV/jEMiS+aYZKHqd64QLUqh8+FptsJazJk40pm
         OetqXCtwx+cvhwRAgaJfIyxr2f2L/AUmnGfcSKGSofOKiCUk1afijazF2Sb9Gh/nRLbX
         30Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=H0ezmLNRc+dY13l3WQ1ASeSxqFaS+7aY1B9Ht/jPH1o=;
        fh=XJ1nhQYnJ+u8WXbMsAFWtHloCKcjOQL3O4ly6FwgOt0=;
        b=Ye9fRe1hSoHGrQ/cGhikGagKgmLloO7d3aVmoTOZowvLjmtzJiv09qVJrLUy7bAwT2
         4ASrvD7oOGymnrbX2QfT3ZVdVERNdhZPLBhbUzCHdkXIeaWkNXfW7ui4oMds2K6dN/83
         XdtilbUODZo1e08KeEV8F9BVSrsl86oQjnO8l7dWqb+WAa9/OJ200UdeKvW+Hjofo3xu
         0PQzRRarmfZ70nin+IY2bp+ikqzgwat/PVV/xoIhq4k5QvDah8oixXPStqvVal0fOcG0
         gKNHG3dXCAqHg02Ep5MJQR5bOJUwx18M8M1o40P9me77dYYntjOWNRImFUJG7jUy0BdF
         ZfiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E8qHCBOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afbfb3a5si142443676d6.97.2025.01.22.02.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2025 02:46:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E8qHCBOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taYFK-0006AH-RU; Wed, 22 Jan 2025 05:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1taYFA-00068e-KW
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 05:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1taYF6-00038C-6I
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 05:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737542751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0ezmLNRc+dY13l3WQ1ASeSxqFaS+7aY1B9Ht/jPH1o=;
 b=E8qHCBOrdv8hCfXXj5OTCy9JRQr+NHJ3RcmOmcQb3hg7VNMgPa5d3bPSAPWrJYbnRO8Ar6
 FJXSuHQNUxI7g/MpUHSEWv1izaYIbReMPjFtlstrmnmL8Muw6SY/nXg+pzgjaZcb5Idyh2
 UjT/WvB4ysL/Gu42T4t9u20qNmGkQMQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686--Nls20rgMRuffKSpAerpVw-1; Wed,
 22 Jan 2025 05:45:45 -0500
X-MC-Unique: -Nls20rgMRuffKSpAerpVw-1
X-Mimecast-MFC-AGG-ID: -Nls20rgMRuffKSpAerpVw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E8CF19560A2; Wed, 22 Jan 2025 10:45:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C5593195608E; Wed, 22 Jan 2025 10:45:40 +0000 (UTC)
Date: Wed, 22 Jan 2025 10:45:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/boards: Convert MachineClass bitfields to boolean
Message-ID: <Z5DMUVoEcaO4Mzp2@redhat.com>
References: <20250122103223.55523-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122103223.55523-1-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.086,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FlNyOR1oAIkg

On Wed, Jan 22, 2025 at 11:32:23AM +0100, Philippe Mathieu-Daudé wrote:
> As Daniel mentioned:
> 
>  "The number of instances of MachineClass is not large enough
>   that we save a useful amount of memory through bitfields."
> 
> Also, see recent commit ecbf3567e21 ("docs/devel/style: add a
> section about bitfield, and disallow them for packed structures").

Also developers incorrectly think these are already booleans:

$ git grep  -E '\b(no_parallel|no_serial|no_floppy|no_cdrom|no_sdcard|pci_allow_0_address|legacy_fw_cfg_order)\b' | grep -E '(true|false)'
hw/arm/sbsa-ref.c:    mc->pci_allow_0_address = true;
hw/arm/virt.c:    mc->pci_allow_0_address = true;
hw/arm/xlnx-versal-virt.c:    mc->no_cdrom = true;
hw/m68k/next-cube.c:    mc->no_cdrom = true;
hw/ppc/spapr.c:    mc->pci_allow_0_address = true;
hw/riscv/virt.c:    mc->pci_allow_0_address = true;

> 
> Convert the MachineClass bitfields used as boolean as real ones.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/boards.h        | 14 +++++++-------
>  hw/arm/aspeed.c            |  6 +++---
>  hw/arm/fby35.c             |  4 ++--
>  hw/arm/npcm7xx_boards.c    |  6 +++---
>  hw/arm/raspi.c             |  6 +++---
>  hw/arm/sbsa-ref.c          |  2 +-
>  hw/arm/virt.c              |  2 +-
>  hw/arm/xilinx_zynq.c       |  2 +-
>  hw/avr/arduino.c           |  6 +++---
>  hw/core/null-machine.c     | 10 +++++-----
>  hw/i386/microvm.c          |  2 +-
>  hw/i386/pc_piix.c          |  2 +-
>  hw/i386/pc_q35.c           |  4 ++--
>  hw/loongarch/virt.c        |  2 +-
>  hw/m68k/virt.c             |  6 +++---
>  hw/ppc/pnv.c               |  2 +-
>  hw/ppc/spapr.c             |  2 +-
>  hw/riscv/virt.c            |  2 +-
>  hw/s390x/s390-virtio-ccw.c |  8 ++++----
>  hw/xtensa/sim.c            |  2 +-
>  20 files changed, 45 insertions(+), 45 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

