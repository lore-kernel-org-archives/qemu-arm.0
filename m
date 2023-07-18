Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6291980eje;
        Tue, 18 Jul 2023 04:14:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF/KlNviQjJn3pBBnl/yFI2QPyYyCNzGEOK7yjpEVlM32YtkH/eXB4KkDjExYDImzKmGlXQ
X-Received: by 2002:a05:6870:569e:b0:1b0:57f8:dabf with SMTP id p30-20020a056870569e00b001b057f8dabfmr16608277oao.33.1689678893883;
        Tue, 18 Jul 2023 04:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689678893; cv=none;
        d=google.com; s=arc-20160816;
        b=sR++HqYyOLHYx1hMD5KnDzxcxjT6w8uO1MNC+S0d1JGTRGHWn23Lo2UIFiReZ/BMR8
         M9GB27z2EYcQ0Wj7t9MFxAXj8M3quaowGnIQyfGMThn8Vr2BgJwoQUQdvzhyyfDVWLpu
         dTjNw0Zom5Fzez+UvWEf1/k2H1iCKBOxlnPFMedAWaJhcMYG4E3mOqEUyWYeDMezy5Al
         ZYPEQPwa8tFNIVsSVkBSSJLWA8rK47FFZq8nKIy3yWSNkZHg9LeVcBFQb315dpJmaVtS
         L71HSZhtQixslnckWgx13qtX4oyhizwKm37UEjRCr4eQc20i0n+KeILK9pVSrNQy+GSP
         YwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NE5TSk+9F1w0/aZJpgmkiBjq7oSucjlnsOr09RhYOt0=;
        fh=uQr7pjt/ibS5vnjZSmQ1WGiQFIRklh5YUHGxKidwOlo=;
        b=aQsGx4w9F/t3Dn8gZJT6Sijd+W9IxCRK0MGxN5/E4VFasvm9+ZRbY0k4UyH2DKqIQI
         l/Yiushk2AjO4CdxtuXyOk98D1pGfk6CvKHqlGIQOBbWsxTfIli0ELJaXIYxrcFqM1ya
         siCQ/XGVVKpog3mqNH9T5M9/ukI+qhvUx++nmd+FDn6/QqgtLqHh/WietZx0XDhxVTV4
         DjB+neEmWK+KNzYT/v6nnZFkLJ26kbZ3k/cFCVSN99f1y+UkL7uGNZeV39pjb/f4OEyb
         LR3yQgK7vk4nA3JS6i8ff1wHWzdWHNESFERkliVdHMnQIJvyEsWZ9u/tNaCiyU7c8QSR
         21cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TU+0PAI5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a0ca9d1000000b0062ff894914csi1060234qvb.352.2023.07.18.04.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 04:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TU+0PAI5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qLiew-0003Sf-Ej; Tue, 18 Jul 2023 07:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qLiev-0003SH-86
 for qemu-devel@nongnu.org; Tue, 18 Jul 2023 07:14:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qLiet-0003Zd-CK
 for qemu-devel@nongnu.org; Tue, 18 Jul 2023 07:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689678862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NE5TSk+9F1w0/aZJpgmkiBjq7oSucjlnsOr09RhYOt0=;
 b=TU+0PAI5z932Zz/ZzGJfmzTYYsmJkC8iUudicFin3RO0U9QAD70EeO8xRWcMoxNIM7OyDc
 NWriPEtTMTsFrzctXvPKnYMLlZgBDpF/8hcyAbCNHpoTrNXSOQrZH/ZMaSpaxl218Xg0Po
 /ZqJxHhsmXcO5rLRjc1d9GTw/wRD35E=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-9v6ZNktVNeuV6XxC2lvxcg-1; Tue, 18 Jul 2023 07:14:18 -0400
X-MC-Unique: 9v6ZNktVNeuV6XxC2lvxcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2121C3806108;
 Tue, 18 Jul 2023 11:14:17 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DE8740C6F4C;
 Tue, 18 Jul 2023 11:14:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-8.2 0/2] arm/kvm: use kvm_{get,set}_one_reg
Date: Tue, 18 Jul 2023 13:14:02 +0200
Message-ID: <20230718111404.23479-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WacA1Hhd2Yjo

The kvm_{get,set}_one_reg functions have been around for a very long
time, and using them instead of open-coding the ioctl invocations
saves lines of code, and gives us a tracepoint as well. They cannot
be used by invocations of the ioctl not acting on a CPUState, but
that still leaves a lot of conversions in the target/arm code.

target/mips and target/ppc also have some potential for conversions,
but as I cannot test either (and they are both in 'Odd fixes' anyway),
I left them alone.

Survives some testing on a Mt. Snow.

Cornelia Huck (2):
  arm/kvm: convert to kvm_set_one_reg
  arm/kvm: convert to kvm_get_one_reg

 target/arm/kvm.c   |  28 +++--------
 target/arm/kvm64.c | 123 ++++++++++++---------------------------------
 2 files changed, 39 insertions(+), 112 deletions(-)

-- 
2.41.0

