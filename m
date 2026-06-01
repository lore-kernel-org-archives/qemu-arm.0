Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FCBCD5BD1
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 15:57:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU51N-0001AU-9c; Mon, 01 Jun 2026 11:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wU51M-0001A9-Fu
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 11:57:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wU51K-0007EW-Ti
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 11:57:44 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 651FcXuo3372731
 for <qemu-arm@nongnu.org>; Mon, 1 Jun 2026 15:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9cDZSJ9dTrRmv9VDWZAn+u1fInfyAb4ZDnWqQn7IVmA=; b=o+d6z+AIU8Jrvjo/
 BrA5lk72FUjz4PWBo8z0b4llS6jaObY4+eVE2CJlC94swxhbxoUGD6yIXdGvitqD
 mXzCsz0UV7UgDwKI5Xc+/kQM2zWypyXadrdLLgpJEqpc/d296IbM0F0lo3iLoiua
 JEkmW5Cmwg96056AgfI3n3SV5GcoIe5nyzmK3/WJRaTmJXZ/ntJVfLsbdN/LGIGt
 MTdD2MHclusSzWMiP+AghhGnGG/O5xIvxrd+m1ZhHBYLyu0gm9AnvhpVWZhVBBqc
 AI0C8N6Mo+VAb4mXVAiWzuflJLwfX8KLxd8Aaf9kFuIS6ZESUx5Y3F4COqHGyUWT
 Xl47DA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh9kq1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 15:57:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-137d003cf09so3910069c88.1
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780329460; x=1780934260; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9cDZSJ9dTrRmv9VDWZAn+u1fInfyAb4ZDnWqQn7IVmA=;
 b=UrZR1fVKwj5mRVEEPN4KhIHeHxmI/VtcNaDwj/kQ5nwNyqIRrHtBtqgPl8GgrG5uCs
 O4ZHb6zDzgEsX3Zg6/kQUGj104CPgy1pCyrctqPILZO3cSJvi2plh4Zt1K+4Io7Wyd4N
 b96Jj8YlGqzAzBOrFBu01x5T22MawTJsCvys25sAKzHzG2ZpymgM7fL6v2Y1HeCwzCC7
 xg1QjGRLR78Z5FWhJmJuiRnPOOsHhJBkEIG9o1LnS4S0wl+po2+OCqYa4RoozeHCP/kg
 HE5E33oXauRdJexUitB9RJj1wRBNj6GYywhJTC5SUcvOEGZg6vNbdMvcJUbOP9v9/QjP
 cQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780329460; x=1780934260;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9cDZSJ9dTrRmv9VDWZAn+u1fInfyAb4ZDnWqQn7IVmA=;
 b=sh0xxYglAJgE23e7pZR2Y3BQ27DK9sqg4Y8fW/xsLBXLt/nLKRvohY8AI32+TfaDhl
 TYZtYKarwOkBIfqlox9ImmHqkAPrnb1OLJ4o289vXMhXULozEaaVhN9sfKG2/QCVhgx4
 9O54liuQZndSrjbwK7bcMZqMvkOr4Rg407j8Zdad3No30UJdV9LUW0Y6Oa4kAVYQAzz0
 fkpzHHxLfqJiT78SW8//VYXctidQdW6sm6Hk4unIM1E2NEFkqGNz1U+kc4xTU8a0t8YQ
 Oywu8WiqV94iaZts2cgLP+Ams5fGOP+1tR7eFLBeatQUESKaaxNo2Jj5JAHsJbeocor1
 PEyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/y+FwVlVFtStQ/oNVDBlT3EnHG1KaQw/kNiRVaA3FODT0GBB2oOZCupKxGUleRc+HkQ2Ib/91ow==@nongnu.org
X-Gm-Message-State: AOJu0YyrhEWxP+TgZkmPYgXu4ahsFhx4i+RVIc08gLhkF20OJmN3i11J
 iA44KuYGRxUgrF2K9GGyKwxxKEw+2UT0sXC57ascCm0uGypWdvu6S12l19gZBgX0pByfpTxeF38
 k1n/zHa9mnsnFnGrodMlNtBQHAVbJjzpFSEmYXfMBJzpBWdrLG6vO3II=
