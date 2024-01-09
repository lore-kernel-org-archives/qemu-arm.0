Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp690145ejs;
        Tue, 9 Jan 2024 15:08:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhG+36AjgAivYpxmfRMKXFoHJO4aJaayWAZXCNX2nCQbXbF4Kz02a5ZRbo3va7x+UYA3DW
X-Received: by 2002:a25:74d3:0:b0:dbe:9f4a:6bb0 with SMTP id p202-20020a2574d3000000b00dbe9f4a6bb0mr111850ybc.56.1704841696386;
        Tue, 09 Jan 2024 15:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704841696; cv=none;
        d=google.com; s=arc-20160816;
        b=bd5cKP36EvOjK9Tj812AbrWkTCr90wHK9CJZNv/6eL1T2TwMKhcqan0X/4kAgYSS8j
         nxEYw2XOQXLk9wHWtBE80u5hUmRXEEqwFs3rDkmiwje/E4cg6WonaDyU/NwNwT/dOhAW
         I87Nh67OuXAWjR/mwX/gdRzbdfd2w/jy7wFt5fLFzQKShpttrn9Pu4qwnG91Gbh9kIsX
         Waq1s2LiSl1g9IreEA+5l4Xif3ynmDGpO69otw+r5mGuKK6V0V4zEcS/F/jjSFF6WLeP
         SncEg6hvZtgpFV7v76+UIPTlRmd5T97l99j+ZIwLgTf3NbNvMf+bC2d2isIlZcmxIXEr
         JP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Epq4/2IrxAEyKNucGP8jLu0j7rl0e55OIlmgNSesLlI=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=Ugbx4osEunvjOyQLze93lie+P7Q7XzBeYHFoYP7ogtwflheIcpqcAk1hlCLO+urcYG
         sM0Y+FLSH0oBMe0JoJiO4F3nbsF1/w4b6hjYer0Q73sM6IYFT79H/xb5l7VgZKW9VBF5
         Y9PKRd/KrrGufHHsjsqE80Em9dc2T37I8wXsDOr6OQwqMMWcWANPf9EKWnAnkrC99z9w
         QFdMkHVQhGfI0Ke0FsyTz6+FYoUcmMznV1232iUoCS2OqmHGxsghyToMBpELrR1eXWG1
         7k+GvbiHiG5b9Kk8RAnhxGDLqepLxMce/YNHcnf2yqI+mux+nd3xTCYnTyv56oF+12r0
         1fxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=LITHvL9G;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id j3-20020a255503000000b00dbd55dd8730si1518280ybb.256.2024.01.09.15.08.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 15:08:16 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=LITHvL9G;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409KkfUC015417;
	Tue, 9 Jan 2024 23:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Epq4/2IrxAEyKNucGP8jLu0j7rl0e55OIlmgNSesLlI=;
 b=LITHvL9GCGDrp5IEtrXjIz9pwA82IHn4d9EaU5N7kAVKOZfNBX+6jYsbR742gLBFgudq
 M7Mmn0l1s4Q3d5YfESIKTNMW9uantX0Cy8zFNDbPAURXczCtohbJPz1nCmLKhFVmzHku
 1eJQD7Zl8Cb9dWjVpoy6gL91gxZD7Cgwle0DsHCahBdMhgEVrU+Qv3HxvO1nC2v8dIS7
 iPVxbwELBeSnVSApD9phj+lzN8eRNorSS09ErCtemV27YHIWsQHz6rdc3EZ0Fr0A16DO
 y/on+evgOLvKPpFphwPMd85PDIIdtx04sj5fL+FTTKWQjfVQlbQxuCcsFgUAw48gnjAz Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhbvnn1n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:15 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409N8FMV022099;
	Tue, 9 Jan 2024 23:08:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhbvnn1mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:15 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 409LLbfC028052;
	Tue, 9 Jan 2024 23:08:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vgwfsnqmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 409N8Cwh25559460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 23:08:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70C322004B;
	Tue,  9 Jan 2024 23:08:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D00AE20040;
	Tue,  9 Jan 2024 23:08:11 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.60.193])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jan 2024 23:08:11 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/3] linux-user: Allow gdbstub to ignore page protection
Date: Wed, 10 Jan 2024 00:05:53 +0100
Message-ID: <20240109230808.583012-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109230808.583012-1-iii@linux.ibm.com>
References: <20240109230808.583012-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L_cNUuJwUs8NaX2bEdLCCe4J_xJxTo7k
X-Proofpoint-ORIG-GUID: A322wC64wfNUMpPpvhlpJeuMkgJPi93p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=962 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090186
X-TUID: 8UIYMUGqDZYn

gdbserver ignores page protection by virtue of using /proc/$pid/mem.
Teach qemu gdbstub to do this too. This will not work if /proc is not
mounted; accept this limitation.

One alternative is to temporarily grant the missing PROT_* bit, but
this is inherently racy. Another alternative is self-debugging with
ptrace(POKE), which will break if QEMU itself is being debugged - a
much more severe limitation.

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
