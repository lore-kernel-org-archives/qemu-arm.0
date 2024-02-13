Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp379118ejb;
        Tue, 13 Feb 2024 00:13:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUv9SWpquwzVyX9XCvEomFa1AGXWnUYcZbvpXpzZurJAUeWASx3wgCB8NYh5yhkRfc0R8aAuDLzA35Bm5UAgawRYrCENFUY
X-Google-Smtp-Source: AGHT+IEsgD7SvoMYhxxiPcT2rAxrPMAl8RY/qQxrPK0yEQMCpGyTUz05HH1n1O0wnRIAzjOWAhJi
X-Received: by 2002:a81:a54b:0:b0:5ff:4895:8c0b with SMTP id v11-20020a81a54b000000b005ff48958c0bmr9330691ywg.40.1707812033430;
        Tue, 13 Feb 2024 00:13:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707812033; cv=none;
        d=google.com; s=arc-20160816;
        b=m0xgfx6Fq6Ohi1fpS8DcPf2A5+LbKps5E2o797dSGnjkgOO1qnTeMgockZ7IIgEjh/
         qbiaXdzMrvoimvanUFRjdxjHgIk3+d1Y1jyb7N9j/5Cph+IC/JoNyzcw9xFLFIK1st2+
         ExYGkOjKJdr8KU9H9B5YFZqmzHUY1jOuhh8bMqVGGnD/oX/0/E+Pf0oBsQh+4fdf61NK
         1k4BKvp+PynPlkjU1eF15UHxtdQmSDUmapt4V0Mh0gT+1h/kHNE5KvZNa0ZlIK0SU69q
         u0U/kC8galNck57nH6mg6ARLhqnYEMiEO2g49/FlgRkVAy8Cho/p7avJLnOuPCWCw+ZY
         tIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QDigo3VaEMu1N9qxZDm571UBwWnNIeVpjt1aUzhYjcA=;
        fh=zcI1EVhKBplhN03HBkb1w/+WTijbgJSIaC7eFy4KNsE=;
        b=BZUNYISLPUxyTxLNFGkIqWYr/73JE/UbBeGOa+FlnJSL5GnT/SVFVVnyItSNXsJTds
         GSAY8mpCh8raOAlKdJQStBfLzHQGlr8KXk0FlS8EVgrpMmMFuLqpV8GQT5ESbY6VHzkx
         tKd0P5mqTuT9w77d1aSkYwytf58x5tS+BBUFNcwJDRdSVkONCBAyy3ensOtb1DXU16dF
         oqizhFlpUOptI1IBcWVWBrCpkS9R1XYSxwrhWpkUIqJWo1wTP+5EvPsukAo9tDjm6jQd
         Lo851VBMvIpB5URb9zy9cFUXPpBMhmrJyK6Rx18JxIPNlChNrLbzfLvTkOWiPC04WN3A
         +akg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0FN62pC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUVNWUN3lgZSQaWJPrMbeQYzYOkNU52Kd7kZwO4R84iBZP7jbp0OXmWTxxDR8KBktGefTYRmD+PAWBFTSIp49fKNw9HD4gF
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u35-20020a05622a19a300b0042c797e1bcfsi2473421qtc.393.2024.02.13.00.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 00:13:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0FN62pC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZnuY-0000to-Sc; Tue, 13 Feb 2024 03:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnuW-0000sz-Vq
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:13:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnuH-0000te-03
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:13:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41102f140b4so4115125e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707811963; x=1708416763; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDigo3VaEMu1N9qxZDm571UBwWnNIeVpjt1aUzhYjcA=;
 b=r0FN62pCs1kidnhu/2RxxfY2K2doocDlkAMfqzL8V9JEeT6/fdGgiSu2En2lzxoL5/
 vxyimfZr3v0obT9cguTdr8YXNRyu+ElbQ86Hjy36gnHJiVN1w3mwdlSQ/479D5nbyKlD
 Wa3zOTeLaN8V/0pE7NnUYWSvcKkPydIjYK3cgX0R+w4mGnpb409jqdKP+EtmZutntKCo
 iaZKHuUNE5/M8CWKX185oSBrPq9cLVPB48NFtcMX/LZf+BZC+T97BEPlWp4l9JBhMvr1
 6XNKiC+Z+VEk9VnJ4SQ/ATZVOeM+2aHxvnx+7M7TTqlndUDHJ9oNvL7UTA7pDask+jhJ
 /Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707811963; x=1708416763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDigo3VaEMu1N9qxZDm571UBwWnNIeVpjt1aUzhYjcA=;
 b=T5UoJWNd0FKPCcK5bhT+lo0d8pFWbVYI2uUVoYN4kYvmmEheEfzqPeAjxAXvqwzDLH
 oJ5bKAwlDb0oBWXpx8szMgxKJgOkygZoqLtPRi+eZjAfTl3/FXzrpEt1vXoIVBl2tGRA
 +jHhCn9mQPqZ2WlhGJCfuWQFiVDVPXPGlZreUPBxVdnNGO2NQPTp+fbVhEO3XqfX53Vo
 iJ8HlfHwQs9nb6AiVFrJoTWwj1SvH5eH3H6VMPrEMoaRxth/RrDoCUnG3wrOjpbvycyW
 wR6ZilxXCBt5H171Bb8Y7eWmVoKiWLJE+s9WSOAN0Vm3zVo1y+klGu0W8NFQS6zJQeZl
 3pJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP/LrU/IwztsgJ+hIXuCCnJuRl0v8jQlopEdRNa4UQ+n5F7eQZEiIPyYTJMYEGWa1SiU5ridVqB+MqruE73/3aLhWT
