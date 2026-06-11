Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A284CD8C9D
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 19:46:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXlMB-000616-NY; Thu, 11 Jun 2026 15:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXlMA-00060N-RX
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 15:46:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXlM9-0001u7-GF
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 15:46:26 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BJEs4s1401996
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 19:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HYLRupdMNNRX040kgPeS3fUnDltbn06fPokcXMIWCvc=; b=mz9xrlWDcqaZq+Pw
 wWuOhFITP1vqHALyXM9bPzD0nGG3lJ1lc64/y7i1APPQH4WoLgEDhN85oPENF8LG
 HKxFkfDjRD4Tvid4LReAt9JyRdvWkBwdXSOmgknc5l2tadvsSsOHb/d88oJVvyn6
 N3mv+/sbJv0BF5L4kIr/wfF5lD4Sy4ko5JET75Bp7eJkRRW+pnLdriBTSZCOnjqB
 UHbdqoInbXnnu8+o9oWhhQgR/zGkQadKxBYfqgiKE/z9psMgK91pE2UdHFucoPDZ
 QTxYixFhI9HWT4tE3B02QpRbgfjR68QzMgctJmHocb86dNkomw4Q5P2qJ2k6Eo7P
 FEYIKw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g847u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 19:46:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-6cf37fe12faso75826137.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781207184; x=1781811984; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HYLRupdMNNRX040kgPeS3fUnDltbn06fPokcXMIWCvc=;
 b=F6p8EbpGI6/X4inx9RLdK7S58lTvaZwCsT2TY9dcveftOWEa/TidIgAPcWrMb4DdKc
 cL5MbgL1WWkwSWTzu7vx7xNStC9pFhwzM8ctVx73B3t/XcwDoGAuKhCeyPylVfvX7/0i
 mniILY81LHjPnnDhUaq1YITTBg7HB4FgLi4J22Gh9XTYc+Wn27jCx6FZQ+KlXNjjptp5
 w8S+NTblZhJ6kaB7bz0aKmYDgc6NYT4J7yuWAsuCrJpLKqH2KSTzPVAPNC/oFgS8PGu1
 ZKQbzFlYAZq1wknEE+iRGewPRGYrSotO1mYR9xzjbjaxu3KVpJjGaxLm31Bx9pS70ROj
 fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781207184; x=1781811984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYLRupdMNNRX040kgPeS3fUnDltbn06fPokcXMIWCvc=;
 b=Dbu9jGGlEgVFWpNew/lG9mQSq+i2tZeVi0ijd1ZTq7uKtcEGc3orS/nVo+N9iqZ9Y9
 Vihexw+zNkEk4d5GYsxNeLVaHMVGoBmGZLq4p+o86QGMHyLVln9DffPVB6A7swpBJp1W
 Dj8nisOSoYq8esTzJujjgR6RdCx6jPCqQX4EprppMbUPwyJrcy7sSkSrlNm1ZLmeYVVi
 smOTeFxk55zSwxPEthoFL5IAS42z8969ogaisBLieSzG6qNbWg2R1Usg7zfMoXDQo3mG
 wxhMvfSvpKbuRA69T0oxJQNjawfeZVph52ZQ/WOMuHdtpkOf+rpEP5ttstvGoOC+Q3wq
 xeog==
X-Forwarded-Encrypted: i=1;
 AFNElJ+D7bpsezo98Sf/2naYJgT31iSMQQbNY4Y+aTAH56mld7/qxyopWM7I/5kOmt5B2U8zQ7xv40gm5Q==@nongnu.org
X-Gm-Message-State: AOJu0YxYKe0eccKiXZn3yUVsgV/gTQl0sx8iIS8/BRNmARXuB0BeqARc
 bdSHUtVivRMN5r+kn+cCuepv9c9IPjg8nCeGyeVXla4YFk3GmDVbH8/9QguBoBe5zBbz/NXNSvK
 1QNgDQXJZ7F5xDH6alwnsuCZ/IomigkQwgdy53LituzgB4i/U9oFeNwQ=
