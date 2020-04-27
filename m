Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4186025lfm;
        Mon, 27 Apr 2020 07:32:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJITWs2i8q3M4qjBkFNAMnD9RGvE1JIkk5Hz7ruZw2vmbzGY46ZN4m2hvGkYpP0fnjhvsuj
X-Received: by 2002:ac8:4e53:: with SMTP id e19mr23392691qtw.277.1587997944073;
        Mon, 27 Apr 2020 07:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587997944; cv=none;
        d=google.com; s=arc-20160816;
        b=o60KtCxegwK044PkIt77n48WeD2C/q84Cq3jKq25mcEtmZM9bo0a1z5Dkc+yhPwAFp
         p30Jqq+42F/gPp95TUCoiQC9rqqy306y0P1K/e8yyODlsoPfMD86MpXx4ZJMwJ46+Wl+
         SF2aJdaAruFBd3mvxpASFNNzvBrlUUyxg3nAkgHHdOyTmHrkp9YeOnP3PYsxXvjRaNpt
         FEndFYqHzNkVfWwzXDB0ALZ99DU5qqJZUOM7HjbxcZaP+a9e6orKJl5SevT17yMEPmai
         H5ErBTz5390JRae/dMUO1QfPOICBQjRGKEb8S/CJcqURq5I3hKwgPWK0xxSiG2zdN160
         cDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xIV+5av9mbm6Cnj/1HBZrlwgd5bJEbYSIaAYoH81aWY=;
        b=I0L2mpsceYmTQHdojAMTvqIwG5lxmWTzsEL+TQqn+GTRVSClCZmKKoGBtc0b/OcbzI
         Hir7ePpVa6A13Ckw6xzu/gpHmC4SBKlUgJ3VcTIhcEvoLSBSI8bLqQUnx5FCRp91yN3+
         CCNjwRGFll2EuTw1EQrJ1xiGQK3GTNSIuEupeuAgH67b4tDdXlYgc7CuO1w3OApYXw/J
         Dfod9wuHszN03Za90sIrVMtEfvNLWSxLpZjyqffDpsTfxnJYLN27nF+v8ajHk7EdEyT1
         NjEM8niiQoXOqPWKditJtGReHmwSc0/aNvbu+KwKm5Hn8sLq5FgbSfRNyrkzIgq8M0ri
         ld+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q+pFzA+S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si8478087qkl.252.2020.04.27.07.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 07:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q+pFzA+S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT4o3-0000aI-07
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 10:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4nm-0000Yt-6j
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 10:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4ni-00014I-Lo
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 10:32:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28508
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jT4ni-00013J-14
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 10:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587997919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xIV+5av9mbm6Cnj/1HBZrlwgd5bJEbYSIaAYoH81aWY=;
 b=Q+pFzA+SMU3cOEsubaWojlHQ2X64jF7Kq84UVbz5vcDZlAYSeku37qdhwkgMLQiZjUG2iP
 LKXqle17HsFas+Htr9OjfiGGutGRi6SG+p2XWpnRPgXn/rqAyzFhPV+TkcwOFfJVa3Z6Hd
 ZnNyTqf1h8+DPQG8fH+Ir61RgVRhwBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-vXo14OLaOP-2EjsVDZr4nw-1; Mon, 27 Apr 2020 10:31:57 -0400
X-MC-Unique: vXo14OLaOP-2EjsVDZr4nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A788F464;
 Mon, 27 Apr 2020 14:31:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-95.ams2.redhat.com [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1520C6062C;
 Mon, 27 Apr 2020 14:31:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
Subject: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by default
Date: Mon, 27 Apr 2020 16:31:43 +0200
Message-Id: <20200427143145.16251-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 02:05:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 44PVGQxiKjdJ

Instead of using a compat in the mach-virt machine to force
PPI off for all virt machines (PPI not supported by the
tpm-tis-device device), let's simply change the default value
in the sysbus device.

Best Regards

Eric

Eric Auger (2):
  tpm: tpm-tis-device: set PPI to false by default
  hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off

 hw/arm/virt.c           | 5 -----
 hw/tpm/tpm_tis_sysbus.c | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

--=20
2.20.1

