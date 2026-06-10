Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4ABCD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:37:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAR-0003QF-Ey; Wed, 10 Jun 2026 08:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHPr-0000Q2-Hv
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:48:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHPq-0002TO-4n
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:48:15 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ABNNAY1366490
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GEHj/sqzLMJ1RyJLrJWLtnVi3y5M1V7g5LAUdClBE2c=; b=XqnqFgtqh83dTVic
 T+zfdQIFnXKSSz8BdgFrEltrCOJrrAF/iArSylKFunRd9RN3Q9mgeGat2kQ84eO4
 mvjCyVQn+13jeNBEdCA8GGKxZfCDBB5wPfYlY6a4+1OOPG76cZoGq2SNoUAbmOTH
 y5CUJrdMV/IhB4NGfgmwXQTrvLkgncBJGan0Q20i1dYdKlne2iSAXLosEcv7+Qqt
 Bc2fqiPeymNU1XAwi2jYnt6lo5jotQUeEfr0C9yOB3jbRl7qKQvx7J0bInUx9vnt
 Z0mmZ8ftrkxKjXVHZKSBemoSpuZwyIWnp4XNGIAUtHanjDoppdoQ9oXdVEQAvXKe
 Gmc8iQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd9p28-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:48:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517b75c1ee3so59448091cf.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781092092; x=1781696892; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GEHj/sqzLMJ1RyJLrJWLtnVi3y5M1V7g5LAUdClBE2c=;
 b=kxwwfTIltexfDSlBRq3SJco06WvyNvPdWVh5+Q0LCYuSOS4Se0Zm0R55uWPK8RexmC
 XecPQ2L56jyIHMe3XwH6F0sEdXNfs7j9YDHnGubTJtqH0Q3ZrlwavL88T89+R360zUAD
 XZ5lbGyLm89Dqrzc5cdYYi7yxwEo3rYl9n0uCDBLdJLPHAH0FtQKAwyBjx4Cn4o+l1rP
 /+nmiRat6weqR+9B78DEl4482w+UGGEHLJpKhYBiRYjMEPf4v4PmmI0ibpYBJAo47oy5
 Sap7wQTc0/tnsRAG2HfkSO+nhOT18oq/5byTV7uo8VopdhKDBfn+KCMOv+mIbbVgA1hE
 3YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781092092; x=1781696892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GEHj/sqzLMJ1RyJLrJWLtnVi3y5M1V7g5LAUdClBE2c=;
 b=Nkk3JsXtVKJrOTIztSLBlq8e4woFys1TZZ9xAe6Wdp+8S0hn3j6QmBx1CxkpjsyRXl
 oNMPvQp/pxhWIwB9S1WLB6VWDJLlA1KHNhuL/77EG05OkQrsuaYMhTy0FJzBqJKBTbcK
 7hu/ye2ey/esN+j/QiJKjJKcHU4TpJtrbGoKdgXM0sm1MrPkpajFVQXubIAsXuQO/jxO
 yobeox7HhGg0naJ+ilm7r2RCXmnGDJU3+UztwKbwImltKyk1tNkJ40r0Eo6q1cVVIHG5
 ah1np8RlQTiefAeSRlg18OWsh+pV7Jgnh4b7fWSHuTrDDmViif3s/czub7Kf1at2Yhga
 WtbQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8f1G1f5iO6lIvshAWBzlytumYqd15d5RMEZTP7zozSG9cpdgQcXKNZFblMyKbrrwZp6Z/ajPp03Q==@nongnu.org
X-Gm-Message-State: AOJu0YxNCfTaGKR8WzUuCMot3dmFnC7wlt3hKqYNa1VOddL9l7KlN5RL
 RttGbynNLHxLacA5R3lFinNg9tSkMUMN0E7feBPlX4FIBJOs0Fls5rULDbniX9t3gy7OFpJOT+W
 lvJv3/h97130nbul4ATUu+yUPNnDwKo4i1gm5FlLputyKIPR596Jujak=
X-Gm-Gg: Acq92OF6SZB0LgSzDob4hYH+TX9u+yno+398vVHfnPfGNlVdoDC6FhpXUgAsqsCNClS
 uWOLRdB0OyZTE2Yge9A4oWMEKmYnmckRWT8lZNd8Jddqnh+r54fnSZGRAsx0rPoBciLiWUhfl+/
 3Zv+Y5BDTuKifqGVij8+HECJ4JA0MSSdywzmQRqLCVfn8Jv3YSSpmIJ7pVSlu9iqv4wc0WUp//W
 smXRQO0jIcJgGDekQDS8jZ+ApVyeQCgAPOuCwKekwxlnApf5mn+7TKJ6K0xXmmK/FvsqEzfFUZG
 Oz9rMBNCMYHFiBMCijHAXSjUb6eJTM2d92YlhCHzOik5e5hTXHDYFqAv7IlaZYPkFRFNbSzL03v
 GquLD1YynPK7CU1TpHW+2Kb0y87FQdVWKWq0AIlE1FhFiuW3En4u13EVrLFruwDrEj8lhZNZjAR
 QA/mY=
X-Received: by 2002:ac8:7451:0:b0:517:742e:d855 with SMTP id
 d75a77b69052e-51795bcda3dmr262403541cf.34.1781092092277; 
 Wed, 10 Jun 2026 04:48:12 -0700 (PDT)
X-Received: by 2002:ac8:7451:0:b0:517:742e:d855 with SMTP id
 d75a77b69052e-51795bcda3dmr262403211cf.34.1781092091885; 
 Wed, 10 Jun 2026 04:48:11 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051770c7csm1188045766b.12.2026.06.10.04.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:48:10 -0700 (PDT)
Message-ID: <11300e7d-f28f-48c3-97a2-0c2b7a545dae@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/22] hw/m68k: keep QemuInputHandlerState in next-kbd
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
 <20260610-ui-input-v2-14-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-14-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a294efc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Kgxs6zCfyaceiay64sVeTzlvl98PCRIg
X-Proofpoint-ORIG-GUID: Kgxs6zCfyaceiay64sVeTzlvl98PCRIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExMiBTYWx0ZWRfX9hOdZEaminpj
 Ra+VQmpXLuOLeaKTDKJsJdzKNiMa6M6YfR+sei1s2vsHcXLvLvsZ3786guWCWZgXL0hw6pZeLUC
 Dy3Cvav9TuhL1upDXO4ATs3fAWy4jsMjjG8pyPpp5BHXKFCQwkuyG59MRngxVboNKv8qJh/NbHh
 eG9WHSwmNVFX0SYWEnX2OkhB0xYwB2Zp7fTwXRfOUUQnqUq8THtX2nglIuuo9dK9z0x61whECN7
 iXPRUl1YV4CUJCl5AJfG1pVG3Xsi6P4H/u/Q6RyuFVi/Ev/41Xtk1q8NDBW+lV+7Pc0XizBdkR0
 e22zN2YbT+gwDRyKADLJAPjcaYJXB2z1IjlazTVTwL+drPIdejR+Y5rhBCC4lOd3TqrWbt+783h
 H17Pi+Ei+rDi4mjLzxJ3g0dMOdTld8ThAMBvex7LZQOFXjRt0M2j24dCzL961FIw12408MgBeOC
 8N5n0fcb9x7UHyEgcTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100112
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
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:17 -0400
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

On 10/6/26 12:56, Marc-André Lureau wrote:
> Track the input handled state, and dispose it on unrealize.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/m68k/next-kbd.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

