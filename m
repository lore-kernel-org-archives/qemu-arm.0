Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D96BC4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 19:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGW5-0001E9-6i; Tue, 21 Jul 2026 15:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGVe-0000yw-Te
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:52:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGVa-0007Te-RJ
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 15:52:09 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LHPFZS2114782
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i8JB3+qE0x4vA55Xv4ufbV5uBfQRgvC96+d5Uwqe+gw=; b=Bvzz1nrW58d27g+z
 /rU23yYcTHH/UuukrCjWGrNEn053gLKHuqkPgUA9Td440kkUwwhRhzr+Z6bxz2CI
 yP+DrO+Ov6vKVFT2hHrpIVgWXEi/oQZN2hzoSckpglEsEY3iG1KuDftLRUnuX5+w
 +WoftAutZpwzVxbwnfyqk27ZeA7G6CrWwfym9atFkeJ037TenI5665ZEcEc4QN1B
 G4Z0G64vIoafiucgSCQgd7we0N9BKFV33jocbB7MmTm8kZyLFFHq4Vv7fZahd9jM
 IGwTH04nqSb+iyCjb2Sn9W1PvswgbVydAUyfBu1agH1jmLT5+cw3B+VMzHiEWeNE
 2+qAkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0mn3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 19:52:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1d137a68so317921941cf.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784663524; x=1785268324; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=i8JB3+qE0x4vA55Xv4ufbV5uBfQRgvC96+d5Uwqe+gw=;
 b=CvHYNRk372MKijAB3h65mPNIWbu5EAmkNPE/P9APDF/R4SZenMXnU7+1A+pkdkA7GM
 BWf8MlCTngZ1ycp+mT8UYWlCFZCDklAUXhw8xoeaatX5Gupzew9rkZsflGGwEehpog9z
 xZsYWnsNuYe0gr1TKt2vwYXQq4QvzXPEZYuxExv+tr+0GQ9fD42ohLoR1zT6zs6HcrJE
 kldMnLRAEsMivBYNKtZaJk/iRFuk+2+XXIDfT+h9lffdfGRJ0ElUKF8d+bIi/XyyEdqf
 XFLXiQHoZ0nfyGSl7ybzfy+5EhuhFUUrdxFdW7gLh/++zMQ1/fOIFKBNkUVpRVJACkJG
 scmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784663524; x=1785268324;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i8JB3+qE0x4vA55Xv4ufbV5uBfQRgvC96+d5Uwqe+gw=;
 b=VjKeUMmRfgRMrKXdmQ01EDX/2V7N6BQDzEIYbehUQQjtLSjfkmJ3TiHqJT6+iJg4hv
 Tg0QIL+lk7xUyOKo3X1573WVegMuyAKFblNomWpKrGdaT0xztrm5ObwlJuPTqICwubV6
 rNLlGWXFfpZ/aqaOuxlmGQfCiymnIEEWtaZSTISi9SB4oC3XtK7dfRqcv6IpPIaOvhAJ
 x9VaZ8jMQZK5pJhJlsBIDI5+tMhl8SJwqC4UgtZuGzbrWEGekZioBweFLN5Kd/UBfHlb
 ahxBTIczcoTzScXZKA2QBW2lSudxMIsyeNTMWDTU/XcCnomkhk2/xPHd2OGxapvEt8ti
 jrTg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLpeeEynV3yeU/EyvlvoT6vjdB8y8j/nQCIaiWEdUBtHT6qFehB0t9EfbHRwBzw+NkEzLGYAfivA==@nongnu.org
X-Gm-Message-State: AOJu0Yxv4t1ll/PMDnNIMTA8noLeY2Ye1nW2qYohx0+0xnK9l/gIPZJF
 QvUBs+k2Jx61pm5PjNnosvVh7inWNJrpk/M+YO9mV8Jn5tAsWyrvivFlv7I8up0fjwh5G1GyaaO
 jL9Irya5FheIgzdZeyGONY4xo64YHrLaMK019JlpDn80suxwmy8Lvkao=
