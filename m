Received: by 10.223.172.38 with SMTP id v35csp3791622wrc;
        Tue, 26 Sep 2017 09:52:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD3lxFKQHJhRD0Pimgj4SgK4/iDFNNpxbUanjhEAYNYBx97/bEB0Ry4PIC8QOLIJAceFViU
X-Received: by 10.200.3.14 with SMTP id q14mr17475015qtg.336.1506444748828;
        Tue, 26 Sep 2017 09:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506444748; cv=none;
        d=google.com; s=arc-20160816;
        b=tUBTteJq/mD4fQlwdAWAga6/Hykkmbuho1+TkiW5tjndMs3GRH+v1HDnqDXNpSwuQN
         w5wdOZmsZj7QfdF/5L1mev/fXCt8j0dCAPpJTZJsi+5f2pdIoqlE4g1gYYsVqq5aM6n3
         VK7Q+8prBIrjn1yBpwpolphAlxFhJuNfLGuaduAYlsz8XI3PhdKHIGBpIZz7RRLgXRUQ
         kBeaYcOgiCPWsmTI5KUQxXXats7YLZ8adrWd3PrtdDV8oZXPKr+sv/h3s9CveSZjZ0lb
         sutZTo0wlXqd31k1gMHVdLtngBPL4P4Cd3OIlJXvuJ5cvhuXJ+DWRrhBXhzOW0p+wghF
         ombQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=l2gnO2mtbmMxraHyAsjs0ucZwursqYElGc2+YvNXVlE=;
        b=Skng5aO3n9kRrPQyJeatigRpMaECwO1n63MeWdntNwTECwevKG3SuBv5igRLDKUrgQ
         /LtM4x7YH9jnpyTMebO7/rtuMMnVIhG/Czg/CD7VN2Dyg+8GzdPsrcuSNWEPMhJ6AEKq
         zFNlCMalAkKRiMh6Tov3F+D/5FA7+IdAgrFfPOnPedL4CdhY3lQXIQ43mdGS1jQx2n8W
         d219lqMqm2yPivxtxyhkXoy+QsJvxD2jeptlZKJJAA1qg743CDWm0u2aOCzmaKkr3r7+
         l4rj78UFrmgRcf7RAS3ei9nL9FC4bbU7+QeTD4QkzaRaCjX8ZpgSN+IYClAmX/2+9POx
         D1AA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si4741957qtl.146.2017.09.26.09.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 09:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwt5u-0005CU-Iv
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 12:52:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwt5j-0005Aw-Lj
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 12:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwt5i-0001ng-Pq
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 12:52:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwt5i-0001mT-Jy; Tue, 26 Sep 2017 12:52:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86D685AFD9;
	Tue, 26 Sep 2017 16:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 86D685AFD9
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.52] (ovpn-116-52.ams2.redhat.com [10.36.116.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B24183C3;
	Tue, 26 Sep 2017 16:52:11 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
Date: Tue, 26 Sep 2017 18:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Sep 2017 16:52:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark the
 "xlnx, zynqmp" device with user_creatable = false
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kkFSr28AHx7X

On 26.09.2017 18:36, Alistair Francis wrote:
> On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>> The device uses serial_hds in its realize function and thus can't be
>> used twice. Apart from that, the comma in its name makes it quite hard
>> to use for the user anyway, since a comma is normally used to separate
>> the device name from its properties when using the "-device" parameter
>> or the "device_add" HMP command.
>=20
> Is it worth changing the name now then as well?

Not sure, was there a reason for this name? E.g. is it used in a device
tree somewhere somehow? Anyway, with user_creatable =3D false, I think it
is not so urgent anymore to change it.

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>=20
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks!

 Thomas
