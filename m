Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69BCA600E
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 20:46:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEv05-0006Le-GO; Thu, 08 Oct 2026 16:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEv01-0006GR-2b
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 16:45:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEuzy-00082M-Px
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 16:45:56 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 698HVRZN3542651
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 20:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SlIkkVNmdinaMRsysy/zu1eyiwLBmRQSUwosJWtN0Gw=; b=dZCGwXJa8LUzroIa
 D4a4E/6A3V126N7wj8UGYOhy9uuAdOyxyUei2HJ1qxOSnYQpecdWRhS0dt31BxUQ
 FOU8QURgyZADECaXI328B+gKnHZPmHSdVtei/ud07t2K6vFcNZhie3zeZE6EVWHi
 FFxUpjvuCMxoHwleIHSaKJFvGYP5Zv+ljquMEoRmShiaRcZjjGOCgdJz+Cxs9eiD
 9gRH0b9KPVIIPlBYb8Zs+KtIAz+3lBT0GzlTx5awcwDNLjx+hF+nHG3Il3H2Wtyo
 N7FOocuVcBmjN4vcM9hQMzdHDkUAevsaLc3jK9SEBOe4BjUEO30YyI/+NYuNhi9F
 dsAW5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj1t15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 20:45:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93be1861d2dso940107485a.3
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791492352; x=1792097152; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SlIkkVNmdinaMRsysy/zu1eyiwLBmRQSUwosJWtN0Gw=;
 b=AL5oHWPMbxt8lnxHo9AgwVtJFjmJajhtO1qR4MbhqslTxU6xJcQFlO5zesLo1bJpa3
 soY9KV+fFIWYdYOvkJ/vWwDwToTY3z8M70a/ecRuNLpbWqaHpxNDY3QGZeDHY6UqmLyf
 sfgzRJ19WB4XTnRYzldWNrKnvzwObTdOsy6TgrKkrOW3P9sTQpcIyXmf3dhp+5TLITmA
 tKcUiHet/8LZL3Il9mBhAgavua2QUlGE0jLjhuvomE37raD4a+9ovryNxTynMLV0ASj7
 kra2xMRbQcSJwE6Ic+YlvbsPvpsWg9BOa71JXeHNMvVhmA52t5iuggY1egeBTOxYPozf
 3a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791492352; x=1792097152;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SlIkkVNmdinaMRsysy/zu1eyiwLBmRQSUwosJWtN0Gw=;
 b=1cU9BQEsKoQbZFdmpVeBAOv1QY+sMZMAU4F+ZbuFMBEkeJskYAc+3OY9rAxI68hDFS
 vSI6y0qAg//51wTygC2IwHLglFzzz/rOxlEh9ZLr+hf3PySelz6z5WlO6eZHFMWAsEPB
 R0w+CeTQ0thsQRIUiaiwVBJq7bekn8xxRSnnGL0ebVUg8mfK320CqXD1O7K/kUeQW8pB
 5QuGL88oqxjW5g43G6+0Ny1mgw+Hhu+nSXG50GAeLoCtP4UtQQ6Q4mLellXRXavTZV3Q
 yUZNZ9tZXlE0mSvusmVzj+RbqU9WmUYTJrj/w1n96nCaXol4bd2b8PHZrsNjIZz/Euac
 SyyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxN808/zFxgTmXD+XC1jAdU7KS661R+L/ybWvRBQFNopp5b6deYlCGGYjV//TwUHLZ1/Le+SZgD/w==@nongnu.org
X-Gm-Message-State: AFuF++k40kJDCPIXVkZ+4IpH+/3lSezt5Zasv7/8x0jZe/QR09N/4mID
 PZrOhtEUKaOEiYm32pqFX9DwAYyndKNEVfBMbvmr/eZ6Fbav4WxzEuePurupes0I4jEybUgUMOy
 bKBvHRZbvOdscSu4LEZ4ACYbDsE+JG5pBdnHMHmIGuK8UU4BJT+eHkvQ=
