Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1051732njc;
        Thu, 13 Feb 2025 20:18:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjuxEjSylkEodc7iFIJ03A95ChUPSBOzaWL+agzNQc2l9XKufFlq67ryyQ2gMcTBAGUc9t2DOfDh4CsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEEdZ2sxWgJtXHQC6DCwV3bHFPAaZxTqFmoaUZu7E9Cfl9brjG/uRLgo+9gFxElFNdu4Ico
X-Received: by 2002:a05:620a:1aa7:b0:7b6:d050:720f with SMTP id af79cd13be357-7c07071d38bmr1525184685a.22.1739506706283;
        Thu, 13 Feb 2025 20:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739506706; cv=none;
        d=google.com; s=arc-20240605;
        b=d2qva/qso0XrZn+Yin4j7zUbvrOS5+Q1DPoQCjUoMaDQX2wJGvbv/h4gXgGmX8Am7I
         k+b039iZeTgxtYVn1ib0PyMbz2JsxVhgLE1ex5tA1v3trSUVXmYUuuMjmOr/8lpO4i93
         jkm4CishEvwEBvo4sYje0yZJ3EHBsgF8eDY+P6V6osQRSOhznQ/RTqMCM2sOYL2WWvkd
         jH5mQohKuS5iYnLzlasFm5AUokF/3bl98YXJHvYaPBPWMjwKbkSsz6TnerybxYnVaa1M
         zeVviHm3RL9E+dQ/BoBPkuo+9tWniMx/kqn19JxiTl6lqTn9AX6wEVJkh2LwFYdssV8H
         ANrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y6woE6YZq7PxsN07Vv6kJjlWyQ8cfuZEwVw6wv2u9y8=;
        fh=wmAecxDqeNBCKAnoeE8JRGLQLypWZwcHXbjIDFVSUxs=;
        b=VrHTfHcOthk7yd6rlNdaJp6gGr5SwwG0B7vXHdy8trPPYkW9J4vp4SaOVoU0IRGKCY
         GmCnazckAZ3SS8MtZyNj+UwmJUVMzzoZegaT8xpKSyelbZ5HXF8LUJ55ZaZScae5sxFH
         l3ucKeN6nXkLV2lQrIWOYibMbvldJz3I6G2myLeZ7tjF1xzhA9FsuGOH9cJqqKARYFY3
         yN3YjuiQLEx40BW4gcxdftdAljqqAmuvkbZ42tOK4FDSz+fgxWkpZ0UIb9g7RI6vX6/+
         WaqaVXe5TQXxkCm0I6KomVZkZcKTNG/SflKpWtdexpxnUetggotHUDKlqMcCkzejBF2O
         a17g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BdrsoehA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c8b7213si251947685a.468.2025.02.13.20.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 20:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BdrsoehA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tin8X-0005U7-M0; Thu, 13 Feb 2025 23:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tin8V-0005TL-Tl
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 23:17:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tin8T-0002Zh-RX
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 23:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739506622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y6woE6YZq7PxsN07Vv6kJjlWyQ8cfuZEwVw6wv2u9y8=;
 b=BdrsoehABM/RNdnEocbonSG19vqg6Af0DbRUP6EaRTSxIQDWtBTLY44ufrIh5YqQtugSy6
 2o3RSQ2TpSBtHDfDnPdg+7TVuKYnd8wnzZZu7hBSAj2WYv9sDgde+H2SN9wr6P+SYSG+Ke
 GS/mY3I55j+dfmJ5lJ6yEi0aVDgIJdU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-afE9I8VNMNWDmJZGxkU22g-1; Thu,
 13 Feb 2025 23:16:58 -0500
X-MC-Unique: afE9I8VNMNWDmJZGxkU22g-1
X-Mimecast-MFC-AGG-ID: afE9I8VNMNWDmJZGxkU22g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2BFCA19373D9; Fri, 14 Feb 2025 04:16:57 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.82])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7DE4319373C4; Fri, 14 Feb 2025 04:16:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 0/4] target/arm: Improvement on memory error handling
Date: Fri, 14 Feb 2025 14:16:31 +1000
Message-ID: <20250214041635.608012-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mAEWAftj8/Wi

Currently, there is only one CPER buffer (entry), meaning only one
memory error can be reported. In extreme case, multiple memory errors
can be raised on different vCPUs. For example, a singile memory error
on a 64KB page of the host can results in 16 memory errors to 4KB
pages of the guest. Unfortunately, the virtual machine is simply aborted
by multiple concurrent memory errors, as the following call trace shows.
A SEA exception is injected to the guest so that the CPER buffer can
be claimed if the error is successfully pushed by acpi_ghes_memory_errors(),
Otherwise, abort() is triggered to crash the virtual machine.

  kvm_vcpu_thread_fn
    kvm_cpu_exec
      kvm_arch_on_sigbus_vcpu
        kvm_cpu_synchronize_state
        acpi_ghes_memory_errors         (a)
        kvm_inject_arm_sea | abort

It's arguably to crash the virtual machine in this case. The better
behaviour would be to retry on pushing the memory errors, to keep the
virtual machine alive so that the administrator has chance to chime
in, for example to dump the important data with luck. This series
adds one more parameter to acpi_ghes_memory_errors() so that it will
be tried to push the memory error until it succeeds.

Gavin Shan (4):
  acpi/ghes: Make ghes_record_cper_errors() static
  acpi/ghes: Use error_report() in ghes_record_cper_errors()
  acpi/ghes: Allow retry to write CPER errors
  target/arm: Retry pushing CPER error if necessary

 hw/acpi/ghes-stub.c    |  3 ++-
 hw/acpi/ghes.c         | 45 +++++++++++++++++++++---------------------
 include/hw/acpi/ghes.h |  5 ++---
 target/arm/kvm.c       | 31 +++++++++++++++++++++++------
 4 files changed, 51 insertions(+), 33 deletions(-)

-- 
2.48.1

