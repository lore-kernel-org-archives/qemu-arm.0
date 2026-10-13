Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59546CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:31:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGZmY-0007Es-PI; Tue, 13 Oct 2026 06:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGZmW-0007E6-OH
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:30:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGZmU-0003KJ-5Y
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:30:52 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D6YsFK3208378
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QRB9R8lJgYfAJdJzvGNsIpb/iBY7WtlMqKy8UR3bWX0=; b=Gq3rXCEbHhykC6ka
 irvjHJevuv8AYgG7I2ryxg8Gls0slVPzEO96UP0RtKmZfKHK90I7c5kgDjx4FZTq
 +eYI3vDf76l8Q1BenKGmokWd7O6neRlLSZHYEdXUa9ttj41z676cI6uiomc10sH6
 Us5Va9HZOsiPy/mhl8P9F3bjShgSu4Qrz0K0lNE1TTq0P5Am67BU/HgjZPXgpNBQ
 DcWqiBl+6y0T7+8n2eGkuBbRIfJ/NHawQ5AF441F9VFMPuc/YcxZLeNQnGJ7QBDH
 Vn+ZwXtFpZrwUMBM4GkZuEtXdSv7/LEhXdXVQR1fXCdVITJomyRpbMb134w5Eonr
 YXLmgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgyqk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:30:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cbacbb996so459740785a.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791887447; x=1792492247; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QRB9R8lJgYfAJdJzvGNsIpb/iBY7WtlMqKy8UR3bWX0=;
 b=Gtnpagg+MBSsNquOPbhyAwG3FfFR+xwzgEABVPSBo0wjNv6KSNuw5oKU78BjeWEyq8
 qTCgK2UZHSyvFuZ/lb6GlVKjIu8SRjTrR+VGqgQZBfhMAFScaGiedmViSdHWtuSJO5Cb
 6wQ7cCBvpakF11z7tKDzcza+8Zsjsyc+gAoXHR1qKGjuZT+9f2fVXpQfwD8AKN0id14/
 6Kf/RmXskOiHpE13Rm7HhjDo4eHKKJ49J1rWS/IG18aiBUQEnQA8v9dVGCDmCSU1jnbR
 53LQv46JNJDfL7f1St9aFQo7TAog55PwPFtP8T50XyqvcZvQonhVbo1yNxAdSs3iKWZx
 JiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791887447; x=1792492247;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=QRB9R8lJgYfAJdJzvGNsIpb/iBY7WtlMqKy8UR3bWX0=;
 b=C2h7Jn6RGuidl2SJ3RxknuyTH5/B3naOGuW+PSwFXaAw8GhnBhjQFxL5ExCThmSo3O
 2uMZopD+IPET+cvuVn8v3Qxbb/hRwL9VSqvd9lLmrR86vD1gxcPTLoMT9UIFXc3Rv3mO
 f/K4uvgGbWMnW6X7EAbjsudM7CpIl1u/elC619iHRCXJJbPOt5RHTe01GOPcQA2pxBdE
 qG5Ww+YYsm/BqPKBY6tyt0CDuDeI04lyoOCh69TBLuOGo6L3hlQcdQvFEl5puGR3IJRl
 GalTQzaLVzUQZsfRC7G8Ow3XD54mwsQk6+eVlBX8i8JwtBLhgEDiMswfKqoDTFslD/xs
 cLGg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqhVojJcMkkVx6EnDfhGzMuG7nGhGgykUZgYm8PI2NrF051DvXzr377GEfBrq2rJgJuMvgMY6hjQ==@nongnu.org
X-Gm-Message-State: AFq9FYLzhw0O6bbghvgJv+kvqiKFZBEENanS1bFFnCm7ZpdoBtHXjVmU
 nLFFXQwnl9BAq1hHYKVrexbtAEwaNGa1llEU0IgiWLrDsvWDtq7rw3Z6MEloWQkcPRYDdAelR88
 SoxJrtzbCTgkbghcCwzocJ3NF00wFazdDJp4mU3ih00g9dSfWv4sf808=
