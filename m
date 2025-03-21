Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp235512njc;
        Fri, 21 Mar 2025 04:25:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULa3zbV6NSisTE6MM49yJejxtdrcc7zuQABdnzF9pLN+q+IeyRqjZeX4eFdYhJSNKiFDok+Lze+cdEYw==@linaro.org
X-Google-Smtp-Source: AGHT+IGTjJ8PnqTBSl9cmf4LPe5HbrzJUS2x/EQEQB9Sz5H2fL5GwMDNKCqOd0/yp9w8N2UmnFng
X-Received: by 2002:a05:622a:1b1c:b0:476:83b5:fa63 with SMTP id d75a77b69052e-4771de5a93amr46294221cf.44.1742556333219;
        Fri, 21 Mar 2025 04:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742556333; cv=none;
        d=google.com; s=arc-20240605;
        b=gnRf3jahnNzgsExapy+VTq98CWg8vAlusa3Jd6LY2JldY+un15Me2C52rHA+hF0rHM
         FaD11buymvjVRJSbOoxa4MLKs8c+1BtnXi1qdi7fVWELquO4k7Fm3i3GrbFk6Wml/JsY
         RJYoxN0JXzEZ1jozGeNO2yoQ+4ewHrlQELRN8M6OhDbgPQynpERAkGaW9sP1rgHSrWo2
         LWmtOohtN4EJNSvfy87pUdUgVYBoBd8x26t6NHvl0j+ssyRmiaUF1mYFmful2UWRoT6H
         I4O35UlhdOExm1L5gvhjb/BE3lkUahkSDbUycqGLqOIIJqESeHeeOvg2NPQCIUg0s7CD
         xaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4jBi2XfHUS12bu8iuavnXsaJxhHBfQaoWbhQNC0jHPQ=;
        fh=NAemCr4H7/+6PKPE7ijuGJKYAK7QJ7bz7TXRqyVlLss=;
        b=N7U5I8KQ1MavCijV8YVnD41FSYHoVBxUr/RQyWNuAlDgj3HLXBuxnqnEOOpkjN6MjJ
         kLWiC8bfTSseQgRhrG4MItvFqnumdxonRvyypE1SmYPtsKDvvvJmD4ZpotSQ4NyI3fCO
         gpb4ORvpqzl4+QSBCOLtyjVPfstYDWEgVAtketUR7JtUkWZxODvUdAucYG84PLfE4epU
         USoRSdMnn/sRJuZPj+hYHJ1uADtS2Ue+CMh99terj4Edmn7fPuqxs4tQsJ53JYroQXqE
         ZLzurNR2XUQnXB9pI6+Clsm3G0TjJqHo7tGh1z0rt86BZVcFY/Us5p6tKjctHGZRAFCT
         1AHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m27iFHDS;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d4fed3bsi17302431cf.206.2025.03.21.04.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 04:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m27iFHDS;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tvaVG-0003uS-KD; Fri, 21 Mar 2025 07:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVF-0003u3-BH
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 07:25:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVD-0004O8-FT
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 07:25:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394a823036so18327255e9.0
 for <qemu-rust@nongnu.org>; Fri, 21 Mar 2025 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742556326; x=1743161126; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4jBi2XfHUS12bu8iuavnXsaJxhHBfQaoWbhQNC0jHPQ=;
 b=m27iFHDSftRvb4HUH3B89chhhRnI8SVvbEg+DqSjKRC684mGL6+XTJ6FeNgq9a3pMd
 Jo+2ATJ/6A5pJdsXqaHaeeNN5mfX2VV0t8JLRgG+tNz5WqX3MBfrIKsUdCiXXHdPhZl8
 5hA9tAFAaQXpzgoWI/xqLBo3DyTHXPARM/orT9P4/yKWGwl7mwBZUfKSQn1Jc9WzBke+
 dYnZj7gt4Zmb8bPR40weMRofreeVbS7M4Od55ab9HQBvQzMwoB6QPnjL0sxzZCzCV6Mf
 o8biueTM9ztUxZzSyPibUUj4qnERJ7yT5hFw8CKziykkxRMVd8VEDXEumyfweVtjMOKz
 86EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742556326; x=1743161126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4jBi2XfHUS12bu8iuavnXsaJxhHBfQaoWbhQNC0jHPQ=;
 b=YqnmljMo5Nez/YcTWb+GVKqBCfvqgA15ilgCk4Xr5Flqx/ZgOVzzETnVT9Bs8pAjPf
 IRbdVbAVLxK+FZ8eNZTPFLLXJLhZg797tgjPWF+VEZHefTK9s7zlk4/ou0u32z/vYpxk
 C0ZwkG4XWbaPjdIUd+In8cWpJI3/KHdIcUQam6ItsRJKpARFSEPXP29gyvEUsfkd2xlu
 +Mz3tLsK2EKVtq67Y7WJmPt2icVSVqgJEVLxIOV95KvKhJPl2IY23qwEJisXNdFOp3CE
 D2J9csrUh83ftSTqwZQuY9XhNJl2iMNghIHcNAX+csGyh/LzVTh+N7+ILbpHyANd4Sgm
 OUDg==
