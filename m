Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2623EC88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:29:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6Zlj-0007Ix-IX; Tue, 15 Sep 2026 16:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6Zkp-0006nx-RA
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:27:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6Zkj-0004qM-R5
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:27:43 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68FIti7G3342350
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 20:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qP1fn1HLxgi8xIN+Cem5c9nyDmyVtqQ/ENoX0awITy0=; b=pOVCjGAWuRbFWP4z
 9xeGVLeddD3sjVNYtWQ0T5cH2pg9izuCalNTQEopbeO0zs8BRDXjs3+177OCie+w
 N270GXMZb7Jx4aY+iCrdacaMLvydUftJyxCUsOFI78KHRI4g0K0PB+C4d1/EJtU8
 EN+XT1EaWJJPfXL/sEuAByX2evhwzFwLBb0NwmMGPfIff7haXwImvRQZNK5VkTnX
 B0SbniP64ss/UMJ0nl5LvWTk4gxzR9SL0+ZbFTVg5fhwKMH1IrjtBfdjf1Aitrjd
 dX9x5iaB3QzKKT9oK+39CuQyqpG0GK80yGiISam6X8b+kVI9xrUVktBbv6kza2xK
 VYCkDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpc32s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 20:27:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-396901263b6so9334377a91.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789504058; x=1790108858; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qP1fn1HLxgi8xIN+Cem5c9nyDmyVtqQ/ENoX0awITy0=;
 b=N4KzBYvfltabOOc2wvgD/obIaLty8W5b4vy7Z+S+gUkY4YTqykF9OT7UN4IP0qCXFL
 HeVwXDe5+VCrRg1eVHdgYn/JAUh/WSbe1cPlFFxG/cFwr2DPH8hP41NfPfpYkhTaKQwq
 kGVYy/Gx4ivWU5j4tINWlBIah35eBikNP4Q4FMZwERYtWgnLNJN3AMFBPwWVKu513lBK
 dm6AMHul63BKtJ8gWRxYQptDIZ4RVEDA2LHl3bDyZZpnoHcmD1hADNAhUd0U5qEoPED+
 9MZKYE5UuP7ZUe0p1uRlgBSV3rbHATpKtXZio3XxQDroVyjVmSaGrWoqjrESMrCSUyHk
 vIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789504058; x=1790108858;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qP1fn1HLxgi8xIN+Cem5c9nyDmyVtqQ/ENoX0awITy0=;
 b=NzCB6bAaSkNdtn4NRCNJB0gB+3Y5kTw3n6qy9y7p7KYmmpPF29cj9Eg5/+2SeikcTO
 SldGZFv2uwffmg+aNmT512OnlE5OG5lNvjp4LW5kQnS13TfOW4zMeObG6M5U2nwTu/Ve
 5RS0u04ibGYp3VioSoET2mzK62aF0qkZaZQ2GvKUIvPDNjIdghh8M3+tXEmJqKF131Lm
 xjlVFOF2Wp0troPgn7yORF1SJTZU7erLLDOy8IiHdPgHEcWiUZsvoMiwdF6WvNV6vwfd
 svufc/iqYZUAQQ1A62Fem8Gemk/3uv0QKsHB1178O7JvllwkMRLOAHh9oOD/6IHCJRLz
 umeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByauXIf5CF3pCIxRLwjrK5LF8XX44AXI3ttTViUcTpns2UNDyFZfu8mykHX6AV75E4PeH4W7cuKWQ==@nongnu.org
X-Gm-Message-State: AFuF++nszwdKAbvaOvWbHRn/ZghduQAaDCPDqIKFn+o9z8Uj/rbj4YXk
 UGgPuHpQEbBSc2vXJRlSn6tOTT5EmEAVSx9NwjK0xcRhTGfp5Bua04vxtWLlV64yze1ZrIArvxS
 JdII5slak+IJ0XDxXTJKvlXMmQ6SDerPvdQvPrG/3qd68tsDqyU8AwBE=
