Received: by 10.25.208.211 with SMTP id h202csp789785lfg;
        Thu, 17 Mar 2016 20:16:40 -0700 (PDT)
X-Received: by 10.140.164.71 with SMTP id k68mr20069956qhk.97.1458271000141;
        Thu, 17 Mar 2016 20:16:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u81si10521785qhu.105.2016.03.17.20.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 20:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agktz-0007RI-Jj
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 23:16:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1agktx-0007RC-45
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1agktt-0005si-Uc
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:16:37 -0400
Received: from m12-12.163.com ([220.181.12.12]:41517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1agkts-0005s5-2u; Thu, 17 Mar 2016 23:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BHLV8
	zszfkYqGhpaejhsCOOh+3SK8rMyNCkbxmRLeWI=; b=JA59Si2DGYxMFp08FG/Mh
	W2hSiVZSbWVarDgFsxOMHCZYr016NjySjklCa+sqY+aFF5FKU+5fcjPFsL/frm1o
	sq5AxeMFRgc7iJEsQ6cfJexpDz48M1+0Wu1YwjMqyp6ve+g/TRz2SIR754N0fFnM
	jVBnYH0z2c3jivCGq1iADs=
Received: from [192.168.31.184] (unknown [101.254.142.162])
	by smtp8 (Coremail) with SMTP id DMCowAD3fD7vcutW9EcnAw--.33665S2;
	Fri, 18 Mar 2016 11:16:00 +0800 (CST)
To: michael@walle.cc
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
	<1456110933-5457-7-git-send-email-zxq_yx_007@163.com>
	<39ff92b233b0756e8fa631210d85c437@walle.cc>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <56EB72A5.5040901@163.com>
Date: Fri, 18 Mar 2016 11:14:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <39ff92b233b0756e8fa631210d85c437@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAD3fD7vcutW9EcnAw--.33665S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF1UAFW7ZFWUWrykCF1Dtrb_yoWxurc_ur
	WvkFnI9w4Iqrs2gF15CF45Z3y5GFWaqrW8Xw17XFyfXa48XF4kuan8GrZ29ws2yrZayrs7
	Zr9rtryayry2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnWq2JUUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTBQwxlSIN9wJrAAAs8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, m.kozlov@samsung.com, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 6/9] hw/timer: QOM'ify
	milkymist_sysctl
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
X-TUID: nE1GFz2YCioo



在 2016年03月17日 23:03, michael@walle.cc 写道:
> [I had some problems with my mailserver and the v5 version didn't make 
> it through. I know there is a v5 version of this patch series and I've 
> tested with the v5 version]
>
> Am 2016-02-22 04:15, schrieb xiaoqiang zhao:
>> * split the old SysBus init function into an instance_init
>>   and a Device realize function
>> * use DeviceClass::realize instead of SysBusDeviceClass::init
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>
> Acked-by: Michael Walle <michael@walle.cc>
> Tested-by: Michael Walle <michael@walle.cc>
>
> -michael
>
Thanks, michael !

