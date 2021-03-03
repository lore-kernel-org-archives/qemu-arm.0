Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5577312lfg;
        Wed, 3 Mar 2021 10:22:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG+a6tY5A3mBgpx8Y0TaDai/w9QRvX6k0/bWpoUTRiQJPEf1zgetbDFlBEEeRoE7z1B/3q
X-Received: by 2002:a6b:610d:: with SMTP id v13mr396936iob.132.1614795770063;
        Wed, 03 Mar 2021 10:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614795770; cv=none;
        d=google.com; s=arc-20160816;
        b=hPDG25V6ZWmb41q5r4lO7RWVXTKeo02BAblGIpPpjzsTQ/GYtsLBCwlln5niZUH0KD
         PxMBNrbxZDZFEGyjKNpH/OQOSMz3AoVoPcJPQbhqIZZxw1/sk+bQAE7U6f6gsPAJvWQn
         cJMI1EV+ubKxcCoBPxm2NySXjzmnWjORTmt+jnrtOD1DXBA+ajdL4bBPCPqNe701hJen
         ghtjclHIMsPwsMhusynJUe12hubZW/KbGjZTKTIMgq2lDK3v4VfV0cDywXLIbULZ5MwY
         GtO3zL2I/zQvzh+FCc6puuDa8EpuMHrMJRL/RkBWDk1D4CCiAtJlKMuF8rWpUbFslaTL
         m9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=c2RVdSAhN19HCcvNMcEKCSeQlJ0pBYd+9LH4EI/CKB0=;
        b=TfJe/ZaJBGua1A8QwO1piUIJosZP1n260xPfYJmApzdxvc9LG6a5GKqoSwgIOUPCkJ
         wY0731O789XrmRdHpwfXe4PCHmSn/m6GA/CXxlnd5lykbsojmF1NM9ErWvse2rATNJYq
         puk3s4nlQ9Xl+qfngKzBdcl4RKWCVSegSUXm7kYBJWQ13etAdN4YdzAOu18nBmfbQy8y
         Afttf69T0L3zClaOUrNKOaMybNe17w2xRZF6ylvA8mZyVC57WWy+IBpQPqFSIleOpLHo
         Oj1soAfoNaS/wlKoeXepyqzx40ZH1sHXo35S0Dct31OOUqEBC33CTHe7GAqquOl+owYx
         71ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M49lc0S3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si17648972ioh.3.2021.03.03.10.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:22:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M49lc0S3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHW93-0004g9-Bi
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8m-0004WS-Um
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8l-0000N9-0a
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c2RVdSAhN19HCcvNMcEKCSeQlJ0pBYd+9LH4EI/CKB0=;
 b=M49lc0S3XIdZV/YDo49hdkeoOsahHpHyUABhxRTGkJBxQwfADQTgBkrt8WVSKA7S4Hh4Fh
 fBdbQiejGGmTP63Gu2nTmDGAd+fDGc+dQzD/s2cbo5uPTrB8A77RVDHJcwQbRF3c+4TGye
 NQD6BWVG062a6qbqgGqtqDBynMeorLc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-llFQNcZqPBKF6ww4QwiI0w-1; Wed, 03 Mar 2021 13:22:23 -0500
X-MC-Unique: llFQNcZqPBKF6ww4QwiI0w-1
Received: by mail-wm1-f69.google.com with SMTP id c7so1673827wml.8
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pU0d9Mw8PQdbgfBbP+KMCl6F0o1+MOAeJgm+3OD11Xs=;
 b=DE8cjSNN9Kt3UfTwaaofRsquTB6pshWxxX2IdlNhCCLIn715KeYGHRh7ObCsxRVAed
 wbbm/Ek8LrnqvjItOtZWSY3U9/aePH393cBA4QeTrhGROPX4m5sOagQAvdekkf4+hCYP
 1LtNjV0LOrr7XqMq7cCOset1Rl2qaWDoOu3mFNvPl+UvU47fSIHAt/DjMeFShNfhETYU
 I3JCd5GP0HNRNAQ/jkprWz36NhyBpfMSy/U5zqz1aBcN+PVAEDxdfKyLiBhhAuqryQ25
 OHCOSZISz38jGFNcCcnJhiAUronfs2z8d0UFp3t4mPILskZ9qEBnM36WnaOe9EsBL11c
 vEoQ==
X-Gm-Message-State: AOAM531O1LpiD20yk6KUaNqT7NaNvUen+Qcun9+LPCZHTjgcswqvULFa
 U5ikNQeKxF7xms29FsjqVnMmOsmaWxefezjDB8vIG1BDCHg1EHDmF9KqVqI3UgA1w+xJaANHyFT
 5qDxTBhke47pi
