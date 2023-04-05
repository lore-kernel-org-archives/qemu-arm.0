Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp479873ejb;
        Wed, 5 Apr 2023 09:05:09 -0700 (PDT)
X-Received: by 2002:a5d:698e:0:b0:2cf:f102:263 with SMTP id g14-20020a5d698e000000b002cff1020263mr4265411wru.60.1680710709795;
        Wed, 05 Apr 2023 09:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710709; cv=none;
        d=google.com; s=arc-20160816;
        b=Jqk/NVZUjRCALp1k0nMedlmKLbDe/xkFxRm/WZqo2xuH3TB/Zq0uBfXhk4LIqHbK3w
         jWwwL0xet8RC5WuqpTMmykj/HeQHlKPO/X/aHpnummXJcRlWBV8hEDsnw05u8uZ0PGZA
         t3ybASh1FkROwFM/Vlbsrpjqv2HggbkIK18BTpp2eTIlHUeRQYnsymhBP1WJwOM9qnM9
         u7wIIWhX70hMrtMSyohIdjZgUTrwK2Z5dl15Dw3qhWCfiWgt8zpYGNEQ20YnIgifHf3I
         009IsSkBp5N61d/KIjMxXawsA4g5IKemZaPRYsNRh48kEYVlWbU/g3jS5pdmjUz856m/
         p+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vR5kvRphrC8o/hHrAZxx+p2NR9QjIUYlt0J+xt0JrLs=;
        b=VeHK398zD/xfQsoE1GzK2TCX1Q9o82z4vPjPcqgrNzL48jH69jcN2Y+8O9xug/08gx
         cb8pSu6WxFcyN7okQykjCSTOxdaNQ3EnTDFh1vW2xFsNTFfDrTjA8dFAgwyRO2EhrBqQ
         6fUChcDBdqi1LdT1xmTWjXDakqQp/+i5dN07xcKgIpCW+j0df5o6TqXSTY2QSZaTXIaV
         B4QDLyTywBuE2UPAaOJ20lxEKD/HQa1aXnZ2FJ/DAeZqTKhakGYtY6+UpaAnsZqZKZKA
         RM3bw8+HUJ1jmZ4XG0qrnV7+4OoagaPtx4Ald3yhAwYn6wh6RmtCs27B+3kUp2nDPSzS
         5JXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kue5crNs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t6-20020a7bc3c6000000b003ee737ac055sor833774wmj.12.2023.04.05.09.05.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kue5crNs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR5kvRphrC8o/hHrAZxx+p2NR9QjIUYlt0J+xt0JrLs=;
        b=Kue5crNsn30pNOYpY9SPsIZwYEzatKWT1JwNyC4Tz7AI+Dm1LFg9LUQzgpf2K6tikc
         mk/JLoWJuJW2YMb/u8tpJRDDD7NE7oEZWhjMD1NIUNYPSkllpMt4dfkpHFl4mXkmb2/c
         TNeHcs9kjwshAlFLaAd4rINe8sxW9leo230jyONFwRebI56QBZwVXxxrhO9P73poHXtK
         Y8QJ/YWtGqiDl6UF/8eCPHY7/WUX9shWQCd5AGt9lFkl2TKo5jGKRk9cKJNCtgCpeGep
         9jtSe7h0htiRpqIt8S8VefTo70S/iyC9ehr9mAsFxriP5352D4IpRYJpO5PNI1YHwluK
         zLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR5kvRphrC8o/hHrAZxx+p2NR9QjIUYlt0J+xt0JrLs=;
        b=lORNvgRoHEFHeIIB3BxCRCTaIehvUIOY55Y+HI8QQg52C1ySOPhvcl6jwU2g6DIFN6
         1NzvdT7SAJRuNONNdn5TS+pfHZ6zjvd7bajrQl9sVNNjKI34OHlqt3yZ8PJID2UwTR2p
         BO996uj21RVTOrVzriMLKs5+4sJ/9DYPXkZM30UAWLEYSDFOpN2m7zYXLGMEwoJWsPno
         Qmc5qz9KA0p1tPkeKe7MpvFRWVlCqtNDYbHpSO4UJ1D512d8WCv0cmThDTtbKbDXh41B
         b5wj5gw9gq5YHNOe9w046L13pF8iz9V9vc4+3IgUmJqbBf3GNINbi4Yrc0c6bEwEeHXc
         MAHA==
X-Gm-Message-State: AAQBX9fkzRuHIOGY5fKviPmoh1KE2cJk7h85A9pgDEBLojAnObWaLowU
	E2UhLlykcOKtW5zyQvSc4ceH0//j
X-Google-Smtp-Source: AKy350ZaWzKW7gNGd6JCeIyd+5HFBIKAziuH2LQaatqde7bMAk2r3xVbM5UGjlxR3ZLELjGpAEwkSQ==
X-Received: by 2002:a7b:c7d4:0:b0:3ed:809b:79ac with SMTP id z20-20020a7bc7d4000000b003ed809b79acmr5056954wmk.19.1680710709383;
        Wed, 05 Apr 2023 09:05:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b003ee2a0d49dbsm2642061wmo.25.2023.04.05.09.05.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Date: Wed,  5 Apr 2023 18:04:46 +0200
Message-Id: <20230405160454.97436-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ekasPfmkC8ky

Avoid when calling kvm_direct_msi_enabled() from
arm_gicv3_its_common.c the next commit:

  Undefined symbols for architecture arm64:
    "_kvm_direct_msi_allowed", referenced from:
        _its_class_name in hw_intc_arm_gicv3_its_common.c.o
  ld: symbol(s) not found for architecture arm64

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/kvm-stub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5d2dd8f351..235dc661bc 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -27,6 +27,7 @@ bool kvm_allowed;
 bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_direct_msi_allowed;
 
 void kvm_flush_coalesced_mmio_buffer(void)
 {
-- 
2.38.1
