Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp538283ejc;
        Wed, 10 Apr 2024 12:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLfJ0IP72ES2A3gjm+QVB1hFTzaVHS5fU52CNAzFVxjx0XTtCIA678e0inc3IzGUUw8B215pHVoEMIOEuEK1TuGFuChRUm
X-Google-Smtp-Source: AGHT+IF6Qx2g/LahnnPfXhHE5oTbtjPCohfzBzPRqeOoLt6OpBRAlCpF32aphqtL4kdffNnmkXYB
X-Received: by 2002:a05:6808:408b:b0:3c6:54f:df2 with SMTP id db11-20020a056808408b00b003c6054f0df2mr3719045oib.25.1712778716229;
        Wed, 10 Apr 2024 12:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712778716; cv=none;
        d=google.com; s=arc-20160816;
        b=b8zCl0Asxk9XI96DMT0NbWx5hmGMlwnAA/GsoMLJmWdB59zzATSzjzSar4PL+3c0cI
         mgJ3nS6cn/wJZ8aH44ZEbx3kG575AF2ghVo10yfUUgW/l0bcA7lOqpvz+A7JCpTW2Wa6
         9G9Awq2Cps8KcVAkkC7HKSioj/13y738xbcSD5FT3PLednrugqJi+rHBOUSybqqPln0Q
         eQVHq9D7LsKk0iLJ9y0wemkqlTkvC2us25UdgC5QsH88BknB4Ov+gxW8ntDtReJndMcO
         EWsImErEb+KyNsiaervsT/cSWE1E0d5qsPfgGnwT7In2CgwAKfO7D0+9NWe1eEGSShOx
         hc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JozAEW4QmQHAvoOFnm9XxKK+9H251DI4WiJACmHw0d4=;
        fh=UyOrBt6sZ3os/1UEJkZ3+gwUrZqdFxYVOYhdOosl1RM=;
        b=BhMwLX9GrX95gt4DvHHhXQ5zGD4lItvn/nNgJaQCQP6pHRLnAnQf89tZiXCZRJ4lWB
         fpwseXpuxOdWwVthBx2M9SSffKPgj5mH15Db3RhFjFbYqS4bT2ixvjJxwq7Y3+3xEnqU
         QY75RMJ41NIsQhMglxqYusOCVXCYNs4eXkWyF1Nf269FAL2tvv0Y+ujwlIoywuA5CmGd
         bS2M3h9gqjr5jFayV+9H1d1oG/lOPWyock4rT3l2XLA5QuRyG3zT5B2QxE/WfaPQrxdG
         vMSrwfhtOhpNButiIFXc1xS661cPrE4M3F+aXOyX+zRtgciBLBP4nLmJaqg9ppn8oi0e
         xLeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=UGKQyJvm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3-20020a05622a110300b00434e8439f27si2443228qty.186.2024.04.10.12.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 12:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=UGKQyJvm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rudya-0002gE-OI; Wed, 10 Apr 2024 15:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1rudyZ-0002fA-0g; Wed, 10 Apr 2024 15:51:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1rudyX-0006Iq-Ai; Wed, 10 Apr 2024 15:51:18 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43AJm3FN026568; Wed, 10 Apr 2024 19:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JozAEW4QmQHAvoOFnm9XxKK+9H251DI4WiJACmHw0d4=;
 b=UGKQyJvm7iOAwoiDyQJJt5KLzHiQpx/s3DqupbwW1pjHnipXReknZD7BhjeiTCrc/b2/
 SVBt8zJawBhBtRnqJas13KYi98V1RH6fhL7vd38IP8trEgR4AMsYm7liBtZn23xjOQ9n
 SeSKoFJZNVOoNjV0KEHbMPNULg3v05jp4do+2EcdeV24fqteRcH6oG5S95nLNhG8l2gl
 1sB4IDa/rLB2c5bGAlxCXiaidPFgBShB98e25sT84mcnxCDDAOqwiVFyavb8KG53R8EH
 KCTRX1a/y1s2u7nzi/fFOToyBAJBJy/dVhRUZ42yAE97CQszTLKoazjF+cSIgmdBrMj3 IQ== 
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xe0v901wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Apr 2024 19:51:13 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 43AIuguO013539; Wed, 10 Apr 2024 19:51:12 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbgqtq5p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Apr 2024 19:51:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 43AJp92k41419308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2024 19:51:12 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D64D25805B;
 Wed, 10 Apr 2024 19:51:09 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DA8B58055;
 Wed, 10 Apr 2024 19:51:09 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 Apr 2024 19:51:09 +0000 (GMT)
Message-ID: <77f949ba-0392-4701-b853-c357a3388cec@linux.ibm.com>
Date: Wed, 10 Apr 2024 15:51:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] backends/tpm: Use qemu_hexdump_line() to avoid
 sprintf()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-13-philmd@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20240410160614.90627-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eLubcxiYk2ysANlLzALz7wYHqTVldyU9
X-Proofpoint-GUID: eLubcxiYk2ysANlLzALz7wYHqTVldyU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404100144
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4Ef95AxeNyvT



On 4/10/24 12:06, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Use qemu_hexdump_line() to avoid sprintf() calls, silencing:
> 
>    backends/tpm/tpm_util.c:357:14: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>          p += sprintf(p, "%.2X ", buffer[i]);
>               ^ >
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   backends/tpm/tpm_util.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
> index 1856589c3b..0747af2d1c 100644
> --- a/backends/tpm/tpm_util.c
> +++ b/backends/tpm/tpm_util.c
> @@ -21,6 +21,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/error-report.h"
> +#include "qemu/cutils.h"
>   #include "qapi/error.h"
>   #include "qapi/visitor.h"
>   #include "tpm_int.h"
> @@ -336,27 +337,18 @@ void tpm_sized_buffer_reset(TPMSizedBuffer *tsb)
>   void tpm_util_show_buffer(const unsigned char *buffer,
>                             size_t buffer_size, const char *string)
>   {
> -    size_t len, i;
> -    char *line_buffer, *p;
> +    size_t len;
> +    char *line, *lineup;
>   
>       if (!trace_event_get_state_backends(TRACE_TPM_UTIL_SHOW_BUFFER)) {
>           return;
>       }
>       len = MIN(tpm_cmd_get_size(buffer), buffer_size);
>   
> -    /*
> -     * allocate enough room for 3 chars per buffer entry plus a
> -     * newline after every 16 chars and a final null terminator.
> -     */
> -    line_buffer = g_malloc(len * 3 + (len / 16) + 1);
> +    line = qemu_hexdump_line(buffer, 0, len, false);
> +    lineup = g_ascii_strup(line, -1);
> +    trace_tpm_util_show_buffer(string, len, lineup);
>   
> -    for (i = 0, p = line_buffer; i < len; i++) {
> -        if (i && !(i % 16)) {
> -            p += sprintf(p, "\n");
> -        }
> -        p += sprintf(p, "%.2X ", buffer[i]);
> -    }
> -    trace_tpm_util_show_buffer(string, len, line_buffer);
> -
> -    g_free(line_buffer);
> +    g_free(line);
> +    g_free(lineup);
>   }
