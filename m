Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D1CD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 17:51:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQU1t-0004Uz-DV; Fri, 22 May 2026 13:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU1r-0004UO-OJ
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:51:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU1q-0007UE-A6
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:51:23 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MHgIXp3602336
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ruJbvrxNN+yljx5EHf2RnV408cZCYmyQyf3dJLm6wlc=; b=m6QLPVb4QLzmDUEN
 YSFW0LBeNJSXQZY1xVzrQTvm0r3sO0ad3qTwSonHVRNd7XdDSzEf5Atd8guWZ3Kt
 KhcDiW+7eRhGnswZcww2i/X2jPfoMLRGhf3So1RRPUvzAFFTAfQrUyv1GrspmasN
 288scWw3mXGxJJvUqnrzlujR52pFGQGAKHQP+NjNADGZ1zt8s/lkg5HfnzG7km3q
 ghB92shABNOCt6hf0JnlDv5v1kGzjrBlQWtJZ/RjKteRAAO0/3DQqoCzvs13whqv
 HIcQAXYJdqYCl8iWhx0krRnm/gk283EOtFvwV5e//BievDWLdxN2TsSnvQTN2KDt
 AmKeYw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury01ey-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:51:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3041ab826ddso5529994eec.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779472280; x=1780077080; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ruJbvrxNN+yljx5EHf2RnV408cZCYmyQyf3dJLm6wlc=;
 b=IZl0DtdG1vC/eR8O1qCv9iyb5zCWnYPSCfCF/F0iEPptCVkJ27EpkfKH80BR7GksO7
 FeHxVLT0aPjJa0hV0OyWCCTkjlhPhh2xYjIbJxSlJJj3JMm3HhovwxnpCVLEpRDUINR5
 zuenR1c3fkTnL+4DkcvY6Z63sAkSbRfpbGKAVRzRyy1VVOOiqPfahQ3z1vOQgSaJNmhi
 UeSJDDIkPJ7lfHnADIm7OZyGMZdCRyd2QyRhKOFlMP69mfhlvIj8A3QXbnEy4FxgesWQ
 hHnDORrJvGUIyrgz0NncAq7aRtjz6bs8mCXkUh6fHZssIJMOZv1FfjlJxoqVOZJ9SgMP
 EOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779472280; x=1780077080;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ruJbvrxNN+yljx5EHf2RnV408cZCYmyQyf3dJLm6wlc=;
 b=V2+GMvDeICy9COF5uqHippJ3WdhVi5Tei3ZO3A5CBTq8mfW21XZU8KRJJzOn6lnGLA
 OL7/LU39rVHs6G/MzOLvNjyP5MabMRkfmPVCfguVTtGbaLNKZNYT3SlPNM+J+/wk86JJ
 E/aHDHeUIN/GP5fZdvgGDrOpp2Ale+1aCF5BzlXrKAXDQCgIeMdwt2wt8AFpKBdtuls9
 yfZCl+JHI2vvGCS3CGVlDycEpHf5D33jPE/JPbofAR6udP88dh65LMfEDxxqp7G6897Q
 PCD1W09HCWse/qq72XLvaUnAGqX6cyZBkXEQe5Nam0orBUNQ4Zl56gqirnOH8ENNCDdB
 akrw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BFO7DE4LYzOShJeOIv1HAKjvNB2ilHaQqsSd3/QCLC98qVdiTEekPusBOIm+HTDZet6KVDctU5A==@nongnu.org
X-Gm-Message-State: AOJu0YzQWPAQwhumd76cVM+cuz3v9JegyZE7vxAjCumNsqZzndDc5SXs
 eQC1e/nSBja277tTCfJ9bi6w9EkCN6iS+1fhTtKlJz3cHbj422iSXw/1ogfz13ROjryEi7p77an
 BXy2i30n16kiJPPhsAP8ujp7aqO8yJmy2Q9GMRPm/emVTRFiMfu9nQnE=
X-Gm-Gg: Acq92OH74f9TERgyhc+5R4X7CVzDFnn0bRo5sLhJdLVHPoDjn2kndm/RBM2h3z7Ff6E
 n7rQTOW32jOmDxlwTct1pxLSLdTN7voCjJwEFpxiVz5yQLolpx40KaJkHfwXHTDT46nn9weEaFa
 lu0IEaX99kgEROZXSdF0AAcxwLELpGPeP7Qw0IZ1niPlLb9xDX6SHupUu56mgvqteKxR4K1Mkwy
 b3seuB+ny+/PNR4vvQM+uv/OAKVrzvZ3+SN3RkULVdm0aLHprXFlWlEmMmkNFgBmguMNfpGp5OM
 WcneebNtNnRg0fIkyiIzmxLwkQ5Zw3asNbD8/alj52IclmSuKwDi8n5kfwUWHCtt32Fgp2NgQCJ
 x1euTIyO94aPxT4d1vljV93X8xDYwV9NDb0ChL6kwr/PErsrTPgUgSNTuUamKV+xTOby38Jw7nz
 HTkuxNcb2Dh+t+oA==
X-Received: by 2002:a05:7300:ef82:b0:2d9:a799:3c4f with SMTP id
 5a478bee46e88-304490b808bmr2282806eec.24.1779472280174; 
 Fri, 22 May 2026 10:51:20 -0700 (PDT)
X-Received: by 2002:a05:7300:ef82:b0:2d9:a799:3c4f with SMTP id
 5a478bee46e88-304490b808bmr2282788eec.24.1779472279646; 
 Fri, 22 May 2026 10:51:19 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451ef3273sm2037879eec.2.2026.05.22.10.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 10:51:19 -0700 (PDT)
Message-ID: <6ddeeff1-f0d1-4f4b-aa5f-6e3e198887a5@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:51:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] Makefile: include tests/Makefile.include before
 ninja calculation
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260521131739.540157-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3OCBTYWx0ZWRfX9li5qPNRubVJ
 iehAcDLM7QDZ+yOtTnQZccdq2a1aI3qTqX44BNx7cqtBlGbzqoq2xBt74L+J6i2HC5+6kHp+tlG
 lmluy+cWTBeQ8oZp13khGg4WfiseigBDFxcMxV49uFMNO/FtErAKFZGnMPwFJlSMZlf3nQV+lg3
 RdadyGH6Q2ApGbIYEFpjYtXUl2brwL7r7X7veLRdUhyd5i5HsN1Z9a9KhhwpWL4gLjdDsxkt1OZ
 8ClCdqJdQlorsMfdnFI3R0VWHWtd2jycs27g6oUuGV3O3ubp7o0yKqnQIN8dNJTYwGhZDnYRd1D
 K0OGRpuRIRxnS5niEeztqmPFefI6w1yq5S6mtRX2TCl8zuNqOdMUoXLxI+Ik7jeMc51RaasSJo8
 ZCSQsLCgKWfD/+b4cy7vMJKbkZxT0xYGNzaJkikgjnOuL6ol+Nbt6AAyedZwfOeO2CMbQGsTZpx
 9TL10BWMXXfuRWjjQcA==
X-Proofpoint-ORIG-GUID: ekYfc38liO-CT49AQ8grLeo_hrU8_x6K
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a109799 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ap8Ps3bTL7ZImHDTBpkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ekYfc38liO-CT49AQ8grLeo_hrU8_x6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220178
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

On 5/21/2026 6:17 AM, Alex Bennée wrote:
> As the tests Makefile sets .ninja-goals we need it to be included
> before we do the calculations in the main Makefile.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

