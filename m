Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2631092wrt;
        Mon, 17 Dec 2018 07:33:47 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UkkNQW/oquxuxy7oPRtyX5HTZckSgt4oWbgbo7ct2zbRcaBzUqK0FoyhPBysVc/ev9JIp4
X-Received: by 2002:a0c:b786:: with SMTP id l6mr13790047qve.244.1545060827472;
        Mon, 17 Dec 2018 07:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545060827; cv=none;
        d=google.com; s=arc-20160816;
        b=0uN8zlwnBunyHZPTh94u2Rnau7zhTqDQ3Wx+02tlM4NNaDX2c9E9weVSEHb5df43qf
         7mxWA/ndiIkvAJttgQnAWppkFd49srC/dOjwDFls68am6eirJg7HJXWJnDgEmdVb/irx
         kZvgaVpngc82sbZ7mhEOJMed/1DXSqU9LUUjsjtAEXb5KXtf/4BFJfrFXYvASbLBVu6B
         gMLn8dTcojkuQLw4lbT5REKO4l+PHEyT+lz/lbvYx084lTb67ZsYKNq/dEHsZWxVkbUi
         pwv3xiK0pjabhjAYE5YHCvVOTj9AlHkFqba4M7DiL/WuS9Q0psFme2QhlAOsClhxAFdu
         SfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=c2FuJdv3Ey0+T0nWMNPoHj15aakHR3R1nglcGaWlGq8=;
        b=obFCGQlcFzvL2H39Vhlmdr1YGbyNZtJXqXjyuJ3Amu+4RxsC+ycIRufRG1Ib0T5pzq
         A5CDuZksJ4cZ2FaI5hScyLyM6F2jARzTLlue+1EQtCoFbUPWfcBkbSjK4CUXypmVdcdZ
         TT1MkfB8WPbYq3RpPcYfWSHAbO49Tk8QIgndL0d1S/lLKpB9nlPeM0XdaSiVR7AKzYIH
         G0NJTthVGPYUqsEihjhYOeIMuXn6KnL/lXPWqiFwr+G0+4v/cK97XwyBEVj2XJJuChsp
         voULcfpylZE9BJE3vwt9E6i+QMRpllTicN6Qr7Vc5kRZg3zzjKHNcLQDRJm1KkxE9anD
         hLWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y58si2548456qta.312.2018.12.17.07.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 07:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYutv-0002Tf-15
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 10:33:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYutn-0002TW-Ho
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 10:33:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYutj-0004LH-Ju
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 10:33:39 -0500
Received: from mga09.intel.com ([134.134.136.24]:24075)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYutj-0004Ka-9V; Mon, 17 Dec 2018 10:33:35 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 07:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="119000898"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO caravaggio)
	([10.252.26.185])
	by orsmga002.jf.intel.com with ESMTP; 17 Dec 2018 07:33:24 -0800
Date: Mon, 17 Dec 2018 16:32:59 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181217153259.GE4456@caravaggio>
References: <20181217104838.18957-1-sameo@linux.intel.com>
	<20181217104838.18957-8-sameo@linux.intel.com>
	<20181217140611.GC4456@caravaggio>
	<20181217162547.696ce9de@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217162547.696ce9de@Igors-MacBook-Pro.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 7/8] hw: acpi: Export and
 share the ARM RSDP build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UhQMzqtB8m6U

On Mon, Dec 17, 2018 at 04:25:47PM +0100, Igor Mammedov wrote:
> On Mon, 17 Dec 2018 15:06:11 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > 
> > From: Samuel Ortiz <sameo@linux.intel.com>
> 
> Subject should be
>   [Qemu-devel] [PATCH v5 7/8] hw: acpi: Export and share the ARM RSDP build
>                       ^^^
> and without "Re: "
>
I did not realize it's ok to break a thread's topic/subject. Will
resend.

> > 
> > Now that build_rsdp() supports building both legacy and current RSDP
> > tables, we can move it to a generic folder (hw/acpi) and have the i386
> > ACPI code reuse it in order to reduce code duplication.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > 
> > V4 -> V5:
> >   * Fixed the 16 bytes padding comment.
> > 
> > ---
> [...]
> 
