Received: by 10.25.221.202 with SMTP id w71csp2157206lfi;
        Fri, 4 Aug 2017 07:38:31 -0700 (PDT)
X-Received: by 10.55.144.130 with SMTP id s124mr3411587qkd.136.1501857511400;
        Fri, 04 Aug 2017 07:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501857511; cv=none;
        d=google.com; s=arc-20160816;
        b=faFRBRdQjCtyqWLFvNw6IDchy7VEzKGn2v1E2SQ9nFkYOQ5t0+mfQcZRw558LkOsvK
         +mGA43i988s/0ksM8sqlCizm9HuKP8cpby89q8gs08yMTYQHKqpQuSf9IopqvgsCIGDP
         1o2nC5VOaQc3yHnOj4gIagO9h3uBY59EUElyRAREu76jF6h6fFD58nxV83ckGoGLlEIC
         B4y7IwmQJQbbBSuHdT/reKu09t0K1UsxxmAbODlY6DJyBL8abPmdvaHnoyFkulAZHYka
         OhUg52X3l1xukr6sygr5QKBh3E4Qr5xMmbrPaC9umG57JgyFWW84Wou4oX4b7rlorrD+
         4hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:references
         :message-id:content-transfer-encoding:date:in-reply-to:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=JhpQ0UkGfpG5nsytaphI+XNJO9zHKzVSD+eDsV/vxJg=;
        b=FizpnueXZSZJmKCtujm/OIqVVCYQD6TD/SdEiWF5RRdKl5DXHiNeVpPmP1HriyjHil
         9D5Sw/3ekpJbv6APr2b9zcv/aqhtba0uEtEYOPWc1Zau1pETijhOziCAXajdzwfSKBY0
         uV+6vG8RIDAv0kVf+6lkRGqqkg2xtGltJxNNYNF2sCj21s4oInlruZBB64+KszQE2Z9d
         FFZDB+c4I2No7oyi/fRqj0QY33WHrm5kwFvsumeABX4k+FA62XWqm3PFn+qNcA0SJpA/
         Rijq5yu6pgtkrY8OmAWoZVp3SLFpFWJIbY2kYDHCL5Qfu9IsXjO2UntOMJJ9qc7SpQQF
         xn7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GJs9H85p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si1778824qti.263.2017.08.04.07.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 07:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GJs9H85p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dddkC-0005gL-OT
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 10:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1dddhq-0003uD-8R
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 10:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1dddhd-0002y0-NU
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 10:36:02 -0400
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:38088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
	id 1dddgv-0002Fp-4L; Fri, 04 Aug 2017 10:35:05 -0400
Received: by mail-it0-x244.google.com with SMTP id h199so1191764ith.5;
	Fri, 04 Aug 2017 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JhpQ0UkGfpG5nsytaphI+XNJO9zHKzVSD+eDsV/vxJg=;
	b=GJs9H85pUhzYMolosjTyXFFapTt3mZrHP93XyvmmbMYizq9ShjLsXPPnqvsrGB5pKM
	jCHaiy4NZhTLc4N9NcJT4MxPOc5eg3GfBAaoiQHu9tHG5Gyt6Yn/KGqp8cP+uynWgGr1
	QR+oZaa2mX9VnD2/EWVzAbrl1rOEUIDTHN2IAn5OfalW3vPFMEwwb9WNmAkjIuIUX0nn
	PgrcgJNrTtwKOfWm3nfkz6M8fQR1EOsd3EEXQD6uStLLXNGqrAwZuojkOu/4+zfzmJiW
	M2/6B/CurR3pUeeNkSOTX88rYSSD+p4XhJftGw+WKPcDcGoO0ZF2owrSheJQLlvz8lM4
	0rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JhpQ0UkGfpG5nsytaphI+XNJO9zHKzVSD+eDsV/vxJg=;
	b=mg3g5+PGE98u31DjdvGKaGf+tSUOuUlbN1lpujvbHltwEKtFINIlxiFfDhyoifU/DJ
	ryUButUN/ZxnDsFA3cw6CcS2MQs/cVJFMU0BexyYs+fnGCsudzYLjMykG/MWntU2ahec
	1YpFwOKqv3ARJQ6Vrnz331KkywPdWuk0fJeYGHqFE8Hzzm6qrG5tJ651WGpYbtucL7hx
	fIQ+1f+i4sNyMkTGc7EjVR7dZ2JXNXsbCV2/Mm+OaLREJdLAqS0wdZFOGJCtrRMLgyHI
	p+qrYM9h2QGBoUfBoS2HFiGFmsDkosU+KStW/jt2WWDUYMaZkv57rraODkxgcuPTrDPM
	uA9w==
X-Gm-Message-State: AHYfb5jApGVL1N2T1StMvuqSf6vcVae3DCggplP1AQPvoLtMlWPt3CqY
	Dtkz6RGd7VIQKA==
X-Received: by 10.36.170.7 with SMTP id b7mr2410757itf.10.1501857302883;
	Fri, 04 Aug 2017 07:35:02 -0700 (PDT)
