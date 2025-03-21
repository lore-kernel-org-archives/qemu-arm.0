Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp235616njc;
        Fri, 21 Mar 2025 04:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3xxgzpw375oSNFgnw79/YSIJURK372T+7XYp5XPCDNg6iWtUqPwMOJLLQl7HF6TBeJdz3KwlOqCfTiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFi6MuZcHhC97E0Si8Lv+rWta5766vJbMjGHafpIT9r6lIcLDXepVh5leBMNYYj9IPAxPrW
X-Received: by 2002:a05:622a:4a19:b0:476:8eae:3366 with SMTP id d75a77b69052e-4771ddd5baemr45534131cf.30.1742556343308;
        Fri, 21 Mar 2025 04:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742556343; cv=none;
        d=google.com; s=arc-20240605;
        b=VqHNaSrA1dGz4Eb9mRLSakhAVIY5tKmxLu2W5tlTrcPvVfXw3Q+QvuHODDZVjgX2E4
         GykpUQ8HF1UWaMHfbIh9XOtfJssht541IsRWdUvXymvePvbCo2eS7WYd1Uk551+g06Rd
         4Bl/e3GU1SaaRPFn+wlEJlmDsKyTftZwe1tGe/Pg13k1gPI/cKFktV6AC8Hgemz7wenB
         eI4Po1IUHIJT8RXKlG0G2bdhcL0jMmrbCcwc2RIboeZG4Ci9K9+wgWeDUNFvseOGQWCE
         +2DF9AHQXtaxxVN8kQFJG5FItrT3Zi/I3+VmR/KFhNxfAu1brtdxgXjCkuXhtWoDIFF8
         g+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DwalI5yLXIYOeimdWTNSfaCvh6YDdb17pOS3Ktb3jnU=;
        fh=NAemCr4H7/+6PKPE7ijuGJKYAK7QJ7bz7TXRqyVlLss=;
        b=CMg/gIObLn8sxwBUUFTKaVHgvBboXIEx90OtJbVzZn7Q0ud7wJGKGPqA3KlayW4c9x
         iwttb+NfuWvRitytMhqb5rdEbBXgtUnkAViwFVLvL/Rv+9eVssk46Dm3B5vgP+bpzETN
         1GFJXOhsUMqALsFGEqnqKATzBO3jnKnFARhu/j7tMGsxTCwGzzRJJj/S2xvmHFtNNd61
         s8NlzDEeOv6LXqveUlqHbij3sE7XmZeRvChi5GEXbCCk7l14VWIgJEzbVKn3cVMiFVno
         mXgLsNZoxWFOrfdFk/f+DrGUPRNSB5umVQS0USMx27b6bUkZk/Egkbjlt9z4eGOhUy2D
         tizw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMXr9FSM;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d63af83si17135981cf.554.2025.03.21.04.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 04:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMXr9FSM;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tvaVO-0003yJ-2z; Fri, 21 Mar 2025 07:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVJ-0003ve-4G
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 07:25:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVF-0004Ob-Iy
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 07:25:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so1599959f8f.3
 for <qemu-rust@nongnu.org>; Fri, 21 Mar 2025 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742556328; x=1743161128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwalI5yLXIYOeimdWTNSfaCvh6YDdb17pOS3Ktb3jnU=;
 b=tMXr9FSMdIAnk+lOHR9mvLUnfSKrhGFfKvNQ5+SYCe2MxHrGhy3PMlWNuzZ99kYmua
 E3bbmZwKIyOrrjjeq+NFsgWEyw+BAC1lEj+MHklzJLQtlB14o6uoTNxOdkavQSt8Dgky
 GXypwXPPS6G1ShqPRbiYmm9FV0EQssYjtOR7fT/AC9DU8jdZMHg1Av7cp0jwi9/H7tXE
 Z/t/3EVgpQF8EUX8DJ/wVewqqcwYYO54ZipouRgAEvxx58xuMiQo8Q7lvzKvhm85yQVs
 s229yjtjFyRDXjCkoCXN/gaXbtd0WqoKFch8yfvqXExY9xM9/Js93kMOszeE45P+LDM1
 IOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742556328; x=1743161128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwalI5yLXIYOeimdWTNSfaCvh6YDdb17pOS3Ktb3jnU=;
 b=a0+t72vZh29YGQRNHL9xHUy4jPEoNRyR5tEtm5HjiuNhBvyxaKYOw7XNyi7M7D5i3O
 pjL04UgoQzUyTaQoBLULROgxzczVgNUpe80rqAezJcP6NyqdgYPXV45sUXr23cdRZ25F
 wjvcv/IZYeXSm+gYPg0xcz7Opxztdw6KvjNehdoEQt6Uxztcx3D5Qr7T9Rtt6GMAyCsN
 YXPGBRQ0HrDPhFRKZ5UPbAShHrmEGE6/llb3r9zeWY4oDangO4zB6UsQ39CvYcxneGU5
 l4o8+Y4Xp7Tt/oXI4X3L11+R52I5hH9f57oG0GIQYtd+N6RGnj3N2k8ks/GbPQJ33VmC
 VP+A==
