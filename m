Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp909794wrg;
        Mon, 20 May 2019 20:17:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwSD4cXknlYalJ9VsQwmt0en+ykRlTUq2BygBdB6hwKcTPPPAgHHMbu0TSp+hzByNBoACY
X-Received: by 2002:a50:ed14:: with SMTP id j20mr80515923eds.84.1558408647373;
        Mon, 20 May 2019 20:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558408647; cv=none;
        d=google.com; s=arc-20160816;
        b=lfFjty51HzptHYiXpDBE2XdJJ0RqWtBAszD2fWPK+NkWmn4j5fD88WxG/DKDkC35FY
         t2Sl8mJMj5Lzytw3YlGFhxfe29ERxyWNNFrfFsbPUb4XO2k9SugVehXwWurchU6DMV3q
         76V2LwLgv+FmvZBdPkPHX3BcuU9wG9j/l/BTv01H+2EHRM3NxAjsvrSkj7XiSo2suSHk
         YKhNeNObVGOLVk4Znp95VYP7z7elXacgBR0SUO97dRgUQo46U6UcgL7HU8gMpWJ099UO
         mIl4sYtuJMMdCeQ3MQLrmXpSToJEoYCKlpf+jVUizJIBlJ3VtIGBM4xn5Wyyzzp18/B/
         0AkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=saX9gXLebCErQ+sG6jAW1iK5T6MGroxi/YntM52aSJk=;
        b=Aa+cDUi2cj9sKVAPXoSnCTSc/QimojswsS7Xo8ikXGuAhVCTRMdL+dQudEEKft8jXP
         sQl5NY4l3LMU1nx5CmDsuJdeAQxOFEWwTHVvDnypMgn1JaEOWPEBx0aiPmVsFEiLWzca
         AiNFwiEmegVDWKO/WqyvOmCtfNFoWmNmW3Z0E8y5DyCCgMq4VN/6ijjqygGvYSjY77e3
         JXdHKH97b7Zapeif0yNeNMbwRz357KZ8JYWBYImxR90KzGWRWo2xD4OueZMPoNlmWWvW
         CmtGYVOsGPxDJxibnEbK5nK4HAS/Srr7oZLNdQXVh+2NgDJECGLUINmlwHhmbOiOLfPK
         +F0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si1064939edy.37.2019.05.20.20.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 20:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSvHK-0002MN-ER
	for alex.bennee@linaro.org; Mon, 20 May 2019 23:17:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSvHB-0002M6-BU
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:17:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSvHA-0005TJ-AZ
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:17:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:34794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSvHA-0005RS-35; Mon, 20 May 2019 23:17:16 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 20:17:14 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 20 May 2019 20:17:12 -0700
Date: Tue, 21 May 2019 11:16:42 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190521031642.GA25337@richard>
References: <20190520005957.6953-1-richardw.yang@linux.intel.com>
	<20190520185508-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520185508-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [PATCH v5 0/6] Extract build_mcfg
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wT/KWpuYrhxg

On Mon, May 20, 2019 at 06:55:53PM -0400, Michael S. Tsirkin wrote:
>On Mon, May 20, 2019 at 08:59:51AM +0800, Wei Yang wrote:
>> This patch set tries to generalize MCFG table build process. And it is
>> based on one un-merged patch from Igor, which is included in this serials.
>> 
>> v4->v5:
>>     * ACPI_PCI depends on both ACPI and PCI
>>     * rebase on latest master, adjust arm Kconfig
>>     * miss the reserved[8] of MCFG, add it back
>>     * make sure bios-tables-test all OK
>
>So I am merging 1-4 now - they are unchanged from previous iterations.
>You just need to repost 5-6.
>

Sure, I would repost 5-6.

-- 
Wei Yang
Help you, Help me
