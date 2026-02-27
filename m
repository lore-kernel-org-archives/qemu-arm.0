Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2358FD9E3A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 20:03:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw43h-0001VW-Kn; Fri, 27 Feb 2026 15:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw43f-0001Uw-NQ
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 15:03:31 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw43e-0000Tr-Aj
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 15:03:31 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0TPw527624
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 20:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pDHL5/sWqgqbrG94mN026T8E4mtZsD47FQXehS9P/K0=; b=WpLIHJ2LhktISaqh
 QtUZv0jswc+bzhE0jFWdc6C7UTp5RcSg6nNkjezFMr6xsNM6k1Jt2l6WRr7sIIDG
 5D+/k801R0RzmsFuttMgDyTVSyulhMeBOkKhmsENLJ746UOe5u6T9cJLiDvr2N4k
 zhq07SBgS+AHumOfONFrR52bmMfsfSZScP7XJpKl5VvefdXM49/EJwlRSEFRcNeh
 64TfkV3j7A1/VdcxKUN3y6s1g/1ACMgkaA6367WfwxGmRDmeIbCV28vhnQGuU+Cp
 ATHf7eNBeV8qjUPleH+AQuv75Kf9To4/9KHuu+883q/dXzhEz160tKeSE2Ub/biG
 PW0rLw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23c6hv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 20:03:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-126e8ee6227so4556336c88.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 12:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772222607; x=1772827407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDHL5/sWqgqbrG94mN026T8E4mtZsD47FQXehS9P/K0=;
 b=BDzvHrLKpoI+JdKQpRv8g1y6yLE+NeQPnGNU+hRM9jcGlTsOtLaDtocgHSzZ6IlUNu
 OFD+W1tAEikelHnO93oFV+7KDdAneEWrYcaGr2Vz1QhDqvrpIv0JXXAxolH5OgHG1FAU
 677niz0Os6if1JX2aN+mXzEhl1uzqXJqSIPoUlKqEW8q9FGGOhcEtpp7EEE4LrePkMkI
 pQuiGFb2C9EQeuw/+Ma56PWjEttwH4b6vEAg9bCp+wZbH+aQ+hrbHO7m9FSBxklZu9+Y
 7dx5Z0xFFbRjeMYOL/4iquIMuO0R1MJtLrzBcKuRk9OdnMPWMp6ee6pZTiCcPgWdL/ns
 c8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772222607; x=1772827407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDHL5/sWqgqbrG94mN026T8E4mtZsD47FQXehS9P/K0=;
 b=K4CVQlmLQ6uHzV3ZcjBZLD7fkab7Ih2hT97dch6VIZxw06958zxwjfaam5QI1PC8Gj
 56rbk5k+zo1VaQWmB3dWzc/f9vTB7mTb5CaiCBoPaanSMfzfc7rr0b3VhWnHDZwuzkpe
 Lodlo8yR9Sg+CqarTNsmlEBxHHlNN/E4sQB6VyNai7wJv2c4mQmKciT5jbT8IZOmSUMu
 ec6xO3OaVk+cvqBWtjaA1+R5RK5RrAtw4O/hpwwuKPaYVNHrbPOviKk6ncsLT7eCPHyE
 Itt/O4tgu4vtlmpBpRgv9bBklPK8Z0G4yU7t2AfW3nX2qhklTaebCJ0m/ouJC6kB39QF
 4U1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZyYTcg0YvR+I0jTBQDv2gAk5Rxs4FFRiKaLsKqh7Xr8uzttGVTbnGLhxG4I1zciiD4YudIdiCbg==@nongnu.org
X-Gm-Message-State: AOJu0YxGN8f35O5fyW5vVYbwP8kPly96OeuNvD8yxM7gXQM+exmTcLmI
 rtgyxu1c/NRravcUD3y6ExFgo+919b9J5X4aMDeO/pbtlibTAc0qVOYxoahRFPHTyE9pdrT+K8Y
 a9TjvIPv76vSYu8kc0Unr1QcEk6oJ6Oj5glNIuZoPKhMjp9OrhZsmQrQ=
