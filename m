Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp521733lfg;
        Sat, 21 Aug 2021 11:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPdqbo+OLLYrAUNGXkGyl8GaNEeSm5lIWd8yXOQFq6mhUovWfqx2SHLK9nd1lyaHcFr9RT
X-Received: by 2002:a5b:80b:: with SMTP id x11mr33824278ybp.196.1629572371507;
        Sat, 21 Aug 2021 11:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629572371; cv=none;
        d=google.com; s=arc-20160816;
        b=sAuXU6WdWWCKnoAqW6brug7N46hPzjX/hQK+MN9IHblbqHQsco3a2mpHK1IHgQmGkZ
         sR0FDdUyJ+hD1qUAFQfhA08CbfFX9b+htDJPWWpi4DmaBwnjCOjHaLe50QLZGzXM6PgQ
         gY7ZA9gqz2VCTE+9OdtQP4SiUhwD2VP+4oNScnjafLlXDX1XnXqx6oHpyeoLYxV96jzT
         Y3k0LnFtpPawZPBXTcrOgI0YttpWac5bsx+W68eGs+N8B39alX+AwCBUJxCDrv+nR2iy
         mREd2bgJ1AjHruutdDJ9Esm3MIqLfsZGJCnHOgj4NgOvaXMtFoVckkgPJD5hxHtss67n
         VDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2lhDdN5OWxXKQkydRBX45zZZ7+QIWI9EFkLa58BWgVE=;
        b=sM1NguaXdN9C+UwKvb8wX4w9Uarqlf7b33Z5Czd4Bn026uPWOl4GO2cZ3Lf7Eps9r7
         QBTzqlcLdLfskrC62qZaJvFmRIq+EYa7ytJzvwsBEB09VQNqInDBM8Cqn8q3IH7JJj8d
         3cPTa2NAEIOG+n+zAClN63oZdGv5G4YJCPQVa/OP8igKXw7DGboIBgcB26H+VHmFRvDT
         pVqC90D1J+354XODOjzM6TaUcPckN+sag6j+SknO+RHE7f889y8dW1mKLB3gb73FIfj9
         ofsBGmeK165H6Mm+Pzc1OpXg5f7v83/4bVN0IxEHvgRu15kNsf8O2eSlC2NAVB34NAqk
         Seeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXLO1AwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si8634792ybk.112.2021.08.21.11.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 11:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXLO1AwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHWDK-0001Le-Ub
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 14:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHWD8-0001L0-0v
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 14:59:18 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHWD6-00060C-6i
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 14:59:17 -0400
Received: by mail-pg1-x52f.google.com with SMTP id k14so12560460pga.13
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 11:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lhDdN5OWxXKQkydRBX45zZZ7+QIWI9EFkLa58BWgVE=;
 b=CXLO1AwG6RCgC22wKhpQ9e/qB5uket20GcUTRadkZfGL6fgpcqSXLnQdIfmqWSxvxs
 P/adXX+IJydf0OugwSb3etAAN22Ru6gWc1pVe8R4wRATk9dsqbK6eUAoODnSGROw8rBF
 Jnyfv8X5FWVhkhIUI/6rbtB3+1O2e/lma5T8pYCL4jH5+oHifNC9aRkcgitkuWAYbPHW
 PGU59fOdf0ghDgAI2+tXWaU+QiSCDCaBQy8ARvg0eyz+0x0m9IVCnI/m38tmY9nD0B54
 04nLbWTdKyHdJfqvwREGYrjXCOpWpSMdfNoAWPCc4I/Bz68lWjkNHSoZHTbGWtAIgQhH
 BeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lhDdN5OWxXKQkydRBX45zZZ7+QIWI9EFkLa58BWgVE=;
 b=fHCwVA4n+mmN15NmDW7I7T39UXiCuN4LrGNBDwg0a5Y1eN0sOwP+Hfv/p5n7Mljf7P
 P0dOUvD+egSwNyOdAxsDrNjSJUayBMj81bS9QIkoYYVNqt7xOiOVUY91Aldw9fpJOBxG
 t4Jo90QOjUPHukNfYHCAaGRfGdVbA51i3htz4Cajvw7Ao4+g2t9q3Pr1NC1a3wpqEyHp
 WNeBqR9WLsSnRRcv3SKU8n9CYmQcT5GL/VJtuL7itfaC8YJaSQvRnbHEZl+k6G2pfHY6
 RNxctyjHnp8iu3qDth+nMvXE8q0U02HLFeCDT++9jov2kVHNTzIj8659+W2Ru5KOEbk8
 0pXw==
X-Gm-Message-State: AOAM531GyXVsclT62Sa4No4T0+qH9i3RhYzuY7wb8ZrOf0tSWe2j+FXu
 ujCgSjvAn4Hs07jYCDur7Jt9xg==
X-Received: by 2002:a63:6983:: with SMTP id
 e125mr24483545pgc.389.1629572354386; 
 Sat, 21 Aug 2021 11:59:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e12sm11096513pfv.146.2021.08.21.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 11:59:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PATCH] target/arm: Take an exception if PSTATE.IL is set
Date: Sat, 21 Aug 2021 11:59:12 -0700
Message-Id: <20210821185912.22401-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817162118.24319-1-peter.maydell@linaro.org>
References: <20210817162118.24319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4ZJbhHDPMSB

> +static inline uint32_t syn_illegalstate(void)
> +{
> +    return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
> +}

I just noticed this should have the IL bit set.


r~
