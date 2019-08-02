Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782315wrv;
        Fri, 2 Aug 2019 05:26:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrKTtZeP3QktAvY5bdmykk//IZU3VA+BGTztZStqgdH25qSlh1rYqXQkBlEDFNTOc2dKGL
X-Received: by 2002:a05:620a:690:: with SMTP id f16mr19229120qkh.97.1564748782990;
        Fri, 02 Aug 2019 05:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748782; cv=none;
        d=google.com; s=arc-20160816;
        b=DpOMtMUzVaoGldKOCgj4UCBN0zN80wbylik3oTN+2ophxypoT0U7KLRi8pzWfFnSFO
         sUUUsMRaz9MI1xtuPpxTKJv0TgxYGsdVwC38wEy8vTaZZHuHBa2lFlN2wIj3BhamFZnO
         bakNwQu/GW5oqVP+MibOyTJO3my1mHhAsLqwW5FlqzxVx5Ie16jFd/nz1cMxvAKsuhg8
         tWsGgeC+VX3dD2kMjtfKENBzBJwFI9lEyMbGnrwhlyqIWyY0EnI2HxrwYe+EcFTr+Wzf
         7ZeECHd36EFqcdARkuMxdI6y7DjESPBUS4k9wtM0P9OEKoMIs8u/J+WgawrazJlVgE3/
         gEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2M+KC8xXGmcC7iVJ69lXKbIo1K84q6nh2dQHZM2Aetw=;
        b=x7s+FrB02hnLKhh9qBQDp81vKkw666l34wpMiNrX4YJm62evN2XDYUBUfNZ3iWdD6u
         mmjLz+y/VA3qfIYHmob0UhC/MqOyvxT3P5iu3ssGne9f+H7FPzqeeOiXsC1I3HPSY+EL
         fnTa46mglAV29SSWObRrfaMqFh5lRoHrEyHXfb9s1ziY2CqvLGzoRl8Afpdga7JITQwd
         snPjF0G95Zxm62bi0XSAk39ozyFXCoWgceumbGtJmdPL7LfBtEruP78sBSudhGsxWmUV
         nLhW2eMYJEZcY2NWFa5Ty31AXrv20w7czZqbzFKwaCbHFm9LHk4LbAujlwoFPWSL4qlX
         sntQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m52si27809115qtk.11.2019.08.02.05.26.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D8643082129;
	Fri,  2 Aug 2019 12:26:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A02CD5C205;
	Fri,  2 Aug 2019 12:26:19 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v3 08/15] target/arm/cpu64: max cpu: Introduce sve<vl-bits> properties
Date: Fri,  2 Aug 2019 14:25:33 +0200
Message-Id: <20190802122540.26385-9-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 02 Aug 2019 12:26:22 +0000 (UTC)
X-TUID: QXbk8eEoEvFU

Introduce cpu properties to give fine control over SVE vector lengths.
We introduce a property for each valid length up to the current
maximum supported, which is 2048-bits. The properties are named, e.g.
sve128, sve256, sve384, sve512, ..., where the number is the number of
bits. See the updates to docs/arm-cpu-features.rst for a description
of the semantics and for example uses.

Note, as sve-max-vq is still present and we'd like to be able to
support qmp_query_cpu_model_expansion with guests launched with e.g.
-cpu max,sve-max-vq=8 on their command lines, then we do allow
sve-max-vq and sve<vl-bits> to be provided at the same time, but this
is not recommended, and is why sve-max-vq is not mentioned in the
document. If sve-max-vq is provided then it enables all lengths smaller
than and including the max and disables all lengths larger. It also
has the side-effect that no larger lengths may be enabled and that the
max itself cannot be disabled. Smaller non-power-of-2 lengths may,
however, be disabled, e.g. -cpu max,sve-max-vq=4,sve384=off provides
a guest the vector lengths 128, 256, and 512 bits.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 docs/arm-cpu-features.rst | 157 +++++++++++++++++-
 target/arm/cpu.c          |   4 +
 target/arm/cpu.h          |  14 ++
 target/arm/cpu64.c        | 340 +++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c       |  13 +-
 target/arm/monitor.c      |  16 ++
 tests/arm-cpu-features.c  | 197 ++++++++++++++++++++++
 7 files changed, 726 insertions(+), 15 deletions(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index c79dcffb5556..aaaed861cda2 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -48,18 +48,28 @@ block in the script for usage) is used to issue the QMP commands.
       (QEMU) query-cpu-model-expansion type=full model={"name":"max"}
       { "return": {
         "model": { "name": "max", "props": {
-        "pmu": true, "aarch64": true
+        "sve1664": true, "pmu": true, "sve1792": true, "sve1920": true,
+        "sve128": true, "aarch64": true, "sve1024": true, "sve": true,
+        "sve640": true, "sve768": true, "sve1408": true, "sve256": true,
+        "sve1152": true, "sve512": true, "sve384": true, "sve1536": true,
+        "sve896": true, "sve1280": true, "sve2048": true
       }}}}
 
