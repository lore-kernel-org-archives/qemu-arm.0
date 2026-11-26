Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77763606A321
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nLMnagva;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIJcTmYX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWbbL-0003Cv-Hs; Thu, 26 Nov 2026 10:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWbbJ-0003Br-Mg
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 10:41:33 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWbbH-0001xh-DQ
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 10:41:33 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQEVa0k3144150
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IQ85ilLmMN0r86RviriAxcHemBHLrPTeGe2iVuPQyMM=; b=nLMnagvaDP2JCvyb
 Lp+OH7tBzAs+gg94hVQ8OQJQJx1k+5fdcmoeyiJXP4hWTmrIHX+cP3qtj/c0w5gB
 J8gnUhI5Qn6YncKXacF5DDcxAFrE2d03+ekl/vuzn5RH1TSUCp3XQu+GAKvIkvFg
 gi7B4zdBaT9HXPqBL4QHIqz8CwkVvQyxbIpfCgPVntXbsV9zUQ6X906CCpO0dcu1
 W4uvUiFZC8gSWZhgHLrAaUba9DYr2UKZjPUGUWkPFIv0aUjsS//Kp/k9xoYX7Qxl
 Mio5QlafUKlbTsZOHGZMAzRUMSwxaiGUvdNGNzsK95URE6/lNz5/cZIBkM2ps8oh
 LcrVBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahw11v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:41:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso791927385a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795707689; x=1796312489; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IQ85ilLmMN0r86RviriAxcHemBHLrPTeGe2iVuPQyMM=;
 b=HIJcTmYXdh38ETnv/mJkaCbaTKHUHfmEl5ph4b1bCs4JnjelcgbHpbg5daTl9/EMjb
 VtwgJvnMvts0WLPpMTNXHsi7OZVuL2De8kBVKXkI5LDyPTL8RXBpoLhgM3WxM4T9WRMH
 Dkb3VZ+whFKWV8/93oGuw0yQK0fgz8C811ep4bsdCBfeJ15y8fHVqNI0mrsIcaXpqx44
 WNMbjZRMeBJh56aYRij3PUm3lOkEdzclnVGshQJ6E2pBhzFtjSsLQmdiXNcPMp35qREH
 n9pYFRUxbIZah4hZVg6fvmya6onHAKfErEsu3TZVTdHYjATo9qgVylzZp8+TWQEaa8U9
 D9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795707689; x=1796312489;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IQ85ilLmMN0r86RviriAxcHemBHLrPTeGe2iVuPQyMM=;
 b=FXpqXzF5UXY9+1CPtTK2S/ckc+D2XPbzhORDgm7XK4JjBmLoWcyuLx3PRN8Y/Ug8Y+
 /rfL/SPOMBG0S6LGH2LynfwbpK1YSlhUBGYHGOCzcbOTYXe42O9+KHcMGMB25CxOxbDf
 YZlZ/3qQA5wMU9M8PHXLPTLfpZqKUiEPwbYRKNxzl7dHvHfuu09xoAAW85KKq2Y81fL0
 VnAhjCLutHPx8/UM4m0nEGrAnSagyDRzHBhNtW78qugBGbK3ep6bR7eMNrAl6z0BhlV0
 8i/dNAV844wto63T9ilbKfgcCrZLX739aGyocJu1ODaX/AKM23DMDqraTPPbJe8aHsXJ
 uXpg==
X-Forwarded-Encrypted: i=1;
 AL+hErGXcHN7n+fci9Nzvaj99roXZHqo2MwqN440CpYFfaFB1u9P/MwyJ2Qt3dMw3yTJ9gBIx0YgLzGDdg==@nongnu.org
X-Gm-Message-State: APuU4Z8+MoBHBvHedjWgYr+Km6/vdwGZ0Ygb1KKZ/vKMjiRd3k2XrUJs
 xXMcVqLel5oaLDrhW2Y4EaMuoxux6hWlFMJ5F4uBsiaXINKn9upmiuVjBpblxvu8Gv3y5Mh2RSW
 8tYJyEItoY1Y3SX699TAKaHXS3VjahL3DDdUI1dv6EWBKJQp+FRutAww=
