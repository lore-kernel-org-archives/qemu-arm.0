Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53302C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 10:36:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzXSp-00041I-SV; Thu, 27 Aug 2026 06:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzXSd-0003yz-LQ
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:35:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzXSb-0006JA-7Q
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:35:54 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9Hh0I3524148
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g1yHx4Ee814g0XA3qlGc9mEeDnlyfhtuhU0XBGeoJsU=; b=ei6nR69EQ1fcCksI
 3xe2uaqFUjWJfooD+vNW+YXmWGqC3N/zVFG66JFsMTv8IP1KooIOBQrb9yMxAYju
 g1G/1bSxmqWsOnHdRbzFXjSaWDqyr77hbeehptdM5ckkXyyyOTn/VDm6BjF5UQLx
 G3HuhkiwDRp0aW3z4Y4KXha2Iv72FPK5tTsRl3aS+nEyAO3PmdyrKUW/ujJd5Ko6
 B/4/nEbyFtTFcxLyC3cPFaTCxLKyiSebZOmgf5sfF/H17g/kJ8plbQ3n0A57SzDf
 PuSiiZSRl1739HDk3n0MoiCoq8+YwRAtFTUHZz+FjZxbSrguqAOCin4EXh7b3AYm
 q6qYhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfru0c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:35:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52d28f8737eso35507231cf.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787826948; x=1788431748; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g1yHx4Ee814g0XA3qlGc9mEeDnlyfhtuhU0XBGeoJsU=;
 b=WZNHChNnwq7UYKrvoA1uyiY2Wkl1Yfd87JW+/O0PlPUJFDFUUtTEcuRkEGpbrk3JZ6
 NW0+aBfsx0lUKnPdGiFR8LvfDxpTr45WtN4cqF+bWfFM3gdgB6G/lpEr/V6Bqsptl1FO
 e9i3L5i2gnuFMwmwWd6+sWyLIZW+TS8JohZY6vAgj+Zh4HqNO244kUtRqvmSYVG7cf08
 eP84egsKxOJdtt4NHevLjbSgUima+R67tiAI15lZ1qyK9HMJrCmyBzGVCgrrbCcAJ7Zy
 D0W4YBKCU8ZDb20iLv9zZpMoRfiWUuMgmo/qzuJ6GjDL/YyNTWxt81sNd9S9Y26FZix4
 JFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787826948; x=1788431748;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g1yHx4Ee814g0XA3qlGc9mEeDnlyfhtuhU0XBGeoJsU=;
 b=DkGHc2ZiGGiRTJ5tNyMy4sPNUjKuf3wkX+BrbRVhBOBqXuFhXFM5sQ9vUfCyvE98H2
 NpHHTr9DBtmY2K/zXJwWPUXH2HFUtORXcYbrdklGpSvVr951286pqxI53BqTWU2o87tv
 KTm7hhsSzUv3MgMkhK3tTu5+xl2yYWmwMvTTlsxItFLKSzx/t5L0C7eoOmq2TVyaJ2Db
 pw2PiqY80DNGetXsYnFSLL9OoCtV3iikDMDoDksOw0Xi0/zsCxpiBXAZtlRkSKiM566g
 pA2c+L3QRbI8Pk9w0I/mG0ngsuEeVVvUB2oGEIFtbrCymR8PBPp0zrN74SUCexRfJV0s
 vFMA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8bkValfpmteOSdzxlZelNrhi4ydqdAbQ9SPpMAJOWpUHjbCqxxl/Qbi167ClVGfrSVY0x4IBWJw==@nongnu.org
X-Gm-Message-State: AFuF++mjdm01P4JF9l9HHuSHOhIrHwj1YF6URNajVx2f5KGSc7dWcJWx
 LskBE3QTm1dVIdiGyFRr7+XBSAxZPDr7B4NPYa1d9QLMjcuSahCGou28SKpfHhUH1ot61RKT0SZ
 N/HYsrGEK0Ne94kXa4eryaXOUWVwrsKLrpZW9kZWuAQ9myF1yKks/Dyo=
X-Gm-Gg: AR+sD13m5BAmW9Zmx4hvnzTJC+/lA+Kjw3O3BdmCw6qANFptuVWOcSJPutJmGnGAkVm
 ry/NZcSKbgSxofXa6/B1J7E92Urcfhb7t0iIoQkIh8Dc3iC02VmGGk6qmKhGCmLSyF7PU3mV5FE
 Yv94aESpbdrkXAi+fxs2DMwPzKFFWL0+aAIxvIONq3V5ZECmknsHI0IsR71YOWlBOol2Pp3ML8o
 zDOty2GGpzOUH6kgTJC5L+KzTbHCHlyrrxUVlDiFqveBedxiBalTr9zKYE7EKJ0DBKtMTuARS8i
 K/GrT/lKfbgStq1XYDviISNBvUdGD+T3RO+fmvUSQrZRWMg+FV0ZNbEGhuXPsRpJRKaXojgOZ84
 UD5ydl7T+tvC9PA5EDHc5qy3nIc86gFOO7A==
