Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp940183njx;
        Fri, 25 Oct 2024 03:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZbc2ax+qVmcsF+8S2tvGZm0oDG152dkMYRlgu//LJXNLKcM3IKn6r/33FJEiEO2H0kJrB76uvNf8apQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUYqRjHP7Bhj7p2aVOfov00mtn301ByVg2lS9f8m+y/SVGCmpHZJWGbFK3yMzbLMridEsg
X-Received: by 2002:a05:620a:2416:b0:7a9:9a64:cdab with SMTP id af79cd13be357-7b186cfb8femr556901285a.45.1729851711285;
        Fri, 25 Oct 2024 03:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851711; cv=none;
        d=google.com; s=arc-20240605;
        b=Tsu5VZtlBssGYSxPfqKgpFqzE81uCiPvYNzXGPhMKSEdnKfgKqfy5f/O9FNJdElbTf
         AK+OwSRmpGL/Vkoy/o/Y+21f3lu2/6TBFRwd0RbFcNIMQRslSLNMz+72O3pLi2cZl11E
         V39uDSgZRlx8karT1Wse+r8pVlbd7RV3pe4CFtbjMOjxvP+nctmAe6HjUZKBajrAO7/w
         KVHjVBKIkbftDBe6efkf0HOxPBWxnezCk+7Rdtb7AYLtFJS6k6tbQLVDCYhEvatYBmRF
         bn33tjPpLQa9XgiU22Tsygd3D2RAZMTjiKi0eRnGQv8xZnxbu1XmS6aFdghR4iCvFwlk
         fXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qvibL5FsKsRjUbXsu0htnvW3wkSS5Q2NsoKUwT3D8Gw=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=AT7dK5bOUU0VM6NVWtgKnV/NRkK/Pvr8kDUgojO4egJz2z7kcOwvt6VPLU5JMHqXwN
         UNaBr/sVBhLnKHCRPfFjaWQWY6jx0moI6PdiQFtzjkAuRPbv+ob2rbYpl+0MtYDCL5Lz
         kCrAo1UtPLE8crp9L+2jlPgN8BQ3wOZVbUqfC/C7K09YTG38blVReWPlmZEvzaEFDl9f
         8ksOIe552tOnFBHjE07ytOTYeByWktAMgM0Wi+TZSAGQbnuhe2G2545VhGmt3bw+tBRj
         6FUmUp3KasOcuGAIUjalGnT/dcCXu2cSs3NpOH6Lb/A3UYxq5U9cEuA8IDG0p8cJjQEg
         v1Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HunqMY4e;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d37a06dsi112645685a.691.2024.10.25.03.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HunqMY4e;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvibL5FsKsRjUbXsu0htnvW3wkSS5Q2NsoKUwT3D8Gw=;
	b=HunqMY4etpRXin5k3n1LvNc5kjkQVJvS99RFljRVJPAg/peeyTFAxWUSTjml8b4SfXuTLc
	v1dMPk4g3eHeoXSghZwi2fy7MLvVuUr6a0cGUkvm30jTXvSXXEF1NBDk/mTf0in4awQrw2
	PDahjjd+pedK6VqNsNT1iHzu3OpIJF4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-Yi9TIWwZNQONS9uQhZxKLg-1; Fri,
 25 Oct 2024 06:21:47 -0400
X-MC-Unique: Yi9TIWwZNQONS9uQhZxKLg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBB3E1956089;
	Fri, 25 Oct 2024 10:21:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 396EF196BB7D;
	Fri, 25 Oct 2024 10:21:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	cohuck@redhat.com,
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
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: [RFC 14/21] arm/cpu: Add sysreg generation scripts
Date: Fri, 25 Oct 2024 12:17:33 +0200
Message-ID: <20241025101959.601048-15-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: +HRsa5ImUJno

Introduce scripts that automate the generation of system register
definitions from a given linux source tree arch/arm64/tools/sysreg.

Invocation of
./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
in scripts directory do generate 2 qemu files:
- target/arm/cpu-sysreg-properties.c
- target/arm/cpu-sysregs.h