-We see that the `max` CPU type has the `pmu` and `aarch64` CPU features.
-We also see that the CPU features are enabled, as they are all `true`.
+We see that the `max` CPU type has the `pmu`, `aarch64`, `sve`, and many
+`sve<N>` CPU features.  We also see that all the CPU features are
+enabled, as they are all `true`.  (The `sve<N>` CPU features are all
+optional SVE vector lengths.  See "SVE CPU Properties".)
 
 (2) Let's try to disable the PMU::
 
       (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"pmu":false}}
       { "return": {
         "model": { "name": "max", "props": {
-        "pmu": false, "aarch64": true
+        "sve1664": true, "pmu": false, "sve1792": true, "sve1920": true,
+        "sve128": true, "aarch64": true, "sve1024": true, "sve": true,
+        "sve640": true, "sve768": true, "sve1408": true, "sve256": true,
+        "sve1152": true, "sve512": true, "sve384": true, "sve1536": true,
+        "sve896": true, "sve1280": true, "sve2048": true
       }}}}
 
 We see it worked, as `pmu` is now `false`.
@@ -75,7 +85,22 @@ We see it worked, as `pmu` is now `false`.
 It looks like this feature is limited to a configuration we do not
 currently have.
 
-(4) Let's try probing CPU features for the Cortex-A15 CPU type::
+(4) Let's disable `sve` and see what happens to all the optional SVE
+    vector lengths::
+
+      (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"sve":false}}
+      { "return": {
+        "model": { "name": "max", "props": {
+        "sve1664": false, "pmu": true, "sve1792": false, "sve1920": false,
+        "sve128": false, "aarch64": true, "sve1024": false, "sve": false,
+        "sve640": false, "sve768": false, "sve1408": false, "sve256": false,
+        "sve1152": false, "sve512": false, "sve384": false, "sve1536": false,
+        "sve896": false, "sve1280": false, "sve2048": false
+      }}}}
+
+As expected they are now all `false`.
+
+(5) Let's try probing CPU features for the Cortex-A15 CPU type::
 
       (QEMU) query-cpu-model-expansion type=full model={"name":"cortex-a15"}
       {"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}}}}
@@ -131,7 +156,125 @@ After determining which CPU features are available and supported for a
 given CPU type, then they may be selectively enabled or disabled on the
 QEMU command line with that CPU type::
 
-  $ qemu-system-aarch64 -M virt -cpu max,pmu=off
+  $ qemu-system-aarch64 -M virt -cpu max,pmu=off,sve=on,sve128=on,sve256=on
 
-The example above disables the PMU for the `max` CPU type.
+The example above disables the PMU and enables the first two SVE vector
+lengths for the `max` CPU type.  Note, the `sve=on` isn't actually
+necessary, because, as we observed above with our probe of the `max` CPU
+type, `sve` is already on by default.  Also, based on our probe of
+defaults, it would seem we need to disable many SVE vector lengths, rather
+than only enabling the two we want.  This isn't the case, because, as
+disabling many SVE vector lengths would be quite verbose, the `sve<N>` CPU
+properties have special semantics (see "SVE CPU Property Parsing
+Semantics").
+
+SVE CPU Properties
+==================
+
+There are two types of SVE CPU properties: `sve` and `sve<N>`.  The first
+is used to enable or disable the entire SVE feature, just as the `pmu`
+CPU property completely enables or disables the PMU.  The second type
+is used to enable or disable specific vector lengths, where `N` is the
+number of bits of the length.  The `sve<N>` CPU properties have special
+dependencies and constraints, see "SVE CPU Property Dependencies and
+Constraints" below.  Additionally, as we want all supported vector lengths
+to be enabled by default, then, in order to avoid overly verbose command
+lines (command lines full of `sve<N>=off`, for all `N` not wanted), we
+provide the parsing semantics listed in "SVE CPU Property Parsing
+Semantics".
+
+SVE CPU Property Dependencies and Constraints
+---------------------------------------------
+
+  1) At least one vector length must be enabled when `sve` is enabled.
+
+  2) If a vector length `N` is enabled, then all power-of-2 vector
+     lengths smaller than `N` must also be enabled.  E.g. if `sve512`
+     is enabled, then `sve128` and `sve256` must also be enabled,
+     but `sve384` is not required.
+
+SVE CPU Property Parsing Semantics
+----------------------------------
+
+  1) If SVE is disabled (`sve=off`), then which SVE vector lengths
+     are enabled or disabled is irrelevant to the guest, as the entire
+     SVE feature is disabled and that disables all vector lengths for
+     the guest.  However QEMU will still track any `sve<N>` CPU
+     properties provided by the user.  If later an `sve=on` is provided,
+     then the guest will get only the enabled lengths.
+
+  2) If SVE is enabled (`sve=on`), but no `sve<N>` CPU properties are
+     provided, then all supported vector lengths are enabled.
+
+  3) If SVE is enabled, then an error is generated when attempting to
+     disable the last enabled vector length (see constraint (1) of "SVE
+     CPU Property Dependencies and Constraints").
+
+  4) If one or more `sve<N>` CPU properties are set `off`, but no `sve<N>`,
+     CPU properties are set `on`, then the specified vector lengths are
+     disabled but the default for any unspecified lengths remains enabled.
+     Disabling a power-of-2 vector length also disables all vector lengths
+     larger than the power-of-2 length (see constraint (2) of "SVE CPU
+     Property Dependencies and Constraints").
+
+  5) If one or more `sve<N>` CPU properties are set to `on`, then they
+     are enabled and all unspecified lengths default to disabled, except
+     for the required lengths per constraint (2) of "SVE CPU Property
+     Dependencies and Constraints", which will even be auto-enabled if
+     they were not explicitly enabled.
+
+  6) If SVE was disabled (`sve=off`), allowing all vector lengths to be
+     explicitly disabled (i.e. avoiding the error specified in (3) of
+     "SVE CPU Property Parsing Semantics"), then if later an `sve=on` is
+     provided an error will be generated.  To avoid this error, one must
+     enable at least one vector length prior to enabling SVE.
+
+SVE CPU Property Examples
+-------------------------
+
+  1) Disable SVE::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve=off
+
+  2) Implicitly enable all vector lengths for the `max` CPU type::
+
+     $ qemu-system-aarch64 -M virt -cpu max
+
+  3) Only enable the 128-bit vector length::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve128=on
+
+  4) Disable the 256-bit vector length and all larger vector lengths
+     since 256 is a power-of-2 (this results in only the 128-bit length
+     being enabled)::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve256=off
+
+  5) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve128=on,sve256=on,sve512=on
+
+  6) The same as (5), but since the 128-bit and 256-bit vector
+     lengths are required for the 512-bit vector length to be enabled,
+     then allow them to be auto-enabled::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve512=on
+
+  7) Do the same as (6), but by first disabling SVE and then re-enabling it::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve=off,sve512=on,sve=on
+
+  8) Force errors regarding the last vector length::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve128=off
+     $ qemu-system-aarch64 -M virt -cpu max,sve=off,sve128=off,sve=on
+
+SVE CPU Property Recommendations
+--------------------------------
+
+The examples in "SVE CPU Property Examples" exhibit many ways to select
+vector lengths which developers may find useful in order to avoid overly
+verbose command lines.  However, the recommended way to select vector
+lengths is to explicitly enable each desired length.  Therefore only
+example's (1), (3), and (5) exhibit recommended uses of the properties.
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 930f4579ccae..842637ae0c49 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1247,6 +1247,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        arm_cpu_sve_finalize(cpu);
+    }
+
     if (arm_feature(env, ARM_FEATURE_AARCH64) &&
         cpu->has_vfp != cpu->has_neon) {
         /*
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a3300f3ee7d7..c8b96293c5e2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -184,8 +184,13 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
+void arm_cpu_sve_finalize(ARMCPU *cpu);
+uint32_t arm_cpu_vq_map_next_smaller(ARMCPU *cpu, uint32_t vq);
 #else
 # define ARM_MAX_VQ    1
+static inline void arm_cpu_sve_finalize(ARMCPU *cpu) { }
+static inline uint32_t arm_cpu_vq_map_next_smaller(ARMCPU *cpu, uint32_t vq)
+{ return 0; }
 #endif
 
 typedef struct ARMVectorReg {
@@ -915,6 +920,15 @@ struct ARMCPU {
 
     /* Used to set the maximum vector length the cpu will support.  */
     uint32_t sve_max_vq;
+
+    /*
+     * In sve_vq_map each set bit is a supported vector length of
+     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
+     * length in quadwords. We need a map size twice the maximum
+     * quadword length though because we use two bits for each vector
+     * length in order to track three states: uninitialized, off, and on.
+     */
+    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ * 2);
 };
 
 void arm_cpu_post_init(Object *obj);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e470c34f89ac..c9412a0b71af 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -257,6 +257,150 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
