Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD92C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:43:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdGCm-0007iO-Vl; Fri, 26 Jun 2026 19:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdGCl-0007Y0-04
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:43:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdGCi-000508-Ii
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:43:26 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwrUv795001
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jW0sYEXc/QSeL/zmhrpCsmnjkjXSEwa2XOdmP5Vmw+k=; b=T6vO17cJ33fbzycx
 dlDkHo5UIWiFMTLSBIRpi4YZchjEX28DqNTKNNyZzlZDeDCXR1R/ecwAa9brt8oa
 MayQ92hHFWBj+gyBTGqHG9FFls3sK//Nj7xs6aa6T71R8zIcmiGKts3RU5GdWmtE
 17solbgInMQjp/r7MUPdW9eBLZMpEhXb9RulLAQulezuWCYmvc5LpH7uJITph4G7
 hAHzY5I3j63A9qKbq2jwXzEu5lhjSDxk9ToVMsYlqKDjm8LTAfzCiCI7cbjhFslX
 ldsJWf4ArjqGoYLg9i2FDgiejCVkTYqX8jBx4d9NETYMRUPO/+yR4DXRNZj6IEiv
 SB0Cfg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups9kuq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:43:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1383723dfddso1638043c88.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517402; x=1783122202; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jW0sYEXc/QSeL/zmhrpCsmnjkjXSEwa2XOdmP5Vmw+k=;
 b=FHzVjPp8WVr4Ybp7mpbPHHpk4NOAlY4zSdUTyjW5DNMTCQgqa/VEWCFGJtO/gBJqo5
 9clokph5c6N6WQ5d4rX7aAa3xUexC54bgFGWFDpr/lnHh3Xo59QXxUGRKCc1ghAfo0Cx
 FjR7eysp/3+MEohCyptScwNHGPAsc6aTp0A9S6ULAi2ROzdKs8UdsOKhggbEpZbvTw4E
 XJM8ciEe/HzDu6WfDNATpRxlfMG+seyH79V3phzxToxhMDGRd0R6DtPa8Tu90wtFJLJp
 WqyGo9JYkOwpUYcW2H87oGFjTMH4SZhoSpZKsDyGC0FeMT8hd8sgqa45hNvoXzg0TJbt
 SYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517402; x=1783122202;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jW0sYEXc/QSeL/zmhrpCsmnjkjXSEwa2XOdmP5Vmw+k=;
 b=ntx8hPRLq5RDhyFeElQbvXomOAZeSzdv9a6QV5mjUXZoek56I2K91Ps208/feoIgev
 M9nf0sqhNYlSq/JDlJF5jZKICGdi01bZx7KmZ1tGlUj9nVQGt3qdTdbjphCpyqo6E3TC
 KKjMDmf4k1ZpJQ72albqia3nFr/lV6EXCP+Oc6hsIdF4V903NRnNfyp902zJYygm5ROP
 1ovURD1+xTU86gphYvjo6+vqxoLXA1Fk4Z7Mmq1JgXr1CzdQuXyoGAooNnZdBh+ew47c
 ON72NGcpKtXrPppUY4qxUohsc4y0ANJFVYAa4wy0+RDC/zy/Pq4GSvcsgG4ZMvRKOnm8
 oNyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7KYtCCyaZxk3FhO9wQ8iUcqtgRUu2lCRiqCdxfmTNglS04RE0tyMoQkcZM5+DKOpwUSO6L0OERQ==@nongnu.org
X-Gm-Message-State: AOJu0YxFc9xwMKz4v7vwp75EdQOQLWhIjzcq2VPlHfpEtejbdtd+XNhh
 BLxoA4C5OePTcovpEcNXzW6YGUMVFR7lPK2lCSSHRglQqV8IkXIbB8kcJLcDD0GclU+wi7umhMx
 uzmlbPV5n5BViAIJ0Vef22JtkT6zozbbKLAPVf8ptQTfTrmtDfwG2UsM=
X-Gm-Gg: AfdE7ckspBY4CMjvCj24Hhk6/m2BiB3sgMY1wLdFGRERO/Fs8mFH0rcwusiQhfAlDt8
 c/ME01V7EBMT8Wh4Tp2RG/5YSBaaR4208e6LdnAKhwnsClvwXZfP3f3wJiJ37gMrrw7tFtM0cP7
 4jf7u+NOO887L9hWsJrUb0omfKcJyoW/G+pCa9tRt/+OcCqIxkJJRlecDjXtgNcyuNArn4Msrl8
 mUFCYmATZBcg3HR6Nfp8LGJzMHl2hZKfNe9CfpjiHZxAeIC8A3T/FTNReTA6PvZqzVIqaUgeCH4
 ZKdB2Exl+0Jt0t0Pu/cJAA1ix2prVcUDTDeovcmEGwAqD4NPnEkzPMEPARePUmnh/zwT0n9N5gT
 aR5uDjmPGoVNIr8bYvCSrMO/VWT8Qrf8kelfwLUksDA8rpBuGerP8znvrv3/GqGxzxPW6E1XdR2
 GFOys=
