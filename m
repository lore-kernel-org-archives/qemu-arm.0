Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5405239wre;
        Wed, 30 May 2018 19:13:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKImjj8W5ccA3cyPMBPyRpXu6Jfg4iS9i9HR3JzcFSMBVjNVTyHWJc6RtoLBxVnKT1gXzoSA
X-Received: by 2002:a0c:d6c1:: with SMTP id l1-v6mr4868885qvi.45.1527732786138;
        Wed, 30 May 2018 19:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527732786; cv=none;
        d=google.com; s=arc-20160816;
        b=ExWMrNviThbikUZeI3Xg6h3asIxndwRxm0bQxnZkY1WXKpDhulWk8Tn4vUdaPIHMZz
         OsQOKAjRjr8PeGjv/yV0/ggNpA71ov+cD42lMUpBIOf2ruHqYgTLpbr1kDJ5miF1xOb7
         ze8eUSOLXxpfmFXDZRLQ9eYI9QZnORKePX7vdozcMaXdT+KJN75zjSwUmDaK8ddt3IXK
         GpgdjRtcL1sc2S9s3WW5z+dVJRRtPli6NdAkKDzTpRmyqCwnE7kT77Kz8VQEuVFE6vbI
         LcAW+pY0oZ7rDqvjpQtHPYJUIOw6kVZzBF5uX4vcntUlc2PoicgMjJShVJD/nJGhwAZQ
         mN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=2ozjCOigz3XOccO+3njxECFVvWLAZvL79RXZFnzWpPY=;
        b=A7uuA582Ot0a1KJsRPaRVcoJJ4foTpjHqB3/3lhSI9nlXp2dFiSUTIoKWNoOjzsT83
         wizeo8+BjwWpdnyvXRzPnL1LTY9ez4FQ3pjnllWDa0T9ujXoTHQeL3L9KDx7pgpF80HK
         KsZwc8N2lPWRTBdrIBwQVm4ekCqg7Uh8NopUjNlibN5Yiq8dbXY3QWKUUhkwiO/VtZbj
         MefiA1WadxCUbrS4kt9KYt87f5zTBaIuD5P/waMiinPmrVqlR2WTEUDxwukzeWzr/4yt
         c0wmL9aG3NSmmP8JF7MwFtX2VWWXKzi86rzSXo1tQYh7s0fXdvItOwCni3DsB3eunsPX
         Y2pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=mail header.b=A3s3d9zP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81-v6si3125212qkp.244.2018.05.30.19.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 19:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=mail header.b=A3s3d9zP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:41572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOD5N-00070G-MI
	for alex.bennee@linaro.org; Wed, 30 May 2018 22:13:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1fOD55-0006zv-Jg
	for qemu-devel@nongnu.org; Wed, 30 May 2018 22:12:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1fOD52-0001eP-Dx
	for qemu-devel@nongnu.org; Wed, 30 May 2018 22:12:47 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:56009)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1fOD52-0001e7-87; Wed, 30 May 2018 22:12:44 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f1cdebc;
	Thu, 31 May 2018 02:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type:content-transfer-encoding; s=mail; bh=0RvOvKvCIggA
	6T/a4vhNiY2f+2g=; b=A3s3d9zPyVKv3wi0rIzNES/pSc9MpIidn0eSEsaHTlYl
	Rc2TSa81yISNOUW1eeqFIdRg+inauupRjBSH8TcrajxcC3xU6FFOf5AW6B/G7abR
	OZfMQCcyOoe4/kngMzsUvPnj0bqE25NGPLu7LeIcQA0SDyeeeZHJsxC9hazmjamc
	+TbhUxRc+oiX3MAeg0jnw7rIJ6R1c6C+AF3KefSVpIdButacl5VhYMuqFx4ysKuF
	bd9vwmNIiHWdrcG9b1xtFFOc7t21+wd/+EXj+u71NzrMdpUnBf2GLZnSDOfhO7Cm
	V7n8YDs/rbL2qDVUXMbG3JfzWBfPy+xbc0ZLEvF1NQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 72ea8d93
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 31 May 2018 02:09:17 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id t133-v6so14572819oif.10;
	Wed, 30 May 2018 19:12:41 -0700 (PDT)
X-Gm-Message-State: ALKqPwduXYe/FUZPtMY1ZExDW+LgHKjaFDYgyZSHDHgyM3UMkRkJwOK0
	7G5X2cvFiyLcBFXuDMor4N4/EyGkyhtyTTbIx2w=
X-Received: by 2002:aca:5250:: with SMTP id
	g77-v6mr3027783oib.241.1527732760791; 
	Wed, 30 May 2018 19:12:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:c606:0:0:0:0:0 with HTTP; Wed, 30 May 2018 19:12:40
	-0700 (PDT)
In-Reply-To: <CAFEAcA-t7XFxizUQMdo_JYTLet_a8ZL-Omg54gLOQC-=o+vjuA@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
	<CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
	<20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
	<CAFEAcA-t7XFxizUQMdo_JYTLet_a8ZL-Omg54gLOQC-=o+vjuA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 31 May 2018 04:12:40 +0200
X-Gmail-Original-Message-ID: <CAHmME9oda=T6C53BYi-Op3cWbG2auBjVDoUWuiJoCyxxR298fQ@mail.gmail.com>
Message-ID: <CAHmME9oda=T6C53BYi-Op3cWbG2auBjVDoUWuiJoCyxxR298fQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another UART to the
 virt board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CaqW8Ddbt9a

Hi Peter,

What ever became of this? I still really could use a second UART in
the standard configuration. I'm still building with this cludge --
https://=D7=90.cc/RXI3ssWV -- in order to run the test suite on
build.wireguard.com.

Thanks,
Jason
