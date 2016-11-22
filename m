Received: by 10.25.150.194 with SMTP id y185csp2140796lfd;
        Tue, 22 Nov 2016 09:24:27 -0800 (PST)
X-Received: by 10.200.43.82 with SMTP id 18mr12076320qtv.63.1479835467039;
        Tue, 22 Nov 2016 09:24:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i24si16962164qkh.191.2016.11.22.09.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 09:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9Eny-000532-Ek
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 12:24:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c9Enr-00051G-It
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 12:24:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c9Eno-0008PU-Bp
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 12:24:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1c9Eno-0008P6-5D; Tue, 22 Nov 2016 12:24:16 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD4C931B331;
	Tue, 22 Nov 2016 17:24:14 +0000 (UTC)
Received: from [10.36.112.26] (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAMHOAu8028656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Nov 2016 12:24:12 -0500
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	"Alastair D'Silva" <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
Date: Tue, 22 Nov 2016 18:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 22 Nov 2016 17:24:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/4] qtest: Support named interrupts
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>, qemu-devel@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tabZaUppkjrm



On 22/11/2016 18:22, C=E9dric Le Goater wrote:
>> +
>> +        g_assert(words[1]); /* device */
>> +        g_assert(words[2]); /* gpio list */
>> +        g_assert(words[3]); /* gpio line in list */
>> +        g_assert(words[4]); /* level */
>> +        dev =3D DEVICE(object_resolve_path(words[1], NULL));
>> +        if (!dev) {
>> +            qtest_send_prefix(chr);
>> +            qtest_send(chr, "FAIL Unknown device\n");
>> +            return;
>> +        }
>> +
>> +        irq_num =3D atoi(words[3]);
>> +        level =3D atoi(words[4]);
>> +
>> +        QLIST_FOREACH(ngl, &dev->gpios, node) {
>> +            if (strcmp(words[2], ngl->name) =3D=3D 0 && ngl->num_in >=
 irq_num) {
>> +                irq =3D ngl->in[irq_num];
>> +            }
>> +        }
>> +
>> +        if (irq =3D=3D NULL) {
>> +            qtest_send_prefix(chr);
>> +            qtest_send(chr, "FAIL Unknown IRQ\n");
>> +            return;
>> +        }
>> +
>> +        qemu_set_irq(irq, level);

This seems wrong.  The IRQ should not be modifiable by the test.

Paolo

>> +
>> +        qtest_send_prefix(chr);
>> +        qtest_send(chr, "OK\n");
