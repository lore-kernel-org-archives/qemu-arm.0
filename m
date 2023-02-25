Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2679566ejc;
        Sat, 25 Feb 2023 02:23:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9W7APx099ZixUay8lxoV3z5TYymhxD8CYYG2DxSKObXHV2qk03vYS52eJIlir+0GQOeYXS
X-Received: by 2002:ad4:4ee3:0:b0:56e:a39f:f060 with SMTP id dv3-20020ad44ee3000000b0056ea39ff060mr33528436qvb.19.1677320603149;
        Sat, 25 Feb 2023 02:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677320603; cv=none;
        d=google.com; s=arc-20160816;
        b=FEozkeAwa4fFi3tddQmDCBMAOG6HPHqucGpN1quJ8JCXqo9SXrUIgKZtwqDyfbl9Sp
         csQwHtjXUM3fdqU4DY5/E3otvWnEXoIu+qzPfgL8nbbvgTEPoAnlUwoBYLO0Y9QgLnxv
         LgMT0H+wuxjlYNRiBq/gcBXERa3XUTMCHCPODXsmP/e+sx/P2X26pDLY4p3TxlsxxLtl
         c3ftHOMeSk0Sujw6SIsE2yuPShGwZ8s4LkMl2H8aan8AXNHRqaX0IF+2W6B6JU8b7cTT
         rq8DoiXxIO/o70zZm8rqr9IN2/BKXXaCgZOCcsiBsbbJQcnkdl+fBFjYgJNk9ei2vzS6
         TAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bbiSpJuEncTt063mdAyBDyM8IoKE7Q6X4U9evZz66uw=;
        b=xWqK6UtkPjjkpag3afprbp/noOyJfhVK714pOdCngJy+CYEWv2adF+xW4bgsmt8LIx
         SxcXutMA18/bJHska2y8Z/auldgOJaimToalkB3aATdVbba+/ZH9SVl3Are/cEVwfP+J
         Y4VmCA26w9qmaGFXzh84p4i9UmQnUlYrjUJRNOY3FiIOoZE7UUNLFPSyPTWyGlfTvx9e
         nWcH+GM47cf1LNS8cDllPBoGHQ7UnNWxuD9g8jq7Qqiowp3huDTrP+B0NJKwleQyP7zL
         0xL1zFPsF6hk07W1JXNc2OUePsCfEyq5ZJv/cQZPYp2yUh2SXbH1WWp9nsRKorQhx9hZ
         Fmxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=maPNPNyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a0ce086000000b00571a3b7791bsi1691653qvk.162.2023.02.25.02.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 02:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=maPNPNyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVrhj-00009m-E4; Sat, 25 Feb 2023 05:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrhh-00008x-GK
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:22:57 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrhf-0005qK-8J
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:22:57 -0500
Received: by mail-oi1-x231.google.com with SMTP id q15so1423007oiw.11
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 02:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbiSpJuEncTt063mdAyBDyM8IoKE7Q6X4U9evZz66uw=;
 b=maPNPNydkpLcss1ivZ9+HEtjz70Mrv9laRTbAe/6hbP+TQ1GR8xUZogSX/GXo1kxat
 q5E0QZiY73Pt6bpzHpwOquhYA3y0qxk3BFj2z9KsWCaIGjnVlu1fiqopHfEg4yYwDuQe
 wFjx8ck00eDCZOdIpI+ueLnhxPwSZ2kvzPJ5/X+YYTovRmslVfPDNFsZ8Ho2rKIbgcXL
 qdBWObV86BpZ2RLypovdPcFKP8H65SM7AXAKDPBfccOLrbF/OlmXY8Lm6G+n0kO3pFf7
 Ila8X+7GgeaXOtcOXe9OfcWgSI5wInv3RdKDuYULSOVVfGPMi/SzUU/IjTv5bFTRWeEo
 uQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbiSpJuEncTt063mdAyBDyM8IoKE7Q6X4U9evZz66uw=;
 b=DMjVkhMw8ShNtX7xxp6dfOeOsBCjvoxPkfXB87YdHqg4azNmC56ORxGT6EjoYvx0+6
 cJCnD6wqa29ffxPOrZ38yAD9mExIhKFNTyknqZfR52sjh7nI8PMZTTR9BF/RHx2b/5jE
 c5Vrn1H0fgIOYfKjG4QFZpf7abrz1F2DG0crQaw5tbPzkOpC68DEPExNAo9xsUy47Gjc
 S4h/vsWRMhE/aS17diyRB0/mRWAMKsyhy3QS9hZeCTeCujXbmDkiE3lVVyG8vQnC7q+H
 aSJ8SlB3FhnQx/Y2k4gIlfUbpYig1/T5QPHhq7qQ0Np8msnE1wYbKpcEkFaFqYyirw9u
 zNMw==
