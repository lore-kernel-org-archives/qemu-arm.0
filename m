Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C948CD6E55
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 16:45:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU5kl-0004TT-TF; Mon, 01 Jun 2026 12:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wU5ki-0004Sc-UP
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 12:44:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wU5kg-0008Tn-7U
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 12:44:36 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 651FkCEC3372678
 for <qemu-arm@nongnu.org>; Mon, 1 Jun 2026 16:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UjLBKhKszmocnYPvikfKApl6WGTIDb8J6CUq8j9GVDY=; b=b8KuHSh2J3Mt+gcT
 EPAGv/I+TcgLVDOlA2Lu5rUdPsj3bVJWEXwCVR9v1ZIl15COismJhgkAayibX4ia
 JRkK3VDoaPgCLxbF/dD+PGhtljOKhUG10aPBuIF0xNEHoD6+BOwwQtB/AyrlLMOW
 qij0zgWr1Hx3MgPIrOoevJIjDZJKRHM711ACqPUD5Rm95OsoSzgdtUc+rf1wms5B
 uXvqUMPJl/kGPzartYz9hmBL5pacoaiRxr+HG5NziHYWSaeehjrnVo4RiSuIhyk1
 d7B/ousVmXFWd+qXz+4fShmkDXheoA6jBNW7JwLKP19vF9z5Rgn1jBPPvET4Y4Jn
 2RAU+A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh9tdg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 16:44:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304e3e3fba5so16046565eec.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780332271; x=1780937071; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UjLBKhKszmocnYPvikfKApl6WGTIDb8J6CUq8j9GVDY=;
 b=Y5Ru90lQ71DT2bhuKNXs+Vi4e/vwknQXOxXUCMpakN+GT2+5Op+Yf86WJOCbvo8RIZ
 f9F3QMY5mBscggLnU9LjEtKSt0edx54hMHBdCq8oikaYiO6iGyAqdsIVgY+5d9XCkLOk
 mLZJvJpe7kBEajK34PZv5+deqozf1inROV/DRP5t/G8KyrcyChxcXyU51agqAvYofGzb
 goneS7SRejCKu/5PvyrOtY5KVOkGCO81LeRXi2dmpPcgKDoXFtvnlYvcVPE/auMZ5sfQ
 7VyGTPJnhy/eSj7VkE4yo7vZPlKtsUjFi8h/n4eB4rpjtdDnU0Zcvi3dMk19j7Wiaumh
 fISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780332271; x=1780937071;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UjLBKhKszmocnYPvikfKApl6WGTIDb8J6CUq8j9GVDY=;
 b=jeZ0eDG0PX6M1zvFzzsooG/HS/o7JP3PFX/QULDPocHFhZ1LvLojFdZ4TJNWcpwhxk
 vv7brooxpQGQ0UFS9hiX5t/MDBw0kuA19H24iP/8h1tPqNGpvEhAFoG5JIzIP8YE6Q1b
 /etZXZHio7rt6g/susZWi4sW31qhX99HdfQarAFQ/TndFA/mRoFJIdUlmUmFrqbT9q51
 tfpPTAaKE968vc32NxkN24xPmnZbBCfT1HfuGWrMVyLYKIaB7wRpd2D7L1UjB6Qp9kVs
 lOqi7hIKRv8rcyOsukzN4IP+870HulWgNV2sgm0H49739HkFZ/JyM+JgBgmx82LIzisn
 /cSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FsWOyRs3LDm/QMBUnNT/InC9rIVlXDeDTlfMt+q2gHzP5cfmIlMdr2zS9ccLwEpcL6t/XaekuJA==@nongnu.org
X-Gm-Message-State: AOJu0YwqXJYtwK27bVjwcYBnEYRRGDk3cUJ3rYT5zpl9+o/pC4qQz9s9
 RuerlKs/je0u822CMXx53nrJMOMpCvTq5lGlOWlFr/89903YhVZB09q19+Gz92e95TuqJxqv6tH
 kc2rDpgy3Ik3MoyjHkHghS4ie84CAZUtfS+CbaL0JC8YsTvOsy95Rjro=
X-Gm-Gg: Acq92OGfxF737jpkGYvPWrCQ1fVEHVK4o1CIQq7VUkuX7DkC+H4IpoN8BU+mYa0lYdr
 Dcceqdgdxw6u5s+ZaE+8Lyw5a9k2VaGAvuz4Q3Eyzce96x+07nzuvGmy7mwp4jF18NReMXsC5QS
 eVAimlgCcpWX/WE6fewnIW6MW8Om9O76Eq+t6fMZKVAQz6kez7+b3dJoHTWmDkJ+W14klpa6YRp
 CwyEU8xjzn1ItzEhl2qimt2xcFkVgntNYn9Gp0ZvHRyLrE3jj5wvrprU8fx7c9Ys84qYZU+U71C
 9b0kuTyg+i6GvJz3aLJpL1fod0rHQmOgZLD52c/C3aFg8ESdmGizNdgo308Wf4KXnacaO6i83n0
 IogOlTBg18qKNU3EtTag+5+VGX84NJ4Sz3boxlfwVjqDujoJj7YPbZF5C4gD5APVvakhDJVTEQm
 PmbDN71aVFOLTRuwZ5D1OJSDKt