X-Gm-Gg: AfdE7clQxvjNQVHVjHXkbotbJGAPM+CEOwdFSf1o5qnl8j3JTk9H5guFpBn4a8T61oO
 Q6nyzHZfFY4KRo7ZyUCeQ76OhOtuztOSyzgu55RgwoM6OBm3+tjl/mvNaGTmz7PQFfL86Sn7VAT
 SF/K6JmIX45HF9dWk15UM7FeO4iAyur/S6M+q0/r1QaF3e/U7aSxXbF4SOlYa4H8AmSS7iaR3kx
 VG9tAeZFhk2hW7EpTxK7CkJqPjNzWVxVVg6o3l1N5SIuqZg5SqnQP+/bJAKgV3B2fh+kKwjhB8l
 i3We26AjQ17znJWccqgV4tUNBk1BlsYmlkr+PnZMAywwgFc5bhNklpj7kXfT8k7XTuCOFd9rvcl
 B6e8X1pdbS6rdw5TCylDRTWtjcN+7cyB8akcRt/YPKZukWmcG5o4=
X-Received: by 2002:a05:622a:1794:b0:517:7e6e:708f with SMTP id
 d75a77b69052e-5213e77dae1mr189381021cf.52.1784663524327; 
 Tue, 21 Jul 2026 12:52:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1794:b0:517:7e6e:708f with SMTP id
 d75a77b69052e-5213e77dae1mr189380671cf.52.1784663523845; 
 Tue, 21 Jul 2026 12:52:03 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7f55sm36833932f8f.18.2026.07.21.12.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:52:02 -0700 (PDT)
Message-ID: <55eddf16-0db7-4589-b5a5-8632e434bcf9@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 11/15] hw/virtio/virtio-qmp: Use
 qdev_is_realized()
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Luc Michel <luc@lmichel.fr>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20260721-qdev-v3-0-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
 <20260721-qdev-v3-11-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-11-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E772uCSlq5fbeOdzUOr_9hKLHGl-DkUH
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fcde5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: E772uCSlq5fbeOdzUOr_9hKLHGl-DkUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX4VbD42rzP3yY
 vdTus3QJlrJyCGwcfElcNllNwAvxdOTPtBBCY2Bf4fHcT+eOa1W7UT2gDKSsAmClTQfUpycAd9L
 RQh4JYkcpPnZJaP4NvVgLUv129HF5xQrT00ztckNcyVpvA5FumxGIbZVQKoEKgJxmovvunerZvo
 Y8UqQHrlPgNzPxwLQCtfT7h4NTrvqE+AQc9hFWR1c4rDdpA/OgyeUj/eVU78XvtQSfHdiHMTS1J
 epoveeTJGHtderAI7juHW8ydqDA9QrMKzIFE9vqAcE//sb0DbeXoEwxLs/93+nDSrXRVD2+V0EY
 D4gn7t7fTIEfOkNoWYxO+BRiZBEiUn2k8onSAVdNIaxmGRYdKV+o9GEpInx4zn9LoAIqY29ojCZ
 xLUKAFbyqzx4/OEj+lzeUdcvULnbzKlMxnh7j8c3dx0klpTdq9onZOlC9GPcIcLN+9o5tjXoPfq
 VlzH39XghfPboLC3B/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwNiBTYWx0ZWRfX6IUzUDDbaJR6
 H71IrDbYgZvuxv7+kXIQPpVQFZAkh1EPAjkywynPPiFNu3RLCgDKI/Q2Mf9wmISfjBwObYa3VyC
 /cEvBRTk/0GpLCA3FycGMHpMJar1BmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210206
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

On 21/7/26 10:17, Akihiko Odaki wrote:
> DeviceState fields should be accessed through qdev helpers rather than
> directly. Use qdev_is_realized() instead of reading
> DeviceState::realized directly.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   hw/virtio/virtio-qmp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