X-Gm-Gg: AYBFou1CAs8uxRIXVjWy5KFvGFC8euT7mPFT94RjuhKPtNYGotRe1cMIL+4y1DRiUMK
 TiZ4R2rvIQkZSjBe/hxlsV32pCHmEtxTjYMeeOtwHR1VV8+34VeNrGxEddVIXcpZ6KxuedPafW9
 BlvBrXEV+LJYPwaAPl2UOep5MGC3HAY0AOPKH5K45klSz8fv/YxRA9pkNOiq63MybLpUh4LgU3e
 FwKlYjiXT/L+EbwraeVUjwcYn/UfC3vVG+QNyDAUgdokeQeXkk+GzIyoEbGGjDDJu26iop7lyU5
 dEfwxrcD5xMHLK6McUAyPFZiKmjYdOcMuf+LzDHzXwf/eVB+KezLPLZ0IW+HbjN6bkvKIePeyc4
 IIv1tpnNX3rcPhIr2IcSwEM6EadLRYzAKO/QJOvdoRoPa91tiL/h7k7YUc6y5JGTPIoqx
X-Received: by 2002:a17:90a:d407:b0:39d:fcbe:fe00 with SMTP id
 98e67ed59e1d1-39e1e52242amr15352a91.22.1789504058461; 
 Tue, 15 Sep 2026 13:27:38 -0700 (PDT)
X-Received: by 2002:a17:90a:d407:b0:39d:fcbe:fe00 with SMTP id
 98e67ed59e1d1-39e1e52242amr15300a91.22.1789504058069; 
 Tue, 15 Sep 2026 13:27:38 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5a93f1fsm1497884eec.11.2026.09.15.13.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 13:27:37 -0700 (PDT)
Message-ID: <f9c2d77b-bf09-489e-8e47-a9cc77fbf6f1@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 13:27:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] Revert "tests/tcg/meson.build: implement
 ./configure -cross-cc-* options"
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
 <20260915201601.1207839-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915201601.1207839-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI5OCBTYWx0ZWRfX/IcDYkqTEbLy
 wzensJ8TQqeioYtvPSMznd9YjJdep7bVmDWFzlXo8Z5Wd6+pDTG/JunJkdqR+7D8VjSVtcOJSCa
 gxPO8ksGa3ybSvGL76HmZK1Vv4ZV9sM=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa9aa3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=tBIfNM-aaFI9AAqTsNAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _M9VUInre4buBoa5CxZFWbhtp72cfUFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI5OCBTYWx0ZWRfX3ZcwJRC6G4/3
 iZsfzIr5T2OUeJqwqOVMlMYSM3mAc/Df4ztPp1dWp704XJ8y6xWKZGzjTRa35xaR5BvSE/RDQ5z
 lQiZrPS4KCVl1AW/Gb+IrQBR6SgKeSudN+OdmgINC2lvkeYVUdCXvZFpXbApqX0SwkDs+jSdt1P
 ci64NU+KHsxoTHpyIlOLJP8mYGN3PyM12Z/xTZ5yRoSIJjC2ZimJ9wvmRkvMa6YKphsmNNZyYbq
 mnAVSRu1jnDnd3NIwf9Z6odxwOqazDmuHUchH23osgyxhYNPRnf0Hx55wYpKuL3M38EL50kANxV
 idmih1RZKdhzTjz/Qt8QhptqyzU74ccl5ylsFYX7lDOCPTPmTRA2XyTA1pRW/96FWfBZGVDgRBm
 cEk36jWZ4q/8gzCDpFwhex6zrgrWd2NzPTCdkX5adSZdcPihB66a6f5UqHb9fU9ypAKVN511BGb
 qdV/K3rhFCnOFcutz7Q==
X-Proofpoint-GUID: _M9VUInre4buBoa5CxZFWbhtp72cfUFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150298
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

On 9/15/2026 1:15 PM, Alex Bennée wrote:
> We want to keep configuring of the cross compiler within configure so
> it can be used by the firmware.
> 
> This reverts commit 7e1d54da6faf10e1fc70f6b3d8247068b80b1597.
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure             | 27 +++++++------
>  meson_options.txt     | 89 -------------------------------------------
>  tests/tcg/meson.build | 31 +++------------
>  3 files changed, 20 insertions(+), 127 deletions(-)
> 

It's worth mentioning that a side effect of this revert is to skip all
tcg tests on macos in CI since we don't honor --cross-prefix-* anymore
for compiling tcg-tests. Not a big deal since we test that on Linux though.

Also, if some people were relying on these options, they might be
surprised to discover they have no effect for tcg-tests.

I don't have a better quick idea than keeping both (meson options, and
config.mak for vdso/roms) for now.

Regards,
Pierrick

