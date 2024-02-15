Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp668412ejb;
        Thu, 15 Feb 2024 08:09:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4/A0NX+WY2oeR1ANTET/QuXq2pk0qb8JZ+SIZ2saWEUPuvWkZrOSdi2m5uHzQql3/65DGLQLBZuJDG500L/+oLC2G9fO1
X-Google-Smtp-Source: AGHT+IFywBdz6rklL0rGzlR/8WLvuS0ELIr5uCkDwUjFjLLrZP/uYAEBIH2nE8Ezj/GIzaV6hMyh
X-Received: by 2002:a25:7209:0:b0:dcc:32cb:cb3b with SMTP id n9-20020a257209000000b00dcc32cbcb3bmr1969383ybc.44.1708013394666;
        Thu, 15 Feb 2024 08:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708013394; cv=none;
        d=google.com; s=arc-20160816;
        b=ymvqpHY1u/CLvMe/lI57InVQluILjZUYcy2SXi3nnluqevR+vuUa4D3OJT5q0JErHx
         peTCQ10zhgmcO7VUzQ0knTtcluY8osEu+hWjJ53QyNWjhzGZl2KoW90jsJfeih7A4tqm
         PRrChUNsrkpyJqjBuuL+G7bghjnHzapuhqTxOjYMa4Ty62phVuf7FYjm4qMAtcf9DkXk
         FNT+xoeT4SNp7d6Mqi8XvdDP7WuhmZXGYen5ES5eYgqVaWqMogK4Wlf1m35BIop02fP6
         u8ceFEZUHXp/P1Enz4VsfRhz5L4dJiK2Vdn09ybqYh3bDUBh3dW8dqnhG0WnvoQNO3rw
         oyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=U8/Siu9RsG5QThZz/o9Mah5ss88OOMP9i1PtfRXoEA0=;
        fh=E4BAuC02UI703LAmHjUPEGeLeClAdiFTCYNn7jn2Fbk=;
        b=OjVWDDpWCVBVB5SrUDpijoBnJVWPVyEBfSDxMyncAcihAySQAtOFs0NOpmXfwsRDAq
         EIUHBQgEcx+d2lWuLgHX4hKmyaEyApLkEi4JZksKEAsxe4x/6yXjJZpWNq2SQxwvA1cF
         fpOh20Q8/5bCSnMGNLRB+PO4tC6aItcyV9jhvQ/SScNngaaZPWDf1L+ctYfprP9t33eU
         u1LBCAUy+V5JpAhoE5/XDj3gQvUrWtpXPMF/tor4UmzB3bU+xF+D/lZDL1+fXBt7ihEB
         Su7V7BKcWOHfZ38SavJGymbGj51hWxfLspBZ24tMTUfnQ9+nk2G3vcV69LAX6o+ybFMf
         Juvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXAsI2Ea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p65-20020a252944000000b00dc74a9608bfsi590095ybp.163.2024.02.15.08.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 08:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXAsI2Ea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raeGg-0004Ly-Ah; Thu, 15 Feb 2024 11:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raeGe-0004LO-VL
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 11:07:20 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raeGc-0002wo-4w
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 11:07:20 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55ad2a47b7aso1496713a12.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 08:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708013236; x=1708618036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U8/Siu9RsG5QThZz/o9Mah5ss88OOMP9i1PtfRXoEA0=;
 b=lXAsI2Ea7qE+x4LCFqOA47O8PQLLRsNDQ/RdgsFkYxs1tdVG2Eg33E3PK5yZP/zL8a
 cDE0tK5lXJr8SvnjOoe8NMtF42bFnuqBmL4G3etP/b7B6Vu4cz7nJV6Po57NIsHEPsQ/
 m/USzu9vRJl+XYSPB2+Tv8pVzveVHrNPqwoA98+5RHoNacgTdXqsJfesfAcvjGD/szaQ
 AuJ0IDoIy8nq2h5kq5JcThViqPGxXtlQKN8L9Faprnspywz8UxMTIX/jeA3T53zWCGyw
 DZBON5zwM0ZKNDLUZNuZRIQCG/Z6QNXlw2ms38D1p4xG9P4qi11xVjZ4ow4OcsF9XWpG
 7iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708013236; x=1708618036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U8/Siu9RsG5QThZz/o9Mah5ss88OOMP9i1PtfRXoEA0=;
 b=GU1Q25+TxGRD/YicGTYwn6B6ILUTFflhYmnBs0hBedjhDdPXATN7oc5Oh0a9qsQIwQ
 MB7ZOIMxXNJwjID/3jOhMzECTpt58KWe9w+gluz+/rwpE8Z/AAdvdGRZWNHsCFysPiso
 Z5ujyeU/Wr6FMtsoUnv1IU3o+epQ6PO7LsNP4P9uQBkE/AezxIJ0drfNI98ljpxWCG5t
 ac69K5puDj8Hkj1GKLJ/CH7hwUTNRAEC0uVGhV8NrfIrkmiopMN9Hsv0ISq2bTBfitRr
 +LwioYolDhsU736pEdLpXNBVg1TDnS/ITwto2uKWIgEoCX47w20oyGAUQM7k8M1JxD9t
 4qeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi7i91R6W7lCyN02k9z1NDWz25R75+X89Bf08gNPXWiAOaRhAGH+y+2loP3gPiAHquZ7fNUVbl8F6XDHDtOd1m6i0l
X-Gm-Message-State: AOJu0YzHLoWuZ0s1wEErKn38f0GdNiJ7qzoWmqa+pAdrrbnCd7CAmw/P
 D5mL1PDaT+kxCFRgIlrbPX4jnDa4kVpIhjQ7l2KjjWzHJIIFBwQ1ovRgvaSv/qWkp82e9Bc6XJq
 Rm8M=
X-Received: by 2002:a17:907:78c2:b0:a3d:7cf5:c2af with SMTP id
 kv2-20020a17090778c200b00a3d7cf5c2afmr1664214ejc.14.1708013236481; 
 Thu, 15 Feb 2024 08:07:16 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 la24-20020a170906ad9800b00a3cfcd8772asm697069ejb.155.2024.02.15.08.07.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 08:07:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] MAINTAINERS: Cover hw/ide/ahci-allwinner.c with AllWinner A10
 machine
Date: Thu, 15 Feb 2024 17:07:13 +0100
Message-ID: <20240215160713.80409-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +COIDLElKo3p

This code -- which was moved many times around -- was added in
commit 377e214539 ("ahci: Add allwinner AHCI") and belong to the
AllWinner machines. See also commit dca625768a ("arm: allwinner-a10:
Add SATA").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c19ea41d1..71c385e697 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,6 +642,7 @@ R: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/*/allwinner*
+F: hw/ide/ahci-allwinner.c
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
 F: docs/system/arm/cubieboard.rst
-- 
2.41.0