X-Received: by 2002:a05:7022:6884:b0:139:ed59:4b8b with SMTP id
 a92af1059eb24-139ed594ca4mr1338627c88.47.1782517402325; 
 Fri, 26 Jun 2026 16:43:22 -0700 (PDT)
X-Received: by 2002:a05:7022:6884:b0:139:ed59:4b8b with SMTP id
 a92af1059eb24-139ed594ca4mr1338597c88.47.1782517401688; 
 Fri, 26 Jun 2026 16:43:21 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-139eac62642sm5147498c88.10.2026.06.26.16.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 16:43:21 -0700 (PDT)
Message-ID: <8e9faaf9-838d-4283-a2ec-062ad84ef7a1@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:43:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/27] tests/tcg: run tests with meson
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5OCBTYWx0ZWRfXw9CE7LA7yjXU
 Y0jXhb3zWhdlZK6MOoEr3C8btmi2BWRxYWyXySlRplnN5G+0e6VfazabwZnxL3ARRfSAEXFCt2S
 tMHL2X7ddhoJWY/Yz2r3XcxOAPUeIrigKLomUWwFMLJZiP26L/XgGbPhHb0xCZ9aF0wNhVMv0uV
 lhHIDkXWw0B0xerH+qSCzITVIWxPEtXkgRY5i9fPNu8Hbp8GOShgXwLjVXxULFicfz99MNGIUyL
 L/0LiNktREgwa80Idao8dFT/50Jaf13/w8RtzF7C+8WSYwNEOWdarwiD4wE/WnerCA/CXaM2TO0
 oqedo8RUeg+T8q7XjgFXahYLmJz9WemJTKJnSCXQj5jvARkwZlsU3eBLLh8U/uImzZjgAAienij
 Ee9uUlXmrbqnDrtt8U3ch3yevWZ2zOztO7uU3Rr/hZn8NVW1V6FnM9gDB2YA5l7d6jjWQUpytkF
 lBh1KtAvRob/iIVHifw==
X-Proofpoint-GUID: vxVcUJ7H6kcE625-XyZbYjUuBA7teV-L
X-Proofpoint-ORIG-GUID: vxVcUJ7H6kcE625-XyZbYjUuBA7teV-L
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3f0e9b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zFaKt8w40am6rI-d5P0A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5OCBTYWx0ZWRfX9NZrS+Y1Cklb
 4i+t24Dgsikl9UmRWJ4j810/f93Q00T80JxrMzmlZEdAoILOjdJyy3cTXbq4EguMdNNs1NBEjOe
 i4s3FTXk1RGR973C1IIrLhVgKiQhkno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 6/9/2026 2:47 PM, Pierrick Bouvier wrote:
