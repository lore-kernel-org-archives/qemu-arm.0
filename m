Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2747038lfq;
        Mon, 11 Jan 2021 07:02:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuZzrUo5gSi07bUy8X5aoWrs9o6IMHJNQNQEAyefd7+Tj0kal89RcpfCWVKs7++PuZtpnp
X-Received: by 2002:a25:2552:: with SMTP id l79mr176877ybl.61.1610377336599;
        Mon, 11 Jan 2021 07:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610377336; cv=none;
        d=google.com; s=arc-20160816;
        b=e5aK96m2sjyjAH9Su/+B+5uRpTo7aICcs1yITKFtzBWZ2wtBZDPd3mNDXgefAFR5l4
         N5JKBLp3AN16ra0QidKNBmBi6uIwKMyWKCw80LZaJozAxyQtQHjzBWSAeV//5GIolR1w
         S4FM/3gCP9OlOxQUfnQmEJudHPj5eLP/t6aYib0W71CkLAoTr0S2N9IThC71RZMhLMBE
         6tj109WL8tDM0NPO3w5R93l/JO7swpjOdYqhiL82Ww8GdXC5+LT5w9zc3uPx2qKUNVOq
         xUXrsafxCzpC7tkf7PXnfSnzfo+K/sfuhYa/ZAy/tQoXbQd6h0gh0aI4jE4bgEoCKw1j
         R4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=H7jli1x205TCwQLs1TIelXiSiL+UVcSYK0tSgScIb9s=;
        b=yswfAbmRtnZKCdCgd2B7ZgS3ni+JjxRjfoQSiJsNkGVY2cF1J2CtztoS9kboz0l2Ga
         ztY48hEo5IdP2HdFVvY3U242qy265ftCAFPPAzRSBUfb0FGEyLdU36weUFvzlMFGq0f6
         6WXSAKSI1f+GFjkP36MqAP2kVbxz80DvETAOfj7ZIJAZdCoI/7Mx6ozW772AGBdN5vHL
         8ldIzEQCrb87jyeVleO3zdSrzVmmHHMcyIeHbj7e0W6pn/2L5hSwqvJaJWenO7G39C0+
         BQfxX+GmWWu3SG8+9Vg6hoXHkwxHTAsXv+2+l5CwpMo9b0WUptRABOubiWMJ4ePDIWAM
         wS6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mvp7q2JN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si91843ybr.32.2021.01.11.07.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 07:02:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mvp7q2JN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyyhz-0001Of-VX
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 10:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyh8-00014f-UA; Mon, 11 Jan 2021 10:01:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyh7-0001Ow-8o; Mon, 11 Jan 2021 10:01:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id y24so19106973edt.10;
 Mon, 11 Jan 2021 07:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7jli1x205TCwQLs1TIelXiSiL+UVcSYK0tSgScIb9s=;
 b=Mvp7q2JNh+qjcoH8WA3zveMCBugZfpKO+R8qbaB+c8BlZSuw43ZflcPnb2GdDCuc9v
 fqxQGYYJy/AQ0Y/krxvyi4dQbUwBZOadY2tuG7JmN+cghevKeB+gIKhQpkrGJNEDwp3R
 tU79sO1gMD4VpM+E+bhO3wDi1JwVj+E/+KoAiVWf4zOCWCGIqzI+xJFj1X24Qgkz8id8
 whqrdquEItKVsw32lurGNFqgTTHdY1CIhRj7a+jjIpDAGNtOFbfeDT3N52CexpFRwLGm
 vRjWgid9sJ5Fcq+TughpyzuaMQXLUlxczxOVMLRyT7CkQZmS4aTgLga4n75IcaDhek40
 Gnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H7jli1x205TCwQLs1TIelXiSiL+UVcSYK0tSgScIb9s=;
 b=ZcG/PVuYfOKlkcBBBIT34KivYCs7aS6zUH1Vif+iUuM4IXB7ygHgEm03DlhqFkahqb
 lI7fFsxpqO+ACdHv+3o4QA1iClXdVwQCCwPCymFZUcWVEgcX8K+AwWlUmoQSN8sDTYUF
 dWYeU+Z7B1FcdyLun7a3BV3qn2XnFjY3V6IcigXcb6AOHmN9KtgcLwWTOsI7I5XXvMY7
 ALM9FFOjWI/EhdvbIHJM3ofzuUmR98EqkFg5Y2VQhbitrabD7m+fNPNz7S/MQo88onEM
 U5XgOPXDJJ3JrbiOxlGYAFakg5mvd65DgcFn+kmZgR6nb9hHVztYKJkiFPjeKyFZxfi1
 kpPA==
X-Gm-Message-State: AOAM532Br68SU+utVCWPzMftGh/BdUhf64Aoh2E3KBomQ9wzRzC2Oa5F
 NoqNJUYnxquO4mPYZBB+jOukSN8BQqA=
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr13989485edu.360.1610377278262; 
 Mon, 11 Jan 2021 07:01:18 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id p24sm45023edr.65.2021.01.11.07.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:01:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS
 elements
Date: Mon, 11 Jan 2021 16:01:09 +0100
Message-Id: <20210111150114.1415930-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZI7/1CGaWp1l

Attempt to fix the warning reported by Miroslav using GCC 10:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  tcg/arm: Hoist common argument loads in tcg_out_op()=0D
  tcg/ppc: Hoist common argument loads in tcg_out_op()=0D
  tcg/s390: Hoist common argument loads in tcg_out_op()=0D
  tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements=0D
  tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements=0D
=0D
 tcg/tcg.c                    |  19 ++-=0D
 tcg/aarch64/tcg-target.c.inc |   3 +-=0D
 tcg/arm/tcg-target.c.inc     | 173 ++++++++++----------=0D
 tcg/i386/tcg-target.c.inc    |   6 +-=0D
 tcg/mips/tcg-target.c.inc    |   3 +-=0D
 tcg/ppc/tcg-target.c.inc     | 297 +++++++++++++++++------------------=0D
 tcg/riscv/tcg-target.c.inc   |   3 +-=0D
 tcg/s390/tcg-target.c.inc    | 252 ++++++++++++++---------------=0D
 tcg/tci/tcg-target.c.inc     |   5 +-=0D
 9 files changed, 372 insertions(+), 389 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