X-Gm-Message-State: AO0yUKXPjSLhW2wn3bIIMn21US2Q8FVLAnDwA9CXbY3TTWhIx+IH1rbV
 Y0UNRyg/rD9qfMKeAkdE25yoGw==
X-Received: by 2002:a05:6808:2812:b0:37a:fcd6:5c09 with SMTP id
 et18-20020a056808281200b0037afcd65c09mr4693153oib.49.1677320573967; 
 Sat, 25 Feb 2023 02:22:53 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 r129-20020acac187000000b0037834b1a20bsm789481oif.0.2023.02.25.02.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:22:53 -0800 (PST)
Message-ID: <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:22:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 74/76] tracing: remove transform.py
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-75-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-75-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kQ89K/HG5c0f

Richard,

Not sure if I forgot or missed something but this patch breaks my build as follows:

$  make -j
   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
[1/885] Generating trace/trace-hw_hyperv.c with a custom command
FAILED: trace/trace-hw_hyperv.c
/usr/bin/python3 ../scripts/tracetool.py --backend=log --group=hw_hyperv --format=c /home/danielhb/work/qemu/hw/hyperv/trace-events trace/trace-hw_hyperv.c
Traceback (most recent call last):
   File "/home/danielhb/work/qemu/build/../scripts/tracetool.py", line 19, in <module>
     from tracetool import error_write, out, out_open
   File "/home/danielhb/work/qemu/scripts/tracetool/__init__.py", line 21, in <module>
     import tracetool.transform
ModuleNotFoundError: No module named 'tracetool.transform'


It seems that tracetool.py is still referring transform. This fixes the build
for me:

$ git diff
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 5393c7fc5c..c361815bc1 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -18,7 +18,6 @@
  
  import tracetool.format
  import tracetool.backend
-import tracetool.transform
  
  
  def error_write(*lines):


For reference I grabbed and built the whole series from patchew:

https://patchew.org/QEMU/20230225091427.1817156-1-richard.henderson@linaro.org/



Thanks,


Daniel


