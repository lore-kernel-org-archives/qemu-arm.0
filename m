Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp391332lfq;
        Fri, 8 Apr 2022 07:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQI2Lt7ix6WigJ+C0RiroOONZ8Q5lxOw8QZIhFxP+PjXh6M0Z3zWn9mV9Q0r9N9Ct2g7CT
X-Received: by 2002:a05:6902:3:b0:63d:ad29:1f79 with SMTP id l3-20020a056902000300b0063dad291f79mr14079449ybh.385.1649427901584;
        Fri, 08 Apr 2022 07:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427901; cv=none;
        d=google.com; s=arc-20160816;
        b=Lw6hBX0ROSrRMMlEpjQ9N8R39TeE4bzqKThjuHyeSFNEL79ln7EcbrHpB9dAqDN0Kn
         46GLnxZKbckFgRiZKhF9RvwoiKxfpmBOE4FRb7sJPloTMP1Irqm6gpk3hd8+kYNvKqV2
         343zkkEj1tMjoQVvWTRpEzBMKrCsOuk5AMlBUfnXReaCm6bqbJdHFQMLkKswKwD45eCC
         vtjFKA2QXFZnoYGouixgTiUjiwjRMYTT4/2Skce07dN8E5wNc5stf2N1wSzdvNvss/DH
         SR9bbdjF1PByHQrjbEpHvGzDBreDoPgFgliAFPe4iH0mEVqEwotw8VjTv4ccdJDo4dNZ
         eB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZRoPRBmXacMzWSmsgshOhCccbNOLKeiYJX1157x7z/M=;
        b=cZ/OOkyMzdBtLrK6BYlXYhAnjvHLABMGFVMxDiDIj2WsTDmUaiFf+q/C2jf1un0MFj
         nc1F88L6ttN+3Wn0cLqXWqMFG5KOih81v5eYgwRuaMwFrRzDoRY5bWkWeNo8bAiZBmqI
         IKcoVhl7QNTx9Wa2TuxXJUycQm62EAj5PiWPVljq6Qn/sS1XhGHYOqG5quTVi4IvsdZZ
         xGCYccUsoHhQ28XlM204mDyS9keAWs9UbRmT+qNr7FhhVWC0SO5QzXhOW4jiungIh1xD
         OuklRlutCUQ8otscUdgRuXihr/SGargNfBNVNUpRt2Zh2lQ4gf2fgDOyI5wpjjBM1iNS
         a4ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cb1qfChv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a812009000000b002e5bb9dcb7fsi524845ywg.520.2022.04.08.07.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cb1qfChv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpXo-000812-W8
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPK-0006vn-F9
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPH-0002Jj-UF
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso7707065wma.0
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRoPRBmXacMzWSmsgshOhCccbNOLKeiYJX1157x7z/M=;
 b=cb1qfChv6oC2a4EjsG/N+JY/2Z+XBICGEKzp03etTEf+8S7xjNTpme4k5dWLjq+FIG
 VEzcRAE39ILS44caJPCiLIwIuFu+wHm9bRpSZdWh279rlEkNn/4jcYPidwyTx/0QJ8DV
 FGhdTZytj8nogEV0GclZe1SgFhnMTEKFleOJVqOwyVGTxH/dNgDbRZoddbeZzZrq9bDG
 MRxU8M/KgQVhEG2rN3rFuHthPgwYTqCVX8l5WSWvxPKbBGkCDntJzGgHe1++lsNDORYK
 xvqbUACOtx3dsSsT9In2dc0vgJQkSa6fxD+A6NLSE7qft1ML/gYNku5aHWnHAf1lAGIh
 smcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRoPRBmXacMzWSmsgshOhCccbNOLKeiYJX1157x7z/M=;
 b=IrrMrZ0el94tI1z+klYaM4VnSJA4HHufeHfbvs2hBOu0TW/O/UhGc0MqRQcAQVatr7
 Mz46niRiXPPnr8VY7iaFezklIeS5jL1XKFK1lciPDljw2tok+YHVkr5C0rog1kmlCWET
 Fi/axddD14taEnSQEUthV7EJnRjhXgIeUFqnwiGyPQKdHHhhRKm+6IbcsrNcpUXpmWp+
 8q72qrv9A/fauIqYy1VcD0rz5m4onElZ8vbWTOMe0Z4eLid+JvWY7wi+dEcFZKGZ9i4b
 nHv8Mu1pD1pjLA4V4pUv0iieEspuwbzgXElNPzg81hJmCNmnkdrU+ebf6xjfKdAFiE2a
 GNNA==
X-Gm-Message-State: AOAM5309oWTv8L49LIqLHtfUWycvMMo8ZoxLK+yST4NMqV9K+DabgTza
 TMSv8ECLBOWliIuVAMCes9bVeUr/uOk0Ug==
X-Received: by 2002:a05:600c:5113:b0:38d:d8f:67e9 with SMTP id
 o19-20020a05600c511300b0038d0d8f67e9mr16910030wms.107.1649427370427; 
 Fri, 08 Apr 2022 07:16:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/41] hw/intc/arm_gicv3_its: Implement INV command properly
Date: Fri,  8 Apr 2022 15:15:27 +0100
Message-Id: <20220408141550.1271295-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KorBG4DYN+fP

We were previously implementing INV (like INVALL) to just blow away
cached highest-priority-pending-LPI information on all connected
redistributors.  For GICv4.0, this isn't going to be sufficient,
because the LPI we are invalidating cached information for might be
either physical or virtual, and the required action is different for
those two cases.  So we need to do the full process of looking up the
ITE from the devid and eventid.  This also means we can do the error
checks that the spec lists for this command.

