Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FBFCD5BB1
	for <qemu-arm@archiver.kernel.org>; Mon, 25 May 2026 15:48:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRXWs-000347-7G; Mon, 25 May 2026 11:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRXVt-0002zJ-8H
 for qemu-arm@nongnu.org; Mon, 25 May 2026 11:47:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRXVq-00062u-Gt
 for qemu-arm@nongnu.org; Mon, 25 May 2026 11:46:45 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64PE9eEu3797218
 for <qemu-arm@nongnu.org>; Mon, 25 May 2026 15:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9fT/d10fWIVU5cSKV6b36qad14JO2NSP8HJ6SWnDI98=; b=oSp7AC1D/fYg759g
 xQJ3AvtkR4eEn+yD7AXGxR/Fa/bA+0Q+Wbt0zoUr6hhCjIZmwz89s5qConOcBhP9
 tO746SpFaGgzrRsdtslqOqc/iNmnW8PloSa9NNgqH4zIXILzSQ93pFimnovAsqv+
 jlbPm5fHMrYzElRNaiTtu+xcOpzesHGuKr0v1mhcngswsbJsim89GqYVCVxt4U59
 3IHAnY8+0yGtiSz+MZMKU3yvo+l2h77q3IvPAcedyLWMZmknM8j6pdbIMHE+8Vba
 j7gL5E2OlRpR1N6QErIO6cGWlLrnL0oH0Cu856FUubhDb/UKiWQwPTU0Nc7zZWQ5
 Keqqjg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqx88ae2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 25 May 2026 15:46:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304950e5901so267289eec.0
 for <qemu-arm@nongnu.org>; Mon, 25 May 2026 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779724000; x=1780328800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9fT/d10fWIVU5cSKV6b36qad14JO2NSP8HJ6SWnDI98=;
 b=f7E+05trEyLGO6Z7BPEvKBZWkZP7xog61VHbQJrVKnyIJeXawnke/2p+E6IVEzUqKm
 2Mw88QUA9jfyONPau3HSu+MzACHebSXi9xgtx5gyacgw5WuSUupryjJ3ll56ei2H1YIm
 pLGbilnfavieR7qeL84YEzmIamjX8KZmzE1rpR6Oet5LfHNvwY/psYx3jjaKSeOmPC0K
 gEiglXwOvPygyO/LrsAWzttqQT4VYm8vbCHji2wcxKjKYvnpByXz1huVJQ7G0U53f/ic
 CWGkHDkWCS2lk3Yg5AJWUjDJ5raV43vbSQkelTh0foV2UV1BhpeRcLysrDHo9k2hTQmd
 67ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779724000; x=1780328800;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fT/d10fWIVU5cSKV6b36qad14JO2NSP8HJ6SWnDI98=;
 b=C9azXEJwx1x8rgUGkK14S1+gyts0kdF5wmX+uRd+nb5Tioi1viXsGiIastAjOGhGPQ
 NZb+7QmJvGO3YEM4bSOj3iaePGBvfwmLtSyzcHEOPL++ohEZAivVEPfQ6fRvuNgNQPPI
 +w8uxHGZBqsdPrNc0V1ihafcFQa51Zg45vOAF/BdX0uiibtZdMyXnZ26ekLQ3lkdnbQF
 BIY6nJvnwMfkvZhFBMEuao5CsYkB3cmB93s0bByNYgwD0L1ImcxfypWYYiSE/5t2MoB6
 fdXxhKUouDwxZgvtA4LhIQQrnj8UOwbMqqy3ufXoXr8hcKp9HCpEmwBpwMlHQPRS05cP
 XmZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ88ZiMq33nZoI5ItB0q2uPnU6r7Is/dOKR7ON1tx6wB6p7eVtQY8wN72Oy32Y+IqoOhHNBNATGHkg==@nongnu.org
X-Gm-Message-State: AOJu0YyWr1Ycy9XIEm9CbGjzaKI3OLc2RMC4BcuMY2N6g4lYd3r+LmwM
 mRf3x+8NmHoiqgwUFWWGbaQxqTJQK3iVSwq/2EDZ3b3nlE8JpsdKuf1S8ZYC2gbZcWksgny6JG4
 etAOA4cg3PQZosV+PdClxGdKpCnJJjNCOzWmviQVrsHGlkCvtMdf9H9Y=
X-Gm-Gg: Acq92OGzSsI7XIz25aAaNunFnxnh2oXBGnW0TT+qm6jeeX0ACydxorTa5ziiaWJD5HE
 PgkrfyzGbVPMg5Ra5/BZ7nVaUAxRI2kTHOBy/ArceaDGESNlNBddX5bXgP7psa/V9TEOAxWareO
 iGTY2osDr/9USG+5PYTrMa4/zBeSX4G9X5RwhG3dLUT3CvdkVTXzP19Am3fWbrxT2ObyVXDMLWx
 zW8Yma2VzTW8dx2NecaDJKW+Ar4fbr3x1VT8SG284T995Lq2wKRoS5N/6o/wHK9BFAitOA3nd0q
 cJ9QZRFyw0LywAo0FxsXqx2CsAA6Mjhq6BrfDyAnQQxyrAbC6noq4Q454xsxlNlUApQpxR6cfb5
 FAsXygZxXPXGIOIxetnd5wPgIVtmgzeANft5UfTJu3HChjqMcC0+zrQBY7rzN50kFFJOfqUXQa9
 8KKI0pfH7kQpLtkNQL2DgDom5B
