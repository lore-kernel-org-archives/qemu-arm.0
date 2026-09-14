Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F65C88E50
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 05:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5z9K-00079z-IH; Mon, 14 Sep 2026 01:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5z93-00070H-Vq
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:22:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5z92-00016s-8r
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:22:21 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68E2eVS63453911
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1KcY80vIH3+qRva290soJZ9fVzqxRjAbZLponmCsgJ8=; b=MvmYMe7qBAirMLq4
 HXpHiRtQz19nTO2gYlT+d+q5kx4/eJ9SSx3jEAblvQnRBLX6Mgqxh3xrgo/h5eY8
 PqbrmfjVFGpfTcse5WaEePM2xdQr8BNWd+hzcn/OCnXfmIB1vRwMq/BZe1fl9w/f
 7eJOTsgLeRkatCOLlpPfIDlKSUh6kpWfkVxr2LL6e/suM3HsLweo4SjiHft3z82o
 6jXiTSE4O+/qU/TdL+/HUCQKl9cSao+lQVXrwmq/PNZZgjLslMeKSUYPGxTdG7hW
 WRLiLaZpbNkfypzX3XSMjvjlGBTziW/9loyL1fPtRPKtkrLMntMErqknEoujntw6
 5uzplA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c55nq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:22:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2db3b126c9fso35722565ad.0
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789363337; x=1789968137; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1KcY80vIH3+qRva290soJZ9fVzqxRjAbZLponmCsgJ8=;
 b=U5gVLchPWRjxu0XOMeh6v1JhhjEonfcOyPo1JtY47aN0SrTUJOYKt/z4188fXS2d3A
 kYiLp2w+KnBFyp7Tk1qLD7cdVhvlTM4GZhMGKwOgJL1w37ovlKhJm8udUVGbOI5quB/0
 KaWavc/gNgj6iU1t7E/08DK+fKD1sHNM2bBpmary5i6i4WR3GNcoiqrx24STV2Pw+Wgb
 pynXa2xp9OU6ZbKpDdOB3n8KVUb43Dg7u5Awf96DOkcDscE6kzGRqXWrVEvhjsXeVNZZ
 bEbjuEzAvmV9F3psveCrBLJSE1ZWXCLk6+pfcdOhuwjNvWwgm63qujoJD8HrPNyuC9o9
 ItIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789363337; x=1789968137;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1KcY80vIH3+qRva290soJZ9fVzqxRjAbZLponmCsgJ8=;
 b=FS2Uc53LSEgdoSBmfKzWasAFHwk/pLRujJfysYFdRg+9LSPeIiBE8j8QOuu5L2aS7D
 g4gmTsTcOC8t3gqPD671D5e6z+28DiLN3e8D0lPnKRWW7c/NNbDpVDWBLd9H+KXA+TNH
 qHHlU6Y2QF5fz2N16COrFATtJV2pip/gBjhSth+phDQFtuXbn5nrJww3n0zKTqWfKRy9
 mZxnNOFXCdvImFH1OPhB9Zr3ugpil7H6og6HKa+YlQv79lpwfyG2pXaCOmRyclmaPHgq
 +3eAP7wGxK/GDKI7Yd03wwpbj9R46QSR7jl23l3vAMf/mDeGEJ2WMOJZPEfnwKwGJ5PH
 caEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxezZK6Xq14TuuhbE5lwVfL1hAd4pAGgyNnMEBheNEgaS0/pmhU0AAUGCtcP/z0zFN7sLIWbb5H1A==@nongnu.org
X-Gm-Message-State: AFuF++l41ABF60IUJhC/r1SsMTk5rxYOEFwS5jHfqxXdSDisZB4qjx+i
 FZPvtPWSveFmW2duoo21jtLOppNGjabVqBWd1qc/rxJO2ksDwibHS82RdUt8RuZyWET5Wf2qYPF
 s1cUOY1pUu4FZUo1HTG6eJ/eUTGI5Pj9ahICRZScgOz3ObXCypA46dn8=
