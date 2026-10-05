Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7F8CA5FFC
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:27:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkb1-0005BC-8r; Mon, 05 Oct 2026 11:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xDkaz-00058K-Er
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:27:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xDkax-00016b-Hf
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:27:16 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695EPKtc2215472
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 15:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vd/Fe+SRE/yTPzyqk25dZAwLtqJ2dceKDx4JWjNCVOA=; b=aMKNEQrKOLZJZfvf
 m0qQ0Eda5kY6/P6vww/+F0WPo2qb5LivSOA91mY2E4aMtGLyAUUpU37L0L+ZLSRd
 vEXDVyAgmVXdDHRd/0QlZaBTDbP3sWY+C2PtvGJTb7lW7YAaWDmRKtrPYjjy0Mxf
 9iTXC07KiYtfuKm3ZNv9oGU2AP7M/ZIvWxX1tc6BWOwOqPGwUfLM+Un2zSUS3NBu
 GPUak3VETpEkFVTHsKv+TvXhiaTK3LcmjuXFXJJj+z4iDdLvqiIiWn5j/kRennt+
 uqCJguGfU2ZZl8Sx1Aon1ilXNRcFpv+c8fFDfud+ViIUNq4cftuJgwb8f17uwMU+
 ejIt0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgytuf4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 15:27:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-34d49d8dee1so3167332eec.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791214032; x=1791818832; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vd/Fe+SRE/yTPzyqk25dZAwLtqJ2dceKDx4JWjNCVOA=;
 b=NrJ3NN4ETr364Z5ri+EAoYPZbjDswBnce4uPo3ABzGcNIopGiGJihog06It0tEpKIM
 smoxediLuBe4ix3Waln6CPy9zBKQIxRiSpaOgwuZHMjiJkwEdkiaXXq8rHNqCbIkVsqo
 M54/RBSsfB6U277NrJlEKDPj18DG9twrLby5LNZBhbuy9MGdOg3vNzeqD3BQg6isynSE
 0PQaqMV9cEs9SVnwD6oQbfYMXRXjOIZGM55g2Drk5Wn9npBgzAEQn5mC62HAUt40K+VW
 pWo/P3dUs0ZORZU+lEp7jsk39kWz2pmthjiRuzt34iTEVEW3fk65QPuwrPrj5Pw4DwI0
 C48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791214032; x=1791818832;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vd/Fe+SRE/yTPzyqk25dZAwLtqJ2dceKDx4JWjNCVOA=;
 b=pmkjTCR7xkiSigFyqi1XYtipIPR4uo/xeBcOx86mws/XYItAJm3LqRbWP8P3HnwK+2
 PEzmgDqFNS9e/cVfKE0RUSWh0bwRp8x974Eub/4r9+FUeQ7IFj0ofy3cevD7vDIvN81n
 YXsB/BJUfzBrN5XJdf45TTcZGrs+pbvZET0WqjNkA1OX3ofUTmHcRZUWHjYI4USOv4/M
 odm1CfF5OBH2k5PZqKrz7tt1V2YRh+ajNSu0wSOMWXyF6KHNhGC7/IBS9/3aG9PUO4gN
 VSiYp1c3HoUzdhY4Q3fSjuGtT7Il/8qfmkNFJZSXt3Qk1woaA0ZytrCrHuQ28gb3EKpk
 FDNw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSrZ3+FgusXii54hBx73qUPY0qNacxuMUeAV15ViRpx/f4CYyTx77eCH+1qeZlwULyWeeQwSbDmQ==@nongnu.org
X-Gm-Message-State: AFuF++k7EQG0HWwGCgc7H6ZDaFH1bRhVyoM9fd/amhwHkHe108RNvIVy
 7GOewYwXp/VykHYxXKQEa4OvVPJ9DKoBQxjRBeW1rfurk0jysS40ngDCbrtT7Kk6iBrteb0H2Ip
 k05E0zfORCc9t1DwEkC/+1ycagxrdEFoTkOicogPkm8hPr/kaPmgmf1g=
