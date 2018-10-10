Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1479587wrt;
        Wed, 10 Oct 2018 13:39:43 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63JBghuFrIsPRU5qQp41UV87wOhJ47EHeMDWJIUNtW9GF8eG1dOFRoMHYiS5F1VqrM07Piq
X-Received: by 2002:aed:2c25:: with SMTP id f34-v6mr29415658qtd.203.1539203983585;
        Wed, 10 Oct 2018 13:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203983; cv=none;
        d=google.com; s=arc-20160816;
        b=HjIrcINbkod3tPQiA63DRog8dWDOIx4YuRkDZ1xvpvA06I5eObXXbB4s5JpXh/gjiI
         drICecYsgBDz55QkI7hsTVAkm05foZWTgWgSlHCWvyWo68CKi7hrXqxwOhcYOgZH+6Yh
         tG2xRe27FNxCS3JwCTGZJA/n2wLB5fpGmqmcpT2BqXgSPO19Wnz8hKbwcb5DCGhjyYx3
         JtGKhMEUBftho+g7NkCND+nrwoFLq/cExRrQaNTbj58unknEIx4sYFs1t5THXXzSAPed
         P4y97y8BzsUUfl5yY4IXc6s8wm5umWiiYHQeQE2xRhGFSHABkB6beW84+X54Tcxyocvh
         4lzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lcqRW3+QlXEvaODHcyzMa2/tXsQVITsUxvIKVHTwHag=;
        b=SFXvSLKA/FQVGsM/r+ScMcsapEJBcMzLOLCTasxBftHk6J/iDI7c1TB20Fwe6TkT5a
         s0/gZ1TlCqNXhJkMf5E4YUWhDpNq3aprf9xuI8JBfTKnFbPJLD/n6m5UdaLoyt5ob8EF
         3KbOyjfHezxVFxgFtnKSL5oJjTUSNRFyx5huHFST91QS4iwUNXkQsfUwzYL0SQq8dnaj
         hnocvuBLbFdALSVD5aAdmZMD2Pd0dRQ5rtt8+Uy3MM7t5arOOjOn8yxCqNoa5RA9D4Ev
         NFp4Py3s1ZtndpxYiTRAJH9pgKDznamZbmCBTH9y7mEoGmxuKiEORl/9gZjedOKUA4vZ
         sKxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A2zugbyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96-v6si4400606qkr.258.2018.10.10.13.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A2zugbyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALGh-0003ad-3E
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:39:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002ow-64
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFV-0002PZ-Tt
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:41873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFV-0002Np-M1; Wed, 10 Oct 2018 16:38:29 -0400
Received: by mail-yb1-xb42.google.com with SMTP id e16-v6so2754152ybk.8;
	Wed, 10 Oct 2018 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lcqRW3+QlXEvaODHcyzMa2/tXsQVITsUxvIKVHTwHag=;
	b=A2zugbyKfkLhrC/EK5ZhMoWjJnaJrlgHaeZd6PlTL/4Wfpqlk35eVT0Ri0+NabE12a
	3ScegIXeHBb2pCiV+WRni46R1Qg0uNFCv8oGkgc0bEZgXX5Sk7pdL6gDlJ8wCLcvG8r2
	iEpRk4cY5qvg2yWyuLkCnPquraDTaLeeI7EWx27QCg6/jFlM+jdCRPDBUjKofbOzHHWv
	6gn0EQa1JAl5Az9/jlODtZNGJwxK0sS7OzqnVU/umBfqxujqV5AQR+gDNw7Q8rLWqs/9
	ZZeArpyc8nlKSXpD2bj2F0rLwuZZIkiw7iWuuxZfPmODFUAfx6iSsMpdTpvfG1H+kvB+
	ktzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lcqRW3+QlXEvaODHcyzMa2/tXsQVITsUxvIKVHTwHag=;
	b=WzINA1mYZ1+bK6bAOcI4MvOoMAkpfgwfnBT8vAAmlGLi1R7Jkqx6t3v5nGOO+1PKDN
	oeWKuVN/LALkBrfZOxD7zRRrSCpyLsf8PAiX7ctcm4qXcfASMP0GJJsJWgZW+OEbMtFF
	YEEDdsjZJidtuE1asbZTIjuHOhcyCll6dK+ATVWBRN8Kf9xAFLi62GW4gS6n2ELRWiXv
	L+TUL9yULGPP5mATMTxoCoeYYmpfBGQtXxtYLfc0lMAHECoGAWB2EqFmHyszeCDXpOt2
	IAHr8Jj1XHZ7nqqLwsuR8r2O9oj5znRTa+jewqO7SGluu94BDSGXfyd6aQnlWJkLtsX9
	RHZQ==
X-Gm-Message-State: ABuFfoiJP5MT1VEWni0kiSeY2o3NBYGEXi584qMf7McOxfCsDBFmWTDY
	HFYhh6OtaKH1yLr/co7v1KqwNt8j
X-Received: by 2002:a25:ace2:: with SMTP id
	x34-v6mr19272250ybd.161.1539203905994; 
	Wed, 10 Oct 2018 13:38:25 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:25 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:24 -0400
Message-Id: <20181010203735.27918-4-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b42
Subject: [Qemu-arm] [PATCH v6 03/14] migration: Add post_save function to
 VMStateDescription
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q/W4Q/52bO8Q

In some cases it may be helpful to modify state before saving it for
migration, and then modify the state back after it has been saved. The
existing pre_save function provides half of this functionality. This
patch adds a post_save function to provide the second half.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
---
 docs/devel/migration.rst    |  9 +++++++--
 include/migration/vmstate.h |  1 +
 migration/vmstate.c         | 10 +++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 687570754d..2a2533c9b3 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -419,8 +419,13 @@ The functions to do that are inside a vmstate definition, and are called:
 
   This function is called before we save the state of one device.
 
-Example: You can look at hpet.c, that uses the three function to
-massage the state that is transferred.
+- ``void (*post_save)(void *opaque);``
+
+  This function is called after we save the state of one device
+  (even upon failure, unless the call to pre_save returned and error).
+
+Example: You can look at hpet.c, that uses the first three functions
+to massage the state that is transferred.
 
 The ``VMSTATE_WITH_TMP`` macro may be useful when the migration
 data doesn't match the stored device data well; it allows an
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 2b501d0466..f6053b94e4 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -185,6 +185,7 @@ struct VMStateDescription {
     int (*pre_load)(void *opaque);
     int (*post_load)(void *opaque, int version_id);
     int (*pre_save)(void *opaque);
+    void (*post_save)(void *opaque);
     bool (*needed)(void *opaque);
     VMStateField *fields;
     const VMStateDescription **subsections;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 0bc240a317..9afc9298f3 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -387,6 +387,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                 if (ret) {
                     error_report("Save of field %s/%s failed",
                                  vmsd->name, field->name);
+                    if (vmsd->post_save) {
+                        vmsd->post_save(opaque);
+                    }
                     return ret;
                 }
 
@@ -412,7 +415,12 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
         json_end_array(vmdesc);
     }
 
-    return vmstate_subsection_save(f, vmsd, opaque, vmdesc);
+    ret = vmstate_subsection_save(f, vmsd, opaque, vmdesc);
+
+    if (vmsd->post_save) {
+        vmsd->post_save(opaque);
+    }
+    return ret;
 }
 
 static const VMStateDescription *
-- 
2.19.1

