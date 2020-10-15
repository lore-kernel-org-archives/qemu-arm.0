Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp500622lfa;
        Thu, 15 Oct 2020 04:53:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO+FVvotPKXNbCBE0v10++/otJOEk8zs8a9C1z7unSs5ItDy0mwRwMMOxWGUvn+/xbVahf
X-Received: by 2002:ac8:4246:: with SMTP id r6mr3796898qtm.129.1602762807089;
        Thu, 15 Oct 2020 04:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602762807; cv=none;
        d=google.com; s=arc-20160816;
        b=e8YdL3M8kKDCxiBfytopYQn29EpqeTE36503sqs7KDQA0PCjt6QUoJ0Y04jJIat5LX
         RvcKPDEJmyoqO3NVkN1stJORk1ku3xUONTk/Usg+JqzrPzbPttNQAiTfEmc2jGskD5Zi
         UvfqvbfHi0j0xYOfIGDsEv4tNN8Dg2891XjPwy2lGGVWI08sYn6kr+OplnvM4JkAcLkm
         zTnsklFLy9Zu3JcZhQG9rmXZyMJaGhKl8v499nO2kBGByIhRK/UBUzIsOAfdGa8NDQGh
         pptPUJiGg3c11tt3X0KoQyN1bCtVmmSp3G7vg+1sv8lc+JHTfl3WJxpz6lwhCUrIfw/6
         tbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=N5lf+J2uL2GS3e7EmSXEr5Azz4KQGd++g6WvS13cyDU=;
        b=gOiR5DpJghDFfU46CwQ8ykLQvI0SOzr49lCxfS/Eiz9nJF/BfIfT63BbbmWAEgfxN6
         afI+RlKaKouESr5yNhhwxvOI8QrjYw7WQHJvxT8iZ1NXKtnM2I53ewwnp5jCzplRMaaz
         0SSD0ba0hNPsAVUhHMC9kb02XabALMBXD4sP89cJq8+sNEibrTecEudBl/REd0IVoFC0
         59N/6N202Aau8ETEv+vXrMzUDn1RzNQGAqd9N6LDdDqC5mIaAERnNMl9DLVNjwToJ/4+
         J/NjxcS0XlHth94M/lO6roKBZMs0czFuY1OpJoessI8vw70OtWMRiUmGh9nf2o+J+Qfe
         g2/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FjBGCl0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p52si1339155qtc.396.2020.10.15.04.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 04:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FjBGCl0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT1p0-0002Uy-HS
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 07:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT1or-0002Uh-Ts
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 07:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT1oq-0003Fs-7r
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 07:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602762795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N5lf+J2uL2GS3e7EmSXEr5Azz4KQGd++g6WvS13cyDU=;
 b=FjBGCl0hvyYoWRstAh+pg93skr/kCzAVanFVbE275nVHJ9jYWgwXpg9MObFuZSVJ2Uies0
 YyIKjiwY3g4hxJ5Rnj0D5TvZYiRPb+dMbbq9V/+U5uz+tFfUNY6AGd19zN0uZBWVe96FbL
 oK0Vu0gg9dRvMPGVl0/h0m1E7nTPtJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447--aKgZj66Mt6xksAvhm4NBQ-1; Thu, 15 Oct 2020 07:53:13 -0400
X-MC-Unique: -aKgZj66Mt6xksAvhm4NBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AAD364095;
 Thu, 15 Oct 2020 11:53:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A69486EF51;
 Thu, 15 Oct 2020 11:52:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [RFC 0/5] NVMe passthrough: Support 64kB page host
Date: Thu, 15 Oct 2020 13:52:47 +0200
Message-Id: <20201015115252.15582-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qlBiZM21vua3

This series allows NVMe passthrough on aarch64 with 64kB page host.
Addresses and sizes of buffers which are VFIO DMA mapped are
aligned with the host page size.

nvme_register_buf() path is taken care of in this series
but it does not seem to prevent the use case from working.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/nvme_64k_rfc

This was tested on ARM only.

Eric Auger (5):
  block/nvme: use some NVME_CAP_* macros
  block/nvme: Change size and alignment of IDENTIFY response buffer
  block/nvme: Change size and alignment of queue
  block/nvme: Change size and alignment of prp_list_pages
  block/nvme: Align iov's va and size on host page size

 block/nvme.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

-- 
2.21.3