X-Gm-Gg: AYBFou1Meq4ICZU/EGu0cjA4pMK/o2ZD8Q+dTaxS/mcM3j7szSufQsezKlAshkPhigY
 aXw4pmgoizlcf7++wnYNe70lxzRwUWy2lDLctp1AAORqzubBQgngSq5ifErV3ZuFyqtZKaIUdZX
 HYmz/z7BdxnLitUPTrHmaYm+4HyZDZUidNsF6MLQP23xz5Ycj+C78zFEQjOwbUvMtaeQC3LboOH
 LkrJBbNySiZfPcs1rtr8v49KZ27vF5kvOLZ2DdykbF0gOYVq1E8NDJ9MDCdCCO7mEs5950F7jjo
 EnCvp7eoLx6UNEKytUpfpxARcxoZ6SKyjrnvymNOqYfMqaAEpC1lI+xQe6tNFlcwahk35ecQiM2
 62bdZeXL770b+pVsfHwG3puNW2Tnx+vdW0A==
X-Received: by 2002:a05:620a:6f06:b0:93e:e2a4:b0fe with SMTP id
 af79cd13be357-93ee2a4b23cmr785713685a.66.1791887446827; 
 Tue, 13 Oct 2026 03:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:93e:e2a4:b0fe with SMTP id
 af79cd13be357-93ee2a4b23cmr785709485a.66.1791887446214; 
 Tue, 13 Oct 2026 03:30:46 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb68abfsm392749085e9.0.2026.10.13.03.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:30:45 -0700 (PDT)
Message-ID: <de4fe97a-83ff-4f56-b3ba-f506d03e252e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/86] hw/intc/arm_gicv5: Implement virtualization support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0vvcoDN-_bIrbQdXcXdijI9q7x5GhrQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX9l8lafS/3szJ
 BIOTsJj+6jQzVikgaE831kUXYWxrQY5mYbIPOZNz4XWb2HeextSnoboxFLQtQiveQkqRvwkZMTj
 ouDZFj29jPi1OXIHnZuoBYLK8TuzaDtgxH+blcZ//P7ftMXon6okl6nRvydBjDVE7NAAEd9m2uF
 1wzaW8LZOTZXSBKdxfe0zXfsD2/DQH4uya1wyLoIKSJiSn6/hmkPItLrxtwyPrCAB8Ho9DTwqUl
 Bcfw1T/rjFC/VVXei6sUQp8yDFi9AcVuK5KDLwoD35P0ZbE3wzOF1b7saUeA7Hh3/wzGUDe4I86
 qIwaygwW0M0fVuINpQbm97uP3xrVguClKI8kn2Cm3fOWEp7j/LLDXAKk0R3wvCoO9KvZD07KaD3
 u+IyiIvnxX8Etf4EgM8w0XH6QA4S2RiDKnCA6kc9Ta/UWTviVUijTtGZGWULcXWQye6liDtWojc
 r/TTsIhBEqCd1b0SCLw==
X-Proofpoint-ORIG-GUID: 0vvcoDN-_bIrbQdXcXdijI9q7x5GhrQr
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace0858 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=wlP1sSF8iNsEzO2SmSAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX0k/FIFZA244S
 iokm0dYSUgwdtSknvJmUO41nJKLwOAt8X0tEkQ9fTgcspaoBrG1brMeqF6ns+PMzA7y5e8gtG+8
 kJTNwO/VMITZroGUmB/a6xBfaHQ2v9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

On 13/10/26 10:38, Peter Maydell wrote:
> This patchset adds virtualization support to our GICv5 model, and lets
> the "virt" board use -machine gic-version=x-5,virtualization=on.
> 
> Virtualization in the GICv5 is more complicated than it is in GICv3.
> This is because in GICv3 virtualization is mostly delegated to software,
> and only the CPU interface has hardware virtualization support. In
> GICv5 the hardware does a lot more of the work, so virtualization
> support is needed in both the CPU interface and the IRS.
> 
> I've structured this patchset as:
>   * initial preparatory and bug-fixing patches
>   * add virt support to the cpu interface
>   * add virt support to the IRS
>   * remove the check in virt that stops the user enabling virt
> 
> The first 11 patches have been on this list already; I've copied
> across Reviewed-by tags for those patches which got them.
> 
> The current spec for the GICv5 is at
> https://support.arm.com/documentation/aes0070/00eac0/

Now A.a: https://support.arm.com/documentation/111701/latest

> The kernel support for using GICv5 virtualization is not yet in
> mainline, but it has landed in the kvmarm/next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
> Similarly kvmtool support to run the inner guest is still work
> in progress, but the tree at
> https://gitlab.arm.com/linux-arm/kvmtool-sb.git gicv5_wip
> will work with the kvmarm/next tree.
> 
> This series can pass the kernel's vgic_v5 selftest, and boot an
> inner guest to userspace with kvmtool.

Could we have a functional test similar to
tests/functional/aarch64/test_kvm.py?


