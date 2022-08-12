Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1005352ejf;
        Fri, 12 Aug 2022 01:46:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7+Qw1pNgJwOfSBIR1caR3sWSIIDk/7SnDu72azFpIj8v6dNObHI+1nYdKb9tY2SC986kar
X-Received: by 2002:a05:620a:6002:b0:6b9:657c:25c6 with SMTP id dw2-20020a05620a600200b006b9657c25c6mr2066751qkb.432.1660293980181;
        Fri, 12 Aug 2022 01:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660293980; cv=none;
        d=google.com; s=arc-20160816;
        b=D6ceYdZH+NA6iK70P1RaMJQrnCKV6F1Rwy8T9hGcG3w80mZesQ42fKQNmvu01HHZYZ
         E01nx7b9q+QoGXpfQGCSqSh9pefgCdcFFR0/5yumGNz8sH71VcVCp5DZuhrXTkIuM/Sa
         PE2OmUJ3eTYH1pjBJCvL9E6BYd4i9cKCogBvOObQYCvvpxC8apeRdUHS8qvOX8MlfLoU
         2Tp8nqrmEDecPj7cshmAH3ypuaP0tGuMw4K3gpA4uG3tZ0a7rFxrsEFKmKDIeFgH7y1+
         MW+HMX2NcHWH4Mra1Zg/EBek/um1FZiTQEFSdrZ9hnU8L3jkI/gCn8VNbeIz14qIh7/m
         DS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=+NWQM+3Kl7HXzAvtt7goJmzjbmo2VNX1qbmzXHAETLo=;
        b=t/rsKHU/dNg+QYMjaVAjBPkhpQ1PqMbkIgC/qOxrKynWJBSBQgFyKagf7fGSf9F93g
         CVVXDcrhLUGRmnJtMcBrtN8kbGZ+U9q0IvskoFXlAdFXC0+gzdJEpZQpLxgenaymBPCz
         VLr+EFRiLa4+cspKHFMxFawFfE4BhJzm9j8d6G9SiBZa4h4R1th71lIxv+87QcDszrZb
         o2KTncxRzid/I5wf29TnlI5h0+GOGmXFmYOQQqVvR74Wh6yE8vjU7Q5dWxWlWL4hXN9d
         qrFZxDGPuMRVc5kI/GehcvZdIdh77cVktm6VoU72aITXtjsw1x7BdvMCRuMfXc7GOtsa
         oNuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020ac84881000000b00342c2bae776si926973qtq.31.2022.08.12.01.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 01:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMQJ9-00078N-KH
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 04:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>) id 1oMQIP-000781-JL
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 04:45:33 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:60038)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1oMQIN-0007BP-It
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 04:45:33 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 69FA872C90B;
 Fri, 12 Aug 2022 11:45:29 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 3E12B4A46FE;
 Fri, 12 Aug 2022 11:45:29 +0300 (MSK)
Date: Fri, 12 Aug 2022 11:45:29 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: qemu-system-aarch64: Failed to retrieve host CPU features
Message-ID: <20220812084529.ur5qcyws5qvoyvuc@altlinux.org>
References: <20220812021427.cwenhciuftgtaj64@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20220812021427.cwenhciuftgtaj64@altlinux.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K4RW7MbIlC0X

On Fri, Aug 12, 2022 at 05:14:27AM +0300, Vitaly Chikunov wrote:
> Hi,
> 
> I noticed that we starting to get many errors like this:
> 
>   qemu-system-aarch64: Failed to retrieve host CPU features
>  
> Where many is 1-2% per run, depends on host, host is Kunpeng-920, and
> Linux kernel is v5.15.59, but it started to appear months before that.
> 
> strace shows in erroneous case:
> 
>   1152244 ioctl(9, KVM_CREATE_VM, 0x30)   = -1 EINTR (Interrupted system call)
> 
> And I see in target/arm/kvm.c:kvm_arm_create_scratch_host_vcpu:
> 
>     vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>     if (vmfd < 0) {
>         goto err;
>     }
> 
> Maybe it should restart ioctl on EINTR?
> 
> I don't see EINTR documented in ioctl(2) nor in Linux'
> Documentation/virt/kvm/api.rst for KVM_CREATE_VM, but for KVM_RUN it
> says "an unmasked signal is pending".

I am suggested that almost any blocking syscall could return EINTR, so I
checked the strace log and it does not show evidence of arriving a signal,
the log ends like this:

  1152244 openat(AT_FDCWD, "/dev/kvm", O_RDWR|O_CLOEXEC) = 9
  1152244 ioctl(9, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE) = 48
  1152244 ioctl(9, KVM_CREATE_VM, 0x30)   = -1 EINTR (Interrupted system call)
  1152244 close(9)                        = 0
  1152244 newfstatat(2, "", {st_dev=makedev(0, 0xd), st_ino=57869925, st_mode=S_IFIFO|0600, st_nlink=1, st_uid=517, st_gid=517, st_blksize=4096, st_blocks=0, st_size=0, st_atime=1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_atime_nsec=850436293, st_mtime=1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_mtime_nsec=850436293, st_ctime=1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_ctime_nsec=850436293}, AT_EMPTY_PATH) = 0
  1152244 write(2, "qemu-system-aarch64: Failed to r"..., 58) = 58
  1152244 exit_group(1)                   = ?
  1152245 <... clock_nanosleep resumed> <unfinished ...>) = ?
  1152245 +++ exited with 1 +++
  1152244 +++ exited with 1 +++

Thanks,

> 
> Thanks,
> 