+/*
+ * While we eventually use cpu->sve_vq_map as a typical bitmap, where each vq
+ * has only two states (off/on), until we've finalized the map at realize time
+ * we use an extra bit, at the vq - 1 + ARM_MAX_VQ bit number, to also allow
+ * tracking of the uninitialized state. The arm_vq_state typedef and following
+ * functions allow us to more easily work with the bitmap.
+ */
+typedef enum arm_vq_state {
+    ARM_VQ_OFF,
+    ARM_VQ_ON,
+    ARM_VQ_UNINITIALIZED,
+} arm_vq_state;
+
+static arm_vq_state arm_cpu_vq_map_get(ARMCPU *cpu, uint32_t vq)
+{
+    assert(vq <= ARM_MAX_VQ);
+
+    return test_bit(vq - 1, cpu->sve_vq_map) |
+           test_bit(vq - 1 + ARM_MAX_VQ, cpu->sve_vq_map) << 1;
+}
+
+static void arm_cpu_vq_map_set(ARMCPU *cpu, uint32_t vq, arm_vq_state state)
+{
+    assert(vq <= ARM_MAX_VQ);
+    assert(state == ARM_VQ_OFF || state == ARM_VQ_ON);
+
+    clear_bit(vq - 1 + ARM_MAX_VQ, cpu->sve_vq_map);
+
+    if (state == ARM_VQ_ON) {
+        set_bit(vq - 1, cpu->sve_vq_map);
+    } else {
+        clear_bit(vq - 1, cpu->sve_vq_map);
+    }
+}
+
+/*
+ * Uninitialized vector lengths need a default value to use in case we need
+ * to query their value prior to map finalization. Additionally map finalizing
+ * itself needs to determine what value to assign uninitialized vector lengths.
+ * The default is determined as follows:
+ *
+ *  * When no vector lengths have been explicitly enabled, i.e. either no
+ *    input has been provided by the user at all, or vector lengths have
+ *    only been disabled, then all uninitialized vector lengths default 'ON'.
+ *
+ *  * When one or more vector lengths have been enabled, then all uninitialized
+ *    vector lengths default 'OFF'. Note, when checking for enabled vector
+ *    lengths we do not discriminate between user-enabled vector lengths and
+ *    auto-enabled vector lengths (which were auto-enabled in order to satisfy
+ *    the user-enabled vector lengths). This implies the default can never
+ *    transition back to 'ON', even if the user-enabled and auto-enabled vector
+ *    lengths that initially transitioned it to 'OFF' are later disabled, as at
+ *    least one vector length must remain enabled unless the SVE feature is
+ *    completely disabled. If SVE is completely disabled then all vector
+ *    lengths are effectively 'OFF'.
+ */
+static bool arm_cpu_vq_map_get_default(ARMCPU *cpu)
+{
+    uint32_t vq;
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        if (arm_cpu_vq_map_get(cpu, vq) == ARM_VQ_ON) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+/*
+ * We need to be able to track the number of enabled (or will-be enabled)
+ * vector lengths in order to ensure we never drop to zero. If the default
+ * is 'ON', then we count enabled and uninitialized vector lengths. Otherwise,
+ * if the default is 'OFF', then we only count enabled vector lengths.
+ */
+static int arm_cpu_num_vqs_available(ARMCPU *cpu)
+{
+    uint32_t vq;
+    bool defval;
+    int num = 0;
+
+    defval = arm_cpu_vq_map_get_default(cpu);
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        arm_vq_state vq_state = arm_cpu_vq_map_get(cpu, vq);
+
+        if (vq_state == ARM_VQ_ON) {
+            ++num;
+        } else if (defval && vq_state == ARM_VQ_UNINITIALIZED) {
+            ++num;
+        }
+    }
+
+    return num;
+}
+
+static void arm_cpu_vq_map_init(ARMCPU *cpu)
+{
+    /* Set all vq's to 0b10 (ARM_VQ_UNINITIALIZED) */
+    bitmap_clear(cpu->sve_vq_map, 0, ARM_MAX_VQ);
+    bitmap_set(cpu->sve_vq_map, ARM_MAX_VQ, ARM_MAX_VQ);
+}
+
+void arm_cpu_sve_finalize(ARMCPU *cpu)
+{
+    bool defval = arm_cpu_vq_map_get_default(cpu);
+    uint32_t vq, max_vq;
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        arm_vq_state vq_state = arm_cpu_vq_map_get(cpu, vq);
+
+        if (vq_state == ARM_VQ_UNINITIALIZED) {
+            if (defval) {
+                arm_cpu_vq_map_set(cpu, vq, ARM_VQ_ON);
+            } else {
+                arm_cpu_vq_map_set(cpu, vq, ARM_VQ_OFF);
+            }
+        }
+    }
+
+    max_vq = arm_cpu_vq_map_next_smaller(cpu, ARM_MAX_VQ + 1);
+
+    if (!cpu->sve_max_vq) {
+        cpu->sve_max_vq = max_vq;
+    }
+
+    assert(max_vq && cpu->sve_max_vq == max_vq);
+}
+
+uint32_t arm_cpu_vq_map_next_smaller(ARMCPU *cpu, uint32_t vq)
+{
+    uint32_t bitnum;
+
+    /*
+     * We allow vq == ARM_MAX_VQ + 1 to be input because the caller may want
+     * to find the maximum vq enabled, which may be ARM_MAX_VQ, but this
+     * function always returns the next smaller than the input.
+     */
+    assert(vq <= ARM_MAX_VQ + 1);
+
+    bitnum = find_last_bit(cpu->sve_vq_map, vq - 1);
+    return bitnum == vq - 1 ? 0 : bitnum + 1;
+}
+
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
@@ -269,15 +413,178 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
 {
     ARMCPU *cpu = ARM_CPU(obj);
     Error *err = NULL;
+    uint32_t vq;
 
     visit_type_uint32(v, name, &cpu->sve_max_vq, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
-    if (!err && (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ)) {
-        error_setg(&err, "unsupported SVE vector length");
-        error_append_hint(&err, "Valid sve-max-vq in range [1-%d]\n",
+    if (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ) {
+        error_setg(errp, "unsupported SVE vector length");
+        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
                           ARM_MAX_VQ);
+        return;
+    }
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        if (vq <= cpu->sve_max_vq) {
+            char tmp[8];
+
+            sprintf(tmp, "sve%d", vq * 128);
+            object_property_set_bool(obj, true, tmp, &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
+        } else if (arm_cpu_vq_map_get(cpu, vq) == ARM_VQ_ON) {
+            arm_cpu_vq_map_set(cpu, vq, ARM_VQ_OFF);
+        }
+    }
+}
+
+static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq = atoi(&name[3]) / 128;
+    arm_vq_state vq_state = arm_cpu_vq_map_get(cpu, vq);
+    bool value;
+
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        /* All vector lengths are disabled when SVE is off. */
+        value = false;
+    } else if (vq_state == ARM_VQ_ON) {
+        value = true;
+    } else if (vq_state == ARM_VQ_OFF) {
+        value = false;
+    } else if (arm_cpu_vq_map_get_default(cpu)) {
+        value = true;
+    } else {
+        value = false;
+    }
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq = atoi(&name[3]) / 128;
+    uint32_t max_vq = 0;
+    Error *err = NULL;
+    bool value;
+
+    visit_type_bool(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    /*
+     * We need to know the maximum vector length, which may just currently
+     * be the maximum length, in order to validate the enabling/disabling
+     * of this vector length.
+     */
+    if (!cpu->sve_max_vq) {
+        for (max_vq = ARM_MAX_VQ; max_vq >= 1; --max_vq) {
+            if (arm_cpu_vq_map_get(cpu, max_vq) == ARM_VQ_ON) {
+                break;
+            }
+        }
+    }
+
+    if (cpu->sve_max_vq && value && vq > cpu->sve_max_vq) {
+        error_setg(errp, "cannot enable %s", name);
+        error_append_hint(errp, "vq=%d (%d bits) is larger than the "
+                          "maximum vector length, sve-max-vq=%d "
+                          "(%d bits)\n", vq, vq * 128,
+                          cpu->sve_max_vq, cpu->sve_max_vq * 128);
+    } else if (cpu->sve_max_vq && !value && vq == cpu->sve_max_vq) {
+        error_setg(errp, "cannot disable %s", name);
+        error_append_hint(errp, "The maximum vector length must be "
+                          "enabled, sve-max-vq=%d (%d bits)\n",
+                          cpu->sve_max_vq, cpu->sve_max_vq * 128);
+    } else if (cpu->sve_max_vq && !value && vq < cpu->sve_max_vq &&
+               is_power_of_2(vq)) {
+        error_setg(errp, "cannot disable %s", name);
+        error_append_hint(errp, "vq=%d (%d bits) is required as it is a "
+                          "power-of-2 length smaller than the maximum, "
+                          "sve-max-vq=%d (%d bits)\n", vq, vq * 128,
+                          cpu->sve_max_vq, cpu->sve_max_vq * 128);
+    } else if (max_vq && !value && vq < max_vq && is_power_of_2(vq)) {
+        error_setg(errp, "cannot disable %s", name);
+        error_append_hint(errp, "Vector length %d-bits is required as it "
+                          "is a power-of-2 length smaller than another "
+                          "enabled vector length. Disable all larger vector "
+                          "lengths first.\n", vq * 128);
+    } else {
+        uint32_t s;
+
+        if (value) {
+            arm_vq_state vq_state;
+            bool fail = false;
+
+            /*
+             * Enabling a vector length automatically enables all
+             * uninitialized power-of-2 lengths smaller than it, as
+             * per the architecture.
+             */
+            for (s = 1; s < vq; ++s) {
+                if (is_power_of_2(s)) {
+                    vq_state = arm_cpu_vq_map_get(cpu, s);
+                    if (vq_state == ARM_VQ_UNINITIALIZED) {
+                        arm_cpu_vq_map_set(cpu, s, ARM_VQ_ON);
+                    } else if (vq_state == ARM_VQ_OFF) {
+                        fail = true;
+                        break;
+                    }
+                }
+            }
+
+            if (fail) {
+                error_setg(errp, "cannot enable %s", name);
+                error_append_hint(errp, "Vector length %d-bits is disabled "
+                                  "and is a power-of-2 length smaller than "
+                                  "%s. All power-of-2 vector lengths smaller "
+                                  "than the maximum length are required.\n",
+                                  s * 128, name);
+            } else {
+                arm_cpu_vq_map_set(cpu, vq, ARM_VQ_ON);
+            }
+        } else {
+            /*
+             * We would have errored-out already if we were attempting to
+             * disable a power-of-2 vector length less than another enabled
+             * vector length, but there may be uninitialized vector lengths
+             * larger than a power-of-2 vector length that we're disabling.
+             * We disable all of those lengths now too, as they can no longer
+             * be enabled.
+             */
+            if (is_power_of_2(vq)) {
+                for (s = vq + 1; s <= ARM_MAX_VQ; ++s) {
+                    arm_cpu_vq_map_set(cpu, s, ARM_VQ_OFF);
+                }
+            }
+
+            arm_cpu_vq_map_set(cpu, vq, ARM_VQ_OFF);
+
+            /*
+             * We just disabled one or more vector lengths. We need to make
+             * sure we didn't disable them all when SVE is enabled.
+             */
+            if (cpu_isar_feature(aa64_sve, cpu) &&
+                !arm_cpu_num_vqs_available(cpu)) {
+                error_setg(errp, "cannot disable %s", name);
+                error_append_hint(errp, "Disabling %s results in all vector "
+                                  "lengths being disabled.\n", name);
+                error_append_hint(errp, "With SVE enabled, at least one vector "
+                                  "length must be enabled.\n");
+            }
+        }
     }
-    error_propagate(errp, err);
 }
 
 static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
@@ -306,6 +613,16 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
     cpu->isar.id_aa64pfr0 = t;
+
+    /*
+     * When SVE is enabled ensure that we have at least one vector
+     * length available.
+     */
+    if (cpu_isar_feature(aa64_sve, cpu) && !arm_cpu_num_vqs_available(cpu)) {
+        error_setg(errp, "cannot enable SVE");
+        error_append_hint(errp, "All possible SVE vector lengths have "
+                          "been disabled.\n");
+    }
 }
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
@@ -316,6 +633,7 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq;
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
@@ -400,11 +718,23 @@ static void aarch64_max_initfn(Object *obj)
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-        cpu->sve_max_vq = ARM_MAX_VQ;
         object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                             cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
         object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
                             cpu_arm_set_sve, NULL, NULL, &error_fatal);
