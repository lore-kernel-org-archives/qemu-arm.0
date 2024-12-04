Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp488545njb;
        Wed, 4 Dec 2024 12:26:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6Y98IMxAXG5AOyRkfGt6BZ+wXDeKj8r8sZFfIjRedmMLhpGusn7rdizo2fgtgtH8XFf4w6cb/UiKHrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHORQmbm1HyLZvkwK04HdRG5t+bLn3oKEVVLlvKl46XnMAYdQYPp/+RgpqMZHqt34DH1kHv
X-Received: by 2002:a05:6214:d4b:b0:6d8:821d:736e with SMTP id 6a1803df08f44-6d8b73b71ddmr130078436d6.36.1733343994875;
        Wed, 04 Dec 2024 12:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733343994; cv=none;
        d=google.com; s=arc-20240605;
        b=FGXxvXQ6HXCMZh8u70II3Lu4uu27zpj9OToIoq0wPxm8b55Lpivt8Sn8PEYO0rLV1G
         tRo7P9PpkCqQwiy/BeJNf7x2jBETtf7JEBoZ2q2XUX3qBFno8FTwwRc4dmvwrRaJ6L9t
         xzRijSk+EG8lVRIbbnTTtpvx5haWLg0sU1QgX/fS90MJkX398fu58IW75EL2A4EwtDGn
         T7Mpf0T0tjxmKaAAgwKhYaFxKsB3J/VhUj8se+PbE5WE9GNwUNKpuhNImsY3fhNlvxyL
         fN8ncG4xvgmNHnvPP/esvF/tIIuRsA/VTFKh1vvIAWUrCSgN5yqsd811N6Q+4kAq+SVG
         YtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DPV/ubcrZI2iapAPKTXZkCgfGpvNQPE7G4ysbpy5Jw0=;
        fh=wwkSHBikWmluHJ75hUbEToFP6W+4b2W/5FLXZYodBJ4=;
        b=gkFSaMSZEwbeHFDQYZOA9KPNdWkONlQyobR1JZm4G9bVxSPnaje0GMH8tS/UW72o1y
         H9sqckfRjsmJsFHYylSvlZraL3l+7uUQiayzyQou82/Lf4tbMaY+F354+ujFlrX/mPe8
         C2B1fwR6LWTeYI6mA3wxxN1TuBytAzX+hh5PPaTmyDYFriNWy1oz2up3jWhayw1G6Uf/
         +sTtAddIZg2dNhMr0wGLH3tnqfMlq0VMww+TaNOJyL5GZyCmgA+2o2DpwJT4kz9pkfW6
         exJCzJJ8hWjy1fFVQhzjUwxPPkpl9TxstujHYqU1aTr8tk0n8/otAtJ14Fmb3Imtg2wK
         /+CQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRqngvAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d88344e253si172710836d6.242.2024.12.04.12.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRqngvAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvwz-0007SC-WA; Wed, 04 Dec 2024 15:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvwy-0007Rv-Lu
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:20 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvww-00070R-TH
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:20 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4349f160d62so1361405e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343977; x=1733948777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPV/ubcrZI2iapAPKTXZkCgfGpvNQPE7G4ysbpy5Jw0=;
 b=dRqngvANIAybBI4plRQlxbGRt7LPEOiaCux0KvE/ZHgfjadcIpzfr0vJYNoYv20AaK
 /wZvLKovl491nwxERsQyNHincW8MTSAgH1bpoyFqa6Wsch/lUMGFjEZY/aAFsvKYXHVw
 dxCjmzXDOgGfmonYcPcLyjF7ncHNBnCJGTBuwVxkS0/cAHoIYnsVnCH3Ivdd3BPYeD2j
 0Pd83NvnY49xelDwl3I8T8RBjRNUrDChC8wuQ4kYoIZTGQu0fEhduDxDAbgTtzpiS62o
 +2vlgpGt3n6H00hJYR4Z2kWeXqxwbVQryGLCgj6/2K+yxE8pEvlhDscguxfvj52uGaaj
 w2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343977; x=1733948777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPV/ubcrZI2iapAPKTXZkCgfGpvNQPE7G4ysbpy5Jw0=;
 b=RcHxujPXb8BMSb7fkCOe1KD4coRrTf7pNkvjjhjQbH7EsBRmx0PQIUEum+bIeventi
 FZGyBQnIwIUk4r4arfA/DOwGsvRgtni5M9cKRjc7L78HVuc2zb3IVecViWhlB3YtP/19
 SDPo6ujURXPqZDzpwuji3otGPYYPEt3lsFSula1Exxq80qfgSHZGQmfsA1K27DgPpA3Z
 aLjVlO3oDg9d/rQ6b4c90OmHkcR1NA/05H/PmykTbLA8tlvUSxJFZFqerNbSI10RvtcZ
 xLpp4Uaz1ps3mIDzY+F66480ebzu+4KE60zrQmxIybaS9R2Aeyz0E4QNae7dkgLD/q7f
 DEng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb/lpu1AGhhMja0p3tgacCtbFiBGLzpS4fzZMteC7to+qoNlXm2KYQl2kn0j3BeiVJNWrjj789uA==@nongnu.org
