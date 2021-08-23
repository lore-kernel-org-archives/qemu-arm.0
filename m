Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2002167lfg;
        Mon, 23 Aug 2021 09:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2QoyJyKTIS3+xPYmLz4waHOGA3IvFJCRFFaNqUjDdadzQ/1byliAvaG8eIqGRviolfogP
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr37698582edu.359.1629734937387;
        Mon, 23 Aug 2021 09:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629734937; cv=none;
        d=google.com; s=arc-20160816;
        b=hTYTvRn8F8tQIDWdt4UcWgFhpU151v/7biILN0eaaYQEhspEYJ9RYj+wM6H7/Icu5g
         JYEsB9AsGzTZ6oY3tCqwcq9ePgFLTCq2pJTdyk/BULL6d9m78wFgB/LfwapKc8MCxNk8
         k/vUv5jnothcvfhHheuw5ULqMf9yqVIB6nWqjnlWmL3tNoLOHDcEuSkvv3x6rPoF+VcJ
         RyrWYqGs4jszs3i1IOEQfWohtSVzVi/8vcffWsDguvbmlUOCVNaM82VOSfX634d4aLQm
         6pv3JtpoynAuvusluH9+PLMTI/UbSAPb0BxUoVcP6E88Ol7S1uXPjBMbpJXRS+AY6VNe
         riVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=80VQpqHUZgVAsO5kjnX1hdSpNMvehvWH2r14jZjqXXY=;
        b=Na86RQkHcR3wkchG/1iO1axoVC47yhsneO/2AGMsV6b+chzaq2cSM/L4y8Y990qNLC
         /D/N8deo+Pz7iEfoZUZWWKPeS10cWcAsW8ogFiZ1gpavQVAhOCJM9P7KOTT9WsKcKFLR
         +NT7r0J90UQoLGoFASukOv+rmJzwV/DsiqCmla9DTnl49xU7vE4rQPE5HaU7dkdZFEMd
         84r7NcQ7elL2LP3//OA5pB61/7KhDnbzjROdH5rCORChUaudDvOWqR8iO8jK6dy3cBLn
         4EIpOiFOQabL0oizFn8GNLcZ530sdpJDuHs/YZiZAVw+cD7EYkK0b/UFQwpY8000jRad
         +UIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HISf2yaa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si4439096ede.185.2021.08.23.09.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HISf2yaa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mICVM-0001zv-GV
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTT-0007i1-0P
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTQ-0000Cs-7m
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=80VQpqHUZgVAsO5kjnX1hdSpNMvehvWH2r14jZjqXXY=;
 b=HISf2yaaFjJF0TQUV/P1uC3e4EOO8+5JeWYnX8yYyFj1A2hR06T91um/JLMg96Z4pu7hQn
 wTdqCCNUnT6IMVeOFh1NH6IDGsMoPFu5CoTrR+Q9bETXeylXoR9XYCq+0q6C6W4LOzEuNw
 cxGYO6YeaWkTmv53+MCFvu1HShR4MB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-dSK7OLp6Mw-3E2vzfV2siA-1; Mon, 23 Aug 2021 12:06:51 -0400
X-MC-Unique: dSK7OLp6Mw-3E2vzfV2siA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BDC3E741;
 Mon, 23 Aug 2021 16:06:50 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79C2860C82;
 Mon, 23 Aug 2021 16:06:48 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Mon, 23 Aug 2021 18:06:43 +0200
Message-Id: <20210823160647.34028-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPO56A314B8n

v2:
 - Completed testing
 - Removed extra space in an error message
 - Added Phil's r-b's

While reviewing the new A64FX CPU type it became clear that CPU
types should be able to specify which SVE vector lengths are
supported. This series adds a new bitmap member to ARMCPU and
modifies arm_cpu_sve_finalize() to validate inputs against it.
So far we only need to set the bitmap for the 'max' CPU type
though and, since it supports all vector lengths, we just fill
the whole thing.

This series was inspired by Richard Henderson's suggestion to
replace arm_cpu_sve_finalize's kvm_supported bitmap with something
that could be shared with TCG.

Thanks,
drew


Andrew Jones (4):
  target/arm/cpu: Introduce sve_vq_supported bitmap
  target/arm/kvm64: Ensure sve vls map is completely clear
  target/arm/cpu64: Replace kvm_supported with sve_vq_supported
  target/arm/cpu64: Validate sve vector lengths are supported

 target/arm/cpu.h   |   4 ++
 target/arm/cpu64.c | 118 +++++++++++++++++++++------------------------
 target/arm/kvm64.c |   2 +-
 3 files changed, 61 insertions(+), 63 deletions(-)

-- 
2.31.1

