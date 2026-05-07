Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E183CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 20:55:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL5kS-0006ew-Vz; Thu, 07 May 2026 16:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wL5kQ-0006b3-Lj
 for qemu-arm@nongnu.org; Thu, 07 May 2026 16:55:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wL5kO-0003Yh-5J
 for qemu-arm@nongnu.org; Thu, 07 May 2026 16:55:06 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 647IFHAQ3157738
 for <qemu-arm@nongnu.org>; Thu, 7 May 2026 20:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qTJ7jAQV9Bq3MZFnxRQrIHL1++tQ1fQnlXQcS7CiTx4=; b=TNFtuYN4YneSLx3u
 wUMmWlykQbmCEYOY16iQziypgPMTvN+SK41ZNDpsNy1jqjjmeRusQZjvSkBHdJTs
 d+lLDDv7I1ShbIkhU0DTn/9KjEDhfd3oxc/DCUwOl+VVsNl/lVZEiubTM6BBHfqA
 LD50BPHrem3LV0QlWSLpyh9oeklILKNdO7xJim73xyN+btMGDk8jFWtXnk8vq+8J
 u67p0ds1GQsQ6TexDhjDfGgPT5s9PVw8G9AyQuMT7c6xro3Ol1y34yOELxx6QP2k
 Ku13nc+JCnezdCAy4IbQ49OjrQ/S/UQUTHUW1IBsA3PhDUEU9zEmzAwWdmfkFEaY
 QhYS/w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf3jes-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 20:55:02 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-130aab78a09so1236304c88.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 13:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778187301; x=1778792101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTJ7jAQV9Bq3MZFnxRQrIHL1++tQ1fQnlXQcS7CiTx4=;
 b=Ve0XpDDdhUD68OcqjjJL7GKbmtC++Vhs/F0oPY9teDBzuZvORGKJrRA0kLmxG+dRji
 y+VbXO2y1MXW3pvby2yAQRjgx1LwBWCs7V2AIfX06pMDmJSZAP1yutfWtsI9d7TSQbVD
 BDEmvatX0WiRg4mG6t+KWIFhJ9pTLKocPwiyBVXWyvIxi+yX5Ffo3lYYVnklqX6vGl6S
 BNmiCHd3npEsO2VtN2Zr6zNC0J5N78CJxNQWO+RQ7l5NTrg0sKaYbUjPPCQo2tCu1bt+
 DHfwycGwu/7zE99NxML4xA0Pr/VCjUVmZ2BoKbrEx6CDuC1y75h/N3hWyzMEmci8+n7B
 ZcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778187301; x=1778792101;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qTJ7jAQV9Bq3MZFnxRQrIHL1++tQ1fQnlXQcS7CiTx4=;
 b=IWFGYzRJYYeJcZUHWoimQvPRZfWEObOrJ0HTUXViy5Yv+rsrPAdv3yiF4PIFDIR5MJ
 eH6UFKabxShRY94p7elHIjn1Kk9rUK7bQj44r2wpy0uxHEorxjwZ0XUXq9C/tRRAEOkm
 22w+TKJiOgFsZ4ADmhmHlzt5dGP7B4CpzE6IcbNXeX4CIpNGtmuMlbyGXW4ELNnCUsuW
 ngan2Jaz+q+ELDA5b9zQKZruLesvtGqQZSMnNCS68KHrl3PPgMv7CTcTFqIKSmJnfD85
 SI4sygegppLtyPfSe9jMPykX27eljSuIKO07aLBXZ42jG0YG1x1PSlOY3QuITyWNEZ+J
 JB9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HPQUxfH0N/0iuQycPIN+9WMtIIfdUcXbeMbiFBDSKzVv/9nVMZckc7HGiHK80HYveakrTPfa2sw==@nongnu.org
X-Gm-Message-State: AOJu0YydkUxw1rZRLqY0ObiYOLMyACB13jpDg4JhdpfSQTwlq794Zk4e
 2S/jhBpykicliNeUQmf8pUD+meZxHZJ8BaUWx8LdGF4OM2VTCCmK+jzSrZYZj1KXOxceK7Yyr+1
 mh20IFp4MlSXqKRJi5MNp64ogVHv5RpDMKqCg2kx7MESwegsLr7KhyME=
