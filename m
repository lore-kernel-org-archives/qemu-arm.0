Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp122164wrt;
        Tue, 19 Mar 2019 17:39:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz41cEOBTfVdE7roEO0RsB2kMz/HkkvHATln7lgoGJYzK7DFKtAiKXzTbMC971YCAJ/aIKY
X-Received: by 2002:a1c:3842:: with SMTP id f63mr5797704wma.25.1553042348208;
        Tue, 19 Mar 2019 17:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553042348; cv=none;
        d=google.com; s=arc-20160816;
        b=ivIOUS+GiZaovcVbQ6MRdExDAy5wQ85ypFuJVq+sdOW2NjaDzy8U3r4QPbgKTL2+xO
         tAPmkxuSJeOAQJ/C7MRwJgFS1vO/RGKc0gz9JH9beozTnN3tOqkxKhDpBoUy/OP+Q3Q7
         TpcMy0U/vBofOcWc8w9ojX0nPejXRxASp9PkLwvOhAA3zcTXk7IHxJINXzT0o8gIqnJh
         sZilPNlB1/B0VTLCbHbl5ymZzB4i738mFhp4/kA4prTzV2NX4kxPofmCrtvGN6A2AwyZ
         ikGgrt+gOxlYoy7GEWPKP1e/xVZqHZIKbksZSsVYFej71Za0yfL8vCKJr0qYOriKM/OY
         NGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=UjotxOSCo2TJK7LEdCzTjcyCICAexnP0escep4lW0Tc=;
        b=yFgtjipVGXH0BqOIzHf6xqsWQ4VELiSZQz3y8cdpi2AvBtSShw508xZBSsw4Ve5vkU
         fm8jdTS9jiOFUuByAi0aYQ8psVW4CuVPxDxpeESTojv1DksqF5cvPx95JEb0JphKb3X1
         +iDjlR8ZSE2FeynpJZRBQxkI5RTxh8BMS83fvrz6huCKnAb9cxwzflc0iK+myuuISZXy
         iSpW+hhsIRtF0R/sxYStjTR4u8N/Y4vnH22RfUM91RG3KHrgZ02aoKH11m8xeGZaMHvu
         vg8lm1Ba7vKz3GTv7ATt8e2Y97E7FBLiN8+dHXC2AWB9vHAICLyZ+5fiI7cajFxKHjNa
         +0KA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si144596wrv.219.2019.03.19.17.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Mar 2019 17:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:39633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6PG7-0007Yx-C0
	for alex.bennee@linaro.org; Tue, 19 Mar 2019 20:39:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h6PFz-0007Yr-Ni
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 20:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h6PFx-0004FK-4u
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 20:38:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:44479)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h6PEm-0003AZ-Io; Tue, 19 Mar 2019 20:38:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2019 17:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215676940"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 17:37:36 -0700
Date: Wed, 20 Mar 2019 08:37:14 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190320003714.GA11913@richard>
References: <20190315004432.3445-1-richardw.yang@linux.intel.com>
	<20190318133912.1c67a304@redhat.com>
	<20190319004523.GA5032@richard>
	<20190319100038.6263905f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319100038.6263905f@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-arm] [PATCH v3] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vmqXmsOCb/ge

On Tue, Mar 19, 2019 at 10:00:38AM +0100, Igor Mammedov wrote:
>On Tue, 19 Mar 2019 08:45:23 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> On Mon, Mar 18, 2019 at 01:39:12PM +0100, Igor Mammedov wrote:
>> >On Fri, 15 Mar 2019 08:44:32 +0800
>> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>> >
>> >in subject: s/extract/generalize/
>> >  
>> >> arm and i386 has almost the same function acpi_add_rom_blob(), except
>> >> giving different FWCfgCallback function.
>> >> 
>> >> This patch extract acpi_add_rom_blob() to utils.c by passing  
>> >             s/extract/moves/
>> >  
>> >> FWCfgCallback to it.
>> >> 
>> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>  
>> >
>> >otherwise patch looks fine to me,
>> >but checkpatch complains about comment style so that needs to be fixed as well
>> >  
>> 
>> BTW, the checkpatch also says
>> 
>>     WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> 
>> Do I need to fix this?
>yep, add me and Michael as maintainers for these new files.
>

It looks current statement already includes those files.

ACPI/SMBIOS
M: Michael S. Tsirkin <mst@redhat.com>
M: Igor Mammedov <imammedo@redhat.com>
S: Supported
F: include/hw/acpi/*
F: hw/acpi/*

-- 
Wei Yang
Help you, Help me
