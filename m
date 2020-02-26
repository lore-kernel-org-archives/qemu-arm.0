Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3072939lfg;
        Wed, 26 Feb 2020 05:22:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+oNOblkrjZX+KxKqtGyIWOmdodlrNPOL+mgZOPXgQnylHp5MeHaexx/Emy2Q+NeIfCF+c
X-Received: by 2002:ad4:4f90:: with SMTP id em16mr4715741qvb.38.1582723356072;
        Wed, 26 Feb 2020 05:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582723356; cv=none;
        d=google.com; s=arc-20160816;
        b=FQodS5xoobvzQOdGcLgFASm6Iv//kM7RAjpT73/OreC6Uoa8uN7ijQTypVB2uG0WO6
         hotBLEBynpm0CRukd+UoFlN3G8JB2BmM5YBmQ10YxwC4POIVuXlUlYW8hbbP03tDMP43
         1EkpwkJ1Yu5XppCw0nakL6DXajbnA5LvRSQZAOwgmhZM/euXvTwPrMdq+M12srJyYeKT
         aToVHVyQugE+Gc71CyBxkci1EXsn2IMKxSiraB+IaQFOj4iywMAD/IgmpVk63chJwxbU
         9MLdGJc8rETXnS60ne1KFt7pkwHHY1cGgg7qggekqPt5oP30/CWtmHj0UzMbhDBQ5/00
         shMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=EiNmeG0L+EX0n8R2QVUpGF6wM6Vh1qAWeaadtG5Q5F0=;
        b=dEsrHaobvF/cv0e5BFW91hm0V7XyC65L7BMFEG9TyNu2fvQs0VCxWsRTmom+VCP+ck
         JW6i+kbthoK+UV1iod6jPxE6iKVqfztrMQRW8hfjexujNtSlRUpT8+WnCuD2njkZcWWc
         Z8lvGzJHTucuAhOuAn+HlzSd7OOOFwhfHEXOXliCBnmbm4PDGHMhe2fAm/NDl7QXlS8z
         wf95tg/WZtCPQBGRGhHZhdY336uWJ1H9Wei56Q18Z8MpwbNwvss9kAd7ViIqW//UQE+Q
         K8rcUZEvjgCPA9C162cPABnsfUjJ2WiTAKkxHrvohWopPDLqMDLBI+SWnW74yeQ9jPm2
         PIuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si1038863qto.264.2020.02.26.05.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 05:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6we3-0001dZ-Fv
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 08:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j6wdw-0001dJ-J7
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 08:22:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j6wdv-0005Za-7s
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 08:22:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55906
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j6wdv-0005Yw-2v; Wed, 26 Feb 2020 08:22:27 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QDKa3Q097147; Wed, 26 Feb 2020 08:22:25 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydcnge557-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 08:22:24 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QDKvfM098673;
 Wed, 26 Feb 2020 08:22:24 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydcnge54n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 08:22:24 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QDAEBI006358;
 Wed, 26 Feb 2020 13:17:23 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2ydcmknct0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 13:17:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QDHNZo45285814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 13:17:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17418AE064;
 Wed, 26 Feb 2020 13:17:23 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0675AAE063;
 Wed, 26 Feb 2020 13:17:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 13:17:22 +0000 (GMT)
Subject: Re: [PATCH v3 07/10] docs/specs/tpm: Document TPM_TIS sysbus device
 for ARM
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
 <20200226102549.12158-8-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <b71d4a12-6db6-af87-cbc1-5a20c86931c8@linux.ibm.com>
Date: Wed, 26 Feb 2020 08:17:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200226102549.12158-8-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_04:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
X-TUID: /rnjWHZWuY/6

On 2/26/20 5:25 AM, Eric Auger wrote:
> Update the documentation with recent changes related to the
> sysbus TPM_TIS device addition and add the command line
> to be used with arm VIRT.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   docs/specs/tpm.rst | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 2bdf637f55..932cb57049 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -18,9 +18,15 @@ The TIS interface makes a memory mapped IO region in the area
>   0xfed40000-0xfed44fff available to the guest operating system.
>   
>   QEMU files related to TPM TIS interface:
> - - ``hw/tpm/tpm_tis.c``
> + - ``hw/tpm/tpm_tis_common.c``
> + - ``hw/tpm/tpm_tis_isa.c``
> + - ``hw/tpm/tpm_tis_sysbus.c``
>    - ``hw/tpm/tpm_tis.h``
>   
> +Both an ISA device and a sysbus device are available. The former is
> +used with pc/q35 machine while the later can be instantiated in the

s/later/latter


> +ARM virt machine.
> +
>   CRB interface
>   -------------
>   
> @@ -325,6 +331,23 @@ In case a pSeries machine is emulated, use the following command line:
>       -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0 \
>       -drive file=test.img,format=raw,if=none,id=drive-virtio-disk0
>   
> +In case an ARM virt machine is emulated, use the following command line:
> +
> +.. code-block:: console
> +
> +  qemu-system-aarch64 -machine virt,gic-version=3,accel=kvm \
> +    -cpu host -m 4G \
> +    -nographic -no-acpi \
> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> +    -device tpm-tis-device,tpmdev=tpm0 \
> +    -device virtio-blk-pci,drive=drv0 \
> +    -drive format=qcow2,file=hda.qcow2,if=none,id=drv0 \
> +    -drive if=pflash,format=raw,file=flash0.img,readonly \
> +    -drive if=pflash,format=raw,file=flash1.img
> +
> +  On ARM, ACPI boot with TPM is not yet supported.
> +
>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>   after entering the menu with 'ESC'.
>   

With the spelling fixed:

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


