Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D143C982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:36:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6sbp-0003ca-5X; Wed, 16 Sep 2026 12:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sbn-0003c5-SK
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:35:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sbm-00078y-4N
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:35:43 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeMZj2432103
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vKE6r3whpvejVv7J1iK6GK5LuX8liJAEidYhPAzBXC4=; b=QMVeOh5tL1Dc6R6j
 PycRX5cJGTudOzOvHkCaWaDt0MH0rU6FZQ6o5gBY4jKmA6BsyVoFr1tjJEgJ0Ys/
 opaTa4gcPhsznMp8Gx+uWhnmOmpf6Se3rUZAv55l6iVdGBqohnS6YmV8lcU8xbmX
 mvNmMjX+Vaa80KWG2CnQHzdDAUBGoESB/Y+IZKsfrV4xkSDW3ErDMM5HTHF2d/OC
 Y0ixvAz2CbsHhAB9z5AaJ0cdcQO0sNJNhdR62AyzKzYDMboXa6VVgcfJUsgck7ej
 dpioVjANElUTo1OrPeUEvXrODjni3nw2XSBy++UbmaKhom/g7sshgRUYm/ND81XK
 OhO3pQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnsagj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:35:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cbb20f82a0eso4672197a12.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789576539; x=1790181339; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vKE6r3whpvejVv7J1iK6GK5LuX8liJAEidYhPAzBXC4=;
 b=DtcS1j8ZM4yOtYV7QuyWj+AZuWntKYodZprfwKKNhCUXzSNr6NEA1j3FK37SMv1lV5
 mmn+Yevf/SeiTar0z4PE2I/q+uy6ujpvSq0rMso6fFpTPcqN1WKaxDE7KAibGrxlQNPa
 5Y0RmuFSet70Qft/1pN+h8HcqYtNe8mkGEdfPm/QazAdKAiyou/Hcj1Hl1YgTc0zOGrW
 urqesTCpp9HWHylXtCSYJGgiY+gNuFfMwgYwUmvVOJI6fSueSdZZwM15zRUS9gqX96vO
 a1GRs3l+mM469XLHekOhwCCSmpP4dNWkzzGlKxF0gWOIdYiXJVLOhp85Kc0ovyRLu0oy
 ltXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576539; x=1790181339;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vKE6r3whpvejVv7J1iK6GK5LuX8liJAEidYhPAzBXC4=;
 b=GvT42UvqFEI0Rav3lHbWGBbjK33Lp14xBAe26tBCXn53gsk4NdrK9nosJGjdui/u/S
 wik7o52GLDkOkLa9EEW5JC9Q+Sr0QzRcYb7l26M7mWG+rrM1OaQxPOGfbHsNTj9Pv9nL
 H/veGEDF4jM4wVmsKdsWlVXrMDe/s+bn0cpEMjn5p6eui5IqlUHrCcl5zbJD1OC/13Id
 gcot7lYboql4dlRtR3GyOtt9h61EOCR3lTF85eK829PLRuEyPcf0iMPlR9y/jt/1zn7C
 X+kDT9gFdAUz+BwaUNmqj4BmDw2S+3l6xf2sBpJwXy8/q97NXsMG5La2DgRbzfQiuKj4
 Q+Ew==
X-Forwarded-Encrypted: i=1;
 AKwUvBy1IJfI06l5wAraXm2z2eDV/DuV9eylWOq+6MNEEdymIKD7DyuhX1BOpnym+uBb+QW9gMRy1qAJ6A==@nongnu.org
X-Gm-Message-State: AFuF++nEQZ8PliVyGobJbalyf98duXE7SJAXWAVU7s7qNsRk0iZv8KnQ
 d3WYm+D8Jx5qrZVO8EpNpUJ/fP/2VFApNLkWT7zvhoNylQnLRNIuBBwYk1jZn2mk+4WztQIx+te
 SAmXhbj5b8IpdtTyF9iVA4HN6klSUFNXjJEiHJ5qFY9FYZTK97GunuWg=
