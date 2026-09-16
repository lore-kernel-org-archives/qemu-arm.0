Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09FCC88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 09:56:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6mNJ-0006yL-5Y; Wed, 16 Sep 2026 05:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6mNI-0006y3-2t
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 05:56:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6mNF-0004mT-RY
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 05:56:19 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68G92uaD1721215
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +TTKxBNszfjnr9wqyXg1+ayl5UXHgpzgrnYw5VZcTmU=; b=bM4Kth4cYtAPplB9
 nOFVS5FnF4W4shUJXQISjt1jFdEhalNyBy7HwWxK4aoe8Dnlp6fRqmfiIqPGUm7V
 Eg8scs75oy5V1cj4V3Y+tVcDS2PpGbMCKM5GreSdoa3bkKv7fQXgqW4MMx8mnS2Y
 iMxb+Q80VoJBSvuzkTDTP9XbXoBYPjPpBjBUK2mW2U8vXLdrjBPSvRHghvsiWYSt
 GSo8Pfj91JzcnW8rDgFTjQhIyc47yl59xh9Z3xnOrUwPWjcaQCtmcZ/nw7+89/3J
 DDZPAYNuBHi2bRn98O6O3N0bMo9flZW/+z2/13z2xXQC5ty0LAa6dzxeZOFjG1hH
 w9nNPQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnk77f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:56:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cb48f41343aso1960637a12.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789552573; x=1790157373; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+TTKxBNszfjnr9wqyXg1+ayl5UXHgpzgrnYw5VZcTmU=;
 b=Hnf1n+Zu4wTv6A/qJ5+v6ycBhDKIAtk3eNDdW70dxpS7ZB8wKmuEOQnDHqFtUCU82C
 nnsZLq8MYn9DtwpBdXiIzy++31Zr85d7OeQb13UWslXL1Pm4HaD+xk4LgJnoaGSvc0rW
 Pcgnpde3B5EmZWiAIIAL4tpbUhlQ9+eopVSjZ4G8kiM8k+ABKZquN24ICgnSRoAvmXzw
 WhOqt027T+T+k6tkrlPiNFeVc9XZtvY05zoXJY9LUuVkPLgP+aQi1rNTvm+5bzqlrb5B
 LPGjwUsRaVr0XBbIZpBkgPG9BmqlDBVRKgmfrQEo5GMpaXbe2/eu/yxT+r+BXnOIs5TJ
 nmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789552573; x=1790157373;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+TTKxBNszfjnr9wqyXg1+ayl5UXHgpzgrnYw5VZcTmU=;
 b=vguHc/d8ZD1CXGCcZ+4jTfEJREby/gjsYhcPqa6vbMMP7+a8ZbKhZ5luQMBE+xs9pN
 jcI2cxMAwA+/NRHvmry2j0DS1UsuzwqUH2Eb8eOeeT3OQ0UICdX3Rimr7oFQnLiPLcVA
 6BApAkZiTT5A7pEY7j3fL/CMi8aN3wTIrRYHGEtUKhGDuWF/sarQ7EXrjb/14gNssp1H
 yrshcFFm8B0s2uWRPQCxCqu8OBfn/1QbUfeG5Zm1SJmxExvwUTXjh4/wIDP0xAQl+LDm
 lZw22krMiN6oWSfyrtszM7uFQLDaG7cayKdNHI0t+iw9aP9tlnrPsY3ThA9wqvoHhxCo
 fcvg==
X-Forwarded-Encrypted: i=1;
 AKwUvByK0tVYnMjo+dtjFXd2KShiILVLEGje0UawBCJG9tWHgJ+DMqLOb4sCsBJx1mqhpnotq7TEvcH0GQ==@nongnu.org
X-Gm-Message-State: AFuF++lmpI7zkNczABnGclwpfwxd3ZekAz3LM9bE1zaFlXd/ABqsDVVa
 8ZCgdk0smoV5DMBddwb2R4uOg6KJTE52ywIYpYExaxeuoxWe0QHYszgCRtNlIwOvITkvkqaXgNw
 /J+mpWMUWnP+Nuan+quf7tY1+14Cwn8vBS6PY2sadoTd2D9215pASyXg=
X-Gm-Gg: AYBFou0ORj+Y2ol8oY6VhXZX8F9xTKzVlChdRElm28sQCT988hS7r2nG45/BMmlHPhk
 +oZUDRBwjE/8HX7bOQYxdbiWR7ngk5cLTKDNWbhNs+ReL9qzIy64c22AsvK3h4wqKOEI0RI1npm
 Gof1tno2PZ7y+z+CoXzF09MQ+9s4E6icbFwJ2GRF0IwCd3oygXsmopFAi1L3g8Dd8ihaP1AAM+5
 bStq4KFy+IT+w01XApUuc1rTe04EjP8BWIN1YXAM5+BoiN7hKgy692o/TVSO2joQAFppuEbwn33
 wX/rVuKtjFtZr6Pfep7cZsW57gJT7YidFUq0W1ElQA4Y2I1pTadJfN0tS7IwTU4eaxruV6jBpEd
 weY9xslk35pTSHl0QXOKa4vwECONJEArtV0jU45MmVyJSuvwaxklnXeQF+03Yv6DaMnta
