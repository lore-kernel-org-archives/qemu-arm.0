Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2721696lfm;
        Fri, 3 Jul 2020 11:50:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLw0pQg6jb6aFX/x9LtxR5Mtj5B3gWIKfqhpXDwInTXa2iQSrwPiPPnZAptcAbH64EDp1K
X-Received: by 2002:a25:c089:: with SMTP id c131mr59351178ybf.504.1593802223591;
        Fri, 03 Jul 2020 11:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593802223; cv=none;
        d=google.com; s=arc-20160816;
        b=Uvtv8yhy5F/bhNRcL5XBuiNcokXgPHAeYHtgQo4hjt3Gw7sImC26sOVnqwZ3HH8ImT
         7Wjpy4v9KfQIqKH+Moa7OezTDvd3qdXAK00nOm1gY0ufivAjcITybacsxEEcPVu++oJD
         USSajAFJNqlnC9U+NoLtzz9YjUEGF8UsUvjNohdi6h+fFMHng5T6k9ZjgTXMjm6J+PcV
         rwQEgZ6bItEIVpSEETBNGc9HorzZNnqkAyRsbDf6by1fbnY3YAuY45+TOY7crp94ENzL
         9R0cQaSb02yrQizvHBBeReSDFSCCRhuKTOql8fBqReRMs5SHe7nb7yYOApNi4yWphXwW
         IzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LiDVcNkiZIpvhf9IYFi6LwnSQAxblfs1gRRGoPgSiVY=;
        b=hHGSObXnv9BUFfSctoVo+xN7EovgvW6PJTJn4AG5E+DQ8hjuynGhETJSHDjZp7jNNf
         h5yeRmy33Ug76H5FHgCRwpZezi9MZeg5h0g2L7V07jv+5ZUbEop+ctkatqlY8PyDU/PM
         oXZdVyzTQF+IWcGRHasddzqVfDnNkZ3vjCK56rCDN0kQUYzCKf+nXq4cnLvDDiAeEQHG
         kI6XVgNXn8Nqi4x1M/JTx2/K/Qtq0lNnbwhK+3bKfrOQLYE4fmM+2WG5boRfSdyEkdZt
         v6u0jlFU71hKTc8VYsoDPWVB47mTlmeQtJBOeehRiuaUBKBSrv+XIv+pv+v9m+/zqri7
         fxew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=elBU4wZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si5077473ybc.47.2020.07.03.11.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 11:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=elBU4wZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrQlS-0003DG-PS
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 14:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrQl4-0002no-Kh; Fri, 03 Jul 2020 14:49:58 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrQl3-0007ad-3o; Fri, 03 Jul 2020 14:49:58 -0400
Received: by mail-wr1-x444.google.com with SMTP id o11so33756878wrv.9;
 Fri, 03 Jul 2020 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LiDVcNkiZIpvhf9IYFi6LwnSQAxblfs1gRRGoPgSiVY=;
 b=elBU4wZicGfrHFVANIx8dovHU/ctRQGy7SrELsU6x68r2UL/2W/7stWEfV93KhpVW0
 DNCgySdMBuabLzAHtKqATpKgjINJBFGsR8V6D9sBJNLlay/Zr8PPB5OyzLDfXsYbFI9X
 Kt3jRdlwArTkPq8Fh8XQLqHwzCTZ9+4AkTyNy2LDNKm8bZgvHtrgqs58QmS9uVw3N3br
 jcMO9TLqBWnU8W10x3Y2XvsA0FmPBTJn5R0eSSBxHgnN3nUlN83bysp07cMUAHMXef7U
 DUxvXUHHC1VxezMjJMrnbxs3zBn19+upDprlqtAoB4ny/gpEkT8HHRDykQPdtzvI15pO
 WUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LiDVcNkiZIpvhf9IYFi6LwnSQAxblfs1gRRGoPgSiVY=;
 b=QCRXUSyBU9rglBqmJ7cr9qqAYojqRFnAjarkUpWjlkLUsz023VS91a4f1Z69x3tY6G
 yEBy1ZhUTVV5Rj2GmAlXO9Wm4Kja8CHgdw0lY+Kawqn29+dKWFUFdYLCdaGDvY1gdyQV
 QyKYEAZGMq1gAdb6srEuX/adqp/H73lg+uvSXg/m+mhRAHZlE3sfHN1Prj+Y3ViiF6It
 IzWlmsaNiyi5CUXDLkm74/a6d1xDu2L9rdmL5TWD7OzG2+lL7BGt6fuQdbBkhgoHDsNp
 55s2kNmdP0/cKVON7CWvRGOQ0e6eK0ygKwmQlkpb8xgBuoT0YimHQDHrQL1ZhwWIKP6a
 gJBQ==
X-Gm-Message-State: AOAM530e90NGLgIZCwrAluGEBQ5Y4lS504z7alj7Ncm5yuKnDJichAfq
 1g6DOrDi5MYSQZU/GxZjXine4EeWjLg=
X-Received: by 2002:a05:6000:ca:: with SMTP id
 q10mr39200668wrx.135.1593802194485; 
 Fri, 03 Jul 2020 11:49:54 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x11sm13778369wmc.26.2020.07.03.11.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:49:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw: Use TYPE_SYSBUS_OHCI instead of hardcoded string
Date: Fri,  3 Jul 2020 20:49:50 +0200
Message-Id: <20200703184952.4918-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZYrLfEUIKTmr

Trivial patches to use the TYPE_* definitions instead of
hardcoded names.

Philippe Mathieu-Daudé (2):
  hw/arm: Use TYPE_SYSBUS_OHCI instead of hardcoded string
  hw/ppc: Use TYPE_SYSBUS_OHCI instead of hardcoded string

 hw/arm/allwinner-h3.c | 9 +++++----
 hw/arm/pxa2xx.c       | 3 ++-
 hw/display/sm501.c    | 3 ++-
 hw/ppc/sam460ex.c     | 3 ++-
 4 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.21.3