X-Received: by 2002:a05:622a:3ce:b0:527:7a5b:ca67 with SMTP id
 d75a77b69052e-52e423deda8mr129226251cf.20.1787826947717; 
 Thu, 27 Aug 2026 03:35:47 -0700 (PDT)
X-Received: by 2002:a05:622a:3ce:b0:527:7a5b:ca67 with SMTP id
 d75a77b69052e-52e423deda8mr129225391cf.20.1787826947123; 
 Thu, 27 Aug 2026 03:35:47 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4d08d86dsm40967145e9.12.2026.08.27.03.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 03:35:46 -0700 (PDT)
Message-ID: <4522b97d-5399-4bd6-867c-eade341afb9c@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, stephensportia@gmail.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Troy Lee <leetroy@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Alistair Francis <alistair@alistair23.me>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4xWhjGeZSyBs07aaNdDtFFWcs9YC0lV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4NyBTYWx0ZWRfX1hoI4rEAKJoZ
 0sI5g/N707ZyagXadN2sP1fi/1vSUfl4oky1Rw764Vzda/WWG0AXzttNWiG/WzyaOflWPlSN05l
 irG4e4M9bkLLid9UpOPsmkcueFeq+87WXRNHgp0cy44BsQyS/MxUNPa7K5QDd+VAfw93P/3xzKt
 fb0Lr2xrCMdNMJCDigfm0OwX2paTO/lo2WbDzx87ymZOx8G2RrMU3/oZc+RZYPR+O2kcUw4358P
 rm8TbRlykKnVRYlwU9vtoravf1VU/fbffvCCzNvZaKl2BwXbaTav/RhFUMRGHAan/4xUPo7YUJQ
 cLnGXA60TGrUMI31ucnWLpmIDEhfpixqMjA5A5Kz9+1aJiLzXSG2KkidK8clivUoC7Ck3XZeIbW
 U+qEncuiUFx1+Z14PlQnQIraTVdc6oiKZexUY81sRTeNmI6QP9W2NXK9/0dFXHPj7xGEyaJmxw+
 ZqT+xrZ2NPcWTqZCyow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4NyBTYWx0ZWRfX/x6jPsxb+CPQ
 S8ozt6mQ9MeTS3jB8jQpCxj6kPt6rnqVuZNW4cYxpTfV/siOs0/vd1wLESNKTHNSNYBhPopd0Rf
 x5U9sjiiPW8pjIKGhbyVm5JKAgUCKWo=
X-Proofpoint-GUID: 4xWhjGeZSyBs07aaNdDtFFWcs9YC0lV_
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a901304 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=jNFeHvk_SeYrjZSZ0a8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270087
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

On 27/8/26 11:19, Peter Maydell wrote:
> On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
>>
>> From: Portia Stephens <portias@oss.tenstorrent.com>
>>
>> The ssi_transfer function comments say that it takes a word varying
>> between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to transfer
>> but there is no means to indicate the number of bits that should
>> actually be transferred. All child classes of SSI_PERIPHERAL class have
>> transfer functions that, despite accepting a 32-bit tx, only transfer a
>> single byte; m25p80_transfer8(), ssi_sd_transfer(), ssd0323_transfer().
>>
>> The current implementation depends on the SSI model to know
>> what peripheral model will be attached and what transfer size it
>> expects which is error prone. If a SSI_PERIPHERAL model was written that
>> accepted 32-bit transfers, it could not attach to any existing SSI
>> models.
> 
> What is the motivation for this change?
> 
> As far as I know for the hardware SSI protocol, it is indeed
> the case that the SSI controller (and/or the guest software) needs
> to know what transfer size the attached device expects: the
> controller just transmits (or expects to receive) however many
> bits it is programmed for.
> 
>> This change updates the the naming of ssi_transfer to ssi_transfer8, as
>> well as changes the return value and transmit argument to be 8-bit.
> 
> This means that the API will no longer work for a controller
> and device that aren't 8-bit.

Yes exactly. Clearer than the mail I just wrote, thanks hehe.
> We happen not to have any of those
> devices today, but why specifically stop them working?

I guess remembering having see forks with 16-bit devices, but
that was few years ago (I know forks don't have they voice here,
but just to mention the current API is working for them).

