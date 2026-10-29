Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83375606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4b5qz7M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCwF5wMk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMTg4-0000QZ-4U; Thu, 29 Oct 2026 13:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMTfz-0000Eg-Oj
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:12:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMTfw-0008Ea-Ja
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:12:31 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGDPFa594499
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 17:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qvyaaGQNHiDM6gm2Ql1Ha0lFy9Sa0AbxZ/3j/0i8HYo=; b=p4b5qz7MgbSn4Mrd
 r4bWctl/4ZD1iQ9B0/EAtFQP0zFnipNi4lNK/H/yvHyfi4+C5WwkiUNgndXaBBA1
 MmbSzp/F3I3wwaPZ3x/5OwmLHXOCWifiFEwS2C/Hk94hd3bo2BiP/nGmLGU0ul6z
 0wCNPk1TlvXhSTDuNcJQ8PSMLlBpujENqKH6SuoCvN2+xLmkIi0umoo6VDKJm7sJ
 he8y15T+LFQF6py5/VK16EJM1ALCdJt8+eZ1qEr1myr0zDwNxWYihVyfT97VrraR
 j2FwTNjvjd6MKEcYxXXusF87mL18COmofm0bOoIE2o38DPKCPXWfTJd2JYXSMcgn
 BuDMKA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kmq8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 17:12:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36a223755e4so7522343eec.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793293946; x=1793898746; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qvyaaGQNHiDM6gm2Ql1Ha0lFy9Sa0AbxZ/3j/0i8HYo=;
 b=LCwF5wMkvKLhAVXXRc4qfa5/mTTqztJ2HuKrKB0rPeEtg40fg/0YCBA/3xY9ZxEh4h
 WvDPPmNX7gMRDiYMJ9lLBGbG9ZFDyZu3H2cJw0Dd48EFi9C/zshVEmN9DzGgM6piACoi
 Xb+UkjZWfsxjpdGssVLfucQO6MFLkIPymo9hVl38s0ra+5BY10jaUYpojX6HVRAaDh1I
 r8sVQiA13H4EvZss2shShAhDo4Sw7sefDCYtaInluZXiuZLYEwn2RfGLzGBMav8o5tF+
 aJ4QqEBOY5AWDOF1X532GxST03kCq5SepUTbkX50/0Dig1pYyezbxp0nT7mh75UY/7G6
 lR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793293946; x=1793898746;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qvyaaGQNHiDM6gm2Ql1Ha0lFy9Sa0AbxZ/3j/0i8HYo=;
 b=aqnStn+mckPCafDFzOXZhHFixQcgcDOSfJ69Oacc5lzS9R00MiOOJLMllMdHKlG66Z
 yt6TdG0RCkB78l6r+EwR5KVl0DzI63zQMAkzPT13f1qNEPXge0U1n6xEnmW61wl4nLM0
 UOyG/P/KZBeXMazy+uSoC6SN+HKD9nQZxs8NUykFLZfrezzHzPWqw+Q8l2ojBxP6/sSy
 /H9vkgLGIF4QQQOaAbbunKFjlpY8Fl5o+UX4DkqJ71XfMD5Epmu8nGLoQtiDg0BvRXjK
 Hs86M94Bhh/oJCAFL9fWOHKu2CdPC3WAlgBE/k5QeHZfpeMQCBGp3zmEWDpaJ6Y53EiD
 WkfA==
X-Forwarded-Encrypted: i=1;
 AKwUvByCheYim2jxPNu5W1Sd40ZwbxfrkxlXrC+bMOtBcdgMU6t/ZC2CN4sbErAd+jttcTTQvh6IbalFyg==@nongnu.org
X-Gm-Message-State: AFq9FYLEcUujkxkpHo719gwJ1ghKA32BQ/tTKhkMaKDgjDij4DHnvLMk
 S43KTGG6oHXNMI3Zi7xq2NyLXd/MWYGxhoAZhUeWs0IR+tkxfhKirrfSwmRbP+5O8znZe8pqFLA
 iKdj8SLVlBbpI7n9mL5++l6TmXDvwQ7R7S2kYmDKYK5SW8SeQkmcNP4LkRl7iZ6g=
