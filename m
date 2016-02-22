Received: by 10.25.208.211 with SMTP id h202csp1211022lfg;
        Mon, 22 Feb 2016 06:27:10 -0800 (PST)
X-Received: by 10.140.143.134 with SMTP id 128mr2229701qhp.25.1456151226600;
        Mon, 22 Feb 2016 06:27:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si29662616qhv.74.2016.02.22.06.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 06:27:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXrS6-0003LR-1Y
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 09:27:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aXrS3-0003Kp-2A
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 09:27:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aXrRz-00059w-4B
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 09:27:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aXrRy-00059Z-Uv; Mon, 22 Feb 2016 09:26:59 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 597F4C00F1CC;
	Mon, 22 Feb 2016 14:26:58 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1MEQvdR023050; Mon, 22 Feb 2016 09:26:57 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 341E082273; Mon, 22 Feb 2016 15:26:56 +0100 (CET)
Message-ID: <1456151216.29896.63.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 22 Feb 2016 15:26:56 +0100
In-Reply-To: <1456144729-17196-1-git-send-email-mst@redhat.com>
References: <1456144729-17196-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, Kevin
	O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC] fw-cfg: support writeable
	blobs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B6qb/FWUz5kX

On Mo, 2016-02-22 at 14:41 +0200, Michael S. Tsirkin wrote:
> Useful to send guest data back to QEMU.

Use case?

cheers,
  Gerd

