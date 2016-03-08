Received: by 10.25.208.211 with SMTP id h202csp1888880lfg;
        Tue, 8 Mar 2016 04:03:11 -0800 (PST)
X-Received: by 10.55.71.195 with SMTP id u186mr35077352qka.38.1457438590361;
        Tue, 08 Mar 2016 04:03:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62si2615894qhc.132.2016.03.08.04.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 04:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adGM2-0007G8-03
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 07:03:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adGLv-0007Ek-GU
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:03:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adGLp-0003An-Mz
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:03:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1adGLp-0003Aj-I7; Tue, 08 Mar 2016 07:02:57 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id AC1F58E248;
	Tue,  8 Mar 2016 12:02:56 +0000 (UTC)
Received: from [10.36.112.26] (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u28C2r3p000441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Mar 2016 07:02:54 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56DEBF6A.6070809@redhat.com>
Date: Tue, 8 Mar 2016 13:02:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
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
X-TUID: /I+sz26RyqkC



On 08/03/2016 00:34, Peter Maydell wrote:
>> > I think that, if UEFI secure boot is in use, the UEFI environment
>> > variables should also be only accessible from TrustZone, because they
>> > store the key database.  At least that's how it works on x86, where both
>> > pflash devices have the secure=on flag.
> If I understand the setup that is being used correctly, UEFI runs
> in Non-secure, so making the second flash device secure would mean
> it could not access it.
> 
> Ard, do I have that right?

The part of UEFI that accesses variables can (optionally) be moved in
secure mode.  If you don't do that, secure boot is not secure at all.
Accesses from non-secure mode do the appropriate marshaling/unmarshaling
to call into the secure driver.

Again---that's what it does on x86, but restricting variable access to
the trusted base is an important part of UEFI secure boot.

Paolo
