Received: by 10.25.21.156 with SMTP id 28csp225468lfv;
        Fri, 12 Aug 2016 08:56:56 -0700 (PDT)
X-Received: by 10.237.34.65 with SMTP id o1mr18614375qtc.78.1471017416798;
        Fri, 12 Aug 2016 08:56:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si4983022qtd.134.2016.08.12.08.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 08:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYEpM-0005N3-4B
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 11:56:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bYEOW-0006Aw-Tq
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bYEOW-0004wi-1r
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:29:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bYEOP-0004to-FI; Fri, 12 Aug 2016 11:29:05 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAB407F7C6;
	Fri, 12 Aug 2016 15:29:04 +0000 (UTC)
Received: from [10.36.112.24] (ovpn-112-24.ams2.redhat.com [10.36.112.24])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7CExbiw032340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Aug 2016 10:59:38 -0400
To: Lv Zheng <lv.zheng@intel.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<f59fb42c320294fdf3e140aeaa6dd3aba95d837f.1470907810.git.lv.zheng@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <955fe680-3d7f-4dd9-1aae-55d812077be5@redhat.com>
Date: Fri, 12 Aug 2016 16:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <f59fb42c320294fdf3e140aeaa6dd3aba95d837f.1470907810.git.lv.zheng@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 12 Aug 2016 15:29:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow
 FADT revision changes
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Lv Zheng <zetalog@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PufGHcZnJWNo



On 11/08/2016 11:36, Lv Zheng wrote:
>  
> -    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
> +    val = qemu_opt_get((QemuOpts *)opts, "fadt");
> +    if (val) {
> +        unsigned long rev;

Don't use qemu_opt_get.  Add the field to AcpiTableOptions in
qapi-schema.json, and then use hdrs->has_fadt, hdrs->fadt.

Paolo
