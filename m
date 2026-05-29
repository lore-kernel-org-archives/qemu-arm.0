Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967BDCD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:30:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT1yF-00006K-O3; Fri, 29 May 2026 14:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1yE-00005T-2L
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:30:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1yB-00079H-14
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:30:09 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Qd01912461
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BASaeUV+sd6PCcE49dvGbjsSrGUAqcny0XRVjurx+GA=; b=UCL2LGLzVgojOtD1
 4RJUt1PKZtHOAIy8pTJllBQuCamUyxVpO+cy5eqqd/vWp/TNs26mnyQj7OZ4Tadg
 yC0G1ypIeDwsm/MNshuE45dX4uJMzLLcKsNUaPYyAPJdMGMaqgYVUc5+ayCRFCr2
 HxUJSFUcZb3tMuLVR/9uQ+uBapOUupHnKkWDqI/ye5wjrSk6ZceuilgZoxeM1Xk3
 +2Lehj9diRrPe8F9ljJ56P9urb1pHbLiQD9EftRUAopZ4wubmxVpu/2z0ru2JZHz
 2OtyhgXG0pGjaU2YyQbCtJgcbC0FvFgkkcIPZndDyFBMU6kNqS5L9oxD4mzj8N3Q
 7yfesw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu51q3y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:30:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304ea1eea05so2845257eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079405; x=1780684205; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BASaeUV+sd6PCcE49dvGbjsSrGUAqcny0XRVjurx+GA=;
 b=ZAqfbbNGcM6aYLWybVneGIZYkhWjZjotvknuW/USzbCSYIcoUdIwE/zk35ofKXN9mb
 meCxW3mWlIC78mr8LBa9VxFDfp5iYUv1dx7GexmpTNWDoKm+SDReyAcWD0hoJqiqvvQA
 X8o4bxR+nIlo5rn5hs4AJaXyq9dPr7+aSG5snUaI8q1QFwOAeXFHfAyw+oW9tHnUbiQ3
 P1kdlggBl94RKgkzRQqRf5ErXsaeUzO+Dh/nnsSvOjU5PWWBBov+aB8Ta/qYr7bu+25r
 4SI5gsAzye3ayymKKnJu/sBn4RtW2ZOkxw7fF7L5yJLNkebFppU0eqhp+RvkS8YC/VLN
 IW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079405; x=1780684205;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BASaeUV+sd6PCcE49dvGbjsSrGUAqcny0XRVjurx+GA=;
 b=kKNY0BPLvqW+mzVPhQxR79Ye1yafnAAgV++ssem3YxtSAzRVxl15mU3G3iWa/HVN29
 WmPheqaMCJ7MvxTNxnxLRYQQNlhqRLrBy7nJXjFYp9FzlnQuXmaxbWJlJxCDWhcdceQZ
 gExYX+7VBTFZLfmwUnzPKjooEYq05oeRu61H9kMsGwQ+3ZTYWsQcO15Qx0TYOcJ8Ap5C
 5NO3xttvVep+Ctgfh9TPjBwOMl3Z7qqDW7iptRxW0pRSqH2uwTjM1IcBrm9+yw/NI+4U
 7FcYZvD4mvoMaa2GjRsIme8C5wTFzd82XiKqc1AA4Wv4+cuDkxIHyOzADDsLnCUQrjpV
 D1oA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XTBeDC5D8RZ2FQosGu/CZeAPS2naMSD7eksdLY37N0LuBSsBM+iwttl7ZLomIVzYG90xKq4Lc1g==@nongnu.org
X-Gm-Message-State: AOJu0YzBGGYTkQBARNBYC1tbdh5VHusR9stDw7fifwnqAqOcPvaeOPhj
 BJQr2lNQVCjsaQXdZeOgMMSiKbl8ocFc7NrUz3AeIrvY0ByouQaydylD13Dd1V7cHr6ome9C9jQ
 PSr4OsO906pzfaQCdOnZBbaLYSQT5z8/qz+C7xlQAQemHHVmyZuIDFgc=
X-Gm-Gg: Acq92OEQ2D6/1P2F0LfdUE66gKywQq99m7sVUCFhOuXF6sHyW+J1+lRO5yHvdjaYOSl
 xe4Jrx1ZpyomipVDDSFE/4K/uomnsxVHPYSYVPL8NcWCZyygebhPUkTaPc2wkzkoQvF1PY2w7jJ
 BePcFnP4JEHWdWJbuqhSR0vLtSEhVRjcbbKCByP3pVRAkQ6VSCKJRgneNVaB5VvxEeh7QhvvocQ
 fGH8OXAVELFjm2HysFIPcVBTxtt75hoCXcGfuFm2GSsV1YHLoGe90kFBaBpxrQcL/r4eA7eQ3oU
 hLUqsHznqqbnbe0e1WfYcVKZJybLCBAb2FjV8tz9qNr2ikBbz1g60IohAb9j0WM5vutMPFGvrsG
 0/c35WyrS682d0a3uGt4XCA63vtrXB0rMUO9pRLoMZtfxRfH8ZXIMa3Kq2fEdXOY44SZz9QFl/k
 ZONG8UBuuN2R4RqSdJZsIGTxaC
X-Received: by 2002:a05:7300:2201:b0:304:e7ca:4b62 with SMTP id
 5a478bee46e88-304fa5293a8mr473963eec.3.1780079404445; 
 Fri, 29 May 2026 11:30:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2201:b0:304:e7ca:4b62 with SMTP id
 5a478bee46e88-304fa5293a8mr473923eec.3.1780079403901; 
 Fri, 29 May 2026 11:30:03 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2f2904sm2047126eec.9.2026.05.29.11.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:30:03 -0700 (PDT)
Message-ID: <305c1c53-1a3a-4413-a365-11792b5155b1@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:30:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] target/loongarch: Remove unused
 'accel/accel-cpu-target.h' header
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
 <20260529142434.87880-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a19db2d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oVxXrErn6vik3ZSoqHYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QKE6LHiU2ko-xWhlsNFrZIMWZibrD83g
X-Proofpoint-ORIG-GUID: QKE6LHiU2ko-xWhlsNFrZIMWZibrD83g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NCBTYWx0ZWRfX/Ki+WcppO4ja
 NUM1RV605pV1JRQfzJy8PN2jssNgMRCU3lXnPhUthoIVywquPYu35iygPvjEWJuE0Ue76NsfKaU
 oOzlZR8ffpQhDt1tCmIYIiZc8dANDts+tiawozCsbdGzDPZ/itAHORYhTGlZbQ9gWyoVdmBh4N+
 jvs4O0gfIRJT1xrwcwxu5zA3xf1Y7216MmGq11pDl+dCAmbBr7bCqRosdlUueV2DbmK1usGZBau
 ockoyEbdqEZIOW5JfAOdMeMSW9W5aNGvPWlYw17QOlBjyl+dV1ReIcrwXqSLuzpojmmKsDPNpza
 cxGWLubag2Myq8+GG1G45OtUNXnCFPM87cLxFMnmKYu3wNAmvIaBXD3RLXKEPhh0J6u8iiv7cFg
 tG242bcnyOcHE0AtWxiR/2qdkjrG8p856eEKebFdZPwNDSV3yBszhNKqVJ1fm0oumv9QlQgZIIP
 RGY3woKPGcveFgI5nvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290184
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> "accel/accel-cpu-target.h" is to register accelerator target
> specific hooks via TypeInfo::ACCEL_CPU_NAME(), which LoongArch
> TCG frontend does not. Remove as unused header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/loongarch/tcg/tcg_cpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

