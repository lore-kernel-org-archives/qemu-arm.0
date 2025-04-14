Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2125737njc;
        Mon, 14 Apr 2025 09:39:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTQZb+MW2FYwV9Gqp6y8yvAz/MpeCkT3uxYTyx91Y4j5+q/gZ3CKfo/yqQR74nWjbRSlBifZbZqdUioQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF0bNFAQDQFzILoRS44LLklMeOTHd6fVUitPGvBMZJ+VQP5nXaqrHcZJH22/nUikNtIjek9
X-Received: by 2002:a05:690c:6b11:b0:6fe:d759:b178 with SMTP id 00721157ae682-705599894bdmr224542557b3.6.1744648793979;
        Mon, 14 Apr 2025 09:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648793; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeKomzEdR8XYEIhhyDtQEOPniGvblpRV9hsAOqGTcGbg0iUieJze1WIxHsDfkyyY8w
         FcFaMGEuLhEGsbK04zXVOUaZvP2JoP9g5w2JWVi++8n3FJsEi0iKh3nGj/hPvTmxrRSG
         ZzZCkpzLoPmtJi1VUXbilo7eBifDQX2y0hLGx8akSSsRHNQChqtnN4tB4RbW5m6fE9fM
         EKflP6cmyrw2/SHEH+jXwORajTQ7rYj78VbxB2q6SZuMJ049cGFd7DVoHPFu61ZgZDYD
         Yznp+8pDGfM6ZY5Nu/mGMjyCp1tQ3zE7st+y0BHoIJ/TIhY/9xxMxR37w/bapyAtYtSm
         jIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GQJucsEU0+czHXH5GOQU4YsA6Y5H66tludcrXjXDsQY=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=ZJm8/BBxdWzl+mfhQB05OoCYu5w8XQijri1QgRk2wmHozm4ZapqofxKY4IxoVrfUqS
         hgBY9FHrZAgwFhnb+E8wcOEnmu+iJy7q6ZDrRdgEbbDo1zwBFThrOWprc8UIfejYFqk6
         TZRwfOCvZpknv+rG23cbN/FzCeUNmJrg/B/76/0ghDF5o9M8g0Cm8CJn8zn5P4gB9eG6
         CvzaUu48qsDw5YrY1oy40sSCEdG9dGqN6mHfvjzRRywiEY+K9VAbJWTf5QNJepWXw1/6
         fBUqD0r4zyeBqrOggZxNFu706Jaqz8mCwwIFwIwgQ+cQkD+F4790md8+0n+bJ3QZ7rB9
         pxZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GPG4fnna;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-7053e344b23si66682917b3.295.2025.04.14.09.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GPG4fnna;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQJucsEU0+czHXH5GOQU4YsA6Y5H66tludcrXjXDsQY=;
	b=GPG4fnnaZnVq0zYWmerEH4lCicrKwtzHfH8JJykdr6fpqwWp754dVedenyc2o9ZUVspnRd
	xKBO5Iuznfjo0g2tPGKYOs0Yn8NiGcTdhKMe4beQj/GTC8xIqsDmLA/VSzVcqIhZHsfVF0
	E7fA5QqgQ4tmfOn8JjW5gWnNoFr457Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-DtY3oA9gOSWxbZGobgRvzA-1; Mon,
 14 Apr 2025 12:39:49 -0400
X-MC-Unique: DtY3oA9gOSWxbZGobgRvzA-1
X-Mimecast-MFC-AGG-ID: DtY3oA9gOSWxbZGobgRvzA_1744648786
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31EA8180AB16;
	Mon, 14 Apr 2025 16:39:46 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E314180B491;
	Mon, 14 Apr 2025 16:39:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
Date: Mon, 14 Apr 2025 18:38:41 +0200
Message-ID: <20250414163849.321857-3-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 9daBbiqZ/Oab

From: Eric Auger <eric.auger@redhat.com>

Introduce a script that automates the generation of system register
properties definitions from a given linux source tree
arch/arm64/tools/sysreg.

Invocation of
./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
in scripts directory additionally generates
target/arm/cpu-sysreg-properties.c containing definitions for
feature ID registers.

update-aarch64-sysreg-code.sh additionally calls
gen-cpu-sysreg-properties.awk which is inherited from kernel
arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
the original author of this script.

[CH: split off from original patch adding both sysreg definitions
 and properties]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
 scripts/update-aarch64-sysreg-code.sh |   5 +-
 2 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100755 scripts/gen-cpu-sysreg-properties.awk

diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu-sysreg-properties.awk
new file mode 100755
index 000000000000..76c37938b168
--- /dev/null
+++ b/scripts/gen-cpu-sysreg-properties.awk
@@ -0,0 +1,325 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+# gen-cpu-sysreg-properties.awk: arm64 sysreg header generator
+#
+# Usage: awk -f gen-cpu-sysreg-properties.awk $LINUX_PATH/arch/arm64/tools/sysreg
+
+function block_current() {
+	return __current_block[__current_block_depth];
+}
+
+# Log an error and terminate
+function fatal(msg) {
+	print "Error at " NR ": " msg > "/dev/stderr"
+
+	printf "Current block nesting:"
+
+	for (i = 0; i <= __current_block_depth; i++) {
+		printf " " __current_block[i]
+	}
+	printf "\n"
+
+	exit 1
+}
+
+# Enter a new block, setting the active block to @block
+function block_push(block) {
+	__current_block[++__current_block_depth] = block
+}
+
+# Exit a block, setting the active block to the parent block
+function block_pop() {
+	if (__current_block_depth == 0)
+		fatal("error: block_pop() in root block")
+
+	__current_block_depth--;
+}
+
+# Sanity check the number of records for a field makes sense. If not, produce
+# an error and terminate.
+function expect_fields(nf) {
+	if (NF != nf)
+		fatal(NF " fields found where " nf " expected")
+}
+
+# Print a CPP macro definition, padded with spaces so that the macro bodies
+# line up in a column
+function define(name, val) {
+	printf "%-56s%s\n", "#define " name, val
+}
+
+# Print standard BITMASK/SHIFT/WIDTH CPP definitions for a field
+function define_field(reg, field, msb, lsb, idreg) {
+	if (idreg)
+            print "    arm64_sysreg_add_field("reg", \""field"\", "lsb", "msb");"
+}
+
+# Print a field _SIGNED definition for a field
+function define_field_sign(reg, field, sign, idreg) {
+	if (idreg)
+            print "    arm64_sysreg_add_field("reg", \""field"\", "lsb", "msb");"
+}
+
+# Parse a "<msb>[:<lsb>]" string into the global variables @msb and @lsb
+function parse_bitdef(reg, field, bitdef, _bits)
+{
+	if (bitdef ~ /^[0-9]+$/) {
+		msb = bitdef
+		lsb = bitdef
+	} else if (split(bitdef, _bits, ":") == 2) {
+		msb = _bits[1]
+		lsb = _bits[2]
+	} else {
+		fatal("invalid bit-range definition '" bitdef "'")
+	}
+
+
+	if (msb != next_bit)
+		fatal(reg "." field " starts at " msb " not " next_bit)
+	if (63 < msb || msb < 0)
+		fatal(reg "." field " invalid high bit in '" bitdef "'")
+	if (63 < lsb || lsb < 0)
+		fatal(reg "." field " invalid low bit in '" bitdef "'")
+	if (msb < lsb)
+		fatal(reg "." field " invalid bit-range '" bitdef "'")
+	if (low > high)
+		fatal(reg "." field " has invalid range " high "-" low)
+
+	next_bit = lsb - 1
+}
+
+BEGIN {
+	print "#include \"cpu-custom.h\""
+	print ""
+	print "ARM64SysReg arm64_id_regs[NUM_ID_IDX];"
+	print ""
+	print "void initialize_cpu_sysreg_properties(void)"
+	print "{"
+        print "    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NUM_ID_IDX);"
+        print ""
+
+	__current_block_depth = 0
+	__current_block[__current_block_depth] = "Root"
+}
+
+END {
+	if (__current_block_depth != 0)
+		fatal("Missing terminator for " block_current() " block")
+
+	print "}"
+}
+
+# skip blank lines and comment lines
+/^$/ { next }
+/^[\t ]*#/ { next }
+
+/^SysregFields/ && block_current() == "Root" {
+	block_push("SysregFields")
+
+	expect_fields(2)
+
+	reg = $2
+
+	res0 = "UL(0)"
+	res1 = "UL(0)"
+	unkn = "UL(0)"
+
+	next_bit = 63
+
+	next
+}
+
+/^EndSysregFields/ && block_current() == "SysregFields" {
+	if (next_bit > 0)
+		fatal("Unspecified bits in " reg)
+
+	reg = null
+	res0 = null
+	res1 = null
+	unkn = null
+
+	block_pop()
+	next
+}
+
+/^Sysreg/ && block_current() == "Root" {
+	block_push("Sysreg")
+
+	expect_fields(7)
+
+	reg = $2
+	op0 = $3
+	op1 = $4
+	crn = $5
+	crm = $6
+	op2 = $7
+
+	res0 = "UL(0)"
+	res1 = "UL(0)"
+	unkn = "UL(0)"
+
+	if (op0 == 3 && (op1>=0 && op1<=3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
+	    idreg = 1
+        } else {
+	    idreg = 0
+	}
+
+	if (idreg == 1) {
+	   print "    /* "reg" */"
+	   print "    ARM64SysReg *"reg" = arm64_sysreg_get("reg"_IDX);"
+	   print "    "reg"->name = \""reg"\";"
+	}
+
+	next_bit = 63
+
+	next
+}
+
+/^EndSysreg/ && block_current() == "Sysreg" {
+	if (next_bit > 0)
+		fatal("Unspecified bits in " reg)
+
+	reg = null
+	op0 = null
+	op1 = null
+	crn = null
+	crm = null
+	op2 = null
+	res0 = null
+	res1 = null
+	unkn = null
+
+	if (idreg==1)
+	    print ""
+	block_pop()
+	next
+}
+
+# Currently this is effectivey a comment, in future we may want to emit
+# defines for the fields.
+(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
+	expect_fields(2)
+
+	if (next_bit != 63)
+		fatal("Some fields already defined for " reg)
+
+	print "/* For " reg " fields see " $2 " */"
+	print ""
+
+        next_bit = 0
+	res0 = null
+	res1 = null
+	unkn = null
+
+	next
+}
+
+
+/^Res0/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	expect_fields(2)
+	parse_bitdef(reg, "RES0", $2)
+	field = "RES0_" msb "_" lsb
+
+	res0 = res0 " | GENMASK_ULL(" msb ", " lsb ")"
+
+	next
+}
+
+/^Res1/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	expect_fields(2)
+	parse_bitdef(reg, "RES1", $2)
+	field = "RES1_" msb "_" lsb
+
+	res1 = res1 " | GENMASK_ULL(" msb ", " lsb ")"
+
+	next
+}
+
+/^Unkn/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	expect_fields(2)
+	parse_bitdef(reg, "UNKN", $2)
+	field = "UNKN_" msb "_" lsb
+
+	unkn = unkn " | GENMASK_ULL(" msb ", " lsb ")"
+
+	next
+}
+
+/^Field/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	expect_fields(3)
+	field = $3
+	parse_bitdef(reg, field, $2)
+
+
+	define_field(reg, field, msb, lsb, idreg)
+
+	next
+}
+
+/^Raz/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	expect_fields(2)
+	parse_bitdef(reg, field, $2)
+
+	next
+}
+
+/^SignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	block_push("Enum")
+
+	expect_fields(3)
+	field = $3
+	parse_bitdef(reg, field, $2)
+
+	define_field(reg, field, msb, lsb, idreg)
+	define_field_sign(reg, field, "true", idreg)
+
+	next
+}
+
+/^UnsignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	block_push("Enum")
+
+	expect_fields(3)
+	field = $3
+	parse_bitdef(reg, field, $2)
+
+	define_field(reg, field, msb, lsb, idreg)
+	#define_field_sign(reg, field, "false", idreg)
+
+	next
+}
+
+/^Enum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+	block_push("Enum")
+
+	expect_fields(3)
+	field = $3
+	parse_bitdef(reg, field, $2)
+
+	define_field(reg, field, msb, lsb, idreg)
+
+	next
+}
+
+/^EndEnum/ && block_current() == "Enum" {
+
+	field = null
+	msb = null
+	lsb = null
+
+	block_pop()
+	next
+}
+
+/0b[01]+/ && block_current() == "Enum" {
+	expect_fields(2)
+	val = $1
+	name = $2
+
+	next
+}
+
+# Any lines not handled by previous rules are unexpected
+{
+	fatal("unhandled statement")
+}
diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarch64-sysreg-code.sh
index 721f41a9a516..a11637091815 100755
--- a/scripts/update-aarch64-sysreg-code.sh
+++ b/scripts/update-aarch64-sysreg-code.sh
@@ -1,6 +1,6 @@
 #!/bin/sh -e
 #
-# Update target/arm/cpu-sysregs.h
+# Update target/arm/cpu-sysreg-properties.c and target/arm/cpu-sysregs.h
 # from a linux source tree (arch/arm64/tools/sysreg)
 #
 # Copyright Red Hat, Inc. 2024
@@ -23,3 +23,6 @@ fi
 
 awk -f gen-cpu-sysregs-header.awk \
     $linux/arch/arm64/tools/sysreg > ../target/arm/cpu-sysregs.h.inc
+
+awk -f gen-cpu-sysreg-properties.awk \
+       $linux/arch/arm64/tools/sysreg > ../target/arm/cpu-sysreg-properties.c
-- 
2.49.0
