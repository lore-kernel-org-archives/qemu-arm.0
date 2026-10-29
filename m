Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B218606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 17:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QKM8JN2K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kU8ZFpQk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMUBt-000082-D6; Thu, 29 Oct 2026 13:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMUBV-00077O-DU
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:45:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMUBO-0003gI-LQ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:45:05 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGDWxt3234237
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 17:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cdvyUfZFJhb3iXEXrNSlHnKhNjT8QK5cNTBEa5rpod4=; b=QKM8JN2Km8jOVut2
 Fc9bNu0PZ4E5NTxie6JTXumTb1YBTfYkMznnJtsRSqjCOCWgTM7EcgAEiZX7qs/J
 2XPOwkhFe4L/lvBn4THOb/i+eQ9cKO6CqJkZXdnBe+0XDT2BUdOQrh+6gv7mlRzc
 joCWWSYcEvhbiq5HL81qJQJ925UYDikS2PR+Q6EnzlzmP+4pwkWYYALUrZ36yfIR
 AxjRSUixS7tQx5kWLFMjHKOf5hQOwUyqTEXUw+XVXlingOPbxAY8HXcTYB0KYtat
 ntKw3mRr6vfRmeDtDnRmLYo6P21engdHCzvvt+RXDuCA8//Lh5lU1N7MN6NYLmsB
 H0lYjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b28fa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 17:44:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-35c5aef2a74so7725303eec.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793295882; x=1793900682; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cdvyUfZFJhb3iXEXrNSlHnKhNjT8QK5cNTBEa5rpod4=;
 b=kU8ZFpQk+cIyaLC3Eps+ufz6vkCtUgFg4uMVMScLiQhqBs2W6Z0V8paA57de068347
 ThTkWXiC1+nPpLj/7vFekkYjhOoTbanTTXCdl8agFpfaPE5IykFU+89EJBIMK9tWzaWd
 DeVpbEC55AJ4PJLIaqa6WxBHuBhu20p5fhVJCZFXk/pz/J1ThwUd2vSfbbvuJbP0Lb6+
 zYJSxrjQOD66Y5jVKzAoXkwJXHFjz/EnO/rZ51Eq3+Z+c+7NWsgZTn89hxjnlW7WgOw0
 9GbAd0xWDzIV20qGPOJ6McEOImQaRPgfef2MimE5sMREMXd0gfbGq5Jl2v9p9MOXDxkJ
 OkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793295882; x=1793900682;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cdvyUfZFJhb3iXEXrNSlHnKhNjT8QK5cNTBEa5rpod4=;
 b=I2VmOluX2m8hz7OSmafQ/00sUQUJNOKwBehJRm88uhNLa60xhQq9BqxCaS15tneNCE
 PBN+AZjed7g1/KcglOx/+TIWRhwoywpsOYTedKjXnlWmj8k0T/vAf7OI/4cFXLfSL1AA
 dGB6bcrHdNtOcU3G4KyMGwlxO9tY2pxeVAO5pbl1Ii29AKjZ3pGNCihzQB0vYPdt2+yS
 cRhQqZqcd5aVHAVlkfmsKSSWiiZgG8v5H+sjm6+ZkMibS2zfX70Koj9VN9VuDrz42Zwf
 +GDPs5eq19QO1fVEa6DEZ/Mmrssij8WgE2+Rc8k5k8lwYtvdVQaOu7m4eErw5QbXcfp2
 VRng==
X-Forwarded-Encrypted: i=1;
 AKwUvBzT1vwUeYRfLsHMaAKyQ5QyHTT1dtvz/OKQCkBdKR08GGxnGrWjUcEWT7tP94kKInBagC4SxENhYw==@nongnu.org
X-Gm-Message-State: AFq9FYLtwII2YsXOheL6ZNkYAJgNIuZq9WfyEvJkCKjT+41udbO8ttwQ
 btaQznoBQuG2awF0g7wG5BZtxZGUfhYCTIYHvLOU0eg33qYXhuAYZO74u2esjH4wPy3kpjOcI3b
 ol1U2xZ3JEVJpt4R95B7pnlfHp+RNGVs5OUWpi7ELxLmXDmD3VaisPzQ=
X-Gm-Gg: AYBFou350y/cx7VPQkpjHp1oscuTiglPuXDvV3FMu7og7mFbKMLotc1GuFT/66aEMDz
 zAuqqs33t8NsdwCBYpw2bZnqKNrbNAOaUBUDawJmYA8RtNuutMRH9SeVdNiv739hSfo/EQG3l9L
 ewHEx3hPD/P3IedBHMBGovo0lJq2XRcWhehiMnP2OQj7+U00ecji+QTdUMyiPj/hDRha+YPpHLz
 yL0q1G+jadRT8b3Qk0FlVtJJyIqWxJrJl29k5Rm2Imo+swIjDPcOGRT2w04vEYNDTbPSUjYhpZ2
 mDgh+mB70o9K0tGxdaVXxall4TKVOknnZVyLIbC7BBIoocNLi5lAer5++NSKd4cvlSHwgYjOiqP
 W6a1CwVTqTzgjVZ5AvmYmNAn0Iq7bun63qvJCazKyqoHIjHI4b1VAoav43fUi1Fz0Hxbq/SroUu
 PObUhSZ1FWfxJcSzhobr+aanxYyhpos0fAf+LGmEr4/8Y=
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id
 5a478bee46e88-36a423408a1mr136986eec.8.1793295882068; 
 Thu, 29 Oct 2026 10:44:42 -0700 (PDT)
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id
 5a478bee46e88-36a423408a1mr136943eec.8.1793295881443; 
 Thu, 29 Oct 2026 10:44:41 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a4294419dsm88567eec.18.2026.10.29.10.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 10:44:40 -0700 (PDT)
