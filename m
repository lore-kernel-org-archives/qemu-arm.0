Received: by 10.25.21.156 with SMTP id 28csp1471166lfv;
        Fri, 29 Jul 2016 11:12:15 -0700 (PDT)
X-Received: by 10.200.43.174 with SMTP id m43mr67868861qtm.74.1469815935862;
        Fri, 29 Jul 2016 11:12:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 93si7884525qks.112.2016.07.29.11.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 11:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bTCGd-00056Y-9Y
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 14:12:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bTCGX-00055F-5z
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 14:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bTCGW-0000Dz-4e
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 14:12:09 -0400
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:36382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bTCGW-0000Dn-02
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 14:12:08 -0400
Received: by mail-ua0-x229.google.com with SMTP id j59so67283442uaj.3
	for <qemu-arm@nongnu.org>; Fri, 29 Jul 2016 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/hihzHJ5Kh0xB+8NCcRxcGCcD3/ms+8T6dclnzQ6CBg=;
	b=Yqm5MCpEPSQunJJX6onzrsEHEacDVUt3dCCVCW4Sq2E6SEBGR/BbcJ9VZFkla0zmPS
	qRCK5n6XzLY0BdyLlbsLVDGDYNgfk9Jzu1m08etjzzBncKw1TJciNaSaY10pDX0opsZN
	68cZ8QVC7AgY+626WbsO2qxukvTvXfKKuigzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/hihzHJ5Kh0xB+8NCcRxcGCcD3/ms+8T6dclnzQ6CBg=;
	b=X6nO1IcTp6Vn54OM0imEOYI69ibw15ulSG6FaNd4TQ7vwWt66Kuj8wr//7ukbGKnoS
	FrWhF2kXA+1clr+ZMlbICxJzGTkjkIwi7KlV8PQtk1kLP1Id8AqBndBGPZfjqN1TSz/Z
	7T3AEdfJImiQtKD+kEWRqZDImHJXZJCE2ePRnOBDU4tqx5IayuctIqA/KoMH4cU5R2la
	B0u+WWNhsiA9njdRAgsISELNQSc2/2Y31dGoRagORoGU2rh8DqqYRQ3sPM3ar/fETXLu
	HC/Xy6WVty3nI5BbWdXbFY25HMGZXysGyIWeWMufWm8Fpz6CfXbA4k4k5EyBmj1qgriE
	5zGg==
X-Gm-Message-State: AEkooutQkh7P1yakcWve03a5Eel661JHQC7MQAk4i0O6/WZgRM/fxf2HVuY3eGzWJbaBeTBzfBP96NRfz/9cNgmb
X-Received: by 10.176.1.194 with SMTP id 60mr19133434ual.52.1469815927650;
	Fri, 29 Jul 2016 11:12:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 11:11:48 -0700 (PDT)
In-Reply-To: <eef1f2e11f704d4a86ee15143c333f21@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA-GZpj-Rb_zU4guGVsdAXYekQc+Yix0yfc8xCA9BtO=ZQ@mail.gmail.com>
	<eef1f2e11f704d4a86ee15143c333f21@nmail01.hynixad.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 19:11:48 +0100
Message-ID: <CAFEAcA85bo_P=cDVnw7HrqtBvfaZY9T_ODiko=vDKSaEnZmwxw@mail.gmail.com>
To: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-arm] [RFC PATCH 0/3] add nvdimm support on AArch64 virt
 platform
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOruCR247eyA

On 26 July 2016 at 07:32, kwangwoo.lee@sk.com <kwangwoo.lee@sk.com> wrote:
> NVDIMM stands for Non-Volatile DIMM which has DIMM form factor like PC-DIMM
> (Memory Module used in PC) and can be used like a memory, but the stored data
> is preserved on power failure. So it can be used as a memory, a storage, or
> backup memory on power failure.
>
> NVDIMM-N is already out in the market and Intel, HPE, and other companies
> actively developing related software. In Linux kernel, several usages exist
> like PMEM, BLK-aperture, and mixed mode. They are actively under developing.
>
> In QEMU, NVDIMM has been emulated on i386 platform. My patch series tries to
> enable the environment in AArch64 platform. Related Linux kernel patches were
> posted into the mailing list and they are under review/revise process currently.

Thanks. I think I've now made my comments on this series (mostly
pretty minor ones). I'd appreciate it if QEMU devs with knowledge about
the NVDIMM emulation code we already have did a review pass on the
code as well...

-- PMM
