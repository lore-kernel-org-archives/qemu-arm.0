Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3211361lfi;
        Thu, 5 Mar 2020 10:06:11 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtFC7KmQmjwpMkTqnXY+xbCC1bXWFiOWAJfhuOBXbAK81KLBYZWMNmmiBYx8bNLK7UGVrRn
X-Received: by 2002:a05:6214:b23:: with SMTP id w3mr7693717qvj.181.1583431571593;
        Thu, 05 Mar 2020 10:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583431571; cv=none;
        d=google.com; s=arc-20160816;
        b=cOE+0eHhVSb63ofklRF6FmUVRhsBrz0sopv1yO9LBbFGMzDo9e+79JLHsfbQzOW3Lg
         4zCJltFAUAxPIW7KHKmJA2alz1eYX+HnX1FeuCk3/2i3nKb1Qbsptsu5R7Cp/f4mDTkf
         Qxg1MMwymsc6biUVpG8GG+nZD8S24xX2ToHYZ0SaY6vuxRJvVcf3DSgvSh81+pzvYr0D
         ms7QeKiNnZTWEX0aKS+trBO7IjC/Dqf5NROr/nymUIVWo+N8YV+znFHjdpj/x4rzAXPg
         LCRGXrwXazGGke/W083bF7huWtAqhE/esJagE+tGCjFkh8+HGlWZiWGtzJpubbsWca7y
         H4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=GpTo13RAEjgcSvs/mwYVO/TtEFG+oXP/35kbXhFHFSQ=;
        b=X9XgAeS3V5BXyJHi/yzruqyolBufBGPZWahONf1209/wEU4W6N9aOmZdridWpUlY1E
         W0Hg5uh+qj+OfLKSIV7am5hwqwYNYDZJsjxHKLC7dCv6lIKJR6pOgRRQhM1sx5ncybIo
         fdmN8HMYJ0GZMPuSFsWDikp4qerCWKZHl0sxS01ievSDmH+dsmnHdbg5PN1e55RODvbu
         4F9tJmqBAns4FfBU0SKKkvRZgLZGo0EZ0CwRjhZUpE6kz2Dce4RUbEyu+4SE50xU5hhM
         FvSb1AVe2Ov3WlctmFQlKuFjDsL4ihp1qt5Ga7OsqLtOOZOncK0KirTm8wHdrTQj4OZa
         BgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m132si3239259qke.185.2020.03.05.10.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 10:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9uss-0000z0-NC
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 13:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j9usk-0000yk-2k
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 13:06:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j9usi-0002oz-U7
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 13:06:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j9usi-0002nb-Ms; Thu, 05 Mar 2020 13:06:00 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025HpjJf075304; Thu, 5 Mar 2020 13:05:57 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yk33m0agu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 13:05:57 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 025Hru9L082170;
 Thu, 5 Mar 2020 13:05:57 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yk33m0ag9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 13:05:57 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 025I5HTN017071;
 Thu, 5 Mar 2020 18:05:56 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 2yffk7560c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 18:05:56 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025I5tB350790838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 18:05:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AA16AC05B;
 Thu,  5 Mar 2020 18:05:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 783A2AC059;
 Thu,  5 Mar 2020 18:05:55 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 18:05:55 +0000 (GMT)
Subject: Re: [PATCH v5 00/10] vTPM for aarch64
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200305165149.618-1-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <6b77a3f6-9d8c-3952-9b23-1982cdc350c2@linux.ibm.com>
Date: Thu, 5 Mar 2020 13:05:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200305165149.618-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_06:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=850
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050109
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 025HpjJf075304
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQ96aRwAj7KP

On 3/5/20 11:51 AM, Eric Auger wrote:
> This series adds the capability to instantiate an MMIO TPM TIS
> in ARM virt. It is candidate to qemu 5.0.

I will send PR v2 after the tests have gone through:=20
https://travis-ci.org/stefanberger/qemu-tpm/

Thanks!

 =C2=A0=C2=A0 Stefan


