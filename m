Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4911414wrq;
        Tue, 19 Jun 2018 02:31:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL318NL4ry5WJLJRrR/6giXveXPZiJzKqJtq7Tf9E2dbNCA7UB/gKeTMFvuBOslcs80K4Et
X-Received: by 2002:ac8:43c7:: with SMTP id w7-v6mr14179894qtn.371.1529400715886;
        Tue, 19 Jun 2018 02:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529400715; cv=none;
        d=google.com; s=arc-20160816;
        b=S2pROUXjXYZNblUdteGdeQaKPn4YjBGaU0G5PJRPniIo44n2r0Hx25E2UEwh6Q5tsK
         +CJ2AOHQnZUpYQZgrJGR0A0BpMNhkz0t1OxZkfYPwBh1C+uCICS1DT2bamo+/JUXUGwh
         XDULZMKL1Ih59B1xKmqKNCAlQ0lVXy3Chf5KHLSqegvlYc9H97eUltNcSXa6nh2c+CHr
         iUwFO7UMQufUFzzps+r80EYvfYRkft+ZnqiiPK31WRF5pVJtYks1r9XBII1+ClsWgnYO
         ikjfjK4r675StMDhNq85fQAOsP00T6Dg9uCL3LrxfByYKvwYeRCc42SmsrYLMcDtmIYy
         1xyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=w4H8POeFxdpkf5ALwwVq0S+0Hv4XJIm4jSlUowmbyx8=;
        b=x80alDUJKlX/rG1iDbVMSPkBLAg7ia3NYGtThFTG5Af0NOS3Nwm8etZKE2Phk8vKya
         pt77HwUve7vYR4q5T72hmQz/sgVqnNT6IJEkzJKywKtcFxdlrr1H3rFE6+0v9aPvlDky
         ZxqiB5/dPEB/7GoO4jYPCAVMHrzqjWf9Ww1rn5fCnZrCaba3N2EaKM4ROdMXqS9YrcnH
         RHSpw7zho0dJvl4TbiUgjCc8E2fWndkzt1Ci+tfENJ8i+Rs1eho0dcVANZHBGzFDaav/
         yDEf9UU0GvgHgL5EXMOFD97TizmFaE6aEcTpv8hXsrIeDYHDx1T4d1WtiLh9aAzMyaUL
         LM4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=woBI7NZn;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="T+faJ/cK";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="T+faJ/cK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j21-v6si4755670qtf.310.2018.06.19.02.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 02:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=woBI7NZn;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="T+faJ/cK";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="T+faJ/cK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVCzT-0005Qm-AL
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 05:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzG-0005Pl-6i
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzB-0006G5-66
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:42 -0400
Received: from greensocs.com ([193.104.36.180]:42312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fVCzA-0006Fg-Qg; Tue, 19 Jun 2018 05:31:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C981244B870;
	Tue, 19 Jun 2018 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400689;
	bh=ksaS+uGaRaUP2w5M//lsCei7Xp/Vm337SQTO5oyfCQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=woBI7NZnoBHQ+84z17dQ5X7KDjNzxMYSlvzwLkqF5iy1vdz/TBz8682IWWnzCHBkk
	Js9HqItXxTWn3a4CRGSYszlwo3OZT4ksvRFN0seaBh4mWQvz1Mm9GvZrQaqYVVNKrr
	GqZmQ0+s2ybLHOHqX3cWNkI/BkdtLCDgI6TAFT1M=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=T+faJ/cK;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=T+faJ/cK
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8KCbug4nK5j; Tue, 19 Jun 2018 11:31:29 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5DD0544B875; Tue, 19 Jun 2018 11:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400688;
	bh=ksaS+uGaRaUP2w5M//lsCei7Xp/Vm337SQTO5oyfCQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T+faJ/cKyaNYB3e2qQ1c3QYwXyk2gkwrCbCB7K8yOOwtWtqyAQt8xjSu2BKQyyuHx
	AIgkW4+XwzfQcytojJpA4aC3ddz5fusPcbs/E/lkh/BILpgAu15zAgzs27cImv/H4+
	gaNsyRw/1DTi+htEYmydjryQNx5LWp9BW42ujrXc=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EF83644B874;
	Tue, 19 Jun 2018 11:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400688;
	bh=ksaS+uGaRaUP2w5M//lsCei7Xp/Vm337SQTO5oyfCQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T+faJ/cKyaNYB3e2qQ1c3QYwXyk2gkwrCbCB7K8yOOwtWtqyAQt8xjSu2BKQyyuHx
	AIgkW4+XwzfQcytojJpA4aC3ddz5fusPcbs/E/lkh/BILpgAu15zAgzs27cImv/H4+
	gaNsyRw/1DTi+htEYmydjryQNx5LWp9BW42ujrXc=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Tue, 19 Jun 2018 11:31:20 +0200
Message-Id: <20180619093124.24011-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619093124.24011-1-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 3/7] vmstate.h: Provide
 VMSTATE_UINT16_SUB_ARRAY
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AmHrjU4pzN0M

From: Luc MICHEL <luc.michel@greensocs.com>

Provide a VMSTATE_UINT16_SUB_ARRAY macro to save a uint16_t sub-array in
a VMState.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
---
 include/migration/vmstate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 42b946ce90..2b501d0466 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -923,6 +923,9 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT16_ARRAY(_f, _s, _n)                               \
     VMSTATE_UINT16_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uint16_t)
+
 #define VMSTATE_UINT16_2DARRAY(_f, _s, _n1, _n2)                      \
     VMSTATE_UINT16_2DARRAY_V(_f, _s, _n1, _n2, 0)
 
-- 
2.17.1

