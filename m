Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D563606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMoXibdQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THJG+cLU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQNOc-0003GE-A9; Mon, 09 Nov 2026 06:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQNOY-0003Fr-Kz
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:18:41 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQNOW-0006Uw-CK
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:18:38 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9AuoCb034439
 for <qemu-arm@nongnu.org>; Mon, 9 Nov 2026 11:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nbmvOTed+nuFjEIe1sXZXZBhOzbBziGzM8YDy+80OZ4=; b=ZMoXibdQEMPa/O7B
 P7q5ZF7l7yF2/kHD0ZAgR1gdLXR3husTush/oX/GUbFWzVUMiSbumgD4EGi3i2gf
 rx9zjJo3hWF2GKVwhBucwne2BkHw4N9Uw60A+eaXB+HiJRSEdkj7MkY4pu2T9yrP
 dekG3cH7xKNp8MRQdo+pslRD4dywwfHScsbJNcnRqP7kY/Mc2xHLEW4x2xu5DMBa
 d/L/XneN6wX6ObKQ1N2NGbpMh143punF7eVNqY1JGvYHqcCHVmay4zkGg+UF8Tdg
 JxRsbt9EzgNv47C4BVMV66nzYXJ0RFYaz0eMCw/6f6mp2DEeykuGR5WKr94LLZOS
 pwFDeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5r383-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 11:18:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f559420f3so72046085a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794223113; x=1794827913; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nbmvOTed+nuFjEIe1sXZXZBhOzbBziGzM8YDy+80OZ4=;
 b=THJG+cLUBbGy832kOzbfGgt3woNIKAqxB/DYUueAReBito3f9VBdguWzgPO3oRxoTK
 iFVQ0XHYk05Hdd45PhrwSglH8YrtoYPLfJkiei4yHC/AQ1EDOv8XWYnIa+sJwEXQcVbC
 H/sBG39YChlqRVqdQ9onT9pHP9djLc8OJ18x3d48MJZfEr2kzzNx6QaLnr20/ncmBI8U
 rr7bN3XncceE/EK0mHG+Nc5VTA45KJ2tbCbkUdyhV5pF0D48y+lNshqoHqMrbdTbRCMK
 YPxfZt3SHV/fqc6neCAGzEAdva0Jl9VTfmOLqYw8dM+j/DMzMwFGvYwRndpdwXqBc5vA
 kdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794223113; x=1794827913;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nbmvOTed+nuFjEIe1sXZXZBhOzbBziGzM8YDy+80OZ4=;
 b=KKnrhF68q8x72VOiinbmlkiQB+gzYtIcBj6mUkHfKb0arpi+1XE1y/ffGKd7ea9weO
 YmJzfext0wjJl/NLcWzawV4Z4LNnMfUajjl4+8p5zLtS8AlY361IuYXum5UY0my5YJRg
 vTqPvwqOzEO9N/JwENFbUaQamvN1w5XSQYvzxqhBmpdxZXD6Lh13lTPgoWumiN/IUJmb
 jwcz6aHlDbCM9/hL77DXO9ml+uJni+mEB5aNQdGM4siYmDSqV0aWtXQuLknThc8n9Rhx
 DfJ4Nru5H9qNEFDhyzprcjIn5HkYFI/hNdlWu3hd35fLLWA30smVOgnzVrruq4jaXjRp
 l84A==
X-Forwarded-Encrypted: i=1;
 AL+hErFl1+vS7Ajs4Qr2OjREC0kYn4QyCIKX2xbzvs8ah+9M7cARGzx/zSuzd976n2DSOQ2tosp25Gj4rA==@nongnu.org
X-Gm-Message-State: APuU4Z+BZBcdFHrj7dBAj/0HsbYfjGN4NwP22dOAWtLr2SSQt3Z714RY
 SHyHnLA9adcwoNkG6juouvFIsUVToA17udnkx4e7GJH1+uzULsAH1L5C5jiZG9GlnYXZVMC/qPH
 zfSqcXuVjQgZ9kwT0XQCER35PTs8KK8CgHNhSf3hLM1aM6yEVLFaV6yA=
X-Gm-Gg: AYBFou1OGZp2KM6znUMCXXzgyjtszerVTezeW2mOGHD9P/Ka/8ZMve1T8J0DBcaXN25
 /9LxAzwHSS/AECKy0w7glY/jxvCtVVzs6mXVcKbhaJnV5afpeQkHYyQpLkVw4qhzbfaT2tEYlyt
 3jDJCgtGrFUFENXEgvfVCsVt7gSHSEehRUwSVv7Gs0HmUxl9uS6QY4ARnnkPHN2AMrSU6vNXfew
 xKtOJs8+I0LGZmnngU7B28AEU/+cCBYwut2ep/y6dB9LhkR6nl7QfNACi6hJJrEAsKBdb42AeS0
 Zpgm8eQ1t4i/BfHI/KDf2pgpUSwz6wYoqziqq2KphF/q0S84fqwGhU0p8SidiIAMQVc/vCWl7bq
 bDKCXSoQcQBBfHDR0RwcLr/aVjDebTCQck/HEwQ/QCZJFumkVY9o2kOXtQsNsRsdMctIpr3MnI5
 HmO5lceg==
