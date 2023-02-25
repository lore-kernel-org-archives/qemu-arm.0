Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639388ejc;
        Sat, 25 Feb 2023 01:23:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/tj1ZorpB5mKtDOzY6ehJ0KqxsT/8Ql6fPsk4qyaDhLSZDnXI0VsDue74/7pJN/s7AFRDK
X-Received: by 2002:a05:6214:f2d:b0:56b:4e51:acd5 with SMTP id iw13-20020a0562140f2d00b0056b4e51acd5mr40670366qvb.12.1677317024608;
        Sat, 25 Feb 2023 01:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317024; cv=none;
        d=google.com; s=arc-20160816;
        b=K6oin4odbu9zj8Z2/Te+3009BKiUImTr2QA/MunuIqXJAlzbobYCGBUpwOTFuBKbAZ
         YtienALfecDU0yqq5aaiBz8+7OEM9zlCxA8KXW4+nLQOKOf7k8C89onMlDqbt59uumWK
         fUej8DLAOS7x8h2a+DDe3CrJ2XFcCQg6wDA5uLG+GgHRUDMKJ29SWmviQ5NZs1/CsQ6A
         hplOmC+vFSMJs/dUa2Pt1b6Ju4iGFyzvmBsnS9mtKD8THzh1SnM8z3898dsT7b6FmFDh
         Q57YVRA2OUUP5kLNfvHVr9GmJ9AMlPGkrrGlimr0znykx+8+QvKXL6OWhH4hYMCDNQsq
         WWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kCS1rL10+CIKqmoLW6jSTzgoiAWGrByH8UqPxDNVxjM=;
        b=prJxEND81aqmV1mwcirxmymgRyl3Q1LqdMR2CiUJeZ+wLwkgvltN0YbumYO626HhkZ
         15fFctkaSi7YZTxZ8hY1IaKVknxjCVdPInqtzLl5soUXFLJfowSpP1hilgFSSZdcLfu0
         tICjTKpQYfHqVV+zWKMFjqU8hg+ekHoBw59T8T09BH/4EauSMBHfB2/q70T6eO31UdoL
         /Yp7OTenDfLjqE7hgsTAp7PhmSF64fTcnNTrSwzllrYWjm/LWhicBrzQCr4PX5M4qciB
         Y4/tSOg9Wbm66WvvlSFsNUV6q+pQi3wW1lY+CPhZidbPY2ZfW5Ht7hrSBY62gydMXKYF
         AckQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBpVyPYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73-20020a370c4c000000b0073b866a0f49si1213839qkm.533.2023.02.25.01.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBpVyPYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqkO-0001eV-6d; Sat, 25 Feb 2023 04:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjb-0007UL-4b
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:51 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjW-00039b-4A
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:50 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so1649772pjq.0
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCS1rL10+CIKqmoLW6jSTzgoiAWGrByH8UqPxDNVxjM=;
 b=WBpVyPYBqpNgiZWj+9+HvdqfjNyb3r3u6T9buUrPVd0JCkABBfNK7T3M3Q10THLGn4
 waiJFusn2ahjTkDA9Wiib5TAYE8ClDa40oUqIxmPHVp9oy7zkCgXJK/wH2vYy1Vqjfma
 MVq/hup/gDyFPGUZhl0bYlVftd+64m3daTUORnfl1RRVdskoaC7CiUlvneyySyvdvgqe
 M2ZdoA9Q2brykutrCuteQFeyS8phHbsZsSPgm0qJcG7YYgwyWnZen18BTGEpZnx5jrIx
 zKEullfKWeZO31zyHt2mCMOe4EVXYJxx1P66e2ce4KFvGVYQXGelUD3lcCztOQnxxK7/
 n0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCS1rL10+CIKqmoLW6jSTzgoiAWGrByH8UqPxDNVxjM=;
 b=5W9hcmZGnlNgqnyL7BKPl2AGxQ4iDFqzYlSQRUj0+P1N5vIhdSkV5dHrqg0iI15oZs
 zAWanhl3ybmNyYxOOrBQkE82efewMKZ29gQ31Y9vxjH4647hUuL8MrrXLOZ8cLY+MK1g
 VRt2kje4Bfz8G7TpIC3duaplVZnprsYFk6/2wAPD4bRgGrA7wBDBTmGxeUPNkiQyvWEI
 kdUrRClJfpDHKYM4jk2rvq++PrL7S6lCrY15vH3HbL+LK88xTrDBKU/CCSNXAZXQCmZi
 W/VxGjgWY16PugdEdmUNSMS54oILo+9ljdaotOGy499wOaD9WLFvz18p4FVXDWAd8i0D
 znFg==
X-Gm-Message-State: AO0yUKXSCzyloChAPcFS89HauBy/WXxMv5bbqtsie/KdKU5wa9L0S1+L
 WT2EcbinPVXhSr971IUBfjmTsg==
X-Received: by 2002:a05:6a20:9151:b0:cc:5917:c4ee with SMTP id
 x17-20020a056a20915100b000cc5917c4eemr7601955pzc.35.1677316845149; 
 Sat, 25 Feb 2023 01:20:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 74/76] tracing: remove transform.py
Date: Fri, 24 Feb 2023 23:14:25 -1000
Message-Id: <20230225091427.1817156-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: hnLdY7W8GyjM

This file got left behind when the tcg stuff was
removed from tracetool.

Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                    |   1 -
 scripts/tracetool/transform.py | 168 ---------------------------------
 2 files changed, 169 deletions(-)
 delete mode 100644 scripts/tracetool/transform.py

