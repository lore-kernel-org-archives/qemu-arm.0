Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C47C88E72
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:59:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FSV-0002EJ-Mv; Thu, 17 Sep 2026 12:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FQT-0000Ib-Lc
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:57:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FQQ-0000vv-LH
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:57:33 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HFOr71782949
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 16:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 toBbWOx7NrDzDeck2v2rklbN4CswV7Gw8Gc/VqS/hN8=; b=evA4aauW3LQFs5UW
 us33ceq2+lbACJhsoUjlVLwqZ75MDGoM977bslRKhd7TJiBhnOHB40vf6uZ7QApJ
 M5PBcXIqsDF7MpVUmXRifRpnGWz1M/UEv80pXBJ+q5FXyY816IEd7c5z6PLLcwmV
 TjnbihcZSOMvg12Gl0hW+E+T6zcyJ+gM2kNteBVcj3ysfWJzK0IzUs8nsK/lhxE3
 PW1VKiwqzv/HszZKXOfaRH1gHLkyfaQqgm+Ipyqe7tyyFVquocIN5TdR+YHQV79E
 deFz8pWi0gRv6i61quLHCPT5ZUu1Bf9w1FZFlUEs55N1mqEyBAmuYRFFTN/lsGbf
 leQs1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttregh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 16:57:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cb835525b10so1201687a12.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789664246; x=1790269046; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=toBbWOx7NrDzDeck2v2rklbN4CswV7Gw8Gc/VqS/hN8=;
 b=TAL4CaunhC8/SJ709I0nKW2TOx6HGhKIp+dnL5rbtG3GscPbzUfZtM1/x5ZD0X5oF2
 adijofSj9T7vnA/0A+YTJ5eniXYHWCQ5CSEAf09vnIpd2uA0oAGq9Lp0gj/ZOQNwQ6J1
 qTS2Fzq5OEB0mfP+40XHZzguzZWCMdffI8OxZa2otw/J9Rkq/Y5HlnoDFXDWbTZkrdkD
 AcDgnF4iYEZsKQbp0Ez/ToLVxMkSXTClhFCx/DP+1ULbpuM4qzFAhT1JiWLoP2dQAlfY
 c8YhRcrnClFb8zTS5/wIZVlL4uhB0LsfRSwPI1crsZVBvjEonHtBVyYwk8N1KFBr84PA
 OtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664246; x=1790269046;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=toBbWOx7NrDzDeck2v2rklbN4CswV7Gw8Gc/VqS/hN8=;
 b=PA9v4hQGSGhExJvrEyCpDr03yPfbddrChaDNGu/Vzr3F003Prkyr+iU6GcI72TgkJM
 hXXAn7DVWrht+8qgvSmdkozkVo5jHajNNj8uMy5fYs050QFM/XrEMRUUjksOgl3qq9lP
 r2iE+KwhmY1AVLpeiFsOKTfWwnPXjiVT4YOmBs87nj/Tt1VLYQCwefDlWGjabFYenhgT
 D9jrsyereLVvkLThKcUfq6BwKU4aIRoKixqWrA/TyOE2nDehQUHvZ1rgit0OVZVxfzFA
 17ny5pmyjdMmSkYNvgKV9F9Li2CEzKk9LY7NGAHqVpn3pzlpDEyDjrM0UxXVSt02fWeb
 71Ew==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3dZujTqgR/zsNbgp7FKaP3cvt037MKXGIeyZIBJ8qU/7FGkshKXC0BNuXI/JaeQziZfxh/6PYTA==@nongnu.org
X-Gm-Message-State: AFuF++ltxYFz8DvuPlQ0vE35geSxQTAGuXzem09en4NuXnEUkL8+dGhP
 tFFvR4wl//kAu6QR/zTb6YKsmSuIQI6m2E15fNIsEeJOZUHiYNGszObx9W3yJUcxpgJ0jSiUxRh
 k20QGPeLyj7alY3WstZdU5H1o/4hqqt/ZbF1+5Wu8gPkj4D9CmTwixmg=
