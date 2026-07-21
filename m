Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2C3C4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:52:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGW4-000198-6Y; Tue, 21 Jul 2026 15:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGVs-00012d-PP
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:52:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGVq-0007Vj-Bf
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:52:24 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LHRZUI1926832
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PRWn+7whRNKmaFQEWPmx9SYN8+C2SkJLnhOH3jtOH6g=; b=oO8Ah8tatEA9+36V
 P+5MkvLH58Db58pWBcCAdg94vfD4/k7BGEQScO/Hz0XGvNgIpq2JxT8n2Ni6g1Yi
 hv6Brqj6yhLTCkZU1J3GI9QMhLJKXBuHtKZ/e0yPLHcSLxMATjt9EZmzKjy8EiFj
 iWMgu09vOKwkNREauaQVfyyaCU3vZJBuBBPRUS2lYbv8s1EuRvDoeLuUaQHqPsxK
 bf7NcFieMp6fcJDsnIIUIKjFrUq2sp/VGIfww75qZpBHEQ4n/e8mk3v8fn7VA21v
 dpdtog+2Xskda2xsZFVp06G7moLAEuuIadtF8OHxZX+dtJxP5FBrbplvmFSdKDfU
 1LWL6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6frnff-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:52:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c26012cd0so205622191cf.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663536; x=1785268336; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PRWn+7whRNKmaFQEWPmx9SYN8+C2SkJLnhOH3jtOH6g=;
 b=Aq2L2ciiKICwUVzShOMdb1ikQPcHykHMXvjzQx+TnwKn78F/4+402KhX9CE2zwDlwt
 3rCyxS0uY0caqhKl20QMxUzb3eA1mm82GivShan8LRbdUZo+FrzF26E3AEyBwlNXUF7P
 nrAMFkOMcu8Hxn+/YpH/K1eosf/LmPNKdAWca0gUD8Aazi5lihE5x642grN+lNfIOrPq
 R5K21pwPq7ZT4u6S6lIHiBjlL++IQCqLfb47ksHkS85BgdvAmAyDKC28cTzUXeNynSLX
 3AGvc1qBEHfobbnLnf6OeenpGVD3juBHUYi+BY8Fl/H34JRJsJgjbvslVkUmDQr0o+A0
 wLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663536; x=1785268336;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PRWn+7whRNKmaFQEWPmx9SYN8+C2SkJLnhOH3jtOH6g=;
 b=g/+CycLWXcWzutS70R5p9i07uzjUX7ji109wduY+6L4oJ1fZRDZXIi4cyyjtzoTKM0
 mFeXvD0dLPs+zY4WOtfxDiC+qKFv4kPUoIoYUh2cdWxOPwrsnlHwSCW20FYkaJEMw4Gf
 gCCriuMkwfEIdx/MoU1Jbp7Ak4e1NoSDDQJGW9IPqb89cq4W3Wtn189fAsuWJGem3DpN
 0AKob3bZpDxPXX+yFrtgYbdQ5+ceEQ/0FKc7W5WUQSlTqqfbBaQWafM0MnZxNZej6jeA
 snfYR774i18yY/gc94eMadIIpVHraAeiH8fepwqyoXOtZW8BAmAp+8MPa1RAniDzhmHA
 asdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RolVpt7YL2NUIQ2qY8wsQnbl1Bj9BETM2kMmY3ajK0R4wgOhtUSah7vWXh37y7ljYyGV0Lbcdha4A==@nongnu.org
X-Gm-Message-State: AOJu0YxxMumtsxw7FyqmkAWhA9UryIYEQLa857h9WkC+BKMxtz2MjZI9
 X74Nax8EVsCZ1iYci/yN395hy80o5ABzEWktOFX0KqAPR5L90qJdmkf5lw0tlIAHB/yUXxOXE5F
 nCzanVP0EKO/ZvgEj7wmcD3j7tahb0Da7NR+yaGbBK5tCbm5n8wqTcoo=
X-Gm-Gg: AfdE7ckF8qDJBjBns2Zq0EQxhdiyDUl/hEdb59NOXuT1ne2RLCwokOmnBV4YgWCZFNK
 hM/M6QihxvIZt4er0x5DxeBupnoz2U9xDIN+TC21u7g7HTJ7EMA/pu24dC3oYgshvSprrFqxY43
 kaK3ZQ8N9fQ05QZkxW21MXDgyuL400DET0AgFjOIRLVplZMJ/s3WekKSbaY/OJp139iHxmKNjqg
 mYeaoyMtTO/C4pt+MIHs7Qt5Ss9ZAPqeMiqA9wj9tFefWmWX3mf0fs8V437yuVD4x7D3dG6REpQ
 LWNRijyjOEgZtruJu63dudq6JDCuig3674hrJv/0xrhvPHcUuKbBEIxsV7TJQWREKbjQF19MwNT
 PFS5FAQckkWXv+4vQDUnAO825adgsx0l3SgHy2cVC78VgOTc+NUY=
X-Received: by 2002:a05:622a:259a:b0:50d:db76:55cd with SMTP id
 d75a77b69052e-5213daa0bc2mr188915091cf.52.1784663535919; 
 Tue, 21 Jul 2026 12:52:15 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:50d:db76:55cd with SMTP id
 d75a77b69052e-5213daa0bc2mr188914721cf.52.1784663535501; 
 Tue, 21 Jul 2026 12:52:15 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49565373200sm86034125e9.5.2026.07.21.12.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:52:14 -0700 (PDT)
Message-ID: <bd927862-3679-4e4e-a1b5-47a8de2f4afa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 12/15] target/i386/cpu: Use qdev_is_realized()
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Luc Michel <luc@lmichel.fr>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20260721-qdev-v3-0-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
 <20260721-qdev-v3-12-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-12-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zZDKVFyAPUZAazF5Veto44tCs97x4KQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX3ka6kiSIKXh9
 aKRVndZsuuW3Y7kRuDDpw/+0Fh6qz+N0TVHmprMdz3NOlpMMBsysFd1tYaoXP09bIjlJEU7cWZ8
 98/C/FiwW4A7Ur24uj0jnsQEJoh+efXqxqC7oL6AEaQDtw06AGUc8WIVVYCgPFWPpzJqi+Phd3p
 aDuFrstMVL6cXz/vMbCctJ147VuW63jhUIOdEUrrRUULtfgIMM/2hIwe3l6EzKUmSlpBBl7paU8
 +GbNgCWGS4VYGHJSf20VHyw1ZJ0v/dd7rNAnfqBNp10w3e51MnXsqIXfCG1fuc/pFt1ThNEJEdY
 ZtG3tHOJ6lVaU7IYWIQo5nvqxKGdMmUuoSaBqpz9kK7wxcoJo7v2cIXSHOiIqLkxQTCz80KHEXL
 HDHw/6IJHeXRJacEwfv87ICxQY5+vJbi8+9QIPBsqyYdrg++s7ECIIzxCzeEGz3HhkipjWYbcbK
 kaM7wgyf6zcjOejU87g==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fcdf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zZDKVFyAPUZAazF5Veto44tCs97x4KQf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfXyZLfliPHWafE
 TeW+DvzoxAP+fSfKkLgoDImO8VnWtgIZcdMA7UTh19FeypsWs/a5xEGgwxpjjH5j6R5LXkeXcmq
 1vzrHtDYyTT2SdVjyyRU/bpQoTfBqOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210206
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 21/7/26 10:17, Akihiko Odaki wrote:
> DeviceState fields should be accessed through qdev helpers rather than
> directly. Use qdev_is_realized() instead of reading
> DeviceState::realized directly.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   target/i386/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