X-Gm-Gg: ATEYQzwipzZ/sTiDTsmoYWV77Irgih+Yk72j2ad5EIQDWPOUTfQqORzIcP5HSQ/PLDN
 cAqjpU17z2pnjEZcz/f21dV9rUwlnpFM0h9bHdfDs6Gq+tCyXdxRFVu0NkeBg6t8tjJ8vhwYqVz
 Blu0SQxLvK9Io9JivFoDMBX/obs5h/8zCBsiOd6qU8PabjlVYc1Z/Ut0bosavobDsKIXTEBKSPi
 v0zDUMzWNxgs4EwHDbrspBLFTujRRFtvPFlnmFDvcfyztMdiIB9sr5+1ySy7+Gn0XiegZfVdI1V
 NBs289sx2IGS04fIJYXoRP5mPdrCbZzmM8sakNI/yXa8fdr7SAS2Ry4SvF6743BhQXrOIWCl+Ss
 HJWf2H58FZvk+kXwQ9ouLV0BmIGY6xuLSfls+ftVwlrdZobTjzU+HrpF8gV6sShffDAchcrmCp3
 H6ZQ==
X-Received: by 2002:a05:7022:e29:b0:11b:8b4b:bff7 with SMTP id
 a92af1059eb24-1278fc57617mr1440444c88.39.1772222607124; 
 Fri, 27 Feb 2026 12:03:27 -0800 (PST)
X-Received: by 2002:a05:7022:e29:b0:11b:8b4b:bff7 with SMTP id
 a92af1059eb24-1278fc57617mr1440418c88.39.1772222606421; 
 Fri, 27 Feb 2026 12:03:26 -0800 (PST)
Received: from [10.110.80.16] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-127899eab46sm5430552c88.8.2026.02.27.12.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 12:03:25 -0800 (PST)
Message-ID: <08e52599-d4a1-47ad-b828-60a6a20673f3@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:03:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/22] i3c: aspeed: Add I3C support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "komlodi@google.com" <komlodi@google.com>
References: <20260225021158.1586584-1-jamin_lin@aspeedtech.com>
 <a19985e2-c9ca-4158-9c64-e0d16ce40c8c@oss.qualcomm.com>
 <e58d1526-d9cf-4f31-b7cb-808a7b0f2c66@kaod.org>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <e58d1526-d9cf-4f31-b7cb-808a7b0f2c66@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qAO80Y0X0Aq66Xa16CScbgLNJvhEsjAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NSBTYWx0ZWRfXwt+uD6iGVT30
 +i2Pxelykywsjrf4TtSCL59YwWVf5gRtTbx5Nyb4FNWsDsDLY2os/u19x9oQMydmqPgTFeeHK05
 jVoj2EmfNUiQ2B9HYCkNruHrZVni0zd65+NSkBqZz/oFVCZPo/3H54h+u/vvvOlXZzPGpZmttdC
 cj2c7Yo+hQCW5a53RMVYAtmFnP6FFn4Pn1HO30w2rcL+uCwoC193pF+ajIGwhKnlFToGQJqnGIk
 A6nrAVwgikK5sIeIHwxyRD0y5+bIKBSfbHK+GLjoZsdlDrKQJjY/O16uwp1UX5+T798qFPP6LED
 na//krLVmhbxufiIzm6x/nmB5gHmK9dSO61+QD1WRtUpJdFT2mtEYQGHC4xfc2aO5rm2CIQtKLW
 EYqr9EKUhSPcbqHpHztulkC20JpZxOx+1EeIP7yR5Za1UuZ0bXr+b1gO9AJ7937n4FGw9w/88MA
 zGMztxdLDB3RzAsD46w==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1f890 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1XWaLZrsAAAA:8 a=3kjpQGTRYXVoOlmu2nQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: qAO80Y0X0Aq66Xa16CScbgLNJvhEsjAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270175
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.706,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.401, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/26/2026 11:53 PM, Cédric Le Goater wrote:
> On 2/27/26 03:33, Jithu Joseph wrote:
>> On 2/24/2026 6:11 PM, Jamin Lin wrote:
>>
>>>    The initial patch series was based on work by Joe Komlodi <komlodi@google.com>.
>>>
>>>    This series adds I3C bus support to QEMU and adds more functionality to the
>>>    Aspeed I3C controller.
>>>
>>
>> Thanks Jaimin for the series, I was able to test this series to a good extent over the last week
>>
>> Tested read/write transfers from guest Linux using i3ctransfer against the mock-i3c-target  on an AST2600 based machine
> 
> Can you be more precise on the machine used ?
> 

This is an internal clone of ast2600-evb which is still a "Work in Progress" and not yet upstream.


Thanks
Jithu


