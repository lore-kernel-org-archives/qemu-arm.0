Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp489206njb;
        Wed, 4 Dec 2024 12:27:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1WTTegN0DlYXvGeikW8gqAZsvu832ji2yUSTq9aHMbWMqN67EmtE9Jz94n9030V5fCP9Z9og7+5J/bA==@linaro.org
X-Google-Smtp-Source: AGHT+IG31tNc00QL0Kk0mlaL83d05faT3liWUEtUfSMUsnKafvMTYvgboPb7OQDHu9n+K4keAcTW
X-Received: by 2002:a67:fc8e:0:b0:4af:a991:10ed with SMTP id ada2fe7eead31-4afa99154b7mr6030073137.11.1733344066510;
        Wed, 04 Dec 2024 12:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344066; cv=none;
        d=google.com; s=arc-20240605;
        b=WEtpjZu2sOcSoPGF0t0HsuyXvWf0D3GFEdnaq39bglZbNSq94/6RG53kaaUi7EQJeq
         uSJ0snx+Q8wr/+anQD4fs/6TzQNy80BONl+EaLRi5OSEaRHN5NnsR8LSXJTI8+9cUsm2
         StKKEV7tbZkJ2L+0AtHNGtsyGSOeJEoCMuHTwZgpiPXRnmWEpA0jOd17belu4DgCKy65
         97J+mF4goZG8xf3GeAHUMTvqDQ/cSNB23ZCHyDjG7GRpmPVzLd41am5ONArrn1mcmb3U
         K0ollBoTBHL0iK/bHUr7s++M3VCMO4H/qHWJLH2loRXUPHDIgrGBymTGsJw9ulJBKnvE
         weWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WMiVeD+NvW1fa7vIzwk9nB4EqLDwXQxpVEw4CRgejIU=;
        fh=L8jp5KII9BO+EuE1/Uny/8be6w87XhXr9oO98kXieYU=;
        b=PEJcXhqr9eOReI/eTao6ONwxpGzRfXmQ17SoHnRkYEwlpza1WdVYt0KNhC2P3kkPS+
         3OPndgsi/iiLnnE6tfSnpS9n0HrV4NGAeY/oO9LH6aJI3O/3qvuwyx4bWKKq3IYMUw+n
         ZMJT0czaNY/zXkFEiBKk/vMG7xsEIGx9+WIg3+0zjTEwK1eahmcdZMh1p0mCHqbCyEbU
         nn8WjKbRt27wwDGnioz4SHCg221FbVPqXgmZ1Zv5vZKJPp5WJy+obskkleq7Bn1ltArL
         VPHQIq7b0GrhqyxWNim358qseT1gxU67PjQM77jhFQf9ZwXpyx1kl21u0sxXnThrTlpw
         9u0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBpmGZDf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af593a27e7si6224509137.625.2024.12.04.12.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBpmGZDf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIvxH-0007b0-BH; Wed, 04 Dec 2024 15:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxF-0007Ze-5y
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 15:26:37 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxC-00073u-KK
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 15:26:36 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385eaecc213so114942f8f.1
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2024 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343993; x=1733948793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMiVeD+NvW1fa7vIzwk9nB4EqLDwXQxpVEw4CRgejIU=;
 b=YBpmGZDfstLpjl/RN4Vx/k5ltxLmhf7FgupLyh4t7ipmqbUttxjZapBrKzGg+MMJpB
 bmsFzmT0j7kgmhyu951vi14v+vIVhAY5+c0PsBZ8agooqEbJYuaNRm15J8bQXFB40Dv7
 owX3vlwpkcc2arFmlSZNE8b20Ev6aNpH7KeiGC5EPqUsalc49/OKstb/lNoYDEYINAOn
 9nUIGphkw429GfOUwq+mJKLiqfHeiHLh0TGvKNQ2SOjip9zdSps5HWCO18ddVsI+h9yp
 I7YXU3aEenTVbCt81QTHqmslaY8b27oA/Mdufpz+OBRsgWpnQrRNqL/FCmMIhSMYeIpy
 UCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343993; x=1733948793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMiVeD+NvW1fa7vIzwk9nB4EqLDwXQxpVEw4CRgejIU=;
 b=iD3/lvzl4HKiHPq0jqakx+ZJTBMacv/fC3bb6DwfvvGkZYzM9Clu+sfkdK0eibhqMK
 8mt8to3MtqvufMc7MlO6ZTj1v92y39FiqPWHWlzOZn5nF4UjGVFzgafOYKpycvpIUkY8
 6+YyYxsoByBGJ/NPRTh5EGkPnVSqETkh4JSr6I0A4CgECG565DNVrdVEPkKDy9L0VtVf
 f5LKVrbzjhITQJzf2LUjfYscgUhvHoO8gQKieQGmJIsTqCmq3U8R/Ppw0XVlP42wqsz7
 kCBNT/kaYQDLrCHsjY9RH4COpg40SY9DYQj6LzHzRHuJPC+D98JAYnNgWBrW7smHCNa0
 sLgg==
X-Gm-Message-State: AOJu0Yy9bkRhXMI9l5aGPhcDvRjbtkBcu3fhdD9p/eeoy9eMmtX3RmP4
 w8YSAyBLO9zVIvK8dySBMDghtlLuZiyW1OhuiETpEBFs9N/hDOr5cXwQCK81khSCMtiKFJOF/RO
 J
X-Gm-Gg: ASbGncuWG4e0/EvZRqqqjdioN6Gzcjng3YNi5BkhmKlaIVMrLtArs39OWz4OHc2J7Lk
 eaQ9fBgx0u2R+nOXjVjGg8v6AvfRXHH95Vpb9VfuPa4PyFHMwT1xVL8x2ig0IvWUB+TnB6hyabf
 NR764LzwOXEvvyekv2VW2sIXt5yavvNz3qxdt3K3CCfVXxeFbsvoA8z8bA3CEWoxRKVbo5KR5P8
 HBKk0fuUkCFORmvCKu/ThK2f7TyQg2sk8H0AbOwTP7RRbgVZPf11oLPSuyhzGdNCOEVeaxKUvHe
 e7Rp6YhqVxXTUESFnx9Z+TKw
X-Received: by 2002:a05:6000:2cc:b0:385:e8e7:d09a with SMTP id
 ffacd0b85a97d-3861bb5a42bmr666212f8f.2.1733343992917; 
 Wed, 04 Dec 2024 12:26:32 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f10a12dbsm10075187f8f.105.2024.12.04.12.26.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:32 -0800 (PST)
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
Subject: [PATCH 05/20] target/rx: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:47 +0100
Message-ID: <20241204202602.58083-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: JtKgQJO9SRaf

While on RX the endianness can be set at RESET, we
do not implement that; only little endianness is used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 65a74ce720f..391f3214168 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -27,6 +27,15 @@
 #include "fpu/softfloat.h"
 #include "tcg/debug-assert.h"
 
+static bool rx_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    /*
+     * Endianness is sampled via a pin at reset,
+     * but we don't implement that yet.
+     */
+    return false;
+}
+
 static void rx_cpu_set_pc(CPUState *cs, vaddr value)
 {
     RXCPU *cpu = RX_CPU(cs);
@@ -217,6 +226,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                        &rcc->parent_phases);
 
     cc->class_by_name = rx_cpu_class_by_name;
+    cc->datapath_is_big_endian = rx_cpu_datapath_is_big_endian;
     cc->has_work = rx_cpu_has_work;
     cc->mmu_index = riscv_cpu_mmu_index;
     cc->dump_state = rx_cpu_dump_state;
-- 
2.45.2

