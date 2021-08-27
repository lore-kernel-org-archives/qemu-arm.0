Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1518974lfb;
        Fri, 27 Aug 2021 05:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0u2qADcuxEJxF44oStGrFpDTNoHosDY/nhjhB6s8a5aL3PZo999MXPyaQi2Z1L0IcmMTN
X-Received: by 2002:a7b:c408:: with SMTP id k8mr8655723wmi.184.1630066208997;
        Fri, 27 Aug 2021 05:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630066208; cv=none;
        d=google.com; s=arc-20160816;
        b=yZZ/+f4LCkiuphVl+PxYJxP9Yyg5OAesJfSf3aTBUdKEhJwy3PIU6kYC3w2m+3G7nV
         HQbBnYbWK+2dkdqfsVeyzxlTDloN/ZKpf+PF6/sTaMqWccLy/ejx3A6mIKXxpYZgZx4T
         /KPpN8HfbCo+KNPNlmUpIsnz2oLJIrltuiqMwbg3fZX9Khvz5E2iDyF+Gz/AKRa+R/cy
         la3ZfLOs15O582mgtV4q8+2vbhPB6VEvKdzZ7KVXgKpFBA6Z+XyYW+IQ/3oskrwypJk6
         oe7A1UA8LtrnpfBW9S4jnW4Z0NmzVVVpIx1hXvNsgx4MZ/rF7emcSqCTpg2t0hXY7zqE
         HU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=bT7YuHEWelD8a9xjImpVIW4w9TrtD1/s9NObcKXamfo=;
        b=GWFCcqzO2OQR5YE4pKrGSJ9C1P8Dikw0IiE3OwixF8qEVTKdYflVRn0iQKl0ZAcl+T
         nm46zUxJnjhP7fVECY5JTm3gUR0ZPEN+SKPKvFrizWvQHLT03nHwNK9FEbS6o2ny3+uB
         ySOJleXOZQhiHILVFLCKD7EyO5L/T0sASYi8SyHUihzlt0fEFRx/fZZI4iFkTkiB3vlx
         xmM5baRvEzaB3kJADj0QCcHQ3NP93X2ghHY9CeNHjaiN2g+hah6KpIj47+GXy8tAa8+Z
         KPQM+rulBGUrjc6Kfry92RAg2ALjWqqyavQAB1uJ0/11rQroVuSq6DYIULkf33TJjeEQ
         LEuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d34McLsD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si2824460edq.502.2021.08.27.05.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 05:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d34McLsD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJagS-00007X-1i
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 08:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafd-0007wZ-KQ
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 08:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafa-0004aP-Hi
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 08:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630066152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bT7YuHEWelD8a9xjImpVIW4w9TrtD1/s9NObcKXamfo=;
 b=d34McLsDneM66Ch3Ucn2YjNQKGBjrERqaol6sfUwkk6u+oJ0s/ps3c9jdJe9C1Xt+nGvw6
 wyend+Pxrkq6f5iDKL5J9pWWbRLdtIo3Nge849VD3hiaVyGjk1a8alkyrH4AVXbhXsTPIg
 D0dqXCo/kawC1DHbMXyfut/6PDQoicA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-TvJsyhS5ObyB290b1Yjz6w-1; Fri, 27 Aug 2021 08:09:09 -0400
X-MC-Unique: TvJsyhS5ObyB290b1Yjz6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C0781853029;
 Fri, 27 Aug 2021 12:09:08 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C31A5F724;
 Fri, 27 Aug 2021 12:09:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] dtc: Fixes for the fdt check and update submodule to 1.6.1
Date: Fri, 27 Aug 2021 14:08:58 +0200
Message-Id: <20210827120901.150276-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVPXZGLJMBxX

There are some issues in the checks for libfdt in meson.build which
get fixed with the first two patches.

And while we're at it, also update the dtc submodule to a proper release
version (in the third patch).

Thomas Huth (3):
  meson.build: Fix the check for a usable libfdt
  meson.build: Don't use internal libfdt if the user requested the
    system libfdt
  dtc: Update to version 1.6.1

 dtc         | 2 +-
 meson.build | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.27.0

