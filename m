Received: by 10.182.158.201 with SMTP id ww9csp602712obb;
        Thu, 10 Dec 2015 08:44:47 -0800 (PST)
X-Received: by 10.140.19.78 with SMTP id 72mr16522950qgg.81.1449765887383;
        Thu, 10 Dec 2015 08:44:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k110si15578124qge.44.2015.12.10.08.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 08:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a74Kl-0008Tj-08
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 11:44:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a74Kh-0008Ph-Ni
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 11:44:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a74Kc-0003gy-U4
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 11:44:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a74Kc-0003gp-Ju; Thu, 10 Dec 2015 11:44:38 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 0426CA10A4;
	Thu, 10 Dec 2015 16:44:38 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAGiYMY023639; Thu, 10 Dec 2015 11:44:35 -0500
Date: Thu, 10 Dec 2015 17:44:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20151210174430.69436013@igors-macbook-pro.local>
In-Reply-To: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "open
	list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/74] pc: acpi: convert DSDT to
 AML API and drop ASL templates support
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
X-TUID: iVKFne6AP6MI

forgot to mention
git tree for testing is available at:

git@github.com:imammedo/qemu.git drop_ASL_support_v1
or
https://github.com/imammedo/qemu/commits/drop_ASL_support_v1

and fixed-up series with fixed comments is at:

git@github.com:imammedo/qemu.git drop_ASL_support_wip
or
https://github.com/imammedo/qemu/commits/drop_ASL_support_wip
