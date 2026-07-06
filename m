Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18634C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 13:26:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgjKn-0008L6-8z; Mon, 06 Jul 2026 09:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgjKl-0008Kq-Dl
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 09:26:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgjKj-0000Yg-OZ
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 09:26:03 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxSC1369581
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 13:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i2H1BWjECxL+ndRpM0G8dO55TgrT9WVFV5Uqt7ArYKg=; b=ot6c+ZTBhAU1gwyV
 WmpNJooRA0PqRAFpX4tag0OSg3WMKl05b7iroJe5LNDpwAik5AomzJnHLm0aicqC
 gaQcegw0d91UCF41xa6y8v9xp4BsLV7QizTQ9relyABy2JJsoObP05z8uY+TgPKp
 rG5jY3kZahlSaZFpVsBLBYLdm0mVaMu52FghSohrcW39Tf9vapuMmxUTCslB3hAD
 XqG8IwQgLieS2jF4tY/8QwUauEDC057bHCMMD4CIK2v0Qfumg6gM5uTJ27x+dCyP
 KaowG49f8P2/C4t6vlzQ3QTwUMGqzzYmAGnqYa6+UdpXOXQi7jJTNKSPPSQpuwYC
 m8pNew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h998ry-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 13:26:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92ac0a54110so339678585a.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344360; x=1783949160; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i2H1BWjECxL+ndRpM0G8dO55TgrT9WVFV5Uqt7ArYKg=;
 b=NQfyHAFuRN4Thb+0Pw7z5V50WHUd3licS9+7PJ97gSPUa8eKn7BW7mvuG8gdG7/NaG
 9PqOk9gSK6xIrSU6+B486OdojeOhb9RxX0T4hEUleFSH1Kx/r8bjCs8FtATU1ipdvJ/M
 lElHs/L3SbTIHne5gFRL1QA7qI5xHxz8Ga5gRqDn7hZ2C0zWFDIY/1puTvXR27c5rK1a
 2yCGu5HE1kGPp5MF+WywLEE9M4C8cKZWySXTGAJLikIyaZNqsG8eNTeC7Pzw7Qr0IAJJ
 wZFCI/kx1LxCLdsPn8YMJOpq+dLVFX5it/BSALPVeAwq4Y/mXlC2XNaHes6qwiqgldG4
 yNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344360; x=1783949160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i2H1BWjECxL+ndRpM0G8dO55TgrT9WVFV5Uqt7ArYKg=;
 b=CZcYI2hM0ey1AbEmtDQFdJ7hVlFykSq3XfHyBdWsMf7JAgKrNByOnC0RW9Muf8fxPg
 rpkw+UTikJuijYEnnngaF/D/r1w6MBeiqGAvTpBtY6YSeoCxNsH0FpEwhZRhV0iTP2O4
 s8UZYGtDCgtIa2nDD4QDJn7bvpmBgbpj8P8nnAM8pPf8XOFpKBPEO9tEgbcABWFPOUnQ
 26GpMEdiyqe47GOZkHXhYfghhVFDMBzE47StZCRXtpRX3KXnneF8ftTVpKPoCSE40TOt
 vULJ56eRRC2/k5sv4rIzCFysJSKSL8MNrcrSK1WlPPp+mE9G8ItmSF1JYhXLxdp3/ypM
 PY1A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0nnihrkQF9mmj0fXzYwNcgsCEgnTAWYJoXBSMcVYFuEqSe4lgXLEGheI8ZXUb5x/EdTX+LsAhHw==@nongnu.org
X-Gm-Message-State: AOJu0YwotFh/nKfCDuUVZvbiybCsSV94qyQ7fLuGZ+k0ZlHX+TypYTGf
 yUiJAg0kQ+XBQHqN9yOrlvPYjduJ6jcu5kJI0HfVaQrBe+4FJ2Fo07LTHrc2sKeWZxPEiJpHgBH
 dNbPEoaq9X/Ob2DxSnChl0KAoPOJc+vAgaf1oYl2nc8xCO7bfpfw7PjY=
X-Gm-Gg: AfdE7ckq42cmdvMuSNjfT9cyeBR4xkMLXiXBUHjJDp3R4+iGp6Nhi530Z9eJ7fF3Jgy
 S7S/AEtdOb5fzWnxotOwItaA0/fa2gdTWvQhvpXUbBikfhzUS33AexcHQSe1SeUBLy7EkA9zABd
 ujx9hI1JWTvcUzHty7lS7OfKtqDCtPnSxnFVxfXaizHNTiM9Smk4oAXWjKtIxuR5l/DQ+1+ewan
 wyeYPXMbOAzoEYZap0ZSyWaNNYZp/wSjxX23zEhfyf6zq/fTz8sApGtpqkLRj316V3OAk7aP87G
 NDdD0+fo9BZy+FAUn59Di9A4MyDsH0HyiCflzvVrBEbaoTmzrF6d7hpZie52XDoi70I95MZ0Pbl
 A81PlSyLRd7+WMd0N+ph3/0Lz7DeOt+n7KvddqoTve5Mjbkwklw==
