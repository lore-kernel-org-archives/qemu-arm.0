Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487677ejb;
        Tue, 6 Jun 2023 06:27:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5R4GFYewi43mFIImbVmtotD72U/RcFupBprIocI8muAuVoCiihDlZ+LMsWXBxAPSOXg4r4
X-Received: by 2002:a92:d484:0:b0:33d:6988:bfea with SMTP id p4-20020a92d484000000b0033d6988bfeamr1476232ilg.21.1686058077922;
        Tue, 06 Jun 2023 06:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058077; cv=none;
        d=google.com; s=arc-20160816;
        b=uHJ38yww+LN7l2tUYgDKC8A9qLIgy36+Boj1ED7SkWm38O2eaOaoTgS/CcgB4pipaJ
         troi7G5NHHR+fShT2k4ls/y7E+fLS+gr+xZm7Kaolu3hxou1Ol0fSDTLSjBKKkbmZFV7
         TLhJSP/Zj5f8J2zk3KmD+7v8yBpL5BrrwEw4Z/vhJxA8tTSpUyDLBrYqjv667YIAghfK
         H+/XNR+z7nURaA6utb8GBaiHyd3kcQMEg0HAFk0oGf78b/s46NA5e/DaxwuGN6c2ru0l
         q7ht+YEATRfiVEVda+mG2cR7swLBY9j7y54gwcDevOlilqH/g+1piio/hwREsO4UIH4U
         OkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xH5VHKp/pM0EgokTZ+MwXc2AaB4DAgaCu4DiQOQiJX4=;
        b=NW0gdGKuRUuLlOneDzPIf9nlTkv1Z/LdsEy47Or3zYD3bLyntU8Kv+R8EZwCcKzxRF
         AvU9lGyj4fASB/RBBxMZ+mIxnTc6k3cORm/p/bFvGeGVzPuntHSKjM1JLEXQsEezMrgK
         z9XHeyKsqX/Be62n7x3Lvx3Cur7BX2mBYzFYvVMuQ1FsStitzfqW1HdDdemnm9NuMecd
         kBdhtx8TvF+EykfAi6A4Gy8BTKcutV0ZzMLa9FRm2W0mVGe15zgRkinW1T6IjS6RNJSp
         lDdnuDBO8GMaQxkKod55xx4vdVIUlf3ADqKvPBJ++JOroNIP0w41bDDOZID0z1HpY5uD
         WHXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=DLRNrQhd;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id r17-20020a92ce91000000b0033aaabf8e07si4162042ilo.120.2023.06.06.06.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=DLRNrQhd;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356DCBFK006696;
	Tue, 6 Jun 2023 13:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=xH5VHKp/pM0EgokTZ+MwXc2AaB4DAgaCu4DiQOQiJX4=;
 b=DLRNrQhd17jiTCUlQR8Kt0sjKX7E07+3+pdjL7/bTCywXo0DNFJGHS4f+ELk/+bLVe0g
 enLpbB37lEajPz2xfAjS/4pJMy/Amctg0ZSrs9GW2JSoZbw7huas7mh6AsrV0g4qZjE1
 mpBEGL6WHrkPW6tCzUmOrqVvvKGhOyJCdK+nU8rXYHm9gkXcSTlbABbr4Urea4P2pK/1
 DeEIs0dh79YKtEntSCCcxNYh2Lx/RE1gG2jzXRyihanHZemlRAc1qnnAe+4M/AZopKOy
 z286CU2Dnrrxv/iPVkGRvn1Gyhc+BlklzRHYM39KtADszLSIbxJ+EYorglwI4miXlq9q pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25fm8fbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:56 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DCGZZ006837;
	Tue, 6 Jun 2023 13:27:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25fm8faj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3568Gl9R017253;
	Tue, 6 Jun 2023 13:27:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qyxg2hyja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRp8u47579528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3E4620043;
	Tue,  6 Jun 2023 13:27:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B15E420040;
	Tue,  6 Jun 2023 13:27:50 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:27:50 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 1/8] linux-user: Expose do_guest_openat() and do_guest_readlink()
