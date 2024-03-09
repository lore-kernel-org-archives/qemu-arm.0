Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp367854ejc;
        Sat, 9 Mar 2024 11:23:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwqXymeymYrv5b4vy4P6uAs3QY/AOzOLJrkur8C/g+KLI+T6D6Y99w6ZjC3L7Xd1FIz6Gm8ly0fMzVB0xqisyqw1Y9VfiA
X-Google-Smtp-Source: AGHT+IF3+Rnv35Lx9o/o9QxT8pGKXIUunC/wyEPL01pdkXiLIkF60O5+p5ffTP6kE4gv3CWW98xY
X-Received: by 2002:a05:622a:10:b0:42e:f994:5970 with SMTP id x16-20020a05622a001000b0042ef9945970mr3830156qtw.38.1710012206969;
        Sat, 09 Mar 2024 11:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012206; cv=none;
        d=google.com; s=arc-20160816;
        b=qLgaHxKfMdjhv1llpkiYSsFewfawnogQrQuCVEtAsmyDNvqyJy14KmyFGK0fz5wUCF
         BzXNWvn9PizTaUcIKlx+OArFn6S/u8pFHOOuDZn8xZWFtilRmDPuzRs16SaP+MbV09AV
         3hPzbznIRMIFtOSrsQEqXeNdSUH7n3tgPunXYFkDxZGdEXWQMoPoZipmN0hL1eQCYv3Y
         uJWae5Qn57DjnmAlayxXGDZvMQmbD9c/7kLFbeBeivVt/p8qXvjWOC7CY8iXo4cPdlyP
         EZPl1nHKa+SCYFtp6MgNWQvZDibMR4e0TxhJEj11Fbwi4Lg/E5+Gt/m8EFX4rgjHX4/W
         QEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cFjMT6zDVz6FC8tPUCQ4kyyMrqKZ8chKsrslRHOyQyw=;
        fh=6bM9ZYJkXqqDNOPajDAdM2xmMMWoAjYv6jVi7K6nbTY=;
        b=mOi1b+bEEESW0JbskPYPML/OXFBA849AH0IMU8AKKaXkr6Q5FG5uQGvs5wnOp/mGZm
         n5LeELdsFxuRL62qmAhasH3vLqx/aqTXR/itdhBcgwz+NPXwcafBQjjOLLTh6oouA1fi
         jtgEFfyTzFN9DPD4Tn2YSTLfsdhzdMUF4/EOJEVFSuS08g572Q5O63k9uK3v+TgQ8hVh
         WhRJYxBneVf7sJV8BPw7v+DN8LRr5Ws0ZEE8B4HM/MuVcX4i4yKpMw5uoAjWHAgNA6zf
         xpOLwDocAKH3zpqG2nHVWYEwMuNMmm115wk9HtIv+u9CW1UoXQnfMoG954QxzFt5GPos
         H3hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqXWBu1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15-20020a05622a04cf00b0042e6f32da95si2118784qtx.711.2024.03.09.11.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqXWBu1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2HZ-0000Kr-Od; Sat, 09 Mar 2024 14:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HX-0000Jz-IE
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:22:56 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HV-0002V9-6G
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:22:55 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so4239220a12.0
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012171; x=1710616971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFjMT6zDVz6FC8tPUCQ4kyyMrqKZ8chKsrslRHOyQyw=;
 b=CqXWBu1FQrLQrx2FmDdLdS/BGLFDvUZKB+rVoGQmVFwQSM90i1GsAC8swYDoNG2P5V
 G5fvHMbj5xk/pl4pEJYjA4RA6mZAa3R5uPHtRmnZ6I0lUK6ReqHtAvzIItNbGcJDpG9/
 xGQJVYMzDXEfB4cnsOW3ixx6Kphoz5jkh3fcqzxbcrzhzy9S3Q9iwO40Vd7rC8g7CcHS
 Vct4I2T/0psb1fk2hU7+yb0ZdTRF5Pd0/JCZlymvYVjAy39WFD37Yr2kpbrfhfJeE2gN
 MefBLQCB4Fm3dAuqCSe789RMLETLxxrcf9BkBGFmnjmMC0Pd0pGPXyLrBmOaVFdLPz0s
 34BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012171; x=1710616971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFjMT6zDVz6FC8tPUCQ4kyyMrqKZ8chKsrslRHOyQyw=;
 b=V8yJViV/ii7dIFESwBd+NGhkW3oiTMzZ42ApfCVYtoo1IHBj4pTfc1dU7wcDRC9//O
 M6CPujM/JYWOUpPe0luAV1pTSbBuZ/UYQIV+QbZTuPfYpkWOOXW8dNLzzvfzB563hhqh
 nwb2yfomHWXEZzChFh9Qr5zQvsH0yjt6RZpdx68PM+CJt8V36VMZkDr351ay8/96CYfW
 NdihdvPzPN93AWY/G6NcDgimLd9K+JtkL3R90P2AZvbK18A6F0Ob8Eshjks7zTiKKrWH
 02cABLhzA8gcDis+8BccLwy6JZWAdXFRLtKtoOhg3xoURyVgH+2NRxvTz2Vuw8wMUOKg
 /+xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHUiGpcz0nQRc2zjrfC8+RFJ8Op6PNFU+7uViFQ+U6AI32VCeNDyhWmyXBNTjaJxftjtRfEEiPgPi9THmYYh52VqFX
X-Gm-Message-State: AOJu0YxtMaM73jvHCKC3+KrlfjhaLz9Zw2vk56rHgsWAa7j9EgvnsJH5
 h47IOaN+4cgafWAu8aCcjnukACQLzqR/dsSqXEQM2Ug1o9FPsTiRMuzw8cVyP+I=
X-Received: by 2002:a50:934a:0:b0:568:1882:651f with SMTP id
 n10-20020a50934a000000b005681882651fmr1774495eda.25.1710012170814; 
 Sat, 09 Mar 2024 11:22:50 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402359200b005648d0eebdbsm1141497edc.96.2024.03.09.11.22.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
Subject: [PULL 06/43] hw/xen: Remove unnecessary xen_hvm_inject_msi() stub
Date: Sat,  9 Mar 2024 20:21:33 +0100
Message-ID: <20240309192213.23420-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TrC5qjOcs2QM

Since commit 04b0de0ee8 ("xen: factor out common functions")
xen_hvm_inject_msi() stub is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-8-philmd@linaro.org>
---
 stubs/xen-hw-stub.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 7d7ffe83a9..6cf0e9a4c1 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -24,10 +24,6 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
     return -1;
 }
 
-void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
-{
-}
-
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     return 0;
-- 
2.41.0

