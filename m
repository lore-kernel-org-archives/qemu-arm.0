Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D4CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:10:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGbJx-0006K1-TD; Tue, 13 Oct 2026 08:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGbJn-0006G9-Cv
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:09:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGbJi-0003Cp-CH
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:09:19 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D944QS483032
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 12:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jDJpC0q/u6BCpQ6aMn/H9EUUQQvUxLmODL92KW0qpm4=; b=gIMyqtbwsRWx/PO4
 2FdkoYcOKT3zQ077KjnqN4SfeJgceuZlfmXx+mukBJJmckLMlksv+pWTUPs7Lafa
 EM67ztEvizyzZEmf1eYr9SxcTcEckfkYNiJIwAxMTAlTmiVFVP1Ikqo8yaTbuSBr
 TlrwdQKyvq3v9FdTpOlxyGfN70rUS3mgM8dqCeGzanpbR3kCB1eBH1UVSXE2+ha5
 LRTkVU5EGArGnBdoL3PrjT0lvRC26QAFCqk0o8B3WRBgN/2PgB5gQqOknoYoNhgK
 Y8AclqEkl6X93oo2MdWfBqBccEuAQukolHo+APGg3EaZV/rR0Xpk3efKVMkQNHu8
 f1uadQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8rj5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 12:09:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5d88f5414dbso894844e0c.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791893350; x=1792498150; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jDJpC0q/u6BCpQ6aMn/H9EUUQQvUxLmODL92KW0qpm4=;
 b=Jc0wsiHMUGnCe7qJRz0XYLzDmbX9XUCJsQRmJtEM6RdElCs1q+54OwW3rF6YMSdArZ
 0rWCjYf2WHZWGKfVkKdXsAi+Mp2qBKY0cHte0cCKHzuYFKBub4gce5KOimQ7KEiKiCEw
 nkSCFH0TuHCIsvfDp0oaHtjmjzaovlEb8+BHoymfTRnrT3O9uqTbMPttIjaoiIa7x3uK
 MVPxzfpRCKsDAwDeaK9fOGQQr3Qh0fmgMAU2o9KnvgNmNnn7v8SGGPd3KFYItp1SpM1W
 yn6TPi29VkX5i0gixskCQnIbskVZ2MSqXnIjf7/Z8CeZFKTxR45LtbYtoaa+ERdNDzPZ
 sPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791893350; x=1792498150;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=jDJpC0q/u6BCpQ6aMn/H9EUUQQvUxLmODL92KW0qpm4=;
 b=xL/gpX8dakseqxI/MNwi/lI9aBq/2or53nicxEKuxFLBv9gID2HPssO+8UnuSouvXN
 17IqdyrFjgkdaS/StI0rtWfN207Yn6K0cOm1YXK9xOB86Qd9inf5X4IOYXSL9gg1miVZ
 mwM6nT7/Kck+ZHL7v0vRN/9lvxkpsm0rmM0+hTF83uFInrWi5Q3/qvXt4BFElnR5pcd1
 FRgkZpBNoH+GY+Z2QG9+LJi9kaoddf3BxGAGgYo/NkHGOIZ+AhUualMjpTH2fr2VJIun
 b4veSkqGlDOx4Ycy6aCrrvTLI2hAVU+nu6JSGdHrEZTiGIqKk7YORdEcDc1OmgvjVOVX
 x3PA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwdsSEkiyO8mq7U5DAlrA3ER9o73wC7lp6hgV5tEAklWKEnoa1di46K/92E1icBeRKGX5qqbVvCdw==@nongnu.org
X-Gm-Message-State: AFq9FYKUOEmeWwJk3dRwseONrymVkt1DNjYxh2bI3pMUpZU9XpssWUqR
 t39DrWoDROMPMUP4GgEgAXPi8/qEcI4g9nhEeS0B8RKmZcdYuv3MpIIvWrJlt3iznMAayERXLrF
 IBw71+Fe9Zi3asdIXlEe9BS0Jq45nAVgZlXi1x7gOwPaSm61zDHv/lfc=
