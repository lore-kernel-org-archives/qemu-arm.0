Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE55606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6nnAPk2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ciiQg2lD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMTow-0004jK-Ri; Thu, 29 Oct 2026 13:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMTov-0004it-Di
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:21:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMTot-0000tC-ND
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:21:45 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGDHDv1654861
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 17:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gTEFmPyDlt2EG8JUyjdgugleGJk9fDChgre8iNrb3K0=; b=W6nnAPk2/XwG2Yp4
 NufdExb2hutEJbVN7jRQ/0At2xditeArJq2mjSM/YauGJWTPCpdd/OFbRz5A5nNJ
 fOPosOvr4xfWgBBEcKZInyFyMGxdYDPGE0gduojtNENWPy97Ij8V2mmFJ2m23zfo
 vsxY1RWStHE4BZkpdQbulu9+FTF2FoKJWvPUHnXgVX3hb1szPu6CjRwWwH+ENI/f
 tpGQ1FWDR978uIUqr0or9jfkSkVr4wBFc62BuJWrO+hwQ+4Nnk7dcG7ivjS2Beze
 qoJtHvlPvm1gSjEgWZlVCnlQQLr+WKW4jEXZk1petFCA1dGJZuRBKrfnFT6O3yEt
 E0IKNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a21s3f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 17:21:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-536720195ebso46524581cf.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793294501; x=1793899301; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gTEFmPyDlt2EG8JUyjdgugleGJk9fDChgre8iNrb3K0=;
 b=ciiQg2lDvF+mqF0XxMSqeQVecPHxsePA8XioLO8e1LG5RUbQtOvM03seKKlE0mrldJ
 tfBiLaFNUPZAkmZmcAXdeLkHO1erhAWc/7MbHdUbmltxPEm4oVAnDD2no+Fzc8NJBN3r
 SfQ0KePmh4lEmv8c39+XniLzwFwTF6qiiv6+t7RPwHPdO3pxAUOFRSWbC0D8giahmSzT
 CvVn7WAhyTFzsl3WoTtsE87enFOTa4uZ9d0P7r7riLq9q1GcGyS69/WcC0lVAFz9PQze
 I8Spv2U3uyJe6J5JWlzhnVx5JBhzHf4yhN7eXLroDzzcU8EXeWlpP4GpVn6btiEXBF0/
 fMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793294501; x=1793899301;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gTEFmPyDlt2EG8JUyjdgugleGJk9fDChgre8iNrb3K0=;
 b=mXX8PbGt0u2kq8B58dLzC57v3IGwlJliXTccvLOcWar+u1ASqv+FPgRJ4NX44Zl2xI
 jcjOLdubgBawxhhjxTQVZuD/AoPNhVBbdSq/bRZG7GxsfyJe8LMEOkvMq3cfRZkfvq3q
 gfGX5KxIrL3KEkSgubK3LvCaZf5bO3jWPxrxlx7prIZi2THWO4+HdD9BzRI2YhKh6Rd1
 3cFo3mqutYCFmBXr/V58Ix3CVYMjTVoJJHZGjKevqpYrhUnc9mTyZoob+1JI7GHuO/Tc
 kbw33ahL9EO6yhqFCxukL44JECnIexrE5smXLfgn+yl0eT0/cX8l7B0NSdD1o5SnDoXw
 i4Yw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwaA11lNHSZIGjMX4b1IjBjgYdD3hfH3xQ869MqJSMYW0DG1HjPekeRXiIezcLE2zlMmp9WP9PZUA==@nongnu.org
X-Gm-Message-State: AFq9FYKfRJFDNop17fedAr/2MNHIgLH9FfJ7TjaHGVz5XPL3bVNze5un
 +oYsJjDDjckBT4MxtTiK2L61Vg8nsmxCQ/YUI6wioHJgJEAvJH8LAs5Y0pm/ajDvd+l0QeWviVE
 AL+Fhys1qosR4D2lxLu1HOb8IREuVFpiTKSA1jukNcyp38QVjAaAuajVBUsCWnQk=
X-Gm-Gg: AYBFou1a+IRW3H3o9Grg0bCf85pcCJH5ty/yYWUpKRwU4n2FAVxVPXjYOzxau84OYPx
 mQPs/YI+kOeuXmFPY1lD3CzeEGYv3SUtpBcxyDbzn5oBOm4Y3YRjCX8iWimEDR4IMHk3wm54uEE
 ufvPz2WRv3aW4dX4P+fHn4gBLA6ZDSDWqFcsUB/er6q1Ys0G/wtX1j733N8wBuncSTkYaGsQAmi
 6D3A9zfbvM9bm00LYL3K2UP4CBKYYC1QcVq9Z1yS61M5nN7h5pGGd8DT3oxIbrkg02oye8i/jdQ
 2DG4kKNRfejNMUO31GnGRBb1O0MhbXj/PuQqsJUndAN4ZZnOiD4+hl7UNWOOMIAETqwDSH1nzJL
 w1WsIcyFRhr0iwSH1DAMPW+7+6TQ0zbe/f+BO4WLMMSKi/Ndng8gPOUfFdHZKTpSrgOKZDEmBRM
 1pVpnNzaeJBklfFIfEOSOFcWKz3RH+JMNTgDlWV9uGFuU=
