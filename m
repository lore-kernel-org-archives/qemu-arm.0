Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956DAC982D6
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 17:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Fnd-00065J-1S; Thu, 17 Sep 2026 13:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FnZ-00063X-9S
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:21:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FnV-0005EL-8e
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:21:23 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5abT3437491
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1Iv4MxQTAvQxbo3fv3m1qbw23C92q0bB3zVBKhIyDjI=; b=XmFq/0dEJrSRkQR+
 jixEJlbOJsYUbxvarMzv1T0ACofYWkdClw1Nkuc0ci0d7iIhNUHKYYlAWUiuBpLA
 A/R9E4xXiglLU47BSAIDH80ur+/V28PW5ZFku6bIMYzuSoNpZpaRBXN3uBkSZc2Q
 hCBLF/B4nc/KvId3ac6OcH3/h+6pV/iINLFlx8ruiEBxCL7p0wx9j6SoXAedZVzP
 PePHP1kZ+V4H+2XUUAOflLzjEUH7HSRVVAt+Yn2D4pbDqgrGW3KLY9H7ths45hCV
 /2CM5uFGzE1ZaQ58jpHX81Cq2SWZd3Z9zzzAZ2PQcTdrFG+igT+x5LclKw0eZ2FX
 YZmbHQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6j87n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:21:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cc1b8088202so1181219a12.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789665679; x=1790270479; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1Iv4MxQTAvQxbo3fv3m1qbw23C92q0bB3zVBKhIyDjI=;
 b=PA/QTLZDZUtdvTzkAhF/7B1n38AEmFp8CfV50zQPkgqrtgU/vvAFCfkpBIoDX2KG2n
 D+UeAZ4R/VxatHiv9OPZmjSVVkE5VF99JJItVkYQzL0+f6Wy3er5qtNkmV15OtA6TsPa
 fNKuCJi82hEhGjKp5pUcBpxahYIUD6lyF+L+gOB37nHgVakKmYKe1qk64eRqQv0/Nvp2
 YmJ0stwplOWjm2HaS+zCGdMFQ0avMKRrHnjh/A1Gq7qGo/yZFN9TKffU3kgTutG9qV08
 ZnQtOTJ3UJm+sA5cNw3batzLc1pvp99y6SLK5JohYtbfI/r5+r8BQ7PqTuGQ2stv1+6F
 QjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789665679; x=1790270479;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1Iv4MxQTAvQxbo3fv3m1qbw23C92q0bB3zVBKhIyDjI=;
 b=ri1qxcybsnY/LoGoDajQxyo/gSlyXrgfrwgBFn1jP/r/+IETm/bwxZFA+QhwHB5k0d
 vQ0JS/BaEesFdLms5SeZjRpa2jimPw+JcTTClkgyxesUGWmnvrHrv51wl+BDCdYnNnZA
 6RnO1bZ0jvP4AWhZRzYic1a6cddxxHI6rzxcavVfMP/smScsqNSkBpu3YhTLhrMjrQZm
 AxxVO2x/Ca3aGlfDver3dIC0+PBOoAwIjirEBpCYFNP9Eh6pAARii3tZCLSoAe7uzUke
 sQLt9fqSQ+nEP2egF5H25NtRFitjpDSkQR00rCeW26RThumKfQQIR/H6TwGyWRTcjGJg
 VN4g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxIZGqbQVKfIaC9riItp0yiwSJvVO12UQRsWhnim3HtuavWr47ZS2hg8jRgN2ocMZTxWHibwEhAZw==@nongnu.org
X-Gm-Message-State: AFuF++mSBnziOPY99D0h42tX5nm5oN5TfMHXrxQz9IMzI1JqwTcdf9Ic
 xUx7RTI7QAOVJD/aQR8RV7Qow6fx46cO6dgrNq9EPcaYEvS+wpy/45Ru0zq7B4MqkMCb8hF0w6V
 CEeCsWwNEhn3XUDmwE5Iu6KOqTpu4zMqdlEzVIg75cwcF16t2WhpHlho=