X-Gm-Gg: AYBFou0RF1BgarQwsoVPCg4GjvPUQA6eCZIvZfn2UYxAbl8nwh+1HDsqnK7ac5gpSL/
 xIOODz2E6EknwJzpADjrlJ9aEYxOUUqI3PnHvFn3CEQe5cpXKhL1t7CPObFiB4NME9iss6/kjR2
 4PanyRXvu0Mtaer2p3uho3J6YYXvr+x3B/uNRNbSnPGcnoAlxcwFQeVocDRuW7Hy/IwpucBmIY/
 1AsR7a8By/3za2FMxV7yIE0eWSqDEBYLD2P5iaScv7WZptFhcGOm8G/6BjmH66l4xp/ccg15mon
 NhW/qFfoQ6iHm1Q0SCrrvtg19fcCP1eX/yrfnEL+yx/tFm+0upww1EkzR2VztJqZcVYABC5Z1aw
 keewVHJpbh5GghTtx9LXGPGO5Rb6TWN1l5A==
X-Received: by 2002:a05:6122:3a06:b0:5c9:a60d:327d with SMTP id
 71dfb90a1353d-5e91f518afamr3728782e0c.17.1791893350232; 
 Tue, 13 Oct 2026 05:09:10 -0700 (PDT)
X-Received: by 2002:a05:6122:3a06:b0:5c9:a60d:327d with SMTP id
 71dfb90a1353d-5e91f518afamr3728654e0c.17.1791893348748; 
 Tue, 13 Oct 2026 05:09:08 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2343asm657347675e9.9.2026.10.13.05.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 05:09:08 -0700 (PDT)
Message-ID: <57f772c4-ed27-42dc-a70a-a68d41e1e399@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:09:07 +0200
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
X-Proofpoint-GUID: 0fQS9n7dybmbndU04_JD9xAv0D3R4jU3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OCBTYWx0ZWRfX5WlYLRVocQxo
 c5K8hzKF6zMSPj14RViZ8TdG+/MXYeUJmobnpgdJxoHN5dbltH/3rBiadoJ3jRH7DvvE6EqT5+T
 SJ8ika61/T4EkRBsTyjuBLco2Lk1hUE=
X-Proofpoint-ORIG-GUID: 0fQS9n7dybmbndU04_JD9xAv0D3R4jU3
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace1f66 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=1X3lyv8EHgKgKI1ETugA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OCBTYWx0ZWRfX3yirSONUXuUF
 Z5ZRAC8wCgJMB0IuOr/1Um0F4a7ynJ8O/7E0QCOryT3d+aiDuFKv2z2nFNwd4joXxSmtIsUuOt0
 RxEaz0l3pOkc1S/hm3USEUvN3PSOJbZrpRur5X36AE9SWnGeaA1ADEPb0pBXmoZlfgtlXI0IAtK
 37W9Rma/0aUIzywUi0xDiTYkC6yiR/1lxPisqPe3pFc2EIsYMrfHbZzRQUJPhA/BZjjqL37BmR4
 me+i/mOow7S6Bbb+VED0TbUlGPcO8yE28z2huPxwJ2NVE4oJzfQq5ABJ+jE18AJ0sE2c46SqLYq
 0gNT0kBHw+pfknS8OQNqG98vT7DrmXftUJx40E1wI0V0LtaiVMl9cEJRvJRIW2rKhBDJS/EYLgK
 oHsPNhpT80p1qHaxOzWY8DOlnocTyL10hAXEJk80D9bm7/2uYgcTnnddQwQcT9V+wo7SOjWpZbD
 AuyvBL+l1ikTQpBgHwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130048
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

On 13/10/26 10:38, Peter Maydell wrote:
> This patchset adds virtualization support to our GICv5 model, and lets
> the "virt" board use -machine gic-version=x-5,virtualization=on.

> In an ideal world I'd like to land this for 11.2, but I appreciate
> that it's a lot of code to review and only two weeks til softfreeze;
> we'll see how it goes.

I did a "quick" review (2h...) and couldn't spot anything beside few
typos w.r.t. the spec. The overall logic LGTM. Better if someone else
can have a closer look at ARMCPRegInfo fields checked, but since this
is experimental anyway I don't see any issue having it merged for 11.2.
My 2 cents ;)

