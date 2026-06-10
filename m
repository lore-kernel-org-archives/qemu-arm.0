Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB80CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 17:10:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXMR7-0004qn-2M; Wed, 10 Jun 2026 13:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXMQu-0004pE-M4
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 13:09:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXMQr-0002tq-M3
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 13:09:40 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AFwklY104464
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 17:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S9So1qU7ASlswzgVgsmN7Z6DsWQBMtFAct6WUEE8Pdc=; b=YU0io8zCaB20pYHv
 HtdbpxdlWPKYCz9e0eyiwg2UpYTRO90TDUN/ozmABcGcD1ewYEEYXPy9BUT/Z/Ul
 VoAHR9xNDOn+tOmr+RtaCXT7U6VXYaM9X/JAEoteVEzq3RAboxKHw+BNVTU8I/z5
 oTURyoECfyn0pR2q7UjiBhPyPvYGXkyJdispap4BXi5zMMs2GWf0UL5vCtPKLR8w
 23fqSKO/iwjwFCaNVaPXOMt335btSlIFzBs7MvoHoFqpFRCqmY3Vh9AtWpibNR5Z
 D95NGtosgBlqM/+3EAdvGRTctT7LMXmkQTa/MtEPjL0Vm0rSDTq1ZKXBgdzUa5Uj
 WRzgWA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneuqtn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 17:09:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304df51ff3eso7586145eec.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781111375; x=1781716175; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S9So1qU7ASlswzgVgsmN7Z6DsWQBMtFAct6WUEE8Pdc=;
 b=X6KuHMPJrTZF6M1hHiB3IKhSha6mRkIVkx6pf+7jBscQGCJ7RUxMdGpoWAVQuHzxA3
 jnQ5tcfU3i2RqBOh2b3mmCdmE7SaqDTG9bYGzTzrzaOQEEoaWJKNNaII1/qvvi8grc7u
 FTrDHbAw2DozK7qkvsXR93tK9VfAzaXkXY0Cv+XCJmrnVvAZYis8BZAcB5suumEnwTza
 g1D5kfBwZyM3JhSatT8P77yPFdydTmE5SDwN4zuySK5Z6qBCK1pFYB2rUtRp2t0xlJ2M
 R0FEPV/L/rwILAVnRFrDlusIPY7WKD2V4BUc8enkluhEJ/bh8QW69l6AeDY9Igy+TDwv
 Z6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781111375; x=1781716175;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9So1qU7ASlswzgVgsmN7Z6DsWQBMtFAct6WUEE8Pdc=;
 b=Df16ocaa5r60pOWGbBEneZBAJD4l+cx2+7nCMKN64Y6Qa3gZ6eqokwzf47vFCNi3ga
 /5nI8ECXJzi8Hq6BlIoE2S+s3lCkHko7SOUU5wBvhKn7+ZJZfgRUTjv9VYJpH5vblPxv
 8yU5Qml5kyPTtl0Ua4SLYtmGNXt3EFD7unFEkxeTSZf4dB2BVvN8QqG/c6U22dBAF2He
 50p/+vs8S40K8pVWwvf9+LsyefuElpJzpkebu+YGlTa4Ypq6SI3OMm97q8TyXAeSyCXB
 cONQTnTS2T7/j5Nz3eRibK1sy4RV7fcygzgVkGZnH1ls8CNX5eFSn48uqgVpWAcIb4Mc
 hzfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9eUNK0Xhg4DxclitKntOtsQQRLI0LWlJ1IvzcoCAXaqVb2b/eBGt8o99qBec3+rSZAwerfApc6sw==@nongnu.org
X-Gm-Message-State: AOJu0YyLvGViyinuLY0vsnvPLrkejyYHABNY8ypoQnImsaN93Gl6QUOk
 j9RFo2b1Q8N6sI0/LKHUhvK1DgA+EQMe3sGT7oOqCrY6HA2Adah9UmnwLvuNhKTCqyril+N5x+u
 wyetht23nH8MnoSyIdMEk9N3zGL4I6A4Vc+Yo53X11BCDAsvTk5n25Mc=
X-Gm-Gg: Acq92OGBd2TRxJugWb+ngV0KcmCrH+DgR6Mcsn9zPCF3filMsYc06LjQImntpoewZUw
 fLyllO074Rxz8oWhcRfRLiIkzlt76hvpgflffUk28t63d7vXrPWs2pg3VUYZYaj0qt5vcyDs0aU
 AtMhgtQ3o/JJflUSgE0J5k2nFxvWqHuz8noz83YfSrSjXVMnzKKoQlurzXEhd+s/Lp3CrNPXDYo
 dw4asFeb31SxbopqylipdMSB0qBLOWyjoxGawMVdHipaX1zkU4wXn+KChlgrm8+a5thzpf172Q6
 Oa59CtdKmaTSiD9H52PAli0/xylFORxuPFOd41Tzx//cMwXBwP8IT1kdc61QCLmK+7CfI6Ai2lO
 ao7JByzIXC2fV7dJIpTfwG8/jxIvwPN/Yd3OXHspo0B5LW75i5vJAZOzpuDOsFTO94kDGDCSmfk
 YLOue+8bWWGT0Ire6PfDG4+wmA
