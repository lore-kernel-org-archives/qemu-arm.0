Received: by 10.25.44.15 with SMTP id s15csp195455lfs;
        Tue, 11 Jul 2017 18:53:16 -0700 (PDT)
X-Received: by 10.237.41.38 with SMTP id s35mr1600347qtd.199.1499824396568;
        Tue, 11 Jul 2017 18:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499824396; cv=none;
        d=google.com; s=arc-20160816;
        b=GsbXjO/kch4emXf16FoS4o/+MXGw1OgY28OYw6HtOL1h5kFVo2X/CV4RIVRGkJM0PE
         ImmT7o66/2Klq/zSDXF5rxz5x19L1mtOrUd4xwLO+TDt4LwL7Wk5wnVJcsN4LgRy/xTT
         GNgo7cO7Mm4qLSaEnLx5Ah9aHv+Xo0hoEM81geXB2BCnIa58g4r8KUXEdK1bq1emHDPZ
         yEOmyL4kMo99hPsP0mMCKV+wS5A3IWvZKBOrQhxqlU8oHmmbyqBPgPhmNXc+uiXg93va
         lrIQmT6C7VnP2jNokQXHqDIsAM1A3GA3Z0b+ygasYmNif7hwQ2g7ZtqYGz/Wv3A+vpKQ
         fb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=bTWZsivdikyRonKT82lFT7mi197OyMIy6fgUz13ieMo=;
        b=eBul5mYh0nI1zllJDXohyix+wNB0/sfok8QHo1t2gov/Hv/utwR9p/vvGfPUNWBQeF
         5/PtUhqL17sTB+Xo9duQh6S7mv17F5tYsoFomP94IVEaOQIOZ3IPTwSCF/RGG47Lc+rI
         AIge0zDBboOVgTTKplnGsFA1vWWWBGw34mxGeBpWcGyzXQiKreozGgNct52pe+uEwsp6
         e6N3HSjd1lIaTDbraQacFzSXI5w9UZZ8vDWk3YPSZm9jZncTyNQWp7JSXdRgmLpiObHc
         IvqIUTnoy3QQ+ocGj1sRskOQQCIf2hixYHzlKM4xN80e73UqMcNZgu0NsTlL9F3IXp4O
         psQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k1si929475qkf.266.2017.07.11.18.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 18:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dV6q1-0007YD-Ao
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 21:53:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dV6pw-0007X0-Pn
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 21:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dV6pw-0002PU-0i
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 21:53:08 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4466)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dV6pr-0002NN-3O; Tue, 11 Jul 2017 21:53:03 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARX37670; Wed, 12 Jul 2017 09:52:52 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML402-HUB.china.huawei.com
	(10.3.17.38) with Microsoft SMTP Server id 14.3.301.0; Wed, 12 Jul 2017
	09:52:43 +0800
To: Eric Blake <eblake@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <1499755579-31262-1-git-send-email-gengdongjiu@huawei.com>
	<366f019e-50e8-03f4-9b8f-946ef318ca79@redhat.com>
	<d18b0a8d-5c34-ae4a-a60c-c451c8df9872@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <3dfd142e-1d2d-145c-5975-482151653d95@huawei.com>
Date: Wed, 12 Jul 2017 09:52:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <d18b0a8d-5c34-ae4a-a60c-c451c8df9872@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.596580F4.00A1, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f92bfa793dc96e3fd157826e94d25365
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-arm] [PATCH resend v4 0/3] Generate APEI GHES table and
 dynamically record CPER
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Wuquanming <wuquanming@huawei.com>, "famz@redhat.com" <famz@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Huangshaoyu <huangshaoyu@huawei.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"Zhengqiang \(turing\)" <zhengqiang10@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /rrN5WqFUT4/

Eric,
  I have submitted patch version 5 to fix the issue that you are concerned, hope you can have a review this series of patches, thanks.

Result: 250 2.6.0 <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com> [InternalId=34134279] Queued mail for delivery
Result: 250 2.6.0 <1499825297-20335-2-git-send-email-gengdongjiu@huawei.com> [InternalId=34134285] Queued mail for delivery
Result: 250 2.6.0 <1499825297-20335-3-git-send-email-gengdongjiu@huawei.com> [InternalId=34134289] Queued mail for delivery
Result: 250 2.6.0 <1499825297-20335-4-git-send-email-gengdongjiu@huawei.com> [InternalId=34134294] Queued mail for delivery



On 2017/7/11 21:58, Eric Blake wrote:
> On 07/11/2017 08:43 AM, Laszlo Ersek wrote:
>> So send the patches with
>>
>>   git send-email *.patch
>>
>> or put all the patches into a temporary directory, and run
>>
>>   git send-email patch-dir/
> 
> Or you can even skip patch files, and directly send things with one lass
> chance in your editor:
> 
> git send-email -v5 -3 --annotate --cover-letter
> 
> [send the top three commits in my current git branch as a version 5
> patch series, where I get to write the cover letter and tweak any of the
> patches in my preferred $EDITOR before sending anything]
> 

