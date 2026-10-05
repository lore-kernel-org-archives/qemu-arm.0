Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BB7CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 14:36:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDjnJ-0003iz-1B; Mon, 05 Oct 2026 10:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDjnG-0003iR-3T
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 10:35:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDjnE-00030B-8R
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 10:35:53 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695EOxrs2178387
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 14:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yOlB1jYytZR6tJPLyf8evQw371PKHRJPrxYneoPMRVk=; b=kAzp8mK3KDITe632
 UQ3qdD6ctoO6ITb8Dx5vvlhTj+mvhW9yTq0r70g7cay0wJVI1bEueoA5zLx5JDtE
 ypLWVAQojsmuWgKwbrVaoTiFHCvtn5aJYFJqUy2MGdgpwseA53MO6e4d1GKAA0NE
 zYJebszYwn21+l/W2Ea5PwhEDGVkFvYz8PU5w2ZhAVNaOCZy6nC+KMHRqM29U2NB
 tcikdNIOaKPISh/9su9Qe3+dTgZXYiX5wLg1tnVsr5eXwYi4Q5I+ZW6J1SNvT4cy
 i5LYHbPbCKqDJl0HmOORefnGkSX0LfYf+CzEVWNzH3FuW1nN9YMpPeIPW3ZsTDLi
 Ddju2g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj60c5y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 14:35:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7c02e1df088so123432137.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791210950; x=1791815750; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yOlB1jYytZR6tJPLyf8evQw371PKHRJPrxYneoPMRVk=;
 b=kgp29D8zlE6zusy33QFKv1yQsegamysADSDWEVc4ldrGpyJGg54Oq60aVKhP3jXI8p
 VWyB+QoUcrg0mQtYBqITj7964SImEAXTkk6EdwcEYWML0TPFjSBukyye3DhjQTL3mk5b
 //OJUTIyBhsEEqRERxsFw1FvXFIRk3dKBP2Wqjg/nGgclGF7SlotFcQhwVKQkImNOfrD
 dHgT7VZ54971uqkAf7s2Ni4qkoJVw3anNrszCfg4I/gWzCiUA5F3tJ6lV3rJtDQtcbXV
 vWE55sFfTvIDLpm32WJtTIw17BkR+WfxV1l0qYtNG5LyZjBLeI6OdL+KAAEFcmaHb4cy
 l2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791210950; x=1791815750;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yOlB1jYytZR6tJPLyf8evQw371PKHRJPrxYneoPMRVk=;
 b=vHwFTJnTSxUr9rq91ik60W9ZOFnX7hIY3sdxBWZXr0yO2xRQuOZD1wTKZIP89qLRgr
 YvJYkUhYD9/tfhms17EBP246ZbGtFX1kwWRpS0cucmXo23VXJmcbe3uOm3xDik5oUF1E
 UTcss4u3jetMMkybXTBKnCNFnL1dbbxS84HNLaB4ZXUl+itLz6fowK2LBukGrW0xBxhW
 g5BL++rFX+VYRJMZAjZ//OJ3a9oq3E2aaX3yysZqlDQMOHyLE6ZqMnh6INM9sSoZTx1h
 1ylLssJDK20uIlOxJ/aWAncRmLQmxBGwYHKJRa8luLK2MPYnPLVZzRPTRwbe9YpLm03f
 bhog==
X-Forwarded-Encrypted: i=1;
 AKwUvByvkGvLQ4j39hwGTDsI332Nsw1P1SK+dXtfAWd4HSCjRvjlNnZbBAU2zTcNDLEGCUmqPBx4+azofA==@nongnu.org
X-Gm-Message-State: AFq9FYLGhRTDU38obl/oquCleta7ZBy6mRbrSgaNa9n660T1+UpQgEQ2
 5FBfCAyzgYpzI7ugl22Z+vP9KZe/xfv+NV17FeCUis0eKlt/LaLyO8qU4oS7QJ/hcMkv+IkURQi
 uYdnGt4Wr+8ktt6qBhQD4c1H33SlUOIkaEpPev4MEtrx5d5hoHbnqdZ0=
X-Gm-Gg: AYBFou025Y+P4BB58ZhSeOnLtiOIYxT0VbIot9tENMXuapBoQUHmR20nkXG/qBiL2bd
 Qyld0+ZePaJDlqS5a8sxqIWC1lv3IVcu2XSIdf0XbQCzNPDHPwb2gnNrBP3wbFkMzPteMsgNGq7
 agdZw5Yn+mPWAnMaoYbzxzIrqd7dIAIHxiHDL3zoHtYMz9NlJOlahD4711IHPsBGzODkcWvPzNT
 6raQVeJ1mGisUYwYWXMCgVRv4II9P+0Bq45txbZbdwHb966JDbxUcnLogGdnCmgD2dHT5IMXjQl
 miDE46hX3oStzx9m/4GizkIKKmB1PXbyR3nThfYHnTMsoUOOpYufsw4mLdCX4ZWIq7WB02gLEww
 gfWk9vXuCfbI29wy/ImjJtA==
