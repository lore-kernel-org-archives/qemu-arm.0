Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173FCC982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6sjH-0005xy-2T; Wed, 16 Sep 2026 12:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sjA-0005x5-Fb
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:43:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sj8-0008Or-8z
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:43:19 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeKvo3107258
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0vLkoUqwyYu1mWTAmOFcQvFy95P30owLf+rcyRX429M=; b=YsH1Onu/loJsGXjc
 c9PGGwRLQQImMDzCZKQ6/KXmDAQ4tNM4L2YFR9nSq89As1XxA1jnz5ch57JCvx9O
 44S5O5XSj/bkAHGPGyOWfNDVEwQDBloKe4SLNJWf1udXt6r+AbMvJGLOR/i2cEPc
 D2Q9awKjoBeCc3urtsA+EfkdJ+pCpXrc6OX9aX6zNrHElxODvFqkPMQg0JI2o8uK
 9ZrkJ89kOHgQTvZnfjKFXHpMSvMV2gJ/5Uwyyyv96RWPKe/tXzS0xS/oUggqulKl
 +3q+3kLMZUn5hRUkxqIQ//eauzwwm5nG4N+dwyNxgmNQiKOh/fu5iEAj2R1gVc9H
 dV4yCQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2ry52-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:43:16 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-448d51840c4so6259162fac.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789576996; x=1790181796; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0vLkoUqwyYu1mWTAmOFcQvFy95P30owLf+rcyRX429M=;
 b=cEaEOFQr38u9uhErSm0/5Ubr3Ikc4w1dWeuom71eZV4ZOBeuZuJooZCXWfQuQhCbJL
 +Zey50jXbCrZT6lceKKjgEUWCbJmwYZPowR2fRLW+n7so/7arDXZhtihAu3P7seVf2GK
 PBqtU83FZxekgJz0U4IMHewG/WSwRzSsbebWmWvAU19MK1uK8S1dQJbS5ge3RWiFksS7
 m6TK+lwzUelN01CgT/cC+6o4STLrpjtFsdB2l2cukdgZFbQiPmd9zR+KQqvxXaVYAaG/
 0zihse+e0lOfxBzc4Lq58jpF3R9n5zCCFjm0eCxJRhYJy16DZB4xZIUfJ0pC+EzeH0ty
 y76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576996; x=1790181796;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0vLkoUqwyYu1mWTAmOFcQvFy95P30owLf+rcyRX429M=;
 b=QXG7GIoNPcGUHy5G+Rv7UYh60yQi0biaI+3hOLgBDwF+wRg5g6EQhbv1msKenWYkxJ
 rYsC+9ccV9egJ6TcCx2+eK5mWoimUGWXCLYCzDiqYjVj5Di5FrCsurqFkLUpABZxA9WO
 EQzYy9GBmR5fC3zlk4A/xvNW430nqRohh18E0CeaTfn0xsPvVgehmyxUW5GDhEmL8xvA
 BfTy4OdWLHQtmp3F74BW+LQDAXFXml5tzKvusWCk4w46Wj5t2C/VwdmfQA/Y8jDQyFq6
 KdUerL/PIa5OX+ktB5lI/KZX446ud3CXffEj8N/7g3UzGwUaDKkbnh0SyADf0dBjSk/V
 FlyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIv8V1WHxMPGozRAy1kKQWaPX9hTqltXkxOFu7PTIhsmmcyeHavOcrRnWqv9BvRNtvveRANBzBDA==@nongnu.org
X-Gm-Message-State: AFuF++l9ZKgA5S+kPWntj/8U9Te6Dsw343hN1On1U5JYR02cNuV3Q8r5
 /7n6XDDQN/IweQ6OtPixpW9lmTBKuEX4XmCx89kAbvcyQgtiIqXDHXZrMqcTaoboJIy8q3MLN4+
 +KNtROBhkCEahTwdjJgCI4Hnmi7/C5GkmP1pgYWc66o6vqAyiBMQjjUs=
