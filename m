Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6288608wrv;
        Wed, 31 Jul 2019 18:17:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9/v2YZXuij0HFdgYBz4jc1+2Rxm21OOEh6qmZvLHBRFFdO+HhcUkiwnj2jJK/AjZG6LgV
X-Received: by 2002:a0c:8695:: with SMTP id 21mr91565935qvf.166.1564622231354;
        Wed, 31 Jul 2019 18:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564622231; cv=none;
        d=google.com; s=arc-20160816;
        b=XeRWYWXWwpkjteKNzENLAmtzzIsNs9ArcKLCWn5n9MlaYE+knZDz1f0e+zGu3pUtZu
         l21hawbm7s75DxZTTJ5Toh4Vb9Uhx401m/ZxGxc6H+TMZ0icn4zPrU8MXDCHqzfwV9j+
         zi0sF7H3H7FuMONpdeEE/JuxjdKCyHptvaZY3qDOKtTNJZ9FNRb9vI7IShOF1FBMUhsY
         zLOKHQtVW9hhjRliSQSWEXv7q4ksXXhBiAikhlXq872zpXKsG1HhX+oYR97EJcxpuX1Y
         l/mb255EfgYU98YJElNDv+/dComrh25md3xEalW5yASuiKRK7IrbzzranToTngDIiuik
         eZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=CxVAF7zVW0awDxC0sf8CyN7SN/LjlmbfxWO9LE8a4G4=;
        b=kTEK6X6Otjb+NgmWxd1af6y+lFFh4T179A6BX/+5/i4nuYOcFKJs/TyS2m5U4Wy6mn
         6kEVyeMqUa6S2IO/ZYlLzM45vHa6aH6fyfeTIWLeWduVp6sl2/yeWqrBO/j94vDzGXmg
         69jr0BfS7gwT7G4d+2eZG/+wDb0PV/QCtq3VLh2e27HSBMBPhiJsHgHlAqoaFmGKBvRn
         TcgxZP+ARqQgmZ9ZrBsswv4rbLMBC8vkBeonwqMf5uXDOg9GitX4lY0fsjyaMh1MLp6e
         OZ3aW7MXKEAnfs1UfN3P8ll+VQ4zC155YPwImihkAba+Xq8EU1d8iFk140uqq+6s7EQk
         e8DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 39si24606037qtr.30.2019.07.31.18.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 18:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsziQ-0000GZ-VM
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 21:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hszhi-0008CU-6i
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 21:16:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hszhh-0001Cs-C7
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 21:16:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:32388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>)
 id 1hszhd-00018Z-2C; Wed, 31 Jul 2019 21:16:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 18:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,332,1559545200"; d="scan'208";a="180500643"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.216])
 ([10.239.196.216])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2019 18:16:09 -0700
To: Daniel Black <daniel@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190731084034.9498-1-daniel@linux.ibm.com>
 <20190731191740.58e474cc@volution.fritz.box>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <6d42f8c2-17c1-b172-a670-0a506cfc1ec2@intel.com>
Date: Thu, 1 Aug 2019 09:16:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731191740.58e474cc@volution.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [PATCH] numa: numa nodeid need not be sequential
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:sPAPR" <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mI423U9GbXp/

On 7/31/2019 5:17 PM, Daniel Black wrote:
> 
> 
> On Wed, 31 Jul 2019 18:40:33 +1000
> Daniel Black <daniel@linux.ibm.com> wrote:
> 
>> Replace all nodeid assumptions with lookups in the numa_info array
> 
> Tao Xu,
> 
> Sorry, only just noticed your patches of the move of numa_info and other
> elements into MachineState. I approve of it. Lets see if I can follow
> all of Igor's comments there too.
> 
> I'll be up for a V2 once merged.
> 
> Cheers,
> 
> Daniel
> 
OK, Thanks
