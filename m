Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp328758wrg;
        Wed, 15 May 2019 01:47:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgaJWCOkkuC5ak0hJWwUQAWE0Y2wnUZxHKtmrCi3lzLz9ndTXENjlN7PV3u+e4gOJWXTdh
X-Received: by 2002:a05:6402:648:: with SMTP id u8mr41025978edx.176.1557910041218;
        Wed, 15 May 2019 01:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557910041; cv=none;
        d=google.com; s=arc-20160816;
        b=dDJAOnoqsbKsYlvAOcw7Zk/Zmy4t2Bw24WtqWlWnY2T5AuA55LhX5E09WGYtpiESH1
         i3EhREOIEXyHKFTHbtlk6Nz5fcaMbH5y1vk9KJwEZkPnHoqRZNhUKYlS4qGK5q/f7QTs
         5jkz9K31mDI/pZRZZGLGmtCS/SR6KAbnqRIsfnhBuFXusQopQukQK3CrX1wFWkPEU5SD
         RA/4fpwuXIS43BxjkwuvvRAQG8BpxJdSKu0T6MWIvM281xoYWJ3wEmKWrywl1xA/pOkE
         Ff0pV4m/ZAjlXNNUq8wTAwxsaU5DA7V/DX9wdFEzbTyo1ijVg0KJAifKihp7fjfJ2o79
         wF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=QQWRS+/yKLj6d13Gv2DvH6lZfSQqLEc6WllAoF/olGc=;
        b=eQeAAhquQBk1WpeM0G/xQ0I7lWVWZ2J5s0gOYRHmay1rOXEUNAKdmXP2rH8gCsvOyj
         ensBmjZqsHvoRYO1FQdyjNxaXY+RUFy79ZNRg/EfrqJ9eqgZ9HduuuMODiOVo6KHMUTM
         FRiCV/XXD24w6p4BU4FlGhAYU+QBu+pSpaPixw2I46j/aN6R4YaktZKPFoiYbJbTyPnX
         cSIpNNz5Da7tFvFyXgQpwxUPaxep/1IiTQkU2q7va2Kttf62n8lJdIFVaJB5mvWZ83Fk
         aVsyg3+Rb6MSG5CNAKdrM7McFZR9QwAZPevdAINQYiUyvC+TezzEIxgdilf2WJsnHISi
         Cbjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si958960ejk.332.2019.05.15.01.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 May 2019 01:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:33529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQpZG-0001ro-QH
	for alex.bennee@linaro.org; Wed, 15 May 2019 04:47:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQpZ3-0001rT-HI
	for qemu-arm@nongnu.org; Wed, 15 May 2019 04:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQpZ2-0007hE-MS
	for qemu-arm@nongnu.org; Wed, 15 May 2019 04:47:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:58716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hQpZ2-0007eA-ES; Wed, 15 May 2019 04:47:04 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 01:47:02 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga007.jf.intel.com with ESMTP; 15 May 2019 01:47:00 -0700
Date: Wed, 15 May 2019 16:46:29 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190515084629.GA31136@richard>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-7-richardw.yang@linux.intel.com>
	<20190514211015-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190514211015-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [PATCH v4 6/6] acpi: pci: use build_append_foo() API
 to construct MCFG
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1R8UCzSsPY6p

On Tue, May 14, 2019 at 09:10:34PM -0400, Michael S. Tsirkin wrote:
>On Fri, Apr 19, 2019 at 08:30:53AM +0800, Wei Yang wrote:
>> build_append_foo() API doesn't need explicit endianness conversions
>> which eliminates a source of errors and it makes build_mcfg() look like
>> declarative definition of MCFG table in ACPI spec, which makes it easy
>> to review.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
>Causes a regression with an invalid MCFG produced.
>Dropped.
>

Any more information about this regression? How to reproduce it?

-- 
Wei Yang
Help you, Help me