X-Gm-Gg: AYBFou02I+ZWWyUQ5pRNkOlquYM+GLWVeT67dSjADpOU0dhj5R0lxG9yMjJE6cHUJ6S
 xKDsj8befMbSXNf+NhsLq3gvr/WoySLwXmnMqlEBYQUZKZKqJZ87tg4rKhQ9sPCwYCmT4D9pzVt
 /ufNLlcQA5Y0TXcZtUmk+V6NNECS/5oehZkGt/i6jptZ31SZvuSISsNiXsAEoUJuv8EKqjSwNwf
 aJHjKZyGOAU8+YOIAPe2rITU5i3N/PGcCv/stMOPAzg9nyNyaI5Jy4R8wrjh3NxUjtv9SpWgc5H
 Asr2CxO/blzE8IJgRVNymrCjxc96TAVpgxDXGw6td4E9ais0c3WpTPPZOz2P9ZSFok1+6bySJCD
 SRvKtytwbDBgh5U9UpGOb8EmW8tPCRqBntIhx/Ah8ZW6hi9Hr2nzM8YY=
X-Received: by 2002:a17:902:fc44:b0:2da:e67a:87d4 with SMTP id
 d9443c01a7336-2dd6c75e064mr24498615ad.19.1789363337004; 
 Sun, 13 Sep 2026 22:22:17 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2da:e67a:87d4 with SMTP id
 d9443c01a7336-2dd6c75e064mr24497915ad.19.1789363336566; 
 Sun, 13 Sep 2026 22:22:16 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dd2cff297esm41631815ad.73.2026.09.13.22.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 22:22:16 -0700 (PDT)
Message-ID: <150e7e19-d8b5-4034-afd8-08f50168808e@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 22:22:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] tests/docker: strip remaining caching logic from
 docker.py
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
 <20260910181504.1010916-8-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260910181504.1010916-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DdyOd3HrUmqe299aMkGXidTVOBiffwbP
X-Proofpoint-GUID: DdyOd3HrUmqe299aMkGXidTVOBiffwbP
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa78489 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bzVQIcQu6vZenJM0qbsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA3MyBTYWx0ZWRfX7IcZDrfMFG2f
 AAz7ekJcuxxguWCUNU8/iKhvgzkw8amZ8KE9qeo4c4mXPCFP8CHvUDAYqoAi9d/Q6P5xTCCbtpL
 RZynMXiaaxfH2Ky+kHiHhJ2Crw8bmH9E8YHEVid4LmrXG8KBhYgisRzhSdsWy4+i57T1SFM2JPf
 zy6r/iOMpp9wUksPbpnTK+hHstk6HXnUZJ1lATBe9lzcFmjBewGj4eY1dzvh5hcdowIjrDIArDA
 SiSnSyxEiXEEAS2MOtnc/XURpSidfM6Lwnlbjp0dM++ST75c8JGUvdiPGYdm1TyAhNifoTY6AQ/
 cVlBrZLlLfNwB08IZKB1aL0Y5Jq+8uIqWGn7O1CkIV4H6KN8Gq0BRWv6vU/hfmHghAtHiTu5K2c
 kUzR+wPlpih6WYPXA37Rh2IxvjEuomeYZvoEW73MrT1WkP7mDm860IXhDQnm7CsOPYt7Hgwibfy
 wQMrX5b67po8iWKgjTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA3MyBTYWx0ZWRfXx6IOUtHn177Y
 4f1SB37Ej3AE6hUAxlgHrZAk6Zzaz5Sol05tp1rRojtQ0BcFFsbnr1LrKjGOAqL0FzD9342DBoi
 XhdOl7bKTo7h3FFSRcdztF/THbZim04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140073
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

On 9/10/26 11:15 AM, Alex Bennée wrote:
> The caching logic was a remnant of an older time when we had multiple
> shared layers building that went into the final image. It was arguable
> that it worked back then but it is definitely not needed now so into
> the bin it goes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/docker.py | 148 ++++++++++++++---------------------------
>   1 file changed, 49 insertions(+), 99 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

