Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E38C982D0
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 21:20:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7JWD-0006NI-1c; Thu, 17 Sep 2026 17:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7JWB-0006Mb-TC
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 17:19:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7JW9-0003zd-E1
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 17:19:43 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HLG3nj2710880
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 21:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 41CBtQm8RyISMbf2T/VaepmCCF8nUxKNUD3OgsCTH4Q=; b=YAu/d6I1oj9O6JZu
 EYQeqZU+Nwn+iT9S2E/vswBtSuut9h2Uf6oZ3zrqKIHXlDueuh0G55Cl4fllDj/3
 8LB3zFFvxDTja5iehZF3d+7mZHpDSpN6utLyHHuX9VKx6Oqaby7v7gUJIvE+KLNo
 7nipT7xs4Jgqkx9oscqcgW6GjpM/fW+kWyWZe7ceEruQZfoB4kLAFMuGYHSrgNYZ
 ei91dXcj2fh1CiU4xnFnSqjOTQNh3y+7jrr4CCPbvvQoELuAMypLj5slRcrK8WAO
 OUFnTmV88FExLD95QNYqWOTGqBTG/OTcuBIUt1lhEAByNAw7ckCrK++n/FdTZRwL
 kmQ59Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97seds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 21:19:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cc4fc935a11so316a12.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789679977; x=1790284777; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=41CBtQm8RyISMbf2T/VaepmCCF8nUxKNUD3OgsCTH4Q=;
 b=WO42t64B7WtTW/U5j/UTnxeOiFMp92RxsMejxqwLWXQzbcteHjpAHuzypgwnymBaKp
 2lDZUZBip480NYpoF8PhS8PJVPkp62WRDHoMfvfx5k9Plabgt3MP9NHNxJiKPwKkLr08
 9LE6kf3116ARBsEur5ROxaCGbXzA9fjaT8VXekm4eeJiHFK1KjCrEHujTVlPYNYW+FiA
 lYIKPLSH9X1wL04AAY+Cy20VZIsMegl2lOBT+oG93IwROe3rua3ugiVXOIE14aDBzPjJ
 HNGUn41xPipa48E/ZAl3uEuHbR0/K5IY3izauD7cG8OYIvQfMBCacTw3wp8TsZMut5NT
 lSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789679977; x=1790284777;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=41CBtQm8RyISMbf2T/VaepmCCF8nUxKNUD3OgsCTH4Q=;
 b=nfkQCfRAEV6JCWeHJoRW8PtvWtEm4BOGhh0jQbRUqOK47pzFHa0W6hnFdalIHzu2Sx
 ano4mAU7Vera8L8JpgCMsLFA2rAfhTJfK3mLgNMT2x8iEmqxvyT7mJ9EL4dXQ/2DCIHb
 0QgJeogVqG2LGsmrs7ws5vjgAP3ni06iQbIySH9lq6TH7dp9YFou+otHmgBg74AHUt6T
 SfVN8Fo2X7OKRlFH9ghzZsjkiAJTpAks4HmZQ2pE7JEbDvbOxyhVzoIZexe8JpJVOOfQ
 bxmsjwiPqU06NjWYS4izwgzjV7tJxTwFafVM6EdQauoOyOZ6jrR2fiCqH0PTTlipsOmb
 opDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBydpJEv5+oO/NYQ6VSGSzUNcnIjfQ0/ZA98ZhWuopiD+Vqy4Muq5JeIdvnCbXwF7YPe2ghJ7Rhb4Q==@nongnu.org
X-Gm-Message-State: AFuF++lCQg6+RRA/l9TqSGoxjccEw8dXCX97ooBEoJx/zo95alP3DM8W
 RUu2O4FHmhqgU/IefXih4ldLeGwnuhz7Sn/K/In1OwP6gp9Grd7rYCV6JSg/RokwXtxGpI3VSaR
 sd/BaydBPXs6CiLYmRmsNn/Jf8yauHJyvfRLC9BBwmGtTGpsraBHn6vo=
