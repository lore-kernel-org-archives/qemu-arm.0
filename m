Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp177330ejr;
        Tue, 10 Oct 2023 07:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaLg0h+KsrP/YKoPdsYYAneTLACCVFiashRh/eO2mGz2VudP1EU14Kqy51uVlLSw/OScNN
X-Received: by 2002:a05:620a:4085:b0:774:1216:3da with SMTP id f5-20020a05620a408500b00774121603damr23251651qko.4.1696947931614;
        Tue, 10 Oct 2023 07:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696947931; cv=none;
        d=google.com; s=arc-20160816;
        b=etpbIzm3je0Il9wu+wJpBlnCWHYqhfhOoyD9VDEX6ZvLHXBvOo8q3++nDnckhgP71P
         1Pq7XgTLnejj5DiYkUOa7yZgz2kHj11mnGkbi0u5ccCYijOmXzlwPxUz2uDnjPWePVb8
         0YjlUPCmBj0TOo9F4bj8DMux2WJyWmuhGDYnkvmnD5y/Mxk+4IS7OUCwj3YqyIYJ2QnN
         Xp5xMIwCV1KNTo0bgjV4aRGsqiSLskp+8xoASJmOTQ3eiTPbS/RQefjUdc0IXN3I2SJm
         rFvHJtFYo7XZ8/TaLJCjtl6Cvx/tNq+wkalGwbxJarx1Ri+0ucUZMmfLHViHDmEZgEW5
         f4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=M1ohce11WkNNe0cgAMwi8ts3gYAezYJYisUUMXuKoVk=;
        fh=ImRerk2y7/YfWKyaAH9Jk8iKMFuTfW2jmHv5mlACdLg=;
        b=arBTzuOsVEBLBxFWwLsuxuN7iA4m1d4DkDjEvFt2mDyJ0xDsFxNuH56JttgWqA1zF9
         a7pEHboI6Hh9MUqNi2XK43BuZZDURoIg5sGXyDtmRkJ9mDXa0F1Jy0NElQ5B7JHISfeU
         DncZjcn4iGVmlvihP5LR2Q7sbnm2cPt7JnBRTTOySaS6vbRpgtI7+7udj//XMRYXB81N
         TbI7RCGqTxEWFWTfge5BGVB2gMLcGs0j7taFLACWz9LS/hOCyjN9XHzVErBDTvswyfKF
         po2BDUQBB7zijZkeJMhTDdCC5sNIobE/qM7WQTgvrkOeIGKqAcF4nFYsPVE+kS1B8fgv
         oM8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CgkLaFa0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a0f0300b0077430a3a734si7560614qkl.786.2023.10.10.07.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 07:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CgkLaFa0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqDfW-0001ut-T4; Tue, 10 Oct 2023 10:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qqDfU-0001rG-Ev
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 10:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qqDfS-0008Ta-SD
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 10:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696947902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M1ohce11WkNNe0cgAMwi8ts3gYAezYJYisUUMXuKoVk=;
 b=CgkLaFa03+4DpM6yTv8k4Hs0d6VRDgGrYZk1ivKyf9tRzbOwWNUTV2DlJRwxQv9USL4Jhu
 f8ALNOh8UTrQcPTT/St6/InTSBMcNqCoI5HK0D5oIzVVi8zSQb3Ux8PasvzaLUFbr8eToe
 j9MqM8qhaRZOij4BiQOz3QuQnuf66Rk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-89qBaz_dOnaFnIUeUFJLoQ-1; Tue, 10 Oct 2023 10:24:58 -0400
X-MC-Unique: 89qBaz_dOnaFnIUeUFJLoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B9C1875056;
 Tue, 10 Oct 2023 14:24:57 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-239.str.redhat.com
 [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BD3921CAC6B;
 Tue, 10 Oct 2023 14:24:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 0/3] arm/kvm: use kvm_{get,set}_one_reg
Date: Tue, 10 Oct 2023 16:24:50 +0200
Message-ID: <20231010142453.224369-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k1y/E6wUmMnP

I sent this cleanup first... in mid-July (ugh). But better late than never, I guess.

From v1:
- fix buglets (thanks Gavin)
- add patch 3 on top

The kvm_{get,set}_one_reg functions have been around for a very long
time, and using them instead of open-coding the ioctl invocations
saves lines of code, and gives us a tracepoint as well. They cannot
be used by invocations of the ioctl not acting on a CPUState, but
that still leaves a lot of conversions in the target/arm code.

target/mips and target/ppc also have some potential for conversions,
but as I cannot test either (and they are both in 'Odd fixes' anyway),
I left them alone.

Survives some testing on a Mt. Snow.

Cornelia Huck (3):
  arm/kvm: convert to kvm_set_one_reg
  arm/kvm: convert to kvm_get_one_reg
  arm/kvm: convert to read_sys_reg64

 target/arm/kvm.c   |  28 +++-------
 target/arm/kvm64.c | 129 ++++++++++++---------------------------------
 2 files changed, 40 insertions(+), 117 deletions(-)

-- 
2.41.0

