Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA038606A31D
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpA8KNfj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izxRm6NG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xK0hv-0005eM-MT; Thu, 22 Oct 2026 17:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hd-0005Xc-KE
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:52:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hc-0007SX-74
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:52:01 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MLQ7U9807480
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZJ0vAVBFE/gA/LBiAxfTUL7mFi2bGgjivHMnOSJrEJw=; b=UpA8KNfj339Yzy5i
 ygfcbfm2hutJ96BjW8dP7UTpQN05F729OSe6O+2hjPxKW/5nWuefSAk61+Z8t+Vz
 AgoHL/q38M+w3FVZFMojnXHTyNHPAVSm8s1walVDRb2estkI1ZsNtQfUiXrKT4HO
 6DK6EXoa/fb4K73Ow7yQtIk13+5gjX9uvtR+RjfeWQYOAvPl7AkEH6cp47p530rX
 nHUfAfOSy5J/6q7R6r0rdQSvmNoQJUeM64+n6gSPFZNl1NfLYW0KiHMmPHJXQI1H
 K3m2dzyA2d37TFOHVielSjprPmDkpPwTuNTzBJVxShUOxRUzR83H/9IWfO4EIlLP
 KJttcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw17hp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:51:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-351788121cfso934136eec.0
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705907; x=1793310707; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZJ0vAVBFE/gA/LBiAxfTUL7mFi2bGgjivHMnOSJrEJw=;
 b=izxRm6NGzdNQ00nuy8hIL8biJdgxZLN1a5O+2jlRSd1B0V5b1DDWHv/wAIfAl/N0xK
 8bzijxS6sw/6WGesA5f0yKbGUfD2UyPm37dHxqBbLYBVL1L+MN2fmv7PjBpHXnzSHuNv
 fbrm92s6uB+/uALsmg9FrzipL7asGiPhWhJEzNonLGZH6cxT438CB142NrPjAKi/bVGm
 z1BZdk0smBOb4hy8veO5CBks2OeqhJBqWQRMdJPQs4DAVymN27FQ80qFF1GQ2M1jHRst
 P+/FxK08BPnXIW99zEnn8jNutsLy5LkXOaPwu4cQxl3f3h2OuX+Kndxtb4bOCI4d6xAw
 uQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705907; x=1793310707;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZJ0vAVBFE/gA/LBiAxfTUL7mFi2bGgjivHMnOSJrEJw=;
 b=aQ1hiwMVvvOMB2AA9p+ecO38RU2VOb7MDwmqSYsADtg+vu1FBfSjhsrE7LzZTm2Ibq
 vTK3MA8hi5kINVLvqcIXvc90uiIt0BWp325HyibQZd/7WIfqm9+EtCKEYdXaTH1srJ7d
 2bYsfE9bCzsvoVcTN2fHT6t2XPFPeEF2dRqPJRgDkKYu/ZUOIMhv4qyfLn3BtxC1aYXN
 sNbRMymbOKRIBFI1bEIGglhwWg1zSlf2E5z6krL6kyfULH69BXEk/dU3CmiKGfKib2ly
 hoFxifonW0kb6NAa+oFhVDMDRUMb0JwG3g1b/TiHmAbgWn105mqTWM9LIZ9cUbDKc72X
 MKsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByQvhHXK0FM71lPR82afKKmpwKa/Rzzu4rzGmUbDMbuzoPLym8yWFNBgZMfZEPpGRQW8/rR5kSXaA==@nongnu.org
X-Gm-Message-State: AFq9FYJCFErl7+W/RJA++gShoQRSEz6c76k7WQwJKubgZF6o5rBDVVpJ
 6aCf4yeO7K+v7Dy//bUEnKsxj8l3yiAFGon7ZTdxmIYX5gdcMVJAxZHI5yf3pd9a+6khYd5HV/7
 9MoR/OUPtChP2uLJZnCc/FL3nljzey3mGcRivhe4KFWEomFV6UvbkhrM=
X-Gm-Gg: AYBFou1EO3GVWEadz9RcNR/GJxJHH9zheiHK0EDqP5DGIGthOC3cBN2QgANpu29Q47V
 QpPv8CFZCqyuNwFC2r4PVIeU2cnvL5NxriiZdQLtHA1xwSCqnTsS4GJUbpcvTkbwupUETCx0PoX
 uDO71LstynwzsIDxokRZOd4TWCC2zqsKrXXRHH94zos+7fWR7qmwr1aEaODxtS79bzGW5VnglfZ
 SWukGhanivr0yS2bUZSlLxM/rTHUjXxQnn4JzwOJACXI/zX1GFmdsOvlduCwPMNdY31kJw7YCjh
 vfXNiTgI/LKgMJJYOy2zcOVav4Ptfqny43h5qK1JetPj53TmMxJYztgsfpwkxaN1eeiuxR2OUua
 j0w8EqkI5buiDNj6BzIK81dBGAGracRb8plCmM6fD3O4n9w5MoCr0NA01uV2gibXEIwZm8w==
X-Received: by 2002:a05:693c:20d4:10b0:366:2893:7421 with SMTP id
 5a478bee46e88-369d971fde2mr509576eec.10.1792705906384; 
 Thu, 22 Oct 2026 14:51:46 -0700 (PDT)
X-Received: by 2002:a05:693c:20d4:10b0:366:2893:7421 with SMTP id
 5a478bee46e88-369d971fde2mr509528eec.10.1792705905753; 
 Thu, 22 Oct 2026 14:51:45 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9dac9casm620905eec.15.2026.10.22.14.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:51:45 -0700 (PDT)
Message-ID: <26ad3377-c85f-4132-a129-7b41d6cad0e4@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:51:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] MAINTAINERS: cover riscv GDB XML files
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-16-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-16-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nYsK7Dt4KytZc0yYh5ZtHWBRI0qbmj-X
X-Proofpoint-ORIG-GUID: nYsK7Dt4KytZc0yYh5ZtHWBRI0qbmj-X
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6ada8573 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=pL10aHdrbxYHfr8ulbEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX/ki2TxkQJbs1
 m41No7u19qe3r3NixT4QgPysdUoEkuBL5VEaiHuzG3ejIGUffk5n3CTB4Rf87TXs66n6l6hMUNA
 mNhcfavR8k3dR2IM0xXRQeckSqarHb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX0NKuAsEQX9F0
 QJlRt/C8ewc614J4KDz5XVvTLc4dpLbHGkPxGPGbFUAtaSgzcyOM+8vt26BXDiaTbUiuucL65B5
 SiZf5YyBzpwPB6Z/vFauh/ZiIYR17c1EERdaxQ4EfaY2MOBAKshw9e7+H2xnf5ewmvR8D5dVPkE
 JbUeidLJeLnYsLO2Xx7BAWjTi8zyr+z7Xc6SFU6Qz0PbOPiFPULa8DKNsjfDaVgWpHU5uC4dNWX
 QFFKEka1zw5glDGsPdFAWOWufL0aw6Q06Y1JnlbcHNY+OvlEKYiT4L0NPWrMgI5xQ0A153gWwJ2
 m9qssha0AIOzxtu1/zxWF2WGf8VZaGsv4Z/C8AsEeWukbIwotp87oli778HNA2TN3cW3d2DGgTY
 ST0L+W1plzC4rmLyMNC40r1cSxf6JHPUC3HxYVDMus0acLXugu8T1gGTQ3/7E+X/pdwd7eUO+E+
 Wx/BYjYHoO2v5nchdFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 3:56 AM, Marc-André Lureau wrote:
> Add an entry so changes to these files are routed to the RISC-V
> maintainers.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