X-Gm-Gg: AYBFou3mcDP5pMtkIqReLx45/8AWRi6vYIDoGO8PKBVoZ3hwXCvngC28IGbxfS3J0ty
 l/FfQpc8xF69F2/xF1ykZMWa7qGVa/KKwqpQAAhgHMEYck8u+noWq3wrkf+v9Ndt2qaTJO2tHT7
 YXEgkElxT+GMVEGt+wBPAwAs0sv0VF73o9nQQMtECYxkVeeJvv19mL606wNF3M4yuEvwODd8cLY
 1+bZcHlxU/rWdoTtRmxyBGT+uUgi3V1kgRlHoGksQr5+whFSnhQh/f60/9FAMkTjL1kHnoDcZ9t
 66384eZztSLx+u2ns886sKciG3rQH91PfpP+0Yw/kL3bPIWLjL77buqeWoDrSLXqfT0saCCzIhc
 5OAB9J/1r7PgRGZKTwmhq5AaZjqT5xVUOvQUKyeZSwKISOZs+eXrkY7KD4vEVnBIvaGzDZAvQcC
 aWSFDiZ1ZS9oNq0JF+iXB/LLgj9I3mg9p9vB2T07ZSU/4=
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id
 5a478bee46e88-36a42203e90mr76619eec.3.1793293945729; 
 Thu, 29 Oct 2026 10:12:25 -0700 (PDT)
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id
 5a478bee46e88-36a42203e90mr76588eec.3.1793293945140; 
 Thu, 29 Oct 2026 10:12:25 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a4108c52csm445056eec.16.2026.10.29.10.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 10:12:24 -0700 (PDT)
Message-ID: <c8bc6def-3c86-4fac-a84b-6664d40d5006@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:12:23 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] scripts/checkpatch: validate fixes against
 origin/master
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
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
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261029161310.2065290-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NyBTYWx0ZWRfX+znlAtV7BfMg
 1Zfb9YYs9mwbL3uEp8213QwKYRDzgJ1pY3kdLNlsjDW3sQLkiU5NiC1/Bu6uW0+vC/NEQ5pkRvR
 AgAAD6LSEmbl/fG1177JFViBVs238Rc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NyBTYWx0ZWRfX0qeyQ56sjaYr
 //Yu/NJ2yDHFm/65dkCakp9rrQfyC4+/CHLbqaqbb9XzsiyqgtiGCvXZYJaVkBwpbhnxrwPr3/u
 W2d6KPtioF9fNfWKaI42zpSAekGnI8oTaU3Gz7TQS4f5/Hab5susAVC0vq7hlzYO2nB/ZH0zciZ
 KefGeKkYpE4u5nXfFb1slJBN2NocxjGjJSQ5hy1NN2Ahkbv9vRcnTCkOK/CpH7LdpljDSdTEJoZ
 VZ876UxVSsK9HP4MF7Rg+P9bOnscN40F9i1wb4JyOemIp8+MQNGVUoJ37RLsI0+Z2wKmLnT4+r9
 DmRMb1i1kdCZEHB/qQiRsJtIJbnfYdDZH+CI6bG4uqzAXbimWYhMUqIZvCOM+k50pqah+RONr+g
 yQWdwRHzeXj+Hvmzy0SkmzqjaH6IZCTakI5gD4AZAiDpZJIalqTkx2uPm0xO6quzVX/+xSiRxXB
 YDz1JWDsZKYJeDeQ3RA==
X-Proofpoint-ORIG-GUID: J54Cy5RDZK_5Od6q6kotZAYGTEAgP6vv
X-Proofpoint-GUID: J54Cy5RDZK_5Od6q6kotZAYGTEAgP6vv
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae37e7b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=t6Jf17RKvxzU3DPCqfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290067
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

On 10/29/2026 8:13 AM, Alex Bennée wrote:
> The current check for a referenced fix commit relies on the developer
> keeping their master branch up to date which is not always grunted. If
> you create your branches directly from origin/master this will keep
> failing.
> 
> Given that origin/master should always be up to date (module the
> developer eschewing convention) lets use that in the test instead.
> 
> checkpatch complains about the line lengths but this seems to be
> standard for the perl script so I didn't try and fix it.
>

Or... you can use something else as origin, with origin/master not being
updated, and master as a tracking branch to upstream/master, and in this
case, this patch doesn't work.

Using master instead of origin/master has the advantage to not hardcode
what your remotes should be.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 82f62f60212..60e8b6bf7bc 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1913,9 +1913,9 @@ sub process {
>  				}
>  				if (which("git") ne "" && -e "$gitroot") {
>  					my $hash = defined($cid) ? $cid : $orig_commit;
> -					`git merge-base --is-ancestor $hash master 2>/dev/null`;
> +					`git merge-base --is-ancestor $hash origin/master 2>/dev/null`;
>  					if ($? != 0) {
> -						WARN("Fixes: commit $hash is not an ancestor of master\n" . $herecurr);
> +						WARN("Fixes: commit $hash is not an ancestor of origin/master\n" . $herecurr);
>  					}
>  				}
>  			}


