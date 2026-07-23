Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC5CC531CC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 20:28:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn01l-0001CS-CE; Thu, 23 Jul 2026 16:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wn01j-00016g-18
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:28:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wn01g-0000hI-SK
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:28:18 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66NImRTq443749
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4byo7srvFsnOvA2OhEh2/Innf8ZLtBY7FDx3IcBnjxE=; b=bnVBvw6r2HOy/PMI
 goQrcXrHZSxqaYjg93pzwhVWL2WmymXJvcm3br8gvi+qEebscyyOsSURTHN1BTR6
 LZWJA7xTm80iJgcF88TQwEauj8rXwOA8p7RRp3HJNnVwma16/R+TFU/aIpwdhBgq
 oY1qWv7L/OtuaFJU+par9egPa4IBNy8C4Gk5eCm0T6nlJP/YjHMpUACX6keMSS3W
 Von+lSjFuiZHtwx3BiyWhbu7tXn9mmPGdjH1d5tCPcM5tCAow6NS+34bNIBm3DNE
 DHp0o3o83BtcBNcPVNL+fg5vGdpc3By/ckggc2d0i4B4MvHjyaH32S/1EspnqDIK
 3YbS6A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqajrqf9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:28:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cb7d6ba548eso1507742a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784838494; x=1785443294; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4byo7srvFsnOvA2OhEh2/Innf8ZLtBY7FDx3IcBnjxE=;
 b=LYW4zupQi+LRlqnOYqghUIxSJrOLWLOdWonAvFYz2p/JDYEms91XIX0S+F/MfFK/ri
 jzzH1tQxBD6htA0qj4iBbgPty8zLBOdatmOjxoYowTaPlKghCNDxCDjfxq7kK51JC2dQ
 9G3IdBHIPHBJDUqlCsKjipTe/lAkAmf9b+2HfUjrDVbMRLE0NiihX0LaxJNL1CAfwQny
 0qQKl99kTTFRI05S0ooRYHLis2x+yaUOjBiQMJcmn7IorK1J3staoaMMJAt9F1a0OPT7
 cSnS0/rv8gwLB1JXfgUKjTb/om+PRXQwekySWe3pcFeh0kfMB4EMHC9EYezz1G12Gcpw
 xe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784838494; x=1785443294;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4byo7srvFsnOvA2OhEh2/Innf8ZLtBY7FDx3IcBnjxE=;
 b=QBruUWLYmRnucCoyv2AUBXcn2qLahxg9tD3tTwoCe00QYK3EHfhtvatBBL9gn5e8N6
 Sjhh91sneRsnN7LmtOUYUivv3PYqGUDkY1EqmRBFgTpAVoQPDh6xqEIcr/RtgcS46/PD
 5gUsEtKNaEeJqiD4KSHYrYEWWdXX5ERULeVrEkp4kYApkUtyirxeAWlB45f+Se3oQEPO
 QgpITiVJ949la1i92LhMzvW3h0cOXGlv1JCQbmWR1YHY2FVJZzxnBFEWOIgCNgS75NOY
 u70i4k0nVGb3nkBVGktCJuy7FXM4zl6slsKpDPKYSKuPeW+KDjn8YQ3LHcECxi1xsgkC
 APcw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpuD04ODb6hOdpFZXgJ3b7KL3KeFTTTs8qQqFVVtM3/pQxQ2f8Tk8TOXxqaEikbR1OTIbT0s2s6kw==@nongnu.org
X-Gm-Message-State: AOJu0YxXFqZ0TULFCFnqKXex/Ugh+9ZlKYv5Q/RQaRqWYd/sL93/yuiy
 d/kTApc8wL4/EAfjFTT2a1Dz4ZJEC9W+LNpecbjV4+DtxWNbO51B4N2tbotfzTpY3oAv9k/hm+d
 o3+0L3aLJ5eloMz+m0J5PsxYjt7V+FFXYLGbJTzmmojmnlRB2VISMK3k=
