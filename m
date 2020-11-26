Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1797407lfb;
        Thu, 26 Nov 2020 14:11:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYYOkjzSDQ6KE5k0lQLlYyVo66RD5qLddYCKfK+f50+ESJ2x8sftb7fmZLjpOqOvufXtlq
X-Received: by 2002:a25:6744:: with SMTP id b65mr8848409ybc.321.1606428685846;
        Thu, 26 Nov 2020 14:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606428685; cv=none;
        d=google.com; s=arc-20160816;
        b=g8s5mZ+LzInLPfyW8bKUqqupdCY/wwxppLzFBHR9j9fsgm5AMZ3xEKuuYnx00fgh/v
         GbusXTD7ue9+l0FKeEmNYoXO12ywMeNaIC1scXXK5uUbj5qNN4p2mydMSaFRn3JghgLp
         DKSgFqLHHgYdAZ3Vbuu9N8RnprEdgH4LO91DCt23cRY5btRdsS0Q2QK9PJhmcS3ue2+u
         Q1AbsH2hc6Iyn4wWYzEgQK/ZQ90i/LniJt9TRjuQ97iloFvkXX9s5S8jOTavzGvoBztg
         lVevpWbwEsiY26ttRdUbT+g7p51bVoGy4aOQx8q3z9sgO5urF4ujhrGi+u001JTvjs5j
         kcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zjArGFcs2fBpuKvFj60RdR/IGn5T0XZSTIWxFGmiY/I=;
        b=J3urDfyN2Cj/R+eXahUkRxmxve82V5cJEZwPvz6t9vah7QKsf3pmRV1k720S9IkNLh
         7BW7SkMzOY7eyXopwPojmyOVj1D/Lc1HrWtCqLPqbC1ktY208bXOTGdTlq/4sQhKB2x0
         1QbHof/Ybtp/4oetj5eluRRc7Hq/e+X1fkUvCm710S7YaFT0aOmqcypVtcB/RY/eWCZi
         /y3aHVWJy62MR3ra5QUDBo8d3BB7MId8CIhY4xfUa6H7UdJfZOfOBCV5NELh9mzqPGVw
         aTIg+6JTXYtwd8wpcEQnbjJxIGJXqlJIheEJI/NUVbDuq/6z1gRrznVpHXSkfvhiIvux
         Mbgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W1A3x6IO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si7236012ybb.128.2020.11.26.14.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 14:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W1A3x6IO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPU5-0005up-6m
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 17:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPTh-0005tw-Cz
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 17:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPTd-0004Zl-BR
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 17:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606428656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zjArGFcs2fBpuKvFj60RdR/IGn5T0XZSTIWxFGmiY/I=;
 b=W1A3x6IOOFDwU0SUn8P6HdYuXV8fa1Uotbs0WauBKHofLZoAMGThLCra+6wKrP/6vcb6WC
 N8xU1h2qTcU9SuTHphmfnUioOcUzGS1fay03deFPNPBQo0KvIYy5Ve8Vv9Y3aCCoDdpwuz
 9Sl+0Veix5fg3D9sNWENimZZ1Jyeeao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-_1X3yvC8NUiimNNmQld7rw-1; Thu, 26 Nov 2020 17:10:53 -0500
X-MC-Unique: _1X3yvC8NUiimNNmQld7rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90BCB1005D4D;
 Thu, 26 Nov 2020 22:10:51 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD305D6AC;
 Thu, 26 Nov 2020 22:10:51 +0000 (UTC)
Date: Thu, 26 Nov 2020 17:10:49 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 0/8] hvf: Implement Apple Silicon Support
Message-ID: <20201126221049.GS2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2DmzxeNYBp0

On Thu, Nov 26, 2020 at 10:50:09PM +0100, Alexander Graf wrote:
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
> 
> This patch set implements a rudimentary, first version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests, albeit with a few caveats:
> 
>   * no WFI emulation, a vCPU always uses 100%
>   * vtimer handling is a bit hacky
>   * we handle most sysregs flying blindly, just returning 0
>   * XHCI breaks in OVMF, works in Linux+Windows
> 
> Despite those drawbacks, it's still an exciting place to start playing
> with the power of Apple Silicon.
> 
> Enjoy!
> 
> Alex
> 
> Alexander Graf (8):
>   hvf: Add hypervisor entitlement to output binaries
>   hvf: Move common code out
>   arm: Set PSCI to 0.2 for HVF
>   arm: Synchronize CPU on PSCI on
>   hvf: Add Apple Silicon support
>   hvf: Use OS provided vcpu kick function
>   arm: Add Hypervisor.framework build target
>   hw/arm/virt: Disable highmem when on hypervisor.framework
> 
>  MAINTAINERS                  |  14 +-
>  accel/hvf/entitlements.plist |   8 +
>  accel/hvf/hvf-all.c          |  56 ++++
>  accel/hvf/hvf-cpus.c         | 484 +++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build        |   7 +
>  accel/meson.build            |   1 +

This seems to conflict with the accel cleanup work being done by
Claudio[1].  Maybe Claudio could cherry-pick some of the code
movement patches from this series, or this series could be
rebased on top of his.

[1] https://lore.kernel.org/qemu-devel/20201124162210.8796-1-cfontana@suse.de

>  hw/arm/virt.c                |   9 +
>  include/hw/core/cpu.h        |   3 +-
>  include/sysemu/hvf_int.h     |  69 +++++
>  meson.build                  |  39 ++-
>  scripts/entitlement.sh       |  11 +
>  target/arm/arm-powerctl.c    |   3 +
>  target/arm/cpu.c             |   4 +
>  target/arm/hvf/hvf.c         | 345 +++++++++++++++++++++++++
>  target/arm/hvf/meson.build   |   3 +
>  target/arm/meson.build       |   2 +
>  target/i386/hvf/hvf-cpus.c   | 131 ----------
>  target/i386/hvf/hvf-cpus.h   |  25 --
>  target/i386/hvf/hvf-i386.h   |  48 +---
>  target/i386/hvf/hvf.c        | 360 +-------------------------
>  target/i386/hvf/meson.build  |   1 -
>  target/i386/hvf/x86hvf.c     |  11 +-
>  target/i386/hvf/x86hvf.h     |   2 -
>  23 files changed, 1061 insertions(+), 575 deletions(-)
>  create mode 100644 accel/hvf/entitlements.plist
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/hvf-cpus.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h
>  create mode 100755 scripts/entitlement.sh
>  create mode 100644 target/arm/hvf/hvf.c
>  create mode 100644 target/arm/hvf/meson.build
>  delete mode 100644 target/i386/hvf/hvf-cpus.c
>  delete mode 100644 target/i386/hvf/hvf-cpus.h
> 
> -- 
> 2.24.3 (Apple Git-128)
> 

-- 
Eduardo

