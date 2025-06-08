Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp1005295njc;
        Sun, 8 Jun 2025 12:09:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8yKn+zMrYF8Kgik5ebY0rm0hEVt+zc+kSPGzGd+T0aNspk/p314Mx1NXd1R1XTyfktnLFIoPo92Uukw==@linaro.org
X-Google-Smtp-Source: AGHT+IEqUkH+QvmZwEW2Mur+Gz+/J9h/zYDT4uVJBdrvIWpBYYdXoR83+UEnRh2C1MDFMzgKmBOW
X-Received: by 2002:a05:622a:114c:b0:476:8a27:6b01 with SMTP id d75a77b69052e-4a5b9ede724mr195185251cf.47.1749409772125;
        Sun, 08 Jun 2025 12:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749409772; cv=none;
        d=google.com; s=arc-20240605;
        b=BL8tIgpMGJugAoqAuPkNqzuLrhjvEA/R+a9+7+VaEDP3VZoQ//C1eZygsEl9O2InU3
         OHRWz6rxFFbmFVSgBcnXHI9kQ58Az+cxo+UyyoFiUx600TBhvo/G+YrkTBJqeKQFSwOL
         5bbkVri0cVETfxNNWFV+2OLE7tfgfSZMtaP+ere2lt+O6wevYxyP2M5eXUuso4Jzgjsm
         Za2iLY2ufgRbjmghRnjpBVuq/0VQSxCJQf8nLj5kFRAGJtocGb9zrMcLAOQH60n/+FYm
         nDqjDjH2lBlSyHXMZrV1hk0m/ecvOG6f1dEzA95/cDr81Gt40zcZV0LdpFbKIxtQGQGE
         TFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Qq+lEp1YoGkRbzPXwNOBaxmRfYbjrFLkRy016WclZUM=;
        fh=7MUZWyP576Qmn8seypDXeVCbb/Jm5d/ZnIULSmyLKl4=;
        b=cAAYX4XHGFy+tA/FVkbhYwzv+D+9wqw0i3GOBxgbV2dXH9mtgL5RPtQHVbl3Rt4kPk
         BJqFGPwZUU/d4BvrqluS2zO4WOr6jDkJ4k1LeqaloxAsvtyGo1mkNc2239rOQCc674+L
         ws1GV3NjvoKdfEYI8indaiZr/cA9YfAsA2JqBgAo4l6Tdw6Z38MYB6/jckuM2GGVjkF9
         iSl0PuNtbEauK/cKwp+pa1Lk6j9QXVeO/lTtHyPBtr2HaMMgwJ6s07PtCJlB992Rr6q4
         +xzsPFE8iiv0RJtJEQFqSa2weZjVIrZ+7hZzIQ+Bw3xPKcetTD+YPRe0OZuHRBoeyr2K
         CLHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HEffpmTp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a619892c62si65896361cf.414.2025.06.08.12.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Jun 2025 12:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HEffpmTp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uOLOR-0000jZ-Cv; Sun, 08 Jun 2025 15:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1uOLOP-0000iu-FR; Sun, 08 Jun 2025 15:09:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1uOLOM-0005OZ-Kh; Sun, 08 Jun 2025 15:09:17 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5588sPrB028419;
 Sun, 8 Jun 2025 19:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=Qq+lEp
 1YoGkRbzPXwNOBaxmRfYbjrFLkRy016WclZUM=; b=HEffpmTpB/0OB2fEZirNft
 tbG2j7AVHPrTC9STHE6ofEIaShCDpJTOIya7WGVV/BNBV5rmIAD0pT6RGMlR5JIo
 erYVcOxGTqlS/53QdWqcYMMZwjhz2dK3dQ+yJ4ZGdgTv+/w1+HF/E86BX7ds6qmR
 ph6jgP+ODkC+WbxIv5Cpebxwb+I2EhNjgi6QXdHKKm8B/rz1ZPXrgqRmL+P4G4kt
 t4YXSIZCIdosPwUhKQ3Rw9W5cLNHGd0dJQCApTsx6S81fD6NQE1o3/Vw02p3xF0p
 CKRDAUUQPiy6E0tlV7XAaUp3PjG1xuouWSgIrMG7yRrT2gOaMtFj3/EILqbq7Uog
 ==
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hhdmstn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Jun 2025 19:09:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 558IQdFN028110;
 Sun, 8 Jun 2025 19:09:09 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518m2qev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Jun 2025 19:09:09 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 558J99GD22938328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 8 Jun 2025 19:09:09 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D7B85805D;
 Sun,  8 Jun 2025 19:09:09 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78E3558043;
 Sun,  8 Jun 2025 19:09:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun,  8 Jun 2025 19:09:08 +0000 (GMT)
