Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp618555lfg;
        Thu, 19 Aug 2021 12:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCJ/wgcXcf10qPECR5cbpGKEzZS13HJVkKfZODiMROgoGRri2/3g9dZ8wwZ7hi8Kudnmdk
X-Received: by 2002:ab0:859:: with SMTP id b25mr12513546uaf.39.1629401898777;
        Thu, 19 Aug 2021 12:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629401898; cv=none;
        d=google.com; s=arc-20160816;
        b=Cg6yqu6ee2COTsdHvwW5fTVkZkmDuivwx7I7lr6mKo9wvZSpX3Lw+Bsgj/x+IajgVy
         DbVZIPyWdBXgwvPdqvRMLr5b88h2DgaP06V+JEqbAOTESad0KwtDbbKGAfxrBuNn6Fni
         I0Mb5qY3dGNtLo1Uvryb97KXkJDHb/oLynEvYp5fcMMLYZIxykHDe7nnKJgGoxnPnXou
         lRr/2eZbl24pD8FcxAfPmMN3lPaP/ivx0DNIVzdcfTohEMfABVniwTZuyCL4z9XrHxnp
         YP10TPj7Ut7H0qR/rgdF8QrgKNiaQSED1e9LaT0y0sfOyDOyGPtYzQ/A/PrTvM6tn0wl
         vcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rpuC6Xjmm4QF0ooJ2UtZemFh01a3Pg6isfx6cE/aTRw=;
        b=PRdxIg3bGMQ6fWo9m/LqAp31uv/D2P79uhvh/mqTYEO7J9SS53XE8NRlGaKrguMhe2
         v3jDpoi4pkooMz0IArZ+aNKplbqVI8jFQRQ3aUpJt7c+Iuavvhk8fAFBtUhaHow7mtpM
         207RlPBSJUCkXoV2gt7TJJ8r84uu6DFeCFlhPC4RwjY/E27Q0UqGXTwrmMBIC2ecF6Tg
         B9l9Z+8GksKQMfm4nTnBVVR0CoTk/9ETZ3j/Hrj3XwKyASMXvFXW7F0LneFbDT+fgIy7
         ty8FKR9Fu1lOHlF6jKOhNVdz1mdNMS6Msr26IdbTJr/u6adePQiSXTF/B1slkR88AKm+
         f2Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H9b7Y33l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si2821396uab.235.2021.08.19.12.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 12:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H9b7Y33l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGnrm-0000nt-0n
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 15:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrb-0000nd-Ep
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrY-0008UJ-SH
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629401883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rpuC6Xjmm4QF0ooJ2UtZemFh01a3Pg6isfx6cE/aTRw=;
 b=H9b7Y33l0VjxKNWcLjtOBppY2v2Y/2B0PNcNIC/OA2YCqtmzjfipUgUGj7AuOpGaGSafD3
 +Up0JkL3TJGDI5CX2JIilgLcnzDKkff8M9uSwrpKJ4ic5OamCNy1ItybF7Slw/6qZU2Ec8
 69A5Qz180XRsspj37mRnBXcg6z6kv8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-o0h-9jRYNFuhgX8DrhevcA-1; Thu, 19 Aug 2021 15:38:02 -0400
X-MC-Unique: o0h-9jRYNFuhgX8DrhevcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE2518C8C0C;
 Thu, 19 Aug 2021 19:38:01 +0000 (UTC)
Received: from gator.home (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 202ED1970F;
 Thu, 19 Aug 2021 19:37:58 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Thu, 19 Aug 2021 21:37:54 +0200
Message-Id: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /wb4yA1V2/56

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

So far I've only lightly tested this. I'll do more testing and
report back later. I'd also be happy to get test results from
others.

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

