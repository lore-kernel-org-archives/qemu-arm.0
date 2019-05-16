Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp315535wrg;
        Thu, 16 May 2019 00:41:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5lrx+8qkyrVsBmL4A1vgy+72gYO/ybz9DL3rQfNxCfvRm/0s2sLMaTDEpCGenFmIRTjqq
X-Received: by 2002:a50:fa90:: with SMTP id w16mr48065195edr.184.1557992517492;
        Thu, 16 May 2019 00:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557992517; cv=none;
        d=google.com; s=arc-20160816;
        b=HQIr7Kthz67s3HJxnY6JCdDHqDTcpRSC3Jo9Y0Tl1RAT7Mqi3JSUoIkiC1g2OnZPk6
         zSm7a33N/l49BArxpC5oR2IhL6AniDWytP2rYBTvXCg48PqDbMgXIHyLsc/o0U0PQFDX
         S4wX9AUnklOMHQsCsm54/Vdwdv4IYk93jhTvk09xmH+C5bAgVFXc7qFuRbxZN04FcsAA
         vXjAYsoMMrP7IIRtagou5s3A2Vl9BxD8L+jMB5xwt2U/HAsry59CByrE9WXfEjdpLVLH
         GIIveYfnWuGvT9bc6YgFajfUmC6/qn6Lla4O7RG8QVyZ0oHfAfmYp/aoN5cDHw3Qev0p
         zrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=vqfVYvMJnl9UvLHO9g2Yy2flwHB/FpkEofeDyUFy4hk=;
        b=CozuOm82dfqv/72zuwzg/gxZxzvlcFJSSbGIabBN8tcWYYw3v8VSjI1o7eYXwxlHvI
         OWrlXxApFywn2RgflvJcA43B8WHwUK+1MLKPsmKHQlU0BpiusHlxGO7oi4bdviiajx4X
         hbslD28obcXXMRCbl4R1y9hS7Bmk66YAAOZH3KZzG1eRVg0Vd3RKkXxa66tnzuupRWnK
         3wKA0ueFTgJDQZa1bCu4iSKLo7Q8xQW1dXnZng94uGCZE9rl1728rZnYdYmrycUpHus8
         thMeAzm/tcDUlVyh1tE3VEtLpZvJRco3PznT9LPAHJD11yjySCEDugQ3dLcNBZ/HcB9N
         ztRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si3037120ejb.160.2019.05.16.00.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 00:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:50165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRB1Y-0003Bf-KM
	for alex.bennee@linaro.org; Thu, 16 May 2019 03:41:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRB1Q-0003BV-C9
	for qemu-arm@nongnu.org; Thu, 16 May 2019 03:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRB1P-0001qN-EV
	for qemu-arm@nongnu.org; Thu, 16 May 2019 03:41:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:21552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hRB1P-0001nM-6h; Thu, 16 May 2019 03:41:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 00:41:44 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 16 May 2019 00:41:41 -0700
Date: Thu, 16 May 2019 15:41:10 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190516074110.GA11938@richard>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-7-richardw.yang@linux.intel.com>
	<20190514211015-mutt-send-email-mst@kernel.org>
	<d9d265e1-1052-9d8d-c749-5d1e5901f567@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9d265e1-1052-9d8d-c749-5d1e5901f567@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UBh4VSMBCQl6

On Wed, May 15, 2019 at 07:29:17AM +0200, Philippe Mathieu-Daudé wrote:
>
>Thanks Michael for testing...
>
>Wei, can you add a MCFG test in tests/bios-tables-test.c?
>

I took a look into the test, current q35 has already has a reference MCFG in 
tests/data/acpi/q35/MCFG.

And there would be a warning message when reserved[8] is missed.

    /x86_64/acpi/q35/bridge: acpi-test: Warning! MCFG mismatch.

Is this enough? Or what more information prefer to add?

>Regards,
>
>Phil.
>
>>> -    AcpiMcfgAllocation allocation[0];
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiTableMcfg AcpiTableMcfg;
>>> -
>>>  /*
>>>   * TCPA Description Table
>>>   *
>>> -- 
>>> 2.19.1

-- 
Wei Yang
Help you, Help me