X-Gm-Gg: AYBFou0oP27WECYmOJ4rNJ2ZXXXWnZ8+A4hRluS/Ebz0pfhzbM69Q7zjFck/aNWhvr9
 6wVsmBboZ7cx3AWJcokaw8cQ/7+4POuDebHoSWPfyD2lHPowGWbyItKc6HQyFHMd+SG+8zZXcEX
 wy6G1XeJuCq6vE3R0xyOcfuBN4zlBjR4Jn30H7g0H8J7pA+xe0UHX1tNpD169mDKRhsCT31pC0C
 41wqSLA3EV2ntts82butsN8Kh+nSQToT1ZugtF4UZsLjRNUBy6p0O+3Gq14NYU+INSnqzmZjhkb
 NlIpMPTvghVIU+Cvm/eeTHAaiqCsMUptPE33/6FJrBsdhOSrZfvKkZSow6FNvnep6wfe6ktIfnn
 WmenQl3PDEYa2LdLmq5iqZJuL1MxEoU6REVWRIOYyA8LHodAUYangXBuSrzpg9ydbYbIX
X-Received: by 2002:a17:90a:e18f:b0:39e:1315:a952 with SMTP id
 98e67ed59e1d1-39e1e4deb71mr9277431a91.18.1789576536078; 
 Wed, 16 Sep 2026 09:35:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e18f:b0:39e:1315:a952 with SMTP id
 98e67ed59e1d1-39e1e4deb71mr9277276a91.18.1789576535550; 
 Wed, 16 Sep 2026 09:35:35 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5a6a0c5sm9123329eec.7.2026.09.16.09.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:35:34 -0700 (PDT)
Message-ID: <382bb2d4-f773-479f-98d8-c0073c594881@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:35:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/19] tests/tcg: use --add-current-user when building
 containers
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
 <20260916153013.2134555-9-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JSmaIe_KgSuPnUjU0lxv7k-f-uSXsWKe
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaac55c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pdCF86s5bGdHQuHMJA4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNiBTYWx0ZWRfX+CJ85ZA/p0BJ
 PZzNiUeJ3l5tQL0J7nhHB47RzTBVApYuje0dhQ/3kYM5Ogw/IofoPz6k0IB+RPphxIegQ/uQEC1
 ZM3AO03GCEjI91wDDsOiYZnkYqbLlmvJXPsW7Wnk58PfrvdAdF2JmAGbQBY0skN5DM0nc9WTFti
 eRnSV6H0MKK54ubPsaXJF+ZxmHMWD9OVPh+eWHpqCS1Fm82Byp/Uy5dYtQEEIbkmgw2NB8JGVdX
 5FUDOZeoEuaqLGoiGf8ECcatXmfhpUOr+3DBXHl2OUOgO5RjodclSg+1wG8BM+r/XvaTj6BTF1n
 cv3kcZ2UOiUyO/dD8ATZAv5svq+Rwd4hq4/eyrotQLTLpsS9GehhaVwXTK0o1z7BOdw3zIdGYlG
 Iwqwu3G+OgjzQW6Fzgm0Su6NFjjov604oHDMPYA6Akyj5psdNqP7W+E5LWnldBKJyoWuLNFmDun
 pBuxJw/04r1TLwOQ9iA==
X-Proofpoint-GUID: JSmaIe_KgSuPnUjU0lxv7k-f-uSXsWKe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNiBTYWx0ZWRfX+pPbWv0L49v9
 hwCJdG5F3bujyh5lFmW4tG902Xx80oL4t61J2xpHYqUzwr/FgERDQm/TPaMaqML27PHBp5Ww2JM
 eFsBpQdCKL9RRF+EBvWCmCIIY7xekCU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160226
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

On 9/16/2026 8:30 AM, Alex Bennée wrote:
> As the meson tcg build routes the container builds through docker.py
> we can also clean up its hack which involved appending a RUN line to
> the dockerfile. All the dockerfiles that care will work with the
> --build-arg.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 13 ++++++-------
>  tests/tcg/meson.build  |  3 ++-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

