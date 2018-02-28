Received: by 10.28.91.67 with SMTP id p64csp824436wmb;
        Wed, 28 Feb 2018 08:54:10 -0800 (PST)
X-Google-Smtp-Source: AH8x226MO9lOm3GLOhAu5jQFY50rhOzUoR0WGUUdVUVANnDvVhIYawZH6dVzusPok6SrSim16e8Q
X-Received: by 10.129.119.2 with SMTP id s2mr12146344ywc.441.1519836850748;
        Wed, 28 Feb 2018 08:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519836850; cv=none;
        d=google.com; s=arc-20160816;
        b=h349fXXeBxVvVW3DJknvmu/gACiARfoFQZUP9AzOs7TQJtm/2j1xka1K10YYf742K5
         DFBsoY18FCqx8B5jmwc8SNNmDvpgMfsz2FHQD8nFvJfFQdi5OLJZJVux8Cutl8MRcf4B
         O0ZgsdirEv5OX5IuqwFgnBIeyjwrSilk0bZzDMVv7WIClWHie2leYt3UwXjPigqmoXLT
         SfQCXd0SNJ0IjeyxPDrsbujoUSL1qectQW3ybBiyOyCSFyGmySy9/jcROPJAxjPAElPt
         O933Su/jAKAvMuYV4Pte4ln2CP6OnyMZKI7JU6WminNks2MeCvMcLWCibYy6vSCx9LMJ
         n/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=t4S8hXXojsgeimGUR2ZbYe3j+CW2I+6abRgSF3z2TVg=;
        b=zJZMRPviEi5P0wbl7MR2J+jUDczyI53OAOcadwFcdAydgQxq5boaZSRL8Wt0jr5CT4
         9rXs1M6JOMoxKeSyUjwCnk/rMnMrSvkkz6m6gG+4CBHlb/CbHYEKvC3HKRd9ObDpecdX
         +nD2HtCkQfREbWfV/3neLRotC4pWE6SGD5zqzQi/vxuTj0MtBhrN7Sz/miCevMFx2NHa
         gsYGJEsFY1kJpwhvCwBnyDScT4f4RY4eJDusuWWpm4rp4ODeXzemgFUo/l4Rq4pwViTQ
         ey1xo9++7xr5egJQtCzAfoPVLZ806y1fgQBgLxvpHZCizew5VKT32jzx0OXclQ7n+n8i
         N6yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jD4NC+J+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si75449ywa.180.2018.02.28.08.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 08:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jD4NC+J+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er4za-0004hN-79
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 11:54:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4u1-0000g3-Fr
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 11:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4tz-00073p-1M
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 11:48:25 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:39019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er4ty-00072W-SM
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 11:48:22 -0500
Received: by mail-pg0-x244.google.com with SMTP id w16so253009pgv.6
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t4S8hXXojsgeimGUR2ZbYe3j+CW2I+6abRgSF3z2TVg=;
	b=jD4NC+J+eOpWZm7LMIHD/YoYAcDLXmixPayy/90eO/Xi+q1VxqIsrUTFK3xvAV3B/6
	13jxlCVFiUa1Cy9lkjFVhtOLSwc+JJ2jXpo6Mg/TV2jXiAhGdwCF24JjDyqxZrnmxJZl
	UMOva6AjzRnPBm+9UTM1Q+ZqoYFNQiQe41oRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t4S8hXXojsgeimGUR2ZbYe3j+CW2I+6abRgSF3z2TVg=;
	b=NyO1RABxqzmeXXdwFwGCU/NM+ejfzWzUlz6DUeHfG0IKrxi9A2uz9MKc78rRKQ2yu1
	H+jgdo1SSx5PKg0wNvZLj7pKHkKHYp2X8eyn8vE6gpNni1M05kFbvpedYrtlptBRBEnk
	OchStr+rvB8O2OPmZCePUjPxvNirBRV2XpN7DHjNH0xWU8UQ6UWk/K69bw/knbHGgu9R
	oDMFdvi5qcd8pvlWHCaPzcYiwOXdxbROIR5hhe5RqLi4wn1VrIe6mL9T81lUkEVc0Yjv
	6XB5exD/2dhcJeRFx7YmBJyjLcsarzcgKYZ59BvcYE+XDTA401s6FE1RPtDTvfM1jPS1
	66Bg==
X-Gm-Message-State: APf1xPCC9IHDssrB/Uuw5n74Rm7Z53abewjTfmF5Cv/wI6IejnWeyA6K
	Xf5PXzXMRIDVNdSx0hZR7M7ZemTtQxM=
X-Received: by 10.99.37.7 with SMTP id l7mr14802382pgl.311.1519836501520;
	Wed, 28 Feb 2018 08:48:21 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id p9sm4123698pgs.89.2018.02.28.08.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 08:48:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 08:48:14 -0800
Message-Id: <20180228164816.24110-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228164816.24110-1-richard.henderson@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH] decodetree: Propagate return value from
 translate subroutines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gXneSWGakb83

Allow the translate subroutines to return false for invalid insns.

At present we can of course invoke an invalid insn exception from within
the translate subroutine, but in the short term this consolidates code.
In the long term it would allow the decodetree language to support
overlapping patterns for ISA extensions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Since this makes an ABI change to the translate functions called by the
decode function, let's make it now before there are any in-tree users.

My SVE branch over-decodes in quite a lot of cases -- e.g. things like
the 2-bit size field must be 1-3 for fp operands, and so size==0 is
unallocated.  Returning false for these cases allows the actual call
to unallocated_encoding to be done in one place instead of hundreds.

Longer term, I'm thinking of how to handle decode of overlapping ISA
extensions.  One could allow (specific) overlapping patterns and
prioritize them in some way (e.g. first in file is first matched).
My thought is that trans_insn_a would check a cpu feature bit and
return false if not enabled.  Then trans_insn_b would be given its
chance to handle the insn.


r~
---
 scripts/decodetree.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 6a33f8f8dd..41301c84aa 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -461,7 +461,7 @@ class Pattern(General):
         global translate_prefix
         output('typedef ', self.base.base.struct_name(),
                ' arg_', self.name, ';\n')
-        output(translate_scope, 'void ', translate_prefix, '_', self.name,
+        output(translate_scope, 'bool ', translate_prefix, '_', self.name,
                '(DisasContext *ctx, arg_', self.name,
                ' *a, ', insntype, ' insn);\n')
 
@@ -474,9 +474,8 @@ class Pattern(General):
             output(ind, self.base.extract_name(), '(&u.f_', arg, ', insn);\n')
         for n, f in self.fields.items():
             output(ind, 'u.f_', arg, '.', n, ' = ', f.str_extract(), ';\n')
-        output(ind, translate_prefix, '_', self.name,
+        output(ind, 'return ', translate_prefix, '_', self.name,
                '(ctx, &u.f_', arg, ', insn);\n')
-        output(ind, 'return true;\n')
 # end Pattern
 
 
-- 
2.14.3

