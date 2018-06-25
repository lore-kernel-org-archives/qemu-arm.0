Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3798044wrq;
        Mon, 25 Jun 2018 06:14:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKfk4EP5vxw4OhOgkvhC/Aw5YBCzE0n9O/5623QlpsHnjX8j1koD5EAE4EmlLKDCKbV6Vc4
X-Received: by 2002:a37:c65c:: with SMTP id b89-v6mr10256354qkj.421.1529932456968;
        Mon, 25 Jun 2018 06:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529932456; cv=none;
        d=google.com; s=arc-20160816;
        b=ZudzpcHJXejL6WSpKCp19A3Vrls+8OIeZUDpz9OywSb+ioEE0b8sMXa0VYJaAXZxc+
         q3GLVgrsaLzSjL1lUZCs2ahvzlzSmjt+4h40NVYlRsCWV70MvZmTRDAhFIjjOq9sB4d3
         qcDcnnJ8HNheL/1/9QKGxxUCEhQnWPsI1lP0Z0V8A25dsT+Yy+6c/pBr/wFQuxPQ6nAg
         yIDRRkS9VZ2aCiuwC7m7HI1PcFIIvJGqkkUKlkKX55uGxbhAQq0jD2D8DWyw/ZGdrjSA
         B4ru/Bt84ja4vCGWfUOnWgUz1hhc8D82W1yQgGUyIdqUYVSTt1Nsh/QU10MhNL2yPBBf
         vddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:content-language:in-reply-to
         :mime-version:user-agent:date:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=MbJUHy+rFM3A9RR7QiOt03ev3m2P2owjTTt2qBX/bVs=;
        b=Cek1mtkPld/8bWumxdJuo1+FL/HD+GfoS3sdqDM0hzSj/M2uvx26pVGe2s8A6q3jCb
         s/AEaOewX9rUrSFafvIpt7CC5FLV4fl+1bXxguhUNr48zSyE0MQhkWKsYStJHAJlj8jk
         ezuCY00HAOhS3Im6+Nx0/4eprveWqjVBLixTMA2LHUmPPQYrKOfLCjB34bGs3HVFutm/
         QR9qEoklUC/cdlcuHiMfZX1Y9/22s+MQ8fIvhNPQKN59TlR/OiGH0q7Rzyr3lmt22+86
         vsUsZC3/JABFgKsnbTrmmB6jd/NjRuK6OkcW+mEiwc638/8jlgh30WHioGkTRNIuttPP
         LhJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si4299680qts.384.2018.06.25.06.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 06:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:46825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXRJw-0000rW-4Y
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 09:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1fXQxU-0007PE-NL
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 08:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1fXQxS-00021O-Lb
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 08:51:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1fXQxS-0001zz-Dr
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 08:51:02 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w5PCnsbe079171
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 08:51:01 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2ju0h3rq85-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 08:51:00 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <borntraeger@de.ibm.com>;
	Mon, 25 Jun 2018 13:50:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 25 Jun 2018 13:50:51 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w5PCooiJ28639380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 25 Jun 2018 12:50:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F591AE055;
	Mon, 25 Jun 2018 13:50:46 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE480AE059;
	Mon, 25 Jun 2018 13:50:45 +0100 (BST)
Received: from oc7330422307.ibm.com (unknown [9.152.224.43])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jun 2018 13:50:45 +0100 (BST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
	<93f1dae5-e071-41f2-a1b7-1fbfdbe7917a@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
	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
	syiRa+UVlsKmx1hsEg==
Date: Mon, 25 Jun 2018 14:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <93f1dae5-e071-41f2-a1b7-1fbfdbe7917a@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18062512-0016-0000-0000-000001DFD62D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18062512-0017-0000-0000-0000323408DC
Message-Id: <f70f99ec-e415-1bbb-b7c2-2a916e2f3f66@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-06-25_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=915 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1806250150
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] loader: Check access size
 when calling rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vF1Mf6T+yh1U

On 06/25/2018 10:31 AM, Thomas Huth wrote:
> On 15.06.2018 11:49, Thomas Huth wrote:
>> The rom_ptr() function allows direct access to the ROM blobs that we
>> load during startup. However, there are currently no checks for the
>> size of the accesses, so it's currently possible to crash QEMU for
>> example with:
>>
>> $ echo "Insane in the mainframe" > /tmp/test.txt
>> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
>> Segmentation fault (core dumped)
>> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
>> Segmentation fault (core dumped)
>> $ echo -n HdrS > /tmp/hdr.txt
>> $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
>> Segmentation fault (core dumped)
>>
>> We need a possibility to check the size of the ROM area that we want
>> to access, thus let's add a size parameter to the rom_ptr() function
>> to avoid these problems.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Ping!
> 
> Could anybody please pick this patch up? Qemu-trivial seems to be pretty
> dormant these days (?), so maybe Paolo via misc? Or either the s390x or
> Sparc tree, since it fixes a crash on these machines?

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>

if this will go via the s390x tree.

