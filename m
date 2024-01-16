Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp580017ejf;
        Mon, 15 Jan 2024 16:36:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbYA9eFUgJ3scOVyDVtUQiQEuSZoBcXyEgxIHdhabtE4wdLxxXSSAyimW3AnJbEtLAiwzD
X-Received: by 2002:a81:ac56:0:b0:5ff:50e2:d5f9 with SMTP id z22-20020a81ac56000000b005ff50e2d5f9mr121654ywj.55.1705365363325;
        Mon, 15 Jan 2024 16:36:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705365363; cv=none;
        d=google.com; s=arc-20160816;
        b=Q90vI6y+AU+stWVxEfR5/litBjcxpA3i0z7KSk1r5F4dWaHTHpFmttVxLbffMf3P10
         Qm0da59/241mGhM9XsW+xkJVO9KEP9ljtTk5ftg6/0FK1VM78GLGAmaC318OWCOuxUTX
         SgAFTGw+FL4AV+rBUGhNzK8vtSVUGE6Mjl2KGpU3M3bT6SLzRxxkFt/dC2JTyu3khwi4
         wVesVbV6/l1tSO4z0IhDOJbgbRdwo7cr+7bfONU833XwL0BX7K3cywwYRO7DZ1ZcVE0X
         tbulWdTkYkjHDvVzZTnZ98udFLxd+rBgVVWlZDMPfDRX+YnSXv/cdAa3EbV7UeaI0Lnn
         uBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t1SC+zmPpc1Y0OU/FyOVQC5ZJl78RtELoSmL2Pk8z88=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=vU/pDyElFCO8QGdd/YUh7BTM5URylIMJ5E42Y7gxEDNa9anw1SYWoYhPRPHCqAJcQc
         6tUtzbuvDHkWeNSl24OB+DYbMNu6PtXxFc8yrGSKcBFa/s6jD7l39Frf4riM/T68Qsgh
         e6Lbk11upjUTUMr1n6aZ5YHZMjTs3JToZfuDrz0bwWy2UME1zDMRdjZIB492KKQHZpZv
         8RjGsibQtivNsACGLN5hSJQGmwMuMG4quDR/rj3p8c+57GRzkQYgA1RVHSOwJgdkoHzB
         c77qDhiIFgbuxNooOXvoqMqmunkX8NNyYSrAxmu+xWrK5iG4zKusbqGNN07X7/7EKYlC
         SndA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=XkdbvgHp;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id c4-20020a81c944000000b005e80cc44973si3630462ywl.150.2024.01.15.16.36.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jan 2024 16:36:03 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=XkdbvgHp;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40FNTxSX010544;
	Tue, 16 Jan 2024 00:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=t1SC+zmPpc1Y0OU/FyOVQC5ZJl78RtELoSmL2Pk8z88=;
 b=XkdbvgHpx16Bcpshp6weSMupdHX1W/SQwCNSXDoaSWO/jmuHj588U6Xm5iMUS2++IPY7
 C+J+l3qjxhPDaI+/CdqGdMyUtkvkWQfkeEMd5tfcrknsouwpAJLJdPtkz+X5a/kAvWzg
 6ZoK6DBudP0yQ+xxXTRpXatADrQw7yW2qK2WYcJSXbj6gC2K/z83Sw7PMiT1OCCuCHSQ
 FEb5nm+w/FpXKMl4FW8kp0UQth6A3EkGoi0Xi5KIs4I/sP7/6Df5zjzaFJnlT8QiDmzl
 gMWAXyKVlslCOIAs8+0MjaF2aSFu4pMalvGZ7wcKfU/2+ib1AC1LjjTekSISP3mMoR6i 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vncnekb2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 00:36:02 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40FNsO3H002689;
	Tue, 16 Jan 2024 00:36:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vncnekb27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 00:36:02 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40FNHk50014890;
	Tue, 16 Jan 2024 00:36:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm4uskph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 00:36:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40G0ZwAw4063896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jan 2024 00:35:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D886820043;
	Tue, 16 Jan 2024 00:35:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 366C620040;
	Tue, 16 Jan 2024 00:35:58 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.4.64])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jan 2024 00:35:58 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 1/3] linux-user: Allow gdbstub to ignore page protection
