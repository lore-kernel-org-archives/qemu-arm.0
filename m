Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BD606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TR/u8eBE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMni9-0002GG-BS; Fri, 30 Oct 2026 10:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1xMni7-0002FW-EH
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1xMni6-0004oD-0o
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793370961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TA5L0xlBbRNOB7eOpi05i/WjXaD2fX7brvXnm9Ha7BM=;
 b=TR/u8eBEK63c4mwXYN8tlWsuzcubbcD+1aErQLIfllPujlXM9svq17wklSXHUij90M4ots
 ncy+99PvdSy6mq8DEgYKguGBQZV8lWG7+KX8Q9nAvmIknxe7ysnWtKXjqyvU6NVqsgpT2+
 h3+On+/y6o4d0jvzwW4gnreWxEWVe3g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-4Cf_N7dINmG4CWbNMD5XgQ-1; Fri, 30 Oct 2026 10:34:45 -0400
X-MC-Unique: 4Cf_N7dINmG4CWbNMD5XgQ-1
X-Mimecast-MFC-AGG-ID: 4Cf_N7dINmG4CWbNMD5XgQ_1793370884
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48c7fe9736eso740330f8f.0
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793370884; x=1793975684;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TA5L0xlBbRNOB7eOpi05i/WjXaD2fX7brvXnm9Ha7BM=;
 b=xrFklbB3YzcLOOZtpEKlFCC5O0kpqg+aQQi443CqmAXPyxIbXg3TayTLqUKEWThaWh
 CvD4FrsLs8u1gZg6V0VypwQyC44KbF4+Ij7TEfGt0uMSKcpHdrTt6u2V3DbEurTU4ToS
 0aRjg3DbUr/fMiP8lNScjUE6kydwcJKh3XJeHRrBo3jykDBX29chZXS+BASSNhsUs6UY
 BLX99qlKNNZ+LdC2271e4ipTZaGCkKWinmQwQ/aYo8sGFdA8U3RCVfPZweLUL1gKtds3
 eerGTsODLM/gfSfzD3KRM3FnFJJWjLW97kpTuOufyHgydBpQ940/3WtOtyXD3FR0HKF3
 LB9w==
X-Gm-Message-State: AFq9FYJV3Fhg0x5XJ8GUoVHXQDHJYHHfpG3hK9VlifqX8Mpj5aA24TpD
 +5p4jRaMDmJpM4URWDRhwUWzIebYPqziq45qa4KEYyj5brZUfoD0z8ugQ9a8MN44+KWYajFNKlf
 bIjg4thMJvNt1z/WS211tk8anztKhSg+wxNbdQAkIvSJ+0Wafq3zAzg==
X-Gm-Gg: AYBFou05oECLitft3NHW3lDv7wbsT+IiP1ICpj/+tDY6dutemI+4/myVDnjwVsSCMBx
 kX0/xnlKUpOqykW7C390drVo01a7uCB3b+nKiOUQWrzhpuLDhuOD9UavxAVWQKGzYXu/lgoEJig
 AQb/cJWEyOARfiCArWP6NvXk8/uv7T0BZ+tbnEv9gJMqP3sw4pWraO3xp2ji3goZ+lpw3YlSfa6
 Gt6MB5jiZDMphZMSpWxd3KlNPlAJUWoONUAvZyQUlmPAPP3nvPnk53GfrOjSbxgYrzJ4FGvhsm8
 4BRnLXN1ULElM6LvXxjN0QPbqp1sJa2NG+u06Kvoe5u4h61r74NLx3CmUYuQAgeC+k4Fv7lgT31
 mqNs7IzUJbCkYYbDoJew2AfqbiaapT+94WJo3WX8BPafMzt23TM9esMKmWZN1Uu4yy8BaRIpPmF
 4JTi+R5S6Y67p8bQYIXmOKK0jLFp4sCsVOgriMwDbYp/PKobUu
X-Received: by 2002:a05:6000:250a:b0:48e:c84:5be6 with SMTP id
 ffacd0b85a97d-48e6e303c68mr6067308f8f.14.1793370883950; 
 Fri, 30 Oct 2026 07:34:43 -0700 (PDT)
X-Received: by 2002:a05:6000:250a:b0:48e:c84:5be6 with SMTP id
 ffacd0b85a97d-48e6e303c68mr6067267f8f.14.1793370883571; 
 Fri, 30 Oct 2026 07:34:43 -0700 (PDT)
Received: from seott-rh.redhat.corp
 (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71bae25dsm3102924f8f.59.2026.10.30.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:34:43 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 1/2] target/arm/cpu64: fix typos in
 kvm_arm_set_cpreg_mig_tolerances()
Date: Fri, 30 Oct 2026 15:34:31 +0100
Message-ID: <20261030143435.57230-2-sebott@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030143435.57230-1-sebott@redhat.com>
References: <20261030143435.57230-1-sebott@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlBDHC1Bpo269-q-_S0OtBGyIubirVp45_h1Rorinhk_1793370884
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix a couple of typos and a #xa0 space.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/cpu64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dcd0d698b3..96aeb6c7a0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -771,15 +771,15 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
      */
 
     /*
-     * TCR_EL1 was erroneously unconditionnally exposed before linux v6.13.
+     * TCR_EL1 was erroneously unconditionally exposed before linux v6.13.
      * See commit 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace
      * when disabled for guests")
      */
     arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 2, 0, 3),
                                      0, 0, ToleranceNotOnBothEnds);
     /*
-     * PIRE0_EL1 and PIR_EL1 were erroneously unconditionnally exposed
-     * before linux v6.13. See commit a68cddbe47ef ("KVM: arm64: Hide
+     * PIRE0_EL1 and PIR_EL1 were erroneously unconditionally exposed
+     * before linux v6.13. See commit a68cddbe47ef ("KVM: arm64: Hide
      * S1PIE registers from userspace when disabled for guests")
      */
     arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 2),
-- 
2.56.0


