Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCAACC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:26:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGZhy-0006Ox-7g; Tue, 13 Oct 2026 06:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGZhm-0006OG-7V
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:25:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGZhi-0002l2-Di
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:25:57 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D8xw6d790997
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q8+9yR373X+NzW5an4odj488gqLsHbix8GtRHcs48uM=; b=PJBlgG+TbyygRxN8
 Q0p9OG9SHE+4LC3WitHAbuL9pvV18rQkvUuUw2koTJv7i+FR4Zg7CZPy2wOnLRlR
 IVG1o9EXUWiHRyVXkySBfpHGNo85AiApHQkWMIeCJbg9rHVg4ONV4qy1E9sxoSBf
 wxXyr3sy0Ooedun9WTQ53LGVh2C4MC83ZIzN3JcvUrIHAi4VfQQwAlSBWxcx50ax
 n+lKxTuIbZLReMnXfKC1OTL8rlCQU2/QDT9/u5GKm1KwNyv+5MO8YUTc3JwGq/Pv
 Nhhfbq/29GOhiVJZKUVxGiYneWnZd0brN8Efx1Ug8/yiqEQHaur0v7a39/L1NrE/
 yBFusQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrcc6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:25:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-936aa34873bso576426285a.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791887151; x=1792491951; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=q8+9yR373X+NzW5an4odj488gqLsHbix8GtRHcs48uM=;
 b=QmzkJJNH3xnYqRgsKaFduYOzjF5TLyKuKPadvavyoIcqZoQFhavKnIQ738QFh24FLZ
 bqfJTvO5U1JTfUzDFfhyo4QORgzjiDMkXbdbAtAEQYo22qtujv6V0MBxTEw2y595WNHE
 bRLsmdXt+iwi4pVisHno4EyMC+xJX8pteQ2G7eN/C50uDafjKIIVs2+h8tx5NBu6h7iV
 KYfI+wWlhOrPAqrHLYRUFEoZmBzv3pCOfHYy7Q+sw9MSSlD1DPk2LjO37jOoH0VdIuj+
 PPtF0Sdb7OqxlY5yyvtSTyXQdzmnZrvTju/+2oz5TZLxLoo1UdhWcoT0bbdhm+RiRtxD
 YWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791887151; x=1792491951;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=q8+9yR373X+NzW5an4odj488gqLsHbix8GtRHcs48uM=;
 b=uhIXXKGLhjKCyRJ7byMdlmujBGT6Ha5Z2IwOD8zv0eK1reaLoPMNbS9C63KKQEQZC1
 gMY01MEEYkGgstRLSi4LdLeA+LwmGMiWIhBwEpjQLjgdDn+OQa/BlYC/hdN+bD1wAlW3
 I2gGc2ZMB9nmKBP6k/8eZM+n6K5nes7X0zXBBTd547ickdBp3FjhovqE+kQ/v7f1zPXr
 AYRpeh+onB6byPQXY1oeCUEIi8Oz+ja+72oEHQlWyLIzz/i2FY/FDd7UGBbyGm5G+68z
 s/lXo++g0qVkyKx2CMlXW8j0odCr9OM2nWewytKoaLeNRq8/NJNNDZ5fH0ljQd6rBDzA
 vXYA==
X-Forwarded-Encrypted: i=1;
 AKwUvByxLby+w+krhd5CKrsh9aenOG+wX63z9OaY+kkd2kY0eO71ZTOCKKQy6v7TXmURoWRSIaOrXLKweQ==@nongnu.org
X-Gm-Message-State: AFq9FYLUzXQh9j9mShhk6ONcrsNGNFd35/DsRTpEMAvVSFQtwzSifjVb
 FriTCWzboQfsYvVbT44hMzn/K92MP+y9/VSQ6Sod4/TFF3RJe6ME86BM2JeH/GdUlyTXXRjyHd/
 eAd7CANKDeHAaiVnH1lGD9EBN3SgcD8tdA+s8doG76UwY24/JBffOBDk=
