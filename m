Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp892902ejf;
        Thu, 11 Aug 2022 20:34:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4J6REL5kjaYrZ/oTnT6RouwugS2JraMg+hNn5pRFmVrI7NiQeLbTg0Y5r77p1e4xJeyhV/
X-Received: by 2002:a05:6214:27ca:b0:476:c754:6288 with SMTP id ge10-20020a05621427ca00b00476c7546288mr1724476qvb.54.1660275254511;
        Thu, 11 Aug 2022 20:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660275254; cv=none;
        d=google.com; s=arc-20160816;
        b=Sa45qd02xH8Y+ASwte5pmfxJIMpkuYf4dpn5bE30fomac6YsXSOsL0J7ME/05ejWcr
         JSgTK2QZKPeroL857qVzL7a9Z4zBh329HfLjwx/5nEstYHs+Xv2SCfwkvwcrFmjrO7IJ
         yvio2mtqF61hjDGiiKmyEMaCWKx2PBDxHdyDBV/KsZ/J5CmTrkQ8cGJd7vxGT8SEDs2E
         Eo/DKs84eM8GLLpzgpchO7KUgKurBR14sWN2gbT/QXXTw2n2ASl6ss/7LFJwzD9ifUni
         BRypw5jvnkJ7Ur4knzzYFqqZAwEPcfaw/CtUIHb3QMQMMECH3lMGZlEblcFu9oPCIpma
         LEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:message-id:subject:cc:to:from:date;
        bh=Sg8mDrXmWeDyw8jdJWiIxoGHmL29I7eIBd6w27qO404=;
        b=YQUhkgDPBINLRxaFwhFh9I068BFnmPkkgdoJd4qbyKB7bwPGphy6fSUbrikOGFDPYx
         83Z24GU6SKKoqFZvdermMh5IENSL64nPSe9cMDDvf6Vx4+raGduRE5uGh6HAEdoKzz0w
         exMEtGCcu0TJkyh8FZ9MaMwCFTlht+037AYbdL6AQJwoC9Bu/+z99hckpiwO8QaEKNmZ
         Zw1knZHKK5goP3XrA5YEs5oK+dmDT2VnYg0XbwIqQuyqbcCSMz1UfKjapZmam9A9D3V4
         dBPEedTI22hV8B/OhotA85bzXRF0/Lgwp7myCnnii5/ACb4/3jqlt1jaHeo7YY894cUS
         1dZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020ae9e301000000b006b9585d5c29si594765qkf.97.2022.08.11.20.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 20:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMLR8-0002Vz-1g
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 23:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>) id 1oMKC0-0002Mt-Ho
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 22:14:32 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:46422)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1oMKBy-0001L4-Aw
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 22:14:32 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 86D0A72C90B;
 Fri, 12 Aug 2022 05:14:27 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 71F234A46FE;
 Fri, 12 Aug 2022 05:14:27 +0300 (MSK)
Date: Fri, 12 Aug 2022 05:14:27 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: qemu-system-aarch64: Failed to retrieve host CPU features
Message-ID: <20220812021427.cwenhciuftgtaj64@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Aug 2022 23:30:52 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ENyHlxxuGH+o

Hi,

I noticed that we starting to get many errors like this:

  qemu-system-aarch64: Failed to retrieve host CPU features
 
Where many is 1-2% per run, depends on host, host is Kunpeng-920, and
Linux kernel is v5.15.59, but it started to appear months before that.

strace shows in erroneous case:

  1152244 ioctl(9, KVM_CREATE_VM, 0x30)   = -1 EINTR (Interrupted system call)

And I see in target/arm/kvm.c:kvm_arm_create_scratch_host_vcpu:

    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
    if (vmfd < 0) {
        goto err;
    }

Maybe it should restart ioctl on EINTR?

I don't see EINTR documented in ioctl(2) nor in Linux'
Documentation/virt/kvm/api.rst for KVM_CREATE_VM, but for KVM_RUN it
says "an unmasked signal is pending".

Thanks,