X-Received: by 2002:a05:6102:160a:b0:7c3:43cd:6f9b with SMTP id
 ada2fe7eead31-7c343cd7261mr1055985137.20.1791210949678; 
 Mon, 05 Oct 2026 07:35:49 -0700 (PDT)
X-Received: by 2002:a05:6102:160a:b0:7c3:43cd:6f9b with SMTP id
 ada2fe7eead31-7c343cd7261mr1055975137.20.1791210949097; 
 Mon, 05 Oct 2026 07:35:49 -0700 (PDT)
Received: from [10.111.138.48] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17125adfesm118757125e9.15.2026.10.05.07.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 07:35:48 -0700 (PDT)
Message-ID: <8affd0bc-1c2f-488c-88b9-af3fd7a6571c@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 16:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: SysBus reset and heterogeneous emulation
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Luc Michel <luc@lmichel.fr>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20260921214710.29422-1-shentey@gmail.com>
Content-Language: en-US
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1NyBTYWx0ZWRfX+My7UdSoKc4X
 B6ADUPG+alxgNCa2X08jVsgosS7bpHh/btUE2EdDtfwuFLPmACx06yXDZwHglyL+7Yz+Aul7V7t
 qGaZBuCm3zSJ8lgCiaeqyNuKO0s0hw7on5peYb54/N7zJjPN7qO6lwk9o+YW5gMt9oVEpcXsxgT
 FN/sJhH7X4Wsb93zwnnXCJ3aWXPPB29FB7ITPEvuiYreCDb3Kk4eNisGlAzuepgEIUdgmK/knjx
 OksGZYhuIALAsq154+pwvK7y3u/m+fo4fMs8j/RIyhZ1w6Ge+KxgL6PcHKzj+3L9pkXL/P5R9Bs
 ou2Ho/2ur72lm3aAzBcML7bLHQtBnlaSmW7tndzGdn7q0NF/PnbQ9rgnS197AokohMI3DEplTP/
 byVYuVLDqOdWNcFyuYZXA1yAsnIvXuLa805VAWfSPaYtth4LbIGM9/36rl4cVE7QDqgcQKTgxAw
 zgkUCt/CsmfeakNEFgQ==
X-Proofpoint-GUID: 4z--v6lcgvefqSRoy_1OpkrtLFg9zcGg
X-Proofpoint-ORIG-GUID: 4z--v6lcgvefqSRoy_1OpkrtLFg9zcGg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1NyBTYWx0ZWRfX7dTUOByFTvlL
 f+NYLEjFJd4UQKv/ZK0AhEplJCOl8QvJ+oFQ0q23HtAqIXkHYDltkbTwACQwFM1Sn9kZjoR/tKu
 hF0WK1OO+mA1ajay4IPXACMRl9DUauE=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac3b5c6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ENv9LmeRSArDsNedD5MA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050057
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hi,

On 21/9/26 23:46, Bernhard Beschow wrote:

> Patches 11-15 turn the remaining i.MX SoC device models into SySBus devices
> which fixes their reset behavior.

> Bernhard Beschow (42):

>    hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE

These patches are described as:

   ```
   Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be
   reset upon machine reset.
   ```

This is correct for the current state of the codebase. However
I'm foreseeing a problem in heterogeneous context, having 2
SoCs (like some Aspeed boards), if one SoC is locally reset
(i.e. a software reset), then sysbus will also reset objects of the
other SoC, which is unlikely expecting that.

CpuCluster are not impacted because CPU types are not sysbus
based.

Sysbus API was designed for centralized memory bus and
non-heterogenous machine. It is good enough for whole-machine
reset but does not adapt to per-SoC reset domain.

Heterogeneous machines can not reset the default sysbus or use
the current qemu_system_reset().

Not sure where to go from that. Current sysbus eases reset tree.
For heterogeneous machines, should we convert to non-qbus
resettable soc-owned subtree? This is partly what we should do
with CPU clusters.

I might start documenting the current reset scope. Last comments
on this topic are Peter's review on vIOMMU saying the three-phase
model is "not very solidly nailed down" :)
https://lore.kernel.org/qemu-devel/CAFEAcA9ETg2+Xa+e3quJhGG3KsNuH+DW3puuWaJi-q1psUdw6A@mail.gmail.com/