X-Gm-Message-State: AOJu0Yzaljp9mgEJgQBLEYuxDdAb6h60XmgOWjHXZUvhK8ij0Bwopo4E
 xBRfNJMZXRl9CvfSieNZmIqUhfIoGz0qty58Gs1CH2aVfTaO1zNgQ1G4b9TFenU=
X-Gm-Gg: ASbGncvdrGM4aoQCNwablJsPhmbsKDR/rrpxcCIGUrjmNrmTq9YymL8x6ku0F3tW/iO
 T2pLHIV5Ku5mtgsrP2nhQ9eWo+R9jPaoZUbsR3SxmTSJIIk6oaYnz7nIQwawZpeCkp3nktSx/96
 uxGOWLrUiypWHPM97iJKtKvDW5lpl+EpcyQT1GGnNy0HL6gzvH+N2OBCbDIW21sv3UJHuh9L+lM
 Azt62k2hwl5ror+Yt0RDmGnDbDffmwT6yUCj/YnHhESW7XDVe8ryFnynj3dXTKLKIX+xTmDTzpi
 uUIFhsdZUETSxE5eo6Fe9Zz9
X-Received: by 2002:a05:6000:698:b0:385:dea3:6059 with SMTP id
 ffacd0b85a97d-385fd429a01mr6525111f8f.49.1733343977503; 
 Wed, 04 Dec 2024 12:26:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385faec0c9dsm6672009f8f.20.2024.12.04.12.26.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/20] hw/core/cpu: Introduce
 CPUClass::datapath_is_big_endian() handler
Date: Wed,  4 Dec 2024 21:25:44 +0100
Message-ID: <20241204202602.58083-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 204MbSCOcCTE

Introduce the CPUClass::datapath_is_big_endian() handler,
which returns whether a vCPU expects data in memory to be
in big endian order or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb3..91c6581f814 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -105,6 +105,8 @@ struct SysemuCPUOps;
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
+ * @datapath_is_big_endian: Callback returning whether the vCPU expects
+ *       memory data in big endian order.
  * @mmu_index: Callback for choosing softmmu mmu index;
  *       may be used internally by memory_rw_debug without TCG.
  * @memory_rw_debug: Callback for GDB memory access.
@@ -151,6 +153,7 @@ struct CPUClass {
     ObjectClass *(*class_by_name)(const char *cpu_model);
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
+    bool (*datapath_is_big_endian)(CPUState *cpu);
     bool (*has_work)(CPUState *cpu);
     int (*mmu_index)(CPUState *cpu, bool ifetch);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
@@ -750,7 +753,7 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
  */
 bool cpu_virtio_is_big_endian(CPUState *cpu);
 
-#endif /* CONFIG_USER_ONLY */
+#endif /* !CONFIG_USER_ONLY */
 
 /**
  * cpu_list_add:
-- 
2.45.2