X-Gm-Gg: Acq92OG5nycAtyyZXt+8kxvm5vD4DuhGVnT4f21ZEB/8xpujyN1MPxlzsrilPycPcSB
 /mzMnxa/ehZnkcT9isX8fe/xGkfa/sUZORlDA/DF+2mF7vyWU/oyHU2ZWhRoKNKKNp4QzmtAyfo
 iJNqoEu+cToBY4Er3RLmJSze+RnwCtYeFB9hW4/AaVYANNoP6WbUo3zd44kxoCLdj0/PloHjMvu
 n/wgxBJ1TNM4gzuzzvM50EEPr58rQFr7Ag3LZ2jjsSIJxB8lE7gPnoIfxnP3cLes90ANh83PBSu
 34TrsHM5kX42bg70SJN715irQh+icxoLB9VjDyMP6Aa0th5sra5kajFw6z9VPEia0ldloXsTrWY
 AM/EVqhoY5gV+7qBnJtVewyunxdcTnLccDqqWYfCmj+nuFR/WQ+BdZPh84nUeeHtHXZSxhZT5qK
 xFFrsFKRHNIJk4gOBtP7deAZ0j
X-Received: by 2002:a05:7022:30a:b0:12d:de3e:86aa with SMTP id
 a92af1059eb24-137d4296155mr5238370c88.40.1780329459797; 
 Mon, 01 Jun 2026 08:57:39 -0700 (PDT)
X-Received: by 2002:a05:7022:30a:b0:12d:de3e:86aa with SMTP id
 a92af1059eb24-137d4296155mr5238339c88.40.1780329459210; 
 Mon, 01 Jun 2026 08:57:39 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b3c7e94asm7100179c88.13.2026.06.01.08.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 08:57:38 -0700 (PDT)
Message-ID: <51668799-53cf-46f6-a352-7e02d8085a76@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:57:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "Makefile: include tests/Makefile.include
 before ninja calculation"
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Cornelia Huck <cohuck@redhat.com>
References: <20260601143129.144786-1-alex.bennee@linaro.org>
 <20260601143129.144786-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260601143129.144786-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RF0BgjHfsL-ib9cU8L90uaZyldS-pV6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1OSBTYWx0ZWRfXxGSAOpzrjAup
 cVhqDHcVyBnLUqJMBsSa/NE+O3lvKsiBeCnDAaXtSxldgi7wd77DFB0lBaxuu05be91Z3RGMB69
 1cg50zeqHwNPQY8f7weQW17ze93C8/ZaluqsKVdXpZRa41r87ZPEQJnZ9HVqtER7ywBVAf75Sbl
 fEao5Uz5AmtVom30bP2m+nebLPTh0XErIMWJMt2yfQX4w1kPlhSkq4Qm7I6GstJLpwbMzrRDFIn
 +83nt5G16LoeLc1r8A9rB66pqgC4J4zG5SUdD8FsuN74FnSb8BqpR9Z8epOShdEEWR9jGA9MIft
 Lx/J5svpyY+i1AGgsXJfh85Tcs4D/SKc422TTIVfN0sNn3H7YjTMguLycVtWM/1xXP9+Ley7gzM
 8tX4eq/Qlshl4cc5ZZf2Uv0525izevmenGpYJNxGvpL0JKHl1b2LmSiMjniwEQu7e5pt2/0pImW
 BrjIxuN/mX0T5NoP9yA==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dabf4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5-n7ZR_I3QXVyKP58NQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RF0BgjHfsL-ib9cU8L90uaZyldS-pV6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010159
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

On 6/1/2026 7:31 AM, Alex Bennée wrote:
> This reverts commit fd63125b9089610d63a53c11ff2fda6b53a2265d which
> broke the ability to run the check-functional-FOO series of tests.
> 
> We will need to try something else for the MacOS builds.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 829c51e364c..54547a37b1a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -45,8 +45,6 @@ include config-host.mak
>  include Makefile.prereqs
>  Makefile.prereqs: config-host.mak
>  
> -include $(SRC_PATH)/tests/Makefile.include
> -
>  # 0. ensure the build tree is okay
>  
>  # Check that we're not trying to do an out-of-tree build from
> @@ -182,6 +180,8 @@ endif # config-host.mak does not exist
>  
>  SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
>  
> +include $(SRC_PATH)/tests/Makefile.include
> +
>  all: recurse-all
>  
>  SUBDIR_RULES=$(foreach t, all clean distclean, $(addsuffix /$(t), $(SUBDIRS)))

Maybe regression can be fixed by moving step 4. at the end of Makefile,
as suggested on the original thread.

But current reverts works also:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