On 2/25/23 06:14, Richard Henderson wrote:
> This file got left behind when the tcg stuff was
> removed from tracetool.
> 
> Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build                    |   1 -
>   scripts/tracetool/transform.py | 168 ---------------------------------
>   2 files changed, 169 deletions(-)
>   delete mode 100644 scripts/tracetool/transform.py
> 
> diff --git a/meson.build b/meson.build
> index 6cb2b1a42f..275399b8c2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2861,7 +2861,6 @@ tracetool_depends = files(
>     'scripts/tracetool/format/log_stap.py',
>     'scripts/tracetool/format/stap.py',
>     'scripts/tracetool/__init__.py',
> -  'scripts/tracetool/transform.py',
>     'scripts/tracetool/vcpu.py'
>   )
>   
> diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
> deleted file mode 100644
> index ea8b27799d..0000000000
> --- a/scripts/tracetool/transform.py
> +++ /dev/null
> @@ -1,168 +0,0 @@
> -# -*- coding: utf-8 -*-
> -
> -"""
> -Type-transformation rules.
> -"""
> -
> -__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
> -__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
> -__license__    = "GPL version 2 or (at your option) any later version"
> -
> -__maintainer__ = "Stefan Hajnoczi"
> -__email__      = "stefanha@redhat.com"
> -
> -
> -def _transform_type(type_, trans):
> -    if isinstance(trans, str):
> -        return trans
> -    elif isinstance(trans, dict):
> -        if type_ in trans:
> -            return _transform_type(type_, trans[type_])
> -        elif None in trans:
> -            return _transform_type(type_, trans[None])
> -        else:
> -            return type_
> -    elif callable(trans):
> -        return trans(type_)
> -    else:
> -        raise ValueError("Invalid type transformation rule: %s" % trans)
> -
> -
> -def transform_type(type_, *trans):
> -    """Return a new type transformed according to the given rules.
> -
> -    Applies each of the transformation rules in trans in order.
> -
> -    If an element of trans is a string, return it.
> -
> -    If an element of trans is a function, call it with type_ as its only
> -    argument.
> -
> -    If an element of trans is a dict, search type_ in its keys. If type_ is
> -    a key, use the value as a transformation rule for type_. Otherwise, if
> -    None is a key use the value as a transformation rule for type_.
> -
> -    Otherwise, return type_.
> -
> -    Parameters
> -    ----------
> -    type_ : str
> -        Type to transform.
> -    trans : list of function or dict
> -        Type transformation rules.
> -    """
> -    if len(trans) == 0:
> -        raise ValueError
> -    res = type_
> -    for t in trans:
> -        res = _transform_type(res, t)
> -    return res
> -
> -
> -##################################################
> -# tcg -> host
> -
> -def _tcg_2_host(type_):
> -    if type_ == "TCGv":
> -        # force a fixed-size type (target-independent)
> -        return "uint64_t"
> -    else:
> -        return type_
> -
> -TCG_2_HOST = {
> -    "TCGv_i32": "uint32_t",
> -    "TCGv_i64": "uint64_t",
> -    "TCGv_ptr": "void *",
> -    None: _tcg_2_host,
> -    }
> -
> -
> -##################################################
> -# host -> host compatible with tcg sizes
> -
> -HOST_2_TCG_COMPAT = {
> -    "uint8_t": "uint32_t",
> -    "uint16_t": "uint32_t",
> -    }
> -
> -
> -##################################################
> -# host/tcg -> tcg
> -
> -def _host_2_tcg(type_):
> -    if type_.startswith("TCGv"):
> -        return type_
> -    raise ValueError("Don't know how to translate '%s' into a TCG type\n" % type_)
> -
> -HOST_2_TCG = {
> -    "uint32_t": "TCGv_i32",
> -    "uint64_t": "TCGv_i64",
> -    "void *"  : "TCGv_ptr",
> -    "CPUArchState *": "TCGv_env",
> -    None: _host_2_tcg,
> -    }
> -
> -
> -##################################################
> -# tcg -> tcg helper definition
> -
> -def _tcg_2_helper_def(type_):
> -    if type_ == "TCGv":
> -        return "target_ulong"
> -    else:
> -        return type_
> -
> -TCG_2_TCG_HELPER_DEF = {
> -    "TCGv_i32": "uint32_t",
> -    "TCGv_i64": "uint64_t",
> -    "TCGv_ptr": "void *",
> -    None: _tcg_2_helper_def,
> -    }
> -
> -
> -##################################################
> -# tcg -> tcg helper declaration
> -
> -def _tcg_2_tcg_helper_decl_error(type_):
> -    raise ValueError("Don't know how to translate type '%s' into a TCG helper declaration type\n" % type_)
> -
> -TCG_2_TCG_HELPER_DECL = {
> -    "TCGv"    : "tl",
> -    "TCGv_ptr": "ptr",
> -    "TCGv_i32": "i32",
> -    "TCGv_i64": "i64",
> -    "TCGv_env": "env",
> -    None: _tcg_2_tcg_helper_decl_error,
> -    }
> -
> -
> -##################################################
> -# host/tcg -> tcg temporal constant allocation
> -
> -def _host_2_tcg_tmp_new(type_):
> -    if type_.startswith("TCGv"):
> -        return "tcg_temp_new_nop"
> -    raise ValueError("Don't know how to translate type '%s' into a TCG temporal allocation" % type_)
> -
> -HOST_2_TCG_TMP_NEW = {
> -    "uint32_t": "tcg_const_i32",
> -    "uint64_t": "tcg_const_i64",
> -    "void *"  : "tcg_const_ptr",
> -    None: _host_2_tcg_tmp_new,
> -    }
> -
> -
> -##################################################
> -# host/tcg -> tcg temporal constant deallocation
> -
> -def _host_2_tcg_tmp_free(type_):
> -    if type_.startswith("TCGv"):
> -        return "tcg_temp_free_nop"
> -    raise ValueError("Don't know how to translate type '%s' into a TCG temporal deallocation" % type_)
> -
> -HOST_2_TCG_TMP_FREE = {
> -    "uint32_t": "tcg_temp_free_i32",
> -    "uint64_t": "tcg_temp_free_i64",
> -    "void *"  : "tcg_temp_free_ptr",
> -    None: _host_2_tcg_tmp_free,
> -    }
