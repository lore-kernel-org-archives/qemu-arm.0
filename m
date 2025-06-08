Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp1004677njc;
        Sun, 8 Jun 2025 12:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMoNpZzDXbpRH+mIrALCApEBnTFwNDNXxh6espAoRHhiX1xDbApd22YDyuj8xQQRuIh2GSOktYBACfJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1N5H880fGjWH8WqXlkucq9us5qW9vsLrGTmEaomjsyb4tLR4ELF0oHKCk2yexl7ueYSm6
X-Received: by 2002:a05:622a:590a:b0:494:a436:5af6 with SMTP id d75a77b69052e-4a5b9db7b55mr194702931cf.47.1749409684644;
        Sun, 08 Jun 2025 12:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749409684; cv=none;
        d=google.com; s=arc-20240605;
        b=BNbhpI2Y0volZgFr3xfwMkI4DJDrtQbXXz7mRAYSsmmUFVb1qhs0zr2z01hKVTZ3Xd
         hMAGCRRLxtCiL7OzjMTf08YNUwklUMkKxyNb9FjsJpLTirAGTDSv5ZDXZL2375mk/IFS
         v5yrlH57a2vSgGp4ku/T15hAeiQeycLnIgApfRCsKEoTBWsQx3PV69pXp9DOKVFx8zWY
         9NzVE18zFP52WgiSDhso/g3ZloIal/HoaR9RQr7u+F74zdUTh24Vf/N6hi6SS76DZeMy
         3I7KuskGd2pq4zFa/CDH8CHgGH34ATiq1LG9weQ4rpvPdZXsVmTJJ+e0ccEFM5c4W4qR
         g8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cHqlNVszVKhbHALwnpLFLjSm2ZiqgTrwkLlBQQWD9yk=;
        fh=HYZDaDHgB7ie/wI3MkiI0vR3fUgwQuCeDncsisepaOI=;
        b=K5uCbAAlEEsrAiv6bdENpe/81K8YBGNFlY7nImkkDOfMLIH9HWBLUG76dBak3l8/mD
         u690O/HtYl7Zs5h1QbsMlpVfEbBPbpELihVZJzYRH2xJpnvWDcAIGhEdhpaIcRm4s+qD
         gh18Twmc42PRrK3ZRnKPPDCyV9z/rnPDGyA/1j9RP8SrJULDNLVeNHs/lw7JPWA3MkCU
         5YUKzejFV07sjZbXfJpm8A9BBATMQpgER32kw2klkZQzWcEqmWaFQYK7VTskr2MYNjaP
         aTtJFkc53Q+0q21vkLKb1YLdCT3K/cvkByeZlA5KCEhUQSBZAZYdGfUrI0Q+QFC4yrQ6
         B1NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NGV6vona;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198c7b29si62952671cf.571.2025.06.08.12.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Jun 2025 12:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NGV6vona;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOLN2-0008Gs-FW; Sun, 08 Jun 2025 15:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1uOLN0-0008GJ-Nb; Sun, 08 Jun 2025 15:07:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1uOLMy-0005GV-HC; Sun, 08 Jun 2025 15:07:50 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558DvApH012817;
 Sun, 8 Jun 2025 19:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=cHqlNV
 szVKhbHALwnpLFLjSm2ZiqgTrwkLlBQQWD9yk=; b=NGV6vonaC3lZcfHxYjb/4z
 owZUE+QAspPQJyUTBNEqYRGS8fs1P0P/3/So5zNw/+btWUEx1nO/9FKH42zpA9w3
 73Yo80fVCbjXYqrA5xu4Ako+hHW9OJij/zdFZbE/TAsMSEYMDnaFHzTE5vafT2w6
 roqAba6fJ6a/Y3o28Jw1p6eSar8j7GwEToQcctMFRxwXh/m5w19rTM1foWxnV4ui
 Nx/23CiKuF+hqZROBXcw8LTifEV8XkHWeGAYK3Es8RckwOm0o2dm4dNHzu6ewMZw
 qVliTm3sMztuHsFm4d3s93u1q/dgd+CFhysF8rY28T3rea3mmPkr5K0LzBqaXWow
 ==
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxhwhg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Jun 2025 19:07:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 558EvArt019623;
 Sun, 8 Jun 2025 19:07:42 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4752f22fbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Jun 2025 19:07:42 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 558J7f8s22741538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 8 Jun 2025 19:07:41 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27E9258055;
 Sun,  8 Jun 2025 19:07:41 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4AD858043;
 Sun,  8 Jun 2025 19:07:34 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun,  8 Jun 2025 19:07:34 +0000 (GMT)
Message-ID: <524d3481-e2d2-4523-8966-a5bde1a557ce@linux.ibm.com>
Date: Sun, 8 Jun 2025 15:07:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] backends/tpmL Avoid using g_alloca()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-3-philmd@linaro.org>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20250605193540.59874-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3bkCvHJOjRsnmm6P5HcjF_v8cqXaCCWg
X-Proofpoint-GUID: 3bkCvHJOjRsnmm6P5HcjF_v8cqXaCCWg
X-Authority-Analysis: v=2.4 cv=fZWty1QF c=1 sm=1 tr=0 ts=6845df7f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=VnNF1IyMAAAA:8
 a=w0j3Yjxa2R2qolxzHAIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE1MSBTYWx0ZWRfXy7jxQibbd9o7
 cJJuRMdvfmYkTnpUD8aA2ZXJ9kwclwiYRHsJhsMukXjTVWkVEBiM/jrn9sWU8OHd3hUbP+RFK+d
 gei+h6uz5C+q4GOyF6irhjlGSybeQA150HEPZO1vGY4A0twsxAdtC5D7w3cbP2+mZ3DWZVc0Men
 ILKcIrSJ+X5WK6EzCbVBs+UGmuH9J4jEa8Jhr5h63UAYxYDWdzoH0f1qxAkyBKgp0H5p0S4URqz
 Uf2DBY9eILVdEhGRmpTsOOWlFVo6rm8YaqYA5uK+HzQhWWCpEk7rKpxTgCXnRucdJH2nqJmWOC3
 Jw3Q97VVXMHibCeYd+UuBNH2S0nBVJ1rjYGJIJlhpIg/FOt3GD3Ow7Oejapg07qmdfw7zN0QwBX
 WWTe+JK1jr1B8C5OMA5+FgrsyerohZaOE4Ale8CWWWChdKCS7tBDh6QvgUWnhg+Eb5LZPQ+S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=917
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080151
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sZAhkiBv7Z3h



On 6/5/25 3:35 PM, Philippe Mathieu-Daudé wrote:
> tpm_emulator_ctrlcmd() is not in hot path.
> Use the heap instead of the stack, removing
> the g_alloca() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   backends/tpm/tpm_emulator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 43d350e895d..4a234ab2c0b 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -129,11 +129,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
>       CharBackend *dev = &tpm->ctrl_chr;
>       uint32_t cmd_no = cpu_to_be32(cmd);
>       ssize_t n = sizeof(uint32_t) + msg_len_in;
> -    uint8_t *buf = NULL;
>       ptm_res res;
>   
>       WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
> -        buf = g_alloca(n);
> +        g_autofree uint8_t *buf = g_malloc(n);
> +
>           memcpy(buf, &cmd_no, sizeof(cmd_no));
>           memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
>   