Received: from [192.168.0.7] (d199-74-164-53.col.wideopenwest.com.
	[74.199.53.164])
	by smtp.gmail.com with ESMTPSA id p95sm769782ioi.62.2017.08.04.07.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 07:35:02 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <mailman.88458.1501824151.22737.qemu-devel@nongnu.org>
Date: Fri, 4 Aug 2017 10:35:00 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <FCC900B9-6498-46D1-92C7-800BEBDE9350@gmail.com>
References: <mailman.88458.1501824151.22737.qemu-devel@nongnu.org>
To: Dongjiu Geng <gengdongjiu@huawei.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: [Qemu-devel] [PATCH v6 0/3] Generate APEI GHES table and
 dynamically record CPER
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
Cc: Peter Maydell <peter.maydell@linaro.org>, wuquanming@huawei.com,
	"Michael	S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org qemu-devel" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, Igor Mammedov <imammedo@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hVNz76KgWANU


> On Aug 4, 2017, at 1:22 AM, qemu-devel-request@nongnu.org wrote:
>=20
> Date: Fri, 4 Aug 2017 12:37:52 +0800
> From: Dongjiu Geng <gengdongjiu@huawei.com>
> To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
> 	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
> 	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
> Cc: <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
> 	<wuquanming@huawei.com>
> Subject: [Qemu-devel] [PATCH v6 0/3] Generate APEI GHES table and
> 	dynamically record CPER
> Message-ID: <1501821475-14647-1-git-send-email-gengdongjiu@huawei.com>
> Content-Type: text/plain
>=20
> In the armv8 platform, the mainly hardware error source are ARMv8
> SEA/SEI/GSIV. For the ARMv8 SEA/SEI, the KVM or host kernel will =
signal SIGBUS
> or use other interface to notify user space, such as Qemu. After Qemu =
gets
> the notification, it will record the CPER and inject the SEA/SEI to =
KVM. this
> series of patches will generate APEI table when guest OS boot up, and =
dynamically
> record CPER for the guest OS about the generic hardware errors, =
currently the
> userspace only handle the memory section hardware errors. Before Qemu =
record the
> CPER, it needs to check the ACK value written by the guest OS to avoid =
read-write
> race condition.
>=20
> Below is the APEI/GHESV2/CPER table layout, the max number of error =
soure is 11,
> which is classified by notification type, now only enable the SEA/SEI =
notification type
> error source.
>=20
>     etc/acpi/tables                               etc/hardware_errors
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        =
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>                                          +------------------+
> +----------------------------+            |    address       |         =
     +--------------+
> |    HEST                    +            |    registers     |         =
     | Error Status |
> + +--------------------------+            | +----------------+         =
     | Data Block 0 |
> | | GHES0                    | +--------->| |status_address0 =
|------------->| +------------+
> +--------------------------+ |          | +----------------+           =
   | |  CPER      |
> | | .................        | | +------->| |status_address1 =
|----------+   | |  CPER      |
> | | error_status_address     | | |        | +----------------+         =
 |   | |  ....      |
> | | .................        | | |        |  .............   |         =
 |   | |  CPER      |
> | | error_status_address-----+-+ |        +------------------+         =
 |   | +-+------------+
> | | .................        |   | +----->| =
|status_address10|--------+ |   | Error Status |
> | | read_ack_register--------+-+ | |      | +----------------+        =
| |   | Data Block 1 |
> | | read_ack_preserve        | +-+-+----->| |ack_address0    |--+     =
| +-->| +------------+
> | | read_ack_write           |   | |      | +----------------+  |     =
|     | |  CPER      |
> + +--------------------------+   | | +--->| |ack_address1    |--+-+   =
|     | |  CPER      |
> | | GHES1                    |   | | |    | +----------------+  | |   =
|     | |  ....      |
> + +--------------------------+   | | |    | | .............  |  | |   =
|     | |  CPER      |
> | | .................        |   | | |    | +----------------+  | |   =
|     +-+------------+
> | | error_status_address-----+---+ | | +->| |ack_address10   |--+-+-+ =
|     | |..........  |
> | | .................        |     | | |  | +----------------+  | | | =
|     | +------------+
> | | read_ack_register--------+-----+-+ |  | |      ack0      |<-+ | | =
|     | Error Status |
> | | read_ack_preserve        |     |   |  | +----------------+    | | =
|     | Data Block 10|
> | | read_ack_write           |     |   |  | |      ack1      |<---+ | =
+---->| +------------+
> + +--------------------------+     |   |  | +----------------+      |  =
     | |  CPER      |
> | | ...............          |     |   |  | |       ....     |      |  =
     | |  CPER      |
> + +--------------------------+     |   |  | +--------------+ |      |  =
     | |  ....      |
> | | GHES10                   |     |   |  | |      ack10     |<---- +  =
     | |  CPER      |
> + +--------------------------+     |   |  | +----------------+         =
     +-+------------+
> | | .................        |     |   |
> | | error_status_address-----+-----+   |
> | | .................        |         |
> | | read_ack_register--------+---------+
> | | read_ack_preserve        |
> | | read_ack_write           |
> + +--------------------------+


Excellent job with the ASCII drawing.=20

