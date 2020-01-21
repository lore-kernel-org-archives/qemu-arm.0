Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp894185lfp;
        Mon, 20 Jan 2020 17:33:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNmAM7sGkqB2Hai+tOdEr9+O7fw+joq9ZveA6fW4SFBu8AuhDiIVNCL7Ou2v5TkhLZT52G
X-Received: by 2002:a17:906:7f02:: with SMTP id d2mr2014481ejr.261.1579570420644;
        Mon, 20 Jan 2020 17:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579570420; cv=none;
        d=google.com; s=arc-20160816;
        b=JDF17qf8bdPUKYuolEW+/BtkPTMxPxVCnWA7kquJzpMYYmI/CJe5YlRk5OGYdcPomA
         BOn0C2A7dXKzVo6sfqAC+lEvgFDqgr/DwsFiQ5WnAO+J/gphEsB1oSyMx9EJfxC0vYL1
         PPKJ0vXgZXbLnZ5p/wkz6pGE7EBUkyqUg0ZNAEM07+kt9GAwMFsVvRvHJyIUCZ8y9F/P
         mlHh2gGGr8vjDK+hnT9wqPOo+BkCgMmhVqOX+aVmH9Zi4f4L0YQlyKKQc8QaugNN7nDg
         7yr3g/GG9e6EfNuBg8Vg6DJ1m7nwf04m8PFg8M3NRBPuQ+84DmaXhHlCeeB7goS4/RkI
         EE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wt9J/V15daU/9dXui9BqrGJFV38IpBWg9A6QEYLyt8w=;
        b=obzhuRnveq7fXWl/XSZt9QrTeDMJGp7V/QygYai6JA/aBPjJDA1kNihUW2UzMXdC2v
         oN5022nFN/Fwk9l2rh1evD6RvkUtPk4/F64MrG6R5DgZVUVYnWF1xJu3d0hN+/6X4ZTN
         uzmrR7aBUNAvU5AnxMwg91J2hCpJYKTxZ0OXytK1uU8HmgLrYZQXbPFxV+ZQZtcTM/qz
         Va07CbnAorBSHUi2FcVlnho/Zk0ACnvzkZWhdoQTadZyJmz9eqW+lHpi1RMVx87Mctbd
         OviZJ4qNTl6VRqtE2hjngsDih+cCeJf143awp/8Pp/nyIYTUb47SGmYp9nL1y1ti/7N7
         b2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bCkTa6kx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si20771718ejr.358.2020.01.20.17.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 17:33:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bCkTa6kx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itiQF-0007Qy-FW
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 20:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1itiPq-0007Qk-ME
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 20:33:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1itiPp-0000Yp-JU
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 20:33:14 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35687)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1itiPp-0000Y5-EX; Mon, 20 Jan 2020 20:33:13 -0500
Received: by mail-pg1-x532.google.com with SMTP id l24so581660pgk.2;
 Mon, 20 Jan 2020 17:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wt9J/V15daU/9dXui9BqrGJFV38IpBWg9A6QEYLyt8w=;
 b=bCkTa6kxomnNxRzE5tStW6gpW1JgEIWh9bFNoi4/Hhq709CuoM39nUAmy7vGLO7iCm
 hRkTo3Fk2z34fyTf4o4twf0FcLQAuCO6Q3HM7MK/fmFgYyf0OX9GBf+F3bGHK8fOI1Y/
 o4vWirjzCXJ9tTARaTOqd3/Z7EyibWBlHNi3dFdjhYzoxIuqXcRy9So5qwraPKJYWlzS
 i4ZMoQK4wwqhH2lrk14Pt2gp+LW6g2RGo+w0H3qvzh+2CTgJF+5XLFGtLcX4t8nTLryE
 2zpGg/fSGW6kmJKDyXb3P7FkfltHfPDDr/pPGJcz2RNfaYOV9T48thNlUWrWaOlPlAte
 DNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wt9J/V15daU/9dXui9BqrGJFV38IpBWg9A6QEYLyt8w=;
 b=dXwSLkvOM+zVZNRgTBXuCjKgtHDG92jb9O+Vlm9A3N/+20hvH8GPXZS3VVNkUYnesX
 PqO3LrbFWGG3HMN16HLOgGfNPXq5DPo9Cn6Ssv7igXz6RKRcxriPjnqXCoBqBlYM+qan
 aAtWEgL2SGxiwaTpv3h+RU+bQQhF8Dj7qn+Ad1bVQTnvqVKi0gueOXO7wtGQB/nxnvC+
 mJdEPqUcrbVqMEcdmKh5NbUTecoyziX8oC4s3be6cvE0v5EfcT2DDmbSF5rUeV5TTeS3
 dXrgkgimWpYze9ktQYyesIEDAkKR2NhASkeKN9lBe+7ODp35Ta/Qtq6nXhh4Z8cZyyJZ
 ID9Q==
X-Gm-Message-State: APjAAAXcjQeRQy6O2eo1gSzgmAbDkp2aSEGEEbh7zBzav+W8eOcQ+hlG
 UTvW3qu4/oyP66cXbX11E7E=
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr2679894pgb.102.1579570390669; 
 Mon, 20 Jan 2020 17:33:10 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x132sm40628397pfc.148.2020.01.20.17.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 17:33:10 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] aspeed/scu: Implement chip id register
Date: Tue, 21 Jan 2020 12:03:00 +1030
Message-Id: <20200121013302.43839-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FxPNd253nruz

This implements the chip id register in the SCU for the ast2500 and
ast2600. The first patch is a cleanup to separate out ast2400 and
ast2500 functionality.

Joel Stanley (2):
  aspeed/scu: Create separate write callbacks
  aspeed/scu: Implement chip ID register

 hw/misc/aspeed_scu.c | 93 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 23 deletions(-)

-- 
2.24.1

