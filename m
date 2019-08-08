Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7963287wrv;
        Thu, 8 Aug 2019 07:45:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/AWORr3Ahx1wUFb6UjXyUn27pU6ko6nLe7eR5OdJ6cO4GkVqyWJC5HDohAporR3U2pv2C
X-Received: by 2002:a17:907:20bb:: with SMTP id pw27mr13672580ejb.93.1565275530093;
        Thu, 08 Aug 2019 07:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565275530; cv=none;
        d=google.com; s=arc-20160816;
        b=yI4WySDwD+W0C8U+cwrJh2juq/KdbjED/TLmLMkYV+uBkkAOuqb0hScapqf0Hwn0L4
         yCcDE5oizearui9buVVCHRtPhPJqGvJY4QVZif7EieOl5In2s5mO0ucGpviKX8I39PiC
         L+qKUbd5lt2tUIijTN6qrPkQbJ2DQ1PW5FSlvG7VaIfXmggIFW6K1KovbbfR0v82eLpG
         6FILW6hK8SRc5gMyrOk4iENZ5WJuVIO9bt9HQn7UiVPhVNfbPMUbvb+aH0IVN5P29uvD
         nV8RMZeUNKMcI796kr9jNasFwQRGGRMGQWbz+0jSsIVGyvl8ZLZCnGrkACaWhXGfjtl/
         7upQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=Z+Ljq4IWNcqlNX20/Ss0hH1c7a0t0fluQdCoBlFgjCo=;
        b=QuAMA4Vs4J2vk5rYhRrkk6gk6+l1b0PcXsVGbP+pARBkC51/EZzIfOdc3YuFUvRhnm
         skU5m4O6NKIU8v3tJcEFo5j8eEqPmddBL5sTsJKw167ovl8gE/wY2v9Hfth7nu+lqDxw
         RORZPehduYiUnyiv0LZ6OzeROwbBFpOIFN47ysn9JKwTspiOBhBl1IF9eQJCn+m+whA+
         KHwzw8csybs1qi1JgprTlGj0fx9wR5fUl6aKbObNhAifOXt45xPSa+a+dlvlbLfbm4n4
         Tgxzq7QCVkx9bVjy09OlfDAbu82nJSO+hreI92frIdP8bkq2/rp8T8qwjmaaKq3Phryf
         RLNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si36138538eda.298.2019.08.08.07.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 07:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvjfV-0002MA-6X
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 10:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58543)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjfP-0002Kl-G4
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:45:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjfO-0002vh-ID
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:45:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39270)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjfO-0002uy-DG; Thu, 08 Aug 2019 10:45:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C614DC04D293;
 Thu,  8 Aug 2019 14:45:18 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F11FF6EA;
 Thu,  8 Aug 2019 14:44:40 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:44:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808164438.7045c4cc.cohuck@redhat.com>
In-Reply-To: <1565166604452.72353@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166604452.72353@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 14:45:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code
 size with MO_{8|16|32|64}
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 i.mitsyanko@gmail.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8qs1vcxlXtL5

On Wed, 7 Aug 2019 08:30:04 +0000
<tony.nguyen@bt.com> wrote:

> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with

"Now that size_memop has been implemented properly, again hard code the
size but with..."

> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.

s/avoid/avoids/

> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/s390x/s390-pci-inst.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
