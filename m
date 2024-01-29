Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp55785ejk;
        Mon, 29 Jan 2024 01:34:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0BWjVRC9ttrBAEoSMUqQNaibUrrsW/LU+HP0LY5ulumCfKEFfIQ8gU5oogYRyPV3JvTBs
X-Received: by 2002:a25:86ce:0:b0:dbe:9d16:ac6d with SMTP id y14-20020a2586ce000000b00dbe9d16ac6dmr2178503ybm.20.1706520862225;
        Mon, 29 Jan 2024 01:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706520862; cv=none;
        d=google.com; s=arc-20160816;
        b=cFhlhULbdk58cDgcI7oYn/H+5ucBxFYpXRQ9Yk9uGy8Y+G5eVzGXshblknRkR9Yxzd
         n9fgfkjdM5ctknCbwrDgORIEb9iZ2D66+n+2tsUg5O5Ly6H98QOldL2Qq6iqafPue0En
         V9LFzOCFgumr5MH7LAhsZHetI3qHv+3txq8nuw/SclXqAKJv55OWPS6qi8nqZwpK+Vvy
         +bXsKwGU0FnOwWsCXvQ0lN3WAiMxoC6Yyt9jTCfG/EeE3Hr58BEShNN1o63T/6Lq+XKC
         w5dMk+q5AYtLLgPgeWWvOZLSk+jb+croMt3JNTIsZ6NI3AHK3JUHbx3laqfcfFCzDV4O
         pwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EMJdS9hKoA7kur7DqvESiD5ICfk5HChs5chrzcRw4VA=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=KvCKGapzli06Hjkfyxgj4TITncsolUv9c7htCTrFiKc2nkLcRJm/4finhPdL54ZySG
         4iRB8sAhoWUVeqW3IeSryVezXDyhsrzOheu65v4Dqc/uwbaG/R9uD8EGo0rujxY3v65U
         BF6r38Ymyk7DWQWKsx0I9iuz3Ad31r9pwd7suDjaIUt/MgsbCrH9ol4/FbF+vBzIGJ67
         D+3AXG0ha55+1JD3rrjeuoFcwxvUwVnAfnKgOmtsifjZbLWNVG5gt2mduJs5JH8ZrRlB
         sAKpkYGXCSadyiX0iKmnMaDowDzwfeZzP4u7kFPWKfHQjo3VgKcq6yp1Tg7xhUOl68Yz
         Yx1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=iKiG6O06;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id p123-20020a252981000000b00dbd4661c3casi3187491ybp.115.2024.01.29.01.34.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jan 2024 01:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=iKiG6O06;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T85RFo023735;
	Mon, 29 Jan 2024 09:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EMJdS9hKoA7kur7DqvESiD5ICfk5HChs5chrzcRw4VA=;
 b=iKiG6O065kT97uCxVSERS2RUqwr84bZ5G8ph6PkYQMh4W525rQfTDuTSn8NhhVTxzV6G
 fmRoaX7wKpsWuJfYMsresSzCtNSCEwpK2rG5LKsK4S2XSBKglXNM9FTNx1HEy53qB7jx
 Vd+ToIuBIVppy2//ilGKBIl+AKjc+Nv7MTYDuM+sMS8qcRRsfGepwZRVT5FH0FKq4lek
 wAFGM5oXFKZ66jjxyABF0qHS8z9tNIRFWRiyiQ/TukPCySwWXD4AOWvX/+jGbC18+grv
 fx4LhyEN7naOX12OThZz+TO7K9uDRVW2YSzNPC2qY/WQ3XFvQ+61gvuRn8HoKF8yDYZJ ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx86vsvua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:34:21 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40T8tqGD027692;
	Mon, 29 Jan 2024 09:34:20 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx86vsvu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:34:20 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40T6jKaV007188;
	Mon, 29 Jan 2024 09:34:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vwev1xvry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:34:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40T9YIGH24314388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 09:34:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1870D20043;
	Mon, 29 Jan 2024 09:34:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E2DF20040;
	Mon, 29 Jan 2024 09:34:17 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.179.7.240])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jan 2024 09:34:17 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 1/3] linux-user: Allow gdbstub to ignore page protection
Date: Mon, 29 Jan 2024 10:32:14 +0100
Message-ID: <20240129093410.3151-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129093410.3151-1-iii@linux.ibm.com>
References: <20240129093410.3151-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R7YmqST-Dcuiy1Fw9vbI2XzNZPN04mln
X-Proofpoint-ORIG-GUID: wgwPKY-5wCbwjbq3D4rqeYil9sWISlbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_05,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=951 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401290068
X-TUID: JhELGQYnzM98

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
 cpu-target.c | 78 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 15 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index f6e07c3deb1..958d63e8823 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -382,6 +382,9 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
     vaddr l, page;
     void * p;
     uint8_t *buf = ptr;
+    ssize_t written;
+    int ret = -1;
+    int fd = -1;
 
     while (len > 0) {
         page = addr & TARGET_PAGE_MASK;
@@ -389,30 +392,75 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
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
+                written = pwrite(fd, buf, l,
+                                 (off_t)(uintptr_t)g2h_untagged(addr));
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
+            if (pread(fd, buf, l,
+                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
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