Date: Tue,  6 Jun 2023 15:27:36 +0200
Message-Id: <20230606132743.1386003-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132743.1386003-1-iii@linux.ibm.com>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Smpofwky4eEQxgPb9M6O5cgjP_WSouAO
X-Proofpoint-ORIG-GUID: 5ngXxn_AIYDEyh66D0-7w60HAviRCDTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2306060110
X-TUID: pNrfk/rDLI6Q

These functions will be required by the GDB stub in order to provide
the guest view of /proc to GDB.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/qemu.h    |  3 +++
 linux-user/syscall.c | 54 ++++++++++++++++++++++++++++----------------
 2 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 92f9f5af41c..a5830ec2396 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -165,6 +165,9 @@ typedef struct TaskState {
 } TaskState;
 
 abi_long do_brk(abi_ulong new_brk);
+int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
+                    int flags, mode_t mode);
+ssize_t do_guest_readlink(const char *pathname, char *buf, size_t bufsiz);
 
 /* user access */
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 83685f0aa59..2d3070cfd62 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8448,7 +8448,8 @@ static int open_hardware(CPUArchState *cpu_env, int fd)
 }
 #endif
 
-static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode)
+int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
+                    int flags, mode_t mode)
 {
     struct fake_open {
         const char *filename;
@@ -8520,6 +8521,36 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     return safe_openat(dirfd, path(pathname), flags, mode);
 }
 
+ssize_t do_guest_readlink(const char *pathname, char *buf, size_t bufsiz)
+{
+    ssize_t ret;
+
+    if (!pathname || !buf) {
+        errno = EFAULT;
+        return -1;
+    }
+
+    if (!bufsiz) {
+        /* Short circuit this for the magic exe check. */
+        errno = EINVAL;
+        return -1;
+    }
+
+    if (is_proc_myself((const char *)pathname, "exe")) {
+        /*
+         * Don't worry about sign mismatch as earlier mapping
+         * logic would have thrown a bad address error.
+         */
+        ret = MIN(strlen(exec_path), bufsiz);
+        /* We cannot NUL terminate the string. */
+        memcpy(buf, exec_path, ret);
+    } else {
+        ret = readlink(path(pathname), buf, bufsiz);
+    }
+
+    return ret;
+}
+
 static int do_execveat(CPUArchState *cpu_env, int dirfd,
                        abi_long pathname, abi_long guest_argp,
                        abi_long guest_envp, int flags)
@@ -8994,7 +9025,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_open:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-        ret = get_errno(do_openat(cpu_env, AT_FDCWD, p,
+        ret = get_errno(do_guest_openat(cpu_env, AT_FDCWD, p,
                                   target_to_host_bitmask(arg2, fcntl_flags_tbl),
                                   arg3));
         fd_trans_unregister(ret);
@@ -9004,7 +9035,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_openat:
         if (!(p = lock_user_string(arg2)))
             return -TARGET_EFAULT;
-        ret = get_errno(do_openat(cpu_env, arg1, p,
+        ret = get_errno(do_guest_openat(cpu_env, arg1, p,
                                   target_to_host_bitmask(arg3, fcntl_flags_tbl),
                                   arg4));
         fd_trans_unregister(ret);
@@ -10229,22 +10260,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             void *p2;
             p = lock_user_string(arg1);
             p2 = lock_user(VERIFY_WRITE, arg2, arg3, 0);
-            if (!p || !p2) {
-                ret = -TARGET_EFAULT;
-            } else if (!arg3) {
-                /* Short circuit this for the magic exe check. */
-                ret = -TARGET_EINVAL;
-            } else if (is_proc_myself((const char *)p, "exe")) {
-                /*
-                 * Don't worry about sign mismatch as earlier mapping
-                 * logic would have thrown a bad address error.
-                 */
-                ret = MIN(strlen(exec_path), arg3);
-                /* We cannot NUL terminate the string. */
-                memcpy(p2, exec_path, ret);
-            } else {
-                ret = get_errno(readlink(path(p), p2, arg3));
-            }
+            ret = get_errno(do_guest_readlink(p, p2, arg3));
             unlock_user(p2, arg2, ret);
             unlock_user(p, arg1, 0);
         }
-- 
2.40.1
