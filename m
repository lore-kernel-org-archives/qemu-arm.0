Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E922EC88E50
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 05:11:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5yy6-0004gg-LM; Mon, 14 Sep 2026 01:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5yy4-0004gL-De
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:11:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5yy2-0007Rm-KJ
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:11:00 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68E2esx23865328
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UX4LYCGXXBDEOblF2QNLoUMBC0b7FDyOTu9yY9joyxQ=; b=fX2+e6NCNWGa8Xkb
 vbIDlGS53hnWdEGyLebhg1cmztmqcN2Ah+7QrNxzw6fEJLqKYzSp6bJUCD2mE5YC
 fYuAsO1Qzk7YE/4zRy4tqR1JaZfdnJhPnOsfuVndqUCdAkhtaABr22fjybKovBtn
 ycyJqqfH925Sc9XNW3M+9fFlOF74SvRM2s5DfDWooDGaI+jB2kvy4bPoCASdmrND
 UqXq5C8NniHpsYjSzp36Lye4SMe2m11MJTFhQ23KIVHyYXlwtK9eL4dh3nNulJ/h
 yKN+G+IrcpgSym2pOg5JHLZBp+zqOuBZBk4n3AaNFgwEpDYwNT1iJZM6SSd9NU0Q
 hIMQag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dn5qa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:10:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-86a880e91f0so5055354b3a.2
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 22:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789362656; x=1789967456; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UX4LYCGXXBDEOblF2QNLoUMBC0b7FDyOTu9yY9joyxQ=;
 b=AzXERh+zQVyQb+NYhGYOqEYSRsiVwDV86TbijybE1dmcPmxXGfRDor7FmK9OBe5Em5
 /4gH5k00w5gJmQI9EFGaWR6Sf8P3GXnLf0Ts0aVpP6ZIFSkJsTS0+Qv8aNeuH1T19PxZ
 sI2hlRsA9V06uet8AuCkdV9hsAEsR7bwTT6I8zf7NuWGy0Aqm9w0AKQor44lNTGBdRrM
 jgNmEVrNXKTloWpDSwKOP0wDiIRyO3Q9BU9azR8L/RHs4BRKdDZUVT5WFzcB7PVBojdc
 8ayOWLxIMbSvA9IvIYLbA3Zp/d6OYa20WQWQzsUy69rgEL+WHM9oTd4gfYE2P4p9gdzh
 gYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789362656; x=1789967456;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UX4LYCGXXBDEOblF2QNLoUMBC0b7FDyOTu9yY9joyxQ=;
 b=OCp1B4KXVNrMWPpq7X1m6wxeTZpee+eLpLvaw0rNZkcoul4yqsk7mL8DbcH5Nt0Yr9
 ixGrIL0vAINAD5YbVCOQjhpwAbTJAQ+x/PgMNeHAgLL5gn073EfVUhHDafygRfNVRmD/
 vv+yy5mvDYsLDHCrXJecj4vonAtCV2nF8K7jS6OTMovVVcAm88fTTRFnQzbsyZGbF/wC
 KBbGcg5Jcfoug+Gc/jp/XxdBR5RMlF2eiw2zhC0npePd2sygsWXVTo1HvKaEWtGbAm5/
 g3rlhNvE1qdTlhWkixBpSTtab8UNpUeY3pRZ2J/ty+gt14fTaVrqexfiTcb2VJmWF7qy
 hl8w==
X-Forwarded-Encrypted: i=1;
 AKwUvByWZXOS/cIge3czQJAE+W7gzTP1YcQbZ7JYfQKYJO6JmZc+FgGPLkZh2eFNeVE+/XAjMKC+puDjVQ==@nongnu.org
X-Gm-Message-State: AFuF++kvGLNmp422GMzujtD6gwOw4uhhmwYdBhUlhhpZ01Rsvh9j15WU
 NR7gpGqwDIMn0sSjvDr4JHwwKzllbaWzbmmSqbdcouW2rZm1/xaU/OT3kGnQwJDnrVcwcrk9RNc
 3YltZIXqZ9MflT8LqJznxefFZRIvyCUQibgekz8ySJM7qIZhAqs5AR9iJaXnuCbc=
