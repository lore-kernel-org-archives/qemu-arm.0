Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp327900lfp;
        Tue, 28 Jan 2020 03:02:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqz6Y52TqQVJDLpObT3OHibRE6jRP7AVUjZ2QZKPfiQtljwA1WKfKvKWJQkp6dFqn7xLlZ
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr19900590qkl.119.1580209356740;
        Tue, 28 Jan 2020 03:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580209356; cv=none;
        d=google.com; s=arc-20160816;
        b=qsfCPJWEtOu4OHR2IpOy+v1wjTFhqC9jifjSX+XxkG6gG3fgEg9nkhujEUqeOgjxNc
         eNWi76CtgTJ4IyrAVUTC7kMqD/v8QS43F943wwwQzqPmealG7Pr9AikWqGEMIxuw5tfB
         KmJnqYCTD1bsnbCpDe+CetLt/+diLzMsJABDiniEZpoR8HnJpHDh9Mydwn2zEr6SKTZr
         Mfv/ivto1JVIv9NxpHIBT5n/P0TBZfqrWgPr+TuPNsA0I17mZjGWEUutKfdCzQVXsw2d
         4hPDpmXypFhTsZMRWR+kBlaVi+uE/iupGd4bYiuY9jhmGXD3d0heqbVRy5Gpn0IR5xgs
         Y3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hi6q+PHVR1WNroWUxlqp30ACrjseWiR3koGtrs1Ckeo=;
        b=i0t56uxWChmgLHlJ2rpKFFMMEmzP+cGcdnEHHOXdCarUCZnYVOUlsG9WP6Fh8UDSxz
         2SxMDbF19vTvGcRgCoZXCwMZGe4erxWpZ26gbdwHScsfk7ymHwcbI8OU1I0NJc4by3FS
         2LS90KrKz48DnF9RZJz7ggksI8AxvAUVQO5Wqz9w9q1JKI8zHSA8J5TdfYQeOeJ5yKrz
         4P1Ws/oN18OOTWwSRRPD1cS3zwvUidT1HHSzBh+RuWeai2TI5bYOQCavO8sOAkWY+CYr
         T3vq6xm4XD5jU3qwnIdNqRR5HgUjnBMBHD3WWpwNNx82rxlui/MK6Br+XOctQO7aF14w
         AhlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2019-08-05 header.b=lV+NAB8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si869461qvz.211.2020.01.28.03.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 03:02:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2019-08-05 header.b=lV+NAB8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOdg-00014I-3X
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 06:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.merwick@oracle.com>) id 1iwOcY-0008Mr-Ec
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 06:01:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1iwOcX-0002C1-33
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 06:01:26 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:59272)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1iwOcW-00029M-Gr; Tue, 28 Jan 2020 06:01:25 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00SAxI0C128513;
 Tue, 28 Jan 2020 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=4dtLJzvdYc/RNXJMvyok2+lZwOyLRckdL38NTP1x7SQ=;
 b=lV+NAB8FTpL7MZniQmw19GoZP+HaQwyP6ILjkcPZ1ELofoLkSgHDze5q0LfPA5URcq3L
 JcHnRB2JP+OIpDazEuJb8DgDjRe76+efLuo7OAHJK8gG1aMTO7pXTZHHwPJwoBeBm0E7
 b1XT4wuc1AKoxMSuZnO22PNWmlFWxLPBFg4m+M0tQTSHAQ/t24JV3oY8Q3IVhY50KuaQ
 2rvUotww/PLpujQC0ar02J9ygcoRUZ+NHjq6P1gHpvZsvUeq567+5jYDFqKRWHCUVaGL
 8BRMLAEc1h2v95RS8OfyHuXRFhbx/2BnbxrwDGQrNLJ4fDlbkuuYl/3Jk6W5ud4cRIEz dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2xrear5brr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 11:01:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00SAx7GQ153079;
 Tue, 28 Jan 2020 11:01:11 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2xta8hg5hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 11:01:11 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00SB1AbD026137;
 Tue, 28 Jan 2020 11:01:10 GMT
Received: from [10.175.203.109] (/10.175.203.109)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Jan 2020 03:01:09 -0800
Subject: Re: [PATCH v4 3/7] Acceptance tests: Add
 interrupt_interactive_console_until_pattern()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-4-f4bug@amsat.org>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <4f7cd06b-4ecc-a36e-7c91-21d344bd90cf@oracle.com>
Date: Tue, 28 Jan 2020 11:01:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=606
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001280089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=674 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001280089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2120.oracle.com id
 00SAxI0C128513
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
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
X-TUID: 9SKKbOU8+KsT

On 20/01/2020 23:51, Philippe Mathieu-Daud=C3=A9 wrote:
> We need a function to interrupt interactive consoles.
>=20
> Example: Interrupt U-Boot to set different environment values.
>=20
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Tested-by: Liam Merwick <liam.merwick@oracle.com>


> ---
>   tests/acceptance/avocado_qemu/__init__.py | 32 +++++++++++++++++++++-=
-
>   1 file changed, 30 insertions(+), 2 deletions(-)
>=20


