Received: by 10.25.27.66 with SMTP id b63csp673580lfb;
        Sat, 28 May 2016 07:13:10 -0700 (PDT)
X-Received: by 10.140.34.133 with SMTP id l5mr10253788qgl.28.1464444790413;
        Sat, 28 May 2016 07:13:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a190si21361741qke.146.2016.05.28.07.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 28 May 2016 07:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6ezF-00059W-R9
	for alex.bennee@linaro.org; Sat, 28 May 2016 10:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6ezB-00058V-UK
	for qemu-arm@nongnu.org; Sat, 28 May 2016 10:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6ez6-0002bk-Qo
	for qemu-arm@nongnu.org; Sat, 28 May 2016 10:13:05 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6ez6-0002bg-D6; Sat, 28 May 2016 10:13:00 -0400
Received: by mail-lf0-x241.google.com with SMTP id q63so1099177lfi.2;
	Sat, 28 May 2016 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BbBcbOlbQGxbjLiMbYAw8JbjYFvjeqIFtUX4SZgAnDE=;
	b=Ofhl4rlqHAQX8tLlsRbEO0LBgnxb91TR9m2q+JVpeEYiovVbgJMVGCsWuNigztXodE
	oMX05oVB5ASN+RriTV6wUaSlcjg8ybrpL/etg9cWM6UYGaJxCLjAAzyU/IoMg5EuV2kb
	48jmWjobI+QZLEoZe0Q16tFGRCUg+R5WdGpZ2iHjhdTMYaEBcNINTtALeQ2T9yKqViES
	ZFfwDjuON5hCLR3oX5Eo8olwb646UF+471MIheeClfsIe8iguG+Ob3EfrHzzu2n248F+
	+7IXrP/HABiRRqZmo6/fJXwWMid8LQK/q7yVGaBzZysQTeumpHr3/7jDcJV9qBXgJ94V
	ZmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BbBcbOlbQGxbjLiMbYAw8JbjYFvjeqIFtUX4SZgAnDE=;
	b=ky19/UKyYPWJEdnW30jd4/dIcWOcLKscvmOKvMNOyDW9srXJSHa2PDUBSlyRQsZ6KT
	A68Xa3EvhhLBtOnsjhfkR2MIeEr41YgaoSPLVUi/du7lLGWiaQs3SPTXTopGiGcEO+AN
	FhS3UwQx0tqIVih+VhegDxCdkXYw6BKNd0LJvEuEvroTt7t6UX362efKzGDf/7lH8B+1
	XZ+Z+ZF7TvcGvE8dUuBOXtSuXmsC66rwSy8bcsLQAqMI+GNn9kVfmxsbWx8udDikW1cH
	5CDCQ2T8SiH8mb9NLnIrFuD8/uzvG5rbAKeapYY0Vx7tIok6O8Ub/JsnzgAzrdWbPVQZ
	txtA==
X-Gm-Message-State: ALyK8tJ6M8WmuTTt/Kao/Ns0fpelQj0gR378AIYRaBkAG4cxLhAU4dzEYp2OaHk933K4lA==
X-Received: by 10.25.161.137 with SMTP id k131mr3685285lfe.101.1464444779644; 
	Sat, 28 May 2016 07:12:59 -0700 (PDT)
Received: from [192.168.1.145] ([109.252.52.1])
	by smtp.googlemail.com with ESMTPSA id
	63sm1227317lja.42.2016.05.28.07.12.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2016 07:12:58 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1464367869.git.digetx@gmail.com>
	<97318fe5bbe95202ca2d96e72a31c597a148ea77.1464367869.git.digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d357d9da-d2db-a8b0-0672-23f572ddf802@gmail.com>
Date: Sat, 28 May 2016 17:12:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <97318fe5bbe95202ca2d96e72a31c597a148ea77.1464367869.git.digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v13 6/8] hw/ptimer: Support running with
 counter = 0 by introducing new policy feature
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 70OmvW3SW2Or

Just a small note:

It's more like RFC. I don't think 8 bits would be enough for all possible 
policies and I don't know whether it is possible to maintain backward 
compatibility by keeping VMSD .minimum_version_id. "loadvm" refused to accept 
old ptimer VMState, I haven't looked at it much.

-- 
Dmitry