X-Gm-Gg: AR+sD10r8PCDfa6I/i2h4Arh1YUuXd/TvkmkEuWvgcG+Ae7q6zV7VSqmAl6fbJgDxEW
 LAK0VRl+0eQRDnftL0K/OAakYnd2112HL93eRlFkYGJxri4r/+ugRzccnn+2OrnMG8N1/HhCdr/
 uL5Sop4MJh7IiX1mYbcWK1Sql/1EMVNK+BTlaOr56fRpmpyG7u7Xyn6vekZf097ZCNjj1dvryX+
 DZgz7q985Iu/iqykizuQiCBh0mDMnGBAFOkE7ZFk71r66W/wNOqV5za+Ux6vHZ7758L/R03042s
 +2Gui2LeXoMIo64y/ts+tzd/7+OOVVV/89cf3zqttw7ONeiarNm9Ipr+SUyAJtGNpDPv5tUcpyF
 c03cJV+WgKUasgtIuzPrGxJyamwL4Wy9utQ9A85to0GiHlT3Ffk/DV+ASh1BlskHwP54F
X-Received: by 2002:a05:6a20:2d0b:b0:3c3:68a5:50c8 with SMTP id
 adf61e73a8af0-3c44b2c1f25mr5353283637.71.1784838493483; 
 Thu, 23 Jul 2026 13:28:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d0b:b0:3c3:68a5:50c8 with SMTP id
 adf61e73a8af0-3c44b2c1f25mr5353235637.71.1784838492982; 
 Thu, 23 Jul 2026 13:28:12 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3147e1c9289sm23139444eec.29.2026.07.23.13.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 13:28:12 -0700 (PDT)
Message-ID: <37a4473b-839f-4865-ae42-50b8cd17a9ee@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:28:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gitlab: use .base_meson_job_template for macOS jobs
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
 <20260723200904.224413-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723200904.224413-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=6a62795e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=dHClJHATq4Aejph3YkcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5OCBTYWx0ZWRfXw4I5Gk/GrQY0
 KamYRodojIaLk4dW8BQHmY5GLqq5pXC46KJqWiyXpFl02Saph9rQ1SqK5HdmEG5hAT2nE1SEqhI
 bbuYURwYT0tRcopXc8yTAwSPsVQqjugFBtMdvxNL0reNuB0bklP4r/kxXzUfJEXUwFcwTGhL7E4
 Pfh6KinoPX4gdflZxDvAE19lUbs5MvIid/5TxNbY3RBB+P0yXEVo8v2OmXbSR9tEG28W0V0Lz5g
 ttiJfK7f2CdPjOM2spLFvnyl3cNF3FHpowbhbg2GIXSfXP6F4lv2zViJtAqz4fQC6aD4LKb7y9S
 /lwPYrcNw8X8eTfwMtIEBL6r5iiLavxyy8KO7z62hJPzN887kHiUrU2gTNdGhhDBZjpPYVOiFRX
 4ZhJfhJvUKFMJzggL/YOA7oCCsK51ASNnd11rzECuiTanOsvgYoesImMStmFsyXZT/gt1MW/kXQ
 +/pIk1hBYUU4NXizeaw==
X-Proofpoint-GUID: _r1PB9vr9LpUKWP_coqrTZcpPoZ9XkQy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5OCBTYWx0ZWRfXxro2nBMfO+ZL
 dFo6zz5UwvfsgyIIxKFodELZ4GSHnTVVj58eamWKPAyq83GTA8+HZLC+lV//gMxylwwzXHc5gK3
 2RF4OiGTQK8jOEFpnQvrgdru3Jx1dpI=
X-Proofpoint-ORIG-GUID: _r1PB9vr9LpUKWP_coqrTZcpPoZ9XkQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 7/23/2026 1:09 PM, Alex Bennée wrote:
> This way we'll get more environmental information which will help with
> debugging.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/macos.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

