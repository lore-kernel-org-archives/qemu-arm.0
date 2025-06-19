Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp307398njc;
        Thu, 19 Jun 2025 07:40:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnCjO8INTQe+5qHjG03jqbks5d1gSCto+Sj9KDPSmV3MswWCJA9+Lj+rUOFSrqpaCDQSJ6ERjidBauHg==@linaro.org
X-Google-Smtp-Source: AGHT+IF5EMgNGyE7CcNChJ7dQ6rVMNNOMOLhkS6fkg8R5KnPmZXMXa4x+xFDaOv/m66QSJsGZmtG
X-Received: by 2002:a05:6602:3688:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-875deddf14amr2556035439f.13.1750344046355;
        Thu, 19 Jun 2025 07:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750344046; cv=none;
        d=google.com; s=arc-20240605;
        b=YwVjih0KfufwH/Gbb5Ad3/RouhWw4UVlZvRnQensD8HtGx1nJzneFIjC338Oi+LDEZ
         c3sC4nUP0VWDPgfw/TPJ/4hV9381DkCcoNN4+7Wjptsce/G4ZexojUFnjNR2F3G25rEB
         j/6lucHDIYKazFFBuhStjidVa+UgbEJfJqvh0b7waJz/lLMpaexBmDOHP//ROTmFx/y+
         bSs1pJM1e8iEqmNKYqErZweC65/jQ7N1G9fJDtQlkpDl4exMPwyotvT04mvDdAQL/ioi
         0SnZoybmn22qxojTV9R3MviG7SnmW7uVvGl7OwPSKBNwgBae5m78+Jq+av6PmLGOk8N+
         N+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7egzB71KgEy6DGRuLUQB30VjVlUozKtUHQPa0vK6/jc=;
        fh=uoSWicanPyAED6VUqbI1CmUjAda9d1Q7E+MNyaaV7eU=;
        b=CN8hmxttHuf4YKfdglV35jd5gI+3pXZ1eZePMz8vnSOjG+N32RmmFXnohM0z4F1zdj
         E4nAIJp+iX45mTbtIWHxtt53strR6M27zhwjxxi8RlkRBR0sek+dwhIuNhQisfQVNFd4
         KQgjsFqqzEtoYSDfkOQGuAGwAUiO/N2mG51hQ/a+he60daY/S4A7tBkoLSnIvTsOpHM4
         rwdqQyy4iDxRJHoWr8fWor2+P/vVQpMXLTkK1IenNPFeR9qfpymNi0dLLOqP6SHVVDvL
         swO/UICpNHvRNt2Hw6xLWdJfe87MzZwImRNaDlGM5XNdtUHQOnfNEX+QlS0plvzeR+fn
         Ro+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b="Eym/o2RZ";
       spf=pass (google.com: domain of leif.lindholm@oss.qualcomm.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=leif.lindholm@oss.qualcomm.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <leif.lindholm@oss.qualcomm.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id ca18e2360f4ac-87629f605fdsi23624139f.87.2025.06.19.07.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of leif.lindholm@oss.qualcomm.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b="Eym/o2RZ";
       spf=pass (google.com: domain of leif.lindholm@oss.qualcomm.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=leif.lindholm@oss.qualcomm.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6qwGl027542
	for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 14:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7egzB71KgEy6DGRuLUQB30VjVlUozKtUHQPa0vK6/jc=; b=Eym/o2RZ0ceaaGSF
	OHq+HWS4+FY0fSWoLjmA811sZi1sPsa62Njr/c9oagBEr9UBJEiM3v2+OLqqzJjq
	bSkpGvVwzCixhmxcsQpDxNMD8H8pMp5cARviIt9nPmIE6vzda28iZtQ5meI5/Xyx
	mn7hvMyFv+sz2zTFrXI7C2Ud3hR9dPYtugvBcHuBvOv2y/MtL5No2ii2NrAvC2Ob
	IVsMa97oAR1ibKMW4bHc13DCKJyF+NLhJDWtw0TFhxjyKC2OmtBD5Yi78hX2PQUp
	IO6YEYLbmeKoGNWoOFabnIut8UWG7H085vE10IJmIYdwxBpmo8SegvL589tH048u
	aolfEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd8ds2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 14:40:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234906c5e29so12513525ad.0
        for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 07:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344044; x=1750948844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7egzB71KgEy6DGRuLUQB30VjVlUozKtUHQPa0vK6/jc=;
        b=WvTc7FV4a7DgSdG9n0SBi4wrM5Kx33jlummGAnUa1MPAnfDC38BPjy7dX7WNc1iEsX
         q4omvt+2Ywz3hwK/+OkyVH9FgLUhaWsEWmGB4FFUaTjlZdDq+o6s5nuNybfTBjdETllz
         UC4VDEYP+ETjYhk4BqNq380o+7lrsI5SwFIJQlA3mqGa5I9/AF7irSkaFSH0QlGwdOVO
         XigeHCaoiO5EDFra5+JLehtIijKyW2ojX+39JJ0YK44uHQGJV0HmPmxgl6sooWeFAOVq
         fzpMrZHFLgKZrKX2e2Yr+D78YJcZVlHUD6mvbtd/IsHnl7+vg1izpRhOxiGdKmeuyzHS
         vzPg==
X-Forwarded-Encrypted: i=1; AJvYcCW6uBHhwNSq3T/yxR+iOQ0NgJYUyYdLpIYg9F3zXLu5YfEvlcX+1CibxVCp0dY4vjmVEFk3cdy/cFVwZg==@linaro.org
X-Gm-Message-State: AOJu0YymDZ7bAb97YKBgR3Hwhxzj/dJIHM/2x2IGqqvz8+rXhiTMYNfE
	1U/5w7dYFs54CtPh/bcNvQxxJXLzmfcqJ7l5x5FFeTiMoScNMDsKVutfqflBItC0k3XAsh3pRnF
	Tuy5dW5vKPXPSTqy6CRO+0IwaTrIFZNQBhp5czZlCH7NA2b2rklbgQSUXDGRWfgXKYurX+jpZci
	vQkgtZv5lPEG70qom/DHxJHVJKPhyH8sPqSQ==
X-Gm-Gg: ASbGncviqO6ZvxP8Q0zN0luizCGf1M+hpkKvWSh0wA0qhgtmp1zD4RyfwoH91+gNmSB
	tEM+M4tupSQD5QFfCokxS4JM3kJ7AQrsUqAi+GhnsfiyUfTSk7eDckX6ITb7t/nHG+zOI6LE7+/
	loteQ/mJDIncYD+1AHDBoQVRf41HZdu8FOak6e
X-Received: by 2002:a17:902:ccc8:b0:234:eb6:a35d with SMTP id d9443c01a7336-2366b136680mr324320635ad.27.1750344044514;
        Thu, 19 Jun 2025 07:40:44 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:234:eb6:a35d with SMTP id
 d9443c01a7336-2366b136680mr324320115ad.27.1750344044055; Thu, 19 Jun 2025
 07:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250619131319.47301-1-philmd@linaro.org> <20250619131319.47301-21-philmd@linaro.org>
 <CAPMQPEJTTa4NiEvj9pmrubyn3dTB=13PW6scive=nfAGVtqMHw@mail.gmail.com>
In-Reply-To: <CAPMQPEJTTa4NiEvj9pmrubyn3dTB=13PW6scive=nfAGVtqMHw@mail.gmail.com>
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 15:40:32 +0100
X-Gm-Features: AX0GCFtwtN7llzon1ANpJ2JjGfFA9AlqnSbO4UehnDWWNXuYEFiuEUKdYbwNL2I
Message-ID: <CAD=n3R2S17nYoikdvVwOW=aF4wW=Pk7_86H3sN8R7v20HVArTg@mail.gmail.com>
Subject: Re: [PATCH 20/20] tests/functional/sbsa-ref: Move where machine type
 is set
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXy7puYEncgIpt
 Doe3cB5AexFZDFYx6jyzMEDCPTU9XskJIGVyUZhp5qMVaGVWSfRgdnr3TkeHnYJa9r3swAZ5wyn
 C0zRM+6aUzizkepZPwAMaYILrzpQuyxdVZGo56NlpBaV4J6hC2XELhC5HnRxMDMyZzjujRvbkez
 rY2tmagF+0proIQ7PgtupgKKhibULTNGKJVDFOp5CHIJb2WlTwoBETm8LGErC2vyVeP4xFwmdQF
 FbPOlJW6bIHMVhmkvSIO4hbUAwUTTi8G9Xe4oR0pRzqdvnvrcxBoHOO6Y2SK75XysixK7R1qDof
 MFmX6L1e9DLiD/npZWaocYTRNk6a7aMURt6cJ4eKTWrpK1ewMq4mKaNv+AkvceUOjByRxM8QawR
 R/Ni6GxiC9XEsPlTGYRx12GmILHb3FPpA6hLW8JIRhVgEjnrHuAFi+zL7UQmbzCaJmBpdgXW
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6854216d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=655RdkjLQMz9J5miF_YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3g7SPnjk1bek_r8BAmqNvAr5NQs8b8YR
X-Proofpoint-GUID: 3g7SPnjk1bek_r8BAmqNvAr5NQs8b8YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=773 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190122
X-TUID: 0fZ56RtjWH7C

On Thu, 19 Jun 2025 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On Thu, 19 Jun 2025 at 15:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > fetch_firmware() is only about fetching firmware.
> > Set the machine type in test_sbsaref_edk2_firmware().
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  tests/functional/test_aarch64_sbsaref.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functiona=
l/test_aarch64_sbsaref.py
> > index e6a55aecfac..5536ec622e6 100755
> > --- a/tests/functional/test_aarch64_sbsaref.py
> > +++ b/tests/functional/test_aarch64_sbsaref.py
> > @@ -40,7 +40,6 @@ def fetch_firmware(test):
> >          with open(path, "ab+") as fd:
> >              fd.truncate(256 << 20)  # Expand volumes to 256MiB
> >
> > -    test.set_machine('sbsa-ref')
> >      test.vm.set_console()
> >      test.vm.add_args(
> >          "-drive", f"if=3Dpflash,file=3D{fs0_path},format=3Draw",
> > @@ -70,6 +69,7 @@ def test_sbsaref_edk2_firmware(self):
> >
> >          fetch_firmware(self)
> >
> > +        self.set_machine('sbsa-ref')
> >          self.vm.add_args('-cpu', 'cortex-a57')
> >          self.vm.launch()
>
> Sorry, last patch, I forgot to squash:

With the squash:
Reviewed-by: Leif Lindholm <leif.lindholm@oss.qualcomm.com>

/
    Leif
> -- >8 --
> diff --git a/tests/functional/test_aarch64_sbsaref_alpine.py
> b/tests/functional/test_aarch64_sbsaref_alpine.py
> index 6108ec65a54..98762eedb67 100755
> --- a/tests/functional/test_aarch64_sbsaref_alpine.py
> +++ b/tests/functional/test_aarch64_sbsaref_alpine.py
> @@ -32,2 +32,3 @@ def boot_alpine_linux(self, cpu=3DNone):
>
> +        self.set_machine('sbsa-ref')
>          self.vm.set_console()
> diff --git a/tests/functional/test_aarch64_sbsaref_freebsd.py
> b/tests/functional/test_aarch64_sbsaref_freebsd.py
> index 26dfc5878bb..1c243d0d459 100755
> --- a/tests/functional/test_aarch64_sbsaref_freebsd.py
> +++ b/tests/functional/test_aarch64_sbsaref_freebsd.py
> @@ -32,2 +32,3 @@ def boot_freebsd14(self, cpu=3DNone):
>
> +        self.set_machine('sbsa-ref')
>          self.vm.set_console()
> ---
