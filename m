Received: by 10.25.0.23 with SMTP id 23csp2837329lfa;
        Thu, 8 Jun 2017 18:29:45 -0700 (PDT)
X-Received: by 10.55.137.69 with SMTP id l66mr10180958qkd.83.1496971785519;
        Thu, 08 Jun 2017 18:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496971785; cv=none;
        d=google.com; s=arc-20160816;
        b=kuQk/gBlDbXLAfxxOBgSNuhuOd8PcwX/qkGvz4FXbxYXd/ZSjQvySW7DDdrrr+tVbO
         oHCAwiESg27wyrJ3FRGl+z+ihwFZqvfpQPvWZJtT0hy9lJFYl2wdvT/qUJwptVY+zgz1
         XTWJib/CgNOuEt+Paie9WMEF5xZTXRKZiMsk1LQlr8L8hDuiiFJPxQb9Mmq7EgjBYFgz
         rAx9mvs6hCz1z6cAtFKjbXhdORCGxi3wHaAXKOyBR6MVoQLyE1PIzUT3Awzi6Cv5BwJF
         FRQvz8MOTpdL2/DK54oKps0UrrIs5BXIETM5K54SQ18GE0rmk3BeUSc4s3ReOdAptIes
         qCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=5v7lxR2JlHc0DE1LZ4ODOhJhMfAyUrE7nupbrFBTYxo=;
        b=Efn9WDgBvEEgJO4baxPH9lIK3gFNKEexAF8aEoZDmGJhSddqRdmIqkK2yOznGb0Lix
         K123aKzb2UEghP/4FPciomkUP2SFbAlSsY2VZGSNftFsIlbaGkp5gsijc0sQqI//RuGz
         Rxpqj1zhvsnaxIElAt1CIVh/xyFhXVjXzGvi0mWN6mreOtk/e6ZzEEhxtKe13WtVhZpK
         P2tIKJQeYrJ1NvhG9sAkTfiSeZpN670mI6zSAzHYY2XiAbjV3by9usLrV1LBXrXHfnlI
         w74BHtoF/d9i5MPcpwbktQQ9L9Ps/8hBbg2XooJ3K+J9LVHk8p1ibAgDDj1RlzNJ5KgY
         rrQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l68si6950017qkd.0.2017.06.08.18.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 18:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJ8kB-00028v-39
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 21:29:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dJ8k4-00028d-Qj
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 21:29:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dJ8k1-0002Pv-OA
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 21:29:36 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1dJ8k1-0002O9-Bx; Thu, 08 Jun 2017 21:29:33 -0400
Received: from 172.30.72.57 (EHLO dggeml405-hub.china.huawei.com)
	([172.30.72.57])
	by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id APB58475; Fri, 09 Jun 2017 09:29:14 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by dggeml405-hub.china.huawei.com
	(10.3.17.49) with Microsoft SMTP Server id 14.3.301.0; Fri, 9 Jun 2017
	09:29:03 +0800
Message-ID: <5939F9B2.5050708@huawei.com>
Date: Fri, 9 Jun 2017 09:28:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1492173995-14140-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.5939F9EA.0066, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8016f5489cc61b8b3a8dcc5c0d4e843a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.189
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 2/4] hw/intc/arm_gicv3_its:
 Implement state save/restore
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, Vijaya.Kumar@cavium.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zqHQc8Dd8FXm



On 2017/4/14 20:46, Eric Auger wrote:
[...]
> @@ -43,6 +50,7 @@ struct GICv3ITSState {
>  
>      /* Registers */
>      uint32_t ctlr;
> +    uint32_t iidr;
I think this should reset in gicv3_its_common_reset

Thanks,
-- 
Shannon

