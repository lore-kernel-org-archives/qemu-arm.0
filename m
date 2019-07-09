Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3551661wrb;
        Tue, 9 Jul 2019 04:16:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwr8CG5alwQvkomIv9hWU6tNV8t8Vg7oPIQmaGX1of8kTLOrVVRPwEjIt1dX/J3wDuH1GHM
X-Received: by 2002:a50:9918:: with SMTP id k24mr24693263edb.173.1562671004841;
        Tue, 09 Jul 2019 04:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562671004; cv=none;
        d=google.com; s=arc-20160816;
        b=0E7IEXlrxrSzpY4iwqIc8x6TNaMiOSuBZDlyaIwe9NvAoh2RrP5mkVEZZPtNUsDxoW
         GffyCwGtYzExD41EpcErdvxRnSYzw4jaoFCjkHdNK6fLMP/kZVMkVPq5mLpRR3u9VZ/k
         ZlC0kWGF/P/sKuQENRxWh4U6zvEfuGwBTP1HSuJyIbdDZNbR8ERDPtUF8E+LIxbSdYr8
         4f3LYKOgAKp5GJPL1PQ0rcakPjN5G+KQbNnMv94E8fyQ7YdoUy62/WL0xhW1ZeDZqtGh
         s3KOUNQQCyH7BrIFkUEVT9Tup/HyI3SC3l85sQyRir6/oLpfcZKSEiT44FFrch7iZN0k
         /M7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=DjSx+iSjEhholteWx+ERsVBywEY9c+r6bXoJKHrx5q0=;
        b=b3ElnuFgq/E4oCfoUm7S8katNXXC3uKFApJ6a6wJv24GsPpHtCX3GobtpN+B32Q1yf
         jX6wgs7x1YIOPULAXaunVhTPK3sxpmeECcBvjltF+HPB+LKTXkHVuLXY4md4PfHQaWiQ
         OWY9Oncpz98MJaTCZ0W+rBPrdejqbiAuBBKxBRk+nxGxbWT/8J87zCk7dAXHPgb6A0iw
         +NNCJXYoE4Js5y8Mt91Trkgbqjls/TDjQVI3zI4pD/I+Z/Olu21yj9x0Isg33tsyhejy
         7Ind5FJIpJlG9WvBZyQUclZma9cgNOz1rNB1Rx+F5cChxQRh9LRqJuwTgOHYaOUM6VOI
         xtOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=POuQmkAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w41si9482782eda.9.2019.07.09.04.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 04:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=POuQmkAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hko70-0006j3-BW
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 07:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41811)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hko5u-0006i2-LQ
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:15:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hko5t-0003iy-Pz
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:15:34 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hko5t-0003ha-Kg
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:15:33 -0400
Received: by mail-oi1-x243.google.com with SMTP id e189so15001743oib.11
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2019 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DjSx+iSjEhholteWx+ERsVBywEY9c+r6bXoJKHrx5q0=;
 b=POuQmkAZWq7FDHrmP3MFDr1AcbBO9g+l0CxsuklTXuTkfJoLzF5PkihXFYeXsXsKZu
 rBpkcWIkuiNpNkzyODCxdEdNeyYHPBHH6pbZZt3HRj2OZ4v10i614139BxPAnVR8/TB4
 FqN7Ok+OL5DCn2PakkoMAifU2nXd4WV/30ZFPSMaxyAKituZRUYAHRCZEEcvnCsFyZNc
 e49cDto4NLqjEFNL9eecsyEYFq6eI6PMx7QNgn1drILQNZZXhJejOQJ5jv8RCfGp1v6g
 nRlqW0lS+nD2eff9BhzqSonu367nmZ62+cPViTuCX6b4vFSzP6R4Vsd004Khctn6Dub+
 Bk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DjSx+iSjEhholteWx+ERsVBywEY9c+r6bXoJKHrx5q0=;
 b=lWeJOgZXnPPW058GjsdBUDgBiEzo2tH/UTQrT559gbqvAyPjeAnt5zO9WQsnIIz+mN
 oR6bMna9OFSG4biN6BTpe4oOqMDexGesA4YvNNfG8zB3PaQ6kNvNooE0oqUW0Cxk4Sei
 aSIYHoylcgNMHmAtUtrEyJlfpwmt1QiLxUhtex5JKi3EeoV/0KX2Rd7M4JPL56p7PTua
 84Ef9AvNWJTbZU2jHc9F+B2CGC1UYhS/40JE1RMTtP6curuu0t/W0ymEdtDwyLYS6Dwq
 Rs10ba+kUMDXoy2iog4lBuWiHZeZOO9RR/36qMfWS10ays1z9HAy3cjp/oRNeTfxVqb1
 gF1A==
X-Gm-Message-State: APjAAAXCDpOY1aW2otR6P9zKicXK9c48BzD+cs6WzI5Ruu3tHjf4ryvm
 B2T2Q1ZqydTdcOxTfWUoHjfDP94u9ErZQKFjVtee5A==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr1298906oie.48.1562670932806; 
 Tue, 09 Jul 2019 04:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190708104750.1071-1-philmd@redhat.com>
 <20190708104750.1071-4-philmd@redhat.com>
 <20190708142622.k4s5oknmzzj4brxd@fralle-msi>
 <41f075ef-9b80-cb66-0fb1-d03079cd93a4@redhat.com>
 <20190708160335.u3zamevyrbnx6nvb@fralle-msi>
 <19334c43-22eb-8476-4f6b-59f5ca347958@redhat.com>
In-Reply-To: <19334c43-22eb-8476-4f6b-59f5ca347958@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2019 12:15:22 +0100
Message-ID: <CAFEAcA_tZdi88aV6z73eJ8pyPMQdh_DRXQNUdxde2Xx5PhpqGA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH-for-4.1 v5 3/3] hw/ssi/xilinx_spips: Avoid
 out-of-bound access to lqspi_buf[]
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
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /z8VRDrmG/na

On Tue, 9 Jul 2019 at 11:58, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Are you OK to take this series via your ARM tree?
>
> If so, do you want me to respin fixing the comment and adding Francisco
> tags?

Yes, and yes please.

thanks
-- PMM
