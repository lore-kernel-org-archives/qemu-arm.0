Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4574995wrm;
        Mon, 14 Oct 2019 08:28:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh6THx/Df3QHP6FtVSEmliuoT7+iuce5CBEs6HmzmUO0Z+QK2RZkMbvZP6h+M0okMva5ZL
X-Received: by 2002:ac8:7346:: with SMTP id q6mr25054124qtp.111.1571066903486;
        Mon, 14 Oct 2019 08:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571066903; cv=none;
        d=google.com; s=arc-20160816;
        b=bSL3doeyuF8sffV5JzF4/IpCZE1/yJKnHY/6pvTGumadUqUni9sLeFVrogYGJstEQW
         Icc4dmVFMq3zhQ2XQ0t/LHcevYCUkaB3nZHkqI+lbPY9wYXMK8JBB5nO1AWPRBCrkt3w
         j4cVoSR5KjG9V2ijVDTznygRS/hovbgGaYdV4dV86sGFCDxsRVrKLy73URt9lQG/eccA
         GEPFWaUy4/X4/0Uqyx4kIgvu3g+zFd/qD4pm8+1aSb+WR11sONKKfHgCsiRFXVl4ypbg
         omLFYRWjhfGIoMdcX0pk6SRAFs2X38nL5H5fQsPURk0nGCh9ti02bdx9RpnhqevO3QHs
         w+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pVgNsLZmusn/0VPc8jRmCgjq0/uu3i1yih1wwqVCCws=;
        b=BSTyq47hJWOEr8DbHdszfZNIhiyu8oE14SCEWp2slT54ng3TuoonbXyvLAqqGIoon7
         364hM505UKK44h8pyF6Mm/IUGrDD0hjdjFzX59n7irQHmPGAPAr73myXgV4HUst0aji/
         ITlb7JrmIT9jZYOhYMn0x5Zpu8CEKr9DduCwrqMbfVQP3t6czaPU5pLTD4dqoTLg4u5s
         FVBdyA306SwqfZ4/ZxsI3qtpxTQ1TxDInngh2MK76ptj9p7kN9PSkdeQsfgj8DnHFBq/
         m2I225/kIlJSWCjU3hxNX/xbf5dqME6AtZFbiIAeWmOxrI+VPgoeVPmlkcXxPe3uEBLs
         8enQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AVScJlp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27si19007196qvh.205.2019.10.14.08.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 08:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AVScJlp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK2Gk-0000Vk-SA
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 11:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pdurrant@gmail.com>) id 1iK1MP-0004Ag-Ac
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:30:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pdurrant@gmail.com>) id 1iK1MN-00026b-2V
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:30:08 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41439)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pdurrant@gmail.com>)
 id 1iK1MD-00021s-OX; Mon, 14 Oct 2019 10:29:58 -0400
Received: by mail-pg1-x544.google.com with SMTP id t3so10222541pga.8;
 Mon, 14 Oct 2019 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pVgNsLZmusn/0VPc8jRmCgjq0/uu3i1yih1wwqVCCws=;
 b=AVScJlp6hVP2I3fwaZhc4jyhmHHHVdeVScozqrfXAvuwx5AM+B51wzkN359hcnsPP5
 aRkRwDTo1BX78uFAHS02JixP00kLLombIRsldeqfZH7uh5WKDuUsRe6hCTJHRsROvx0a
 BbWHyN+/wDCdlRvdjzN/uEHlgZoGphrQV4o64Vg/wvCQxUnA/7Qb0thHB34/X8iodmsR
 hgdDD2TOAL9kDqcZcxycJh+1OikNANeDERaz2zgcov7WR68TjWrzY9wTU5LCCB1wMRsf
 2AUHjJvfK8EJqno6i6tFTS/WfPweWyFDhDE1z2IyOvd65FoVYeFE+t0aXDw/pPVB13j1
 XBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pVgNsLZmusn/0VPc8jRmCgjq0/uu3i1yih1wwqVCCws=;
 b=EatfEGxq1oairFJs+jg2CdDlL/Km11MSauYA/dosPPz/WNo194v+RIs4PA1lCmnLHO
 kX5AFkZSB3plzU+YTZ9Oqj9WMxGLAySUwoHf0Kn6HiWr4rOQcCQUmoMFjI4b7HBe3nmo
 a4lFTZx7lBcXOo7iq4xn0c68ot7sB93qwMIDK4owxm+3t8A5OBAGHyd0SbuqkUkdMdLh
 QnRjQqD7gpLJvfJlmSipTQPtVauMZTsrbRidPDTMq41r4nCYYmfKPl5U7TlRQ+G+/vIE
 Qvz79nFdw7UT4YYZm7ZsFiTNiYy9MBpl9CoB8v7NVKyp7tz3M4n0U+M0P8sUtkXIf37v
 Hq0w==
X-Gm-Message-State: APjAAAWQ9QoQBpGXWg0j1bx4LVbiOdO4uucjaKHy/Bqmx8a+8EKoFwBY
 zkyhPr8vL7bldEC9bclnR1YuRIahP1g8uoekC/M=
X-Received: by 2002:a63:82:: with SMTP id 124mr34900738pga.112.1571063393200; 
 Mon, 14 Oct 2019 07:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191014142246.4538-1-philmd@redhat.com>
 <20191014142246.4538-9-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-9-philmd@redhat.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 14 Oct 2019 15:29:42 +0100
Message-ID: <CACCGGhCaC5-K+q+fJpTt5aZQ=-XurNAWwNDvKunBLaFHvu7yow@mail.gmail.com>
Subject: Re: [PATCH 08/20] hw/xen/xen_pt_load_rom: Remove unused includes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-Mailman-Approved-At: Mon, 14 Oct 2019 11:28:17 -0400
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sjslu+GORsuW

On Mon, 14 Oct 2019 at 15:27, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> xen_pt_load_rom.c does not use any of these includes, remove them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  hw/xen/xen_pt_load_rom.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
> index 307a5c93e2..a50a80837e 100644
> --- a/hw/xen/xen_pt_load_rom.c
> +++ b/hw/xen/xen_pt_load_rom.c
> @@ -3,12 +3,8 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "hw/i386/pc.h"
>  #include "qemu/error-report.h"
> -#include "ui/console.h"
>  #include "hw/loader.h"
> -#include "monitor/monitor.h"
> -#include "qemu/range.h"
>  #include "hw/pci/pci.h"
>  #include "xen_pt.h"
>
> --
> 2.21.0
>
