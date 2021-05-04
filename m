Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3280073lfg;
        Mon, 3 May 2021 21:59:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6g2fFtPsMwzgIJn2wGaJj794dgTI604bzDCQ1I0cODQdMBuyszq8qW1DlX1+W6oOyDXPp
X-Received: by 2002:ad4:5ca2:: with SMTP id q2mr23562666qvh.21.1620104389856;
        Mon, 03 May 2021 21:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620104389; cv=none;
        d=google.com; s=arc-20160816;
        b=O/eR6AQB9m9CBrjMoB0HZbHgyQ4qoiUBke+BCjFLamjqBAyV1XiUPY2OHLNkFcy3nQ
         /xT74hbtHQrorE845xXviBPS9re4u+mnbq3DSuvzoEbDdDZpnS0BUD7ZpSarJE4Gg3Lj
         4gj/hlGA/zFXqum4Ti6oRSZgD/EvcuNrYaFW3qPr8AdSHps0NxFbNZUH83I6NPrCuh1f
         lYhJ1kZr09IDa+FHiVlFfdsm5ReervRkGoO+1nfPFN3DocyOR0V68fLI+NYs9my235GH
         0dOLJMO9TiY3Yaf6cfRLYGqHkgVRRpSAnkDURS/ywQXie7Kw3g7EX0/obSgcIHFJ6KIg
         zQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=m2H0GCtMdQ905kNTgd/JP2rl9St7NsiZkP1diU1RmKw=;
        b=pERCDB6CCr3uQZq35t3etqZe4K2zhR65WLsHfiLycOjw55fEucs8xUZZDS+pes2Umt
         0bPX5s2QqHs6Tm4/QjcDvMjWoQWFutrlfJI6u8CErsMTnSm4kVFJ/uO/R48eh2p4hQse
         UtZVN5w2HZUFUH6npYUet9a/8kjJf6v4hXdsRCkQ7b7m8pPjGv/9glQCyAVBKsJ2fCkV
         F9idvIaSbB8i9rvNw0ZrVmvi5+elC6RRXQ+TS+W51U/I0FEisSpbTlNCxpk1OC4FeMsb
         yx9kwWbOIh3av2myHlSxVucFZN25NCTjC8HXByjuHQ4MHkDzeQOV/hIJP8NWmNkGpUee
         ZQJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=TEUcDBlw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si9844877qkg.330.2021.05.03.21.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 21:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=TEUcDBlw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldn9x-0000Ad-7g
	for alex.bennee@linaro.org; Tue, 04 May 2021 00:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1ldn9o-0000AP-0b; Tue, 04 May 2021 00:59:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1ldn9m-0005aG-7t; Tue, 04 May 2021 00:59:39 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1444iRKt193915; Tue, 4 May 2021 00:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m2H0GCtMdQ905kNTgd/JP2rl9St7NsiZkP1diU1RmKw=;
 b=TEUcDBlwAwCVZ4tRy9ptx7SMtnJnRGMPcMNhGrCRjiKkOy/dDxjGfw4O+Q9fzpswX9hq
 g7AnY8xso0WcpJniOXVzNwQ7fjraDPfdXfBBHxnNVV3zrD2ltDjmcsTUHvnuCDSidqxY
 Ekb+A5ib1QKL53dpR9xdvVLLOEbQJf8i7uk0PwvpE+SgUclFq3LSbB/uMyGQifoKtq3r
 FUkDT5PRlpgAtADX9YdRSJdL11flMK1A/B6BYoSK9zKzgG4WMW6gd4QNkc3/HmBEd7iQ
 /6ONVHVGHAJNq8j1eZ2qYOPoxUdBjgjTlwEE/JteusXAy6B3wPVGykTStVhAqQcHAvu8 ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aygjg6wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 00:59:21 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1444wg6s032689;
 Tue, 4 May 2021 00:59:21 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aygjg6w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 00:59:21 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1444xJF3013407;
 Tue, 4 May 2021 04:59:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 388x8h8j47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 04:59:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1444xGvx34079222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 04:59:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A924E42041;
 Tue,  4 May 2021 04:59:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 376C44203F;
 Tue,  4 May 2021 04:59:12 +0000 (GMT)
Received: from [9.199.50.4] (unknown [9.199.50.4])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 04:59:12 +0000 (GMT)
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: Dan Williams <dan.j.williams@intel.com>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
 <bca3512d-5437-e8e6-68ae-0c9b887115f9@linux.ibm.com>
 <CAPcyv4hAOC89JOXr-ZCps=n8gEKD5W0jmGU1Enfo8ECVMf3veQ@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <d21fcac6-6a54-35fd-3088-6c56b85fbf25@linux.ibm.com>
Date: Tue, 4 May 2021 10:29:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hAOC89JOXr-ZCps=n8gEKD5W0jmGU1Enfo8ECVMf3veQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BNnxxzZrrD-sq9EhyaMEh4Q4j-zG-p0v
X-Proofpoint-ORIG-GUID: 002b9ZvWVgbyy83xiE_uyAvrr1UxNmU5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040033
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=aneesh.kumar@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Markus Armbruster <armbru@redhat.com>, marcel.apfelbaum@gmail.com,
 bharata@linux.vnet.ibm.com, Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kwangwoo.lee@sk.com, David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jldXgV6Aogb8

On 5/4/21 1:11 AM, Dan Williams wrote:
> On Mon, May 3, 2021 at 7:06 AM Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
>>


.....

> 
> The proposal that "sync-dax=unsafe" for non-PPC architectures, is a
> fundamental misrepresentation of how this is supposed to work. Rather
> than make "sync-dax" a first class citizen of the device-description
> interface I'm proposing that you make this a separate device-type.
> This also solves the problem that "sync-dax" with an implicit
> architecture backend assumption is not precise, but a new "non-nvdimm"
> device type would make it explicit what the host is advertising to the
> guest.
> 

Currently, users can use a virtualized nvdimm support in Qemu to share 
host page cache to the guest via the below command

-object memory-backend-file,id=memnvdimm1,mem-path=file_name_in_host_fs
-device nvdimm,memdev=memnvdimm1

Such usage can results in wrong application behavior because there is no 
hint to the application/guest OS that a cpu cache flush is not 
sufficient to ensure persistence.

I understand that virio-pmem is suggested as an alternative for that. 
But why not fix virtualized nvdimm if platforms can express the details.

ie, can ACPI indicate to the guest OS that the device need a flush 
mechanism to ensure persistence in the above case?

What this patch series did was to express that property via a device 
tree node and guest driver enables a hypercall based flush mechanism to 
ensure persistence.


....

>>
>> On PPC, the default is "sync-dax=writeback" - so the ND_REGION_ASYNC
>>
>> is set for the region and the guest makes hcalls to issue fsync on the host.
>>
>>
>> Are you suggesting me to keep it "unsafe" as default for all architectures
>>
>> including PPC and a user can set it to "writeback" if desired.
> 
> No, I am suggesting that "sync-dax" is insufficient to convey this
> property. This behavior warrants its own device type, not an ambiguous
> property of the memory-backend-file with implicit architecture
> assumptions attached.
> 

Why is it insufficient?  Is it because other architectures don't have an 
ability express this detail to guest OS? Isn't that an arch limitations?

-aneesh