X-Received: by 2002:a05:620a:410e:b0:93a:824:ac8d with SMTP id
 af79cd13be357-947842019e3mr567964485a.27.1794223113140; 
 Mon, 09 Nov 2026 03:18:33 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:93a:824:ac8d with SMTP id
 af79cd13be357-947842019e3mr567960685a.27.1794223112473; 
 Mon, 09 Nov 2026 03:18:32 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e32b46a3sm241751695e9.6.2026.11.09.03.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 03:18:31 -0800 (PST)
Message-ID: <5b59c0d8-182e-42ab-a2ad-97938c45f40e@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:18:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/13] whpx: QEMU 11.2 pull request
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20261109004108.85808-1-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261109004108.85808-1-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX1nLgJrx9iPdi
 AgMzFEyr5QQ5dvv/n3pxjDUAHDPEc5N5kjWvuMrs0ASgyw9fKrqu+1wgQTzJj+Tmn7zjOtiYXCD
 CHRDI7UXaN5vLJn3VyHqBjRBEYAbbeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX+1XdUUQRDJtV
 mGcKaJRxnhQHEBvbvBrQD92IV9EQmQ4c3BD+0D4hjEEJRK+IFx8nIftA7VcEU7VM+b686OUKEAo
 pKxiowyv5J2nINCgCYG4SeRXzObHEdCQfEfCVS6cGw83KBZkVG/9kgXd4EydND3Q/7+x5P02xoJ
 KCF6YXSh5bqP2zKvpNEamUSz5wNmeRlkoOkQJugEv+tn/ZPajKgwv6dMPGYKV4l8OuOLgfdvqof
 j+mWozhkbuO4wkvA13xydCvb91vpI0tz77HYCEIh+C8btEB0mh8HXooQYw5vrx+Hs1rOog/5psY
 7asC2A4fv5bZDMCIku6lVWoFcT5U575fLhf2PMjvDJNPfvbLb79MccERSUgOM4PFgp1TktIP7D/
 zQUJhtLQ0xyKJGSoKYHidTXa3NvyA4LJIK7Y+4YpvfizIPW/82FFTHKVhs525kzNbK9nUCnBdKs
 j1yOHL86Tuqe8yg/HxQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1ac0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8 a=6zyypkzi77a1KxKLW10A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IYSazOXaVNWdyqWgBIz8p0N-0aQ2_qpT
X-Proofpoint-GUID: IYSazOXaVNWdyqWgBIz8p0N-0aQ2_qpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090044
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/11/26 01:40, Mohamed Mediouni wrote:
> The following changes since commit 71f25c75417d31c214ba2cd26b273c114fc99987:
> 
>    Merge tag 'pbouvier/pr/multi_target-20261106' of https://gitlab.com/p-b-o/qemu into staging (2026-11-06 12:28:21 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/mediouni-m/qemu tags/whpx-fix-0-pull-request
> 
> for you to fetch changes up to f1ea9f2e15236020aff70e37e56f3443c9203052:
> 
>    whpx: i386: also save debug registers (2026-11-08 17:39:41 -0700)
> 
> ----------------------------------------------------------------
> whpx: QEMU 11.2 pull request
> 
> This is a cut-down version of the "whpx: i386: updates for QEMU 11.2" patchset
> with fixes for QEMU 11.2.
> 
> These include:
> 
> - fixing reset
> - CPUID fixes (leaf 0xd)
> - handle systems where nested virt is advertised but not working
> - xsave fixes
> 
> v1 -> v2:
> - Adding Signed-off-by to all commits
> - Rewording
> 
> ----------------------------------------------------------------


> Mohamed Mediouni (6):
>    whpx: i386: get APIC state before VM save
>    whpx: i386: fix TPR encodings for local APIC
>    whpx: i386: save/restore xss
>    whpx: i386: make nested virtualisation init failure non-fatal
>    target/arm/whpx: handle processor reset
>    whpx: i386: also save debug registers
Some of these patches are not reviewed. If you look in the
history, un-reviewed commits are very rare. I'm glad we get
a WHPX maintainer, but being your first PR please take some
care with it, because that'd record a precedent and I'm not
sure other maintainers agree with this practice (I'm not
saying I'm against it, but as a community it should be
discussed up to reaching some consensus).

