Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345688ejc;
        Thu, 19 Jan 2023 05:56:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbcNLG43VxDdXwpwWZrTeCgGMl7ZUU8o1XWEMUnLUuVo0BveipJZtAL+UCeI4FRq63PpQe
X-Received: by 2002:a17:907:ca85:b0:7c1:1e5a:ed10 with SMTP id ul5-20020a170907ca8500b007c11e5aed10mr12769429ejc.8.1674136613790;
        Thu, 19 Jan 2023 05:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136613; cv=none;
        d=google.com; s=arc-20160816;
        b=ce+awFzZQm5H70u/K7bkthRqQScx4R9XbiPPnYKYNYbXhHl8ZM1lgo7oR7iopB1yx9
         dDFxyr1KInEansKRBHlH9xHJh54Rqd9EOAKS/qv5y441asjfyx+MQ5Qy/GHfZuMqrFrx
         AxFzS9G2GlF9URibtXfD11ipKjrbo9Ea/r1ArDhfhWRlXwKO/y3S8AmdpOO4kxNSR7G6
         douDwrJPgLGP1pHzhScEXYoLL/rvz1mYg1GmCMTmTqSX+DT2IovMJVQGvzOkS4Hnln1a
         p8oqsCLk2NAK2HaEfLPAJL584K/wOuZ+Q6GGupJcziN3NxgZyqaUmNtYwmzCupgscsIe
         bVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=6CmwGZPr+sEROw2OjOLTe6Bx+FJD/SCltpgT+RRPahk=;
        b=SLobWr3NNODkwUveIbwqK5bbdMVM3prFhk/X05YfvlXz+nlyRrRiAhrsByLF4UeM8Q
         vewd8zCsScegXwOh6I62e1HN9cbJisxwuVW4ZXv62QjvaLtBNhCu6BBCO+q1tGlhVRJI
         /2ZrNmc7oew9l3lmXG66IKA99ODUV7n4p6DU5YLniU2ZmKnCZcc8/Ny916Bhq3eobPQs
         jXnwMe10uV1iTebX4RFQzfWnGoCUYMrXd4/WoFMW6iD2vdVM3m3xJ/ArZHj6cnUxiM8h
         lVJ9kek+Aa2bwpGCL8VvaoU/qnD2jqdcD3gI3HpXBFEKUBCKDiuAN+eHwKitsoqaArQC
         wXig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HM8HQ183;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id i2-20020a05640242c200b0049e18d9674asi12598915edc.359.2023.01.19.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HM8HQ183;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D3FB3F42A;
	Thu, 19 Jan 2023 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CmwGZPr+sEROw2OjOLTe6Bx+FJD/SCltpgT+RRPahk=;
	b=HM8HQ183fGd3HqzVC+futzJ6PlOjsTcnotl/IkcnGukT8gl9fTfCrM5eHL6YbVfbxhkurd
	pf4ev+fLOz8j3W1aURnzhfu+Ff2uilB6DZ79ghDsHCcbPZVc+BdK3yA6CcsKu0IMoU/VVp
	ZNeGGtFr2sSCa8x6YW5G4B7T+EAaqzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CmwGZPr+sEROw2OjOLTe6Bx+FJD/SCltpgT+RRPahk=;
	b=sHSc3urze9GKBSplZ6yge/8bqDgxR9vbGGYjoZEyV4Qj7f+kFvSxqboLIlCeMWSaw2xa1u
	kUqYUVxktgugm2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFAFB134F5;
	Thu, 19 Jan 2023 13:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uPHMJCFMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
Date: Thu, 19 Jan 2023 10:54:15 -0300
Message-Id: <20230119135424.5417-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: azvC/e2cw01b

QEMU machines might not have a default value defined for the -cpu
option. Add a custom init function that takes care of selecting the
default cpu in case the test did not specify one. For the machines
that do not have a default, the value MUST be provided by the test.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/libqtest.c | 99 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/libqtest.h | 11 +++++
 2 files changed, 110 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5cb38f90da..db8a40f0c7 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1265,8 +1265,57 @@ static bool qtest_is_old_versioned_machine(const char *mname)
 struct MachInfo {
     char *name;
     char *alias;
+    char *default_cpu;
 };
 
