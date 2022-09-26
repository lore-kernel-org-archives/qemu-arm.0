Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2181241ocs;
        Mon, 26 Sep 2022 06:43:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7v+Vl6mM/lDJwzwISPhKQa9bqB7iSklMSl/8YkRXKw3WahdD7exDWSsrtJR9D4PYUzJqBc
X-Received: by 2002:a05:620a:24d6:b0:6cd:f2d9:4a59 with SMTP id m22-20020a05620a24d600b006cdf2d94a59mr14404646qkn.457.1664199813806;
        Mon, 26 Sep 2022 06:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664199813; cv=none;
        d=google.com; s=arc-20160816;
        b=f+4KUEDKC23eO/EQ1PP3QlEBw8GCIjGFfqfaOSntjy2ti1/KnojfJHkD2N/QZr/oJ7
         240+mOxWTffKcVTBowjRWOyRtyc630ocITmFi9JfHc6l8ZZLkhDkcDx6mQvg313wFZDX
         OtKOh26hnktVnNUjNOdp7NbFqnTvz6z8LqKT8GDYgP96+NSRR5w19TialNPkCNrgb8KC
         OwaOc7aogWKo3zjcgF6uDx2XIvoyYQ4+XOxl4xiThipBV0eVOYbzc9F8FY0GWSVK9ZDG
         jRsNT3iD6/KKda6n4YHZFs591mB6etxkKJVkPUwzLYUsM5jGYR2zOh0pyW3FnZrsm+fG
         PxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=32Qjyb7u8FfjYe0CuySFLQoFDnmi7EIBx8CauNR3+IQ=;
        b=pXWoLD8ZQDtHHPnjzqCAvSmNmYpp4KJlauE5EMr4M0bdy/ucAHtMBs74n+4cMQHWRx
         rzGgGLveCXk/6pavYHKcBqF3blTK3lVuSYuj8ekjn9zbjyfas6eqn0dwrgM38/NO2Nlz
         gtC5YqLO3o4tgOtNsgNrMgakSddug0seTTGng/tE/JZxHzQHzW4rzWepgZ/sZ+02/5Qh
         cA/fn8vTKXGVbsErlueanUe7rH8lviyKaFsoX5dLpIBwqSRYy2S7SNTy+DsVCqLxVcdr
         300zPBrCdLPPtJ17YNWXdeVmvGNUIQcvy9TBSbwCKAT9sTuf0357lDgATdQVE8qI+mRl
         +Wpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFc0hMZ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga26-20020a05622a591a00b0031eb7cc634bsi8787575qtb.779.2022.09.26.06.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 06:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFc0hMZ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocoOT-0007jH-Da
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 09:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoI2-0007Ro-Vt
 for qemu-arm@nongnu.org; Mon, 26 Sep 2022 09:36:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoHx-0005HO-Ag
 for qemu-arm@nongnu.org; Mon, 26 Sep 2022 09:36:53 -0400
Received: by mail-wm1-x331.google.com with SMTP id l8so4521392wmi.2
 for <qemu-arm@nongnu.org>; Mon, 26 Sep 2022 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=32Qjyb7u8FfjYe0CuySFLQoFDnmi7EIBx8CauNR3+IQ=;
 b=MFc0hMZ5VBGWRTwknGOwpuzKeR3pmdTsEoGaU5R9iz7v2ZaRGogWZp3knqcvDUV8d2
 TYI0V1O9UuDYbsXli38qNubRy8m8wu15pcDRr5gnhV8RKpfKjP53RCFG54zyFD7jWi/5
 b0wySMl8YFWuZzIj040vab61fYk08BgflF8ZIOGoy+R0kTjmIlXZClNQ4JkiT6Ws5mhp
 L3V7gSg1tmMbiz4ugZe2JSuvGcVdeIZ/wCeUuYSbgseFz+qHxacZvCx1aaVMdoMWgm8l
 O3LKLHiCMk64ZeY/bJIExZMpVLDErfq2s2wb6A5A3UC1Du1qtsKpvOUQx2VI0TsVDTaE
 wh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=32Qjyb7u8FfjYe0CuySFLQoFDnmi7EIBx8CauNR3+IQ=;
 b=S5qfUtlWUjhfvlUTqLdfLHfHT/eN4ARdI/uUeBu/ZXigapB4kdOXhu7G004AxPqKQI
 +ayQeJ5UcP3Xz9G904nhRXtiaHDxZ8O4d2+5zZJe3GulLDaNPyqiFnLKkbxXehCg+bFG
 LrB1kMf264nEkpJ5volvF50EuOd+OzrHFrwf3iBhxPuFhupu5CZdxyH/oYS9n+NNpPGW
 +jgIgcjL292mR/1CByMs4tKAJNUpvgZJkvARC566it0v83CIHWAEDjLMafnPftv05wjE
 uW4iGTl5fhU1BjAWkmzHtrzJpwc1SeYfje2S/vDX0oWd56pASQDO2hgtsURwZ9Jlj9hy
 umWQ==
X-Gm-Message-State: ACrzQf3hPd1VvIkmmESSA6Uq6j7VLoNH44vjVqbuyndyeUsf3y/lihne
 R7gqkWWAePG1+diVYU0Rbp8butlZSlU86Q==
X-Received: by 2002:a05:600c:1d2a:b0:3b4:6e31:92da with SMTP id
 l42-20020a05600c1d2a00b003b46e3192damr21315738wms.103.1664199407021; 
 Mon, 26 Sep 2022 06:36:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d40cf000000b00228fa832b7asm14206102wrq.52.2022.09.26.06.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:36:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Date: Mon, 26 Sep 2022 14:36:44 +0100
Message-Id: <20220926133644.1345269-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qpc3HPHy38m6

Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
there is no pending signal to be taken. In commit 94ccff13382055
we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
generic KVM code. Adopt the same approach for the use of the
ioctl in the Arm-specific KVM code (where we use it to create a
scratch VM for probing for various things).

For more information, see the mailing list thread:
https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/

Reported-by: Vitaly Chikunov <vt@altlinux.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The view in the thread seems to be that this is a kernel bug (because
in QEMU's case there shouldn't be a signal to be delivered at this
point because of our signal handling strategy); so I've adopted the
same "just retry-on-EINTR for this specific ioctl" approach that
commit 94ccff13 did, rather than, for instance, something wider like
"make kvm_ioctl() and friends always retry on EINTR".
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d29..2982d216176 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    do {
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    } while (vmfd == -EINTR);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.25.1

