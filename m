Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A065C83F1D
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 12:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZqRK-0006J9-Vt; Thu, 10 Jul 2025 08:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uZqNx-0008LI-VB
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 08:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uZqNr-00064P-7L
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 08:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752150492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rDO+U66p2Y80y08aDz91pI67CA9spr8IR3H7X71NXAQ=;
 b=SROAy4kECT+Zn9byLP2V57KCFRsuUvTjrEQhHNsgnPF1PDjYQKkr9oCljexqMH6Iar0G7r
 m43H6dbmDX3iccpqoCWV8iRfEogN3XK6365CI+lIbTUaSQlTYHq2j6AYgPBFwhGdGBw+Zk
 x/XZk+VJ2jIUDjv+5lx8YE1UnZ873mk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-OABoDSboOKKwXxdjFzHi0Q-1; Thu,
 10 Jul 2025 08:28:10 -0400
X-MC-Unique: OABoDSboOKKwXxdjFzHi0Q-1
X-Mimecast-MFC-AGG-ID: OABoDSboOKKwXxdjFzHi0Q_1752150489
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 823EB19560A3; Thu, 10 Jul 2025 12:28:09 +0000 (UTC)
Received: from localhost (unknown [10.45.225.210])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3180219560A3; Thu, 10 Jul 2025 12:28:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH] linux-headers: Remove the 32-bit arm headers
In-Reply-To: <20250710120035.169376-1-thuth@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250710120035.169376-1-thuth@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 10 Jul 2025 14:28:05 +0200
Message-ID: <87ldow6xii.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jul 10 2025, Thomas Huth <thuth@redhat.com> wrote:

> From: Thomas Huth <thuth@redhat.com>
>
> KVM support for 32-bit arm has been dropped a while ago, so we don't
> need these headers in QEMU anymore.
>
> Fixes: 82bf7ae84ce ("target/arm: Remove KVM support for 32-bit Arm hosts")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                             |   1 -
>  linux-headers/asm-arm/bitsperlong.h   |   1 -
>  linux-headers/asm-arm/kvm.h           | 312 --------------------
>  linux-headers/asm-arm/mman.h          |   4 -
>  linux-headers/asm-arm/unistd-common.h | 397 --------------------------
>  linux-headers/asm-arm/unistd-eabi.h   |   5 -
>  linux-headers/asm-arm/unistd-oabi.h   |  17 --
>  linux-headers/asm-arm/unistd.h        |  41 ---
>  scripts/update-linux-headers.sh       |   5 -
>  9 files changed, 783 deletions(-)
>  delete mode 100644 linux-headers/asm-arm/bitsperlong.h
>  delete mode 100644 linux-headers/asm-arm/kvm.h
>  delete mode 100644 linux-headers/asm-arm/mman.h
>  delete mode 100644 linux-headers/asm-arm/unistd-common.h
>  delete mode 100644 linux-headers/asm-arm/unistd-eabi.h
>  delete mode 100644 linux-headers/asm-arm/unistd-oabi.h
>  delete mode 100644 linux-headers/asm-arm/unistd.h

Acked-by: Cornelia Huck <cohuck@redhat.com>