X-Received: by 2002:a05:7300:7483:b0:2ee:7b2e:8a3e with SMTP id
 5a478bee46e88-304304fbfa4mr8238695eec.1.1779723999681; 
 Mon, 25 May 2026 08:46:39 -0700 (PDT)
X-Received: by 2002:a05:7300:7483:b0:2ee:7b2e:8a3e with SMTP id
 5a478bee46e88-304304fbfa4mr8238672eec.1.1779723999016; 
 Mon, 25 May 2026 08:46:39 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20561sm7447867eec.10.2026.05.25.08.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 08:46:38 -0700 (PDT)
Message-ID: <5bd51a1a-4079-4073-bbd8-f0206a1ad458@oss.qualcomm.com>
Date: Mon, 25 May 2026 08:46:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] tests/Makefile.include: add binary dependency to
 run-tcg-tests-% rules
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-4-alex.bennee@linaro.org>
 <74e8bc86-cd81-43f9-b5cb-7e3de3bcd3d0@oss.qualcomm.com>
 <87tsrzl138.fsf@draig.linaro.org>
 <093614fb-ced1-4b15-b1e1-5da755f87237@oss.qualcomm.com>
 <87cxymec7b.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87cxymec7b.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HITz0Itv c=1 sm=1 tr=0 ts=6a146ee0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7nZTrR_V8b14Mc2b2hcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: HAkoExMp6EM0yj3cdtrWw9zPGNxKeTd2
X-Proofpoint-ORIG-GUID: HAkoExMp6EM0yj3cdtrWw9zPGNxKeTd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE2MCBTYWx0ZWRfX11arec4YSsfA
 e3aIBqauQeSpGRkAwqYaSSK7/3iqNfzdB8NkJm09yMlb7rpeMaTolWbD1tRmwJue+IqwYMS2Fd5
 jUfwE6arUEjYU/81TpBtVjvPy6chC7bEFHTyaD7otpV1vWXLLDpv/grYGuGoCX2VtyCmjeaiLJn
 vW0myM4foxYnpLjeK1qp66ZsyMiBtsaFRYbDn4kwEC/UmMvh62tWaM6QJNLpwuY7tLf8E7d8YGr
 j7S9HuFAHuQtTrIbk57SZZRlhKUznseWzQWgklPgEG3KInjUvQK8KpWEGLw0GQpz/5XparZC93o
 XWIdk7DU9zR9js/H4IHWJWtVJFf2oBCo3EkRvvZJkjminrc0aPkaFx6bIiTxS2H57o9B3YDJtjs
 FBTr/rte+/UK/mwAQsnVerYeAHF5jD6N/w/OzvTHLzCQnASeSah5utFA+8cO0ZtfMBAG3wXwfWa
 9gqt0z7R2ROO5Q8SP7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250160
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

On 5/23/2026 1:56 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 5/22/2026 12:02 PM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 5/21/2026 6:17 AM, Alex Bennée wrote:
>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>> ensure they get built. This is especially important for MacOS which
>>>>> otherwise only builds the unsigned binaries on a normal "make all"
>>>>> run.
>>>>>
>>>>
>>>> I'm not sure to see why it matters. tcg-tests don't make use of hvf, so
>>>> unsigned binaries are plenty for it.
>>>>
>>>> Which other binary is this building that is not built by default?
>>>>
>>>> In general, if something is not included in "all" target, let's make
>>>> sure it's included there (meson.build?) instead of adding a workaround
>>>> here. Not only tests benefit this, but anyone doing a build on a
>>>> platform that might have optional binaries not built by default.
>>>
>>> If you have a suggestion on how to make that work I'm all ears.
>>>
>>
>> I would be happy to help, but I don't understand what the goal is. I
>> have three questions that should help to provide a suggestion.
>>
>> Which exact test command do you run?
> 
> make check-tcg
> 
>>
>> ```
>> Explicitly set the appropriate QEMU binary as a dependency so we can
>> ensure they get built.
>> ```
>> Aren't they built by all?
> 
> Apparently not.
> 
>> It seems to be a dependency, at least for check-tcg:
>> .ninja-goals.check-tcg = all test-plugins
>>
>> ```
>> This is especially important for MacOS which otherwise only builds the
>> unsigned binaries on a normal "make all" run.
>> ```
>> Why do you need signed binaries for testing on MacOS (hvf?)?
> 
> In a previous iteration I made configure spit out the unsigned binaries
> to config-target.mak but the request was to fix the dependencies
> instead.
> 
> It all works on Linux so I'm not sure why MacOS is being so weird
> because the meson emulators target mechanism should be the same.
>

Just tried now, and it does not work on Linux neither (make check-tcg
does not build any target beyond tests). Maybe you forgot to clean your
folder?

>> Regards,
>> Pierrick
> 