X-Gm-Gg: AYBFou2yrLN6N7yrzzVi0azjDQMa04W8SULs2N0ZqZc6bHMaz4MZhuuy82Asrg4ZV/s
 xxWjEDR9yZq9TfB2SvMd+8AoB4XT350dJPXOXaRNXBTZl81YMjERFp6uDs4N6qJCA+GAfWIcpQj
 7t1U/1QsGzijsSnnIJIfQ5U3QU/fV1ScMIgtjYY074wwyr7Tb40/6LOywMU3LMhMyv7UfK3ldp0
 stMziKyzSIkyOjJcdLSlWZjo36ZaCcO07j4aXQBzYxAQfIz7NWlZzANrPOuG4k6t8ccGS7hvdom
 MntSJkqDch+1MPOIUAWoakt55pqzNChlYNqU2mpc/9jgDuKdadNrm0q0uI/i63LxWO81tWG6jll
 IrjwNpQEtqoYe+wA+xV//sqH1CRoI9RZLZKzYupkEtKqlbaACripPiFmbocE5NzqpFLOgmw==
X-Received: by 2002:a05:701b:2086:10b0:144:e38d:8e52 with SMTP id
 a92af1059eb24-14f5c5e89femr13837570c88.37.1791214031835; 
 Mon, 05 Oct 2026 08:27:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2086:10b0:144:e38d:8e52 with SMTP id
 a92af1059eb24-14f5c5e89femr13837540c88.37.1791214031205; 
 Mon, 05 Oct 2026 08:27:11 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-151fca985c6sm33553486c88.10.2026.10.05.08.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 08:27:10 -0700 (PDT)
Message-ID: <80659d36-1a3f-4ce6-951a-172d672a7625@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:27:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Gustavo's email address
To: Gustavo Romero <gromero@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, gshan@redhat.com, alex.bennee@linaro.org
References: <20261002185538.1020233-1-gromero@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261002185538.1020233-1-gromero@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QvAcE6QiYkB6XtZmdeuM8Esg8wReSRWT
X-Proofpoint-ORIG-GUID: QvAcE6QiYkB6XtZmdeuM8Esg8wReSRWT
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3c1d0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ku12R8h4HjsqBJT5z5IA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX/mlxx3bHXXUA
 i8AJXQhTKvbVjfuDm7KrcvG/GCTOy1UQ0PGCIdbsc8O9DDegsBWLfc4BhBjI8wzrvsTnCGugUey
 ZWMmLUewz9oTaLYvd/1/QSvlvxnslw0Os1RAi2lljVNAKl8aPsbnnapdTZvukqjrawAyyrEXGlO
 q/9X9lRfLtO06Je74THaqHEC7fGUgaQMe8SD90MJJmLayiSRd2jb6hPdMSM3aTX9oWuPlU+Wprf
 w88PZyS78QgitVe/hpZDT71m/NsoF0wXqweZmMGDzBDT9XNMgHcZ/ra9AGWdN1zG4VSZ1l0ntLi
 xyoLV6WclDx/wA+FF73nivY/3eFrA8jjqNaw8/UhOqw2/I3xIQGblMHag94+M/3OZt8Frxwq1HU
 HYB2PmTGEc3O1EYBMDgiJz6URY0XR0C5UxPKowT4NUrR/NSdtaPQMBMqtYrBoUjQzx9WH23OxG0
 Wg/nfZhZiRCocRKe/hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX2oTF+86z72F+
 PUt1X8qyMNTsBPQkbEmajEvjEfPzZB9BUhjd7o6P0tq9wW45NcfN+9b7Ph82voTFT9zR3SMWItt
 Bin+l9cqTwmEd8IpCSVaif/3MJMXZKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 10/2/2026 11:55 AM, Gustavo Romero wrote:
> Update my email address to my current Red Hat address.
> 
> Signed-off-by: Gustavo Romero <gromero@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Cheers,
Pierrick

