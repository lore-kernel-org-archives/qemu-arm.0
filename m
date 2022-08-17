Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2356419ejf;
        Wed, 17 Aug 2022 04:50:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4pg5iC+zvwihHvpVoJakqOMOaYCdw7ZQBrSDQl98B14KNAT5q9olbQm/Wef14y7yhBQlNP
X-Received: by 2002:a81:4ccf:0:b0:32f:cccf:cef7 with SMTP id z198-20020a814ccf000000b0032fcccfcef7mr17553574ywa.191.1660737013520;
        Wed, 17 Aug 2022 04:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660737013; cv=none;
        d=google.com; s=arc-20160816;
        b=y5oofkGT4Rox9GeHP6aC6ULfYJA184gsbRRCk0auCel/KF0UUvmx9WIszBY3EttnBV
         4VqBRNUyIMegVAKMhrTYMBaGB6aAsy8g69GKP298VmJG31cqrcMbYyqF0pYMJtPKR/4f
         WUXa1N3MkRSD1WXAXgOlrpCRo6sSlsgVcnwPCmAjNlKfskNCuIu1OTBoJYAt+HpsLcZm
         UldNxaBc8ZC7B057F8dAL9HHFFU9IH7rRL9H2GcjIzCLW02mmzznJEzJ/7rCFAnWwMsQ
         MpzdqjthZUVWopYYjCd72R6Tfp7P2yKqlUBto+PKT8860Cs+M0BrXfDABEENiYWz/hkM
         505Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=hGdsBpeOrifTsg7ks996OKfzwQtFkPZXrXnfPheGkjo=;
        b=a7KRlW4ItsxYOtvgjveDXlVJ6HRnpdjPqSKCka4nctv8CHJVonahLi4vEeKjJ1xGAk
         qcNvuqxAZKgfbqDbzSn72ub/qUlV6Eam9ZLA0u8fAd0Ya8OhuGURtzqcIvoCxkKzAAAp
         LwU1OO8i+TUiCWLKm1vozdfzpSPV6iXMLRqw0PooQXb29N/OwRdciG3ZnyA8zMFW8TQc
         KT/wVPGb4X5nePEGjMdNiaKx652sXzZLMwpb0HvLDkpD2Wc8kv80Nh101sIoApGs8Tli
         RCmGnPuRjWPK1d+2+TNfo2Xxf5EodDkdv7cXhM6SFR4zJjWt/QOEFTqoYpOvd63cOT2Y
         fBIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fJu526Cl;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id i62-20020a255441000000b006716ecf1296si7587006ybb.415.2022.08.17.04.50.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Aug 2022 04:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fJu526Cl;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HBhavQ015004;
	Wed, 17 Aug 2022 11:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=hGdsBpeOrifTsg7ks996OKfzwQtFkPZXrXnfPheGkjo=;
 b=fJu526ClQmK1tlrB3hcdiUn+g4xMwTc9oeLq0CNkPB1Ue0yAInwlMbO7Hiy/gAXTlfAG
 XxPhogvvZcBEc4BlSEPq9y1U9Se6jaOKcXLFHVsxdw3+8pvwJPPiWNFaEtqYa6VXZK6V
 uNymqUrgY2Tq/+SgJEFwGLp4oKaPpTtYvCnZ5u9bzyd3eRE8JWH9y9t4dVM0jvew/qtp
 4OJmVZW/83NuFweAFQb2UZQjTk8UXohFpWet8Jt3Q5k/NTBwzkLkg3FgleTD8qpORr3X
 tmFW17JcoSkdKPfIfhY5b+tCGgSDwxYb4FbTIxpvRwU+ngkh+lDRXqnLyvnANB/kYoyn Jw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0yq605ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 11:50:12 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HBZqa0004433;
	Wed, 17 Aug 2022 11:50:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3hx37j3ar5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 11:50:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27HBo8ZE36634880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Aug 2022 11:50:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B861A4053;
	Wed, 17 Aug 2022 11:50:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C005A4040;
	Wed, 17 Aug 2022 11:50:08 +0000 (GMT)
Received: from [9.171.21.185] (unknown [9.171.21.185])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 17 Aug 2022 11:50:08 +0000 (GMT)
Message-ID: <d9b0a1feba66763f8161608ebed7710fc885ecd7.camel@linux.ibm.com>
Subject: Re: [PATCH v2 03/33] linux-user/x86_64: Allocate vsyscall page as a
 commpage
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
Date: Wed, 17 Aug 2022 13:50:07 +0200
In-Reply-To: <20220816203400.161187-4-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
	 <20220816203400.161187-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B9ot3n0hTzqe7sk6FlHMhhsydALfsZfo
X-Proofpoint-GUID: B9ot3n0hTzqe7sk6FlHMhhsydALfsZfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_05,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 adultscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170045
X-TUID: 9Xs/JcyAK4LR

On Tue, 2022-08-16 at 15:33 -0500, Richard Henderson wrote:
> We're about to start validating PAGE_EXEC, which means that we've
> got to the vsyscall page executable.  We had been special casing
> this entirely within translate.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 29d910c4cc..d783240a36 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -195,6 +195,28 @@ static void
> elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
>      (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
>  }
>  
> +#if ULONG_MAX >= TARGET_VSYSCALL_PAGE
> +#define HI_COMMPAGE  TARGET_VSYSCALL_PAGE
> +
> +static bool init_guest_commpage(void)
> +{
> +    /*
> +     * The vsyscall page is at a high negative address aka kernel
> space,
> +     * which means that we cannot actually allocate it with
> target_mmap.
> +     * We still should be able to use page_set_flags, unless the
> user
> +     * has specified -R reserved_va, which would trigger an
> assert().
> +     */
> +    if (reserved_va != 0 &&
> +        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
> +        error_report("Cannot allocate vsyscall page");
> +        exit(EXIT_FAILURE);
> +    }
> +    page_set_flags(TARGET_VSYSCALL_PAGE,
> +                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
> +                   PAGE_EXEC | PAGE_VALID);
> +    return true;
> +}
> +#endif
>  #else
>  
>  #define ELF_START_MMAP 0x80000000

I found this in context of wasmtime, but apparently the problem is more
broad: after this patch any x86_64 PIE binaries no longer run:

qemu-x86_64: ../linux-user/elfload.c:2657: pgb_dynamic: Assertion
`sizeof(uintptr_t) == 4' failed.
Aborted (core dumped)

(Maybe we need a test for this, PIE version of "hello world" will do.)

I wonder if we need this assert at all?
There is a comment that says that 64-bit hosts should have used
reserved_va, but what is the reasoning behind this restriction?
Without this assert, pgb_find_hole() finds a suitable hole just fine.