Message-ID: <e19ba1b4-60c6-47b4-b0b7-71e1be096a92@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:44:39 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] scripts/checkpatch: validate fixes against
 origin/master
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-2-alex.bennee@linaro.org>
 <c8bc6def-3c86-4fac-a84b-6664d40d5006@oss.qualcomm.com>
 <8733toa05f.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8733toa05f.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OSBTYWx0ZWRfX3LJR1vC+M+ul
 qNoiUOgteQ+mWT4G88SN3OG+8giOUiE7U8RFs5N8kafwHLdEA9lISDZdvFOuzAeER/avGq6OHPW
 JVNdD7+V0mZJLPSLFGjChfj2+8B7IpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OSBTYWx0ZWRfXwy3AJLivTdSo
 mdV6jismO86ayn+AjCxAWZeGwZYD0xY++siHRMGKzPq3XeAgEmONhCLCfq3WAlXmU7kKHe/8k0l
 xL2nF77PSEmfW4WuK8C7NraVL88eC1iITqMW3u2Hiz1ykpXIrxkdW84Ays2LO7dR+9Mm2a8sEGB
 cr1qr8G7fRRNm+sVPQFU4kqOto9TsAO2LmFoF3lG1yfZjsQyt/1rcnNw29Lg5RGIodpH6KQfwZ9
 em9jyMfgVCsw5C6MfM4O7+Po3z6SellPisnOgEP2Ks5XeQP9UNGhcGYYq1M6yG10tLRGxu5fIPc
 fgNgco4KqsjsDCVpbwj7d2CRR3r9+DzjdRVdCKD6I3P8k9nX2Y26ArnQh0KaW+wyn1TW2UleAEz
 f2aJ8b+xPGv8O+1YNn01fNFVn8CtVza4nQKwPWhCGXE1le1qzQjxPv/PgnTt+70EeXbaBrd3y5o
 NYcUApCANOpsKacoA1Q==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae3860b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9zu3GSFlKV0UtYsFHY8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rzMlISua9CunZS1cNeq6xQUB3dQy1mCw
X-Proofpoint-ORIG-GUID: rzMlISua9CunZS1cNeq6xQUB3dQy1mCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290069
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/2026 9:26 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 10/29/2026 8:13 AM, Alex Bennée wrote:
>>> The current check for a referenced fix commit relies on the developer
>>> keeping their master branch up to date which is not always grunted. If
>>> you create your branches directly from origin/master this will keep
>>> failing.
>>>
>>> Given that origin/master should always be up to date (module the
>>> developer eschewing convention) lets use that in the test instead.
>>>
>>> checkpatch complains about the line lengths but this seems to be
>>> standard for the perl script so I didn't try and fix it.
>>>
>>
>> Or... you can use something else as origin, with origin/master not being
>> updated, and master as a tracking branch to upstream/master, and in this
>> case, this patch doesn't work.
>>
>> Using master instead of origin/master has the advantage to not hardcode
>> what your remotes should be.
> 
> origin is the default when you clone a repo. We could get really complex
> and query the tracking remote for the current branch. But if your deeply
> forked then that obviates the test.
>

I am aware that origin is the default remote.
In my case, I always use "upstream" to reference the original project,
and "origin" for my personal fork. As a result, origin/master does not
always track upstream/master.

With git tracking branch, master can be setup to track whatever/master,
and not origin/master.

I would be surprised if I'm the only dev with such a setup, it's fairly
common for any fork based workflow, and why git has tracking branches.

This patch basically forces origin/master to be aligned with the
upstream, and nowhere else we enforce that, even if commit message says
the opposite.
```
Given that origin/master should always be up to date (module the
developer eschewing convention) lets use that in the test instead.
```

>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  scripts/checkpatch.pl | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 82f62f60212..60e8b6bf7bc 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -1913,9 +1913,9 @@ sub process {
>>>  				}
>>>  				if (which("git") ne "" && -e "$gitroot") {
>>>  					my $hash = defined($cid) ? $cid : $orig_commit;
>>> -					`git merge-base --is-ancestor $hash master 2>/dev/null`;
>>> +					`git merge-base --is-ancestor $hash origin/master 2>/dev/null`;
>>>  					if ($? != 0) {
>>> -						WARN("Fixes: commit $hash is not an ancestor of master\n" . $herecurr);
>>> +						WARN("Fixes: commit $hash is not an ancestor of origin/master\n" . $herecurr);
>>>  					}
>>>  				}
>>>  			}
> 