X-Gm-Gg: AYBFou1pMiqxcKDEXkXkqOBvaSbcZGejnBuuO7g382+kXNddnDfhtQkD87DsZ6XgYr/
 f0zzQy0GgUGtwSaDQkBFtUVmQKv3Me5MDEqxTcKvAcm6aOTcqDKeBSFy8A0HcXi+5gWXAIZo7dp
 0ZhsjmYKz4GtlZwKwEFFoSkP6BwCXiO+4Auek8n0DQwXjWoUw8jAc1+BBtF4Q1gWQ9BzEtmi3bV
 sw0ODAQ/QMLZ/EGszOVC3Z0ze1w+i9x84O8rHRV4/gH5JspM3TKbf0GKsgEuRnSTIDfCExCRKlJ
 99nRlRkSEkG5LIim/2T52o0f6t6J8qb2FFPD57mcLBOGotJH+yHXkitDm068iSU/G7ZWqBc2KpR
 KJIZFiHkXqTtQohojl+MObHl8UbUUKTnpZg==
X-Received: by 2002:a05:620a:1720:b0:93e:c12c:9b69 with SMTP id
 af79cd13be357-93ec12c9eb7mr1851773785a.68.1791887150825; 
 Tue, 13 Oct 2026 03:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:93e:c12c:9b69 with SMTP id
 af79cd13be357-93ec12c9eb7mr1851769485a.68.1791887150185; 
 Tue, 13 Oct 2026 03:25:50 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a198c80cb3sm168593785e9.3.2026.10.13.03.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:25:49 -0700 (PDT)
Message-ID: <047c7b05-ca11-4194-a6db-c0dd2f4f2b2c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 62/86] hw/intc/arm_gicv5: Implement IRS_VMAP_L2_VISTR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-63-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013083933.1024405-63-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5+1OOMg0UTrM
 sZUYMff9ihQhb2JVQ5ET/wAwEBPK+VlwJjb8RsyvdDrbUTdwrApkrPLPYgxZ/C1pRgHkXvj5rzQ
 xgp4mKEkdZsZFxDw6QrKXu7maXTO/ys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX1OB82Pxg0UW0
 hbRKwA0GmupYePkwNqW9escrzso4zKgYfVanWzSw6OuQw4avv0qYX51g3VmOro0248vq4SwXhTh
 YAFHxXU1RnuAWHGtDuwPu/bWQz4gpVe2dcmTsXOnslPZvV6H/O70fQk8FSRYTCKQ89v9FleuFSX
 OY9VGnTzMo7RzUJJ5eQzbH9tLWLnv0ZUaNXwOTsid4OVfsXHcgFDsNPdjtyjmWdxwIB2fmIb7c7
 rtp4WvCxqMQZqiDsoKh7WdE+8y1CcXxRgkm+DVrWhqfrDi/8xHhlNhI0IymXAgxX9iGHbBxlHgj
 gZ356ToNgknnnCHU69Ce6WBYEejJTuQw9ybPgeeZRrULk3hLjdNqKtoOlNH33qGP6IRESrEVrBy
 Bv9sg90GV1u5QXqyJuvwd/+KN2NMAggSpDyh8JnRTO1Uz9NzZV0jwxcVdhG871SMTHyGyWI2+Mb
 EqOCd2Ak5gKwxUE4hzA==
X-Proofpoint-ORIG-GUID: NwJ4SntM30Pi_HL-GKet5fpfFeg2BeUs
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace072f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=CimgT5QdlH8y0ofWgOsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NwJ4SntM30Pi_HL-GKet5fpfFeg2BeUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041
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

On 13/10/26 10:39, Peter Maydell wrote:
> The IRS_VMAP_L2_VISTR allows the guest to make an L2 entry in the
> VM's VLPI or VSPI IST valid; it is the equivalent of what
> IRS_MAP_L2_ISTR does for the physical LPI IST.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c                | 76 ++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv5_common.c         |  1 +
>   include/hw/intc/arm_gicv5_common.h |  1 +
>   3 files changed, 78 insertions(+)


> @@ -2128,6 +2184,15 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
>                                deposit64(cs->irs_vmap_vistr[domain],
>                                          32, 32, data));
>           return true;
> +    case A_IRS_VMAP_L2_VISTR:
> +        irs_vmap_l2_vistr_write(s, domain,
> +                                deposit64(cs->irs_vmap_vistr[domain], 0, 32, data));

irs_vmap_l2_vistr[] typo?

> +        return true;
> +    case A_IRS_VMAP_L2_VISTR + 4:
> +        irs_vmap_l2_vistr_write(s, domain,
> +                                deposit64(cs->irs_vmap_vistr[domain],
> +                                          32, 32, data));

(ditto?)

> +        return true;
>       case A_IRS_SPI_SELR:
>           cs->irs_spi_selr[domain] = data;
>           return true;


