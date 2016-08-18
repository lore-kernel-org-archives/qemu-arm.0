Received: by 10.25.21.156 with SMTP id 28csp329501lfv;
        Thu, 18 Aug 2016 06:53:17 -0700 (PDT)
X-Received: by 10.55.132.71 with SMTP id g68mr2632910qkd.50.1471528379961;
        Thu, 18 Aug 2016 06:52:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si1301852qkl.34.2016.08.18.06.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 06:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baNkh-00025k-90
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 09:52:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1baNka-00022M-DG
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 09:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1baNkU-0004Hd-Hm
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 09:52:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>)
	id 1baNkU-0004HF-Bj; Thu, 18 Aug 2016 09:52:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id CD88C61CCE; Thu, 18 Aug 2016 13:52:43 +0000 (UTC)
Received: from [10.228.68.89] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: okaya@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 52E5A61CC8;
	Thu, 18 Aug 2016 13:52:42 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>,
	Shanker Donthineni <shankerd@codeaurora.org>, qemu-arm
	<qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
	<f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <3fef4cd0-75df-0bb1-bd7d-dd6a966a05b1@codeaurora.org>
Date: Thu, 18 Aug 2016 09:52:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/vfio/platform: Add
 Qualcomm Technologies, Inc HIDMA device support
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
Cc: Philip Elcan <pelcan@codeaurora.org>, Alexander Graf <agraf@suse.de>,
	Vikram Sethi <vikrams@codeaurora.org>, Eric Auger <eric.auger@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kZOLRSWFn9P

On 8/18/2016 5:37 AM, Auger Eric wrote:
> Some general comments:
> - I preferred the previous series organization where we had the creation
> of the VFIO device first and its sysbus-fdt dynamic instantiation in a
> separate patch.
> 
> Peter requested sysbus-fdt stops growing and advised to split the fine
> into generic helpers and specific dt creation functions in separate
> files. This sounds the right moment to do it with looming new VFIO devices.
> 
> (*) Also I am now reconsidering the relevance of creating specific VFIO
> devices per compat string. At the begining of VFIO QEMU integration
> history we made that choice, advised by Alex (Graf), considering the
> QEMU VFIO device could not be generic. With a little more experience now
> we could see the specialization is currently done in the dt creation
> function (sysbus-fdt) and in the kernel reset module. So I would now
> advocate using a non abstract base VFIO device that could be
> instantiated passing its compat string as property. Creating
> hw/vfio/qcom-hidma.c and include/hw/vfio/vfio-qcom-hidma.h then would
> become useless. Alex, what is your feeling now?
> 
> I think the split of sysbus-fdt and (*) - if approoved -  shall be
> considered before introducing a new QEMU VFIO device. Are you willing to
> work on it?

I really like generic device approach. It would save a ton of burden from
developers.

If somebody needs a specialized device, they can do so. For simple objects
that just needs a compat string, it doesn't make sense to create a driver
every single time.

Similarly, there is generic PCI host driver in the Linux kernel that works
for systems that is CAM or ECAM compliant. If somebody needs to do more,
they can implement their own PCI host driver too. 

We are really looking for the same model.

I'm interested in virtualization of platform SATA and HIDMA devices. The
only difference between these are the compatible strings. 

Why submit a new SATA AHCI driver for QEMU just to set the compat string?

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