X-Gm-Gg: AYBFou2Nzrm4/8RK4Zwx7vgcDkDU8CwiUJGmdKxBgrZwG3zzjATDzmdQgiXI19RkvcE
 4DS9oE36wmFmv7FZ7TOfmqind/TrEI+Eecy4pLe3CKAfSk/2plro4K422dit7aZJDkR1RDC/+bh
 dzj97wgbbmNUEpG7+ZJ/1atDwQAa1Taw07Ilati/xwlQVQ6p0cDxb5407DaN5rT3ONpYvvvZj+2
 vxeaowDvY/YZT5l7uhyvY92yFgpgj/58b4ChWenodzH8h7FvzaLZqn6LQvP2Iv7npr/Q2sJRQlf
 kZz3r0oWdUHs6oWbakE4+9/RRb/rnBJ6DVgS3KioR3k30vkTs/gYTfgrma2V1u4aWY7p/3o4/y7
 S88Ga1Wev2Rr02bZF0qVtcZFQ/w35V3Z/dwUhgSZdaRc4uRJsXHflNyYLJDKs3bsu0sHg
X-Received: by 2002:a05:6808:1794:b0:4b9:e5fa:8a18 with SMTP id
 5614622812f47-4ca4c08823fmr3616389b6e.29.1789576995806; 
 Wed, 16 Sep 2026 09:43:15 -0700 (PDT)
X-Received: by 2002:a05:6808:1794:b0:4b9:e5fa:8a18 with SMTP id
 5614622812f47-4ca4c08823fmr3616323b6e.29.1789576995272; 
 Wed, 16 Sep 2026 09:43:15 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14395d5d0f3sm7614612c88.12.2026.09.16.09.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:43:14 -0700 (PDT)
Message-ID: <a6db6d72-f486-42db-91ed-62535a2a853e@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:43:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] tests/docker: fix brown bag typo for
 docker-ccache
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Brad Smith <brad@comstyle.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
 <20260916153013.2134555-16-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyOCBTYWx0ZWRfX3QeehlqGwFjO
 idCVnfwtzsscOdHZFq1O8uWtYf3m7i6LbGQHyFi/tTucucq9QZYFZt04Iui0WGLrCuuYlFEGC1j
 OKmDqZSeh0z/9NHw9Y/bi3IIo0p+ePk=
X-Proofpoint-GUID: V7Iz50GUWqBhIv20poaW8WisGlTPOOb2
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaac724 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WZqvsksMJLZDJWRi-WEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=h1q6ZXiXV6sA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V7Iz50GUWqBhIv20poaW8WisGlTPOOb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyOCBTYWx0ZWRfX4Ryo0kMDmpKo
 7koL3pmrHrHOrwIbSsMngkLndcdb4iBHLWA8GizBNG0EaQwJEHVRo6AaUwfCkPMjNcof/koKyhC
 1MpmaSu/euLiLpLmd4IrSlZfE5PibCm8fK06ZwJwrw28Ax9h5Oty0QzR8DYALmG1MtxjOvoS2ER
 vESr7MPrRLL3JYBVsgjZH4hKLjIPe81vohXag7IUhfFMTITvAcTfzbJkmshiGuH8+NK49lLoHQ+
 VNvrY3s2a0z1kcVQy/seXUriC3C/yR8IxsOz06AlmXCpoxRwBTntsmTsKA7IY6aomMpmJ3l/iz7
 N8jaxQQDpU+gOtFYxboJ3D+9IdeEYdBZa3k0LmCm2zI/eL+e9jdoDBueKdISLc8v+H9zDzVBQQ0
 keoCzrHwOICyJG3wGzcmybRjZKEshRFcPL/4qT3ffvfsM/XGOhDBeri5cF639gALJ700YOCJScl
 1CU6tTw0yNki9EeYO6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160228
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/16/2026 8:30 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

