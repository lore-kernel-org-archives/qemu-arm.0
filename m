Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E805C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:28:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljLv-0007Vw-0e; Mon, 20 Jul 2026 04:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljLr-0007QY-ET
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:27:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljLl-0001nz-QZ
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:27:51 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6RWXs1420216
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AtcipE+L4qE3mzbEqfcbIU8yjjGVG3Ie9Nfn+3tw+Xo=; b=QT/TNIQycPOBIBIx
 kzhLYpbKgMuJJj4PNVY3JKqwSeraZrdOr2BpcGToiq6UeVOTJrBHFKE3yitfRLoD
 0VRZUbxTTA0Z4cbwJ+lwPz3kETS5eZpTLZTOh1vAx3UFIF5GXUptL1E8gkPC8WTJ
 qJDNPczBk4MzuBOLabW7gpDCIXobqGtW7OtTLOW41OAoXx2B7JfOdlWHD/UJZvMB
 izB80d4Ye7SETGePzf4BFFMf0iRofRPaoKptiWvJ8GgO1XU457fD6uqqnoEpEkGM
 DugwVYZlQR6Y7tqYWPMTGl3A9wGI4EP81H/aTAr3UixDNTSNPDaQEj9zihaUxiPC
 CjJSFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7w4e2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:27:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bec738909so109439641cf.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784536063; x=1785140863; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AtcipE+L4qE3mzbEqfcbIU8yjjGVG3Ie9Nfn+3tw+Xo=;
 b=UhjgsE5dtWtVK1K+OB3ls1rfuynvJC62kirU4x/pOkG1LIMLgpVr9NNxXQqdUlqdnb
 rEkJiLqauDtfiOAmlASunW6F3AjbxyIRAFWc+r2NnojyQROS1fjcujTs9DtPDYqkTkBs
 2U/fVFAejdyHdetnnUMqbzv3R2yDDYEvJp8HBMygjMXjLbfr2RSl/xOQig0GgP4j5vCo
 UYfFKSBJqcx+tOkFTcvcQHA6xhzgzvaXqe0P2fJL/u50PZg+a7t+XXExjS/l69S8lnCy
 12C0ls00B7MP+bSakC2gmciRwUSmQUn7ckSoL5xEc4w52VOuhgX7cbjXoIg9erJ88AUK
 TjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784536063; x=1785140863;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AtcipE+L4qE3mzbEqfcbIU8yjjGVG3Ie9Nfn+3tw+Xo=;
 b=NmTlBgS00eeTXFbeWdVogO2BzdfYuD1LQoJTp7ZmvMFx5T794oRP57kBMH+WhEb/ah
 jpBWtYPGp5Y8j1vx3HjhylmxwpXUz1Zhuba2BAlbSUBO+kATzElNMSNe8A6mltxd6cjP
 yH2e3CVRHy+TWJCSkxZksNKhDv/zi8s5aqexgnLBfhVL3uCQo5DSIA9pFcV/by/yq9Pw
 n8lbZpN6pbR3jnhbsnGNVOju9ER3LL8OG6TTscxCq8ZrxyE9ZWjYLxyBgV+rK3NLOGTy
 bGHk/L7fazWNDnmqZgwE+omAlaxejqA08fqHgm7EcT11M66WVVKrNGhcLNOjmtEM/8hJ
 rnpQ==
X-Gm-Message-State: AOJu0Yya+EBDLG+WosTejwdxzCXncNvT4vEhf3i7UeMfaFr9MZ61C6Wy
 iNRmI6jSD+xI6PJovDva/T1C9H7Xr+hNfRi9rFyFIgAiCr72X5+f+tsNnXimQ9Zh+qo7pmopaL3
 2cekgXU8hqeT1mSskp10iDzEpGqMslpEMeoeiwBpflAAkUpBvYIji2cc=
X-Gm-Gg: AfdE7clHbd2JrZXAm1XXuonKrd8wWANhEhhYBR07HpzrQ11VUnyA3vHlfsDoYpM//XB
 /CVoiYLPniiMZpXXHCZ2Mn3L5uzIgO6QfETmB8T1SKBZKWiQ3dVSWNontdun+ixFLGK/pHSAO68
 y1++/+4smoRIw/8blIhmelbTffHIcmU0t9t3hE9KqeZUTu9cBJvKHfK6b1Asv7U7rypNlpCHsZU
 4I3951nx6mOYXvJJ4KtA3EmYFaak/lVnGIWY/PJ0zBeJSo7ELo5deuOvAuqfllJR+8Ess/FEOey
 K+w4Tf/aRA2Y4+9IpAkA5eZFYBfcoYXyo0SZoRrBtQmDEp2G46IuFBCWSR56GqTi9XWIlT5E25g
 NHh/Ytcc0DgQuwMqvM5YYvU17W3NbsSg0k16keBBofLZoZJPsBC4=
X-Received: by 2002:a05:622a:5516:b0:51a:8c97:9378 with SMTP id
 d75a77b69052e-5213ea7e8b0mr120439831cf.64.1784536063127; 
 Mon, 20 Jul 2026 01:27:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5516:b0:51a:8c97:9378 with SMTP id
 d75a77b69052e-5213ea7e8b0mr120439731cf.64.1784536062697; 
 Mon, 20 Jul 2026 01:27:42 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2b893dsm232245575e9.8.2026.07.20.01.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:27:41 -0700 (PDT)
Message-ID: <8ec921e0-1055-47a1-93e5-adee92a469a7@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] include/user/guest-host: Include exec/abi_ptr.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717232306.378988-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfXyzCa8ND5kRc+
 5rSrfeXF3NUO8aEZk9SSW4lRfycsoeblxJ5i6jSYFFlg2Ix5srrS7EpSRGm8/bs+TSdSrvE4lHJ
 w5rCp1au/jzFFaOAMBWRPwr5ooGyNpJeG695zKjPm0mIGIYUmKcD2L0dFVhuZEAmnBHVaQNhJhF
 1yxXgF7300lTiuEgy0usz86m6zyvnkViADLNZs6MihrwN0DChUrOKCmJnGNWMrS6iI2FD3QW1NY
 69zguNQhssGKByk6v+uUzRY/UN4WwLFEBlt9Qp+HfDRp9THg4elEgE5cso288agCb3bklRC7bhE
 DY67NpqZ3J7/X9gMYnuvGGO4W/dIiJMZpWA8r5PweUQFYg0r7vIpPHghZIKpJXAUttmM+9aDrNg
 xkOuSZgOAtGRtjMTe9xDzkFbVrudv1jvH8h6Up94qtZdNfm2wTL8kXAfyfigl0dBA2gJ3Xr1unP
 bY13Wc5zAzl8oHKwaXQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5ddc00 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SRDLSX3FpouWN0Oc2FGC3Os8B05usC8a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX59jGGWUQrrZU
 qt6MItxsE9QqXWCJhzlYSHAcLExG7Lr0A+Cvt7yAvvDwWroA3TiD13NcY07wgNagY89vsGEa6kM
 ee6fs2IPxG+5+ss8XxQg4q9nXaCzxiY=
X-Proofpoint-GUID: SRDLSX3FpouWN0Oc2FGC3Os8B05usC8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 18/7/26 01:22, Richard Henderson wrote:
> The COMPILING_PER_TARGET block uses the abi_ptr type
> without including the proper header.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/user/guest-host.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

