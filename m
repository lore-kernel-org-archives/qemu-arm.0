Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp917470wrq;
        Fri, 29 Jun 2018 09:23:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdkYfvoTu8r2KP07LMM8mipw9nFC6cT0E+AWrjku5CmRB8OJxEsmmCGiDr5s2KZKSsCPzcf
X-Received: by 2002:a37:4848:: with SMTP id v69-v6mr13124124qka.128.1530289433030;
        Fri, 29 Jun 2018 09:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530289433; cv=none;
        d=google.com; s=arc-20160816;
        b=yRlx9UgD8Da6TojTv0UN69/KEnxPTeJJBS0HLUaPuCJIxzIAaFjV2XIDj0rXkPK583
         ma07636lvXb4y5Ge+jXMsMvUDV6m8gyVn3oXKBHzm/PJzvE9jl4vm+XgRae9hCnCZNF+
         a0VUsS4TZbagH8l46EflgN24tIjc0Hn3WYDQUecfYp8U14hXTYYBc02F7wtHcYwEt7mT
         CCoIMBI5NlzHsfcyCLfTq0nuKxyZl9SFGYhw0DFqxGDKPp/SVjpaAES2Mdd8B9dXH+T2
         PLcRhReLvIoEN606Pz4Y+L9nL7TZHotR8HfXs9JCfj11YPiCpigLFnc2TvTW+oPn1xEU
         oG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=58YuWzvsDYx/r6ZhOUHQr01pVSRxM53Zy4ik4eZuRME=;
        b=OubowyBeAcg+ylqmjhoFSby+ilG3Q7BBd41BXQpG83GLHe/XVoxdUyGyg8bJ6Girjy
         G6MQAWLDRPQedJ1bfwUFYOx6brqHMger0IzxhRPjhd7Ai1UMrzKYjv+dH6o1lR3Sc5Su
         9QGCejgkjWLoY2Pcio+MTg95FGq1JUag0ujVtX9jQwV2Y7u9vVChev/Dvgus4LUJD/IJ
         pmN3ZW8vgVZLQOzwwiV56Hx7U8QzFBWRXEB0Go1Hf2fCRLonRmix6t1A15yp+H/AnwUs
         hyKdp6haFyZnLSF3JHqqBqKXEYvRKT6eQXjHIylwaRyY3vPAvL7RqAx1G6h6OjrR+oam
         VGEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1-v6si3890749qtf.44.2018.06.29.09.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 09:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYwBc-0001HB-Hp
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 12:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fYwBN-0001FF-EY
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 12:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fYwBK-00059s-90
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 12:23:37 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38939)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fYwBJ-00058T-V1; Fri, 29 Jun 2018 12:23:34 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue105 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0Loq9D-1g5m271kKJ-00gmi6; Fri, 29 Jun 2018 18:23:28 +0200
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180629161731.16239-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <6f17a133-37dd-e165-3a2a-2486ae49bfae@vivier.eu>
Date: Fri, 29 Jun 2018 18:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180629161731.16239-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iRDHXsGqNbL5jcL+IWI1w+kHOYYC9JAmFNCkZiTtYDY1T4RVTm3
	fVaeLrymBWhRzFiY+ndlObDsrimOmlB5Cz4RFSeuZAShhJpOE27n0E8TDnNtXsnTi+py9DB
	92gibv3NxbMHj7OkDKyfGY9KJRaLWU7oFbEb1oRMXw1vlnvztRujpU8wP1Dx9+N8Gl/FtGQ
	avtzjdQYy8SnstEOdSMMQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:O3SvKxGJYnQ=:dDH39wvl12q5WGRnem2zN4
	de0qIC00aVO6TovBWd7GXVILaanagj9Z+NaPGEWgzCw5YxutG/36lsIGD/6vUUT56NK1TmB75
	+GDcLWndSeWtpV+/1VV42e63sbLhsHyMkF18nPu+tJE0C/NVpZfDdETExBg9T9HBS+rYEXciJ
	tVyjhwYWM6moAN4/kr4/m1MrLXtSN94lUs79UuJ7KRpoqqFdpS2kI+G2I5mHs9WdJH2rRIDmY
	jlFrMJZE/A1ibO61N/WU6CsA0atJKTH2FfkLV4KvOBBurl5p7qNoMSjezawxxfgeU1EAyBDwS
	Shta7hHkOfY1BO8oDJ1fh542g+NKde796LxZSu63vhRRKOtNj5bC7hUqDSZYG3tYZbl/DWoU3
	6s6mhbu/7JdCdMLu+2XMZ7hTZGR3cji5nWRexTUh3ePROft+X9yOSzHYqVV/huhXmtc/cLXHW
	/E28EvloH/mK0x8U+Oi+1v32ZawPffCaLtmB2GH4RFw0AnOSGpmsx4CY49zsDlWg7ZMOsuaqS
	hFyshp3nLzKEuGdPO88LFH3e+/xQAPenV4NLQVNgUwyrPRu9TrnuwGDlsEuNmmlZM5SPLLjO0
	6aV0XE3a6k/87oB/vx1+f5dYAmyn1H9B6Yw+JHvqcFhwMRDyrhIHS41QCXCB/f3+G8TjFE45v
	dMpVWTQEMaHWc0o03KXBSeHsz71yNrbmc1keukENx8kG8DLhhzHp1TvZdcJFhAxiBOIl4NWyk
	xBDl4mu4FJ4iFcfc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-arm] [PATCH for-3.0] accel/tcg: Don't treat invalid TLB
 entries as needing recheck
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yrJfxjdkxynS

Le 29/06/2018 à 18:17, Peter Maydell a écrit :
> In get_page_addr_code() when we check whether the TLB entry
> is marked as TLB_RECHECK, we should not go down that code
> path if the TLB entry is not valid at all (ie the TLB_INVALID
> bit is set).
> 
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This fixes the abort that Laurent was seeing with his m68k test case.
> 
>  accel/tcg/cputlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index eebe97dabb7..a55296583b9 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -967,7 +967,8 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>          }
>      }
>  
> -    if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK)) {
> +    if (unlikely((env->tlb_table[mmu_idx][index].addr_code &
> +                  (TLB_RECHECK | TLB_INVALID_MASK)) == TLB_RECHECK)) {
>          /*
>           * This is a TLB_RECHECK access, where the MMU protection
>           * covers a smaller range than a target page, and we must
> 

Thank you!

Tested-by: Laurent Vivier <laurent@vivier.eu>

