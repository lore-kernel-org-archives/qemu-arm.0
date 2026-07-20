Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5341DC4452B
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 14:39:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlp8Z-0004vh-HZ; Mon, 20 Jul 2026 10:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wlp4h-0002SK-0N
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 10:34:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wlp4f-0002jw-4L
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 10:34:30 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KDqpQu2501265
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 14:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 40DLNsd71N5eBW/MZDm6EHHz8FUOpH65CDFh15oybyQ=; b=T8CXIzCZDY2RNEUT
 o9NqrYhq6+e2ckezEK8aq0FjKRAT4IxErZsz65kyn4kraXgM5WsgDQQX00/y6KOJ
 vBAbQV8VuvqNw554UytpLd1zuJZ0wAnSQB8RSWcEw2FAHQUyiqZFeZHF/TYEvlpE
 7VZUZKVO/w3pJMoM5zemwYnV2NT1GiDYfMc2b9usBFpgmczgDSl5qxELRijVmwyZ
 iRIrdGVZef6KC3G0N9vWWXpaYc2IBECqhWnURZWCO1wbsq/Ib9OG9idpvs5Be78k
 rYCXv8oCXkWa1GfBBQXugCyPycgHQstqjYHfMOodKCrsNjdb9Qy+AyRj+O4SCe+/
 qciLJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y1976-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 14:34:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38e8e864ef0so339127a91.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784558065; x=1785162865; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=40DLNsd71N5eBW/MZDm6EHHz8FUOpH65CDFh15oybyQ=;
 b=cgYKU+CgGQadPZ4TiTMqlWCTsal3k/HbJYLIIozQxDCTltxvDxEPeki2APRxGH5WCs
 5e7k4IuCT3O9f0IYctOAtfEFkAK4Jezmyi/1+ziMA9UgRe7RXo0LITGMYxYWeZG5IQdr
 rGikfKs4IjpUU/9qiMrhrq5fTYqVSPQ1eSi6hrGKLug+WDzQSO3J9fQMGKZT53QR/SVp
 YtSszfrBsmAIYZXVcQuLNlxJpZckh2KUHIkErXFv8WSY1TgG3UIVEzubgmC4r/l+FMaS
 hyUkS3CYBDwK4EWk3usI5RVycpvmklz5+5AnuxgzKL/GicOmsXNIbnxos101irrASMqM
 8gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784558065; x=1785162865;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=40DLNsd71N5eBW/MZDm6EHHz8FUOpH65CDFh15oybyQ=;
 b=eS7ui+hyJXxAPbxICljlJ86TYi3qwVbTm6GQZBB7Bp+RFeiU4lkYS6sAuw+H1eWnT5
 FFHDx4iuW/JSjk8HH7Mzovyg91MwOq53QWisXCWCptDyQuDv0WIyNsbVARVQky/g4Vxh
 8DImlfL3nUwGfL0pEySA4vSosVF9FDP+WYWwEAsDLf7Z7/GX/SGopubE16Jtr5ObmgbZ
 DNQLbdnjSmSOqyTdKAAmxxf4P2SkItgFs18k/w2iF84N2u2W+/oY0O42IIKnFJkz+Lyb
 oYrY+c/VxCOx2xWuoLE/We8l+3ONUWusHO++tDN8U0rKKRiFuaksDGFxHqVCAX/K9jfV
 o3lg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqI/yasXNfI5f2IIbHyGT0O81gzEoaMpIGYc6wTL+JdtnHh3JMe5PMeFi4G7werWT1J7mGlLFtHA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9WsWUeXvRSzC/34UP26ZnYyQ82MVkOvNuUxT6JSs+iFkEIeFu
 MGTJ+aqwEBu7aD1tNZFG1sY6+AONJX8GGnF/nSe8pN1Nq5Whjc/LbldmTxQVDPTWcKKkU99lr7M
 Y3FR/XCWWCBROTt0/TVK63Eks90BG7qC+6tyAgsPxk3CPx/M69pfSCgc=
X-Gm-Gg: AR+sD139Z7afTVCj/E2Lb6MbY4QNYLti/MmeXT0nqdBYWPEXBhgfRARPoObqg1KQUA2
 xXbcOyPhWRTmXq3wBagXZHZoJ+aDYcBDq9Uc2XuXmhOiJqYZ2BHUbjpxhE8EfqVPy1aLUcZrlC4
 TnCOQD6Vqx8AghV0Belgy9AaD2/9dCPNU4rOPzULkRSMWgp4jw00Y3mXwRihqwl7rHrVl9dzIkJ
 UREBq0y5rvYOKZlHnqfD2FlcY29c4kVgwmt0uVqsJ1mnQFuqSTZSA1IHCBoXwuFZzXmkIqsENo7
 zQNpyIhzOS38dEUmg7V0c3rifu/ErB1xkWphTNyz4JU+Ru/klsuX5fR3+A5Yhj8e5ppdy1B1vg+
 IGN+8yTN8IMJJLgnS/gZ/MHtzkYk6w6jadUkKy8PK6KVZwIZMmoXOlDOErCu2MMm8zFJi
X-Received: by 2002:a17:90b:3dce:b0:38e:7f1b:f01 with SMTP id
 98e67ed59e1d1-38e7f1b144cmr4216053a91.36.1784558065218; 
 Mon, 20 Jul 2026 07:34:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3dce:b0:38e:7f1b:f01 with SMTP id
 98e67ed59e1d1-38e7f1b144cmr4216027a91.36.1784558064717; 
 Mon, 20 Jul 2026 07:34:24 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e656e5686sm4010215a91.14.2026.07.20.07.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:34:23 -0700 (PDT)
