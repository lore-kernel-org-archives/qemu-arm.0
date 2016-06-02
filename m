Received: by 10.25.27.66 with SMTP id b63csp909051lfb;
        Thu, 2 Jun 2016 13:46:49 -0700 (PDT)
X-Received: by 10.55.182.69 with SMTP id g66mr120843qkf.186.1464900409565;
        Thu, 02 Jun 2016 13:46:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184si349491qkd.178.2016.06.02.13.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 13:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8ZVx-0006ep-1f
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 16:46:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8ZUG-0005ex-Qe
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 16:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8ZUB-0003rI-Ml
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 16:45:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33689
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8ZUB-0003qA-H2
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 16:44:59 -0400
Received: from pps.filterd (m0075420.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u52KaKfW029022
	for <qemu-devel@nongnu.org>; Thu, 2 Jun 2016 16:44:58 -0400
Message-Id: <201606022044.u52KaKfW029022@mx0a-001b2d01.pphosted.com>
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23ang63sf7-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 02 Jun 2016 16:44:57 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <dahi@linux.vnet.ibm.com>;
	Thu, 2 Jun 2016 21:44:56 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 2 Jun 2016 21:44:53 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: dahi@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 687B12190046; 
	Thu,  2 Jun 2016 21:44:25 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u52KiqBr3014924; Thu, 2 Jun 2016 20:44:52 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u52KipZu016730; Thu, 2 Jun 2016 14:44:52 -0600
Received: from thinkpad-w530 (sig-9-84-66-226.evts.de.ibm.com [9.84.66.226])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u52Kipu9016719; Thu, 2 Jun 2016 14:44:51 -0600
Date: Thu, 2 Jun 2016 22:44:49 +0200
From: David Hildenbrand <dahi@linux.vnet.ibm.com>
To: Igor Mammedov <imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
Organization: IBM Deutschland GmbH
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060220-0008-0000-0000-0000028428CB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16060220-0009-0000-0000-000018919845
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=8
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1606020242
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ydM7zOTR3nzh

> Current CLI option -cpu cpux,features serves as template
> for all created cpus of type: cpux. However QEMU parses
> "features" every time it creates a cpu instance and applies
> them to it while doing parsing.
> 
> That doesn't work well with -device/device_add infrastructure
> as it has no idea about cpu specific hooks that's used for
> parsing "features".
> In order to make -device/device_add utilize "-cpu features"
> template convert it into a set of global properties, so that
> every new CPU created will have them applied automatically.
> 
> That also allows to parse features only once, instread of
> doing it for every CPU instance created.

While I think this makes sense for most cases, we (s390x) are
currently working on a mechanism to compare and baseline cpu models via
a qmp interface, to not have to replicate CPU models in libvirt
every time we do some changes.

To do that, we are creating temporary CPUs to handle the model
parsing. So, with our current prototype, we rely on the mechanism
to parse properties multiple time, as we are really creating
different CPUs.

While we could somehow change our mechanism I don't think this is
the right thing to do.

We will have to support heterogeneous cpu models (I think arm was one of
the guys requesting this if I'm not mistaking) and it somehow
contradicts to the general mechanism of device_add fully specifying
parameters. These would now be implicit parameters.

Would it be possible to do this for x86 only? Or find another way
to handle the "create just another ordinary CPU we already have"?

David

