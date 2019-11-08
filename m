Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2694631wri;
        Fri, 8 Nov 2019 07:27:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBHPKYVxzglZrc1pWlW1JPNxqjX07w+b3jQ4d0j4EHKUkAVdRxICXP7oPqNN7qYnGgXYUq
X-Received: by 2002:a05:620a:12cb:: with SMTP id e11mr9637127qkl.247.1573226864407;
        Fri, 08 Nov 2019 07:27:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z27si3946137qtb.171.2019.11.08.07.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2019 07:27:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YhdudGTZ;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iT6Ap-000689-En
	for alex.bennee@linaro.org; Fri, 08 Nov 2019 10:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iT6A6-00063r-Sa
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:26:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iT6A5-0000Y1-SA
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:26:58 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iT6A5-0000Xc-LN; Fri, 08 Nov 2019 10:26:57 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id F14F796EF0;
 Fri,  8 Nov 2019 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1573226814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpIN/FeyzyiDDM1leB4oCp2dWBwoukM1bFmAIRHkboo=;
 b=YhdudGTZ7b/C8StE2Vju8edQOZ/ER7xg+3RaUGEulbDofeR3uAkQkpVyRTpyTYzluX8pu7
 MqLpSCZSe6fyrcc5SvKAB1rkmYV4QpcYp9VRvd8K/un6iX5an1itRbuibCYQCcV3GFiHqg
 Z0KjfKZOjmQadjgiORr4SgcykMZvSC4=
Subject: Re: [PATCH v5 00/13] Multi-phase reset mechanism
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <efef625a-8162-5454-128f-489d636563a1@greensocs.com>
Message-ID: <aae84bfb-e735-0aac-124c-9abbdea882ff@greensocs.com>
Date: Fri, 8 Nov 2019 16:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <efef625a-8162-5454-128f-489d636563a1@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1573226814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpIN/FeyzyiDDM1leB4oCp2dWBwoukM1bFmAIRHkboo=;
 b=MZNeecKpiQBHeGE99mPwRtvLU5kq7e0bueNGwtlDAd9dgv/tOcAg2dTvkaRjH540mMpkmu
 6ZysBugfhxZ1brMCtGSn7ZiCytSGZuR3tpTPg6RT+m9khJ4xg/dml+FzmIxBNJiKitqWtF
 1VcYfeL+kFVCDC03leFQaXy95kyWKLw=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1573226814; a=rsa-sha256; cv=none;
 b=1R6gXKiwrLzQqyJIEeE1xBaSmW6FsFXNZnc0STfm/f0Nik06rroyxINPsbRfRR02XB/WT7
 pFtGz6HrOMDxKZ5UnNFyUU79D1cUu71397D2FCj6Mrcvx2GP5g1PJu6S4srdOhedfPy2kB
 LBoPIndMw+KxF36uD1ACwRcb7N+IoWs=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n0+HLIQOQSrI


On 10/29/19 4:53 PM, Damien Hedde wrote:
> Hi,
> 
> Does anyone has comment about the interface / patch 3 ?
> Should I try to split it ?

ping

> 
> Thanks,
> Damien
> 

Thanks,
Damien
