Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp1364801dlb;
        Thu, 8 Aug 2024 20:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPrKjTCnnW3c6QbB5DOc59Ceb0IX3vAjJitWrGcARfmgMUdISXqWgcuWPru8HiNh39ktm5cKFOcmJcECUPr5mmMGGhqBZl
X-Google-Smtp-Source: AGHT+IGsvhMkc8z5neY8C3zM5ROmjimaotenatrSQo+LcAMfKueIJVgV04hU42COnaIfMR7+Z6Wm
X-Received: by 2002:a05:622a:1a17:b0:447:e591:2d27 with SMTP id d75a77b69052e-451d57b5684mr57940421cf.6.1723175554100;
        Thu, 08 Aug 2024 20:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723175554; cv=none;
        d=google.com; s=arc-20160816;
        b=Z076IeZDXphjER8qMPhJCyb9jVtlZsjNpTzn1i8hAc/O0zpHLV7N9GSK9VDfvqJYzc
         RrhNUS4+H3GgHCutkBM2ickfi0nxquNt56jAvUJZukm9kcQqtVaPnbN30rAn9QpiyHhp
         i4crzReh6VrbwZwJHtWUQhg5T9uedzs46QoZqKK7yjYGjHwN74nTsBHICXNmQHe/hoN1
         ppmhYU6snrxEHSnVn+pm6lJDgcnSu40wzGSZdDMDqEszqYhxBkbEWsYrCt8nzfoohhml
         d0AuWL5kR78tMu/DxBkWlldLzCDAdW3KAqB4RVFT4d+Lz3rswxVrzF0vKYJse1l0DqN3
         5mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JWDt4I+81m8CBbmiUvK537yFMwopmOQ1ObO7UTLy0pI=;
        fh=XX+dgkgF1NhCVN+iBAG+rOLypjsAs0LmRKXD2YPrEGE=;
        b=dhFc67XiHMHaXCj4XoOW/OeFOrbNyfFDAp8o4QWNrIn8ngsAuN6vltytqVoJFmbFnE
         WQnhDRFVF8aqaLb6PUvt/wCFgoiuMm1yJvXk04hSjz23jKzWG/qIUFXkcVejXnd5hkQO
         mQMCLO4eU97vgjvivIyClubXlMj745AtAkglEL4lyOvZDiN6QE4DvUSXymOakXXIh641
         OzlN7ZtilcYutvQZL3L+ERZHJfAxxSxsmbZroI/ie05HxGOUVtqWat07KX/MIJrzwzAb
         6TpWx1OVxtfMjTA38DUeXzoW2YoJXWyVB4BaLANlPSGdSCnFOTu3TfdGXT/ayxuWXbHe
         4SQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hb86yIcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c8830f19si63875481cf.553.2024.08.08.20.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 20:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hb86yIcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scGfi-00087f-8k; Thu, 08 Aug 2024 23:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scGfh-00086e-0R
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 23:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scGff-0008MJ-H2
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 23:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723175524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JWDt4I+81m8CBbmiUvK537yFMwopmOQ1ObO7UTLy0pI=;
 b=hb86yIcUIbz135p6o8pZAmIots3ccMiv2kiSTXHqHxWVL1KArfZv+qzuUGMYO3dkkNbpip
 8rkJR0hxJ04nDTpp/p/0BH6qAZjqfmK8OOovIgpRVJrcGeIUQuAH+/IjYe/42JvV0ATFfc
 G6m33UNxKCPwodgIczPxFAKcDNIevaA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-TC-aA-HrOreojHNtPsrXWQ-1; Thu,
 08 Aug 2024 23:52:01 -0400
X-MC-Unique: TC-aA-HrOreojHNtPsrXWQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 71E811944DEE; Fri,  9 Aug 2024 03:51:59 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.133])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2B9C6195917D; Fri,  9 Aug 2024 03:51:53 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH 0/4] hw/arm/virt: Improve virt_kvm_type()
Date: Fri,  9 Aug 2024 13:51:29 +1000
Message-ID: <20240809035134.699830-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /12HeGB3Cqz+

hw/arm/virt.c::virt_kvm_type() can be improved due to the facts as
below, when I inspect the code to review Salil's (RFCv3) vCPU hotplug
series.

  * virt_kvm_type() and MachineClass::kvm_type() are needed only when
    CONFIG_KVM is enabled.

  * kvm_arm_get_max_vm_ipa_size() and kvm_arch_get_default_type() are
    generally interchangeable with the exception that type zero is
    corresponding to IPA size (bits) 40. So it's unecessary to keep
    both APIs.

Lets clean it up so that kvm_arm_get_max_vm_ipa_size() is eventually
removed. kvm_arch_get_default_type() is used to get the KVM type and
IPA size (bits).

Gavin Shan (4):
  hw/arm/virt: hide virt_kvm_type() on !CONFIG_KVM
  hw/arm/virt: Avoid multiple lines of comments in virt_kvm_type()
  hw/arm/virt: Use kvm_arch_get_default_type()
  target/arm/kvm: Remove kvm_arm_get_max_vm_ipa_size()

 hw/arm/virt.c        | 22 +++++++++++-----------
 target/arm/kvm.c     | 13 ++-----------
 target/arm/kvm_arm.h | 15 ---------------
 3 files changed, 13 insertions(+), 37 deletions(-)

-- 
2.45.2