X-Gm-Gg: AZFdTZfgZtW0wE6c+/9711bgdXBPZQzrLefz7J/KTqmqjaY9FGm0jgEhSY9aBtQzmS9
 Psyd4GU1GC18U2NlewIilu8n+pRCJlmjJ3pf9aQMBKXvWl1UHAExiKM8P+nVWZQSOS5GtrHN0Pg
 SB4vELVS00jTOnVTbwkhKBzNsl+W0ZwXD+IBfThVcmAn5Gah3WHH/ZYIcV6AsD0r2YFKCvZZu0k
 gN+vLa6BXnqZvD3fMfzt/+tJdkixcaxLC5e5n1G1HmODsfwQ2F4qjYU88tzUIttLTicQFjTygCX
 30f/WXDJE2yBET6XWgS3ndpvoIRYmHDL7Brf+tT9o5EEWNVeI6keQmNboOpPtNQLt2K1+ve/ABZ
 OitkRrHpYaXA0tgLrymwqF1GahTx/CGym/VtY75uygkTH8fuhpca3h+63pkiSMsdJR9310T0RLl
 WbG8tzkns=
X-Received: by 2002:a05:620a:17a2:b0:947:a247:6afb with SMTP id
 af79cd13be357-949ba965b28mr3889351485a.13.1795707688693; 
 Thu, 26 Nov 2026 07:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:947:a247:6afb with SMTP id
 af79cd13be357-949ba965b28mr3889343785a.13.1795707688221; 
 Thu, 26 Nov 2026 07:41:28 -0800 (PST)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm957744665e9.14.2026.11.26.07.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 07:41:27 -0800 (PST)
Message-ID: <aba99506-a519-49dc-93e7-1e45c904349d@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:41:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] MAINTAINERS: update Daniel's entries to be consistent
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
 <20261126143607.2374676-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261126143607.2374676-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IyjupB03QrpHJaouzQhUJqHnVXTQ-lMZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX47LdFwQ5DE28
 M7VfqjdDiFyLrMOLHUw3Yt8zUirJXgoAONQoL+3CMLRqi48ZWR0YPuPgCekAhPn7DobdwHI4NPo
 eio59KDM7czgyKFEmUOg+o2u4TG05Jo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX24O1GiSmPyKH
 4+hDrzo4WEfWB15EAHMluvwk47E9kbbDDNA694VZcU6h5DMmZkKYBs9raclBnMXTBwWP186jen/
 IXzOH8+codfY0bSB8hOWcu/DzSbpU/3KBdnc8dMVdKx/Cy407R8hnUeKbDvw6lGbjHgf/ZqEOIX
 GVLMcW4als2W0fOGm1xd93A90kl5M8VQp6pqKuNJuuFIZAYopOzFLnTdUWldFkqIekFv9KAtINd
 XTKm9OF5iM1NHzVjsK/pnqqgYR85UvdcNvPrQPl9esnSw8XWUSyt/+lKndmoxbfOLPFsvRjQB5c
 o+xBtcUToPbAZspuOtMrirR9kQwYJ4lit1HGZmxakA0fkvGWubQ3o0dnx/vRU5W6X3IQV8LUS5W
 +/7otDtyQInPoL00Mgy8X4cvdYelz/WsjPpKW4HsGypNpMKgaF8HlqHc2wKovIAMEuHrxib7+UX
 SGqi4H7JVYa4oSzhcRg==
X-Proofpoint-ORIG-GUID: IyjupB03QrpHJaouzQhUJqHnVXTQ-lMZ
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b085329 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f45CAlVN0ESyyzyWPnoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260061
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/11/26 15:36, Alex BennÃ©e wrote:
> When testing my get_maintainers.py I was shocked to see:
> 
>    ➜  ./scripts/get_maintainer.py --list-absent-maintainers-since "2 years ago"
>    Maintainer              Last Seen   Email(s)                        Subsystems
>    ------------------------------------------------------------------------------
>    ...
>    Daniel P. Berrange      2024-06-10  berrange@redhat.com             QOM, QDev, Seccomp, Cryptography, Buffers, I/O Channels, User authorization, Sockets, File monitor, Functional testing framework, Build system architecture, Meson, GIT submodules
> 
> Which is of course incorrect but tripped up by the fact we have been
> utf-8 clean for some time. There are some entries that are correct so
> fix up the rest in solidarity with my fellow utf-8 using hackers ;-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-ID: <20261120182200.789086-1-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

