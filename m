Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4091ECC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:12:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGZUp-0003Me-EP; Tue, 13 Oct 2026 06:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGZUn-0003M8-Qr
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:12:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGZUm-0000zv-4p
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:12:33 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D8dVPx988971
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lXplvBc2e7L9iSAnMsXcuVcd5AsadwKMAwd5W0Jdcpk=; b=VKGBqD+Hmxxta0Lq
 /ZuaiM/PWbNjpmsw8MNMgzJpWa6gJwHqSG0bYPTCDq5SoJ7L+x0SLWO+zl4FlpKI
 5BEBaWx73fOjOMDySO6VawqlJDlsEkaJYeQMXHn3/S0OMhy/JwtnDTMcKxEMDf19
 dYwZ8twWLiXqOFGhnWEEo85DbJF44kL8N+GITYgzIj/L0vrApEQnLRpPNMD3RtbU
 wspuUSnk65+IffibjIgo9oExVQ7Fww2TsX6RrPjlWnV9qhXjGF8/kT9TH0x493PZ
 lU0X4vJZTc2wfO9xHZDrWR5lT4Sy2hr+cmqzbpyMopfgIkTm9TxfYhUJZDlDhgWc
 LNwQIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcac86-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 10:12:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e834ff4d0so790279785a.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791886349; x=1792491149; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lXplvBc2e7L9iSAnMsXcuVcd5AsadwKMAwd5W0Jdcpk=;
 b=C1+lkw+gB3JA9QqcOyBHJXcyleJozkkN7ujnVEVpKLhv5sMb6H97++0ko1kO5bExK7
 KYalJpyViPco8n8dCw0tETk+V6YILCBQrwNZ0APr1Dk6eckw872KIPW4kEG/OFh1uG+v
 KAo4xLoEdw02kyM4wpZIHomd22hTL8I+XOaZQu+O2Eme496vevh4MIt2U81aEBjYwWxe
 oXdnthDZuZF58Y6Vmt2SThdCEX+DX6VQt4ev0H8NPTwWaf7k55G0i4W8QwfDRT4VbXZS
 tr+tCGnPBYqte1ltd/A7ojFkXQ7vzoslQw7bMg1uelwFt7ns+CIRLWQVSAZYm+BUXgRs
 roRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791886349; x=1792491149;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=lXplvBc2e7L9iSAnMsXcuVcd5AsadwKMAwd5W0Jdcpk=;
 b=y4+3YAZgewR9n1urr8A/Z9ozVnYhJmG5JXy7P2wran74IrnchaK8pQuXs8DG/2egxS
 DQ5289NxOnR7Z3fWTcXjmFhThcq5pXKQcKJRfRWPWJWa37yJYJ2bRaDX9mUXyBb/zpY4
 G8yO81+oQ3mU4Z7WqQaVs3lVQF9i6fCHDkfOzixhqj1CHV+INMUBtWDHjVsu9eKgUkbX
 RBhFbekfDoT4sxiZKx4ALNz0EbnvVbNPCyZCiGqallZBfD7r7AoKLQ+g6iaJlwigyOtO
 VkC2SD/uSS6K3GGdPpnt7+dAafvQ0B5+gz0hR58f69cpowxNE5TlsEPciu8t4vKBOKKh
 gzSw==
X-Forwarded-Encrypted: i=1;
 AKwUvByDw7CXFZbLjmF92PgOQZld6qJl0EAg4FWdmtYjFNFSQBsaR8pd5pHSwBTk6nd5JW4620P9kDlBPA==@nongnu.org
X-Gm-Message-State: AFq9FYLS/f4jVB9FrvA+jkfe/iaK+n0g9A6bDWO8PJXUJ1ZS/UWYz9EG
 Qv/A+HWVQRs8hu2ILPUk0Brqw4b3zmsrqAv/OSyJnujOcCi0C3sX9huItBiZpjyeBBpXEwKmdh1
 S/QbvUR5ZmO8cZV6evOQ0UuBx+NMTI5zHj+3Pv6wvpQU9fBEC2SJIMq8=
X-Gm-Gg: AYBFou0ExbRsNjD0L/sCDbjsZzt5XwUEL6axqCZWeqZY7L7BfRm96nzfARGztC43Fnn
 c9MoZIYvuhdcvan8ofCZ4PPhmaT+y02jh6q74pxXTTlIpLqErUa2tF8yyO/jaGYjCk/WW4m17++
 HIy1NADfO94ENDmI/xoVJAjdO2b3GYHD0u0zOVDIY4PbvN+OlZxEC0DBqR3YWTOBQZ2DAEuyFdS
 SUEYJvPkg/KdoTIxrmdmz+DxVbD4v+Ll60Z/vhiefnOidOk+GzXLEZHUR01HipK2LKLcPzHM9lW
 LU6CmSb7+SHT3H1GdLURsIklVrnMCrWmNtuqUgP4jcs78oYKG6RLUb55moGN444QvCKFeOAsVFt
 H1+ixFFD9obNtMUwIn5JdsN4D0FVkueyVCA==
X-Received: by 2002:a05:620a:890c:b0:93e:c12c:fbbf with SMTP id
 af79cd13be357-93ec12d0fcemr1771701685a.76.1791886348813; 
 Tue, 13 Oct 2026 03:12:28 -0700 (PDT)
X-Received: by 2002:a05:620a:890c:b0:93e:c12c:fbbf with SMTP id
 af79cd13be357-93ec12d0fcemr1771698885a.76.1791886348167; 
 Tue, 13 Oct 2026 03:12:28 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c198134sm356381175e9.15.2026.10.13.03.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:12:27 -0700 (PDT)