Message-ID: <11f23b91-7ab3-4908-b1bc-3fa90bf643a7@linux.ibm.com>
Date: Sun, 8 Jun 2025 15:09:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] backends/tpmL Avoid using g_alloca()
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-3-philmd@linaro.org>
 <6f9cd053-0701-4f7e-9d04-3f8d92ece5fb@redhat.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <6f9cd053-0701-4f7e-9d04-3f8d92ece5fb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=DLGP4zNb c=1 sm=1 tr=0 ts=6845dfd7 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=6pZFX1M33iGIBM9FK-gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8Piv50XowLKQyE1HWC1_YwoMOfWBfmzf
X-Proofpoint-ORIG-GUID: 8Piv50XowLKQyE1HWC1_YwoMOfWBfmzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE1MSBTYWx0ZWRfX9EEFXd9rechd
 fxo0ytBlQpm44ElYaUmzIQMgzmOK1q5Wo5Vw4ZKRTpnKuW8uu+tgZTn9H9m5uLTbRUOFcIxDgOl
 ADCjgD46rqjBudPsCoQ8Zqit309Ng4LjPKaJdvGE8lc/8nTNvAxTI3XC5Bp2Sjg4DpEVhhhR56w
 EQ2/7ODpZ5bBramJG9FavXfxsvUwuh0zvcUZEcMH/GAno97+evMAKZXhE3oFpHYKAbUcLL2aqaQ
 nU1sE/nqT9ichXI3JKdFgBO/+oI5wJirL7Pm+qbkA1BGSl5uRMsEH7ZYrA+FbzRtAEyL7AhTQBW
 Y4T8juyQp/hnbUX8zI5nIL0LoW6ibuZhWs5QhjhEg70D4YbKwdEnCL3UZVsC85HSfO2/QhdHZHC
 nkF6XrY7XzCDTr8IBRuXoO9b1sJQsej+02rC0yytdcP1b+GepXrfxu4Bgfb0WiAo/c3k/qhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=983 lowpriorityscore=0 clxscore=1015
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wciyr0JjGxB



On 6/6/25 4:14 AM, Thomas Huth wrote:
> On 05/06/2025 21.35, Philippe Mathieu-Daudé wrote:
>> tpm_emulator_ctrlcmd() is not in hot path.
>> Use the heap instead of the stack, removing
>> the g_alloca() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   backends/tpm/tpm_emulator.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
>> index 43d350e895d..4a234ab2c0b 100644
>> --- a/backends/tpm/tpm_emulator.c
>> +++ b/backends/tpm/tpm_emulator.c
>> @@ -129,11 +129,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator 
>> *tpm, unsigned long cmd, void *msg,
>>       CharBackend *dev = &tpm->ctrl_chr;
>>       uint32_t cmd_no = cpu_to_be32(cmd);
>>       ssize_t n = sizeof(uint32_t) + msg_len_in;
>> -    uint8_t *buf = NULL;
>>       ptm_res res;
>>       WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
>> -        buf = g_alloca(n);
>> +        g_autofree uint8_t *buf = g_malloc(n);
>> +
>>           memcpy(buf, &cmd_no, sizeof(cmd_no));
>>           memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
> 
> With the typo fixed:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> 
> 