X-Gm-Gg: AYBFou2BEpR4FMLP7faAH+qs65iPO0z3v4LtHsq/HdENPhi+YTP5xgVfYMer8icrBzj
 BHPRElZiUDvbuqSin5nj07484920bRPoFK84H6z2tzboaHZ/7SgAwtSh1z7YiY5soRahv7sjV+Y
 lmerOeRSv6/BsfsVXVYRdxjEoxyv5INejh6UknjgGWo5ulI2bZhffbVLkWiW99YhTuerzWve1qz
 roKPgg77wO5BSUTktj6CkYag5LbbB8S/M3/Ma3tzUT5bXuaWxl1ww8w1tDl+XTzm/009Jw0lktg
 0tVaOlOEC/KktGOfQJaqV9HFOhAuT7Rjq+V5rOVjBfEZ/kTxZ9eM3ipiudT78f01AcQ9aV6xKJg
 ND9Onqkkmk9F1GvgKlB8HBfXjA5tNkfT7mQ==
X-Received: by 2002:a05:620a:648b:b0:939:6de9:4cff with SMTP id
 af79cd13be357-93e9b7d8dbbmr1280926985a.45.1791492352172; 
 Thu, 08 Oct 2026 13:45:52 -0700 (PDT)
X-Received: by 2002:a05:620a:648b:b0:939:6de9:4cff with SMTP id
 af79cd13be357-93e9b7d8dbbmr1280923685a.45.1791492351680; 
 Thu, 08 Oct 2026 13:45:51 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e30a7sm201386f8f.12.2026.10.08.13.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 13:45:51 -0700 (PDT)
Message-ID: <b898236e-8773-4950-a967-9bb6a12f9ca5@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 22:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Gustavo's email address
Content-Language: en-US
To: Gustavo Romero <gromero@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, gshan@redhat.com, alex.bennee@linaro.org
References: <20261002185538.1020233-1-gromero@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261002185538.1020233-1-gromero@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4MiBTYWx0ZWRfXz/Y2ycuo2MjH
 UFZD2/SAt7amcbgUbHDKTVGDF86hs6cbLO50b56pBfFkkZ4jeG4NhRn2u1JFm5imi1vFIMZcLRt
 bnZ4+qBc+V2aiKAfYnXkQcPnSUVFAmptATDpAwJeguOhijgm1npEHDENidCp59PoSA9bDAP3YWV
 XaEpf/6InhlG1RAmPpf+C4hDNMQk59oF3s84NfRiWgVBqk+/3jkeZbP975rhDlcM5A7Zyly/1K4
 qVTHuNuwsElrYYECrjE/b2HWVGHws6L8cs6HjcK1/IvrICA1u/Xt8SfL5Y/fAAb9z+sCJJyIJSA
 MzDUtqxwPDX1nYPdBFq2VruJ0KoONUpF8HUjfdlOzMz+NVqg4/tzUeUNPLYgSgoTZyY6cjIiGnY
 URKCJNJBJGey1XcH6wcLfoQbGrNdAZZHGJw11bd9EEBIKgn2oCjp9D7Mm2yJjcRsy9Q7NZcK0uT
 p+tS2tOpPbn5/ChPUUw==
X-Proofpoint-GUID: uDXQZQqVTTxjxEUbnSg10ZYK7huzMuea
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac80101 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=ku12R8h4HjsqBJT5z5IA:9 a=QEXdDO2ut3YA:10 a=tXfupSrto38A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: uDXQZQqVTTxjxEUbnSg10ZYK7huzMuea
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4MiBTYWx0ZWRfXyga3a8epWlLr
 AX3EYlG8eLrlfQ8q1GfFs2EzIUv3bvzP0BHTZXlfQAXz56EAhK/Bs5n4qRV9lxdGSTKFD+P07se
 RILpTP86Df8nWiLiAxuASrh9Eu9Ghrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080082
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

On 2/10/26 20:55, Gustavo Romero wrote:
> Update my email address to my current Red Hat address.
> 
> Signed-off-by: Gustavo Romero <gromero@redhat.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Queued via hw-misc, thanks!

