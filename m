Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp945431njc;
        Thu, 20 Mar 2025 06:33:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU7kreLi7jOIwMFI+8xRxFnpSXBdp9CZlQ0mqCnCZ2/5rm/HhWZkFC3+Zc4hLKLxiyohe5wF+N65yzjw==@linaro.org
X-Google-Smtp-Source: AGHT+IGRRLRypixbw4O8QaC24WzPYc12dbSHmCF78Ia8rpJ1a4yutGlH7KdH87gjLZzEP3FvE8J1
X-Received: by 2002:a05:6214:f0c:b0:6e4:5317:64a0 with SMTP id 6a1803df08f44-6eb34997bc4mr49676476d6.13.1742477601920;
        Thu, 20 Mar 2025 06:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742477601; cv=none;
        d=google.com; s=arc-20240605;
        b=MTgJ1d8rquzaQC4l+kayxTv5zIZ8yegHYQcQy/Y9+N5DvrQsWP78ID22kLfQVZ098C
         TdzmajchfdlmFB0NYMXNic7dYkcyPh6llJrIWW12roecI+EEc9SRs+olmjxYEftwu/Fy
         9Gfjaq4Aq7pp5UNB4vOF1QWloj0QsRVBGp7UeUmpbou1Bnbuf/pnBkvlNwuXMZ6+ic9z
         oa5vfvP8CFWS3wqz9pK4uVkizp5znUQr+NEOImgYaeD00K/pR3aZs8r1GpvC4hXJ7qkf
         dtDPZYP1XjcKEq/PPf/8KpT3I+A/LwPbvu1hCeALZnQchc3wvgrgih4n/F3co41oGHA0
         LZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KBdmphdV8HlBXhupNUNKIMGYjH2p/y/FMhqozqFd7Iw=;
        fh=WcfKwoFZk4xBvC2/T9m5nWzKtzaw5tRStOiKv2M5KZk=;
        b=HHMguOcf5gNoxAyFHpFyjdmpO8QEUN+NmgJfIcPBUPuUfu6coRjeud4Ng1TnfT2m7F
         3NICwvtASGYt5sc7EVBT4h0nZw2jgu/MCvGOQ6Cs3grb0mY6Mx/VnqpIjf6c1PONxLo7
         +0+bj7/2hQ/YFvgWjdbu2BFU3aA+5rNraYOSboltqC642o2njU67yP7ERz371Ye46oll
         a7soCEn4XZeDS1ZJZKFEghJjXFZ4L6qEazbVR2S+iqsRIGLbbpiMymvxKc+fVuXMNdzY
         Kx+Qrv8Uf73Ivq5GPFj+l+e1h9TP6GCBidQHohskxumK7ZVaO5CCtMAbe5ortvOHDLDt
         vrGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5mYhvYG;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade35509fsi157728546d6.301.2025.03.20.06.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 06:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5mYhvYG;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tvG1H-0001HM-8M; Thu, 20 Mar 2025 09:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG15-0001An-JW
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 09:32:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG12-0003RC-1G
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 09:32:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso4276145e9.0
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742477574; x=1743082374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBdmphdV8HlBXhupNUNKIMGYjH2p/y/FMhqozqFd7Iw=;
 b=m5mYhvYGjhjkUwzSf+0O7yUYdc+MKm2VL1LokWXPQUMDu48C5Cfzcy25YWE4wspv7i
 5DDCPoSs+rQKtbnYjF2Ttqmk/wtmYlFF3FZ4Sq75Q3vA6MWNS+QYb7adqAC28fcaaMXA
 52SZmPzAYOVcsIlCvfDaoHCgADPI0ajzhksExH2NGiqyd9vPQjMkSmlvI2m7oWbtLwTC
 OPrlF/qc7WJar4YdlQwykOxTFxu4iUAC/wm6Wzq95CBqC+yG6hhvELVxUS5OIMEAbM97
 YecTps5hr1veGTrKXYDr+AGzlYqWp5ImwO5tl1NnOTVfU+I6ytVeOu2QHq8v+s5GloKz
 zeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742477574; x=1743082374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBdmphdV8HlBXhupNUNKIMGYjH2p/y/FMhqozqFd7Iw=;
 b=LgaSb36ot0pBov85fze8b9NRIbL7pg83FKwJrnlIwgmYY4xkycbiEQpeiTKydkY8Kc
 NkXcDh/iN+0oF5EOFdVyZpUr2TXPcBcxFaUN/NdessWXYiVDMeANEBi+ZnjBR/cgtNnW
 fNB1zFrXT5o2uJcn5Fvm055/3/PqVh4ylwaoUoTzySPc1fhgx/Smf9NtxsHPZ0zblc/e
 bmF9hOCO/fFB+6lZR7E5D4ZFG02ugEBKECUquzMYJlvlD7dEbihiRnsKxpXxnkE6adKU
 kG495R7ZasDOhJdDgB2oOxfIt/cHNMVAsJguCN1PyfJBEW653rvPurtmvB717PQABZC/
 t+6Q==
X-Gm-Message-State: AOJu0YxoBehmRLrUzj/+lZrXwi2NuVby42i9jgTrxldUdXnJwcZMNuIL
 c1w2h3Kw1cWAyQwP6JbVaV9bLSxvQOou1Qkr05zDwk/6A8UAG7vIFjwwdFMnXyoDGWEtJAyTrn2
 X
X-Gm-Gg: ASbGncsLNDoHfUC9C1QkKj8oubHf/H6Fr2QemQszexWKf5tqXz+xhliqVZ6u+1ofwFH
 y0wTKmKVMfiiWwNpG9DsMyYxt9SkJqAU8VbbU7rbjnn4opFAJRMl0wZVIdAFM2t/3jfyLYdZ9TN
 yiMrhDhMtVRY17pO+HMqG4WZIcFNC7VAvJxTakzy8A59ADPk3qsnOk4bAitPyRG9+GAHjGxgeBe
 Q+R8ATtyOrA0xlPYG6I/tTslXslDT1Z0Ai/UH6sgBJKrK28nLHjPaTyPcDqNvtCGZe1LOAd3ZQN
 IsrADHUbMPI4tEV49fdeDiOAIXRrVDrxZI33bcqj2OTiJ2lXCqH305eb5hfVPg==
X-Received: by 2002:a05:600c:19d2:b0:43c:f050:fee8 with SMTP id
 5b1f17b1804b1-43d437e1703mr55734325e9.20.1742477573862; 
 Thu, 20 Mar 2025 06:32:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm48804525e9.32.2025.03.20.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 06:32:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] hw/char/pl011: Pad PL011State struct to same size as Rust
 impl
Date: Thu, 20 Mar 2025 13:32:47 +0000
Message-ID: <20250320133248.1679485-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320133248.1679485-1-peter.maydell@linaro.org>
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hlULFlu7Qeeg

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

