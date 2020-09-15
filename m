Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3387979lfq;
        Tue, 15 Sep 2020 10:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH16D3noXVt7MpQsAPpSsZ22onFWjz+hmo6bWT+HZbVEYtYwKQkiBSuarToalzbYPX3Apl
X-Received: by 2002:a25:b53:: with SMTP id 80mr8298246ybl.322.1600192053123;
        Tue, 15 Sep 2020 10:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600192053; cv=none;
        d=google.com; s=arc-20160816;
        b=0B3ABYPxiGqxNxo20I+oK6hAjGmMOPNI+iiQ6mMliUH+xuFKlVraW9I6bppIIvMBAO
         +gSEeGrTksMeLLIC0hIzabWZT62JfTu2GC+RkukQ8XcFh84/2SE8m87WebAC8O/TLCs4
         tl9rHeilhzro04D1SgOSZy9MczDTQvUbTwp6vT90VvDjs9+MjBKrMXRlmXrIGXi/C4Qy
         fuWsGv6q85MU/vYzv7O4TO3D2N6RjflkEi3+0Btw1y84hZO8PysjHNmwJDY7I1sy61bK
         74CCvWx3i+nWeQCIkXA6J/ZCt2o1XteD345PUj3O0iRod3qIKShdNoo7rQKR5cECENYm
         1NbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4J/C0CgMtD1LdsmM6ACDCgEWX06co4iTUlmwkoRNuL8=;
        b=ygKISXjWwhZCr6X8Xqbatk0IXm12FcBH1DaCnbyqV9JmqIOEx6oAPCwV16aqjR0qXY
         R8DvT0AZKNBaamXR0ghsXJ3ZWVpHgeVbu36HGJcc+/APoVnmrzP+065Sx15oJzeJSpoI
         3IMS/CTusfkz6TRRuQauFZUg7O3u2G04V6Z95+TlMj6UK/YdJW5nlI+u4vcf89yDOqRX
         2TswziqoZEnLSQY0iFnrLr3AvuVa9z3TyDvZnzMbR7akz6ws3Ld+wB52j4aXVSNMp8Xf
         +t5s5n1LFu9vjxaLzSr/f+nqZpWi4k2s9nKk6FUZdk3KzevyRoz2N1JC3UoS8XckXYf0
         +r9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BGKA3Jlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si13356904ybj.471.2020.09.15.10.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 10:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BGKA3Jlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIF3D-0002IU-Qp
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 13:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2R-0001Ye-Ep
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 13:46:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2M-0007Dx-U6
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 13:46:42 -0400
Received: by mail-pf1-x429.google.com with SMTP id l126so2379159pfd.5
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2020 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J/C0CgMtD1LdsmM6ACDCgEWX06co4iTUlmwkoRNuL8=;
 b=BGKA3JlfigwPFD1yg3nqZxSGvmznZexDHC6tx+LFwUjnYJNrRl/F8pG63TA8dvpzxI
 qIpFvIm3fyBGIi7GveCv1O5Xj+e3xJEvYKO8VQKfPsZAOJAAdEUhwF3ORm4PNz6EiBAn
 H2RiCMjAu5kQWMQSAULlQWnf1BY80dPzdnIhGymT2HdY7eqInNDRXDuuqYabrEyUY/6m
 yqd9qGpg9oYnAyM5B5KESH1nYjECXGiMPVxnrsS4Eg0c41OdVGT8Qmw+4dyFK05bxPE4
 SFSu12r706ReiomTQrZ5BhrDZYkHTnhTFgQrd1Svq24Q0C9VfYC5sYgL3KYD2l47U3Hz
 JFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J/C0CgMtD1LdsmM6ACDCgEWX06co4iTUlmwkoRNuL8=;
 b=GnjwEJSeEAoMxHYNNhHcHOoOv2LBmDjyv8qsPmksabOgspLZvn7+r57CREEO3L59/R
 ammPJS9K8vc+EVrxxn7S4PafFO4jtO40EPrXJgD0yXFIegMSc+RhLFjAB+Ab+rxNLOy4
 nUNQ3pil5gGuoLznVS1AceYbCACrrAZkLnYw3hSHhhJ07nDi1Qdek4sM8Gu0ifGiH8mQ
 3xE82/+zcevKPv6Lk3F5gWsEnnRpSx0z3tThegqKWgED+/6pJAylXCQ5mGprrZsFQLAc
 VLsWaEgmXelcuGN3l7o7FC/5cXeXZdxiunbAKm0Flal/4dShPRm7SwLdQwUxpL9x81Hl
 ub0w==
X-Gm-Message-State: AOAM5334oKjIVMjGpsGlRZWmlovcyW2QqSICwpuF+0Tkgrh8tbSnx0bW
 65jrslnKA+2bJs5agitdvnUU0w==
X-Received: by 2002:a63:c343:: with SMTP id e3mr14492145pgd.288.1600191996919; 
 Tue, 15 Sep 2020 10:46:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id cf7sm147896pjb.52.2020.09.15.10.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:46:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] qom: Allow object to be aligned
Date: Tue, 15 Sep 2020 10:46:30 -0700
Message-Id: <20200915174635.2333553-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 53Xisw/ed8o0

I've seen some failures on arm and s390x hosts after
enabling host vector support.  It turns out that the
malloc for these hosts does not provide 16-byte alignment.

We already have a function that can alloc with alignment,
but we need to pass this down from the structure.  We also
don't want to use this function unconditionally, because
the windows version does page allocation, which would be
overkill for the vast majority of the objects allocated.


r~


Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org


Richard Henderson (5):
  qom: Allow objects to be allocated with increased alignment
  target/arm: Set instance_align on CPUARM TypeInfo
  target/ppc: Set instance_align on PowerPCCPU TypeInfo
  target/riscv: Set instance_align on RISCVCPU TypeInfo
  target/s390x: Set instance_align on S390CPU TypeInfo

 include/qom/object.h            |  4 ++++
 qom/object.c                    | 16 +++++++++++++---
 target/arm/cpu.c                |  2 ++
 target/riscv/cpu.c              |  1 +
 target/s390x/cpu.c              |  1 +
 target/ppc/translate_init.c.inc |  1 +
 6 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.25.1

