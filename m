Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AE0C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 22:59:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whbEa-0000ou-6O; Wed, 08 Jul 2026 18:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whbEY-0000oF-IQ
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 18:59:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whbEX-000175-10
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 18:59:14 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668KtLgX3990583
 for <qemu-arm@nongnu.org>; Wed, 8 Jul 2026 22:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ZHvPci+W5HxwrZGd5ljKFEhtiBL3xhWgwc/GNe40tI=; b=NNdoDRP446TjBMPD
 5nPA247bTHe9h2yX14pyMacsQlbWVnRNA2qc0aigO5oavXq2ITjYhmISkAuStqgH
 ZdcaGECd2zZPfWpyGsBdMlAfsGRXrJLAQ8+hZ8DhX0bKRLHdBM8AGuoPMl+vC20R
 OEJauzeXxLvbNNkiVZD1SwkLXuYI++LlKwyRxDWLExV6GwhW+6BNq+MDdgb4TTln
 0wFvHKiwpgFm1K3fLYMNSc6npTbxUVft/XrsgMWXyh3fJqurYI5vLuYft/D04/jB
 MU0dVGjZIfspPfOnh/qKvkrEKi+a6LtYrf1caTcIJiZl4Wi+qRlGDUGtXKs68uz9
 yGQLPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vrqv8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 22:59:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0f0a0760so26960711cf.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 15:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783551550; x=1784156350; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9ZHvPci+W5HxwrZGd5ljKFEhtiBL3xhWgwc/GNe40tI=;
 b=JiKPCsynbPZqduaC+mWuTsIVU7sLj3W0DFx88qMDqmCURii8TKsI1OYNJoxyc0Y42T
 8/phqwLpS/TeBbtmJvSlExfMxFTLnUYkaywfDJk+sQOuMJKOrpra/HhpmXCAZqA4D1JK
 wa819+ueCDbLSMCbVe/hfZE+uKvKRm/pX1/GNFBC8ZZfYkEXOl8JPn4CTQvvsLTF7TYY
 aLgJ1xN7ubUg47dLkQ/58fvAXptTY/xEHJG5GMejzzGbS7K4kw0jOg3V+2FJ82qw3Cce
 /5u9qZJ+Eq0QABcl3v3Ms/fBzh5BWlf3Gr70IohUd7yxZz3W2z4bFxTK8Edj7tDp3yTm
 jnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783551550; x=1784156350;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9ZHvPci+W5HxwrZGd5ljKFEhtiBL3xhWgwc/GNe40tI=;
 b=PFftngumMoao1tCXjlIywL/WjV02XbBeJ5f+jpTojylM78axXB8ydJQTMULhXPCWzN
 WI4RdYRTA4pyeDWpS3pe2iyZyINZc9zgHpvf7R+GGtGwlpTaSYErzjGtC+UJ5nCZ3ldL
 IZX/U/9qiL1iB+5tPKM6KBmLBvSyfsGav9I5VyEK5jqKDPN1qBasphbVjadsJq3XZnC4
 bfEyOZ4vzPD7OR92a/9q9TUWM1/L0k8Fu4lAxDRWyY5vasTviR5FXPERPcVYI0IBwGDg
 55po1YAuUsHW/IVZQJKwOPpg4FenqNH+LE/HiFaurbVRluoDgYLtj0TfHTuTucF5EqTW
 bpNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpE0H5HREqCTRfa1J1IOARfujNLLg5uL8pITun2iufl4Vb0z2/4NmRN6gMmv+KKVIgv2NYDbd+1WA==@nongnu.org
X-Gm-Message-State: AOJu0YyFiU6Tkhj0BaWtK5Cj0I/6WOr9HRpsR5h9mQFuKgUImLTjhCq1
 Frh0x4jvkiUmV4zIDpKy/+S4O1febqGyy5kJ1mMfos1cDA/0pxc1qnh+vg4rgriNFVuR3xsAGqK
 FgOapFpnMJRa1q4VuISKfsDvYfFOMItcFifQFi4tLdnx6re+aTwqy3AE=
X-Gm-Gg: AfdE7clTOk7xHZIhc3y4ou3IIXD4JiFubDqZtgAn/AQ0tF3avCvu6wSpn7TejuWfaHl
 jeKGJWbq3rw61N1pXln+KPRMH6dg+1t3DOx/0rSTiCnCNl9XG+dB7tBwNKQczms7lbo54qbjsmh
 5+bG/WIslGWMbyYw3LVKgGZSvsF+6H0oAsBFUxMKBsAHzq6DqvB8D0Lkf+EbT07G8JRszKZlkTv
 ST3M8Y9t1ZHnhcO+TVTC67dGPN3L7pBV40XcfqChem+QJUCx61t2eBIo3VJQhSlmeeDJMhmcp99
 51jZDETe2vexMkvKexObbawnPDmchsakKtjpi268+kQwZCWZVKbijFI58a0o+dxMnBJK3XQl2qR
 cIu0dyYdZsY5AHM92xUpONdmQ1v5IC3qSozVDEDqhecsk8Ro/s/9k+k86Lg8FuA==
