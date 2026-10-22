Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA05D606A319
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3ryEues;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0yPLKiq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJzeG-0006wR-OF; Thu, 22 Oct 2026 16:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJzeF-0006ur-8U
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 16:44:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJzeC-0000q5-82
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 16:44:26 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MHtYHY409005
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 20:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eBEKfmZRDhlq8Y49pCHVPMYTSYoUPTvliYVtdrrvHOQ=; b=Y3ryEuesn34OeogN
 O5Glr9y6OCjXEeONpBugJLJKMemj4Jgy1cSuZzZAAnrv5ueLb1NOSkTP1609LprF
 jKtA5eqIWj2Yf6ZJkAgFEi8vCt8wIMmRBuChwKWSFZA2uElYunMjsSaiSjy9VR7F
 DfY6LSGjCkMl0zPXnpxHxYA6MXb9sJ2gcMnyJKJ0AypgpXty6umsKso/3+gPntp/
 hAEWlPteY0qh0rR7cHuC2gtixSerxMrlSt2tC9HR/tqzcQ4IlLlJ/TPxLpAIYWi/
 7espNHtQapTDz0xZDCqvLhk4rnwCJukPrasWuJQHLPy3uE8tGvlMN0HB7QyBNqGt
 qLy+zw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a5euf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 20:44:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3552883bd19so672884eec.1
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792701862; x=1793306662; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eBEKfmZRDhlq8Y49pCHVPMYTSYoUPTvliYVtdrrvHOQ=;
 b=F0yPLKiqSge3bVCO0EOy2wj0LXXO8Pk0lNi+4jc5TiC7OVpbtm2KIwqTgDR+TsOoXx
 /NUSEBEfo8qX0HnWvuB585iVajlkda8+3sy0cQYTJSMVfQCtdO+T3I2YQwg6Hum9Hor7
 PF1w3S1eMO6c9+7uf4ArpAN6qElEei9iKGu+lRtU4MN/EGagjQmkfjbiuWk5NpCwfuXI
 6IqOgwHKcHa2/YXSkyQBj6aIPvJUl79yuPzPRc26wVYR1MT2MJQDGoQNxaDGumPnUJKB
 8guakFyXaZFJLeQSFnfFaNE4Rz2UGyV1ELESgH52nEjjfW3JoGuIgwI3Vpgv56Cbr/Wp
 y4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792701862; x=1793306662;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eBEKfmZRDhlq8Y49pCHVPMYTSYoUPTvliYVtdrrvHOQ=;
 b=txiEGmJaoLAY/yW8pK+oCekiZp/Ij8XIlKrC9KKlRwv/wqQT1NJ4oQezWD+P4dW9cq
 Uh+1oA2Cc7vXcQThSUZeDByhuKxhKkNllBoe8JSq1h/15tllXR+oFu/6tn1LFvCiOB31
 iHZJ8EbYzMnOxv13kBuaqADW7vgmcpQuL3yfsVIQFiDiBj41YjDuJUpLIe+Yb9gQRLxU
 wu2QoqCdf+1n1yaTYXv4tm2DCCtsNWYgdbQW9s4/kRSvKPoSNEhDpnNJLEHHZNsEhsEp
 6pDKbk4p6ki7GTVeN2Bg25o7NicVsJeJ0V0n2P5ctIRs8aB2tSJiVXTY/zbRUC+Ho3rq
 kqrg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw3RHRQMJFd6r1wl0JQVCuX0PAC9N+KToxQ46ZH7o+D5HoCs/bRQijDCZmsrkaDC5Y0IbrNSkNSvA==@nongnu.org
X-Gm-Message-State: AFq9FYKQykMnSk/+vIaoLqrxg0tlbBSz7rbOGq3FmYezN214QooKXg8T
 GXqAc5f5/GCSywU5HhDKmcz3qBkkimml/YGpT0r321VvWQDWbBL5D1zHWAd0WwQ5YmfgrlZbGfw
 x7DkX15XCQ9O9r+Rb48b6pYF2SfpyOMEQsZML1MDYEYzca6epOU/jO4c=
