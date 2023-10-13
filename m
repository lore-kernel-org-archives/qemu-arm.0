Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722711ejc;
        Fri, 13 Oct 2023 12:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMMLX+VHSr36RRIi1xSy9HiuGMmo46+7FHcHTOER0FIAcR+TfsekwmuGIVEAr8pxx4BSty
X-Received: by 2002:a05:6214:240e:b0:66d:1edd:1d4c with SMTP id fv14-20020a056214240e00b0066d1edd1d4cmr5842081qvb.14.1697224218426;
        Fri, 13 Oct 2023 12:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224218; cv=none;
        d=google.com; s=arc-20160816;
        b=qvhhPqnCk9XQE3uRYGLEqgIJ+/8B51KTMxxz4uNRqwgl1OSFZF3fggiKblq4ontKGT
         6zZYXqcfItPHX7yT5IdoEtkLHjoSbh0CFC9zkdhS7Cc2pVlKzaF20cvkCfEEpSuHAT5G
         VOcNyR815Qx/NHTkEnu025/hUV7X0sWM9AHbHr9m3ZHiN45GeTs0ZtXa07wybvlx8Qfg
         o8WI/8PjowSA1OP/KNGhcxaU/fe+r4w4iqEHwh5f26RRPiUU2/OmzGwF3bWvO5YonIa+
         iB9CZwrtwVVpZmOudy6MEwjcF5USLbulR/NGfg40nyXCJKbwNpirsDBGw+A1uT+N4L/U
         SBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=l3ZfV/fIoupB5gtPZYjLu0l1bdDmtHuAyzmyVWMACA0=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=X9zhxcjibyE9nnLt5zokLwW0/mZOGSYF+uan2jBeydp9mQSg3VV8bEkiZ6i0Jf0Dy3
         Hb/abQ3J2PXpXas7OKyLzV2aM7qPqRvp76LQjyI7Yms7HFNBu9huR7CLf0IBUnS2mShw
         cP1Ce4fv1+3is7dWuquHE16v4KvK4ffm03kn7ztK4RqFm4L3CUPwUXqt/9vbQJgCUdzY
         qyk52UOTksz2Q4VCGrvgKa/ujWgznthKd6PA5hdK0HmYIXUXWJSzeICdKJipiXtVUSan
         0GER0llkQAvv169xEjj1Vr+vocrIfCH1iceDcNd5/tThKSByP3Lh1vtK+4Zjcz1GpUSg
         0z/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D78dVsNG;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l19-20020a05620a28d300b00767b7436df3si1730986qkp.319.2023.10.13.12.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D78dVsNG;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3ZfV/fIoupB5gtPZYjLu0l1bdDmtHuAyzmyVWMACA0=;
	b=D78dVsNGRUX3fhJq6MkaCOhF533dZIHJWFznLGnKVfgDMNhUJLQOIY92jpwrPkS5hrY2Pv
	lB1jMIPXNloyqeqJt3z7mSoeCgA9ElZHpB8nKzxSKstec/LZBYgTRn9HQSmTsyVXhAZJ0L
	sA9tAsiHKX1XTvuNVbVUy8ocngzOflE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-EgbJ9dRYO66VQWyj2jZQ9w-1; Fri, 13 Oct 2023 15:10:15 -0400
X-MC-Unique: EgbJ9dRYO66VQWyj2jZQ9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9064E281294C;
	Fri, 13 Oct 2023 19:10:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4437140C6CA0;
	Fri, 13 Oct 2023 19:10:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 24/25] scripts: add python_qmp_updater.py
Date: Fri, 13 Oct 2023 15:09:39 -0400
Message-ID: <20231013190941.3699288-25-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: ygC+QcWWCu5K

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

A script, to update the pattern

    result = self.vm.qmp(...)
    self.assert_qmp(result, 'return', {})

(and some similar ones) into

    self.vm.cmd(...)

Used in the next commit
    "python: use vm.cmd() instead of vm.qmp() where appropriate"

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-15-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/python_qmp_updater.py | 136 ++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100755 scripts/python_qmp_updater.py

