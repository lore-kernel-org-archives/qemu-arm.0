Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DD606AD2B
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+rgfTIn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T782mPBu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJZ3f-0007pv-CU; Wed, 21 Oct 2026 12:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ3K-0007T9-Vl
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:20:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ3I-0004u2-Cz
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:20:34 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFTomM141133
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ijiz2xQSZrxVw4xSU30XE80pBMuiNACBP6t9bzwtEqw=; b=B+rgfTInAwuumg/i
 hRiOWhBufZg90EwKSM4Pv1Q3o7m2ehXqIzSrl6nlWRy1Ww+gwz7gZoMiWfGzTc2p
 VtbELQ7G1yEaBGISlK5Ti9nrr9ZlCcD++t3dFnlR0Ism3u7Z9HmljMXHlZ0b2DLR
 IoI3RrZb0jJK9lrFpyIPKiFKQP7JWMpQauel81JuihXCe6EFGa6RJGKixznDW9Mt
 woy14kAM+oKafb4RRbdVGXGMbPLC9ffbskShnDOWe2lIy9GlbgKWS/WkRwTudp3V
 SmnwaaQn8tsuTT4SoiDhqveu6TgfNnMVOENrwfsHPGn86KY6jmF14T/ao+xs4VCc
 ZeUdMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex588tn5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:20:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-341eff9e381so2282333eec.1
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 09:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599630; x=1793204430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ijiz2xQSZrxVw4xSU30XE80pBMuiNACBP6t9bzwtEqw=;
 b=T782mPBumZRa5je9xndY5fkmaRmpSyUXxXk6RoNKmy6yxy01t4VyaVh6MDzgs1+/dU
 GXHk7eaJb/ViabuqNCqBZw1t8OFm0D8Vbp23x77OCPhhTlI4Tb4YlWU2mvTyE4+ZLFum
 yX6PYxDs9vlJmL4uavFbAfwuIlsRMyh37HuiSafCUqKtbctgT+ib6IVZX7aS/2pDPQ0f
 JHdygr3er1LksY36Dl+x/BLcjTx3uSM49ogKv9jcFiwEfsrgvAt+qx93oZhjOfKzlNV8
 eRh2e0by1mnTXfmGiHmN2WVLVb2jSYODEIOdmmOKBPE5uRAjxvr9recn9QoldWebdJ9m
 lRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599630; x=1793204430;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ijiz2xQSZrxVw4xSU30XE80pBMuiNACBP6t9bzwtEqw=;
 b=khvFabGsvXSNoUEOixTPDzqZ37J1+E1x4nh3hglekAYS6Dz4fgyXGCCwS08ZfKnmUo
 c4vXApoev+cDYF+d8scCwB6t1wvOU6cWuRHUoyjeWRupeh4tTXpIRb/1EKFp2cmuOiC8
 boDi3rsXylgj8DtDf0sjlyiPEDWcs330yHZRJgoA18/fQPgfS34HqngGCIGmi7r0Rohj
 dzqh5a253oOtKVBwAVhr04yEXdf9pfBmmByl7L8jRYKaqikJUf0iYcHebA0h12b665A1
 0X1e0T6QNrWfihhCUT10xSmuPkgF4E8KR1ZIt/n80l28z2zQZ7dM3I9swbwCb5Rb9+G3
 JElw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZNx/EZTWWYJ6k0Dos+eQ7WfCVaT+Xkg34ZuwT4Qi5JyoR6DWgA0vBv2WOysJKVv/UpBIJbyzMqA==@nongnu.org
X-Gm-Message-State: AFq9FYKhK85L2e2oYcIqpYz4/i57CY8mWEO8dIZUBV0M6izXcNI3Ik7n
 /qZAIawQNuQ2eftyBHuKoVbKDzIa10J0gVgKkRdeX3wkgaw8CtrdhcAms0W+C+2XiH3ensctuRP
 AhOYjpQv7Oq7BWq083gWlMNbnPbkKqy4ezPis8TtrCDcgilNd6Qi0Rkw=
