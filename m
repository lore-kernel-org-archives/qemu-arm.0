Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4035861ejn;
        Tue, 25 Oct 2022 04:55:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4an9Zk0i3OT3c46BYT1AcFRwJri3/aYkh+nAqeoLB9HXz1GijO8f0b78+qrLgRjgwNQkYU
X-Received: by 2002:ac8:5809:0:b0:39d:db1:895 with SMTP id g9-20020ac85809000000b0039d0db10895mr22091653qtg.440.1666698941136;
        Tue, 25 Oct 2022 04:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666698941; cv=none;
        d=google.com; s=arc-20160816;
        b=HQ/5NUnvP/DVEySWYe+nPnjM9Z2bolN0hSMN/tfMt+YHUR74CNu97RjN7AsnY0Y4lN
         uNgN42NQgl/xAqR0X8WOHasE5mMEwid2WY4eGR0PgBazBd8Ue8W5JVNNLW2TXMqQoIVn
         c7jewBTBOUWTMk97LGGF8/C9alk90n05Tp+ScXrrtkwBOjh+JGxJHbTYc0W5BG6zrqzg
         CAYzsjoKsi+DA44+v0uvJa94CCo0tWTwujfAtNnQA8tUz+kOpAkz9Nr6sFMI8qsPEMur
         +XrAmD6IhyvT0x4pSfrflFE7KjhuWBfDx9kFOojD9mDOD9yWsFyyEGdkxOlqSQ+A8IZa
         icBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=/3rdeu789YwDakQOOWyOWVMnODm6vcMkM0uNurbwK74=;
        b=wvCjdwvCjJ1IrCzCk4xvTSAhYFNPWX1xMpEVE8c8/Bd+y/1ZuFnsEdixSEy0FXnxkw
         eYl07yuRwH/y31Y20KIXEAsiDXxJkC7pMLRmPbIJkrTw0EZL1TbdzegbcCE78LXdzNg3
         xRIAk3wAs5btv6n+xZUkN4OCkBaH2/zKvGdTKofIsCTbOPdok2PrSCdQUwxdjJOisoET
         ku5u2erT29JImOlyaN4Ek47Ze2SBuznOURMtMp8lUS9eYfqsSOs2ba0QIjw3lgQkdgOC
         A5m3XByAOVaGK/+dedHg4F8lPs2XbrKC4bFzz0O1ov5yvb3/HJ6IrNMNsgYdIAbMCVoP
         8Y3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aZSwJtUi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a056214029100b004afb7d0df5dsi1403539qvv.234.2022.10.25.04.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 04:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aZSwJtUi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onIW5-0000D5-TF; Tue, 25 Oct 2022 07:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onIW4-0008W2-82
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 07:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onIVq-0001HK-4J
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 07:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666698869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3rdeu789YwDakQOOWyOWVMnODm6vcMkM0uNurbwK74=;
 b=aZSwJtUiJAZqXL0xPVMNs4L/ZOvZiCG4JUuM0AcKatrkfTNaaX6SayFOwypVxkmfOrcO6J
 Z8Emho/xnUNif4E2QqqijQ+Ad1NFPWR8hL2GPjTcxxZ+usH7Xtc8IJTgIDP/Y2LtN1ToVN
 NywFJ7GvZsKCun72naPfS+KnK5YEAws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-zS73vb6fMsqaowhPHHH-Vg-1; Tue, 25 Oct 2022 07:54:24 -0400
X-MC-Unique: zS73vb6fMsqaowhPHHH-Vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 156373814595;
 Tue, 25 Oct 2022 11:54:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F4210197;
 Tue, 25 Oct 2022 11:54:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6CDC21E6936; Tue, 25 Oct 2022 13:54:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Yan Vugenfirer
 <yan@daynix.com>,  Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v2 16/17] virtio-pci: Omit errp for pci_add_capability
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
 <20221022044053.81650-17-akihiko.odaki@daynix.com>
Date: Tue, 25 Oct 2022 13:54:20 +0200
In-Reply-To: <20221022044053.81650-17-akihiko.odaki@daynix.com> (Akihiko
 Odaki's message of "Sat, 22 Oct 2022 13:40:52 +0900")
Message-ID: <878rl415lf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 25Rl5FFnSBio

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

I get "undefined reference to `pci_add_capability'" link errors.  I
believe that ...


[...]

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 51fd106f16..2a5d4b329f 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -2,7 +2,6 @@
>  #define QEMU_PCI_H
>  
>  #include "exec/memory.h"
> -#include "qapi/error.h"
>  #include "sysemu/dma.h"
>  
>  /* PCI includes legacy ISA access.  */
> @@ -391,15 +390,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
>  void pci_unregister_vga(PCIDevice *pci_dev);
>  pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>  
> -int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
> -                              uint8_t offset, uint8_t size,
> -                              Error **errp);
> -
> -#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
> -    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
> -
> -#define pci_add_capability(...) \
> -    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
> +uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
> +                           uint8_t offset, uint8_t size);
>  
>  void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
>  

... this part needs go into the next patch.

[...]