X-Received: by 2002:a05:7300:214f:b0:2f3:c3d4:382f with SMTP id
 5a478bee46e88-307ff540686mr45026eec.8.1781111375085; 
 Wed, 10 Jun 2026 10:09:35 -0700 (PDT)
X-Received: by 2002:a05:7300:214f:b0:2f3:c3d4:382f with SMTP id
 5a478bee46e88-307ff540686mr44925eec.8.1781111372924; 
 Wed, 10 Jun 2026 10:09:32 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074db528dcsm32245631eec.3.2026.06.10.10.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 10:09:32 -0700 (PDT)
Message-ID: <a4517d21-d243-47c6-ae0c-a795a40d41e8@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:09:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/27] tests/tcg/meson.build: add wrapper
 check_plugin_output
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud_=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn_=C3=A9_e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-21-pierrick.bouvier@oss.qualcomm.com>
 <tgenkp.crsxljvbliqb@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tgenkp.crsxljvbliqb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 76jc6D7HPpb2sYVDJ3_ruQK0aH3nlrvd
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a299a4f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F35cBGiUz0qV-L6tl88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 76jc6D7HPpb2sYVDJ3_ruQK0aH3nlrvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2MiBTYWx0ZWRfX81ZcK7EtSObr
 p/wAqeDB5Pg/tyagptqLT7Cr+Yu0H5UOMm0THrbTybf8vag7OtVD1Kz28pNDQwXZXxQzHxQi56H
 jJOJpxuSUaonFob4czBgewTc7yOEgtJt/CRk+uP2pBQn09am2tNB39dMadx80hmNwdIBf0k6oN5
 6BKsu0gbuGLpp1tC7nN30mzuUu6b3DrBtYSAN/TAV8EBwC+VvHY8TrF5UkcGXG53vK633Ymqmnd
 Fd6w0a6xYa0Y+XDW9IPmpZsRNeO6EGWXha3o4ygTXS7YFb9UeAfXM6A/Bj1L/mHB3cDvf2EXrWw
 5XAoPI2lICtgVb8zEatKctsRdXW/t8TdDrMJWXUfarQeLd6WOlVs4b2EHSA6PLijI6pGHB/dNEY
 2ul0fQU5DMQC5Lzm8UlEjy8ZKhchjUb3+7FcKkugP8Edojfo940MVEAHJkItBn1/1b4rAdA1s1w
 vljJxeT6u7oJ9ynKm+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100162
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

On 6/10/2026 12:30 AM, Manos Pitsidianakis wrote:
> On Wed, 10 Jun 2026 00:47, Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>> This wrapper runs a qemu command, record command output and plugin
>> output, and forward both to a check script.
>> We use this pattern in several plugin tests (for instance, with
>> validate-memory-counts.py).
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
>> tests/tcg/meson.build                    |  1 +
>> tests/tcg/scripts/check_plugin_output.sh | 19 +++++++++++++++++++
>> 2 files changed, 20 insertions(+)
>> create mode 100755 tests/tcg/scripts/check_plugin_output.sh
>>
>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>> index f0efd46ee3e..6e46c121fda 100644
>> --- a/tests/tcg/meson.build
>> +++ b/tests/tcg/meson.build
>> @@ -6,6 +6,7 @@ if config_host.has_key('GDB')
>>   gdb_progs = [config_host['GDB'], gdb_progs]
>> endif
>> gdb = find_program(gdb_progs, required: false)
>> +prog_check_plugin_output = find_program('./scripts/
>> check_plugin_output.sh')
>> prog_gdb_test = find_program('../guest-debug/run-test.py')
>> prog_record_replay = find_program('./scripts/record_replay.sh')
>> prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
>> diff --git a/tests/tcg/scripts/check_plugin_output.sh b/tests/tcg/
>> scripts/check_plugin_output.sh
>> new file mode 100755
>> index 00000000000..4d12e23ad60
>> --- /dev/null
>> +++ b/tests/tcg/scripts/check_plugin_output.sh
>> @@ -0,0 +1,19 @@
>> +#!/usr/bin/env bash
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +set -euo pipefail
>> +
>> +if [ $# -lt 3 ]; then
>> +    echo "check_plugin_output: check_cmd qemu_bin [args]..." 1>&2
>> +    exit 1
>> +fi
>> +check_cmd="$1"; shift
>> +qemu="$1"; shift
>> +tmp=$(mktemp -d)
>> +trap "rm -rf $tmp" EXIT
>> +
>> +set -x
>> +
>> +$qemu -d plugin -D $tmp/plugin "$@" |& tee $tmp/output
>> +cat $tmp/plugin
>> +$check_cmd $tmp/output $tmp/plugin
>> -- 
> 
> Could we write a single python script for all the shell script wrappers
> and use a different kind of wrapper depending on its command line flags/
> subcommand we invoke it with?
> Maybe this could be better? WDYT?

We could do that for sure. Better or not? Not sure, but I don't have
strong opinion.
I just picked bash because it's more concise than python for this.
Before putting too much effort into the wrapper part, I'll wait to see
if the rest is working for maintainers.

Regards,
Pierrick