X-Gm-Gg: AYBFou34ZHVBTeSvM/Lu8gfPQLw3/NaldYSWrw4kAbHvWCKav0sxvW6cxGn2NeyoGSw
 9eE41O+Gc1mE3H028QjpS5Q7l72kZtVO9W82dX15TiVTtV60OH7ZSfj5gnNE7Z/wS73YCUCDpr0
 juEbdYLtJB1XRGSIpzERoTv/i9CRaov1JQYvMR3kte7CZamluuLc0SMUQpvTTQpHS7tLsk4PepN
 9R2Hhg0ONOfWP6zVZgZihA4EQFq0dMh+hkUONIkJDV5E3Qq0LCpHqjKxbY+sTNAzLC0aM/dgcdZ
 DZG6iMyHet2sou9P6Q9dgfEO/MKO3YU/RcoTsXN5bj8RaP1qUrq/I2VZqLm8mhaYpyCc7rMz1z7
 /zQxA0pknX+5ZEIZRIyl7/scLrpD+h/qZsd/oZh102mlyJ5JZ5vB/w0VhKGE0COZ2Dt6n1A==
X-Received: by 2002:a05:7300:4f1b:b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-369d97e838amr313645eec.26.1792701861326; 
 Thu, 22 Oct 2026 13:44:21 -0700 (PDT)
X-Received: by 2002:a05:7300:4f1b:b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-369d97e838amr313584eec.26.1792701860617; 
 Thu, 22 Oct 2026 13:44:20 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9c145ddsm407428eec.1.2026.10.22.13.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 13:44:20 -0700 (PDT)
Message-ID: <035966b0-1999-40dd-9c85-abc313a93d80@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:44:17 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] MAINTAINERS: cover x86 GDB XML files
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
 <20261022-query-reg-v3-5-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-5-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MiBTYWx0ZWRfX3Rc3X3AxrI+/
 kzRsHoYeqXHR/ojbR2Nmz/ZznyxyIVvnLOIaZLZtFrf6QG+MiLE0cd5R6LjAm69kkQnLYhZbTOl
 AuSr0lZKLhkV+JVEVjFvPmKxgT4sTBndkjJWfyjBf+1Rnyb2nXLsiV5N4RjchWP/vBCYYvRdxVL
 lR7R1gGhb58hDfHG8QHLlzrYK71Q21ah6MznQpkdbpPH1ZDNVacLK7ztQTOe0Q0AztRQU2SGBg3
 uKfwI4hVuDMTGyGseGqFUx3/VK2a3mdKqO36bQM3HbnpgU7ZxfOKwiIwWWte7YZGVXJnSD9n8ZH
 P0E0Kc56mI+vYaYA/Sg5cedTfTgxbLTsGT8zaMw5DEy8KG6Wbfp4tAjDSuwqK0PBoGiWSLclPpB
 y8dFmbmXnhRMwBCiHasKV1rDhtaISL36ww9d5nbVuFF7eE2Tjft7TGznWmoE73uPVL/fGaBNu6E
 KqmJ3zdjx81Qyh/e9XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MiBTYWx0ZWRfX4RlSI11ALvwR
 wOevyoHEkPrj+8ZsgpA40uS8+RLuHUAHRNYSEtqsKtZ8YA//iHyVcxKCkrIHXhVCl1Anw81o770
 uGjlNpXTmdvwLFj5S/jnG1zGz7R6I5Y=
X-Proofpoint-GUID: S9KHfTBq3nUCqHA20JlxwpPW4ZBzIWbe
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada75a6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=WhzuZZbzbfkQEceezbMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: S9KHfTBq3nUCqHA20JlxwpPW4ZBzIWbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220082
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
> Add entries so changes to these files are routed to the X86
> maintainers.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

