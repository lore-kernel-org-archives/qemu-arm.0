Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D883DCD98F2
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waABJ-00008Y-T2; Thu, 18 Jun 2026 06:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waABI-00007x-JG
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:41:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waABG-0001Ou-SF
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:41:08 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65I8Fbok1011346
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CWkSh0r9CExpB3rE0/hbQRRV60wM9Frq9tkmGml6IoU=; b=BrtmR4i+uVlL5Xs6
 RsE5yxAq2H9ZJciLsS/DVfJ0VZvr8vgM1Jwc8J/C1gRk8yZm8mY4s8kiikc41N0O
 lTpiuH0yrAxYRiVwHD95tAH9gG4HflmCQzhX20u8w+34QCTsVhLca2D+54LpPEnW
 KSpVsvIHreIdf/cNzO58K96lXiTCmfULC1OC85h2gPLHWjtLKg9OAFZmuBff8+aT
 fTQmpjPxWbaQhkvXOMm9NBVDVDjAzOb3xaQMKndbrrgnZtsT+U17NQJGlq8U0V0F
 VHK1dKPrg3G4xEBXa/nyt78HOCTidgLzEJUUMSPoRdd/DZqcEyiMI9Uy52AYFLn8
 otZhpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rttvsv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:41:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915d3261c5cso188117885a.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781779264; x=1782384064; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWkSh0r9CExpB3rE0/hbQRRV60wM9Frq9tkmGml6IoU=;
 b=AE/xiPRVwE71ih4hIybQA/F3wY7SVr9+n3/OkDGdUZ/gFFwNquyYcGqYvDmNK094oI
 LhVHvc1Bn33YmOcZa1gqmNXnkyNafp4dlG9Uq1jf1CY3cMQI5/0EOfedBnT1BT+ZL2PI
 liY/nRbw4UB7A0xEim85+wfrDNAO4qxIpC5O3tEjy7eZpu9skkzZjTpEtMDq8VKF6cFP
 va2m/zheJQOTh8pt241GQDmFqAru24eB+BsMjFCgqVHkPAR1QKjt1kfd/0mmquu3f7VV
 zFtmA9awQsNAMJhSTzeSMQSsXinKmxUZY+3yi84svY4nYoJbiG91FPnTi2neoh0UrlTD
 dZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781779264; x=1782384064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWkSh0r9CExpB3rE0/hbQRRV60wM9Frq9tkmGml6IoU=;
 b=ngoy9EA643Myno0xMVgrMvUcEc1mEXNjeor6YvGVYQU+6PscwkIERiIkbzcpTiXiJa
 Vy+qKlskBtmhUpAvobDmsIqKEZqPPVK9nqNZMcC3jrxswc6KlXZt1hfBqnmKuPX2Q/Fh
 xo7akceHVx+bC9CB7+sd/lk4FHey+G2+EjA2c8qjJe7aP2k/Zv/ZA3Qs/x98mAOI7vpA
 fH5VltLfpYkXizF1c+jPhW/ZkF2uvN/ffvQG2+v6ctnhR5aMOnIFuefFsf2jtlV2rJBg
 +VZjzBDTZ/ff/ufcfhyYfWaW1AjfLBv/2Is5MAXO0zVhxrSZYi9gx6CQ6TWOEclYlpGn
 vGHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/e8gqDnfyFqgnFmLxrqIllZB4X+sNDUyi1nNsCd6i0qlgpHlFcRqyez+RtRePjmTvikECxo2nfmw==@nongnu.org
X-Gm-Message-State: AOJu0YwOz2T7591lZI08yFgfGN9sRHvrb/NkyevcXuxJ2nAcHupu+dXp
 /PO2NY3k/WoAH/FhvDLv4PBpwUNYyJ4ZSsxAMZN6WLZ50wH2nnbi8icnQ1gHtnTcwFNaTnO0+m3
 hLLwHL/tyfw6AWz5O/sGjQq1TkJYT8OAN0nk6n5kKRPr8JfR6xzNwZCY=
X-Gm-Gg: AfdE7cn0t28a2hOViY/wrKZv5nVzck81Xg2F9PIqACGFyl/tve7kp/1q8PlUL9vMLQS
 Nz9KsVC6vsUjrZ8ZIwZNRYW30XT9p5jDRdat8iZtm+B/mcJAoqN5OVeOwEIU4KkHeXx1HJldbTt
 C5ZvsUuvKotN2Q0aFr3xj74fU2mc+JkjCFgbzB13UDp6GS6eUoFAPbjzxTOr1jw6/s24L/e0bT1
 qcetHPJl9K5mryitLGz67yocTW7etmLy2YZnsYbF9nPipVqzLLF81gEMG3VDvUtPhvGHCYNpZnS
 gM5soT14ddZTkuXAPRTO30V5Qcn3bFwAxNXNerl0WjX/zNmJZuFQWOBuQKCD6eE8rnqXBtDlc+t
 HZ/AFuRe5dMMVW5Sxxy9EKvZXndoHwX/B9uDItoRCH+nmcr2XFBerwQRIgX6vHg==