X-Received: by 2002:a17:90b:3941:b0:39e:237c:50de with SMTP id
 98e67ed59e1d1-39e237c518amr2416456a91.3.1789552572901; 
 Wed, 16 Sep 2026 02:56:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3941:b0:39e:237c:50de with SMTP id
 98e67ed59e1d1-39e237c518amr2416377a91.3.1789552572379; 
 Wed, 16 Sep 2026 02:56:12 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14395d4a48fsm5355500c88.10.2026.09.16.02.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 02:56:11 -0700 (PDT)
Message-ID: <b58e25cd-0b41-4060-9946-cc5675aea67c@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 02:56:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/17] scripts/make2mtest: add docker dependencies for
 check-tcg-% targets
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Warner Losh <imp@bsdimp.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Song Gao <gaosong@loongson.cn>, Kyle Evans <kevans@freebsd.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20260916085341.1692742-1-alex.bennee@linaro.org>
 <20260916085341.1692742-17-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916085341.1692742-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa67bd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=dlnC7Bs9CAUtgJ-sswUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEyOSBTYWx0ZWRfX/1iFXzFNyAXL
 1QGfYEzIK++y4aekc/mIDbXG5uw1aLl92gqMKYlsB4j4Zf508toBReTqIFKfzQuH7WB3YU7yuSq
 ZPb91CAlBzlDTcCRmd09ISeHUIWQ+Vx4ftL+55ds3H6DMrp/YSfaAGfMtIWMK7w3fyzLeGjvEzD
 j03eO6UaxJZQYc5SdhTLhLVR47fbXvOPAw9JArsdfpQMCF1Qx9L40SnrbFjaBtmQD4CgI6rHWnh
 INII+Y/OMUunIVsvZjII5SyPqzcj/JrJLsLUsmleSqOf0EFwfWFs7+1Z8K72tFq3aeAP5Ms0wZ3
 dXIUKD0G5+bJedwPcHBLCk48X4+HGY094yd7l0w9PxKcSOkks3ndYEa8SJ6smwSbu0IHTdh7AUB
 VTxfyEfX7AQIqfov9buNIx4g7NSoR0VBsUNkJO6UoQalva1/DPoCiyMAD+SBPKZRDyirjRtj5FV
 hVFTUs0F9baoFpo/srA==
X-Proofpoint-GUID: aUS7M4iYwrqQegCFXBH6YFSShHaF6w67
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEyOSBTYWx0ZWRfXxjh7PN6LQ3me
 D+J0TKkbgpThOLiSQWg/ooZBZBrxIBtsTJ6q7kgXOTePDams8dsojwN1z6wFq5AmLWqSZL4E1Wh
 HpNfXCDemKLdDfopGIGNwjKaMsUSLB0=
X-Proofpoint-ORIG-GUID: aUS7M4iYwrqQegCFXBH6YFSShHaF6w67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160129
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

On 9/16/2026 1:53 AM, Alex Bennée wrote:
> This should trigger the building of the docker image when the user
> calls "make check-tcg" or one of the arch specific targets such as
> "make check-tcg-m68k-linux-user".
>

Maybe there is some confusion, patch 2 only reverts option
enable/disable-containers + --container-command for meson. It does not
disable container support for meson tcg tests, which is there and
enabled by default. Thus, container image dependencies are already
there, with ninja or make.

$ ./configure && make check-tcg-m68k-linux-user --dry-run |& grep debian
[246/1052] Generating tests/tcg/image-debian-all-test-cross with a
custom command

Given that dependencies are already there, what is the goal of current
patch?

> We still keep the internal meson dependency so individual tests can
> launched and the docker build verified.
>

As a side note, since patch 3 removes existing meson options, there will
be no way to disable container build and run. It might be a (new)
problem if some people were relying on this to avoid using
docker/podman, which is the current workaround for John Snow's issue for
instance.