X-Gm-Gg: AYBFou0ObErzuvoZr7yFYBDSDzVMjxkKIm2WWUJ8CnkgGZzNsj4/CflO0My2bzHNI5y
 7pRSkPUMKQ2zz6JWNatMuU22PWPLgebiDFAu1YGxRhkVYLhU9vc8vUUcTZ9VfatU0iIVWKW+OMy
 Cz0jCbQymxWlvU2t9oF+O9raEmqSunkAvhdFopP0eFAr9tc6IOZMP7chrh1RT2u5Knt48tII9AI
 6uj39VLIEdKtqEIKhWOxwUxQxfyVesikWn/RgJcLqGbXChal+ONZdI3dnVsQkldMrWlI5wOAe6S
 eo23nGxFg0wj2H3vUmF9Ft2+7caKtRqLlWaMMubNWSmKpxQT1x+YGAt1pFuB2b7y7E33ExzsJ3w
 Z3EME1j8rFjYNs8H0wVs7xAyypfjZjr36iLBjphJ3VLImpB5UuVZdruA=
X-Received: by 2002:a05:6a00:148a:b0:86b:472a:e84e with SMTP id
 d2e1a72fcca58-86f857f02c9mr2131187b3a.20.1789362655987; 
 Sun, 13 Sep 2026 22:10:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:148a:b0:86b:472a:e84e with SMTP id
 d2e1a72fcca58-86f857f02c9mr2131143b3a.20.1789362655571; 
 Sun, 13 Sep 2026 22:10:55 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-86b287c06d9sm3989402b3a.15.2026.09.13.22.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 22:10:54 -0700 (PDT)
Message-ID: <b232415d-ac0a-43a3-be24-0e5ad6184aad@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 22:10:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] tests/tcg: prefix meson built docker tags with qemu/
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
 <20260910181504.1010916-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260910181504.1010916-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA3MCBTYWx0ZWRfX/54054HfNicR
 KxMbtbyngI+LBMdg20TE/YdcFPkCIun3ZK+dvQU1QViELEZ4zpQvrHopNRZ1AIgg9lHLmvBOj+q
 YKY42aSJRsR9P3k+W64HcmDzPQC6dv6l2C37SOT303WysIXSjXpRXQrJgJJeFZJJmqdD5BeSqTS
 kA9JZ9KIRLXbDAXtjLHsWEFlYZK+YdA60mIu1r6bhlFatBWLV3PgasSZK3wRxSb92nOfQxtVIA6
 px1fXH35HeIju6U5HVIfstE6jPXltXQXCP1tY82ftEJKOsqKDrfhyG84QTFRjRWGGkk8drPO/m7
 1yPawT0wR8Yr0w8vjHeA4ku1XafTBQIbq4TJACnSnvbHd1GNS7WhBkLcBIyYJAa4scpWWlxblFw
 D21RBeG2/CFqxShMUyKplO5zvup5iIGK2hD1t6PGOt1Bf8rpAIT4KYE4N9FxQZ7zkgnetnseEhO
 jZuvzLN0RQ8ILYod88g==
X-Proofpoint-ORIG-GUID: IZs0_OHiUkWrZh0CogpT10UVzDQkqcgW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA3MCBTYWx0ZWRfX5aQMGxltCwb1
 O7GtFHBZkh5x066aqbbR3nvrgI9iNEQigQIExj3fQlMAHfFJDsvHgt+vYA5g5PK9yy4ZnJbQNsC
 1CRztbCb8mqUvxV17oejXA4tBTi72fI=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa781e0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9om_HFOkNinMv-LYcsYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IZs0_OHiUkWrZh0CogpT10UVzDQkqcgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140070
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/10/26 11:14 AM, Alex Bennée wrote:
> With the meson changes we now build the images directly by calling
> docker.py. However the Makefile.include builds prefix all the images
> with qemu/:
> 
>    # General rule for building docker images.
>    docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>              $(call quiet-command,			\
>                    DOCKER_BUILDKIT=1 $(CONTAINER_COMMAND) build \
>                    $(if $(DOCKER_V),,--quiet)		\
>                    $(if $(NOCACHE),--no-cache,		\
>                            $(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
>                    --build-arg BUILDKIT_INLINE_CACHE=1 	\
>                    $(if $(NOUSER),,			\
>                            --build-arg USER=$(USER)	\
>                            --build-arg UID=$(UID))		\
>                    -t qemu/$* - < $< $(if $(DOCKER_V),,> /dev/null),\
>                    "BUILD", $*)
> 
> So to ensure we don't end up building every container twice make sure
> the naming conventions line up.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/meson.build | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

