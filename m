Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2867643njb;
        Mon, 9 Dec 2024 12:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcjk/BxzJm8A+CDD/dMpBOW/ljbjOY0pGO9OmK/0uPNoYRjoCfBtm0fRfmTWmBwysAAgJoOQyU8i7iWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFTP15pcHDviYKMxIbpnjBfSJXSiKiUMudQ4OAlFtG2DmbZaS49Ew5rZMf1J3WtE9sib/4i
X-Received: by 2002:ac8:7d8b:0:b0:466:9018:c91f with SMTP id d75a77b69052e-46771e9c238mr30334791cf.1.1733776671889;
        Mon, 09 Dec 2024 12:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776671; cv=none;
        d=google.com; s=arc-20240605;
        b=LT5KTEyugL8iJOu7Bi6MdF3YC8dx0zaUr2emmRMmEQI9iAkbMkRHi5w1Iknvtw22Sg
         B9ZZ0HJkXMQZoWPEAnzF0W1DXk8TTcMdjObA6aDPs1Tn+NjtSEZTdrGj8+jrvjyNbMMO
         Q3On/9ABFNJ8v/yq/vn/muiagn78hguILZuJg54YoC6wtow9OLsawhbhcIoa9Lo0/S7d
         sK+nC3HBG7gYntadhN48oJcLFuIpNirxA5GymqC4A7G+VaUBGRtzX0jf55T5ntcKmhok
         QxahkK9ep9EXaGdeLO+72QyM/0omJwM+clJ8s/8uxCjKLj/exV+rhstY7tArP6E9vNx4
         ccQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xw6Nq/8rslxJnUqkSeXiT5oto8WsRm37mAQv6Zrh7Zo=;
        fh=Zxb6WjtRIiYTNhCn9cY2xlN5Pb/mJGdUeSKCbyCH7Ss=;
        b=NsaY3Xl3J+GfAq7RKzjRbC18B8MqRv+SnXR5LL5aKfQWKZpEQddua35ZziKUu/jL4R
         ZCenddF9f/j4f3eUxFluB42l8j23U5F6kiUqljW1wqfWTAG1KK6TjNsrm1mmq/rHPiHK
         Ciih0f+8LRZCudDUHEoAh91K/VIY4xpnO1+u/r60hhGudvL7eboRF0GV7abr532ZHIk2
         wThjOgr4Sq7UlhGONp2vYFey/Zkm/Md+8rz3Wsz40ilZ6wuDinwlW2GzhJJ6qsSaHRhI
         XrTbl3K7PwneW2D+4FcuRbEKfRl4Sgyg1ESyuqnSJsFsI1Yg+Uc9B188T+Zy1j96PS0c
         9nag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=10BtnBuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4676e7089e9si18208311cf.671.2024.12.09.12.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=10BtnBuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKkVS-0006Js-82; Mon, 09 Dec 2024 15:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkVA-0006FJ-AC
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:08 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV8-0003EV-L2
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:08 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3ea065b79so3073901a12.3
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776625; x=1734381425;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xw6Nq/8rslxJnUqkSeXiT5oto8WsRm37mAQv6Zrh7Zo=;
 b=10BtnBuKV4kcVgE0DHwEefoen9gFWctr/d3uBG9O7EByyHzpVxQzesF7Pg5mFXMOPf
 FEhsP8kG99qJNyTx0aPJpsFSLSKFEcPwkKfOFE2s5nxFcux16gmU0xV3UMjP/Ki8Tca5
 Zu5I/VNbG5F14JZCPGujjnXW3aMSYIG4XVXob9rycbkG9Ec2ivok9bhQLRb/fECDEqxy
 lSXhT8k/uzJzDBzx6euLGnWV92XpdT/40REo/zpwQcgXKvfO3GMl1XvMqC5nA0TVSJQy
 J+Z2+XnGt0iLYiNeemp/qIluX4ArIh1cSqjk4Ia6AbYFyK2Nj62PRG60eeUvYYnHXKoL
 xjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776625; x=1734381425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xw6Nq/8rslxJnUqkSeXiT5oto8WsRm37mAQv6Zrh7Zo=;
 b=o1+rK5Q4W7xAoBhIqEHMKka1Di2VkSIFctus80nLJSAB4VQ4PgD6lq8dwZTqlqMF2a
 AB/X3eGw/A7eU5WO10XiCvHdA1QrA8WGk6SGFv5Z9uzTZzxzah5yBgiXnxDu8ny3NJSu
 FfrSkM49RlbZLkAM7pxe04ncsFnUh682/12jBYOTdpkJ42P5zLBqKYLNMZ8Ucg/L12te
 FC1mnZ4+aEEiUZ+9X7kY2rLIg74M52sEPMr0WKjrlBwVlpFIbujvs9OEo/+3/x+/6mmc
 9EvD//P3jo5PiP0uENJmXtl1qe73siF2FJobc9TAWw7tP4sEo7AXQ3LeP/0KdrnfibQr
 12UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaephXcmRko8KFBh+NfSm7Z9SNhE6mx+VSmMwf+mG+7ZMoBPhVaKsQ1O2KABiNMbQIz6+sUklfdw==@nongnu.org