+static char *qtest_get_cpu_name(QString *type)
+{
+    QDict *response, *cpuinfo;
+    QList *list;
+    const QListEntry *p;
+    QObject *qobj;
+    QString *qstr;
+    QTestState *qts;
+    char *cname = NULL;
+
+    qts = qtest_init("-machine none");
+    response = qtest_qmp(qts, "{ 'execute': 'query-cpu-definitions' }");
+    g_assert(response);
+    list = qdict_get_qlist(response, "return");
+
+    if (!list) {
+        /* Not all architectures implement query-cpu-definitions */
+        goto out;
+    }
+
+    for (p = qlist_first(list); p; p = qlist_next(p)) {
+        cpuinfo = qobject_to(QDict, qlist_entry_obj(p));
+        g_assert(cpuinfo);
+
+        qobj = qdict_get(cpuinfo, "typename");
+        g_assert(qobj);
+        qstr = qobject_to(QString, qobj);
+        g_assert(qstr);
+
+        if (g_str_equal(qstring_get_str(qstr),
+                        qstring_get_str(type))) {
+            qobj = qdict_get(cpuinfo, "name");
+            g_assert(qobj);
+            qstr = qobject_to(QString, qobj);
+            g_assert(qstr);
+
+            cname = g_strdup(qstring_get_str(qstr));
+            break;
+        }
+    }
+
+out:
+    qtest_quit(qts);
+    qobject_unref(response);
+
+    return cname;
+}
+
 /*
  * Returns an array with pointers to the available machine names.
  * The terminating entry has the name set to NULL.
@@ -1312,6 +1361,15 @@ static struct MachInfo *qtest_get_machines(void)
         } else {
             machines[idx].alias = NULL;
         }
+
+        qobj = qdict_get(minfo, "default-cpu-type");
+        if (qobj) {                           /* The default cpu is optional */
+            qstr = qobject_to(QString, qobj);
+            g_assert(qstr);
+            machines[idx].default_cpu = qtest_get_cpu_name(qstr);
+        } else {
+            machines[idx].default_cpu = NULL;
+        }
     }
 
     qtest_quit(qts);
@@ -1321,6 +1379,47 @@ static struct MachInfo *qtest_get_machines(void)
     return machines;
 }
 
+static const char *qtest_get_default_cpu(const char* machine)
+{
+    struct MachInfo *machines;
+    char *cpu = NULL;
+    int i;
+
+    if (g_str_equal(machine, "none")) {
+        return cpu;
+    }
+
+    machines = qtest_get_machines();
+
+    for (i = 0; machines[i].name != NULL; i++) {
+        if (g_str_equal(machines[i].name, machine)) {
+            cpu = machines[i].default_cpu;
+            break;
+        }
+    }
+
+    return cpu;
+}
+
+char *qtest_get_machine_args(const char *mname, const char *cname,
+                             const char *extra_args)
+{
+    const char *cpu;
+
+    cpu = cname ?: qtest_get_default_cpu(mname);
+    if (!cpu) {
+        /*
+         * There is no default cpu and the test did not provide a cpu
+         * name for this architecture/machine combination. The QEMU
+         * binary might still know how to select a cpu, so leave the
+         * -cpu option out.
+         */
+        return g_strdup_printf("-machine %s %s", mname, extra_args ?: "");
+    }
+    return g_strdup_printf("-machine %s -cpu %s %s", mname, cpu,
+                           extra_args ?: "");
+}
+
 void qtest_cb_for_every_machine(void (*cb)(const char *machine),
                                 bool skip_old_versioned)
 {
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index fcf1c3c3b3..f86f876c17 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -75,6 +75,17 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
  */
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
 
+/**
+ * qtest_get_machine_args:
+ * @mname: the machine name.
+ * @cname: the cpu name.
+ * @extra_args: other arguments to concatenated in the args string.
+ *
+ * Returns: pointer to args.
+ */
+char *qtest_get_machine_args(const char *mname, const char *cname,
+                             const char *extra_args);
+
 /**
  * qtest_wait_qemu:
  * @s: #QTestState instance to operate on.
-- 
2.35.3