diff --git a/scripts/python_qmp_updater.py b/scripts/python_qmp_updater.py
new file mode 100755
index 0000000000..494a169812
--- /dev/null
+++ b/scripts/python_qmp_updater.py
@@ -0,0 +1,136 @@
+#!/usr/bin/env python3
+#
+# Intended usage:
+#
+# git grep -l '\.qmp(' | xargs ./scripts/python_qmp_updater.py
+#
+
+import re
+import sys
+from typing import Optional
+
+start_reg = re.compile(r'^(?P<padding> *)(?P<res>\w+) = (?P<vm>.*).qmp\(',
+                       flags=re.MULTILINE)
+
+success_reg_templ = re.sub('\n *', '', r"""
+    (\n*{padding}(?P<comment>\#.*$))?
+    \n*{padding}
+    (
+        self.assert_qmp\({res},\ 'return',\ {{}}\)
+    |
+        assert\ {res}\['return'\]\ ==\ {{}}
+    |
+        assert\ {res}\ ==\ {{'return':\ {{}}}}
+    |
+        self.assertEqual\({res}\['return'\],\ {{}}\)
+    )""")
+
+some_check_templ = re.sub('\n *', '', r"""
+    (\n*{padding}(?P<comment>\#.*$))?
+    \s*self.assert_qmp\({res},""")
+
+
+def tmatch(template: str, text: str,
+           padding: str, res: str) -> Optional[re.Match[str]]:
+    return re.match(template.format(padding=padding, res=res), text,
+                    flags=re.MULTILINE)
+
+
+def find_closing_brace(text: str, start: int) -> int:
+    """
+    Having '(' at text[start] search for pairing ')' and return its index.
+    """
+    assert text[start] == '('
+
+    height = 1
+
+    for i in range(start + 1, len(text)):
+        if text[i] == '(':
+            height += 1
+        elif text[i] == ')':
+            height -= 1
+        if height == 0:
+            return i
+
+    raise ValueError
+
+
+def update(text: str) -> str:
+    result = ''
+
+    while True:
+        m = start_reg.search(text)
+        if m is None:
+            result += text
+            break
+
+        result += text[:m.start()]
+
+        args_ind = m.end()
+        args_end = find_closing_brace(text, args_ind - 1)
+
+        all_args = text[args_ind:args_end].split(',', 1)
+
+        name = all_args[0]
+        args = None if len(all_args) == 1 else all_args[1]
+
+        unchanged_call = text[m.start():args_end+1]
+        text = text[args_end+1:]
+
+        padding, res, vm = m.group('padding', 'res', 'vm')
+
+        m = tmatch(success_reg_templ, text, padding, res)
+
+        if m is None:
+            result += unchanged_call
+
+            if ('query-' not in name and
+                    'x-debug-block-dirty-bitmap-sha256' not in name and
+                    not tmatch(some_check_templ, text, padding, res)):
+                print(unchanged_call + text[:200] + '...\n\n')
+
+            continue
+
+        if m.group('comment'):
+            result += f'{padding}{m.group("comment")}\n'
+
+        result += f'{padding}{vm}.cmd({name}'
+
+        if args:
+            result += ','
+
+            if '\n' in args:
+                m_args = re.search('(?P<pad> *).*$', args)
+                assert m_args is not None
+
+                cur_padding = len(m_args.group('pad'))
+                expected = len(f'{padding}{res} = {vm}.qmp(')
+                drop = len(f'{res} = ')
+                if cur_padding == expected - 1:
+                    # tolerate this bad style
+                    drop -= 1
+                elif cur_padding < expected - 1:
+                    # assume nothing to do
+                    drop = 0
+
+                if drop:
+                    args = re.sub('\n' + ' ' * drop, '\n', args)
+
+            result += args
+
+        result += ')'
+
+        text = text[m.end():]
+
+    return result
+
+
+for fname in sys.argv[1:]:
+    print(fname)
+    with open(fname) as f:
+        t = f.read()
+
+    t = update(t)
+
+    with open(fname, 'w') as f:
+        f.write(t)
-- 
2.41.0
