Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B0AC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:00:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6966-0002bU-Cm; Mon, 14 Sep 2026 11:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6964-0002Xt-5J
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 11:59:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6962-0004Mq-Cx
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 11:59:55 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68ED0RLk607537
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 15:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OEVU+s/ANi0pfiDYyw6mCYFSEMHOGygt4XdxroZO6Qc=; b=jJfxJHZlvQMmVBWh
 +/bo8A/a6ZG42vM4u4BLLMXNwSDGpanWtQB7B48jrHz7ioz1yH5/yi2Gm1d4oIz1
 6p0xq1H3L4Cbw7QcfnH6BU/bAkx/eOYEVoqgRECgl3QDV8SsIchcqml/HngA06+O
 WhheK3Qo9mN8IcDGSYDHt+RSSG4JTCozoiCHl2um6ALgHtM+guHp6lEPqANn1LyY
 OU6QnC/+2j3qT4IIfCXS/uyy95btPHu9tXp9QCRStEtlnE8wmYUBmk+ridkxBl9Y
 En/FUL6Tb6nI/HYyns/a1hK5K35VkDD6P3uPxAWdiVERFhQRvsPsdrRtldHvtPoh
 Ft/xkg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2ks2xn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 15:59:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3968bb86fb7so4138355a91.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789401591; x=1790006391; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OEVU+s/ANi0pfiDYyw6mCYFSEMHOGygt4XdxroZO6Qc=;
 b=GaQ29fuz9fdHwmELpKrybb8M8wZO+r8uElb3Q5y6YK4mFmE4wFspPuQnuSS+YSQrXC
 /z9fk1rzsJD+ea9xGxZsqy2WjxZ2tOJYunzyRfhJVo6AyXOTXlng0T1egBjjGPVt2m1B
 3HMEOHXr0hZfokaSvPZ/BCrr3rWId62jYZrQZW31em7/qgGcKB0LXh7kPylqy4ITl1qY
 NL3Jc9t4SE36BENhQv6NXr602zFveFsPb81qLCfsoGFvroNHR/YvBGhxyryj2nyG+GzD
 zN7HOzHmWGr7V5B8yIqVvYWG+D6f/244DidfiJtMcuAWvryXcddjjKJxu0vx7QUrQLvp
 Qs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401591; x=1790006391;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OEVU+s/ANi0pfiDYyw6mCYFSEMHOGygt4XdxroZO6Qc=;
 b=BYzDZFLZuaNYlQ9aZcAViSqZheTRsBziH2ASna9KLsOVALgAmUosfi+EHB8YK2piei
 6o+E3kLcMIdnu0VDxDkGOMW8BpfFk7BdNiAVMP1vNqDFEShE5YCsLNH1VqHisEVc0GgB
 9glXHD9Trt7KZ7GkmQTo1pvmRLPgH/c+uyJEufWIh7fbCs9CdvA6oCAcf5uU912mHnlq
 hK3XnV8Ok61Sc0XZiiqbn79NlZquL+Vr0LrCLTSVEghKGABSKb/ykNLCzZ8PCB8zTYCE
 G726DW3Nro25DV8DeD48SYjIlrktkEOlz+lXc+tdGepvK+zO7SnA9br1It+j3VwCU3/+
 yqRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxflG7/AI2x1O7lO9u9/frtenkNmm74DM29GX/9BH0Az1+qoMCAxEQMzGXde7ff8GeDptvZQx2U3A==@nongnu.org
X-Gm-Message-State: AFuF++mnw52ztnwIYxcCdkVhZNuyTitONgwzej7m+RIGcFlNm2f0BobU
 WyskBRHhz59C5Jc0vTEKqmp6qpA9vTcw/SZQRPWQqTMjS31B50UWsSWc1rKS+JJ32C0gmrOR1n8
 g0EXs0qzQi859G1tump/y8VNPj3v2WXH7LKfm5dDW4mizGeYYV/L1nsA=
