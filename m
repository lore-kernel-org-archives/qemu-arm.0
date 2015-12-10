Received: by 10.182.158.201 with SMTP id ww9csp508042obb;
        Thu, 10 Dec 2015 06:17:01 -0800 (PST)
X-Received: by 10.140.251.212 with SMTP id w203mr7120606qhc.25.1449757021021;
        Thu, 10 Dec 2015 06:17:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f16si14963880qgd.120.2015.12.10.06.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 06:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a721k-0008Im-JS
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 09:17:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a721e-0008IA-3V
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 09:16:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a721Y-0001RA-Ic
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 09:16:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a721Y-0001R6-Dw; Thu, 10 Dec 2015 09:16:48 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E6BACA2032;
	Thu, 10 Dec 2015 14:16:47 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAEGb2n027005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 10 Dec 2015 09:16:41 -0500
To: Marcel Apfelbaum <marcel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
	<566962E3.4000409@gmail.com> <878u52fpn1.fsf@blackfin.pond.sub.org>
	<56698521.3040707@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56698945.2070709@redhat.com>
Date: Thu, 10 Dec 2015 15:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56698521.3040707@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Use error_fatal to simplify
 obvious fatal errors
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
X-TUID: 0vt/O/Mu1o05



On 10/12/2015 14:58, Marcel Apfelbaum wrote:
> My point is, now we *could* have a guarantee that if anyone uses the old
> way, we can catch it in time. It can be easily lost in the review process.

The right way to do that would be in scripts/checkpatch.pl, by catching
error_report_err followed by exit.

Paolo