cpu-sysregs.h creates defined for all system registers.
However cpu-sysreg-properties.c only cares about feature ID registers.

update-aarch64-sysreg-code.sh calls two awk scripts.
gen-cpu-sysreg-properties.awk is inherited from kernel
arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
the original author of this script.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
 scripts/gen-cpu-sysregs-header.awk    |  47 ++++
 scripts/update-aarch64-sysreg-code.sh |  27 +++
 3 files changed, 399 insertions(+)
 create mode 100755 scripts/gen-cpu-sysreg-properties.awk
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh

diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu-sysreg-properties.awk
new file mode 100755
index 0000000000..b0ed55e059
--- /dev/null
+++ b/scripts/gen-cpu-sysreg-properties.awk
@@ -0,0 +1,325 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+# gen-sysreg.awk: arm64 sysreg header generator
+#
+# Usage: awk -f gen-custom-sysreg.awk $LINUX_PATH/arch/arm64/tools/sysreg
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
+	print "ARM64SysReg arm64_id_regs[NR_ID_REGS];"
+	print ""
+	print "void initialize_cpu_sysreg_properties(void)"
+	print "{"
+        print "    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NR_ID_REGS);"
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
+	   print "    ARM64SysReg *"reg" = arm64_sysreg_get("op0", "op1", "crn", "crm", "op2");"
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
+/^Fields/ && block_current() == "Sysreg" {
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
diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
new file mode 100755
index 0000000000..cdad686a53
--- /dev/null
+++ b/scripts/gen-cpu-sysregs-header.awk
@@ -0,0 +1,47 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+# gen-sysreg.awk: arm64 sysreg header generator
+#
+# Usage: awk -f gen-custom-sysreg.awk $LINUX_PATH/arch/arm64/tools/sysreg
+
+# Sanity check the number of records for a field makes sense. If not, produce
+# an error and terminate.
+
+# Print a CPP macro definition, padded with spaces so that the macro bodies
+# line up in a column
+function define(name, val) {
+	printf "%-56s%s\n", "#define " name, val
+}
+
+BEGIN {
+	print "#ifndef ARM_CPU_SYSREGS_H"
+	print "#define ARM_CPU_SYSREGS_H"
+	print ""
+	print "/* Generated file - do not edit */"
+	print ""
+} END {
+	print ""
+	print "#endif /* ARM_CPU_SYSREGS_H */"
+}
+
+# skip blank lines and comment lines
+/^$/ { next }
+/^[\t ]*#/ { next }
+
+/^Sysreg\t/ || /^Sysreg /{
+
+	reg = $2
+	op0 = $3
+	op1 = $4
+	crn = $5
+	crm = $6
+	op2 = $7
+
+	define("SYS_" reg, "sys_reg(" op0 ", " op1 ", " crn ", " crm ", " op2 ")")
+	next
+}
+
+{
+	/* skip all other lines */
+	next
+}
diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarch64-sysreg-code.sh
new file mode 100755
index 0000000000..e1fe40308b
--- /dev/null
+++ b/scripts/update-aarch64-sysreg-code.sh
@@ -0,0 +1,27 @@
+#!/bin/sh -e
+#
+# Update target/arm/cpu-sysreg-properties.c and target/arm/cpu-sysregs.h
+# from a linux source tree (arch/arm64/tools/sysreg)
+#
+# Copyright Red Hat, Inc. 2024
+#
+# Authors:
+#          Eric Auger <eric.auger@redhat.com>
+#
+
+linux="$1"
+output="$PWD"
+
+if [ -z "$linux" ] || ! [ -d "$linux" ]; then
+    cat << EOF
+usage: update-aarch64-sysreg-code.sh LINUX_PATH
+
+LINUX_PATH      Linux kernel directory to obtain the headers from
+EOF
+    exit 1
+fi
+
+awk -f gen-cpu-sysregs-header.awk \
+       $linux/arch/arm64/tools/sysreg > ../target/arm/cpu-sysregs.h
+awk -f gen-cpu-sysreg-properties.awk \
+       $linux/arch/arm64/tools/sysreg > ../target/arm/cpu-sysreg-properties.c
-- 
2.41.0
