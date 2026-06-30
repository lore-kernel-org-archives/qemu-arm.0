Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC0BC43602
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weS3Q-0004Ru-Lw; Tue, 30 Jun 2026 02:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1weS3M-0004R9-TW
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 02:34:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1weS3L-0005lK-2L
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 02:34:40 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65U6CKwE1097780
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BOOg6O6+65ktwznpGGrJGfmOMMCE+AZyIJa3ldSeALU=; b=AdoUT8ztyNTeSMX3
 CWmUfyOgpvvckS92wXO7Q3B/U6HC//FjAoESx0bPR2pG+kOLoh8mOotNcrmzDOcH
 RSFNJ6QQIKeyIi9jB+jmyso5kWy4X2I5JIUjiKVRLnp2aHZdRi5N8zE/N+T3KC4P
 i2os027vb+4Nu+bps9qrTOFWJa5mDSD3M0WoQSsSedFIwo90fFBRaY8oIZqQNlaB
 YXB/N1JC9cHj1RaqK5oj0SEPShSdnRdO6Kt5/IK46RkGHPmQ/v1XLKGkcG7O1TGJ
 g1peGghtPzC1aKqfwB83THNYOZ2Sptd91r2X9p8FC5oa1ym5N6xCfXoQPCfmhz7w
 1TfyEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ct7f6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:34:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30c95b0e22aso225221eec.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 23:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782801276; x=1783406076; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOOg6O6+65ktwznpGGrJGfmOMMCE+AZyIJa3ldSeALU=;
 b=FQQ35UHkZSMIVUSszhOOc5U5gQFqVBO4MhxFmT52h+ZE+0mNUWru8YwRGHMGZ5HYGo
 P2g8YJDwpnQZIQaeX5RcWgRqxyh+N5DHW5MlY7S/dyT0O0/x9o3KFcuvZQjZVIEO/3BY
 ihctsPWGAt1Iagb43gnLSYSxr9qGvRGXTpDmkgQId8fT7+wavUXgFAtoZQF5QG3HpiFn
 mVjYfdyNXZ1ifCnDmZyZmNEeyA9Vn6bbPT9WCwKu9246mT1u0f355lF8lFt6WrcCGZe5
 WMFQSqhcMpvcvNwmwngwoDVMCIwjHrjE866OoSiLYyfgVGdWpgr9fUkuwvNSIzSP8R2k
 a7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782801276; x=1783406076;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOOg6O6+65ktwznpGGrJGfmOMMCE+AZyIJa3ldSeALU=;
 b=TdlpG8Za3nRK7qd/sdwLlYrtlyUydemLTrYSLbBcA9eTbLXjRLvFRIVrnXFXoN2NCn
 bKLY+nFv6gtT8Sfpoh1s6EBzY90r8EBDshCq/VNxc7lCIIqP9zlZy8kng2ojri2W3CMs
 RfLE5H2eh+XPPmHdyKuHSetLKVE++zxuU7fAMaCKhgYdvKqB6tp4/Zsbk3ms0Wea18eL
 sJmVqjyjqPBP8eonKbT4Yv4lu+9ytMRi7G9XGyG8Qs5Z15wI7TZBgZShqaZnXYykoP9t
 KQwjSC1zFiF9aY4tdIWjC9R9v6Q9EpxrB/aySB3iI+RUVbpc8p3zLvrfSEW6qw6xvfke
 xK6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpaW/jIzM+7t7TmIjlhUAuh9mkU7U5eDcPFPxJLCyLaZKNi6IJT59I1eGhubQwH6cJJXdWOgWX2ng==@nongnu.org
X-Gm-Message-State: AOJu0YytP4d242eUUaAmiwbbvWQp6W8Z0Bns1wZ7zltPDgp4Zy4YOX1s
 uqLdp0I8oOBDZJ2C4NFKYlQx3gjpQOaIcOHMNjyr4vp70Exid74Kwpw/V17YFjY0SQqePLvAWb6
 FWd1TvU2YGJQ8xX2g4DSOtGUf/w/JuVaqJb/U/tc2fGcsrYoE3+Q4Ay4=
