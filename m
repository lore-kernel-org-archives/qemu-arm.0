Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1123251lfp;
        Mon, 20 Jan 2020 22:58:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5z6vFZJSjVQmJcbIJ8EHiWCmh2eg9m6efJJ6qDvuebICyBEZ59yuhzkF6D3gVpd3qGvF7
X-Received: by 2002:a05:620a:849:: with SMTP id u9mr3228048qku.414.1579589927156;
        Mon, 20 Jan 2020 22:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579589927; cv=none;
        d=google.com; s=arc-20160816;
        b=ivUnF3408DNWegmDeLTCZKV0aqAf6jlmPxHys0p/d4KK2DiYi4vFIZ6p/CkjgzJG99
         HRmudqoRZY/Jc34QjHJ6EVkDTAgrSDjv/mAfLT/0NZxx1w/P8E9yf41g49cEG+4ykEjT
         Hv49GtZwHBgi4bN1BVVGMAsrV4aaogy5V9d3n+8NEOfrYw5RvpzRbB98Y0h7rvpxRA7y
         qClRYBXNosT+ddwrUXXta4Bb8nBKHiVeO+jEdfqppZf+Y8LJiSrlYvFikWHudfjE08Hg
         GymRtAtRcT7ShbSPDJp8f7GwIEZ4bLyKvF5u5xitXyc7fXSLvlBtQnj0hX2n09HMLFvh
         /8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=1m4/ug2VeNgy+NqFCbReQNnlbY6XDS6oMFmMCMNTjPE=;
        b=TBp+eBDqKYUraMGV+H4Q3GFTUUCFUkfmEAXa6+Myvrp7+/Qyp8QgSljgA8bVy69Cjw
         /aEKS3YzcMhFkA3BdNIHnceYct37PcybcV41hk9lCq8c+uB6Bvznx4UvHASkjYq6wAuC
         18g/qeMXSYDAEhTdeMTiScJc/u0wc085G+57GzdutdKlXwxPdnYH30+qlNkVTnrzQDPh
         CQP9vwHL46hjkIeOymhPmLGeVLJaOQuNEAomldwmZ+UBRIaWVell7D+nyeN8m7aCRzNf
         xulMQqRdrGOD1pQZbm1WH5kIgRvKaQcNjdLrybgEfKT6YxxcCwvWrOmToraHAg+tueVF
         GQ5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TdlQHESn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si23272746qtg.186.2020.01.20.22.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 22:58:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TdlQHESn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itnUs-0005OY-Cm
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 01:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1itnTj-0004Uq-7s
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:57:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1itnTi-0007l5-6y
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:57:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1itnTi-0007ke-3D
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579589853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1m4/ug2VeNgy+NqFCbReQNnlbY6XDS6oMFmMCMNTjPE=;
 b=TdlQHESn9Bv6IGs4iE3pdR7ArTaNfFvaP0IBfW+YEeYdbVOH3RNowQQnDMTSOP2obug711
 ngsf42PO35s3tGPLTwpyc7HcPQMYfb8uPVuFy+q6MkopQ/iRc5nXM0Gs68cWEs0sgJTvgy
 9G3GicIEOMZKbtbgJxWjttOUwzIwdQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-sgt7BOaqPTykBVHVNMq1AA-1; Tue, 21 Jan 2020 01:57:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 851F4800A02;
 Tue, 21 Jan 2020 06:57:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EBCC860F6;
 Tue, 21 Jan 2020 06:57:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6E08516E36; Tue, 21 Jan 2020 07:57:26 +0100 (CET)
Date: Tue, 21 Jan 2020 07:57:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 5/7] tests/boot_linux_console: Test booting U-Boot on
 the Raspberry Pi 2
Message-ID: <20200121065726.ijnw3lwyrnrzanks@sirius.home.kraxel.org>
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-6-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-6-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: sgt7BOaqPTykBVHVNMq1AA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6KaVdQ2w4c7X

On Tue, Jan 21, 2020 at 12:51:57AM +0100, Philippe Mathieu-Daud=E9 wrote:
> This test runs U-Boot on the Raspberry Pi 2.

> U-Boot is built by the Debian project, see:
> https://wiki.debian.org/InstallingDebianOn/Allwinner#Creating_a_bootable_=
SD_Card_with_u-boot

We already have a u-boot submodule in roms/

I guess it makes sense to just build & ship our own binaries
instead of downloading them from Debian?

cheers,
  Gerd

