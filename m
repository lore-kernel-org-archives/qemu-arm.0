Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505E2C531CC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 20:28:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn01t-0001Mn-4H; Thu, 23 Jul 2026 16:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wn01r-0001MN-TD
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:28:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wn01q-0000iE-G5
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:28:27 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66NIlrg8839995
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ac/7nHSoQqwpi2S6FYhMwBHVpDNizEOLIobP2nFzNm4=; b=WQqMrA40LW48PaVF
 LU79rueCzWrdImmNdry+KI9eDZPtcar1SqCtWB2GLYi13NPzYHb/iMgHo3o3MaBI
 E5Slq+eI7FrZDLhf8/KsEuxUuFr7YdhNU5J7kbwSUpWj8M4P07Oy13Abtjyc9EQz
 S04vuKM92BSpWuvRa1O9yvWE0UMZdkDKEQ7LJAEQ5y7Fox2GhgCEVETB1r6bm2t+
 yJcLo1mPe7fkyNF/hSMDzbQ6Vh9XgxqKSrQ9StQJQYb7RIV9FLb6e04IbLOOcNa8
 kd6uSd2LWnC8OvK3A9aZ4RFS+blO+LcHDWhpB075Q+GvoqixRFhN1b3VmtH17OxY
 U4wSGQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa18qke-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:28:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38e2237bc43so2090723a91.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784838504; x=1785443304; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ac/7nHSoQqwpi2S6FYhMwBHVpDNizEOLIobP2nFzNm4=;
 b=TH9tUa73mI8zzSrZLIy5YggOZk2XINaRTvvTaKyGQH3lVwAujK3kKt/s38/RXwIQKo
 MJIBZu6ZCd2D91DeVA7FtbBSgd8z2gn/OO6MwkKoDs+2ZTO+BryTMw8LXUeANlbiTFqM
 muR9S/Z2VroEdiNx5V/GmwrFVPVkOdxFo/EASYZ9w1gfJtc5gnCx0smwn38v13HWc32y
 IhlmPSlQY6FjM4HW84NaLO6Zn+RJimzivqRHp/19mW65TiLOfmA2rgma10/RtM0uQuPr
 HU6LHdYWlMLq67C92RCvQjUj5aHGsM1ziniLOHw5JQ9g84g6OJR91ve0yiql81N3b4Nk
 HF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784838504; x=1785443304;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ac/7nHSoQqwpi2S6FYhMwBHVpDNizEOLIobP2nFzNm4=;
 b=hhzjW0bxvFO3EUjS7Rv6+6fTIZBKa0/WRYqFZMv16so+fCojz+BSXc2Tux+d07TOPP
 czbMPzULqketK0gRB7uMwNzN9P26h6bHZ5EswOs86endKFDfCIpvBmRRz4VmPFxnHdru
 gfdf0w6h2hgfDALy4Nj4qX6L3BFu7QDHq7zeCyucCpc6zveLmzJTbQRkThdPiR7knDN8
 7iRVfu74F+1cLF/zdrkB4xOd2Ebb98mUkHFrWnIlUQt/qH8P5+fWOpUd6PRcIOB/E+7J
 vrtLA0NWqTMGbeRzo8wmA94CCQhLTm5WmDRiONXUs+1A5cbtOJAjoVM+twd+J1zOpreu
 uWDg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHDW3zLoHURBxUJBe7SNIvxxFSYeGfNgsxtBOXYRf7S5uLNT3LCu7RK8cYTji80Fhbl+4osKlMZg==@nongnu.org
X-Gm-Message-State: AOJu0Ywc7lrm1KRvky8CjQIcYaqgVRe2E2vdSF3l5kAinePx8GVBjt/f
 F/TwqtdBkD/QOeBN5SyNQIL5Gbmp2dzJ3J/LMJJsU6BL9ft9eVvPzYktWAumo202M7pVctktW2C
 ttVG7FKJcon7SKCKP/HAq5ZYUGNbF8bI5WlVG5TTcWLwF9nIv7/ehoHo=
