Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990824eju;
        Fri, 15 Mar 2024 06:11:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWavLphejlUmYF+u20ywwAr4WGkbleFzowoJk1dDBIULtN93ZBBYCGQeymjticgDaZIFSFjXBtCYNWVr8jpozLIcAWVM9C/
X-Google-Smtp-Source: AGHT+IGQADYvolTH+zL/Y6CqVtlepZdbszZlzQz41eDZqdWrX23xfNBmIuulBmIsnbpq4EBu+N3p
X-Received: by 2002:a05:620a:24c8:b0:788:5c5c:c53d with SMTP id m8-20020a05620a24c800b007885c5cc53dmr4512747qkn.62.1710508313519;
        Fri, 15 Mar 2024 06:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508313; cv=none;
        d=google.com; s=arc-20160816;
        b=BtCEGuBQSqUT6aIor1V42vCPPdaEjNDg86pmMFAFpcWDJuX/SkJ2dDLmPKrXnjK0oi
         gF1NsZDsZHBJidtE44HY5MUJ7M/lN6OK4TemGMfUi8wi7QYuViy3BfXr1wGn55uZtJAA
         Fpgp8Z3QnqrCo/WatPd4qm1qO9NwC15rS7VJydMZ4aDfrK/OSvGpSU0NDHF8CRXPpsCq
         BGOSJ2VZ850ValCDLISg4S6u3XZ2Jh5bNsDyHnP2Tzcazf0tgGsfpn5XBF2ilRHE9M23
         0iCxro4XuMQurbGueGnC4yv4gRBc4sk463uX59chSCQ1B2tPR1u6WNgzlzhiMnBBVLw7
         fPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1JsmeTBVN2sRCxleZ76cGscd4q7biWqmkJjrGr36tu0=;
        fh=uGcXrD5210VkmqrQURzS9Txl0eldLxl/g55OxRC+1V0=;
        b=FwTswrcJIxJ2rdDftiXHkNYVrcKH1QTNfPLHdcidecZu7egrDl8cGJ1uH5cLdhe73d
         yg0v/GA/WueQ/2kDSwlK2RDJC4ZuUMYzMSk0lLWJPPtRAjFfLvKo/6nqmYV0WOFzai3n
         bl2D5Zv2bd4xToPr3rmsSHzXvGG/BCA7LnkG5G7ZcEGGMFp7M6fwYLp5Nj3AKEqvvT/h
         xPO/h7SxzJVDjzbyAkyT71O+FnS3Wn1rJUrenh5V1p73KtS2TWQLTl/nMMuEkE3Z1ete
         rM91iE+j/1s6aIxQgZZBZ2BE575g4pVab1OHstpyNg/mPxiVLTUEy1LSs51AmDGB0qQt
         P9tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=J1hHEUgH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq20-20020a05620a611400b0078853f86a99si3634350qkn.83.2024.03.15.06.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=J1hHEUgH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rl7Kw-0008SA-6U; Fri, 15 Mar 2024 09:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7KA-0006Zr-VT
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:10:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Jy-0007r1-7n
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:10:14 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6e6cadfffdbso1802251b3a.3
 for <qemu-devel@nongnu.org>; Fri, 15 Mar 2024 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508199; x=1711112999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JsmeTBVN2sRCxleZ76cGscd4q7biWqmkJjrGr36tu0=;
 b=J1hHEUgHdT/fkd/6o2o5/YBNg1J3S7NXyu6+3JGWWTwCsC7vRCY4g267jKxtcu+Zqe
 sgSIE/B2l20D+uMdwbgLkHP7iZ87BVTvhAPYifF/9MXBrseo/oqYwJKLOksWuHB+PrZb
 bujsDxSyniLtL6aPy873F+pnjmDJTI/5+Mm0FJ4E+3hnevFDk6th9xKZK6nhb2WmQsHR
 HzkW658MH5nDC9iP3tAV3ellrRuf2Zb8bhPqY6uZ2SSwCBIphnSvEjSofdCbkbE3Q8Vj
 P0ROV8t+YK0uviDgTYolCXIEmh+1u68cYqUJewnvycgx6pi+wSYwTVcDEyg24pWrKvua
 tRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508199; x=1711112999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JsmeTBVN2sRCxleZ76cGscd4q7biWqmkJjrGr36tu0=;
 b=E12dSCy73yDx9pI9R5gxFc9ctZnAgQZCte6F/BPi6gPxuOFv2B5JXD/5iKMSP/aeD7
 fXjMGFYgXx0oHr2vibNA8yQf57O7/NJU/GRZ/CVLkPZ35Q7Zmx1DayyvplYQbeL4cQQf
 u9f3Bt8Z8hJg63ZJDbQ9nMrHrexZmJHiF6xgyQWVX09Gy+44zAk3e/HeFw7f9aWeGpdq
 oA4qTnkzYkMVdAmOCFNufOnvKIyPnH3eTfA2EAB/2xrxRTftQ83y2YVgUxoYLwMqkEwz
 WBQWMq8hnuQJYei43Nflq0gMnPZysSLzdBxHyG3jz7U89Sh1vAhXwIJFzSGveJ4ELs/i
 auCw==
X-Gm-Message-State: AOJu0Yw3j2EVM4uTH4YLum9DXYMGNGhBBq5jU5IHbtw7bws/leeoVbmU
 8dyMnUiMzsNiU1anc6XA1VcSbXdZItaxv0pYxMHcFkdf/+1AHjLCFxrFi9FNJkB2l0fSC6lvLyR
 e
X-Received: by 2002:a17:90b:3a48:b0:29d:dd0f:f853 with SMTP id
 oh8-20020a17090b3a4800b0029ddd0ff853mr3121079pjb.26.1710508199293; 
 Fri, 15 Mar 2024 06:09:59 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:09:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 08/12] meson.build: Add RISC-V to the edk2-target list
Date: Fri, 15 Mar 2024 18:39:20 +0530
Message-Id: <20240315130924.2378849-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uv6vQSKnihB/

so that ACPI table test can be supported.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b8ded80cbe..bf50688593 100644
--- a/meson.build
+++ b/meson.build
@@ -93,7 +93,7 @@ else
   iasl = find_program(get_option('iasl'), required: true)
 endif
 
-edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
+edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu', 'riscv64-softmmu' ]
 unpack_edk2_blobs = false
 foreach target : edk2_targets
   if target in target_dirs
-- 
2.40.1