X-Received: by 2002:a05:620a:1d01:b0:915:a953:4b9c with SMTP id
 af79cd13be357-92ebb528be9mr79846885a.3.1783344359568; 
 Mon, 06 Jul 2026 06:25:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:915:a953:4b9c with SMTP id
 af79cd13be357-92ebb528be9mr79808985a.3.1783344355882; 
 Mon, 06 Jul 2026 06:25:55 -0700 (PDT)
Received: from [10.237.61.207] (1.171.88.92.rev.sfr.net. [92.88.171.1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c636ea60sm328489755e9.3.2026.07.06.06.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:25:55 -0700 (PDT)
Message-ID: <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] hw/arm/fsl-imx8mp: Add inital FlexCAN support
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20260702184038.178196-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702184038.178196-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EIro168YuXJYDws9KCQU2q_nGuP0h1SM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXxcmRGaFQ1EpV
 2DFK+pXP0bif2GBc9SFwgIJUnhmrtPkTvH3oweRL4+svMtdFfREBDSKwG6JvVEBoidgWnhcjlSr
 Fgq5nZ+B+ZEnsqWIW7eD/e3jx3wLhq8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX9jTYbPxqZ4+s
 k1ja4HeexuETqqzmKVt/u8C3FM3/V74nfBkiotUEjZ88/dSV/EO+FwxLOXBtrB0Y2c57UKv0DPC
 bQPq4/K7o80mWAI2zPKpd0zZHr5/M9HElKt4RwQjy/ucIEYK+vTik8ncAna0L04vWVF21asWmGw
 Qu51j9JgTPu17QFJKjyhtTHECROsaBwP+0cP4939nTUJN76o1rrzbOPWH87BKYpw7Q3NjsrfBXO
 tKzsDpk3LpVzmj3IBScslK+V13+cr3Oekh7T8bhb92NTILr/Sa3TfSsfVp3VHtJ2vGKUNaw0mBr
 MXN5+rts3UUOs2IHwQzX1/kDB3HMUv7AKh405mtAlB4OpBvMgWHUoW7/OwoZ5iE+v5cEdXB5wXq
 pGQquBStq6XTiEfk4LZ4VNtKZ+GPN9BGf956CTb5wUktEbRTJodrXEHMn+bgMT1eLb3t0e4FSfg
 gzz00VzRj/UgFeFEowQ==
X-Proofpoint-GUID: EIro168YuXJYDws9KCQU2q_nGuP0h1SM
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bace8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PLEY+c9/kVlxBKEpvFYBUQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W8GxKYvp-U_uN4L4a4oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
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

On 2/7/26 20:40, Bernhard Beschow wrote:
> Now that FlexCAN emulation has landed in master, let's add it to imx8mp-evk as
> well. While the real i.MX8M Plus supports CAN FD which isn't emulated yet, the
> non-FD mode works well under Linux: It is possible to use `cangen` and `candump`
> either way on the host and on the guest, as described in
> docs/system/devices/can.rst.
> 
> This series consists of five patches where the first four are preparations.
> The last patch integrates FlexCAN into the i.MX8M Plus SoC and EVK board. The
> first preparation addresses the review comment from [1], and could be applied
> independently.
> 
> It would be nice if this series could make it into 11.1.
> 
> Testing done:
> * Start imx8mp-evk and run `cangen can0` there. Observe on the host that
> `candump vcan0` prints the traffic.
> * `make check`
> 
> v2:
> Thanks for the very helpful and super quick review, Phil! Here we go:
> * Add patch "hw/net/can/flexcan: Wire clock control module via link property"
> * Have separate MemoryRegionOps for 32 and 64 bit
> 
> [1] https://lore.kernel.org/qemu-devel/77d5891c-de12-467e-8746-02fe43121e3e@oss.qualcomm.com/
> ---
> base-commit: a59157f98f0b69b0bbdb26bc15fbc4d6c8060799
> 
> Bernhard Beschow (5):
>    hw/net/can/flexcan: Wire clock control module via link property
>    hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
>    hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
>    hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
>    hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP and imx8mp-evk

Peter, you just sent your (IIUC) last target-arm PR. I'm about
to post my hw-misc one, do you mind if you take this series which
is fully reviewed/tested?

Regards,

Phil.