> This series is an experiment to replace TCG tests makefiles with meson, with the
> goal of having something more readable and maintainable in the long term.
> Also it closes the gap that tcg tests had with the rest of tests, by integrating
> them with meson directly.
> 
> It covers all existing tests for aarch64 architecture, including
> user/system/multiarch-user/multiarch-system. I'll carry the effort to port all
> other architectures once we agree on a base. We agreed with Alex to not merge
> anything before all arch are covered.
> 
> Series first declare the global infrastructure, then add aarch64 and multiarch
> tests, and finally plugin tests.
> 
> For review, I would suggest to start with aarch64 patches (end of the series) to
> get an idea of what they will look like, before the implementation itself. You
> can also compare that to existing Makefiles, they follow the same order.
> 
> It implements all requirements listed on original thread [1], except cross
> container support, which can be easily added on top once we agree on the base.
> [1] https://lore.kernel.org/qemu-devel/87wlwfsay4.fsf@draig.linaro.org/
> 
> We also have for free:
> - correct and complete dependencies for any test, including:
>   scripts, c.inc, headers, reference files and binaries/plugins.
> - catch test declaration issues at configure time vs test time.
> - proper data types for variables instead of string expansion with make.
> - we could now build tests binaries by default with 'all' target.
> - hopefully, better readability to your taste.
> 
> Main ideas for the current design are:
> - make arch files as simple and explicit as possible. If it conflicts,
>   always pick explicit, as long as we don't expose meson details.
>   remove any kind of "skip, override, filter" logic.
> - never expose custom_target and meson details in arch files.
> - catch any spelling mistake on test or any dependency.
> - keep complexity contained in tests/tcg/meson.build.
> 
> Usage:
> 
> ```
> make check-tcg
> make check-tcg-aarch64-linux-user
> make check-tcg-aarch64-softmmu
> 
> from build folder:
> ./pyvenv/bin/meson test --list --suite tcg
> ninja clean
> ./pyvenv/bin/meson test aarch64-softmmu-asid2 --verbose
> ```
> 
> Pierrick Bouvier (27):
>   tests/tcg/multiarch/system/memory.c: remove unused variable
>   tests/tcg/multiarch/plugin/check-plugin-output.sh: take test output as
>     input
>   tests/tcg/multiarch/plugin: rename check-plugin-output to
>     regex-compare
>   tests/tcg: introduce meson.build
>   tests/tcg/meson.build: introduce exe_name
>   tests/tcg/meson.build: introduce test_name
>   tests/tcg/meson.build: introduce cflags
>   tests/tcg/meson.build: introduce qemu_args
>   tests/tcg/meson.build: introduce env_var
>   tests/tcg/plugins: build list of test_plugins
>   tests/tcg/meson.build: introduce plugin_test
>   tests/tcg/meson.build: test gdb support and introduce gdb_arch
>   tests/tcg/meson.build: introduce gdb_test
>   tests/tcg/meson.build: add default flag for testing compiler support
>   tests/tcg/meson.build: introduce wrapper
>   tests/tcg/meson.build: introduce expected_output
>   tests/tcg/meson.build: add wrapper run_and_check_forbidden_output
>   tests/tcg/meson.build: add wrapper run_with_input
>   tests/tcg/meson.build: add wrapper record_replay
>   tests/tcg/meson.build: add wrapper check_plugin_output
>   tests/tcg/aarch64: add user tests
>   tests/tcg/aarch64: add system tests
>   tests/tcg/multiarch: declare user tests
>   tests/tcg/aarch64: add multiarch user tests
>   tests/tcg/multiarch: declare system tests
>   tests/tcg/aarch64: add multiarch system tests
>   tests/tcg/meson.build: add generic plugin tests
> 
>  tests/meson.build                             |   2 +-
>  tests/tcg/aarch64/meson.build                 | 248 ++++++++++++++++
>  tests/tcg/aarch64/system/meson.build          | 100 +++++++
>  tests/tcg/meson.build                         | 276 ++++++++++++++++++
>  tests/tcg/multiarch/Makefile.target           |   3 +-
>  tests/tcg/multiarch/meson.build               | 149 ++++++++++
>  .../multiarch/plugin/check-plugin-output.sh   |  36 ---
>  tests/tcg/multiarch/plugin/regex-compare.sh   |  28 ++
>  tests/tcg/multiarch/sha1.ref                  |   1 +
>  tests/tcg/multiarch/system/memory.c           |   3 +-
>  tests/tcg/multiarch/system/meson.build        |  53 ++++
>  tests/tcg/plugins/meson.build                 |  11 +-
>  tests/tcg/scripts/check_plugin_output.sh      |  19 ++
>  tests/tcg/scripts/record_replay.sh            |  16 +
>  .../scripts/run_and_check_forbidden_output.sh |  19 ++
>  tests/tcg/scripts/run_and_diff.sh             |  12 +
>  tests/tcg/scripts/run_with_input.sh           |  12 +
>  17 files changed, 943 insertions(+), 45 deletions(-)
>  create mode 100644 tests/tcg/aarch64/meson.build
>  create mode 100644 tests/tcg/aarch64/system/meson.build
>  create mode 100644 tests/tcg/meson.build
>  create mode 100644 tests/tcg/multiarch/meson.build
>  delete mode 100755 tests/tcg/multiarch/plugin/check-plugin-output.sh
>  create mode 100755 tests/tcg/multiarch/plugin/regex-compare.sh
>  create mode 100644 tests/tcg/multiarch/sha1.ref
>  create mode 100644 tests/tcg/multiarch/system/meson.build
>  create mode 100755 tests/tcg/scripts/check_plugin_output.sh
>  create mode 100755 tests/tcg/scripts/record_replay.sh
>  create mode 100755 tests/tcg/scripts/run_and_check_forbidden_output.sh
>  create mode 100755 tests/tcg/scripts/run_and_diff.sh
>  create mode 100755 tests/tcg/scripts/run_with_input.sh
> 

v2 sent, with container support:
https://lore.kernel.org/qemu-devel/20260626233918.158740-2-pierrick.bouvier@oss.qualcomm.com/T/#t

Regards,
Pierrick