X-Gm-Gg: AYBFou3atTSN3+oKTkUgNGVqrr7SIA7izO+bfDaRZIqvc0rysyuuUgKFzyh5xa3EXny
 xBnMUqUnovKj6Lmf5077UmWIye3nYmL+a559bry3HWOmcpv7J/DH3Yq+tWtDUJQt8RORUSnk2PZ
 RNfwZeVOn4L8CSJNtowCyo5jXM5kdd11EC7bRSgHAbAbKjZdF4UI9mtQNy/W3IcsXDnTFRVeSKM
 1eQm6FaVku2S4qWsAtHR+SzdsLC96B51hCtTicgXYl4wORunMEd49m6ezEvMdoWC/6+e+gpkvt5
 frK34d9QcPjj5LQGqmeqOynGuY/zHxnoHVSFVz3JR6UAjLbY+Je/iVQHzSXA0okK1jbCCdV4Szx
 D8hSu35rmfbhcePa7CEgAqZ2BtBYZaYr16e7ukRx7BzJ7JKmqNz3eN/8XXU6DPr0lIxNMfw==
X-Received: by 2002:a05:701b:2313:b0:148:722b:7cbc with SMTP id
 a92af1059eb24-190a55c1a5bmr2822694c88.14.1792599629969; 
 Wed, 21 Oct 2026 09:20:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2313:b0:148:722b:7cbc with SMTP id
 a92af1059eb24-190a55c1a5bmr2822635c88.14.1792599628965; 
 Wed, 21 Oct 2026 09:20:28 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-19035926035sm6616304c88.1.2026.10.21.09.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:20:28 -0700 (PDT)
Message-ID: <74f3979e-f6a6-4abb-b82b-6dd3316ac092@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:20:27 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/33] target/m68k: Use a static table in
 m68k_exception_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-15-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-15-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX3aG+aQ4eLwLi
 CWkHYOQQY9WExZQI6w8QmIv+y8fEIVmCtEESKssY5zEagH2XyFynaHUsETixb/5gzmqxDZWGL82
 w8EXbMnOfs7jSUn5YivgnTP+GVxDlkc=
X-Proofpoint-GUID: 8vja-rvSAPJRyiL0KJ2kJtypW7Fca4f1
X-Proofpoint-ORIG-GUID: 8vja-rvSAPJRyiL0KJ2kJtypW7Fca4f1
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8e64f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KAQCesYWj6jVgYwCRpsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX69yj/gtcxx51
 tnymOJrihGzVZjVTbAiva8VkDb8tA9C2CtmaZF6/TztcBiNusLAmwkN9he/waTOn9d+fbxRAvVf
 Tu6CGovM+aKjVbqZyBk5FncINTgHpkgmK/OMTyJnMW67QnUb2A+ZJeLR7lgYhjQOXmXT4NNwT5C
 5bdcCDdI5LBzRM8YFftv/1nn8TBb7USpBUEifNBUiKgyHbrylLIuxqIKCfhpXSP7dUWIxGj5OWM
 atDm9uCiOoWdpXTGv1Jejzmev6AELM7aYkD/FWAupsI7JDwACaxQrRhN2L728N03HhUPSXKuWJU
 JF5/QD/qqxDK2w3Lonk0ww26gOZjrRZB6gaHl/GHewd7+0qKUbTSBkZExvMsYNi3ICoM1P0XY6L
 FWVbKmzPEAfvGdJvB5xYh39DZ8Y/o0vJlDsqxbDjsIFysG0PmVMG5dUi76PRqkYrQ7/2VPsp5Yc
 0sy8gGNQv877OEGJ4TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
> Replace the switch statement with a static lookup table.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/m68k/op_helper.c | 152 ++++++++++++++--------------------------
>  1 file changed, 53 insertions(+), 99 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