Message-ID: <8a030bca-4697-405a-aaa8-017baed8ab55@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 56/86] hw/intc/arm_gicv5: Implement IRS_VMAP_VMR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-57-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013083933.1024405-57-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX+FuONabRvZUP
 9baY4OOHeMe4siArmAHyf978W+w5Yl5uXqZUBE5CXBQnh0fv5ke2bxYB5/LqH/9+MoI5t32Mchd
 vqcjj7NQGcbmwq+rOHLfDZ88rJMe5hdw4daTw8LU6nPg4MoGfa0MgCDW+CThhGMXfs2iRNwGDKA
 axU+vGpbQ9v5l7XsAhbikj2pUsfg6/2oEqGahn8NvhXZtra8GuN2JHn7orfPDu444pIKBf1ockJ
 tXDbHsrw+Xk4CAYJK9M5K9DucedKGl8jeYxJB3IS+fLK0kXJTPPOAYWEwwB0SWGQJGaP/t2c+kU
 H2UlybTbbPISyN9HRIQG/ROYkdX12XPSzBKu38imrj8JMA0UcAYw2q73bf18tcv9sizLOKWTmQ9
 sGvejtjiKBTDPbYjcqCcC+/crAfKTvJbWuLj2sXT2wgTRN3nf2+K80CqncCbfbbuqSo1l6K26zK
 f/HdgA2fsVSDCzWUZ4A==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace040e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=iiB_1M5JUh-BO4UfUGIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HtqDAgg1F8-iCTmiJChOekLxhqnW7ESQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX6TFjoMYc1c++
 e1yI6SHyTGZFiSOaaU55QT/2uWPghuCov7rdZZjeGkc+2RVWp6X+zt6k53yfVDLSuyNS9k3GLaG
 35nRlBpGjvu0D6NZQVktR0eJ0vE3iOg=
X-Proofpoint-GUID: HtqDAgg1F8-iCTmiJChOekLxhqnW7ESQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040
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

On 13/10/26 10:39, Peter Maydell wrote:
> The IRS_VMAP_VMR register lets the guest mark a VM as valid.  This is
> a 64-bit register similar in operation to IRS_VMAP_L2_VMTR.
> 
> We are eventually going to want to cache the information in a VM
> table entry, but for the moment implement the "make valid" operation
> as simply writing 1 to the VALID bit in the L2 VMTE.
> 
> Note that unlike many of the other address fields in GICv5 data
> structures, we don't need to clear any of the low bits in
> L1_VMTE.L2_ADDR beyond masking with R_L1_VMTE_L2_ADDR_MASK.  This is
> because a level 2 VMT is always 4KB and so the alignment is fixed;
> the mask clears the low 12 bits, enforcing 4KB alignment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c                | 94 ++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv5_common.c         |  1 +
>   hw/intc/trace-events               |  1 +
>   include/hw/intc/arm_gicv5_common.h |  1 +
>   include/hw/intc/arm_gicv5_regs.h   | 21 +++++++
>   5 files changed, 118 insertions(+)


> @@ -1472,6 +1531,22 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
>               *data = 0;
>           }
>           return true;
> +    case A_IRS_VMAP_VMR:
> +        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
> +            *data = extract64(cs->irs_vmap_vmr[domain], 0, 32);
> +        } else {
> +            /* RAZ/WI if no virt or no VM table */
> +            *data = 0;
> +        }
> +        return true;
> +    case A_IRS_VMAP_VMR + 4:
> +        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
> +            *data = extract64(cs->irs_vmap_vmr[domain], 32, 32);
> +        } else {
> +            /* RAZ/WI if no virt or no VM table */
> +            *data = 0;
> +        }
> +        return true;
>       case A_IRS_SPI_STATUSR:
>           /*
>            * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
> @@ -1604,6 +1679,14 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
>                                  deposit64(cs->irs_vmap_l2_vmtr[domain],
>                                            32, 32, data));
>           return true;
> +    case A_IRS_VMAP_VMR:
> +        irs_vmap_vmr_write(s, domain,
> +                           deposit64(cs->irs_vmap_vmr[domain], 0, 32, data));
> +        return true;
> +    case A_IRS_VMAP_VMR + 4:
> +        irs_vmap_vmr_write(s, domain,
> +                           deposit64(cs->irs_vmap_vmr[domain], 32, 32, data));
> +        return true;
>       case A_IRS_SPI_SELR:
>           cs->irs_spi_selr[domain] = data;
>           return true;
> @@ -1704,6 +1787,14 @@ static bool config_readll(GICv5 *s, GICv5Domain domain, hwaddr offset,
>               *data = 0;
>           }
>           return true;
> +    case A_IRS_VMAP_VMR:
> +        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
> +            *data = cs->irs_vmap_l2_vmtr[domain];

irs_vmap_l2_vmtr[] or irs_vmap_vmr[]?

> +        } else {
> +            /* RAZ/WI if no virt or no VM table */
> +            *data = 0;
> +        }
> +        return true;
>       }
>   
>       return false;
> @@ -1722,6 +1813,9 @@ static bool config_writell(GICv5 *s, GICv5Domain domain, hwaddr offset,
>       case A_IRS_VMAP_L2_VMTR:
>           irs_vmap_l2_vmtr_write(s, domain, data);
>           return true;
> +    case A_IRS_VMAP_VMR:
> +        irs_vmap_vmr_write(s, domain, data);
> +        return true;
>       }