X-Gm-Gg: AYBFou2XnRLsgao6nHAdoVbYMwfK/mkg8VGQtfJlbYf1SYSR3booHiqKeS7Z5PHYm+L
 6iAFjJ4TXSUpPLKDTLRQK+6z//1VDBtSiVRQCRj9XBT8AgPyMDq8XxB0wmxRsBtkeVi7US71Ecc
 FZHoNox3HUQdnLb5F4ZoQ6L3prrasSG3tdHhK3rwFuF3iuNeyW/t/S+M0BIewalSERP89q8TmJ6
 ADSSVX/Jm7Rj9CHwVLZW6vkVNaa8WVg4np51Riz6zTKJvknDVScK6KXjYB0fnR/x1qM2WAn2kOw
 SFhpQhKtsKG5Vo+MczmizhYL3SXrIg9D0aPVoa+eS6ekAStkeVBPxZXf0uo7oTUHoqDlDrMbS88
 fsO/QZy5cdIfbUKCp8zAbuoE//10pOmZOr0fM6q+4Swh/PV/DgazA5Hs8E3Lsd1RxES1O
X-Received: by 2002:a05:6a20:748d:b0:3cc:3d08:da3e with SMTP id
 adf61e73a8af0-3dd5f406668mr15800841637.2.1789665678795; 
 Thu, 17 Sep 2026 10:21:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3cc:3d08:da3e with SMTP id
 adf61e73a8af0-3dd5f406668mr15800779637.2.1789665678219; 
 Thu, 17 Sep 2026 10:21:18 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5aa1e38sm17537990eec.16.2026.09.17.10.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 10:21:17 -0700 (PDT)
Message-ID: <8a2c7971-4cbc-44b5-9e06-cb4040f591b2@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:21:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] tests/docker: fix ccache directory variable
 expansion
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Matthew Rosato
 <mjrosato@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, Brad Smith <brad@comstyle.com>,
 Kyle Evans <kevans@freebsd.org>, Anders Roxell <anders.roxell@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
 <20260917165602.3405537-14-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260917165602.3405537-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EFoBKVnW1wgGKjaLpFGp4DDtCMeHvpqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NyBTYWx0ZWRfX1EQAdu8+p/Pw
 et9wG0QF+J9xjmXpkYaCk2D30+4Chrz8hkt6OZPm5bXXqhBIHS44U2wI1PjGJxoF7aUm4fOSamW
 fzCBBZ1tZOOL8kMTvsP46yGSvV9uFyymV1j9rH9nFzj7yPYtUQLcuaM2vArIos53Lw1VXFZmSMs
 +t5ywxZB+gETsIfXlUnvJ4SGyspjdqZZCFhDiGYkBnCkSh/vQps4mPH4aiNg+pXO+5FGynuvS/C
 Fqlu/vJM+cs/AFWP7jZ8nemZYouH9CvGoM51/2A0gkLSHF0JhpZrquimweJU4velrWIg9N78gjP
 5hLcuE/OETF5G39W57XXjmZuRTdnAN06ikybEuqek+5dwP49iH4EyOhvmR0Ed0eLetYo/z78o/x
 LdRPDKSG20fkmRZVJKQXu5ik1l0CumEa+sDaGnli+ShG4JXYi9YYRIWghJTJj3BB0f11n4SGWD7
 K2BhrIZ9qoFEf/cFsdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NyBTYWx0ZWRfX1Zi/lb46AxtO
 rzUCuNMPvAIRz07/dVKVJcQPz7GLa4WgUHxr1jHo8Chhi7f0nYm1i8pZZFYQyCsXrChKQ0WZlYX
 X7I1merFam9Og4mO9i/uthlzxLA6e1g=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac218f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uQ2xuPkR5V9NITTaJgYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: EFoBKVnW1wgGKjaLpFGp4DDtCMeHvpqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170247
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

On 9/17/2026 9:55 AM, Alex Bennée wrote:
> From: Anders Roxell <anders.roxell@linaro.org>
> 
> DOCKER_QEMU_CCACHE_DIR is missing $() around DOCKER_QEMU_CACHE_DIR, so
> $HOME/.cache/qemu is never created.  podman then fails to mount it:
> 
>   Error: statfs /home/user/.cache/qemu: no such file or directory
> 
> It only works if the directory already exists.  Add the missing $().
> 
> Fixes: 8a1975e4d44b ("tests/docker: expose $HOME/.cache/qemu as docker volume")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Message-ID: <20260915072403.347639-1-anders.roxell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>   - dropped my fix in favour of Anders with a better commit (an he was
>   first)
> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