X-Gm-Message-State: AOJu0YynwmRfo1hNVRi6MYuNNaQPCd9sPMSGVFoBvADSW3CfCIPF5B13
 xXlQpZWGdnK5pu7n+x55CVskvA/hvC9VEFVokkgmmQC8W5iH+QPvJkjlI4t5FHc=
X-Received: by 2002:a5d:6c6d:0:b0:33c:d88b:bc5a with SMTP id
 r13-20020a5d6c6d000000b0033cd88bbc5amr799050wrz.34.1707811963439; 
 Tue, 13 Feb 2024 00:12:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXSXrtsPG9g3efdKsqit9qYtcUzRvSrnd+k0Pl5vgN0tuKFia2vMbuvE+J4LMwegiPd0NdW0OPllB4VVSIjuV0AO44GPgDHEsh5FyV914eSHTb6E/sVEKPoxnfg3mXRj+7O2IHheBhHqlWNRW+kogul0gT2lbiXd526KuZP6NG9dD/ZL6ClHZvwAhBFr+3G7BqE7vsOQCYp1gYBmM9gnIyB7Ee8HM+lRcL4tY+8wlySq1fvyNHikhlbFMxn31ACmWSK6zJiz/u0uJoPLuc4xsyb0QmCfvc=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b0033b843786e1sm4085476wrq.51.2024.02.13.00.12.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 00:12:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] hw/ide/ahci: Convert AHCIState::ports to unsigned
Date: Tue, 13 Feb 2024 09:11:57 +0100
Message-ID: <20240213081201.78951-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
References: <20240213081201.78951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: JgRisi95Nnqs

AHCIState::ports should be unsigned. Besides, we never
check it for negative value. It is unlikely it was ever
used with more than INT32_MAX ports, so it is safe to
convert it to unsigned.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/ahci.h | 2 +-
 hw/ide/ahci.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 8cd55b1333..604d3a0994 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -46,7 +46,7 @@ typedef struct AHCIState {
     MemoryRegion idp;       /* Index-Data Pair I/O port space */
     unsigned idp_offset;    /* Offset of index in I/O port space */
     uint32_t idp_index;     /* Current IDP index */
-    int32_t ports;
+    uint32_t ports;
     qemu_irq irq;
     AddressSpace *as;
 } AHCIState;
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index bac1871a31..2c3306dae4 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1819,7 +1819,7 @@ const VMStateDescription vmstate_ahci = {
     .version_id = 1,
     .post_load = ahci_state_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_STRUCT_VARRAY_POINTER_INT32(dev, AHCIState, ports,
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(dev, AHCIState, ports,
                                      vmstate_ahci_device, AHCIDevice),
         VMSTATE_UINT32(control_regs.cap, AHCIState),
         VMSTATE_UINT32(control_regs.ghc, AHCIState),
@@ -1827,7 +1827,7 @@ const VMStateDescription vmstate_ahci = {
         VMSTATE_UINT32(control_regs.impl, AHCIState),
         VMSTATE_UINT32(control_regs.version, AHCIState),
         VMSTATE_UINT32(idp_index, AHCIState),
-        VMSTATE_INT32_EQUAL(ports, AHCIState, NULL),
+        VMSTATE_UINT32_EQUAL(ports, AHCIState, NULL),
         VMSTATE_END_OF_LIST()
     },
 };
-- 
2.41.0

