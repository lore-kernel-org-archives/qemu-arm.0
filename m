Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128072ejb;
        Wed, 21 Jun 2023 13:36:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5G2C6WyrkjRQBEWj2yhJsOB8oM7DgJ1lu1CPGALUunGZgxEc+IXPK5Omwo5Oy2arEseUIy
X-Received: by 2002:a25:6609:0:b0:bab:b84b:e500 with SMTP id a9-20020a256609000000b00babb84be500mr11473091ybc.33.1687379809541;
        Wed, 21 Jun 2023 13:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379809; cv=none;
        d=google.com; s=arc-20160816;
        b=vF8Eymnt4vd3OIk7wLmHIf4T4AP2/ES2hxhunerrs4gZYK/3mxH+Yfm86zPpCPIA3f
         SEbMukJkmHpRM5N5P+C/cX1qL2powI02kSONPadouu2shT3n+uZidt9a/W0hlnaIBP+1
         C54OK1YaLSIvTK9lBLIKiPxfyDwf6Cqfcy1ECDYo8zg6s1x5cb97r/qpRtMIELJEcfSL
         c3mGNTGcRsrMy92JYJv8UvwKZ2z3MGxextn+lRSOgTP/Qaqz14ANrnPqufWUL+K0Xrq3
         Rx1/I4jsTwQMFkRZG3wZjFLU8A7sly4xP3XNmN6vsOCJlHhTz7tsijiH42lC5PduTbfV
         le8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NKnkVeDXnL9p5qjmprO1civlthCt5Eb82R3lV90MBQU=;
        b=AkeDIloihpte7swojnPP+1Q/eH5dTrYzoBelPtJZZiQCrqXMtn+3ipx7SzHEH8ooYw
         /zPcSfkR8mpoBboDh0tcXVHATIAwVJcJp5kYIlvWE9x/aRqzG65KLFyLQkdTwku27beA
         43PIkUQDXNpzGNjIxymvrF8xHI/EbcTLsLDeP4Q1A1g9Ykrrea0Aac4h2Ly3A8ufFWRv
         5KccvIklWCVBHrxdU1sJToQUTjaVp5pdOQkRNBu7a5UTHrDdty9RxvQbIl34NBJXkkr2
         jPNcI2dA/WApcRg3llhRrJXAD7NhJ/DY9rzo0ZeyxU7FahNyD4W8cjoLNvP+kxfJPo+A
         09sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="Z/M8mjcl";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 82-20020a251455000000b00be57c8573a9si1206705ybu.49.2023.06.21.13.36.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="Z/M8mjcl";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LK9tJH016304;
	Wed, 21 Jun 2023 20:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NKnkVeDXnL9p5qjmprO1civlthCt5Eb82R3lV90MBQU=;
 b=Z/M8mjclEmyfQgeKckGp83G8AaU4wazlL1sXPZy07mTZ6FxvJ47aDj4FRc4//GFAEZ1j
 WSKtIAG2k2MLvHenaO7XXKKEFVFwlKdPywrhu5/X5o7hj1QkiO9C55rbUmfF5pdV+MjV
 3XkU2y/T+P6t0HAGEmlPUq/8vR8Dp4ba+fDeIbebwwPhkDDJ+onyB+R+cgSEfHdP55nJ
 2NCOkRRxQ/kgyv7nFXGi1yHFAhdyP+DpFEIVI7rHFnMGahKz51k0rUWxvIyp9lwJJtMH
 V8QQtWbP5ZDpfwIhD7z+JXCiqi3iod3Ha/CidFLfR1HEy1T51Ir4AOCXUfJLDSzDmqr0 pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc7u98t0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:48 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKDemV031048;
	Wed, 21 Jun 2023 20:36:48 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc7u98syx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:47 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L3oNXc002196;
	Wed, 21 Jun 2023 20:36:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3r94f5aasv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKahdH30999262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B5C320040;
	Wed, 21 Jun 2023 20:36:43 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB7620043;
	Wed, 21 Jun 2023 20:36:43 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:42 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 3/8] linux-user: Emulate /proc/self/smaps
Date: Wed, 21 Jun 2023 22:36:22 +0200
Message-Id: <20230621203627.1808446-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621203627.1808446-1-iii@linux.ibm.com>
References: <20230621203627.1808446-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kK1gxCTdCrJrcv31Z92vArUK77-V1oli
X-Proofpoint-ORIG-GUID: bZGMfZESkRzPWgw_XO8rpx44dPCIMIbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210172
X-TUID: 4YpFVfRJllJU