X-Gm-Message-State: AOJu0Ywf405F4uBz1dRSn5aKu50KSZOVcPtmz8qQWnCn5ktTKEV99jMu
 ZcgvoDt+QEFLmYp4vXeDHOmfPPpdLzDfXicg3Q8fN3ql2UaqWhPo3qfzlT0XOII=
X-Gm-Gg: ASbGncuRHtM6piWBHaUD5jKYFB84jTciXnUmLThA5LzQ9WHWK/pnUV4h4mq+qGFPzCz
 l8thjcZVwsOPKTtiwBTmKqT8nq7+8srPQHc0WLSSQFSXq6rhyCGhfxsx6Hbma/fEZmOwd8VK6hT
 oclOkwB9YAU6AbTud5Xllz699uDBpuZrkaMkrRz17t0dGRwGrSbQEr3Q+AFlzXKv1vC3TzPCz+0
 zr4pIiGjlvCxK/Jb0dKQIkuBvGt5PPhm8Qvi0V0IeN63zVr2F9nAsKbX/d9xkF89M3jUNGkuROy
 BwqRUwKLxHZEeh4CvI86kTRy2/AVEXqhgONC7fczHwQlBPJ2Lkc=
X-Received: by 2002:a05:600c:4f55:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-43d568cdf1bmr3559105e9.3.1742556325692; 
 Fri, 21 Mar 2025 04:25:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6767sm2132614f8f.66.2025.03.21.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 04:25:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 0/3] rust: Fix PL011State size mismatch assert
Date: Fri, 21 Mar 2025 11:25:20 +0000
Message-ID: <20250321112523.1774131-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: PX1nRXtTmq0E


Summary: v2 of fixing an assert due to mismatch of the
PL011 state struct size between the Rust and C impls.

Changes v1->v2:
 * in patch 3, adjust 'use' statements to maintain alpha order and to
   prefer 'size_of' and 'qemu_api::bindings::PL011State' over
   'mem::size_of' and 'bindings::PL011State'.

All patches are reviewed.

NOTE: I won't be around to do a v3 of this series next week,
I'm afraid, so if it needs any further tweaks I'd appreciate
if somebody else could pick it up and make those, since this is
a bug we need to fix for 10.0.


More detailed info, same as v1 cover letter, below:

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

This series fixes that by the simple expedient of adding
a padding field to the end of the C struct to ensure that
it's big enough to also fit the Rust version of the device.

It also moves the failure from runtime to compiletime,
by adding a Rust compile-time assert that it hasn't made
the state bigger than the C one, so if we do this again
it should be caught before it gets into git. (We don't
need to do the same thing for the HPET device, because there
the HPETState is a private implementation detail of the C
code, not exposed to its users.)

thanks
-- PMM

Paolo Bonzini (1):
  rust: assertions: add static_assert

Peter Maydell (2):
  hw/char/pl011: Pad PL011State struct to same size as Rust impl
  rust: pl011: Check size of state struct at compile time

 include/hw/char/pl011.h          |  5 +++++
 rust/wrapper.h                   |  1 +
 rust/hw/char/pl011/src/device.rs |  9 ++++++++-
 rust/qemu-api/src/assertions.rs  | 22 ++++++++++++++++++++++
 4 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.43.0