Date: Tue, 16 Jan 2024 01:31:40 +0100
Message-ID: <20240116003551.75168-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116003551.75168-1-iii@linux.ibm.com>
References: <20240116003551.75168-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: khQyEJLnj7dh6oK_bGSa1nhVrz2kALtF
X-Proofpoint-GUID: cIivWzxTHXKmxZHgbYsOs1hIISBdEjJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-15_17,2024-01-15_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=961
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401160002
X-TUID: DgE+gV12it+X

gdbserver ignores page protection by virtue of using /proc/$pid/mem.
Teach qemu gdbstub to do this too. This will not work if /proc is not
mounted; accept this limitation.

One alternative is to temporarily grant the missing PROT_* bit, but
this is inherently racy. Another alternative is self-debugging with
ptrace(POKE), which will break if QEMU itself is being debugged - a
much more severe limitation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 cpu-target.c | 76 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 5eecd7ea2d7..723f6af5fba 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -406,6 +406,9 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
     vaddr l, page;
     void * p;
     uint8_t *buf = ptr;
+    ssize_t written;
+    int ret = -1;
+    int fd = -1;
 
     while (len > 0) {
         page = addr & TARGET_PAGE_MASK;
@@ -413,30 +416,73 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
         if (l > len)
             l = len;
         flags = page_get_flags(page);
-        if (!(flags & PAGE_VALID))
-            return -1;
+        if (!(flags & PAGE_VALID)) {
+            goto out_close;
+        }
         if (is_write) {
-            if (!(flags & PAGE_WRITE))
-                return -1;
-            /* XXX: this code should not depend on lock_user */
-            if (!(p = lock_user(VERIFY_WRITE, addr, l, 0)))
-                return -1;
-            memcpy(p, buf, l);
-            unlock_user(p, addr, l);
-        } else {
-            if (!(flags & PAGE_READ))
-                return -1;
+            if (flags & PAGE_WRITE) {
+                /* XXX: this code should not depend on lock_user */
+                p = lock_user(VERIFY_WRITE, addr, l, 0);
+                if (!p) {
+                    goto out_close;
+                }
+                memcpy(p, buf, l);
+                unlock_user(p, addr, l);
+            } else {
+                /* Bypass the host page protection using ptrace. */
+                if (fd == -1) {
+                    fd = open("/proc/self/mem", O_WRONLY);
+                    if (fd == -1) {
+                        goto out;
+                    }
+                }
+                /*
+                 * If there is a TranslationBlock and we weren't bypassing the
+                 * host page protection, the memcpy() above would SEGV,
+                 * ultimately leading to page_unprotect(). So invalidate the
+                 * translations manually. Both invalidation and pwrite() must
+                 * be under mmap_lock() in order to prevent the creation of
+                 * another TranslationBlock in between.
+                 */
+                mmap_lock();
+                tb_invalidate_phys_range(addr, addr + l - 1);
+                written = pwrite(fd, buf, l, (off_t)g2h_untagged(addr));
+                mmap_unlock();
+                if (written != l) {
+                    goto out_close;
+                }
+            }
+        } else if (flags & PAGE_READ) {
             /* XXX: this code should not depend on lock_user */
-            if (!(p = lock_user(VERIFY_READ, addr, l, 1)))
-                return -1;
+            p = lock_user(VERIFY_READ, addr, l, 1);
+            if (!p) {
+                goto out_close;
+            }
             memcpy(buf, p, l);
             unlock_user(p, addr, 0);
+        } else {
+            /* Bypass the host page protection using ptrace. */
+            if (fd == -1) {
+                fd = open("/proc/self/mem", O_RDONLY);
+                if (fd == -1) {
+                    goto out;
+                }
+            }
+            if (pread(fd, buf, l, (off_t)g2h_untagged(addr)) != l) {
+                goto out_close;
+            }
         }
         len -= l;
         buf += l;
         addr += l;
     }
-    return 0;
+    ret = 0;
+out_close:
+    if (fd != -1) {
+        close(fd);
+    }
+out:
+    return ret;
 }
 #endif
 
-- 
2.43.0
