Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp330837lfp;
        Tue, 28 Jan 2020 03:05:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxaUW3cKHpn6NJSJjmqybyzZbsCKmmZwX3NOXwaJw0G82XLLtcxLA0lwpjVjlRsjaO9TwDc
X-Received: by 2002:ae9:c318:: with SMTP id n24mr22334675qkg.38.1580209512985;
        Tue, 28 Jan 2020 03:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580209512; cv=none;
        d=google.com; s=arc-20160816;
        b=o/Z5eOHrfXjsST6vnJKP2VduHN0JI/kQ+gf2mHU1uEUbzOO3yOSMn5nBDvxqMchoVd
         bqe6FWxXffMUC2b5i0qMvFb1mUKEEUeEjWnVDdzWcB25S5p11G5Ggnf9wbkV0bN58gIJ
         M0mbyyQFuoBPFndqLnZVWFJH7eDELAUX7FQ+zetpHPvXtqXyRDxTvSYRQPT6QaoIBIF+
         NLZM6hF+2bwJ1modwxt7PttPGF3u2DAj7KLV3gF9X7Y8XTaEzz76bWaACa5CIeDdl2WB
         5mjHaaxtiFyumInJlmfK8eWzIgEe/pJeklN025sXL7CGMH60OuQtGS2ZRJYnub+OjIAa
         ipNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DJ+VCy4rnTO6BuAnbNBUZGY24Dg/TkhmEZUDFGMhbyA=;
        b=Yov6BlE4VI2QHL0rSsdSbM3oX3P931dnw+WWOCnC2lymCORCP5MWIK2MkuzPtq/rYJ
         EX9JWxSr0XR+ej1wlncNknlsmOf9aI5P/ass95cLGCU7+WuB31Fc8vCfEjhva+n5nyZ/
         fAcUpaGMcuxlygG7Ilm0a6lChWc/acqTPGQY5BLYb+JYoya9VZ2xqOC84JmqSGSF/6Yl
         ea7+zklLusGsdQoNicx2CUYWcYJzOrpy4T7jN9ywzWpTt2csG31/coVCLvkHCu31/R9p
         rFa3pb2dPbVIGl6topJt8IEpHGgrzk3hU5dOIVoEhdKueoUCpf5ne8cGwzNpMnaRRhBQ
         /crA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2019-08-05 header.b=ra1pIZ+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si10386631qth.127.2020.01.28.03.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 03:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2019-08-05 header.b=ra1pIZ+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOgC-0004aS-AR
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 06:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.merwick@oracle.com>) id 1iwOeu-0002pM-JQ
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 06:03:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1iwOet-0003ja-NA
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 06:03:52 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1iwOet-0003jQ-HN; Tue, 28 Jan 2020 06:03:51 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00SAxIWG116083;
 Tue, 28 Jan 2020 11:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=DYh0RIFuVSZpob2NSOUwbR0dZjvLnDjhfJ8y8tcSRaw=;
 b=ra1pIZ+EfY/9Ia+i7P4FP+K3yIDdM9Dg2uR9D7U9QkdleJnEPouvQdS3XJ6PReGo8yzP
 wqCLufL0DqkttXomhM7vlhNkKwh16Nt/1UZBIuN7of5ygqFRNEpI8GQS7c59XD5jErnN
 DIbng7ex+PnjfD9Ay10uRlWYHx6KvJQWCQJZl3EY56KedoDVDTnFAJ3eQSFeYLtGnm2/
 R/l4CPEyk0imQJw5C3eXYk16Lf+V8Ta0v+c+TK2R9hqNqJKP1z/9Gnp6X5R1ABsXmb9E
 lzkmKBEmFgZelMthLytJG53T8xfKSml2XA6KERwusvubTgIhQE2U2dmtXZdpxkguu4O3 iQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2xrdmqdh06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 11:03:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00SAxM6S066892;
 Tue, 28 Jan 2020 11:01:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2xry70f6x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 11:01:09 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00SB170B026049;
 Tue, 28 Jan 2020 11:01:07 GMT
Received: from [10.175.203.109] (/10.175.203.109)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Jan 2020 03:01:06 -0800
Subject: Re: [PATCH v4 2/7] Acceptance tests: Extract _console_interaction()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-3-f4bug@amsat.org>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <3b9b2028-1562-1fe2-65d8-bc038f60573c@oracle.com>
Date: Tue, 28 Jan 2020 11:01:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001280089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001280089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2120.oracle.com id
 00SAxIWG116083
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, liam.merwick@oracle.com,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iaFzOyxt6N5A

On 20/01/2020 23:51, Philippe Mathieu-Daud=C3=A9 wrote:
> Since we are going to re-use the code shared between
> wait_for_console_pattern() and exec_command_and_wait_for_pattern(),
> extract the common part into a local function.
>=20
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Tested-by: Liam Merwick <liam.merwick@oracle.com>

> ---
>   tests/acceptance/avocado_qemu/__init__.py | 31 +++++++++++++---------=
-
>   1 file changed, 17 insertions(+), 14 deletions(-)