X-Gm-Gg: AfdE7ck6fXAJxdZN09G0qAK03GR0B2Bcrz8RRE3DuyaMDA10Rhx0DzBJDhqI7RQR8DB
 6381cR5B0cLd7Y/7ek87fr3RvFfXrpFVmzRfTNrZ1ntshEb3juKh/OLA/g4dTDhwmE6a1z93ttU
 19PcWpLf4zj3h8zN3Pm3sJlbLLoMPQkTYSKNxyo2gPKKRw+bxsoUotY73qlGcTAhzfoKCWf1coa
 YMPWBYMxmnE7YL0KP4JMz3ll+8XQlN2Bwxtmvn6frEiX0M+SxrduSiSznkG14OMg/Qkwq9/fnLY
 +hk4Jj/2+/4i2XwkR44vrCN/NZVwvX9ucos9MhfFRwoate4JbZQfMbmqEcXrN4oORO3wI2EHi+M
 ETZXPl9KfJdxdZtrbCwAMWZvEXRxDAh4ai2EkLmvWKt7yg6kw05I8T4TmJw0JbCC18nraOhqNeh
 rgpZg=
X-Received: by 2002:a05:7300:1898:b0:30c:ab4f:46be with SMTP id
 5a478bee46e88-30ee13a266emr1873156eec.36.1782801275934; 
 Mon, 29 Jun 2026 23:34:35 -0700 (PDT)
X-Received: by 2002:a05:7300:1898:b0:30c:ab4f:46be with SMTP id
 5a478bee46e88-30ee13a266emr1873129eec.36.1782801275292; 
 Mon, 29 Jun 2026 23:34:35 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30ee2f5ed29sm4775377eec.1.2026.06.29.23.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 23:34:34 -0700 (PDT)
Message-ID: <e349d913-21fa-4b35-be24-e554356c1d2d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 23:34:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 35/37] tests/tcg/meson.build: introduce cc_dockerfile
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
 <20260626233918.158740-36-pierrick.bouvier@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626233918.158740-36-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1NCBTYWx0ZWRfX06kFUtFBFCNR
 fQrF22RkwWo7vWVcaJ9dQ7kY/SK2NrryWTpODy+9BO4G7BQzkykdkmYuh2uXpXEl73/pWv66YI9
 o0N8XKtp4TQ+vkN05Ql/mKFl7bEgPOv9urATgo+RGKUet4yNGLuHdB6gflQ2PFjJZfTCUFdkedb
 tWqA+X+Q4JM5XfBFtIvKoxmXalJeMo2voZH8/eEXQQKks0viIijBK92EWza1RVyM3TY2ZnRdDXb
 UPG6ZIL9wKqJKvRMkTcYADB4P/3aMhrlk5k9YWARSjFt27qjFbW3eAg26yATRPLRcsXPwZmcTCY
 LSsua2DsENCoBAzuT/VhzPbgeQngl9EmuWAJpu8KDz6En+Lyj4/zeHpwanTdtTWWv1pW2Q9tnYw
 +1zt4ERsjJAEyzAAdvZYiNo4z13h9opaq/WkICUX0wkR7+dCmZRQL5sRbAxZWOqZDV/rEBNy3SE
 jOK/XPGbH/KLXEHJBLA==
X-Proofpoint-ORIG-GUID: P2OLYKc0VxEpUd8zU3binJyj5wi_n1Lg
X-Proofpoint-GUID: P2OLYKc0VxEpUd8zU3binJyj5wi_n1Lg
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43637c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=b1d_VCPYNydq6P9BhPIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1NCBTYWx0ZWRfX7D6qkhmrxz4L
 LV4gkfhyJk+iQ+EkdVtLtUSltBBSv3CCWCt8NznfCuELAVQ1Vjkg6W3Kj3c2gjQ1AFM679sfGtb
 C+GOlXbxdV0T80tQ2kawI+cksRMLZiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300054
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

On 6/26/2026 4:39 PM, Pierrick Bouvier wrote:
> We allow target to declare a dockerfile containing required cc. We reuse
> tests/docker/docker.py, and correctly set dependencies for tests on
> original dockerfile.
> 
> In case we rely on docker, we do not build tests by default anymore.
>