X-Gm-Gg: AYBFou0jwFI098joFbpoSyDuJ2EKoWfwoq9GQekmWN9OVfX5QOSZr/U6AF26p+YtSyQ
 v/G793dfynvdWeFmD7qu9XkWwLnpD+VgOJZqHt7VK6XH9x0HEGI7eVCKqo/g5CqyOe1lmPQwRnS
 o5AtsHeDrRjGRV52niFnQDTClWMX0qnif9EW0JFii0rIj9jAE7xbjUdHAYBH7dAeANhzf1Ykrwm
 RVq0w946h5fMeIfzlgyK99t8nUiL6YWF0H+clIqOps2Q/pZivlqbLLG8RausCklBit79caN3oJq
 PpoZZiBxo7vr1AasxqJz4qBd+KU48LT6ArE11ZuI+zK2TpSJyv3j4wjkaiv+Vm7sAlb/6m340Um
 MVhc3h6wx/rVeVPKiX9TpPRPjYWS9X+27rQR9Yaw/5GP0/kwG9AoB8Oqrjx1SE/DK3PnT
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-39debf89013mr6584124a91.3.1789401590937; 
 Mon, 14 Sep 2026 08:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-39debf89013mr6584057a91.3.1789401590507; 
 Mon, 14 Sep 2026 08:59:50 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b78d59sm24351415c88.8.2026.09.14.08.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 08:59:49 -0700 (PDT)
Message-ID: <7384499a-9162-4413-b9ed-0195ef21b109@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 08:59:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] tests/tcg: use --add-current-user when building
 containers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
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
 <20260910181504.1010916-5-alex.bennee@linaro.org>
 <78b4bda8-02cc-40b3-b9aa-137069a54811@oss.qualcomm.com>
 <87wlso1ede.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87wlso1ede.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H2gROdqC3euLVxUBFYbSIIBS0pyEX0wn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyOSBTYWx0ZWRfXxlB+f1E6S9n4
 gzPMTK6gvV8dDGxOCNzw4e5mhTU5aup/OtVzg72dBEd9vugzS/SfAaQvl5Gdu8isQ82porESBjm
 PU0luP7MoRGvyEbcsgYXxFIfPdhYYoSSn76dZ8lxsbOCLc30Gc01/djsVf142OYbd/H32jbH2II
 CfdUH0a7uZnY6odp06kWHWFIuf8cLGWtAt7bqaJ6d6Vx5+SkX6VwbXuXqshpBB2ef7LgQYbAsoA
 R0YmKptt4NO0oFx1uDQPbozxOVnq5FiuynKt4s1Ukzo6OzseK2eANPCmeDGDYg/v9aGWPzfph0L
 AU7hdXp/LGLUsv16WxDxuTfvcAYEDnibpU+hUf8EiL7T8MTV+X3z2ancqBB1HojFWqZIGMiND/g
 uGnKxeQcHRrQUELLOY82pBam40YyscExmwVikvRFjTm0Sf6/bGQ2MTQ+VcCxytOmB66Ac0ai/Tj
 0z46PTtP8O72i3sDGiw==
X-Proofpoint-GUID: H2gROdqC3euLVxUBFYbSIIBS0pyEX0wn
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa819f7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=10l49cbnMznCkJnTuZEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyOSBTYWx0ZWRfXxhyZOqHyRiXh
 Npo+1XHC5HKVsRtERjQjS+VxFTeurLk5hNhQSZJ1IyUzODMBGzx4oE8b96pkQGDJQaTa9kSZPtF
 aw3AquRlYZSlazMzc38SbsfTcySVPlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140229
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

On 9/14/2026 12:27 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 9/10/26 11:14 AM, Alex Bennée wrote:
>>> As the meson tcg build routes the container builds through docker.py
>>> we can also clean up its hack which involved appending a RUN line to
>>> the dockerfile. All the dockerfiles that care will work with the
>>> --build-arg.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   tests/docker/docker.py | 13 ++++++-------
>>>   tests/tcg/meson.build  |  3 ++-
>>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>
>> I'm not sure why this was added in the first place.
>> Technically, running the container with a specific uid (whether or not
>> a user is declared for it) is enough. The only errors you can have is
>> if some specific commands ran expect to check if user exist on the
>> machine, like sudo for instance.
>> For our need (cross compilation), it's not needed, as a compiler will
>> never check who is $USER. Files written will still have the correct
>> uid on host fs anyway.
> 
> That's why you do the mapping. Before I was seeing a whole bunch of the
> test files with a random group ownership.
>

I was talking about the adduser part in the container themselves.
Mapping users with container run -u is needed, but having a matching
user is not strictly needed.

>>
>> Do you have more info on this?
>>
>> Regards,
>> Pierrick
> 


