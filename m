Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4293402ejc;
        Sun, 26 Feb 2023 21:36:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8W5P/5vcSq6IgpHIw58x7Sc6ybmdT26h67dRq2ah+VLOwTutBgNEgr7QdcF1+oevqsZ3fb
X-Received: by 2002:a05:622a:138d:b0:3b9:173e:45de with SMTP id o13-20020a05622a138d00b003b9173e45demr15608453qtk.6.1677476181583;
        Sun, 26 Feb 2023 21:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476181; cv=none;
        d=google.com; s=arc-20160816;
        b=Jogskf/t+m5CHw+qfrMKll8rXDHgJzj0LVhvAviwA1re4wrsRQ+bFXMlayDeb5almC
         4ifadzJ9EZf11KPFHS7EkoEBqaCtDxjOJqrFK1p46ANpCqGMsS1EIk+o4vSNH+MOyYG9
         f8T2QVh8CvSpLrYlCns5ZqUl0cO2RQKEzreyre0Ho3udOpKs0zs2Si26VwzkgWygRboE
         zJWCbBdCltrYMdX0ld6eMuslmenN+2kiPSnWlmRmsN7snKqS3SAEqdxyoGIP4vq3Kbre
         aafKp0SJWjrsxkn1dr3Po6jXlAk6t0WlPYTD9VcvonfqSFkCVNF+aOZuzHp2DRG4YI/e
         TRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mto8gZo3djU/h+euQ02hp/2HLo7eYXM2X3ttNgQzbL0=;
        b=YRZWU0EQ9cvlId02fpfgFP9gFZ2d6nn7BI35Qx4fBhEt8OcCO/q3b3+2E47DXiqcj2
         KVfPHwo1NiEQmwyBLicPiCMLeq3hT/XoJLnaIpq7+loLzc2Jb8TyWZGsjyKvjtSGHrCz
         Qugb7uG7MRopJ7bgj32W78dr+jWh59rP2Divj+PPQooKsr1Fp8CESg0ZGM53o7Wa1NZh
         j2FcHbhJelq1vRcT/y1MiJu/RBLV4xcRNbA08ipNpxkz0k10ONvIIymvOxaw2PDBcHAU
         +w321gfBLDv+6/7kUBZO15lI5zk3IklFx9iISvamVT+9QqYBhMVHoDdTgVHdsfhh+0G9
         YDiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPMjuN51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020ac87c4b000000b003b9b98b50dfsi6070425qtv.185.2023.02.26.21.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:36:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPMjuN51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW8E-0004iw-2q; Mon, 27 Feb 2023 00:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6w-00009Z-FG
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:31:43 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6t-00012J-Oa
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:31:42 -0500
Received: by mail-pl1-x642.google.com with SMTP id p6so4695734plf.0
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mto8gZo3djU/h+euQ02hp/2HLo7eYXM2X3ttNgQzbL0=;
 b=dPMjuN51uwbpJ4JmQ8SW7crleXCdFGo1x9CSDSYZra3JOiBT+/WAyRyZLkK5lVhY/h
 8UoV0j0SIW5ynF0sHAeGj9BaR/U6CcNUDCCdYyDABGht9IY/gzgwmB/tzWEn7kSXb39D
 3O2LdU2fsyviWlioVImh9/v1k/WhTokm9aWDFwMnGxVKK6OdG85HmfGCJ50goOcWAXI6
 +bVUUDUxyThZZY6Uiv1z5tqPZl4syciaEYk1sUb0GOOaFuZeldQhfQCo27cOBOPKf6fJ
 OaP3VIQ+QhDgATQIbyhhrPhe0clKDDN8YPInBKojC+7ERsAujgIm5agFdn0QBa8R+X44
 4+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mto8gZo3djU/h+euQ02hp/2HLo7eYXM2X3ttNgQzbL0=;
 b=gHlDHeRHCtdem1pecLVz99EELYR3G+ftY/P6W27bCQcVd4P0cmBsyNLsDGTm+kYIAb
 fuk8GsmbUtfRYZlBgO1wkoWqtXCqz/m3j9v7Xy9ABwzOFR5HF5+6GNTNTIk7AkjNyy09
 Uf4UPdcOmG2Y6/E8QTx7v6GrWUt6mbxYo94L/CyZQnSvBP8IU1UAcBjZAs6al6J9GXDM
 a514ylw1yG/BNvVigGkBc30myL6DIFgOhKXOGTWDG7RvBc3m7FxSCg9myW2/vXYzoMgl
 3ogFuXTJFHF9iPrhW65MIypToecn9Cms37KX06GbPnzZn9r2z7f9pBXGRrcpK9t4L1Xv
 ApCQ==
X-Gm-Message-State: AO0yUKXNy6jSru8c/UvyM0uMt/qqrSpl8vROt7Tsq/CxiFv3a85tLUin
 Zd9/FN1wyYfE4UwiybnfPmay7Q==
X-Received: by 2002:a17:90b:1b09:b0:233:c3e7:bd37 with SMTP id
 nu9-20020a17090b1b0900b00233c3e7bd37mr7792845pjb.10.1677475898982; 
 Sun, 26 Feb 2023 21:31:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 74/76] tracing: remove transform.py
Date: Sun, 26 Feb 2023 19:25:03 -1000
Message-Id: <20230227052505.352889-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
X-TUID: VFfk7uYGkupx

This file, and a couple of uses, got left behind when the
tcg stuff was removed from tracetool.

Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                    |   1 -
 scripts/tracetool/__init__.py  |  23 -----
 scripts/tracetool/transform.py | 168 ---------------------------------
 3 files changed, 192 deletions(-)
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
 
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 5393c7fc5c..33cf85e2b0 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -18,7 +18,6 @@
 
 import tracetool.format
 import tracetool.backend
-import tracetool.transform
 
 
 def error_write(*lines):
@@ -190,18 +189,6 @@ def casted(self):
         """List of argument names casted to their type."""
         return ["(%s)%s" % (type_, name) for type_, name in self._args]
 
-    def transform(self, *trans):
-        """Return a new Arguments instance with transformed types.
-
-        The types in the resulting Arguments instance are transformed according
-        to tracetool.transform.transform_type.
-        """
-        res = []
-        for type_, name in self._args:
-            res.append((tracetool.transform.transform_type(type_, *trans),
-                        name))
-        return Arguments(res)
-
 
 class Event(object):
     """Event description.
@@ -358,16 +345,6 @@ def api(self, fmt=None):
             fmt = Event.QEMU_TRACE
         return fmt % {"name": self.name, "NAME": self.name.upper()}
 
-    def transform(self, *trans):
-        """Return a new Event with transformed Arguments."""
-        return Event(self.name,
-                     list(self.properties),
-                     self.fmt,
-                     self.args.transform(*trans),
-                     self.lineno,
-                     self.filename,
-                     self)
-
 
 def read_events(fobj, fname):
     """Generate the output for the given (format, backends) pair.
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