Message-ID: <5e5d5996-5376-429f-8787-d448f9bfbf81@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 07:34:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/remote/machine.c: Mark x-remote machine as OK for
 AArch64 and AArch32
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-2-peter.maydell@linaro.org>
 <1bcf5fd5-b2ee-4adf-ad16-bac12050baa3@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1bcf5fd5-b2ee-4adf-ad16-bac12050baa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfXwabcQllTuzTs
 EwcGjVaGPzKdfaJPgY6rmXGbzICYxBfq/pTu2FrrpoSHO6bW5PvN/fSkXU28Q2Wrf+PgCAp0v7q
 CNCIIWCTiJWWVdNEpi+rlW91DkW4jr4=
X-Proofpoint-GUID: mvcE2Jde_D9j6p1v9FBJcdkZNKbCeg63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfXyfGHh+a9m+hn
 w1oqMM7MF4OWO1xUalwpvbjv+c0A82SpZ6YfpTfb+h3rGum05FHnyXm4RIfrdSqwCWmDNLc4uc3
 mD+ZmdplrBMFHxdBX6yOJqd97IbaQWzBOGnEfvByoTtmhT9wuvIjO6swZ2Z9z2oHFU7yprJN7Ff
 dW3PkKf45wxIiQNNxZGQiIqMXnWPN0OUgFekfFK1RHpeeAxOwDTcfJpL+x29vGE3QiOG+4lDbpC
 D/+wcAVNXrpgv+M7LYcLgNjCyLhq7BK3ecPHMBa3eFAgaUQHIeTzzi+C++mCwvfe59I+lc5ste4
 EAaIBUtgw7IJ9GZ/GrXWFwn+B25QueLV8V1E/2rnGmWGbnFOQugYJVebPexOcyApaYj95wyoZ1l
 PzBRR+IUlPBiqeYl9HTvS/p72/s+aR3HChPdtIzyqniGgRhU+56UuKqK8qoGWWrmnjgKZ/fItk9
 Dd1qhmTycviX+3JUXQQ==
X-Proofpoint-ORIG-GUID: mvcE2Jde_D9j6p1v9FBJcdkZNKbCeg63
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e31f2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=69wJf7TsAAAA:8 a=KKAkSRfTAAAA:8 a=LG1_uKtv5rtgl5um6SgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200162
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 7/20/2026 5:39 AM, Philippe Mathieu-Daudé wrote:
> +Stefan
> 
> On 7/5/26 21:47, Peter Maydell wrote:
>> When we updated Arm and AArch64 board types to mark them for the
>> target_machine_typename() filter, we forgot about the "x-remote"
>> machine type, which meant that it disappeared from the set of board
>> types exposed on the qemu-system-arm and qemu-system-aarch64
>> binaries.  We didn't notice this, because although we have a
>> functional test for it, it requires the KVM accelerator and we don't
> 
> I don't remember why it requires KVM.
> 
> $ git grep -i kvm hw/remote/
> hw/remote/Kconfig:3:    depends on PCI && PCI_EXPRESS && KVM
> hw/remote/proxy.c:36: kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> &dev->intr, dev->virq);
> hw/remote/proxy.c:45: kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> &dev->intr,
> 
> I suppose these 2 calls should be replaced by generic equivalents:
> - accel_irqchip_remove_irqfd_notifier_gsi()
> - accel_irqchip_add_irqfd_notifier_gsi()
> 
>> run the functional tests on an AArch64 host in CI.
>>
>> Mark the machine as being OK to expose in qemu-system-arm and
> 
> Otherwise if it is tied to KVM, we removed support for 32-bit ARM
> KVM in commit 82bf7ae84ce; ...
> 
>> qemu-system-aarch64, in the same way we do for the "none" machine
>> type. This fixes a check-functional failure on aarch64 host, where
>> it would otherwise fail with:
>>     qemu-system-aarch64: unsupported machine type: "x-remote"
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: eb796c55513d9d39 ("hw/core: Allow ARM/Aarch64 binaries to use
>> the 'none' machine")
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I couldn't figure out which git commit started enforcing the
>> filtering of machine types based on the TARGET_FOO_MACHINE
>> interface markings, so I picked the Fixes: commit hash for when
>> we added them to the "none" machine, on the basis that that's
>> the point at which we logically ought to have also done x-remote.
>> ---
>>   hw/remote/machine.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
>> index ced782f6a9..df08f64019 100644
>> --- a/hw/remote/machine.c
>> +++ b/hw/remote/machine.c
>> @@ -24,6 +24,7 @@
>>   #include "hw/core/qdev.h"
>>   #include "hw/remote/vfio-user-obj.h"
>>   #include "hw/pci/msi.h"
>> +#include "hw/arm/machines-qom.h"
>>     static void remote_machine_init(MachineState *machine)
>>   {
>> @@ -148,6 +149,8 @@ static const TypeInfo remote_machine = {
>>       .class_init = remote_machine_class_init,
>>       .interfaces = (const InterfaceInfo[]) {
>>           { TYPE_HOTPLUG_HANDLER },
>> +        { TYPE_TARGET_AARCH64_MACHINE },
>> +        { TYPE_TARGET_ARM_MACHINE },
> 
> ... so exposing this machine on 32-bit host binary doesn't
> look right.
>

I noticed that and fix it in the upcoming series for single-binary.

>>           { }
>>       }
>>   };
> 