X-Received: by 2002:a05:620a:f11:b0:915:9f87:eae0 with SMTP id
 af79cd13be357-91d8b4bd6c0mr1380046385a.45.1781779264178; 
 Thu, 18 Jun 2026 03:41:04 -0700 (PDT)
X-Received: by 2002:a05:620a:f11:b0:915:9f87:eae0 with SMTP id
 af79cd13be357-91d8b4bd6c0mr1380042785a.45.1781779263723; 
 Thu, 18 Jun 2026 03:41:03 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4ff67sm245455575e9.6.2026.06.18.03.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 03:41:02 -0700 (PDT)
Message-ID: <537a01f8-fd9c-478a-a118-3b6c6457b1b5@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/arm: use correct base address when setting CBAR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Arnd Bergmann <arnd@linaro.org>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
References: <20260618093615.3793919-1-alex.bennee@linaro.org>
 <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
 <CAFEAcA9EUJrmdjee2PiLzObN0JagR2swd5x_fydDf6PVvD64Hw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA9EUJrmdjee2PiLzObN0JagR2swd5x_fydDf6PVvD64Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33cb40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=LnXgRUtFVs6qHmRbv0QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX+lZynFQqsdHR
 w8vrwZRpVP8QOet/8LPEkrqOU04hEr8EqsKwSBEt1FcegZ9Mq/CUyU2+dMp4zG6O5Z1M2PN/Hb+
 eYKmOIJKNlYPEG90zn8PH1BCReheu10ey8zbvQ0W/rXD6pUXpHEnr/EKrwWgoc5yh5hPAWAgRjl
 cXy4GiJftVPGgUG4kJ2RBYTGzpTVuYtiEyclhPNXSjLPVli1SisuAdv3kPAhCCFpiAOkRG3j/x/
 0Kpfri6PU+qWE2ekQorOKhqCYdfaCXgvyX6zzay8Ls1xO6hs62Xm1X4EujmHfT8aB/l3Y4JlA5L
 b/QGkPRqUHvX65y0zyVJxeyumFJfh87NGXDJiuLswwJ6TCGoLbMN2EDX4zY3Oxw30V10/x6O4BP
 90T7muWmIHdvpiLh3T4IugCc3EdCrgwXIqd7jEWuyJmbb1cpDW6E2937Mo7BzPtzxNPeyeR8lLe
 rHUGhlaDA02w9tnqRcg==
X-Proofpoint-ORIG-GUID: fmKExVOFIOwEAzKQ6c_IfNgQeYjdIh9C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfXzdVkIgLB1S1O
 f86N28g8+y9e3+GYYMWQFrBN3p99YGnthO6bsbS2pm2rX2E5dnJ+Gyo6hEylkPXWFrz2fHYd2HM
 j1m1KX6rkXKteogMe/Z9cGN35tZVU6Q=
X-Proofpoint-GUID: fmKExVOFIOwEAzKQ6c_IfNgQeYjdIh9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180099
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 18/6/26 12:17, Peter Maydell wrote:
> On Thu, 18 Jun 2026 at 11:07, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 18/6/26 11:36, Alex BennÃ©e wrote:
>>> This should point at the base of the Cortex-A9 MPCore private address
>>> space. If it doesn't we will confuse the Linux kernel as it probes the
>>> SCU registers and erroneously assumes the system is a buggy Aegis SOC
>>> and nerf the emission of SEV instructions, deadlocking any WFE's in
>>> the kernel (or QEMU smpboot code).
>>
>> I'm confused...
>>
>>     The Configuration Base Address Register holds the physical base
>>     address of the memory-mapped GIC CPU interface registers.
> 
> Where did this quote come from? Note that the CBAR is an IMPDEF
> sysreg, so its exact behaviour varies depending on the CPU model.

Oops I was looking at the A57 TRM, not A9:
https://developer.arm.com/documentation/ddi0488/h/system-control/aarch32-register-descriptions/configuration-base-address-register

> 
> The A9 TRM says:
> 
> https://developer.arm.com/documentation/ddi0388/i/system-control/register-descriptions/configuration-base-address-register?lang=en
> 
> In Cortex-A9 MPCore implementations, the base address is reset to
> PERIPHBASE[31:13] so that software can determine the location of the
> private memory region.
> 
> and then in the A9 MPCore TRM
> https://developer.arm.com/documentation/ddi0407/g/Introduction/Private-Memory-Region
> 
> you can see that the private memory region has all the per-core
> devices; the SCU happens to be the one at the start.
> 
> -- PMM
> 


