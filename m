Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5950966lfp;
        Tue, 18 Feb 2020 02:00:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4ect2HWwh/LBWr8HzLazcQMXFdPuKcgvk7w+vHYRfrwzIL+HRnNd+nHh+6Zk0Mbo0NcjR
X-Received: by 2002:ac8:7699:: with SMTP id g25mr16147559qtr.75.1582020040834;
        Tue, 18 Feb 2020 02:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020040; cv=none;
        d=google.com; s=arc-20160816;
        b=0cTYiLp1wR36DEqVgApRGfG5CuOVaUPRyz7XuqS7HfIWcq69Hn8c2DSNY/GRDVsl4M
         ZVct1rdru9A/NxLO/k0xjEBxpHiroDfvY3rISQoDm6xW5Bk3hLhgdORzCKXJKF89OX4x
         bvEV/m020DDUaT/fE4xgufLeVuRm5v78JmRZ/H9TnglIPIuq6rO9cnivweS3enUi0hYw
         wqHuv7O0abV1eu1+BudlwGPLH57woomaKZo39n9quxqSJJGf5pFyJQsiVBPt8WlsKAnP
         vS35hDjLqcigObItjnXXsKuLcoYIaIU8OGqHEquSfzUKi/Yc26ft3fR+oxAZBv6lzzDj
         hCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=E3gWln2XPsuTFXCtvjM28ZhQhQimQQVSeoh0dZnPXu0=;
        b=MOq7cLXks7haV84u3VjQDobOBxcb5aS8PUJo7cOy3yrj3lASqK1SWAQ2p/XfJYJ2Nh
         o7fkdtLF0sUfhMBQRD8F7DpQ3b4BOqY7Wz06L1YhObmVcVEhDzpRhiDBl9AumI2TjyAr
         TxkQ4nWvu/LGO6Ff49Rwuj2chfluG5bYmjGdugPPgL7ZpGulbUYfK9mKEft1rHMp2cFd
         /KetUHKP1YH9zR/YRQWxqSjcSCar14+7Koo391lAxfwCFM36cDbQA/lu1+LnY6LRxjIB
         hH1FaoJMD3WpXTiVYpVXZuRSAdm48cz3Rw7n9V3f1gu7tG+ytN2ozMZrM6WZ/KkEUhJU
         QY+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vk3q+d6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si1499893qvw.157.2020.02.18.02.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:00:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vk3q+d6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zgG-00055w-8i
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j3zbM-0004OX-Lz
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:55:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j3zbK-000390-Ln
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:55:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40651
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j3zbK-00038a-Gs
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3gWln2XPsuTFXCtvjM28ZhQhQimQQVSeoh0dZnPXu0=;
 b=Vk3q+d6K0363dLxEbXtuSpwBYBdr6vhl6qgrva65IXvSqV6fggL1D3LdE8h7Txr7zl1FUY
 ryHmgSkOA2KQe6tgHLp74r5jU4y3CvoudcV253y6EuDuxY6PXUv37+VhUuZqgviS/JoHyt
 iiIO90LKpH7rDO63ivUlztH3ZsAfB/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-tANjDRucP5aXSS9m_-ptHw-1; Tue, 18 Feb 2020 04:55:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A083100550E;
 Tue, 18 Feb 2020 09:55:30 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-181.ams2.redhat.com [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E4668CCC5;
 Tue, 18 Feb 2020 09:55:17 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:55:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Message-ID: <20200218095516.GB6157@linux.fritz.box>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-5-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tANjDRucP5aXSS9m_-ptHw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijILQ1QwGlrM

Am 18.02.2020 um 10:43 hat Philippe Mathieu-Daud=E9 geschrieben:
> Fixes: 6663a0a3376
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Thanks, applied patches 3 and 4 to the block branch.

Kevin

