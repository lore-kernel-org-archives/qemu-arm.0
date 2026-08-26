Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C6DC61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzI65-0002Kj-D2; Wed, 26 Aug 2026 14:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzI63-0002JQ-HM
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:11:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzI62-0004eo-2D
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:11:35 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QHMA2O1044511
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dJJDHyKkgiP6QxGZDNOvMkdOgtqf8YD7+eMFij3EVkI=; b=F8Qh0QGxlDCFTnLO
 Ww2k3DlTN7QiIkFHLC9La4Gpv76nRpcYazOOG+Z+FuWdI9+nVQE6IHrq+Q5KEEAF
 167yY78PurkA/j2R6YiEwOK9FTtCd8M6tGLUrzHLEe5f0LMVONipB64ysppr5GC5
 +8Gw0+YXVYdAYNyJAJ/79PsdohrdmOV0fZmT65jHfnt0ZibyVYAGMcZ1p1txbqRb
 vsAmN8iVCL6WIjodM986LixlMJujO4hQTZtqk4M5uRIG16qNvQjkm0emtTTsPXIf
 PGg3nXnfGVbMac7pHWGpKqr2qNOx4NGoJEKF+JLPKHZ9SBOoOIypr/02p4ur4UDX
 004bww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwg6s9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:11:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ce64c41efso21124151cf.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787767891; x=1788372691; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dJJDHyKkgiP6QxGZDNOvMkdOgtqf8YD7+eMFij3EVkI=;
 b=NP1TjlkFyH9PwxxmGBvCeN4qUtfMtcrNwPPy0XkDGPLBfhvZ9SUPwbDkM/wutnbCpU
 UkAOJlPAebz5Sgj+EYMtdxL9C9+J97h3EY8KA4lhDTpdqluXL1xswcu73n5DQiPbphLX
 MwDoK9JJfEAtCJSnHde/h0ZbLx7tj0myTtsvsQkQvC54edCD/O26+eUgZb/dDnEz9ui8
 qaminSF6z2WPkmOwWVv+YhgBFEj+qBs99G6FUITB7a1YAB6JwrG/GV1vNaX6JnRVekbc
 rXZ6iSgwHQBYsJ5IFv8xAAH1VJYkgzTZoonAvepmk/hnhEOkWyVg71igDAoXPat44h8I
 GRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787767891; x=1788372691;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=dJJDHyKkgiP6QxGZDNOvMkdOgtqf8YD7+eMFij3EVkI=;
 b=ZDXPIVbGZJQtUwIncxSxGNunY3jdj4dsR3QGFRy+oVMgnY/GiH9o3BEXYcBvhb9zno
 a3ZEsRX4C/uLxaX1xWFj1AKz3XXcQRAurQ/hSlv0zcLQ5Il6xymVsSunM99tmoagu+a0
 fkFObfSXqmfvG4BLwj4KtQ5frjnf5xCdOUAXAwrxWiGFPKUy3JKIg4znkysndcjLU3et
 oWegmRTw+EP9e+nwvHxGXgvsMiBRLIRHthFnRFvd5NAMRznaI0IYPeoraRphtSv5pDeF
 JMOeoEi6fvfGf0jJ5MdP549wqQAIAh70nnK8RgF4LVq/5bbazj3X+yfuGFitiTtxvds4
 DU/A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrh4DcQm9akMqx1Lh0oDEFFkwCsR8cYmQwx+06Y69bgBaKWJive4zNrMqMfsd/QjCuyf1DI9CQP6A==@nongnu.org
X-Gm-Message-State: AFuF++nC7WEMKQgZ+ptt9ZtNiRfUv5YsFav7LreuasJ52plKrw61/sIO
 OPTkgFr8LSF4NoKQ4b71wJi8HEBSnOVbBOHWYmm0CbJca75xVJt51KOcUvE1AOy4K3tRuRRWP8D
 gCN+g8wlCcA7/9OpIK9FnbH8AK6/Q/MTzmDCt786wC1fqUiI9SiYGGHw=