X-Gm-Gg: AYBFou1zjnHdRhc9hlwVnDpeAORu7zna6iYHJ2fuy7P9XSm7Zmh0V+O7qShHDvMkQXE
 TB3Q/T4A9lUCGfdaflEny3+7BlrHkN3oNZhvVQSmhcK6PczDuUDuzn+MBfO8xciOjmjbTMLTzOu
 30KLUvxA1dk5jy35I2rhmiDCLKKlwfbLURTnWJe+vfXdhc+hYcdyBUGu76XRSohHcCmEfikXb9r
 42nleuz4ii0/4D4U/eydIgnXRzLkL4H/T3Dl4vOP3S486zWWf2UcSF5HtYliq70tD4YD4RETgN+
 sBWnO//H4OyQG15glO1zQvKdc5ut58TMU7aJCLolNWYZRMVXq/5u65nPxb1tcAjDvCR3W4o/uDH
 6cCrXqXPQQrLzOHBQsH92TGjaIlfeyrbfWwW2j9YT0ZKd2qmyZlolWrZpCaxaPHCWkF4J
X-Received: by 2002:a17:902:d4cb:b0:2d8:d4ce:9f37 with SMTP id
 d9443c01a7336-2ddb1b99598mr8417535ad.21.1789679977356; 
 Thu, 17 Sep 2026 14:19:37 -0700 (PDT)
X-Received: by 2002:a17:902:d4cb:b0:2d8:d4ce:9f37 with SMTP id
 d9443c01a7336-2ddb1b99598mr8417155ad.21.1789679976899; 
 Thu, 17 Sep 2026 14:19:36 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5ac47cfsm16221795eec.17.2026.09.17.14.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 14:19:35 -0700 (PDT)
Message-ID: <a42e8f17-8bdd-4c9b-b465-0428ada507e7@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 14:19:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] tests/docker: strip remaining caching logic from
 docker.py
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
 Kyle Evans <kevans@freebsd.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
 <20260917165602.3405537-12-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260917165602.3405537-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac596c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uYbDg6Ze2NDCcb9HcAEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMwNSBTYWx0ZWRfX/ucOUBkOwzmG
 kdSyq+aNL5HLDrgRHATI6gWdkkK3Prc7o95XzpINXn63hS6wEmoinejgNXfESsjvQmvNYFkOyLp
 qtnK0wJhHKSONBGMSvjqCOatUYWhENwI5DGorc9yQNGAuZIC96XuYD2KBPcP+8wF33qarPhuTHm
 Y/LpC2rukbNmNwwifvyHktdmlKa2vknujbbA3rWpEPS98A8ZhIwVNwrEMQ1rywezL1a4DDSgdD9
 1po3i/29hqJvusY6i/xKFrpX3zW/X0fJsuIvl5f3MCj9qd/qENpx6BsFnUYQq89ofx0Pz9k/ohE
 s8yIVa8kolA5B5wzUu3HHXDE2dfPuvbjQA6pdGv2TduSAb9WC2z7E4gr225KGuME86KN3xYV5SW
 mNljoDtelTfX3/NQ+qepNTx907cQrrtBWMQ4NpyKbbGQYyXYnufpJjEV9maslLPHk9h/+zleVXV
 73Gd2FD+ZbFkppzJyhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMwNSBTYWx0ZWRfX2q5zFjI6mucs
 BWY2eBUOYCCw3UTLRfnDXQBUrrMQTA5Ke8aTVsqzJH+OnBddeLIV9Zh4m6fduJNXdCDAs19d5MP
 FRjyhUtsGMkf1s/jHdQgtNGn4BNdwQw=
X-Proofpoint-ORIG-GUID: ReF5b7nOwIzK486vIDfTYGTAJeA_o332
X-Proofpoint-GUID: ReF5b7nOwIzK486vIDfTYGTAJeA_o332
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170305
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

On 9/17/2026 9:55 AM, Alex Bennée wrote:
> The caching logic was a remnant of an older time when we had multiple
> shared layers building that went into the final image. It was arguable
> that it worked back then but it is definitely not needed now so into
> the bin it goes.
> 
> Tested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 148 ++++++++++++++---------------------------
>  1 file changed, 49 insertions(+), 99 deletions(-)
>

After testing this series, it's not a good idea to include this patch.

It forces a systematic rebuild, even when image is already. This has
three consequences:
- verbosity: we see build log systematically
- slower: running a noop rebuild takes time
- network dependency: docker.py --registry triggers a pull, which fails
if there is no network. It breaks offline make check.
Also, it slows down things too.

So, let's drop this patch and keep the caching mechanism for now, it's
still useful/needed.

Regards,
Pierrick