X-Received: by 2002:a5d:430a:: with SMTP id h10mr19947wrq.162.1614795742355;
 Wed, 03 Mar 2021 10:22:22 -0800 (PST)
X-Received: by 2002:a5d:430a:: with SMTP id h10mr19929wrq.162.1614795742181;
 Wed, 03 Mar 2021 10:22:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm35148487wra.66.2021.03.03.10.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
Date: Wed,  3 Mar 2021 19:22:00 +0100
Message-Id: <20210303182219.1631042-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGX3SqvLc7uj

Hi,=0D
=0D
This series introduces the 'AccelvCPUState' which is forward=0D
declared opaque in "cpu.h", then each accelerator define it.=0D
=0D
The opaque CPUState::accel_vcpu pointer is shared by all=0D
accelerators (not a problem because there can be at most=0D
one accelerator per vCPU).=0D
=0D
Series is organized as:=0D
- preliminary trivial cleanups=0D
- introduce AccelvCPUState=0D
- move WHPX fields (build-tested)=0D
- move HAX fields (not tested)=0D
- move KVM fields (build-tested)=0D
- move HVF fields (not tested)=0D
=0D
For now vcpu_dirty is still shared in CPUState.=0D
=0D
Sending as RFC to see if it is worthwhile.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (19):=0D
  target/i386/hvf: Use boolean value for vcpu_dirty=0D
  target/s390x/kvm: Simplify debug code=0D
  target/s390x/kvm: Reduce deref by declaring 'struct kvm_run' on stack=0D
  cpu: Croup accelerator-specific fields altogether=0D
  cpu: Introduce AccelvCPUState opaque structure=0D
  accel/whpx: Add typedef for 'struct whpx_vcpu'=0D
  accel/whpx: Rename struct whpx_vcpu -> AccelvCPUState=0D
  accel/whpx: Use 'accel_vcpu' generic pointer=0D
  accel/hax: Add typedef for 'struct hax_vcpu_state'=0D
  accel/hax: Use 'accel_vcpu' generic pointer=0D
  accel/kvm: Introduce kvm_vcpu_state() helper=0D
  accel/kvm: Use kvm_vcpu_state() when possible=0D
  accel/kvm: Declare and allocate AccelvCPUState struct=0D
  accel/kvm: Move the 'kvm_fd' field to AccelvCPUState=0D
  accel/kvm: Move the 'kvm_state' field to AccelvCPUState=0D
  accel/kvm: Move the 'kvm_run' field to AccelvCPUState=0D
  accel/hvf: Reduce deref by declaring 'hv_vcpuid_t hvf_fd' on stack=0D
  accel/hvf: Declare and allocate AccelvCPUState struct=0D
  accel/hvf: Move the 'hvf_fd' field to AccelvCPUState=0D
=0D
 include/hw/core/cpu.h         |  17 +--=0D
 include/sysemu/kvm.h          |   2 +=0D
 include/sysemu/kvm_int.h      |   9 ++=0D
 target/i386/hax/hax-i386.h    |  10 +-=0D
 target/i386/hvf/hvf-i386.h    |   4 +=0D
 target/i386/hvf/vmx.h         |  28 +++--=0D
 accel/kvm/kvm-all.c           |  44 ++++---=0D
 hw/s390x/pv.c                 |   3 +-=0D
 target/arm/kvm.c              |   2 +-=0D
 target/arm/kvm64.c            |  12 +-=0D
 target/i386/cpu.c             |   4 +-=0D
 target/i386/hax/hax-all.c     |  22 ++--=0D
 target/i386/hax/hax-posix.c   |   4 +-=0D
 target/i386/hax/hax-windows.c |   4 +-=0D
 target/i386/hvf/hvf.c         | 118 +++++++++---------=0D
 target/i386/hvf/x86.c         |  28 ++---=0D
 target/i386/hvf/x86_descr.c   |  32 +++--=0D
 target/i386/hvf/x86_emu.c     |  62 +++++-----=0D
 target/i386/hvf/x86_mmu.c     |   4 +-=0D
 target/i386/hvf/x86_task.c    |  14 ++-=0D
 target/i386/hvf/x86hvf.c      | 227 +++++++++++++++++-----------------=0D
 target/i386/kvm/kvm.c         |  36 +++---=0D
 target/i386/whpx/whpx-all.c   |  34 ++---=0D
 target/ppc/kvm.c              |  16 +--=0D
 target/s390x/kvm.c            | 148 +++++++++++-----------=0D
 25 files changed, 466 insertions(+), 418 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D

