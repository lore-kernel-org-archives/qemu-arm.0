Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F6BCD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:39:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT26K-0007y4-93; Fri, 29 May 2026 14:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT25y-0007d8-6n
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:38:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT25u-0001Wh-3I
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:38:08 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2QYu313016
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MdkS9YRVUYxdK0i3/4cdSDl/lCrKtzJ/CBf+UUhWVUs=; b=ELMfJz2hkjG3GunL
 PvgRJvgI63lTQ2FzKeMvXaWpgpUNc7whcA1YXgu3ZwKrIyeyRR0z5H0BaHY7B5qx
 diNJG89wbPK9jUySN9jVMOzKANzq8kA0Wk+Rt9o40j9QQysGT+Njb8RLMUxbbIQh
 7tBMtMTCBPW5fI4UzUwLD2AtEUgJjdEEK6W+kMO5mHkPflgRoI/RkN59uyxB9lGV
 cg8LaSTRYMgAXdUZ/1eycC7sJETq7IgRh+QlBFleb1G4tij9KrKzRFdWBRsp6Nvb
 G1wwNt7FfXslys2fu0dFlpy9thZldqRN/9LmHG4w6khZpnZ95WdlhgtvJEsrYofv
 X7JJwg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m56va-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:37:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304f23c55b2so862045eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079873; x=1780684673; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MdkS9YRVUYxdK0i3/4cdSDl/lCrKtzJ/CBf+UUhWVUs=;
 b=SMNEXEXDGtgt2uaed9MOffdYoVTW5YLJalhm2B4t0nsAvdcKfNClZm/L+zk2jIeBCd
 Erwo16JMrHp+MESYiol/bMLXSeMNu/w7ma9FbzGG9Oc72LKSPkMXWzoP3sC+yqUiFfPU
 II73yg6Oqd+gYZpQxviMVWpnjKnBh1blAYW5NGQ7m3pW79byuEGOalh8TfMTMkt69dtO
 eqn2bgmTtyWMA5NFj4kA8TdTNz3XIPFF+PuH/9zg1TptNF9B+vKQRzd6jBhSsg6HB936
 z2Bitak2vPJjAfxcyieoJtB+zhKf/dR+7NjQbAylwq3Bfq7hZJMM30ll92Ne5rhlnPks
 J/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079873; x=1780684673;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MdkS9YRVUYxdK0i3/4cdSDl/lCrKtzJ/CBf+UUhWVUs=;
 b=nRFIwbAnUaHOW83QqZlozHSipUSuIPLpIj8sFUJXoemnfX8z40i6znibqrpCr3bKv6
 gie6JSWdMr1eesqDDPb/vVUN105vcOjuqVsTXEOVrSUuCBrj/NEQpl+SAe4hxx1cJO5/
 icLi/jhWWKk2UsLCAcbz76pScerXa+bA1P4lyGAgXhlhd7hiwP14gCX2baA5H8E5EG/f
 6ALk6zO9aEic4sa21oONqGK2FvyivXOo8zdGSgj7KY4vogjiTpXF0MIo+darNddmY6Ii
 +6WTDN+z0Tx1BiNXg8qNpIeRZqQ84rhVFzJagGvjoGoM8Hdwr7nc8ksC5Z68cFC+uwhb
 AS0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+72WYyhuvuIEZRLPPZ2zbHaJE07xtyHNqXHOoV/TgLlvg4MfUC47ncaBbcIrFyfPTJM0NCUMzbQQ==@nongnu.org
X-Gm-Message-State: AOJu0YzFyCcPUVEOY6l8pdoN+vYfIz9KVrQICiYplof4BIGpHkUouzYq
 1pMy+0SCBK08Pln9JtxxQ9sWQMKp93Oj9KezaZrTi3R+kFSotDH9CSHJ31E83w4//Lv3fPSMT8+
 PPX+V6bkuo9WZD/7+vqDm8CPSSKSdT6z7wcElrrH2qyqfW1HiIHuWmI8=
X-Gm-Gg: Acq92OGre7OnoikbSuxsAxN6a8lh9zMZ4exuLXg5PdwoBxjQiEaaDQJmLY65gWvuuYi
 dhhfkBKiYqJeFn9qoLrvmRdEBGySb+Fnw4ONlzGjgdyPNQdT1nXbBICvoeow9bmYD4r6wA2ar8G
 wLXXE8gSGQ3Fq1COzVb1Z+4mBiITkL+KLqCQUOI21DVaOby0sDrG5K+lI9KJ8rjYy6APQZ0Tnd6
 lvZkm1jgNRdmK1dJOeh91v5CKWKjFhN+2jO7NfuBDfnUeH+cjkE0heU5ZCxVtSagnFfaKf5fcYP
 PTb/15X600SjpvPxDi5IISR26ixew9e1OEG8sVd69cJnXfQMs7jDR7DEkqZvya96pw0APq/vBm4
 MN2aSX+eAGH48U+2+EubI1ijf4i8pcdGqSD69YgY3ckCInIf/6CKipzCm8PuweSnrg9s/DYgIpM
 pQ0QOKLqnLNlbcIRmYyX8nUaaf
X-Received: by 2002:a05:7300:724d:b0:304:bce9:25fa with SMTP id
 5a478bee46e88-304fa525843mr505031eec.4.1780079873310; 
 Fri, 29 May 2026 11:37:53 -0700 (PDT)
X-Received: by 2002:a05:7300:724d:b0:304:bce9:25fa with SMTP id
 5a478bee46e88-304fa525843mr505000eec.4.1780079872822; 
 Fri, 29 May 2026 11:37:52 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c120csm2076783eec.4.2026.05.29.11.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:37:52 -0700 (PDT)
Message-ID: <45fce4a7-5f44-4a07-97fa-ad639368f7b0@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:37:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] accel: Remove AccelCPUClass::cpu_instance_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-13-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX8ke8yS8B6UDy
 qAfeIOBifon1/4D4bmNbZ58NU8ndIpliIaOpB1I3BmWidA5uETNGYtVHspq0grFtHArH5TuTqSR
 n8iY/Jk45bE0TxL/RzEk7G0BFWskjDaOUvfLEm3fBi9aModunGiSKeAd5e00IQBY6o1zZZ3W0EX
 cbZcB5xrzf7rAWFz1aVuRNn/XAnNjGi/kBifpQWEnpGxtk9bKHD22UicGWh9KwwG0EIzyhCc/65
 YjK8tCx+PEKdX7hS0dU0fz8dEvGET7JDMLdSvZAYvtIp+mTWLwPftkES/S5aF+oKPmS8hL24YSo
 pPr6Dkp6Qnj1PfqnV7xa+zZxHoWVb9M8gMO7BI8sn/zSpm6XidTmKMs8bLjY6zDk6rLqM/6/R2T
 BLVraQxdgc2GM0AfdDBTx0tAoPbpwy7eOVVetV6am5+gajQifdEgi7g8ZPESiw2wJDOURc2ih75
 nV24M8nEtEBHJF6MhfA==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19dd02 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=M4ieH9tDHB7thNhbP8AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 64WLoh1sa53ym53VY5rcILq-x60ZPYY8
X-Proofpoint-ORIG-GUID: 64WLoh1sa53ym53VY5rcILq-x60ZPYY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> We removed all implementations: remove as dead code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu.h | 1 -
>  accel/accel-common.c      | 5 -----
>  2 files changed, 6 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