At minimum, current series should at least keep meson implementation of
--disable-containers, which implies to keep this entry in
meson_options.txt. The rest is less important, as risk is only to skip
tests, which is not blocking for users.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  scripts/mtest2make.py | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
> index 383ea68b16d..ab894d90d47 100644
> --- a/scripts/mtest2make.py
> +++ b/scripts/mtest2make.py
> @@ -14,6 +14,7 @@ class Suite(object):
>      def __init__(self):
>          self.deps = set()
>          self.speeds = set()
> +        self.docker_deps = set()
>  
>      def names(self, base):
>          return [f'{base}-{speed}' for speed in self.speeds]
> @@ -40,7 +41,22 @@ def names(self, base):
>  
>  introspect = json.load(sys.stdin)
>  
> -def process_tests(test, targets, suites):
> +targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
> +           for t in introspect['targets']}
> +
> +# collect the docker images uses by the tests. This is totally a hacky
> +# heuristic that fishes the images out of the test custom commands by
> +# looking for the qemu/image pattern.
> +targets_docker = {}
> +for t in introspect['targets']:
> +    for src in t.get('target_sources', []):
> +        for arg in src.get('compiler', []):
> +            if arg.startswith('qemu/'):
> +                img = arg.split('/', 1)[1]
> +                targets_docker[t['id']] = f'docker-image-{img}'
> +                break
> +
> +def process_tests(test, targets, targets_docker, suites):
>      executable = test['cmd'][0]
>      try:
>          executable = os.path.relpath(executable)
> @@ -51,6 +67,8 @@ def process_tests(test, targets, suites):
>      deps = itertools.chain.from_iterable(deps)
>      deps = list(deps)
>  
> +    docker_deps = [targets_docker[x] for x in test['depends'] if x in targets_docker]
> +
>      test_suites = test['suite'] or ['default']
>      for s in test_suites:
>          # The suite name in the introspection info is "PROJECT" or "PROJECT:SUITE"
> @@ -59,6 +77,7 @@ def process_tests(test, targets, suites):
>              if s == 'slow' or s == 'thorough':
>                  continue
>          suites[s].deps.update(deps)
> +        suites[s].docker_deps.update(docker_deps)
>          if s.endswith('-slow'):
>              s = s[:-5]
>              suites[s].speeds.add('slow')
> @@ -81,6 +100,9 @@ def emit_prolog(suites, prefix):
>      print(f'all-{prefix}-xml = {all_xml}')
>      print(f'.PHONY: {prefix} do-meson-{prefix} {prefix}-report.junit.xml $(all-{prefix}-targets) $(all-{prefix}-xml)')
>      print(f'ninja-cmd-goals += $(foreach s, $(.{prefix}.mtest-suites), $(.{prefix}-$s.deps))')
> +    print(f'docker-cmd-goals += $(foreach s, $(.{prefix}.mtest-suites), $(.{prefix}-$s.docker-deps))')
> +    print(f'docker-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.docker-goals.$g))')
> +    print(f'run-ninja: $(sort $(docker-cmd-goals))')
>      print(f'{prefix}-build: run-ninja')
>      print(f'{prefix} $(all-{prefix}-targets): do-meson-{prefix}')
>      print(f'do-meson-{prefix}: run-ninja; $(if $(MAKE.n),,+)$(MESON) test $(.{prefix}.mtestargs)')
> @@ -93,6 +115,10 @@ def emit_suite(name, suite, prefix):
>      print()
>      print(f'.{prefix}-{tgtname}.deps = {deps}')
>      print(f'.ninja-goals.check-build += $(.{prefix}-{tgtname}.deps)')
> +    if suite.docker_deps:
> +        docker_deps = ' '.join(sorted(suite.docker_deps))
> +        print(f'.{prefix}-{tgtname}.docker-deps = {docker_deps}')
> +        print(f'.docker-goals.check-build += $(.{prefix}-{tgtname}.docker-deps)')
>  
>      names = ' '.join(sorted(suite.names(name)))
>      targets = f'{prefix}-{tgtname} {prefix}-report-{tgtname}.junit.xml'
> @@ -105,19 +131,16 @@ def emit_suite(name, suite, prefix):
>      print(f".{prefix}.mtest-suites += {name} $(call .speed.$(SPEED), {names})")
>      print(f'endif')
>  
> -targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
> -           for t in introspect['targets']}
> -
>  testsuites = defaultdict(Suite)
>  for test in introspect['tests']:
> -    process_tests(test, targets, testsuites)
> +    process_tests(test, targets, targets_docker, testsuites)
>  emit_prolog(testsuites, 'check')
>  for name, suite in testsuites.items():
>      emit_suite(name, suite, 'check')
>  
>  benchsuites = defaultdict(Suite)
>  for test in introspect['benchmarks']:
> -    process_tests(test, targets, benchsuites)
> +    process_tests(test, targets, targets_docker, benchsuites)
>  emit_prolog(benchsuites, 'bench')
>  for name, suite in benchsuites.items():
>      emit_suite(name, suite, 'bench')


