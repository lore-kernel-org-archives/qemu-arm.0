Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp458052lfy;
        Tue, 28 Jul 2020 03:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBvHQXtg7axg+iMRw8auJRGXUK61f8oi8wMgxMTs6ZKNdQ/1cvJySVLMbqWI37ff7CF1Sk
X-Received: by 2002:a25:3b4d:: with SMTP id i74mr40669864yba.29.1595931974353;
        Tue, 28 Jul 2020 03:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595931974; cv=none;
        d=google.com; s=arc-20160816;
        b=h+1gxWSFiyoGCVThBse3OtlUUbdVQhHg9Eyt2l6WVMQNbv9eGbzJ++RPZCe35zdoqR
         8gHvCvf8rdHvi3RpIjmYLIIsCDCW+/bBzj6+LcRHU/vlZBYmuimSH5kg82/oN5Ws/WAS
         90wLxxk1GXUlBwZpkxatWmr3SKqLJmvmvb4WJSxEvBoThEaE+wnEQmWTNR5+tps0/h8h
         xFIARpfQQad+Mc12UqpaDT5AV7440szzJ2Iav4KbP0AnwSEU0L84n+xubr7tyvhNtgmi
         gr5gyvQTaLecJAyGrp8IK6VmUJGnrJdOGPBME+ZgGduekt3XAFRffg4NLI5eW914TW+j
         h52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=WNLIeXCN6eXSxaZZQAkHQkExbFpOF7bmusJP5+uJRAs=;
        b=WAslCfcmsEFf2ZhrR8O9cty3eHyxk9wpIQaQjBff3a/1R/fHfeRXN1oBQrikxLNEF6
         Cj2mqH8CccUC+WA83Gcou29n7l4I3pwKxn4ZRW30w/S7CwjEH4YQY3aKQVoVE0Qigajk
         tvGh5Su+WxmbTYt2uhjP2IJ8ZilGAyttfsDDzLHNom3iNAKKlG+Pzc9/dgliGWwgqNgl
         +w7/qgowhh5Sq25xdCuaLrIVv2VjHN1rS+lUAKFg4+CI6B3qLq4+4xiQavs0VBLA+Z//
         8rrOGRHJadffD5lJ4fJu0h7Zq3p+7yOrW6RCVgx6Yb+irFZL09l/540Unw0ckiQ5/2T+
         nK6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vm+E7Tl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m78si13161228ybm.302.2020.07.28.03.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 03:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vm+E7Tl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0MoH-0005Ax-Q3
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 06:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0Mo9-00057X-9A
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 06:26:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36860
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0Mo7-0000xq-HF
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 06:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595931962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=WNLIeXCN6eXSxaZZQAkHQkExbFpOF7bmusJP5+uJRAs=;
 b=Vm+E7Tl2w9h/PwBEQ+PMOBGPinbqxCGSXM0QjC7hz0aARo4Qd9SPt/xsc9C/no/lVqnBkV
 h6XC2FcYc76kVuimT3L3ZTuGrx2IlBqSCTUF3jFBtQ0ILzj5dAIyQv8TtpcLzFGB+UZcLi
 yHo3uuG97HJeFYt83Y4a/lZ0z1pB9dU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-Eu5-5nG-MCqSGmx38qIXWg-1; Tue, 28 Jul 2020 06:25:58 -0400
X-MC-Unique: Eu5-5nG-MCqSGmx38qIXWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3042B107ACCA;
 Tue, 28 Jul 2020 10:25:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-161.ams2.redhat.com [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9578490E68;
 Tue, 28 Jul 2020 10:25:49 +0000 (UTC)
Subject: Re: [PATCH] hw: add compat machines for 5.2
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>
References: <20200728094645.272149-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8582a5ad-f712-13f5-8534-1089c23e3a4c@redhat.com>
Date: Tue, 28 Jul 2020 12:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200728094645.272149-1-cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 00:06:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 97RcTpKigSn5

On 28/07/2020 11.46, Cornelia Huck wrote:
> Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)

For the generic and s390x part:

Acked-by: Thomas Huth <thuth@redhat.com>

