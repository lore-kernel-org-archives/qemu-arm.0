Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp266648njc;
        Thu, 19 Jun 2025 06:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOoQp/5ITSn7Tl/Gsf0v6JyAlseF9utQNju9D8O68tTe7W64OXCZ7iHuuss8ATEk2kNIW6nFBtHiSH4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGHonld2tpd4Bu1Wr8ShUWIZhlG6InTs0HiN6DOQ1xdN+9CtCIi2jqtQBW2UV/hANj5FhNo
X-Received: by 2002:a05:690c:25c9:b0:710:e966:bf96 with SMTP id 00721157ae682-7117544ca55mr313752437b3.27.1750340218248;
        Thu, 19 Jun 2025 06:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750340218; cv=none;
        d=google.com; s=arc-20240605;
        b=B4WxT3acJq72T39wLIdcooeLwqchR5Nyr56D5n1yLpPkE6oGkcnBS8A3o0iDFR3qit
         KvyFQaqHfSLHTsuZmtneJp6zOSDwgBbrQ7IR55TXZPxji8xJgn/3F2vpNU2qeuLCIiCd
         5cIrfKigheRDLf9J36oHvMiK8F80Tlw6VAOW2iRTUYtYcMTZbxqyh5gZi+T4PWx0Kmfj
         5o+OzKTs7SIgx/EIbI+cz8lpZIRc5XdKek7TZGvfoM0Rx/1k6EGKHv8R/LlWYKgBjAvF
         KniMycEMJfdD5O0VUKoK7GHZAGtDy8sNxFq2eCqXx+40JNxpwCwDyhUIJG5guNe1nDAf
         VXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Yw0pCK+yjsFyWICsC6tO8VSFWY/4YZhCmU+/h/OTjc=;
        fh=4eMjDrMS7j7XyHs4jCkr1TKCO9vbur0tLUs6r5r5L0Y=;
        b=kUNvwyJc+JTJKsiqZA2LuG493eFvtbWmKxfEHMFk6oX0hY+gB5rOUf3cU3GbQOyCGr
         6IufHUphBpUOOWgI0/poQ07pEpvj4kCek101eHS9XlnsN3utMGQt69cH3pOEjWjZEtd0
         /UoI2kdw1Hs0FHCu6yOvXYoc8oQXGaHygfR9z0cfSYTIKoLJkNQH2VeuEFFX0TMbitdm
         s3q+OE4sRW+ev6RCQW1XQYpW+L34gHx6OIbF5XUFctX8ajTyDFasJfXhlGFc/4ZMGXgX
         v5IveGhgZ1l8zs953Pni0NeFU97Ir38sgzQCCAG1g02S3qNMEKvS4ux85GmhVIlg9jIM
         t5sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=l2vxXWjh;
       spf=pass (google.com: domain of leif.lindholm@oss.qualcomm.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=leif.lindholm@oss.qualcomm.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <leif.lindholm@oss.qualcomm.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 00721157ae682-712c3d531c9si12047b3.181.2025.06.19.06.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of leif.lindholm@oss.qualcomm.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=l2vxXWjh;
       spf=pass (google.com: domain of leif.lindholm@oss.qualcomm.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=leif.lindholm@oss.qualcomm.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6E6iH028912
	for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 13:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Yw0pCK+yjsFyWICsC6tO8VSFWY/4YZhCmU+/h/OTjc=; b=l2vxXWjh02LBbxtO
	JGjaBro0ebbmcFV2TDr+Os2O1DI6HDj1iul82sq0ngHusUXcLbro/i63M+TSFDlL
	ODsBCXZYPWb/uktjcFyg+E6fAjaDk0IwIcmvb6sTLiyfWE/qMUpPwvFazJNWuQ3z
	HDuvBhi1kybjr1ftV0fdcVU+/15CXpVrpcprFZv12elSazl9qEmzGllv9svX7Zdl
	sUmtb9FF9fR/aTKSpkxjjKmeF+2BD3FkpPf4dHtdFCBetnpm57zR3CcPH5vHwkjW
	7+TR8XLcYsCSJXnehMMPf/l/cxDEqATkOdeWT2pzqdMqyp6mKChOq1WZi0Aw35pA
	kEmafQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9g309-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 13:36:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so692078a91.1
        for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 06:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340216; x=1750945016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yw0pCK+yjsFyWICsC6tO8VSFWY/4YZhCmU+/h/OTjc=;
        b=xITl8hURo0FRcBteuakC4WzuTPAXFi3PHtpmtSJvNJWIHq//+SxsYPD1mjDUYg/waw
         Y861h/S4Q55xZw+FhXUG75sfU2iSutlKYgXcqqhPQn7L9lIvcVLAQSttA7BV7wu5q6Ij
         jay4cOhA58RkrnGjI9vgPY4MDDQUUdQRff1Mgebl1cJ1puO3lzRCRP/eOEuBe9vSdZMQ
         HOGRuoFA2+aiDK7a7GrnSsvafkb+gS5IhqwN4HNwAgj9+YlgHVdHilBQYykJqzXT51gY
         +OAYbM61/nq05D2h1H62XrOZhUDjXSLjbZ6orWlYwKiLIRmK+b1MtcAZ0Xm2D2C+Z6W+
         aJyA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ytv1Kvh3VRaQ04TFvg+v4GnnXMfH+ffr8dRUUd/c7kYIjlLdtJVrXZQZrTP5AYBYny9/rZbZA9JySw==@linaro.org
X-Gm-Message-State: AOJu0YwiQ92sV5SOdNLBA6CEisbKkhvLXZ1V+bJWmEA0sFVhHJVg/N1D
	hr9Q7uA1s+dgMtQRUCiw7CyPgCj8wd0Hb4nF1axkDDJdkCuRipVGQwsQkE7266s+qVS4JQisez8
	8f9GCIaFWVtL/qnpfN/7jZGD6eTnOjo2byrNEveXDwM51AzZKkhuBgicPOWgybP/jn9Hsw5w9rd
	h1fm18HJkocggnC7AZSpDAnGaYUz7cBw+wYA==
X-Gm-Gg: ASbGnctKJsCpqVLzgRaKty4+BvH6E1hdGTQMiXC8dAKDUSwuzXuWuB8b7bRr9ENDLDv
	oqf+u1cx3YFgd63QtPeSimmzz7iJ+R0BsAZYZkZMFo7nvcWvoCzTLh1X3t1rRofbwrSUB2Zt9UA
	oysB85zIDhzpSW7+P/GfQoGHgk6hHo/fvrzOrZ
X-Received: by 2002:a17:90b:3e43:b0:312:1d2d:18e1 with SMTP id 98e67ed59e1d1-313f1d52d85mr28143302a91.22.1750340216462;
        Thu, 19 Jun 2025 06:36:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3e43:b0:312:1d2d:18e1 with SMTP id
 98e67ed59e1d1-313f1d52d85mr28143274a91.22.1750340216029; Thu, 19 Jun 2025
 06:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250619131319.47301-1-philmd@linaro.org> <20250619131319.47301-20-philmd@linaro.org>
In-Reply-To: <20250619131319.47301-20-philmd@linaro.org>
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 14:36:43 +0100
X-Gm-Features: AX0GCFsnBB6aVSiaBdg8ecDaocgSDD4NQoJgBj-uckYPnF8vAxEIpm4PkwkAxgs
Message-ID: <CAD=n3R2GC0vFxkpzwiieVGSptPYdAEz++d34Z5Qwmn=mKDdwGg@mail.gmail.com>
Subject: Re: [PATCH 19/20] hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
        Julian Armistead <julian.armistead@linaro.org>,
        Radoslaw Biernacki <rad@semihalf.com>,
        =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
        Phil Dennis-Jordan <phil@philjordan.eu>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Pierrick Bouvier <pierrick.bouvier@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
        Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nIR5hF7lGSbf0HLNrLzueHClL1op-w3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExMyBTYWx0ZWRfXz6fNlQlzrjc5
 ruP94E6LJJb2J89nUgwu+M/EDP5ZC7yMdNHgIar/vYG8h1g38KNYApzv3Dw30plOeXN20ylHLJH
 6CMzz9zLvhWAUtwFcbVjsN8k/nca4cldcx7aim3fZSpVIfS5tvbWCqSPbq50JQ2Tij2KbdNvleL
 oEqbyhFBj1BIb2zpLa1ZZ0Jf7TqcQlrgteL1MUMSiVDT1iphNCQUXL2j11b3FyZ6+loyouMhk9c
 2z0tYBdVDlH+wEKiiUr3dlT0MnRvYkcaFaLHSJveExvEXMRjClKrK362k83l2HzuI48cG03mGsW
 ms2cdd7OvTztFuOGTpXa207RhDOwmV6EKN41j7ik6+xE9GvK0103GU7VmNBsFgS+jNcEI+AKFvg
 aDVRdQ3gATlB/dBIl+smj3CKFVR1oCvmEuUA75yVZXLON+Ibx/J3mHq6eVCV9ZcqEXzCq3yq
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68541279 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_k9n5H8yiGyBNqQC-Y4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nIR5hF7lGSbf0HLNrLzueHClL1op-w3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=967
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190113
X-TUID: eBDAWufrYfJ5

On Thu, 19 Jun 2025 at 14:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Define RAMLIMIT_BYTES using the TiB definition and display
> the error parsed with size_to_str():
>
>   $ qemu-system-aarch64-unsigned -M sbsa-ref -m 9T
>   qemu-system-aarch64-unsigned: sbsa-ref: cannot model more than 8 TiB of=
 RAM
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Leif Lindholm <leif.lindholm@oss.qualcomm.com>

/
    Leif

> ---
>  hw/arm/sbsa-ref.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index deae5cf9861..3b7d4e7bf1d 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> @@ -53,8 +54,7 @@
>  #include "target/arm/cpu-qom.h"
>  #include "target/arm/gtimer.h"
>
> -#define RAMLIMIT_GB 8192
> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> +#define RAMLIMIT_BYTES (8 * TiB)
>
>  #define NUM_IRQS        256
>  #define NUM_SMMU_IRQS   4
> @@ -756,7 +756,9 @@ static void sbsa_ref_init(MachineState *machine)
>      sms->smp_cpus =3D smp_cpus;
>
>      if (machine->ram_size > sbsa_ref_memmap[SBSA_MEM].size) {
> -        error_report("sbsa-ref: cannot model more than %dGB RAM", RAMLIM=
IT_GB);
> +        g_autofree char *size_str =3D size_to_str(RAMLIMIT_BYTES);
> +
> +        error_report("sbsa-ref: cannot model more than %s of RAM", size_=
str);
>          exit(1);
>      }
>
> --
> 2.49.0
>
