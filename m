Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2545135ejf;
        Tue, 27 Feb 2024 00:46:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVBGNe60vUXsBbTX3xP0zFdDeKYa/Cl9LPNRcSiGvVK1NDecMOC29/EtdlrwqFp2p4jyolrFQYx5izZ+iZvIkCJIVpyKUvy
X-Google-Smtp-Source: AGHT+IHhdBbnvQxwuvMUllb9IdZAW9DArIQH/EKx8AxCdOuUDdOrxuNJzrCI8SEz54my6dIJ0qOm
X-Received: by 2002:a05:620a:2056:b0:787:c780:a767 with SMTP id d22-20020a05620a205600b00787c780a767mr1214229qka.9.1709023593852;
        Tue, 27 Feb 2024 00:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023593; cv=none;
        d=google.com; s=arc-20160816;
        b=d9LqAZNZ7tNgIK6padc1J7ahKyPJ0tvBJ/2+OHngi3g/0LhfPNa+OI3MOP6vHCj3Mb
         a3p2INvNrOH877U9zPW++jsFsLftG6vuSLAbbqam3wW+LuXbbyvITBruLpUUtf7P6RiU
         cA+Tpp8id6vb81lxOaRfovUualVb4UW2jAOu2m9yrQHJL68n3PYNgh6iBEeDFFkdJCUE
         rs4x9bsS8Pwc2kzxlBVhB0Q15Rkslgz5g3QjdqbDm1JC1wjOB7OAWWcUwCppPEni8YL0
         /7AmYH+hpojkaMLR8QBP5zALfxUi1yCNCnvqEb1j1alMpZiAfIsVXAR7xHrVbZBFLlQA
         LEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9zD/OKW2eI569vD83pviooB+9Gzp5s2IN5noJR3qtG4=;
        fh=YYj+r5QSR9ExMKOCmDatmTp9GBYHGpFU7PC4tMhCJCY=;
        b=PcV+gYe24CXhh1rEt4vXjK+1Av2KTMAwe07vPLu/BxIQK6FmyNxF6+mVOGacKKweh4
         NC+tjk337Yb34VqpF2OZGa84jtFIHRQcsOWVCpwGJbFLcpQGo5Ozc4Lv7g8IMZxg8021
         ruQ86bo3iWXzzBplWuo0jO/MDAdRsYPT4oyeOHVPKwHxmj/C0KfpJalkZg221cULQJyc
         H1vNcIAJ47TELPzNkypMPFNQ0EqJwj6SgZqBZz6T5GY52NN/Qp6qS/mVNtC4Mq7jL6Av
         c7lthWCFT1lpas2xfzU0SHJrCwjAZ97DlR4TP1t2MRr++8ZeWef4UWouawpS0pLBiCmJ
         npVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgV0M77z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wi14-20020a05620a570e00b0078773e3a7c6si6826076qkn.400.2024.02.27.00.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:46:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgV0M77z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret2Y-000339-94; Tue, 27 Feb 2024 03:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2V-0002aO-2r
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:15 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2R-0008KA-Fu
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:14 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5643ae47cd3so5161234a12.3
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023330; x=1709628130; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zD/OKW2eI569vD83pviooB+9Gzp5s2IN5noJR3qtG4=;
 b=AgV0M77zCe75IXST6dLnYlJLJt8+WKT8/UA4JivMuWP0NFz1T+j1Bh27hWmLHZx5M0
 6ohlK84p7VLz8hLg7DlUCuRGbn8mysBOIM4tPIabeu2Syml1aIcUyKvenQZCtiHt8cOM
 Nt8mDefoQI6tGA5lPGlKReiiJWz3WBKuTyjioySLUu6cF1PWUcIeOp1eFtzpocGyvPkD
 IRWrMXvh5thl3dqAyO/rF3T/a9bP0ZhOvUUQ24pTTpDJm66qDLGiMtf/xmvqbBoh3inJ
 h0WU/ikGpiymU7ELoF+plxIE2WFNq3ZeFRfak9qyl0rUt+pr1yQcn4R24ewA69xU3C8m
 Rtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023330; x=1709628130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zD/OKW2eI569vD83pviooB+9Gzp5s2IN5noJR3qtG4=;
 b=NUnr2k+5upO0mwiNXbN2nKeASlYSnil819OUNolHYV5Rncupygu3tD/hXmsST+o/tm
 r3uttpBOjwWkxzIZ3QhtRFAcqmd8EMnhP6295FOPPPBQbksGY89vw2yNDiaqbQ+lo3Bf
 qE7ApggGMGw1nuYPkQFk5NfeIvkyau6R16DmtPoRRhcufoS0T8B0bgoKLZL9rJqWwYAK
 NBQCIz4Osk8wEaN16rFNYie3iEJmEKBraRUHk2p5xjhLERXxf8YCaF+O5AoUrLNNsINj
 9Lu2Naxb0ojLezoF6PB21ieE1k6pkog80RXu6mVoSmp54bExHpaWcuEayecM5vdqfF1k
 m9pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZLPhmGsJ9+UI456/eVoL0yYezegWYspLgD4R8O8SNgspC6zXNzjlhqxY3aorwxJ3B293KlSH0o0DU5dx9SmPWEcZ0
X-Gm-Message-State: AOJu0YwqFv3KcvXr+BBPXyJJmbNd36+2SN9jn2Z9UI1hHMvx8sjUfgNO
 AGu6EWJM4NAQKe3V03NcohcZLrle8xzDmxpoF6/lFkUDvFOdmBwbiIXzTg8PRtA=
X-Received: by 2002:a05:6402:6da:b0:566:aa2:8433 with SMTP id
 n26-20020a05640206da00b005660aa28433mr2734239edy.36.1709023329828; 
 Tue, 27 Feb 2024 00:42:09 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056402040700b00566220e204csm543399edv.15.2024.02.27.00.42.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:42:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 22/30] hw/i386/sgx: Use QDev API
Date: Tue, 27 Feb 2024 09:39:38 +0100
Message-ID: <20240227083948.5427-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aWukljoBPMKo

Prefer the QDev API over the low level QOM one.
No logical change intended.

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240215142035.73331-4-philmd@linaro.org>
---
 hw/i386/sgx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 70305547d4..de76397bcf 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -286,7 +286,6 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     SGXEPCState *sgx_epc = &pcms->sgx_epc;
     X86MachineState *x86ms = X86_MACHINE(pcms);
     SgxEPCList *list = NULL;
-    Object *obj;
 
     memset(sgx_epc, 0, sizeof(SGXEPCState));
     if (!x86ms->sgx_epc_list) {
@@ -300,16 +299,15 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
                                 &sgx_epc->mr);
 
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
-        obj = object_new("sgx-epc");
+        DeviceState *dev = qdev_new(TYPE_SGX_EPC);
 
         /* set the memdev link with memory backend */
-        object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
-                              &error_fatal);
+        object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
+                              list->value->memdev, &error_fatal);
         /* set the numa node property for sgx epc object */
-        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
-                             &error_fatal);
-        object_property_set_bool(obj, "realized", true, &error_fatal);
-        object_unref(obj);
+        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
+                                 list->value->node, &error_fatal);
+        qdev_realize_and_unref(dev, NULL, &error_fatal);
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-- 
2.41.0