X-Gm-Gg: AeBDieuh95GJgwH5W/nM0PNxqAPLM86ygxp5glXIsm8CQPMhy+Y7SdmfevRHT+tqMvt
 VaZTPKzkKWNmEBDTM29AQtvo2WwZSH5uSA1iyw3kOuoaiq3jpm4trkTmqlLzLk74q3r0z3rIgbf
 pf1qOr+f1pT5TSjKvReiwNXXZcAy6nYRCH0CZq6k/OmRF9J4ITEN8zZgmsmJNug5xrWtSxoMcJG
 z46+wTVun9Txi2KCc2R6gWczWsn/tmH3N6CrgEynlWx3HambaBUVGBCD56/VtcTylav5CKJTq/i
 S3adlhJCMCv9Wc3LVZ8Ls9eGKZr6sMk9GTepADIppmA3hi1t7xCKEAyvOzLnJeFBGVCMQ8DADZ1
 NujnkbATAZ+L7o+nPON7C4+yalUaEBinw8/l0b5D1z44hYNfKcZUnKjcJiqVhwj8tt3Vrro8ylS
 IKnnvQKa+WqCkkHQ==
X-Received: by 2002:a05:7022:fa07:b0:12d:f0af:110d with SMTP id
 a92af1059eb24-1318ea2dc7bmr4612606c88.28.1778187300932; 
 Thu, 07 May 2026 13:55:00 -0700 (PDT)
X-Received: by 2002:a05:7022:fa07:b0:12d:f0af:110d with SMTP id
 a92af1059eb24-1318ea2dc7bmr4612580c88.28.1778187300303; 
 Thu, 07 May 2026 13:55:00 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13270901ba2sm195177c88.11.2026.05.07.13.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 13:54:59 -0700 (PDT)
Message-ID: <f6b9b16a-0273-4dc7-a8e0-df074d246a01@oss.qualcomm.com>
Date: Thu, 7 May 2026 13:54:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] target/arm: Fix functional test failures in KVM-only
 builds
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507194728.2034696-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIwOSBTYWx0ZWRfXy13+OILgoyOQ
 AzalgcndpdQthDQDhp0u+bWs4KaA4vimDcUoXLhoQ46xXSaf0NW8Y/Mjbhpay1vJyQfbC3r59Je
 UaOOW1Jnr2VeH2IAB+8PTnZ1QNUb+hCbzxrnYn32SPEw/1no9I1edHgEAELf7XameV8FHl1wYGs
 Fc7LH1gBCXNAVD5ZESYrctX6jk0r5tityMwMJ+bGXNZUPPJ9zab5dRmVOd3P8KOqIqIdWPrfGc4
 c7iBEUkyEiasoUPfo1EeLRPPLFRRvD/uyB1wmxeHpyOqiIcq4u4BkcjjtClH/Qkx0nxNGMLO3re
 YmimjHHDCTsvhlZQzjzvS1QLkXCoBU8M71SvLW/cI08ZuhrN/odz21oCZtF/t2we0lGTKqklpYH
 36Tdch5B+VUiOfAhSoM99EwJhFoFlKbbrNky/SF1BDa3CPsBQtHFPfa4Z+m5kL7o3nDZGnyFzZO
 Qv0i72tgIBUcgZro4Rg==
X-Proofpoint-ORIG-GUID: lgUqpIUUAgUzMUtG0dqNUPzGE_-crzKe
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fcfc26 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z8H6kxiZWI1TnuwXCkYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: lgUqpIUUAgUzMUtG0dqNUPzGE_-crzKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070209
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/7/2026 12:47 PM, Peter Maydell wrote:
> If you build QEMU with --disable-tcg on an AArch64 system, some of the
> "make check-functional" tests fail. This patchset fixes them.
> 
> The first patch fixes a bug in QEMU proper, where we broke the
> "x-remote" machine because we forgot to mark it up as being
> OK to expose in the qemu-system-arm and qemu-system-aarch64
> binaries, the way we do for "none" and for all the actual Arm
> machine types.
> 
> The rest are tweaks to the tests:
>  * tests that run '-machine virt,virtualization=on' need to
>    check for failure because the machine reports that the hypervisor
>    can't support nested virt
>  * tests that use a specific CPU type need to either be
>    restricted to TCG-only, or else changed to use 'max' instead
>    (since that's the only CPU that will work on both TCG and KVM)
> 
> thanks
> -- PMM
> 
> Peter Maydell (6):
>   hw/remote/machine.c: Mark x-remote machine as OK for AArch64 and
>     AArch32
>   tests/functional/test_virt_vbsa: Skip UEFI test if virtualization not
>     supported
>   tests/functional/test_kvm.py: Use -cpu max, not cortex-a72
>   tests/functional/test_kvm.py: Skip if virtualization not supported
>   tests/functional/test_hotplug_pci.py: Require TCG
>   tests/functional/test_tuxrun: Restrict to TCG
> 
>  hw/remote/machine.c                          |  3 +++
>  tests/functional/aarch64/test_hotplug_pci.py |  1 +
>  tests/functional/aarch64/test_kvm.py         | 12 ++++++++++--
>  tests/functional/aarch64/test_tuxrun.py      |  2 ++
>  tests/functional/aarch64/test_virt_vbsa.py   | 10 +++++++++-
>  5 files changed, 25 insertions(+), 3 deletions(-)
> 

For series:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


