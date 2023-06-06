Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487688ejb;
        Tue, 6 Jun 2023 06:27:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6y4zNFaeUVFKkA337t1QwyCbU6XYpjmLOpTlgwYNUm77eFliA0LKnO0yOPInvznXewKB/O
X-Received: by 2002:a6b:6f15:0:b0:776:feaf:8cec with SMTP id k21-20020a6b6f15000000b00776feaf8cecmr2635972ioc.3.1686058078692;
        Tue, 06 Jun 2023 06:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058078; cv=none;
        d=google.com; s=arc-20160816;
        b=WayoB1IIB3QuLVXkaWgkmUVOdZskH9sbZf3lSkR6aZT6pPELkGiFPRdYYiTsoQaIJb
         ZifkD9DTinppAqTx7ycdrEzj6SKZGCTTbKK3IkfW++e6Y2LRl9RUcHwLNcdGeDX7WLMA
         3HrItnCqsll6dNv65JxlHwbJNzjJI4kSkD2zEfxGqmGYe0VdSjrrDKrDRnn66QPP15nU
         lnGirWHo3IfZlMwwbiU9d5o4x2gTnEjYvn/AMILv9+zZft6nD91SUta6VcAi/vyerinY
         ZfzOvDj5RLfHJyYLquqxPu6n1QRamN8zNgUI/OqDFWtUl0y8Xzj48YXSbI4VzXqp0VZJ
         ggBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xdn0Bz3RR8IqMHqOE7L3LDkDALzz1leH6y+1N4+MyrE=;
        b=XArE7ZS2KEvEBfOEcQPkliCR2sSCdlnV0g4+uO3JVd/XJU6gNecx7XSW7WXg3yW4yX
         8w/MV18vfvGF9Yu74gHipBQvOwvfvXBF04FANOtuLnOzBjIhFJIg2y/Eshb/YaZ9gb4f
         GArUFUa+1eM0GMp2XcIzwcFx7Jd2Yw+wLRL/BEJIQHFIQsUO3dBcdqfXJwMBb1UzCiwu
         K8EW8K6DDMCzgK7zOtSMpRLSCX6sW+55LDLB+FB1ebTkFx6DmMledCIs3LS8Ay0D6+Yi
         ctehZ+b4/ZSm240nTfZ8g2hH7dQNPphGgRydIByc8mCIqKvZn7S/1MyO/xDNUKoyihoc
         0Vaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qKQgH5Tc;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id u11-20020a6be90b000000b007532bc89378si4023465iof.5.2023.06.06.06.27.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qKQgH5Tc;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356DOmZV009242;
	Tue, 6 Jun 2023 13:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xdn0Bz3RR8IqMHqOE7L3LDkDALzz1leH6y+1N4+MyrE=;
 b=qKQgH5Tc4s9/AppN64jktCEQJok5y+nQnaMqpbYTfGkeh0NdlxuwJetotnjCgjwvyDun
 FDxYjL3xpvMidWNiVIPYV66f2M3TBBTvtJBXXXorIHXMwPrYmuX+FFIF+BexdFxVLJzg
 unGe3ctcCn9pLNemOv+qqBonoHsyA3ntF98gn2+epltyJWXf3rc9NFOdRAsr8I9DSuAJ
 EjDDCOCNy6wzNjHr6rzE8+DK8dHQvRP6aiecy34Vzgmei6sqxTaiBRhGd4+n1XXA4mbk
 QbLYgfSnuKNEDLm/zhupGscYw5a9Z6XYMbDYLMXaskvGpVFFWQZAca29WmNRxSC3SRoE ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25nq81u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:57 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DQCJF012974;
	Tue, 6 Jun 2023 13:27:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25nq81th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3562KVYT004003;
	Tue, 6 Jun 2023 13:27:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qyxku2034-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRpXC46596404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5BEC20043;
	Tue,  6 Jun 2023 13:27:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83F5E20040;
	Tue,  6 Jun 2023 13:27:51 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:27:51 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 2/8] linux-user: Add "safe" parameter to do_guest_openat()
Date: Tue,  6 Jun 2023 15:27:37 +0200
Message-Id: <20230606132743.1386003-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132743.1386003-1-iii@linux.ibm.com>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R7cN9ipcOT7WLzGqXK7e3ETtIDVtrwKD
X-Proofpoint-GUID: x3UVmFy0BSLArNhwhb-S4PzR8JxHm3vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060110
X-TUID: U+Mhv4NJf4it

gdbstub cannot meaningfully handle QEMU_ERESTARTSYS, and it doesn't
need to. Add a parameter to do_guest_openat() that makes it use
openat() instead of safe_openat(), so that it becomes usable from
gdbstub.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/qemu.h    |  2 +-
 linux-user/syscall.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a5830ec2396..9b8e0860d70 100644
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
index 2d3070cfd62..28a0b1f7882 100644
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