Split out INV handling into a process_inv() function like our other
command-processing functions.  For the moment, stick to handling only
physical LPIs; we will add the vLPI parts later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We could also improve INVALL to only prod the one redistributor
specified by the ICID in the command packet, but since INVALL
is only for physical LPIs I am leaving it as it is.
---
 hw/intc/gicv3_internal.h   | 12 +++++++++
 hw/intc/arm_gicv3_its.c    | 50 +++++++++++++++++++++++++++++++++++++-
 hw/intc/arm_gicv3_redist.c | 11 +++++++++
 hw/intc/trace-events       |  3 ++-
 4 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index ef1d75b3cf4..25ea19de385 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -373,6 +373,10 @@ FIELD(MOVI_0, DEVICEID, 32, 32)
 FIELD(MOVI_1, EVENTID, 0, 32)
 FIELD(MOVI_2, ICID, 0, 16)
 
+/* INV command fields */
+FIELD(INV_0, DEVICEID, 32, 32)
+FIELD(INV_1, EVENTID, 0, 32)
+
 /* VMAPI, VMAPTI command fields */
 FIELD(VMAPTI_0, DEVICEID, 32, 32)
 FIELD(VMAPTI_1, EVENTID, 0, 32)
@@ -573,6 +577,14 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs);
  * an incoming migration has loaded new state.
  */
 void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
+/**
+ * gicv3_redist_inv_lpi:
+ * @cs: GICv3CPUState
+ * @irq: LPI to invalidate cached information for
+ *
+ * Forget or update any cached information associated with this LPI.
+ */
+void gicv3_redist_inv_lpi(GICv3CPUState *cs, int irq);
 /**
  * gicv3_redist_mov_lpi:
  * @src: source redistributor
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 05d64630450..6ba554c16ea 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1084,6 +1084,50 @@ static ItsCmdResult process_vmovp(GICv3ITSState *s, const uint64_t *cmdpkt)
     return cbdata.result;
 }
 
+static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    uint32_t devid, eventid;
+    ITEntry ite;
+    DTEntry dte;
+    CTEntry cte;
+    ItsCmdResult cmdres;
+
+    devid = FIELD_EX64(cmdpkt[0], INV_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], INV_1, EVENTID);
+
+    trace_gicv3_its_cmd_inv(devid, eventid);
+
+    cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    switch (ite.inttype) {
+    case ITE_INTTYPE_PHYSICAL:
+        cmdres = lookup_cte(s, __func__, ite.icid, &cte);
+        if (cmdres != CMD_CONTINUE_OK) {
+            return cmdres;
+        }
+        gicv3_redist_inv_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid);
+        break;
+    case ITE_INTTYPE_VIRTUAL:
+        if (!its_feature_virtual(s)) {
+            /* Can't happen unless guest is illegally writing to table memory */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid type %d in ITE (table corrupted?)\n",
+                          __func__, ite.inttype);
+            return CMD_CONTINUE;
+        }
+        /* We will implement the vLPI invalidation in a later commit */
+        g_assert_not_reached();
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return CMD_CONTINUE_OK;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -1192,14 +1236,18 @@ static void process_cmdq(GICv3ITSState *s)
             result = process_its_cmd(s, cmdpkt, DISCARD);
             break;
         case GITS_CMD_INV:
+            result = process_inv(s, cmdpkt);
+            break;
         case GITS_CMD_INVALL:
             /*
              * Current implementation doesn't cache any ITS tables,
              * but the calculated lpi priority information. We only
              * need to trigger lpi priority re-calculation to be in
              * sync with LPI config table or pending table changes.
+             * INVALL operates on a collection specified by ICID so
+             * it only affects physical LPIs.
              */
-            trace_gicv3_its_cmd_inv();
+            trace_gicv3_its_cmd_invall();
             for (i = 0; i < s->gicv3->num_cpu; i++) {
                 gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
             }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index b08b599c887..78650a3bb4c 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -681,6 +681,17 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     gicv3_redist_lpi_pending(cs, irq, level);
 }
 
+void gicv3_redist_inv_lpi(GICv3CPUState *cs, int irq)
+{
+    /*
+     * The only cached information for LPIs we have is the HPPLPI.
+     * We could be cleverer about identifying when we don't need
+     * to do a full rescan of the pending table, but until we find
+     * this is a performance issue, just always recalculate.
+     */
+    gicv3_redist_update_lpi(cs);
+}
+
 void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
 {
     /*
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index b9efe14c690..ae4a3cfb004 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -184,7 +184,8 @@ gicv3_its_cmd_mapd(uint32_t devid, uint32_t size, uint64_t ittaddr, int valid) "
 gicv3_its_cmd_mapc(uint32_t icid, uint64_t rdbase, int valid) "GICv3 ITS: command MAPC ICID 0x%x RDbase 0x%" PRIx64 " V %d"
 gicv3_its_cmd_mapi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MAPI DeviceID 0x%x EventID 0x%x ICID 0x%x"
 gicv3_its_cmd_mapti(uint32_t devid, uint32_t eventid, uint32_t icid, uint32_t intid) "GICv3 ITS: command MAPTI DeviceID 0x%x EventID 0x%x ICID 0x%x pINTID 0x%x"
-gicv3_its_cmd_inv(void) "GICv3 ITS: command INV or INVALL"
+gicv3_its_cmd_inv(uint32_t devid, uint32_t eventid) "GICv3 ITS: command INV DeviceID 0x%x EventID 0x%x"
+gicv3_its_cmd_invall(void) "GICv3 ITS: command INVALL"
 gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDbase1 0x%" PRIx64 " RDbase2 0x%" PRIx64
 gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
 gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x Dbell_pINTID 0x%x"
-- 
2.25.1