X-Gm-Gg: Acq92OFW3W2XhOxfM2rcxc73fyKu96iKfWg7MgBWJiNEwmKJXQCNvAgnr5FdKFX0Mu5
 vAyG3gosCQZpRTsuKWJk9io4Mk/SCoeQqT823Bckn3EnWy8P3PXg/KEjC2WbTLbsHzTFoHm8S9l
 DwE1vHWdtTRbS+9d6HGP/7oPCKk8IyGOFZBPxh/wSPWMOe12qnDrNvZ/RRhGtLm5FqKLP45a+JX
 4GpGyZdqroeZ0Rfz4pktujkXA0q+PhNlvmo6M4teocek/LfpBOXVhaF7IAVtmfutt1rJ5mnXysl
 AecmwdBJF1qYkO4X81vIxnDbd6CRk6oYr8wayyE4sK6qDwbrmMhvMbL9+OV/67/wrdMMd6tYh+3
 rwWmiQQ12gOXKTJkGudzbCt0GXDA2iTVxNkYjPrysiDfrvVAfjqFhWXaycMd28VkaAy0SLk1i
X-Received: by 2002:a05:6102:4193:b0:631:4580:6a42 with SMTP id
 ada2fe7eead31-71d5cc86614mr3035601137.22.1781207183736; 
 Thu, 11 Jun 2026 12:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:4193:b0:631:4580:6a42 with SMTP id
 ada2fe7eead31-71d5cc86614mr3035587137.22.1781207183299; 
 Thu, 11 Jun 2026 12:46:23 -0700 (PDT)
Received: from [192.168.69.232] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea83d8f9sm7454835e9.9.2026.06.11.12.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 12:46:21 -0700 (PDT)
Message-ID: <7fe9e5d9-a6f8-4488-a99b-e991c74d72d0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/22] ui/dbus: switch LED handling to Notifier-based
 input API
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-21-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-21-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfX8JjWgDHHgMOQ
 URrv+qLpaWnEuUfGH/391kuYMi6X7c4Y2UT9YKrNaDy9ZAmxpV7wlDg42PNKs3HbdBverH08BzP
 1XMeCO92T15bmd19SO0NnHUnsqRUEnQ=
X-Proofpoint-GUID: NM-i7SLgfTPh43iObiKqsLpQ633YICyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfX8Bgl4quWSS77
 mVokRv0VjEhndqlhcNZ2J3jR2/tZi15NwHvb6BvpftwPNzfDJFMHrF8Sz/Ca5jQYANwJpLPo965
 aiga0zJ1vjlkcTQZsPNrM4ca+t9cEJWaHWjG7QDzflYYVfoUh35oQ7ZZXH8eXxTo35R1C2O6xj+
 aW1P39z05xMq2LcHPcnRUrckyRT8UwIW6/VMKlvKLc9h1cKVTMUuJs8bjyDqKUS887mahy95Hbw
 00Zh5LlQMJ9xcqXqKnXP5QYH+JSL76qiQTCWEYUvRE/nPUVmdwOAke5hW1twZUtAYheQtDMplOs
 ZZ1YfWs+gBzgHXyfbkz4p8+RhupkJ26hDncnV/Y3wyA+AjYooVbUct9pEMjpVQ3sm5WI9ccLT+D
 tbLRQ9CVsGrqaQWGflUI7pH7IWBCUWRTolniwMv+1K8LFx+t5YVNDSCL15QvP76VyUIIO84imAa
 rOsM2hWJ3ZgZBRDcdFQ==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b1090 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1k1Y3PzgwnwA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: NM-i7SLgfTPh43iObiKqsLpQ633YICyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110198
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

On 10/6/26 12:57, Marc-André Lureau wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/dbus-console.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