/proc/self/smaps is an extension of /proc/self/maps: it provides the
same lines, plus additional information about each range.

GDB uses /proc/self/smaps when available, which means that
generate-core-file tries it first before falling back to
/proc/self/maps. This, in turn, causes it to dump the host mappings,
since /proc/self/smaps is not emulated and is just passed through.

Fix by emulating /proc/self/smaps. Provide true values only for
Size, KernelPageSize, MMUPageSize and VmFlags. Leave all other values
at 0, which is a valid conservative estimate.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ecd9f5e23d..08162cc966 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8042,7 +8042,36 @@ static int open_self_cmdline(CPUArchState *cpu_env, int fd)
     return 0;
 }
 
-static int open_self_maps(CPUArchState *cpu_env, int fd)
+static void show_smaps(int fd, unsigned long size)
+{
+    unsigned long page_size_kb = TARGET_PAGE_SIZE >> 10;
+    unsigned long size_kb = size >> 10;
+
+    dprintf(fd, "Size:                  %lu kB\n"
+                "KernelPageSize:        %lu kB\n"
+                "MMUPageSize:           %lu kB\n"
+                "Rss:                   0 kB\n"
+                "Pss:                   0 kB\n"
+                "Pss_Dirty:             0 kB\n"
+                "Shared_Clean:          0 kB\n"
+                "Shared_Dirty:          0 kB\n"
+                "Private_Clean:         0 kB\n"
+                "Private_Dirty:         0 kB\n"
+                "Referenced:            0 kB\n"
+                "Anonymous:             0 kB\n"
+                "LazyFree:              0 kB\n"
+                "AnonHugePages:         0 kB\n"
+                "ShmemPmdMapped:        0 kB\n"
+                "FilePmdMapped:         0 kB\n"
+                "Shared_Hugetlb:        0 kB\n"
+                "Private_Hugetlb:       0 kB\n"
+                "Swap:                  0 kB\n"
+                "SwapPss:               0 kB\n"
+                "Locked:                0 kB\n"
+                "THPeligible:    0\n", size_kb, page_size_kb, page_size_kb);
+}
+
+static int open_self_maps_1(CPUArchState *cpu_env, int fd, bool smaps)
 {
     CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
@@ -8089,6 +8118,18 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
             } else {
                 dprintf(fd, "\n");
             }
+            if (smaps) {
+                show_smaps(fd, max - min);
+                dprintf(fd, "VmFlags:%s%s%s%s%s%s%s%s\n",
+                        (flags & PAGE_READ) ? " rd" : "",
+                        (flags & PAGE_WRITE_ORG) ? " wr" : "",
+                        (flags & PAGE_EXEC) ? " ex" : "",
+                        e->is_priv ? "" : " sh",
+                        (flags & PAGE_READ) ? " mr" : "",
+                        (flags & PAGE_WRITE_ORG) ? " mw" : "",
+                        (flags & PAGE_EXEC) ? " me" : "",
+                        e->is_priv ? "" : " ms");
+            }
         }
     }
 
@@ -8103,11 +8144,25 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
                     " --xp 00000000 00:00 0",
                     TARGET_VSYSCALL_PAGE, TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE);
     dprintf(fd, "%*s%s\n", 73 - count, "",  "[vsyscall]");
+    if (smaps) {
+        show_smaps(fd, TARGET_PAGE_SIZE);
+        dprintf(fd, "VmFlags: ex\n");
+    }
 #endif
 
     return 0;
 }
 
+static int open_self_maps(CPUArchState *cpu_env, int fd)
+{
+    return open_self_maps_1(cpu_env, fd, false);
+}
+
+static int open_self_smaps(CPUArchState *cpu_env, int fd)
+{
+    return open_self_maps_1(cpu_env, fd, true);
+}
+
 static int open_self_stat(CPUArchState *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu(cpu_env);
@@ -8459,6 +8514,7 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
     const struct fake_open *fake_open;
     static const struct fake_open fakes[] = {
         { "maps", open_self_maps, is_proc_myself },
+        { "smaps", open_self_smaps, is_proc_myself },
         { "stat", open_self_stat, is_proc_myself },
         { "auxv", open_self_auxv, is_proc_myself },
         { "cmdline", open_self_cmdline, is_proc_myself },
-- 
2.40.1