X-Gm-Message-State: AOJu0YyAAzI/jrk2yrgfDp3IaLq0kbqR1dwyrWogN34rvVbQfAaW+MhJ
 3295FA9xHaGUWPFQR8CJAHcQj7zWPhQSN9Bw0BNU6DWqAH+d+t/6WvI37aYseQ==
X-Gm-Gg: ASbGncuzDLi01RTYfa1mfnIhcjvSxPwBhphX3yqaSwRd7GhdPGf95DLfJw8S5ZS8Gt4
 srBfC08s4JzQMheX+OE5uQiZvpKtiKgW121DS/9oe2RFOtE0TiKVb58v1GC+ewuCIpSX1Kio58M
 BxUpB7wxMFx8/MPe4QCaTojtQ5Xj6/y3I92fwkFYNzReEPgSH0O2XgjAod9E8XKRDpBl73S+wLn
 hfZ8ZBbFCx2g/VGXnLeOYjKPNHil5G+DUQaCNDpdnZO883+VwUPA7PJAz+qt8WZAiMy09B9hKMc
 7neobt/NxBxCvvgPT1TxLjGmecKguA==
X-Received: by 2002:a17:907:1dc4:b0:aa6:6c08:dc71 with SMTP id
 a640c23a62f3a-aa69cd8131emr196188866b.23.1733776624887; 
 Mon, 09 Dec 2024 12:37:04 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:37:04 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 07/11] i386/hvf: Enables APIC_ACCESS VM exits by setting
 APICBASE
Date: Mon,  9 Dec 2024 21:36:25 +0100
Message-Id: <20241209203629.74436-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::52e;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: J5A+asXeoC6y

From: Phil Dennis-Jordan <phil@philjordan.eu>

This change activates virtualised APIC access VM exits so the new
fast-pathed implementation will be taken.

Two parts are required for enabling APIC_ACCESS exits rather than
falling back to "regular" MMIO EPT faults: Hypervisor.framework
needs to know the current APIC base address, and the APIC access
virtualisation ctl, VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES,
must be set in the VMCS. The latter has already been set in QEMU's
HVF accel, but setting the APIC base address has been missing.

This change calls hv_vmx_vcpu_set_apic_address() before a vCPU
runs for the first time, and whenever the APICBASE MSR is modified
and the xAPIC is enabled. Additionally, the APIC access ctl is
toggled when the APIC is enabled or disabled, or changes mode.

In addition to making APIC access VM exits occur at all, it also
makes APIC relocation work, at least on the fast path. (QEMU does
not currently support different address spaces per vCPU, which
is why the purely EPT fault based software APIC - and thus the slow
path - does not properly support relocation.)

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 target/i386/hvf/hvf.c     | 11 +++++++++++
 target/i386/hvf/x86_emu.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 2a13a9e49b..a7b8d124bb 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -341,6 +341,17 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_vcpu_before_first_run(CPUState *cpu)
 {
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    hv_vcpuid_t vcpu = cpu->accel->fd;
+    uint64_t apic_base;
+    hv_return_t apicbase_result;
+
+    if (cpu_is_apic_enabled(x86_cpu->apic_state)
+        && !is_x2apic_mode(x86_cpu->apic_state)) {
+        apic_base = MSR_IA32_APICBASE_BASE & cpu_get_apic_base(x86_cpu->apic_state);
+        apicbase_result = hv_vmx_vcpu_set_apic_address(vcpu, apic_base);
+        assert_hvf_ok(apicbase_result);
+    }
 }
 
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 197fa155a0..88a946cb0f 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -797,10 +797,28 @@ void simulate_wrmsr(CPUX86State *env)
         break;
     case MSR_IA32_APICBASE: {
         int r;
+        hv_return_t res;
 
         r = cpu_set_apic_base(cpu->apic_state, data);
         if (r < 0) {
             raise_exception(env, EXCP0D_GPF, 0);
+        } else {
+            uint64_t pbc = rvmcs(cs->accel->fd, VMCS_SEC_PROC_BASED_CTLS);
+            uint64_t new_pbc;
+            if (cpu_is_apic_enabled(cpu->apic_state)
+                && !is_x2apic_mode(cpu->apic_state)) {
+                res = hv_vmx_vcpu_set_apic_address(cs->accel->fd,
+                                                   data & MSR_IA32_APICBASE_BASE);
+                assert_hvf_ok(res);
+
+                new_pbc = pbc | VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES;
+            } else {
+                new_pbc = pbc & ~VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES;
+            }
+            if (new_pbc != pbc) {
+                wvmcs(cs->accel->fd, VMCS_SEC_PROC_BASED_CTLS,
+                    cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2, new_pbc));
+            }
         }
 
         break;
-- 
2.39.3 (Apple Git-146)

