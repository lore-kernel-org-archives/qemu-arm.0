Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1911329njc;
        Tue, 26 Nov 2024 02:30:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsiFidejP3SdLRvgPL/9m8TqgZo8yVBg771+tN5jTa9l/FPH+RknC1SEgCIqkfho6pBJcJMofGwOSgHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFvLuZau+RHYY9yQZTjtWyv7LxX+hu1ff0u8uMt27TuSRrjWW6NHaCLXJLB9v5kMRnkAVax
X-Received: by 2002:a05:6102:3ec9:b0:4af:2d61:5a7c with SMTP id ada2fe7eead31-4af2d615d25mr6739466137.14.1732617049176;
        Tue, 26 Nov 2024 02:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732617049; cv=none;
        d=google.com; s=arc-20240605;
        b=XyrIZIifBSSHoXLsPorTK+dES4WCvt8SBQ4Z/hS0L8cfgKtA5a7y0/DIpMWCaYa1ki
         Dg+VurldeDkAntGRr3qujrH7jF58VD52VvNAa2pBDmrrF2mZ00d9CAIWmfw19qQu/b94
         2ZJZdzT8w3etaYW4yr7h1Ke+x82pVYsI8GyHFv0EUW4HuS82HTaqPg7oZ2RSY+yQJAxb
         FsDTIzYVOnFH+lVbbNiAx3DPQM4gVA9QLu+S1MucRLPJULXb8mAyZLq+Dw4+3U19RJuq
         zZGhCEFWhGg/MBmB+F3a0359yZYSf5tsAp2Y+0iRRj+1K/Tb7ddvy+1zh2T/k8EbRVWs
         voVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=eQnzQfjT0Z3rEKQKyPNCt1jUbCqDmfZ0DJXWfkxrHns=;
        fh=12pE8BcL8Oeuwlt7nNzB73lxbevTrVEvVFd9GmZm5dk=;
        b=b9slQERVLDVnOzVTWvRyqGCtYmxSCJHEJUvF3KiZWVodlOEa+zDlA9G89DW7a+9cCm
         cD6Gg5fLy6hmWjpAQ5h6tO0fvvhVU+YxHj0hOUBHSQsvT0VAPhEXuM67S/sbdy7kvhkp
         7szo0AR2urENarqIe169y/oMoj/rNefH+CvljMkdDrQUBTg8nwG10g7GcUJV1P4YK2hU
         WFX1AMIN8hfNedBB3u2QOTePvkbfBEtnEY+5AU+NcADSW1A9zXfU3uIbdkjVj4eP+1OR
         mVuQc+gTvEbVJ/4EKDN9PiWSoXoYFaV959lWSv9r91GjE46YzaWClGHT9iJRmkc6obMV
         HlKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frS7zGVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4669d2fe69esi28744511cf.319.2024.11.26.02.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 02:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frS7zGVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFsq2-0002MS-Ei; Tue, 26 Nov 2024 05:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1tFspz-0002Lp-QC
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 05:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1tFspy-0007hT-A2
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 05:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732617027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eQnzQfjT0Z3rEKQKyPNCt1jUbCqDmfZ0DJXWfkxrHns=;
 b=frS7zGVkz6g12tC/Qmu3/VYw8HIOvhUCgTedSEmIKm4ic9WC75HCYYbBO4iIem0+m75/Sx
 8l4vmaq2EdioRvlT/ENftE5zz2Xl8vSryeDkGnVXKBxkeXwnMqsamqQTfIViRnWxJSVpGP
 +5nTcUl/0zL5aah9MSTIGJGUWGVa3C4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-296-Eb_c0IOPMCWJ8UlBKWsyqQ-1; Tue,
 26 Nov 2024 05:30:24 -0500
X-MC-Unique: Eb_c0IOPMCWJ8UlBKWsyqQ-1
X-Mimecast-MFC-AGG-ID: Eb_c0IOPMCWJ8UlBKWsyqQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 534A41956057; Tue, 26 Nov 2024 10:30:21 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com
 [10.33.192.244])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 614D11955F3E; Tue, 26 Nov 2024 10:30:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-10.0 0/2] compat machines for 10.0
Date: Tue, 26 Nov 2024 11:30:03 +0100
Message-ID: <20241126103005.3794748-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wOnDXesMn8pZ

It's that time of the year^Wrelease cycle again, so here are the machine
types for the next release. I'm also including the _AS_LATEST() patch
that had apparently fallen through the cracks.

Cornelia Huck (1):
  hw: add compat machines for 10.0

Daniel P. Berrangé (1):
  hw/i386: define _AS_LATEST() macros for machine types

 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 20 ++++++++++++++------
 hw/i386/pc_q35.c           | 20 +++++++++++++++-----
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  7 ++++++-
 10 files changed, 86 insertions(+), 17 deletions(-)

-- 
2.47.0

