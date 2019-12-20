Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4085541lff;
        Fri, 20 Dec 2019 12:27:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxk2YhiTGxSucvzoNZYCNpJcPidv8UIpyRJiEPkWDjISNfRUNe3AkcsHoESSjBAfcyfIyzD
X-Received: by 2002:a05:6830:1595:: with SMTP id i21mr17084929otr.29.1576873659509;
        Fri, 20 Dec 2019 12:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576873659; cv=none;
        d=google.com; s=arc-20160816;
        b=fMoVaFzUEFh1+KaCL+WqgD3wNoGnQfayRGsKh5zb2gVOaZ1pkmAj1d/m9kBmXvSS8e
         OXStViigK1DgsyWaYH+HdKbskDqdCqg1KMjZ26S8owqBtxCX0lYts8cXyzEg7TFHJeOw
         A12XcaEXRxKC0Ce8fJBAXuNPHCr4cLtHxUPwfhZivD027+CggutJCyYg3t7FQuV84Gp+
         GSnr+3OktwYZcpV+fJjBA8N8yv75jM2zZcQlsW3ZtqPtCbTxVctqDbLFnaKdYPaZJ5XA
         oenKZtsZVoHQgpWGgD3EKeiF7DqK6qxlS4gc0kN0U7j9ZzNqWwENiQRBS97lbPOw2jMQ
         P2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=+A6IT4c/+pZUoS/jx9YhK15VZ2D9C+6KzH019NBL3Lk=;
        b=Rcim4CEEbyDHJclHtU2C97X/xecuNxYWHyf/I2dTtjON+3pHeAr7jbjMfBDQybD6ml
         0sXoxu9IqzedNqUk6oQEfZllRWSqVRcL2l15ugI0eCJeg8fgzfCYgvF5bwavDwuwYP4S
         URkHbFVMuXRFSYZFAANIL9BED9f4i7d/8E/C1rG3osXqTknNb6L+Fe41R3iTvD/Qo5Q/
         47LwJLLlA0HQa+RbuAvl4gUveCLLS9ttZci7BJQ3DAF+QwVoRBEj15aoO4Il4/O+/K3K
         7sB6xgOA4T3qc6UGF9vkWF6Nsnqm4XBgmYwtE+Gkx+n0jhQIsG6G7GUHe3AT6PaOu6v1
         9c0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sRgnOA15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si5410845oia.232.2019.12.20.12.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 12:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sRgnOA15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiOs6-0005GH-J9
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 15:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iiOry-0005G4-Fl
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 15:27:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iiOrx-0001BE-9o
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 15:27:30 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:33416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iiOrx-00015Y-1i
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 15:27:29 -0500
Received: by mail-lf1-x144.google.com with SMTP id n25so8010058lfl.0
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2019 12:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+A6IT4c/+pZUoS/jx9YhK15VZ2D9C+6KzH019NBL3Lk=;
 b=sRgnOA159MyHYpx+XgaZ2+0MqiPQfUdXtPZYnI1SalCGd9/1Egm0LqXKt9rkloQdVl
 yvFWA10B/ZJUYJeKy7/tVG4cFp3qI9kRtqkdDx4nq97w+hOhRNUYnLGv2UjfFJ6CYuyd
 VoaLPQqhiYoPIW7oXQNptnUvE+1ZGoTABUaFdjemdNkxu3XlM7UumAw5Qxl73SS9EGen
 /BSaTB1dFTLlbIjJa6Zl+9yIW1imsUFhUEOM42MPAjVwuh2U9tk4TgrbVS0j8BXVr7Mm
 enKm0PezY/uS1742I+jVKc8NcEbOzpdTT5WuUWvcFvrXDJabWvxy54GHH29JYDAeJzBT
 7/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+A6IT4c/+pZUoS/jx9YhK15VZ2D9C+6KzH019NBL3Lk=;
 b=WniMeccHpZKxjp6yeIWQQP4x4PZluLtWyckTDTPqIxLYgxHwghVNmuJbc/1wqVyedF
 UdB4iAXd04m9PvrqnJgT/CHY9c2RCASdFZGk2T1R9v6h3Xz2EchTip45Vf9FLBHa8iIC
 EnrceU099d9A5RZPEqxgciInDSuCjFf+4IjAThm7ryKAAFts4L6Cb7zbtxtKXpDliTap
 uVeJ1VVUskg3JR1zQRaaud2BEJ4N+Fn7NBKpre3igaaE/QBejLQc52G0iuWqUaW6Ns5n
 5D2UApfi2i9fvWmU9dG8gOUE5jCkz7N3YYIMb3N3cTeRUkoqm7PWNbaygl833Gy9ykrQ
 jdMQ==
X-Gm-Message-State: APjAAAVFW4cbXxLq/M2/HFYsuRXa2OeKubV4Cnx/4YrYRzkdwK0hzDRZ
 64L41QgT/2XKDXXVacg55CGe8Q==
X-Received: by 2002:a19:dc14:: with SMTP id t20mr10166439lfg.47.1576873646930; 
 Fri, 20 Dec 2019 12:27:26 -0800 (PST)
Received: from moi-limbo-9350.arm.com (user44-177.satfilm.com.pl.
 [77.91.44.177])
 by smtp.gmail.com with ESMTPSA id g27sm4482353lfj.49.2019.12.20.12.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 12:27:26 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/1] target/arm: kvm: Support for KVM DABT without valid
 ISS
Date: Fri, 20 Dec 2019 20:27:06 +0000
Message-Id: <20191220202707.30641-1-beata.michalska@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Christoffer.Dall@arm.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2DEzjKhmSJ7F

Some of the ARMv7 & ARMv8 load/store instructions might trigger a data abort
exception with no valid ISS info to be decoded. The lack of decode info
makes it at least tricky to emulate the instruction which is one of the
(many) reasons why KVM will not even try to do so.

So far, if a guest made an attempt to access memory outside the memory slot,
KVM reported vague ENOSYS. As a result QEMU exited with no useful information
being provided or even a clue on what has just happened.

Recently ARM KVM introduced support for notifying guest of an attempt to
execute an instruction that resulted in dabt with no valid ISS decoding info.
This still leaves QEMU to handle the case, but at least now, it can enable
further debugging of the encountered issue by being more verbose
in a (hopefully) useful way.



Beata Michalska (1):
  target/arm: kvm: Handle DABT with no valid ISS

 accel/kvm/kvm-all.c    | 15 +++++++
 accel/stubs/kvm-stub.c |  4 ++
 include/sysemu/kvm.h   |  1 +
 target/arm/cpu.h       |  3 +-
 target/arm/kvm.c       | 95 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c     |  3 ++
 target/arm/kvm64.c     |  3 ++
 target/arm/kvm_arm.h   | 19 +++++++++
 8 files changed, 142 insertions(+), 1 deletion(-)

-- 
2.17.1