+
+        /*
+         * sve_vq_map uses a special state while setting properties, so
+         * we initialize it here with its init function and finalize it
+         * in arm_cpu_realizefn().
+         */
+        arm_cpu_vq_map_init(cpu);
+        for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+            char name[8];
+            sprintf(name, "sve%d", vq * 128);
+            object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
+                                cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
+        }
     }
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3064067c69a6..5d38f92eebef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5272,6 +5272,13 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+{
+    uint32_t start_vq = (start_len & 0xf) + 1;
+
+    return arm_cpu_vq_map_next_smaller(cpu, start_vq + 1) - 1;
+}
+
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
@@ -5281,13 +5288,13 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
     if (el <= 1) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[3]);
     }
     return zcr_len;
 }
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 36a86cb83ce5..f7099917e137 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -90,8 +90,24 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
     return head;
 }
 
+QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
+
+/*
+ * These are cpu model features we want to advertise. The order here
+ * matters as this is the order in which qmp_query_cpu_model_expansion
+ * will attempt to set them. If there are dependencies between features,
+ * as there are with the sve<vl-bits> features, then the order that
+ * considers those dependencies must be used.
+ *
+ * The sve<vl-bits> features need to be in reverse order in order to
+ * enable/disable the largest vector lengths first, ensuring all
+ * power-of-2 vector lengths smaller can also be enabled/disabled.
+ */
 static const char *cpu_model_advertised_features[] = {
     "aarch64", "pmu", "sve",
+    "sve2048", "sve1920", "sve1792", "sve1664", "sve1536", "sve1408",
+    "sve1280", "sve1152", "sve1024", "sve896", "sve768", "sve640",
+    "sve512", "sve384", "sve256", "sve128",
     NULL
 };
 
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 202bc0e3e823..a0752d000c08 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -13,6 +13,18 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 
+#if __SIZEOF_LONG__ == 8
+#define BIT(n) (1UL << (n))
+#else
+#define BIT(n) (1ULL << (n))
+#endif
+
+/*
+ * We expect the SVE max-vq to be 16. Also it must be <= 64
+ * for our test code, otherwise 'vls' can't just be a uint64_t.
+ */
+#define SVE_MAX_VQ 16
+
 #define MACHINE    "-machine virt,gic-version=max "
 #define QUERY_HEAD "{ 'execute': 'query-cpu-model-expansion', " \
                      "'arguments': { 'type': 'full', "