X-Gm-Gg: AR+sD12fk66v/4e8ugICjlgy3am83dzgfohP2sC7IWKraXp4H2Klw9OttSPWt2zv1Mz
 QchfNrn27QJoNVQ6ID98DLNdAAY8bfsoTFDD+PtbnL0ketf3oPn+LNIXnj/7UbWt8PmMiFfOH0E
 w9H20NgzVn/5CF0ggoG0tDqOuJPy8bpZW+3VMXJys/wZIxYJfwxbDse3p+lOCbXDvJhcPIuPfE6
 JLMKLZO8jiMzLo8LfHvbZ6wKtbHJubeyQqI9i5wfocnlp83iV+qvQ3xwY65Y34o6P3njiM4jGne
 HccxGRZQmZ1re8g1dxjcY0KQ5vJ1n+rmU591CDNy2lHREUSC/ICkQ3mnCpxrGY2iCEU8Te5OI+q
 UzUAxsBoBBo1jWrJJQ+xV77w0iYoVzHi8og0olQMohmLgkR+0ll2fL3vjBWTHD8uOEO6W
X-Received: by 2002:a17:90b:1cc7:b0:381:f7a:2e0d with SMTP id
 98e67ed59e1d1-38ec66379c9mr4101167a91.33.1784838504483; 
 Thu, 23 Jul 2026 13:28:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc7:b0:381:f7a:2e0d with SMTP id
 98e67ed59e1d1-38ec66379c9mr4101153a91.33.1784838504039; 
 Thu, 23 Jul 2026 13:28:24 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13d13002f39sm19123362c88.1.2026.07.23.13.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 13:28:22 -0700 (PDT)
Message-ID: <5dcda48f-1e8e-4d4d-ad74-85302f82bbaf@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:28:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tests/arm: add explicit CFLAGS for system build
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>
References: <20260723200904.224413-1-alex.bennee@linaro.org>
 <20260723200904.224413-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723200904.224413-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GXdHwARk1OlZZItAYVwdc5w6FwkWlpfq
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a627969 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ALCCpff1BQAnXA4x45UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5OCBTYWx0ZWRfXzgQ9GAqN/hTi
 iN/+dZIXHNBR2/VDpGOZmlzG1tsQpvG6LqVOcdk0mGzi8lem7Zq630Ap/q5c9thpx1qEs/nX512
 fArhJiMydkeb1Fto/dFjDwhRHrj03HEQewkT1K50v3d/Wrkg2dACyaVTZ4SKsPf7ECAh1OdIszE
 T7ADHKVNPv4btIdznNf4Ck/vPsI+uV9v744pnLC51BOHBsSAn41BalQ/9RjcL+IdExM8jcMZ6fM
 5d0vyxEuREZqtvx3VOy6dKk91PmJsj7a+4HIHHsbIwKu0GHQWOBf3gR62h9fe2ZitdyzoUHkk1X
 jIglXHcepYPJMhpLqYPzsj7nohDjBSftxKth0+UPAPQjO8L06XpgMeU0CHnkxkE1Br2NbF9T1+Q
 L8tBZaDReAwueGxaoJ8Ve8DsiusbtjZePE6WmExcKk3rvyy3Cnpc7TJGdXHIsNMcRrRSu0L13s3
 v9JAAZCmEWDTSfaHatQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5OCBTYWx0ZWRfXwbnswlg1nJEH
 bSPTgrr6iF6+c+BHYNSAfjV6p+BCOeip8z1U80U+iurhMoSz82WRFqno85Mu15v4YA3Vh/ArB56
 /5ctuq6fAS5T+AP9s8dyWU6Culb9Gjc=
X-Proofpoint-GUID: GXdHwARk1OlZZItAYVwdc5w6FwkWlpfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 7/23/2026 1:09 PM, Alex Bennée wrote:
> The brew toolchain on macOS (arm-none-eabi-gcc) is a little different
> from the default on Debian (arm-linux-gnueabihf-gcc) as a result it
> defaults to an older architectural baseline (without isb's), assumes
> softfloat and will get confused by including stdint.h without being
> told it is compiling freestanding code.
> 
> Make these all explicit so we can build arm-softmmu tests on macOS.
> The test-armv6m-undef is unaffected as it has it's very own build
> stanza.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/Makefile.softmmu-target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