X-Gm-Gg: AYBFou0n1Sn7wmXvR4OZubKEuFg40Ty8bdKgckloNbbsC2GBMxbON7YSWZh5E5oaEyD
 T/0u5QRkO5ZwvFS4BIXAXtp7UQWgoYWkZCRMMtgSwm6bhoUTa5q0jVdVU75K8lL0EamkuNW+jSK
 s76OW8YYmEYJ4niONAZS9Y87Q0DQeU5PrTsGVQWnV9DqoP2RfRm6sR2ldy69b0kwSU49+tp9S/D
 7ODDBjQWbWVnDYWSwLJKLRWBtiXQehqurDt9+9gN0E30EQRjzza+VLnyZ3J8hVH1iw5ZRukPTts
 fjVlmvW0Nylnh7JMhuoQv1oweN4fbkpUpBfo5MI8kfBV+9Ufo6mKYlghpAiwOrfAnK6mNk04giC
 9FOwbZRPncwtxL7TUiUzjVQAzxi8isoHmRo7i2gbslXTrEITLXE0b2gcd1Q0ZjYG6B+L/
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51e3 with SMTP id
 adf61e73a8af0-3dd5f702df7mr18429374637.23.1789664246247; 
 Thu, 17 Sep 2026 09:57:26 -0700 (PDT)
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51e3 with SMTP id
 adf61e73a8af0-3dd5f702df7mr18429301637.23.1789664245642; 
 Thu, 17 Sep 2026 09:57:25 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33c19424994sm2863968eec.12.2026.09.17.09.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 09:57:24 -0700 (PDT)
Message-ID: <aa77a1cf-2a20-495f-a881-60dfbf9d6a77@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 09:57:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/19] Revert "tests/tcg/meson.build: implement
 ./configure -cross-cc-* options"
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
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
 <20260916153013.2134555-3-alex.bennee@linaro.org>
 <65a743c6-54ae-4e2c-ae4d-08e1d6f87ef3@oss.qualcomm.com>
 <87wlsk6mec.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87wlsk6mec.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MSBTYWx0ZWRfXwvgB/PYc7dIQ
 gX+5yr2X3hx32D8xYrUGp80BRpyH5X5ETOVw5MoaLVmYwyvQia3P+mngqvHsSK+a6CpLlCSJ8Ys
 8dqpYFOJyoj1Ger7qg7xrcYtLCSgSoLxFtfqvHizyupBXmhM6443eW0TUU4BchCARvfOZyxTqeB
 43AANRDeLz+PfOS8C6F5/xXDLpvIjdDgi+LIalzhzXiWNpvP8Y4Yoc+XT+8XJnGJa/Akhz/74zg
 yQcOdSlT0+HU9sP0ckKBvvXDM3oNsByjQgO11H77g4+tJoT4Al/mknyPg8rDCx95WI6+zkOAZSu
 hOIe/cvQqQnjYytjxqkZzmKsnK3IDBzL7niU4eg+2R1BRZGoDFWtscLcKIDJH7g+JoMudjeK2gw
 iHKbfgRMS5ynmZOQKkEKRVl31t8ueHkE3nX7eImbTluVJ8rkii2oFXiRfHIYd8fL6AK6uCdX2jB
 8A39uM6wNX2z3ZM9czA==
X-Proofpoint-ORIG-GUID: RnVCYUVjXDqQq68_a7x7f74X2oi906q9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MSBTYWx0ZWRfX5TIwXKygkwhO
 loJPCy0lYarn406VBTEiRQLXQbEX8GknbK+Ljq9FELl0xfNQVGDrHJK4FAFhHoZGyYXMpOAvjQ8
 41bryJpjVxhp8RxZVWG+6b0RfShXyX8=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac1bf6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=4LzKZ7EetbkCqzTVYLEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RnVCYUVjXDqQq68_a7x7f74X2oi906q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170241
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

On 9/17/2026 6:24 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 9/16/2026 8:29 AM, Alex Bennée wrote:
>>> We want to keep configuring of the cross compiler within configure so
>>> it can be used by the firmware.
>>>
>>
>> Would that be possible to add in command message that it disable effect
>> of those options for tcg-tests?
> 
> I'm wondering if we should revert this at all, or just merge with the
> meson commands (because currently this breaks the MacOS tcg checks)

That's what I mentioned a few times indeed.

I think it would be better to keep those options, so everything works as
expected, and just merge back with config.mak generation.

Yes, it means we pass information from configure step to meson, but I
don't see the problem. Also, we'll need to pass this information anyway
if we want to integrate build for vdso in meson directly.

>>
>>> This reverts commit 7e1d54da6faf10e1fc70f6b3d8247068b80b1597.
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> ---
>>> v3
>>>   - declare empty container_command/use_containers to avoid unref var
>>> ---
>>>  configure             | 31 ++++++++-------
>>>  meson_options.txt     | 89 -------------------------------------------
>>>  tests/tcg/meson.build | 31 +++------------
>>>  3 files changed, 23 insertions(+), 128 deletions(-)
>>>
>>
>> For the rest,
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>
>> Regards,
>> Pierrick
> 