Added (coming in v3) cc_docker_arch to specify host architecture for
which the image supports the given cc.

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>  tests/tcg/meson.build | 52 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index 2a308d8ad32..eb6b65c0021 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -1,6 +1,7 @@
>  cc_check_args = ['-xc', '/dev/null', '-o', '/dev/null', '-c']
>  env = find_program('env')
>  
> +docker_wrapper = find_program('../docker/docker.py')
>  gdb_progs = ['gdb-multiarch', 'gdb']
>  if config_host.has_key('GDB')
>    gdb_progs = [config_host['GDB'], gdb_progs]
> @@ -21,6 +22,7 @@ tcg_tests = {}
>  # {
>  #   'name_of_target': {
>  #     'cc': 'cross_compiler',
> +#     'cc_dockerfile': 'name_of_dockerfile',
>  #     'cc_feat_cflags': {
>  #       'name': ['feature cflags'],
>  #       ...
> @@ -75,6 +77,9 @@ if gdb.found()
>    endforeach
>  endif
>  
> +docker_supported = run_command(docker_wrapper, 'probe',
> +                               check: false).returncode() == 0
> +
>  # plugins come first, as we need to build the list
>  test_plugins = {}
>  subdir('plugins')
> @@ -120,6 +125,7 @@ endforeach
>  # Now let's go through all architectures
>  subdir('aarch64')
>  
> +image_targets = {}
>  # Finally, we can create all test executables and test targets
>  foreach target, plan: tcg_tests
>    if target.startswith('multiarch-')
> @@ -135,8 +141,8 @@ foreach target, plan: tcg_tests
>  
>    # return a clear error if user misspell a target entry
>    foreach key, _ : plan
> -    allowed = ['cc', 'cc_feat_cflags', 'folder', 'gdb_arch', 'gdb_feat_version',
> -               'qemu', 'tests']
> +    allowed = ['cc', 'cc_dockerfile', 'cc_feat_cflags', 'folder', 'gdb_arch',
> +               'gdb_feat_version', 'qemu', 'tests']
>      if key not in allowed
>        error('unknown tcg test plan entry \'' + key + '\' for target ' + target +
>              ' (possible: [' + ', '.join(allowed) + '])')
> @@ -144,6 +150,35 @@ foreach target, plan: tcg_tests
>    endforeach
>  
>    cc = find_program(plan['cc'], required : false)
> +  cc_from_system = cc.found()
> +  has_cc = cc.found()
> +  build_test_depends = []
> +  build_test_depend_files = []
> +
> +  if 'cc_dockerfile' in plan
> +    cc_dockerfile = plan['cc_dockerfile']
> +    dockerfile = files('..'/'docker'/'dockerfiles'/cc_dockerfile + '.docker')
> +    image_name = 'image-' + cc_dockerfile
> +    if cc_dockerfile not in image_targets
> +      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', cc_dockerfile]
> +      t = custom_target(image_name, command: cmd,
> +                        build_by_default: false,
> +                        output: 'none')
> +      image_targets += {cc_dockerfile: t}
> +    endif
> +
> +    if docker_supported and not has_cc
> +      build_test_depends = image_targets[cc_dockerfile]
> +      build_test_depend_files = dockerfile
> +      mount = meson.project_source_root()
> +      mount = mount + ':' + mount
> +      here = meson.project_build_root()
> +      cc = [docker_wrapper, 'run', '-w', here, '-v', mount,
> +            cc_dockerfile, plan['cc']]
> +      has_cc = true
> +    endif
> +  endif
> +
>    folder = plan['folder']
>    gdb_arch = plan['gdb_arch']
>    qemu = plan['qemu']
> @@ -237,10 +272,14 @@ foreach target, plan: tcg_tests
>          cc_feat = setup['cc_feat']
>          if cc_feat not in cc_has_feat
>            avail = false
> -          if cc.found()
> +          if cc_from_system
> +            # check flag for host cc
>              cmd = run_command([cc, cc_check_args, cc_feat_cflags[cc_feat]],
>                                check: false)
>              avail = cmd.returncode() == 0
> +          elif has_cc
> +            # docker cc always have feature
> +            avail = true
>            endif
>            cc_has_feat += {cc_feat: avail}
>          endif
> @@ -252,12 +291,13 @@ foreach target, plan: tcg_tests
>          cflags += cc_feat_cflags[cc_feat]
>        endif
>  
> -      if not cc.found()
> +      if not has_cc
>          skip_test = 'compiler ' + plan['cc'] + ' not available'
>          built_tests += {exe_name: exe_name}
>        endif
>  
>        # build executable if needed
> +      # build by default only if cc comes from system
>        if exe_name not in built_tests
>          exe = custom_target(exe_name,
>                              input: file,
> @@ -269,7 +309,9 @@ foreach target, plan: tcg_tests
>                                        cflags],
>                              depfile: exe_name + '.d',
>                              output: exe_name + '.test',
> -                            build_by_default: true)
> +                            depends: build_test_depends,
> +                            depend_files: build_test_depend_files,
> +                            build_by_default: cc_from_system)
>          built_tests += {exe_name: exe}
>        endif
>  