X-Received: by 2002:ac8:610b:0:b0:536:2fd8:a4d8 with SMTP id
 d75a77b69052e-53fcbaf008bmr100389301cf.15.1793294500768; 
 Thu, 29 Oct 2026 10:21:40 -0700 (PDT)
X-Received: by 2002:a05:701b:454f:20b0:164:8e14:4939 with SMTP id
 a92af1059eb24-1a6cc90e78cmr8243984c88.10.1793294063203; 
 Thu, 29 Oct 2026 10:14:23 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1abeabe0aa0sm503347c88.18.2026.10.29.10.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 10:14:22 -0700 (PDT)
Message-ID: <ae1dada6-057c-4614-bf59-ec60b1f89604@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:14:21 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] tests/functional: remove @skipSlowTest from
 quanta_gsj test
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-8-alex.bennee@linaro.org>
 <CAFEAcA_UJ=QMFwdGtWv_wWhRyzoig0_0VC+T21+kFvzv9qasoA@mail.gmail.com>
 <1d76264a-040a-40f7-977f-948d4db6576a@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1d76264a-040a-40f7-977f-948d4db6576a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX+SeGk3ct2fqo
 u8+Rjxg7rWqKilznHTOsW3yZmRMfnOG3FEMXOMAGlzqA02lHlisl0lzKpzMnB1AVbBIVZHnvV45
 qd2Q9wNu9iXHXTS0dL4+Dn2JexEHAg4aqBqswpBq65/5RG1gTgnbizojzcjysflWhOzvqnI7xpE
 zuXHawQhFf01FSL48I7n1FAW+PbCozGRYwHj9QxScGlaPmUEfNjyqP4ZJysfiBnTfPzyejXTjfC
 xk7k3XdwihXqgVhSbGMS/zfK/3wHksYDAMtLQQmii/Gd9gSmS3HuCsGlgWtiu2PxaEhyJLFUMyq
 Jt3B8Q5L1xf1dK8AAWKL1guDFRoSPKhCgyg3j5WdL9Xm3Pi8Bvus6Rf03MiWgAHhb+0cJb1U/b+
 P7tBTjDXaOea4Wg1LL68zFt2X9cSh41nEs821P6UBlnUzVeV/X8SrfA/UApAXayelRWDiDU/4Mh
 ehfP9yGn5cwSynw+LuA==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae380a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=FRSEYCzRAAAA:8
 a=4Y4E1iENGhMKdSAYfzkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfXzbIaAf4aa2xu
 EjZ5vd20R77hYKjdIcVAMvEbtSWZ8IP4mGK8wBsInIp7ByJyK8ynSlv5X0MSkPmryx0Y7X3Npwr
 X9hwDw66g9djSYEQS0ii08FMUkvdvms=
X-Proofpoint-ORIG-GUID: Rwi5QABrwNfqUv2KuXLacb6cQ83tbxGg
X-Proofpoint-GUID: Rwi5QABrwNfqUv2KuXLacb6cQ83tbxGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/2026 9:05 AM, Thomas Huth wrote:
> On 29/10/2026 17.38, Peter Maydell wrote:
>> On Thu, 29 Oct 2026 at 16:13, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The full quanta_gsj test would have caught the regression caused by
>>> the WFxT implementation and isn't that slow (<60s) it needs to be
>>> gated.
>>>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
> ...
>> The other argument against using quanta-gsj as our test here
>> is that as discussed as part of a recent docs update:
>> https://lore.kernel.org/qemu-devel/20260627063208.33642-1-
>> bin.meng@processmission.com/
>> it's no longer supported by OpenBMC.
>>
>> I didn't get any response from the Nuvoton maintainers in
>> that thread, but I kind of favour deprecating the machine
>> type in QEMU.
> If nobody seems to care anymore, please go ahead and mark it as
> deprecated! We can still revert it in case someone speaks up later
> during the deprecation period.
> 
>  Thomas
> 
> 

For what it's worth, I also noticed that this test tends to timeout
randomly, even when running tests with -j1. So we might observe this in
our CI also, by enabling it by default.

