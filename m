Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp729623lfm;
        Fri, 19 Jun 2020 09:10:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaRWvC0VM22rxrKDDk3bKQChUJH49KwvUbA77h35Y1T3uk+qlBinlMeXacAE0jy2lVoQSR
X-Received: by 2002:a5b:78b:: with SMTP id b11mr7252078ybq.42.1592583030884;
        Fri, 19 Jun 2020 09:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592583030; cv=none;
        d=google.com; s=arc-20160816;
        b=cWGLG+Q2m9VtBsF0H1+tpXC5FJURrIi6UvhQa8/YWx3e6Pv4sarZNZ3D5Os/MUCROi
         9lEYXVY26GF/XUQ5KRME2cXgdJgWgcvp0RptxDJZaQEELL7xR/BFaw4A/sQxCGl5x21L
         YZO0gLlJF8eB1zrh6y6UE383o12u8cum96A79r7Y5y263jKgR4iFdHkbsrOZKTWqjBKD
         8W0XbRL2Iz8yqeMTHoelJdGVNMQuAQfW+TjdvcXYloyJ0eAw5i27SX9kuDo/5q0/NQeE
         fY9gzuKaL/AvrLnt0wkoInJ8ZjP7qg1YP2/ZpHfNN2ynmmfE/uSo2dNnP+psihy65c/q
         FnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=oLO+s2o6uVXHB8Of/04WnXn2pFFhiRBZtpoARUqkItk=;
        b=dkNdiz4XFSVgU3jlIu6sDIyAv8gO8gMFN9j3obUxSNaeU8YVtBtFdN6O0lj3GPB4ka
         cRWSIdyyaBq8tSf1s4XlF6WXQCm3PjURa7ZQ11pz0Z1I9VczIWxDi3bvcfLYulXriGu5
         KUJvAcR7DQUmONXZkTCnU7WMd33apO8wRmZdfoYyoJHYNDIpPAeD5TxxM6+FFerK2zPY
         7yN1SkIBdmN/1/VwjVxM1nuCVchV7eo3wsQI8eqKSRTNXc286BcV7XvrbY5bgm/C+gdI
         RTdSfSI7Nj1iA3SkmQ4OLexXrYlKIXt2twK90NJc2NULsSkBuMZ1eKelx5bsSqFf9DR6
         NrNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p135si4733991yba.192.2020.06.19.09.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 09:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmJb4-0003Kc-67
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jmJav-0003Jk-LS; Fri, 19 Jun 2020 12:10:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jmJat-0002P2-SG; Fri, 19 Jun 2020 12:10:21 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JG3XRC118561; Fri, 19 Jun 2020 12:10:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31s0f40dk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 12:10:16 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05JG48ps121398;
 Fri, 19 Jun 2020 12:10:16 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31s0f40djf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 12:10:16 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JG5Ask025270;
 Fri, 19 Jun 2020 16:10:15 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 31q6c6c05n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 16:10:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JGABwk14418238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 16:10:12 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D4766A05A;
 Fri, 19 Jun 2020 16:10:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 668446A04F;
 Fri, 19 Jun 2020 16:10:12 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 16:10:12 +0000 (GMT)
Subject: Re: [PATCH v6 3/3] docs/specs/tpm: ACPI boot now supported for TPM/ARM
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20200619141851.16272-1-eric.auger@redhat.com>
 <20200619141851.16272-4-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <d33923df-8f53-1c71-ceb8-a4741d5af7ab@linux.ibm.com>
Date: Fri, 19 Jun 2020 12:10:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200619141851.16272-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_16:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 cotscore=-2147483648 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190114
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 12:10:04
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nvoQDJ1pzTUr

On 6/19/20 10:18 AM, Eric Auger wrote:
> ACPI boot now is supported. Let's remove the comment
> saying it is not.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   docs/specs/tpm.rst | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 5e61238bc5..eeeb93730a 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -346,8 +346,6 @@ In case an Arm virt machine is emulated, use the following command line:
>       -drive if=pflash,format=raw,file=flash0.img,readonly \
>       -drive if=pflash,format=raw,file=flash1.img
>   
> -  On Arm, ACPI boot with TPM is not yet supported.
> -
>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>   after entering the menu with 'ESC'.
>   