X-Received: by 2002:a05:622a:38d:b0:51a:8c9a:8fb2 with SMTP id
 d75a77b69052e-51c8b4c751amr48472771cf.67.1783551550425; 
 Wed, 08 Jul 2026 15:59:10 -0700 (PDT)
X-Received: by 2002:a05:622a:38d:b0:51a:8c9a:8fb2 with SMTP id
 d75a77b69052e-51c8b4c751amr48472451cf.67.1783551549825; 
 Wed, 08 Jul 2026 15:59:09 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19d7a375sm8443335a12.15.2026.07.08.15.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 15:59:08 -0700 (PDT)
Message-ID: <3d2d869c-d1a0-40d1-83c2-755c080bd17d@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 00:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add SSP/TSP power control and DRAM remap support
 for AST2700
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260708092023.3826159-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260708092023.3826159-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cq80EpTM455iMFeTaLDhoyCcxOZ624W-
X-Proofpoint-ORIG-GUID: Cq80EpTM455iMFeTaLDhoyCcxOZ624W-
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4ed63f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E3A8Cuo5wui9a3iAGOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDIyNiBTYWx0ZWRfX41eBWpwu7bCO
 phiWuilj0YfF0gnkum6JlqhXZ+Yd49gs8OcV8+9Zg8Yupu1YtES4dVQs7AbbD4ez0z3LCRML6av
 XqCZP7ltVLd/WwbXJOnjR3OjiHT6b2EZffm4oGd42PneMYw5O/nPeYs7LS/tvBPJnop8yA4G7e7
 IA5agCp/HetsvmXMmTPrN8hlnAG1t9sSzIGs9kRRrMbpgpQRZUsy6FWtxxc76JIpO2C1cJVc/RD
 HVLVRrcMBjkAno7dL1ZTqjz3cS7Bz2dzcVfstMDJC1qL6zrDDlD/YBg4zIpDT8zgDsIW11U7h0+
 /PnppbJw+FRpoWpPlnsPpUuMC6QrbK6fy42ABQHDjYxH80y0ZEyVYDXZ9tvFplIenUPENOpO2Wr
 Y1AO+k1OFZyZUMil52U7w23woVef8agp6Cr6sh7wku4Dgluz8K2f+A2lazyB8nZw8ImD1EKvC2M
 J6rHDqIL6EkhzBIJ5fA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDIyNiBTYWx0ZWRfX2kgZ/1YvT3Nx
 JTPJhT63NI+4WFLpS8kPTOxnz0arWfoBiU+irGET9G5GOMffpdhaiFFR83IQkxh4NfTEgdstuqM
 uqXLpcVWbcU96QC+X4U0ADn5i2C4c4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_04,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080226
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

On 8/7/26 11:20, Jamin Lin wrote:
> This series improves AST2700 platform support by aligning SSP/TSP
> power and reset behavior with hardware, and enabling DRAM remapping
> required for proper firmware boot flow.


> Jamin Lin (10):
>    hw/arm/ast27x0: Start SSP in powered-off state to match hardware
>      behavior
>    hw/arm/ast27x0: Start TSP in powered-off state to match hardware
>      behavior
>    hw/arm/ast27x0: Add DRAM alias for SSP SDRAM remap
>    hw/arm/ast27x0: Add DRAM alias for TSP SDRAM remap
>    hw/misc/aspeed_scu: Implement SSP reset and power-on control via SCU
>      registers
>    hw/misc/aspeed_scu: Implement TSP reset and power-on control via SCU
>      registers
>    hw/misc/aspeed_scu: Add SCU support for SSP SDRAM remap
>    hw/misc/aspeed_scu: Add SCU support for TSP SDRAM remap
>    tests/functional/aarch64/test_aspeed_ast2700fc: Boot SSP/TSP via PSP
>      and load binaries from DRAM
>    docs: Add support vbootrom and update Manual boot for ast2700fc

Series:
Tested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

2 notes:

1/ I3C errors in dmesg:

[    8.151230]  14c20000.i3c0: MIPI I3C HCI v0.0 r00
[    8.151498]  14c20000.i3c0: unsupported HCI version
[    8.151761] mipi-i3c-hci 14c20000.i3c0: probe with driver 
mipi-i3c-hci failed with error -93
[    8.152250]  14c21000.i3c1: MIPI I3C HCI v0.0 r00
[    8.152518]  14c21000.i3c1: unsupported HCI version
[    8.152779] mipi-i3c-hci 14c21000.i3c1: probe with driver 
mipi-i3c-hci failed with error -93
[    8.153322]  14c22000.i3c2: MIPI I3C HCI v0.0 r00
[    8.153588]  14c22000.i3c2: unsupported HCI version
[    8.153853] mipi-i3c-hci 14c22000.i3c2: probe with driver 
mipi-i3c-hci failed with error -93
...

2/ shutdown not working

[  246.405297] systemd-shutdown[1]: Entering exitrd...
shutdown: poweroff --timeout=90000000us --log-level info 
--log-target=kmsg --log-color --exit-code=0
/shutdown: line 97: poweroff: not found
Execute poweroff -f if all unmounted ok, or exec /init
shutdown-sh#


