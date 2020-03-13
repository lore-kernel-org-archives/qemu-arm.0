Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2176437lfc;
        Fri, 13 Mar 2020 07:02:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsLnbq2ftfrL/arSsmXXURwZRqfyww4AMD9eDj0mPw5XGlsuIwKO1jAJu7HYSxWsAfIzSWv
X-Received: by 2002:ad4:5349:: with SMTP id v9mr12677357qvs.177.1584108157185;
        Fri, 13 Mar 2020 07:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584108157; cv=none;
        d=google.com; s=arc-20160816;
        b=lCci4O6u2Yb+iWoMb5MgEwmPpbRiK8VqASxaipsqxg9hcwQ7fMJ3IB/+GTYA5czkFx
         Ho6PSgfhAJY3l0nSOJg7Ra6doim9itTxnFNK/Q/QcVYT6DseF/+qG9aAgHKAjC2SNHgX
         VNT/m5OZ8ZJHf3WuC9wC7gyLa3nRBpZTsvlg0tcH06QkpNAGQdzh0rePwlo9y3PrPVZ1
         YsRz499oRduwz6nfld37NJaHptB9avXEpGDY50wBBToSuC+/FOSgbIJTaccsW/SHbE3n
         nbRoNsjQj1oop4K74NCojXAh1x4dlhXnemO2rDUho8bjzXKGVo/akGDA3UQQMLUx2Alj
         /3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=U6KUUg/eRRnnb2M0PtLn4wc1gcHGsin4HDMJqcriFt8=;
        b=NVCQ/805CITAmBc/rJp0G3I+rfGd7cUTc7y+C+77DDTVk5Y0GhKxzGN7AE3M+aFh6U
         cFnv6ECoXYaCmq+s3BC1Ipp3bq0AErfntaCuFlQk1OIqCzikRScxRXaRDtgnc1VeWOPd
         H8kCaDznedW78FPedAXq2+s7totCo53ENAbqGelF4a/0C5GxdHtYzAdPLJBYt9UrcKMv
         fb8iLRvOMxkxVHN3Wi1hCudYZlBn1R27FcV5lFbAJXPE60Cp4Ngt2rp9ps2caLbx27DP
         WHxsxqYSUF8DZQmHmqthH1Uql4me6GyePDvGvASOytvuhr1RSd4Lah4sdu0Bmkv+xwUV
         xqyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si4789343qtp.294.2020.03.13.07.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCktY-0008Dj-HM
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCks2-0006YY-5S
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 10:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCks1-0003Nt-2u
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 10:01:02 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49740
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCkry-00037d-Qx; Fri, 13 Mar 2020 10:00:58 -0400
Received: from basile.remlab.net (87-92-31-51.bb.dnainternet.fi [87.92.31.51])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 2AFC85FAA2;
 Fri, 13 Mar 2020 15:00:58 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
Date: Fri, 13 Mar 2020 16:00:57 +0200
Message-ID: <2760968.XmuehLA1u3@basile.remlab.net>
Organization: Remlab
In-Reply-To: <2159383.tmy0LfLZHX@basile.remlab.net>
References: <2159383.tmy0LfLZHX@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p6YjR2TnYxhT

V29vcHMsIGZvcmdvdCB0aGUgLS1pbi1yZXBseS10bywgc29ycnkuCgotLSAK0KDQtdC80Lgg0JTR
kdC90Lgt0JrRg9GA0LzQvtC9Cmh0dHA6Ly93d3cucmVtbGFiLm5ldC8K




