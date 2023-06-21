Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128060ejb;
        Wed, 21 Jun 2023 13:36:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XtHcxQJshmYB/ZLf6FCf5d/RBgx4smBRU2jmSUqXVCTjVkRi79RpWyjlJRnfQEG5/lV+g
X-Received: by 2002:a92:d3cb:0:b0:342:2b27:725c with SMTP id c11-20020a92d3cb000000b003422b27725cmr10376282ilh.6.1687379808386;
        Wed, 21 Jun 2023 13:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379808; cv=none;
        d=google.com; s=arc-20160816;
        b=BQmEorRY9S+gOY660WpCIvIGvfuf7r5v35Aq+Og/RMTbHr6BFM4l6Xif+OYSgIrFBV
         k5nSVdGFk2L47qqxBBanEHGkzEdit5VMM0XkiHilPy6e5BCyQxCjGz6i8mly9ISGuDwD
         5VORnLuDQ35sC2oKVXkTwz0C9J0HC/UeIxaKGPys4z6ZZGBc65vjvcjVw01bdV7Y+doN
         v1vtqf+kOwxIjk3lG/b8Kqgg1V5kc6GrGdEoaceI0nSIJzwu1UY+7veeXFFeRNpW6xrB
         w4jpYh92hiMjWeKSKITRprVaNF6mgnSi3oJSoBMYwNIaWrZtpVqyrQh1bGGyhehFeGZP
         Lyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G84DodHSsx2+R+Uh0++Gk9hlTeuuUerf2U/DEhm8Zo4=;
        b=M6rDSZDpV/rClFKeIJ1pg0T6DvGdkvpdPwLYdcj+zz1VA/ZLvrM37Ar8WSlEA/KqYt
         9tNJkAaA7unpnqM49Av/zqy2PuMX2QIyoX23mgWjXSR2bnkiMVV8IcbWOjsnIvVaAR5o
         xK3yAC3UHE35Go66A4/5fWulsEZWbnUgNTxVY7DkxEu9CVtv88Yjc4SboXHsmoye+Bps
         vVBd4uHy737NaZsBaLYVqsd6C7RbLUDwigv/jYQFcG3ayUSa6DroZtJO8QZ0fIM8Xy3w
         6cp/ZsjMvZ8ofrxPJjs51qbItmRoWhHe2j0lRr6BEfJTqLDY9mKL49z2B8fa0OACKp3p
         wP9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="Cx/8I7lD";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id l8-20020a922908000000b0034074b25c15si2078504ilg.162.2023.06.21.13.36.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="Cx/8I7lD";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LKEDLL021604;
	Wed, 21 Jun 2023 20:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=G84DodHSsx2+R+Uh0++Gk9hlTeuuUerf2U/DEhm8Zo4=;
 b=Cx/8I7lDkQQIxY9fnDxISARjoJ9ivzxcaXssnlBUHRvu6h+1vZbl8FjRwISEW0wKZXb4
 Co0FLjb0oGoJuvUYNdFvtoejWLIdW0is4GmGKQAZ12Sn+stQZ5C/b41Zjk/6Uv6gcvfO
 rhu3zdbaDkJp9E8RnKdZw7OEVBMBQ7yJsFX59wDh4MrTDewLj1wAMqOxtJGQ5sbrf9kh
 BNBa7mFRB6JbVg3zAkcE/GLFva6Izt/e4aySGitUYUDhx4NcjKbNPFSCHOC7K1oGwGdS
 6bX4iy1p/TU1sEeY9JBRig6X+dWilE/vIbATncUbhKxQvMY69z+De9AmX8LyeKQ3r8nb XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc82g8ey4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:47 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKG2g4026347;
	Wed, 21 Jun 2023 20:36:46 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc82g8ex9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:46 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L97hCO017775;
	Wed, 21 Jun 2023 20:36:44 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r94f5aa8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKafqB28771026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91ECE20043;
	Wed, 21 Jun 2023 20:36:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13EFC20040;
	Wed, 21 Jun 2023 20:36:41 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:40 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 2/8] linux-user: Add "safe" parameter to do_guest_openat()
Date: Wed, 21 Jun 2023 22:36:21 +0200
Message-Id: <20230621203627.1808446-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621203627.1808446-1-iii@linux.ibm.com>
References: <20230621203627.1808446-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AnmY8nIrlpyf3LdtNm26o4fsnvza8g7L
X-Proofpoint-GUID: z2hYohVPCc6hFoa50qdsB8JZ59pYEEFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210172
X-TUID: EBXp7q5zZz7l

gdbstub cannot meaningfully handle QEMU_ERESTARTSYS, and it doesn't
need to. Add a parameter to do_guest_openat() that makes it use
openat() instead of safe_openat(), so that it becomes usable from
gdbstub.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    |  2 +-
 linux-user/syscall.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a5830ec239..9b8e0860d7 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -166,7 +166,7 @@ typedef struct TaskState {
 
 abi_long do_brk(abi_ulong new_brk);
 int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
-                    int flags, mode_t mode);
+                    int flags, mode_t mode, bool safe);
 ssize_t do_guest_readlink(const char *pathname, char *buf, size_t bufsiz);
 
 /* user access */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index fa83737192..ecd9f5e23d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8449,7 +8449,7 @@ static int open_hardware(CPUArchState *cpu_env, int fd)
 #endif
 
 int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
-                    int flags, mode_t mode)
+                    int flags, mode_t mode, bool safe)
 {
     struct fake_open {
         const char *filename;
@@ -8476,7 +8476,11 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        return safe_openat(dirfd, exec_path, flags, mode);
+        if (safe) {
+            return safe_openat(dirfd, exec_path, flags, mode);
+        } else {
+            return openat(dirfd, exec_path, flags, mode);
+        }
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
@@ -8518,7 +8522,11 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
         return fd;
     }
 
-    return safe_openat(dirfd, path(pathname), flags, mode);
+    if (safe) {
+        return safe_openat(dirfd, path(pathname), flags, mode);
+    } else {
+        return openat(dirfd, path(pathname), flags, mode);
+    }
 }
 
 ssize_t do_guest_readlink(const char *pathname, char *buf, size_t bufsiz)
@@ -9027,7 +9035,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return -TARGET_EFAULT;
         ret = get_errno(do_guest_openat(cpu_env, AT_FDCWD, p,
                                   target_to_host_bitmask(arg2, fcntl_flags_tbl),
-                                  arg3));
+                                  arg3, true));
         fd_trans_unregister(ret);
         unlock_user(p, arg1, 0);
         return ret;
@@ -9037,7 +9045,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return -TARGET_EFAULT;
         ret = get_errno(do_guest_openat(cpu_env, arg1, p,
                                   target_to_host_bitmask(arg3, fcntl_flags_tbl),
-                                  arg4));
+                                  arg4, true));
         fd_trans_unregister(ret);
         unlock_user(p, arg2, 0);
         return ret;
-- 
2.40.1
