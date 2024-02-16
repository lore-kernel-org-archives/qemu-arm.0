Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1152407ejb;
        Fri, 16 Feb 2024 03:06:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVx7gxR1V+jQBqJ/GsT51P39wpaKO7LPQE0miC9DbvBSL/ZkLvU66ZrJvP2AbsQbjzvK14ZoO2Dtveu/ucy5DFZ0CzM3HlL
X-Google-Smtp-Source: AGHT+IE8PbTYK8bJdBSdV6Y9yMRyFzUDwj7kVAkyoSbL//6X3v+xrV4NdlAZ/WmR4QIpt+JAcbFh
X-Received: by 2002:ac8:5f96:0:b0:42c:53ec:a8f6 with SMTP id j22-20020ac85f96000000b0042c53eca8f6mr7861473qta.28.1708081590364;
        Fri, 16 Feb 2024 03:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081590; cv=none;
        d=google.com; s=arc-20160816;
        b=KskbkTnDbaVJuRFpIFXQEQp2nWr49ijGGFI7as/pvK+3lSi35NaJYbQ7wuHf1vyeQe
         umhMwRtrgB7fdphpmEv2Sfby02ELzVPKEa36uYVMMhcherXn9I/pex0pUtkCayxhR6nR
         8quAShd3GGbSgmqVVhvH5hovQLPleWVQjei+W/tnWZQt94LgM9v4q8GEfYIiJh6Eh7bh
         TP8X/CqneiwH8juHKsuPHXcdpYVoy1fjOjLLagGOa9OL3/UZOa43O98Cipt1K+RVfMyw
         cGyxG8gyIJl323Dzy7Y8wwPNlbt5WcLpqXW6fSx7cJvix1R/s0gEdiI/5vY1ABRJtl7B
         kOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XbRM+bkgLot/ksoxAWBDVY0FT1QlycUiAAgPHWKXiwg=;
        fh=CePwNcoO0Eku3Y0aMSfSoo1GRtlhMMRO0gXZuLdgoQc=;
        b=moG6R0tBqYAWVGYInVcuoVD9+Hx87nX5vRC8L69m9guJpTzLW6jIf9/fCQG1FGTHhu
         OcpuRE1E0yEHIDS8tlwSRO5fOOuYFAQmTJltokdq7bx1jX5NqIzJ+y0Afb/a2K0JkcmB
         7wApY3ljjswijyshV/2xtpV6sBa558Gcsnm9rdzcS4fn1u4Lg0o8IV8Sw5z26Lj1rhrA
         7TXDUuekNUaeYtVhPUpgKhcM28Pp6baOITSglXtYu0Rbn+3qCsxXbTluWH0h5zMiXY3i
         seW0JRqUbnn51KoSpgNHjVF+u0+ylDIl50jqJEzhUGJxtamBZzusTJIJdlvXLw00PWjn
         xrqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKr1CCvU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a0562140c8f00b0068cc9482187si3674383qvr.471.2024.02.16.03.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKr1CCvU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1raw1s-0000hj-60; Fri, 16 Feb 2024 06:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1o-0000QL-M1
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:05:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1Y-00019r-G0
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:05:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so464925f8f.1
 for <qemu-devel@nongnu.org>; Fri, 16 Feb 2024 03:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081494; x=1708686294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbRM+bkgLot/ksoxAWBDVY0FT1QlycUiAAgPHWKXiwg=;
 b=pKr1CCvUMUAtvcb60s5t/Y69MiuQng7NHnHq2uMqrdOxyXrhYMTtCDTLtbYxHoHtt6
 S4j9dh9YbpdH9TZf9HAJkBsHZou/wRpyFZJ2q98SZLEhx0lU3woUL/2xcvkXTIpAMHxW
 WTJprwEvTEgFOl5lcQ97UtRmg6uV9tDb0FYwOtvYyfIooxkJRbnKu8B8yqIC6qFZy2t5
 txjIBtC6+4nT3ZeYKnGG4lxQHUhqQuQ5RWI3NBAnfKSRpqrVBZddxJCbRwhr+AtqQnRP
 SGMQGIc2GFqCyQRpiWCrWkYJEZRyj1Jp4IIcZx/a04F/+09JqAoA5I0ieiLVKl6bTjtN
 Cecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081494; x=1708686294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbRM+bkgLot/ksoxAWBDVY0FT1QlycUiAAgPHWKXiwg=;
 b=ixoHxUq2qIeuMqcMAn2A69/r4VFdBPGElgwlj4+TbFdfewmkdYn/VL2HavEe2v7Tqk
 VjBfqruPCM6AkH6kxzXrOCqatj7Kxd9Kf2dpwDM2IfnaLdAdnCxcGMb/t73rZSCl3rPW
 jsWIDAOJ/gAhJQCfb6aEfQSeI8WCByL7WNM3z6Zzni0qMjIZwHS7eIOKkzhF/6KpKVGL
 rAZZ3a/XTmgm6RUkDMjUQBRuDKVEvlWpRHLn2y6yIA+DZkkvT+R2GLboaN1LIzj5xBrs
 YQ3YAdEA7WLtjL9PUJWlgwpFvgcOJIcvnnD7uCgOACuEcj6IuAjqbgT7DHZW3qVU025A
 MlyA==
X-Gm-Message-State: AOJu0YxusjZ/MI1Y3ML+vczyCW1ZsfHjzhtwM6bUf6VQIjJW5CtVTLNM
 U1UyTDrK0rk+xiFfnTUY0hEBjKROoeGI2wyhHH0DkDDo2rUDjmRwyhs3hapPYU87ZhTiMx++LPt
 q
X-Received: by 2002:a5d:4fc1:0:b0:33b:5563:3502 with SMTP id
 h1-20020a5d4fc1000000b0033b55633502mr3177267wrw.17.1708081494488; 
 Fri, 16 Feb 2024 03:04:54 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 bp4-20020a5d5a84000000b0033d1739aedbsm1908351wrb.95.2024.02.16.03.04.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:04:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 15/21] hw/core/register: Prefer object_initialize_child over
 object_initialize
Date: Fri, 16 Feb 2024 12:03:06 +0100
Message-ID: <20240216110313.17039-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3BOaSNCDhLTO

When the QOM parent is available, prefer object_initialize_child()
over object_initialize(), since it create the parent relationship.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/register.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 95b0150c0a..b6beca0e02 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -259,7 +259,7 @@ static RegisterInfoArray *register_init_block(DeviceState *owner,
         RegisterInfo *r = &ri[index];
 
         /* Init the register, this will zero it. */
-        object_initialize((void *)r, sizeof(*r), TYPE_REGISTER);
+        object_initialize_child(OBJECT(owner), "reg[*]", r, TYPE_REGISTER);
 
         /* Set the properties of the register */
         r->data = data + data_size * index;
-- 
2.41.0