X-Received: by 2002:a05:7022:252c:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-137d4271b93mr5583091c88.19.1780332271424; 
 Mon, 01 Jun 2026 09:44:31 -0700 (PDT)
X-Received: by 2002:a05:7022:252c:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-137d4271b93mr5583076c88.19.1780332270886; 
 Mon, 01 Jun 2026 09:44:30 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137dc179940sm4861576c88.5.2026.06.01.09.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 09:44:30 -0700 (PDT)
Message-ID: <22a283dc-38a5-44f5-b402-c334205e81cc@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:44:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gitlab: work around the inability to build targets
 for MacOS
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Cornelia Huck <cohuck@redhat.com>
References: <20260601143129.144786-1-alex.bennee@linaro.org>
 <20260601143129.144786-3-alex.bennee@linaro.org>
 <57d0477a-3bbd-4948-8e18-33df41991545@oss.qualcomm.com>
 <87bjduxmne.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87bjduxmne.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XiPxuGLH2dmJ9b6d-l3qUe9Rexd10yTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2NiBTYWx0ZWRfX7XhzI1MqM+mC
 59i41BV5gCd/Cis/vgvKrstjM/vRBXDoFonHyo0h/LSVswDtLRC6+I6wIY30QMdwEnw3rUBoGEk
 3c3H/UZDCpoYTz+XO0vXwoJXZ/awiLhnKB5SS2AJXhcsqCWbhhN2ON5x/idc3bnhcAzv6ikN3eL
 RzmQuEg39GN2wlOM5eyHn7oHqPBwJQrO8+VuJTbBcbFByq64xG66h7jJ0hkQj9VDJ96Z/UYIv3I
 /3xmtjJIwOjeQhdK11COfvjZqoHO5ndLW6xhMEBTW3vUcAq+G3vhexW1fiQbqhAOrb8EWfydkda
 RkGITfXcOXIzEFytROrK1LglKGZ56Fa0lMW3YkjoOyZNBlz81+Sp6MBC+YHLPhKe0+Wn6PbpoD3
 2JwUPdRWTnClnbYL/6cqgHseN27iKjEt3Tk4nzvCh8oHLmyC1sdMd1aF//V8KiGcgqMgBOE7XNy
 Mw9NQ6jgMiaZJ+t6l7w==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1db6f0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=RvC67grr7DDNViFLJkwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XiPxuGLH2dmJ9b6d-l3qUe9Rexd10yTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010166
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

On 6/1/2026 9:15 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 6/1/2026 7:31 AM, Alex Bennée wrote:
>>> Unfortunately a previous fix to ensure .ninja-goals was set for the
>>> TCG tests broken the ability to run check-functional-FOO. As we have
>>> now reverted we need a solution for the MacOS gitlab run. The simplest
>>> is to add an explicit make invocation to build the signed binaries
>>> before we run the tests.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  .gitlab-ci.d/macos.yml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
>>> index f61750a3f4a..8366b4ad564 100644
>>> --- a/.gitlab-ci.d/macos.yml
>>> +++ b/.gitlab-ci.d/macos.yml
>>> @@ -29,6 +29,7 @@
>>>      - cd build
>>>      - ../configure --enable-werror $CONFIGURE_ARGS || { cat config.log meson-logs/meson-log.txt; exit 1; }
>>>      - $MAKE -j$(sysctl -n hw.ncpu)
>>> +    - for TARGET in $TEST_BINARIES ; do $MAKE $TARGET ; done
>>>      - for TARGET in $TEST_TARGETS ; do $MAKE $TARGET ; done
>>>  
>>>  aarch64-macos-15-build:
>>> @@ -44,6 +45,7 @@ aarch64-macos-15-build:
>>>          --cross-prefix-i386=i686-elf-
>>>          --cross-prefix-x86_64=x86_64-elf-
>>>          --disable-plugins
>>> +    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x86_64
>>>      TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
>>>  
>>>  aarch64-macos-26-build:
>>> @@ -60,4 +62,5 @@ aarch64-macos-26-build:
>>>          --cross-prefix-i386=i686-elf-
>>>          --cross-prefix-x86_64=x86_64-elf-
>>>          --disable-plugins
>>> +    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x86_64
>>>      TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
>>
>> Could make all be enough?
> 
> No - not without the goal having the signed binaries in them.
>

Which comes back to my initial (unanswered question), why do we need
signed binaries for running tcg tests?
Signed is only for HVF access.

>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> 