X-Gm-Gg: AR+sD10FDPPEl6vdfURWDdRWvmOd8FQNfLPYfofyyneYFLrP98ZPDluldu4kCsej7EC
 59053bAyN9WiDzZza3bCcGaN4sftCd7YXzUg6Wbp8ZYgqDAb2dvJML4lHAYb/Ju4TCg5/ApGLxA
 7a+5fW/RCpvpL+t8rPbQI6gxV5fGkWpA1cFmwRhER/fDfOdnd93Do85lN9gdmJp9a7vj2Uj52OU
 yPJAD01KLszQgmkrvUQDLUSkqCth7BumwSMVVzoOmEDhD+FS/yJYr4xwqQthw8V5nVwF52Xc7w3
 ADxLFiNSJdGfuICNnJXS42DGin7XXR90sOYg65wWXrJ9DlbZ1gRKGveOkrpBEp83ON55EaBBZ6w
 G3DLYvkWap5/l0IItCtL4RM3V7PnTJd5Udcl61kTqaGm/79tZ
X-Received: by 2002:a05:622a:98f:b0:51c:217f:518 with SMTP id
 d75a77b69052e-52e4222dd55mr88084611cf.6.1787767891413; 
 Wed, 26 Aug 2026 11:11:31 -0700 (PDT)
X-Received: by 2002:a05:622a:98f:b0:51c:217f:518 with SMTP id
 d75a77b69052e-52e4222dd55mr88083991cf.6.1787767891039; 
 Wed, 26 Aug 2026 11:11:31 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5dea83babsm5615341a12.16.2026.08.26.11.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:11:30 -0700 (PDT)
Message-ID: <2d0a87bf-dd2b-4e34-b44d-c19f69923565@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] hw/acpi/piix4.c: convert ACPI_PM_PROP_PM_IO_BASE
 to a class prop
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com,
 aurelien@aurel32.net, peter.maydell@linaro.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260825134320.1039012-1-mark.caveayland@nutanix.com>
 <20260825134320.1039012-17-mark.caveayland@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260825134320.1039012-17-mark.caveayland@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6_zYtrStCWRdyXlxCZWRe_3o9PTEu_C9
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a8f2c54 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=64Cc0HZtAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6_zYtrStCWRdyXlxCZWRe_3o9PTEu_C9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX0Md9T0CP63Rj
 p7ggRFzJu0YhrsYFlipdPsdAZdYfW4rJbhJJPJqlbHYp5a8NhlRpY8xAG8sA7Of6x/ztL0oXDic
 jkfgKZD8CcDBtQVb9oQNn8ZmrhjPcaMdoE++ztQKlq/gdSsYfoOTc5Z9YepOPlj/uPBJqyIAXZQ
 tGhSA8P+MJU6fvfnjrvwW7B/X9a1oLlOwes7we7KjmFpU1ymoyG75l6EzfP/ugcVLLJm1Ip2ESz
 1JLP1e1vjW/osimZm/HcNi35ozg/SGNjCMXMiSfBbdzG71klygSZVrLXYQZaIjs28AZ7p5T2RiB
 JvmL/7Ek+F9esFmXKvPMwmRVE+Eu8DzMJdosDzdRYR+6NHI7yBhyL2NTF3RJbQ/mbOD8NA4kw7U
 oU1clLHsaZfwNWS59flmI+4U362wvLpYFZzSOkT0bhDK4D9JMV0lZVDAohvtsEM73aDtOm+2W+S
 wq82X2cdrBk7ckG+d1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX30wqKDDO3PX6
 PynHh90XC+Ws2EQ4IWkMJ3iEC/WwNL20YTcG3LgTaj8z7ohpdaZ9JvfERHjQiJASXyFH0Vbz7fN
 y56dbphM08cdnrn1cZZFuk+0ULQ314I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260152
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

On 25/8/26 15:41, Mark Cave-Ayland wrote:
> ACPI_PM_PROP_PM_IO_BASE can be converted to use object_class_property_add_uint32_ptr().
> Remove the now unused piix4_pm_add_properties() function.
> 
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/acpi/piix4.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