diff --git a/meson.build b/meson.build
index 6cb2b1a42f..275399b8c2 100644
--- a/meson.build
+++ b/meson.build
@@ -2861,7 +2861,6 @@ tracetool_depends = files(
   'scripts/tracetool/format/log_stap.py',
   'scripts/tracetool/format/stap.py',
   'scripts/tracetool/__init__.py',
-  'scripts/tracetool/transform.py',
   'scripts/tracetool/vcpu.py'
 )
 
diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
deleted file mode 100644
index ea8b27799d..0000000000
--- a/scripts/tracetool/transform.py
+++ /dev/null
@@ -1,168 +0,0 @@
-# -*- coding: utf-8 -*-
-
-"""
-Type-transformation rules.
-"""
-
-__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
-__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
-__license__    = "GPL version 2 or (at your option) any later version"
-
-__maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@redhat.com"
-
-
-def _transform_type(type_, trans):
-    if isinstance(trans, str):
-        return trans
-    elif isinstance(trans, dict):
-        if type_ in trans:
-            return _transform_type(type_, trans[type_])
-        elif None in trans:
-            return _transform_type(type_, trans[None])
-        else:
-            return type_
-    elif callable(trans):
-        return trans(type_)
-    else:
-        raise ValueError("Invalid type transformation rule: %s" % trans)
-
-
-def transform_type(type_, *trans):
-    """Return a new type transformed according to the given rules.
-
-    Applies each of the transformation rules in trans in order.
-
-    If an element of trans is a string, return it.
-
-    If an element of trans is a function, call it with type_ as its only
-    argument.
-
-    If an element of trans is a dict, search type_ in its keys. If type_ is
-    a key, use the value as a transformation rule for type_. Otherwise, if
-    None is a key use the value as a transformation rule for type_.
-
-    Otherwise, return type_.
-
-    Parameters
-    ----------
-    type_ : str
-        Type to transform.
-    trans : list of function or dict
-        Type transformation rules.
-    """
-    if len(trans) == 0:
-        raise ValueError
-    res = type_
-    for t in trans:
-        res = _transform_type(res, t)
-    return res
-
-
-##################################################
-# tcg -> host
-
-def _tcg_2_host(type_):
-    if type_ == "TCGv":
-        # force a fixed-size type (target-independent)
-        return "uint64_t"
-    else:
-        return type_
-
-TCG_2_HOST = {
-    "TCGv_i32": "uint32_t",
-    "TCGv_i64": "uint64_t",
-    "TCGv_ptr": "void *",
-    None: _tcg_2_host,
-    }
-
-
-##################################################
-# host -> host compatible with tcg sizes
-
-HOST_2_TCG_COMPAT = {
-    "uint8_t": "uint32_t",
-    "uint16_t": "uint32_t",
-    }
-
-
-##################################################
-# host/tcg -> tcg
-
-def _host_2_tcg(type_):
-    if type_.startswith("TCGv"):
-        return type_
-    raise ValueError("Don't know how to translate '%s' into a TCG type\n" % type_)
-
-HOST_2_TCG = {
-    "uint32_t": "TCGv_i32",
-    "uint64_t": "TCGv_i64",
-    "void *"  : "TCGv_ptr",
-    "CPUArchState *": "TCGv_env",
-    None: _host_2_tcg,
-    }
-
-
-##################################################
-# tcg -> tcg helper definition
-
-def _tcg_2_helper_def(type_):
-    if type_ == "TCGv":
-        return "target_ulong"
-    else:
-        return type_
-
-TCG_2_TCG_HELPER_DEF = {
-    "TCGv_i32": "uint32_t",
-    "TCGv_i64": "uint64_t",
-    "TCGv_ptr": "void *",
-    None: _tcg_2_helper_def,
-    }
-
-
-##################################################
-# tcg -> tcg helper declaration
-
-def _tcg_2_tcg_helper_decl_error(type_):
-    raise ValueError("Don't know how to translate type '%s' into a TCG helper declaration type\n" % type_)
-
-TCG_2_TCG_HELPER_DECL = {
-    "TCGv"    : "tl",
-    "TCGv_ptr": "ptr",
-    "TCGv_i32": "i32",
-    "TCGv_i64": "i64",
-    "TCGv_env": "env",
-    None: _tcg_2_tcg_helper_decl_error,
-    }
-
-
-##################################################
-# host/tcg -> tcg temporal constant allocation
-
-def _host_2_tcg_tmp_new(type_):
-    if type_.startswith("TCGv"):
-        return "tcg_temp_new_nop"
-    raise ValueError("Don't know how to translate type '%s' into a TCG temporal allocation" % type_)
-
-HOST_2_TCG_TMP_NEW = {
-    "uint32_t": "tcg_const_i32",
-    "uint64_t": "tcg_const_i64",
-    "void *"  : "tcg_const_ptr",
-    None: _host_2_tcg_tmp_new,
-    }
-
-
-##################################################
-# host/tcg -> tcg temporal constant deallocation
-
-def _host_2_tcg_tmp_free(type_):
-    if type_.startswith("TCGv"):
-        return "tcg_temp_free_nop"
-    raise ValueError("Don't know how to translate type '%s' into a TCG temporal deallocation" % type_)
-
-HOST_2_TCG_TMP_FREE = {
-    "uint32_t": "tcg_temp_free_i32",
-    "uint64_t": "tcg_temp_free_i64",
-    "void *"  : "tcg_temp_free_ptr",
-    None: _host_2_tcg_tmp_free,
-    }
-- 
2.34.1