@@ -157,6 +169,181 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
     qobject_unref(resp);
 }
 
+static uint64_t resp_get_sve_vls(QDict *resp)
+{
+    QDict *props;
+    const QDictEntry *e;
+    uint64_t vls = 0;
+    int n = 0;
+
+    g_assert(resp);
+    g_assert(resp_has_props(resp));
+
+    props = resp_get_props(resp);
+
+    for (e = qdict_first(props); e; e = qdict_next(props, e)) {
+        if (strlen(e->key) > 3 && !strncmp(e->key, "sve", 3) &&
+            g_ascii_isdigit(e->key[3])) {
+            char *endptr;
+            int bits;
+
+            bits = g_ascii_strtoll(&e->key[3], &endptr, 10);
+            if (!bits || *endptr != '\0') {
+                continue;
+            }
+
+            if (qdict_get_bool(props, e->key)) {
+                vls |= BIT((bits / 128) - 1);
+            }
+            ++n;
+        }
+    }
+
+    g_assert(n == SVE_MAX_VQ);
+
+    return vls;
+}
+
+#define assert_sve_vls(qts, cpu_type, expected_vls, fmt, ...)          \
+({                                                                     \
+    QDict *_resp = do_query(qts, cpu_type, fmt, ##__VA_ARGS__);        \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    g_assert(resp_get_sve_vls(_resp) == expected_vls);                 \
+    qobject_unref(_resp);                                              \
+})
+
+static void sve_tests_default(QTestState *qts, const char *cpu_type)
+{
+    /*
+     * With no sve-max-vq or sve<vl-bits> properties on the command line
+     * the default is to have all vector lengths enabled. This also
+     * tests that 'sve' is 'on' by default.
+     */
+    assert_sve_vls(qts, cpu_type, BIT(SVE_MAX_VQ) - 1, NULL);
+
+    /* With SVE off, all vector lengths should also be off. */
+    assert_sve_vls(qts, cpu_type, 0, "{ 'sve': false }");
+
+    /* With SVE on, we must have at least one vector length enabled. */
+    assert_error(qts, cpu_type, "cannot disable sve128", "{ 'sve128': false }");
+
+    /*
+     * -------------------------------------------------------------------
+     *               power-of-2(vq)   all-power-            can      can
+     *                                of-2(< vq)          enable   disable
+     * -------------------------------------------------------------------
+     * vq < max_vq      no            MUST*                yes      yes
+     * vq < max_vq      yes           MUST*                yes      no
+     * -------------------------------------------------------------------
+     * vq == max_vq     n/a           MUST*                yes**    yes**
+     * -------------------------------------------------------------------
+     * vq > max_vq      n/a           no                   no       yes
+     * vq > max_vq      n/a           yes                  yes      yes
+     * -------------------------------------------------------------------
+     *
+     * [*] "MUST" means this requirement must already be satisfied,
+     *     otherwise 'max_vq' couldn't itself be enabled.
+     *
+     * [**] Not testable with the QMP interface, only with the command line.
+     */
+
+    /* max_vq := 8 */
+    assert_sve_vls(qts, cpu_type, 0x8b, "{ 'sve1024': true }");
+
+    /* max_vq := 8, vq < max_vq, !power-of-2(vq) */
+    assert_sve_vls(qts, cpu_type, 0x8f,
+                   "{ 'sve1024': true, 'sve384': true }");
+    assert_sve_vls(qts, cpu_type, 0x8b,
+                   "{ 'sve1024': true, 'sve384': false }");
+
+    /* max_vq := 8, vq < max_vq, power-of-2(vq) */
+    assert_sve_vls(qts, cpu_type, 0x8b,
+                   "{ 'sve1024': true, 'sve256': true }");
+    assert_error(qts, cpu_type, "cannot disable sve256",
+                 "{ 'sve1024': true, 'sve256': false }");
+
+    /*
+     * max_vq := 3, vq > max_vq, !all-power-of-2(< vq)
+     *
+     * If given sve384=on,sve512=off,sve640=on the command line error would be
+     * "cannot enable sve640", but QMP visits the vector lengths in reverse
+     * order, so we get "cannot disable sve512" instead. The command line would
+     * also give that error if given sve384=on,sve640=on,sve512=off, so this is
+     * all fine. The important thing is that we get an error.
+     */
+    assert_error(qts, cpu_type, "cannot disable sve512",
+                 "{ 'sve384': true, 'sve512': false, 'sve640': true }");
+
+    /*
+     * We can disable power-of-2 vector lengths when all larger lengths
+     * are also disabled. We only need to disable the power-of-2 length,
+     * as all non-enabled larger lengths will then be auto-disabled.
+     */
+    assert_sve_vls(qts, cpu_type, 0x7, "{ 'sve512': false }");
+
+    /* max_vq := 3, vq > max_vq, all-power-of-2(< vq) */
+    assert_sve_vls(qts, cpu_type, 0x1f,
+                   "{ 'sve384': true, 'sve512': true, 'sve640': true }");
+    assert_sve_vls(qts, cpu_type, 0xf,
+                   "{ 'sve384': true, 'sve512': true, 'sve640': false }");
+}
+
+static void sve_tests_sve_max_vq_8(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+
+    assert_sve_vls(qts, "max", BIT(8) - 1, NULL);
+
+    /*
+     * Disabling the max-vq set by sve-max-vq is not allowed, but
+     * of course enabling it is OK.
+     */
+    assert_error(qts, "max", "cannot disable sve1024", "{ 'sve1024': false }");
+    assert_sve_vls(qts, "max", 0xff, "{ 'sve1024': true }");
+
+    /*
+     * Enabling anything larger than max-vq set by sve-max-vq is not
+     * allowed, but of course disabling everything larger is OK.
+     */
+    assert_error(qts, "max", "cannot enable sve1152", "{ 'sve1152': true }");
+    assert_sve_vls(qts, "max", 0xff, "{ 'sve1152': false }");
+
+    /*
+     * We can disable non power-of-2 lengths smaller than the max-vq
+     * set by sve-max-vq, but not power-of-2 lengths.
+     */
+    assert_sve_vls(qts, "max", 0xfb, "{ 'sve384': false }");
+    assert_error(qts, "max", "cannot disable sve256", "{ 'sve256': false }");
+
+    qtest_quit(qts);
+}
+
+static void sve_tests_sve_off(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE "-cpu max,sve=off");
+
+    /* SVE is off, so the map should be empty. */
+    assert_sve_vls(qts, "max", 0, NULL);
+
+    /* The map stays empty even if we turn lengths on or off. */
+    assert_sve_vls(qts, "max", 0, "{ 'sve128': true }");
+    assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
+
+    /* With SVE re-enabled we should get all vector lengths enabled. */
+    assert_sve_vls(qts, "max", BIT(SVE_MAX_VQ) - 1, "{ 'sve': true }");
+
+    /* Or enable SVE with just specific vector lengths. */
+    assert_sve_vls(qts, "max", 0x3,
+                   "{ 'sve': true, 'sve128': true, 'sve256': true }");
+
+    qtest_quit(qts);
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -180,9 +367,12 @@ static void test_query_cpu_model_expansion(const void *data)
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "max", "aarch64");
         assert_has_feature(qts, "max", "sve");
+        assert_has_feature(qts, "max", "sve128");
         assert_has_feature(qts, "cortex-a57", "pmu");
         assert_has_feature(qts, "cortex-a57", "aarch64");
 
+        sve_tests_default(qts, "max");
+
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
                      "'aarch64' feature cannot be disabled "
@@ -234,6 +424,13 @@ int main(int argc, char **argv)
     qtest_add_data_func("/arm/query-cpu-model-expansion",
                         NULL, test_query_cpu_model_expansion);
 
+    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
+                            NULL, sve_tests_sve_max_vq_8);
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off);
+    }
+
     if (kvm_available) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
-- 
2.20.1