X-Gm-Message-State: AOJu0YyyhzE8eg0ljqlIZKM/jEKoo02jmRxRxXwgfrMmm6tC23+JAkmZ
 taBLOt2i7N4TSjaeWgkZqAYgxQWaL6gr03vxcJDYdvnyM8s/nR/Rd05Bz7LgJ75SuTDGzZwI7QK
 b
X-Gm-Gg: ASbGnct49Q6L95J15693Q8nnq4gbvkhkDH89BlcMkqx+bRN+QtHwiPiMHtAKNLIEl0C
 gVFDGeurQGkK4GQeOP2X3av+EMMj2PZZWvLs2BV7qLp0yT5IPNUbpBwiVuAnU+H0tvk8sTjCdXU
 ql95hSRhkqfJu8JET11n02APOuDn+Sc5KU2Odllu2YiXxMsk4dOSJrNhywyvdPmUzhMzBNiscM6
 BTzJqsg4LUMuyMzJK4zCLzywZqR5e2OLfjfgVSrn2v2iotUu8BfTDAnr0/X5jlm4r271QdHN3iF
 /SHWse0K0HSac3ABQFimU3F72CqJM06cjuQkKvQKALmiEj91LFHxX0yMXlgqfQ==
X-Received: by 2002:a05:6000:188d:b0:391:3124:f287 with SMTP id
 ffacd0b85a97d-3997f9014a6mr3430455f8f.16.1742556327776; 
 Fri, 21 Mar 2025 04:25:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6767sm2132614f8f.66.2025.03.21.04.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 04:25:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 2/3] hw/char/pl011: Pad PL011State struct to same size as
 Rust impl
Date: Fri, 21 Mar 2025 11:25:22 +0000
Message-ID: <20250321112523.1774131-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321112523.1774131-1-peter.maydell@linaro.org>
References: <20250321112523.1774131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QBnDAJIUhLLv

We have some users of the PL011 struct which embed it directly into
their own state structs. This means that the Rust version of the
device must have a state struct that is the same size or smaller
than the C struct.

In commit 9b642097d6b7 ("rust: pl011: switch to safe chardev operation")
the Rust PL011 state struct changed from having a bindings::CharBackend
to a chardev::CharBackend, which made it grow larger than the C
version. This results in an assertion at startup when QEMU was
built with Rust enabled:

 $ qemu-system-arm -M raspi2b -display none
 ERROR:../../qom/object.c:562:object_initialize_with_type: assertion
 failed: (size >= type->instance_size)

The long-term better approach to this problem would be to move
our C device code patterns away from "embed a struct" and (back)
to "have a pointer to the device", so we can make the C PL011State
struct a private implementation detail rather than exposed to
its users.

For the short term, add a padding field at the end of the C struct
so it's big enough that the Rust state struct can fit.

Fixes: 9b642097d6b7 ("rust: pl011: switch to safe chardev operation")
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 4fcaf3d7d30..299ca9b18bb 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -52,6 +52,11 @@ struct PL011State {
     Clock *clk;
     bool migrate_clk;
     const unsigned char *id;
+    /*
+     * Since some users embed this struct directly, we must
+     * ensure that the C struct is at least as big as the Rust one.
+     */
+    uint8_t padding_for_rust[16];
 };
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
-- 
2.43.0

