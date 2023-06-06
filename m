Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487686ejb;
        Tue, 6 Jun 2023 06:27:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XmLZR6seahT0Xr1VDF8FwYH55MIHlMRDvumsixsKXggAzn75DaN7Nb8K4OFbgm6YP7o9O
X-Received: by 2002:a0d:e547:0:b0:569:43de:4abf with SMTP id o68-20020a0de547000000b0056943de4abfmr2064722ywe.40.1686058078519;
        Tue, 06 Jun 2023 06:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058078; cv=none;
        d=google.com; s=arc-20160816;
        b=sQYmJBkifhqYtApTp7NKZEosFqEErYob/ZVaz7m20Wty41qmvbB4jpL6Wtt/8HTOhf
         gS3LtmEyrwJLgTjFGSii5BdZhGhN248DW+OPFqcXD5rU0ONpn+1gyMr4TWwjPyB+GIsF
         n8JuZ8xty8/Z505zKj7O81qxuXkVDObyjw20Zy5JvXu3N+AtHOyua3d1H5fJOFF4ifdY
         46m8GTikK0ui3Tm5f9T200+fMqItW07Vmd2nQxGLL5h7EUxyV9KULyyQ9I2poKrkf4Mk
         J/uLcpckqEi+CIHQLNDGskAmOSThGCC6HZmuPqVp3bjjBBupZRZi5RVeLmywkM40Jyu1
         X1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V55L8oLu++u0quixVVDzBN7/PotCahthoiOidjx/0sQ=;
        b=oC5vxcrio74A43IHKcxIw7PBCC7+DLyYm0OmSto8tnSKNdCSRA2Onc2XK2DXl4TMyw
         JEnV8B9av12wtzp9il4RxV3A4yxBPn2mwElHBmx5C82DmGKG5muS9F1oAkOs175sM6v3
         uQ/aMuwovvICzu0K3wNEAIb6kfTfBI7jBsEqKDGq0bvVN04scq5UdyghkrQHW2ag8Zad
         6TzteFQZrbO2enFVdiqOh8MjY1siDPr1BXZ+bRc2cZ0+sv3pO70ijafpnJCpcwCFsTNZ
         SH8e+Cn5jm9zoxHeH0L8nD0o9lSDDEzQ2s4KD5nI/mkHXXOwXjWj4FxrCkoF5HwaIljf
         ZrEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Xc37LsER;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id c3-20020a814e03000000b00565beec0895si9335161ywb.124.2023.06.06.06.27.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Xc37LsER;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356DLGbX003133;
	Tue, 6 Jun 2023 13:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=V55L8oLu++u0quixVVDzBN7/PotCahthoiOidjx/0sQ=;
 b=Xc37LsERTI7DP0S5JrC1IJJkAzoZ/9jW18wqezB51GrF4aAiU/bVGt3XITwmEV4FX5ku
 THN0QFAstKGqWzuNZpvDSJl7slUqMGG0AmbdMjLISPpKntgpIs/6jvslB7v1gGzqOMPC
 5zvuHN3ESneSqanIxe5Rj1rhgVIpUoaNwBsVe7zueSYMfy7WGZ3O3Z7V3W/aIP2I80ns
 45vRIsvg4nsL5BUeaYGBWBXEztqA03r7PZzrvTVG6zjqOIyvKIR7sen1xfUJrQaOjBl9
 bn1iHsKPdVxBaVsIEGFCqDsrxJw3nYZvfLkqKl+VRQP/ESZ1Hikdg/5bnWWYp+glhA7U cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25kr05we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:57 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DNvsM012672;
	Tue, 6 Jun 2023 13:27:57 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25kr05vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:57 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 356CjOVH016459;
	Tue, 6 Jun 2023 13:27:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qyx5q9hud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:55 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRqv320316804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADCFC20040;
	Tue,  6 Jun 2023 13:27:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C3E520043;
	Tue,  6 Jun 2023 13:27:52 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:27:52 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 3/8] linux-user: Emulate /proc/self/smaps
Date: Tue,  6 Jun 2023 15:27:38 +0200
Message-Id: <20230606132743.1386003-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132743.1386003-1-iii@linux.ibm.com>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qPYUydcvbwPaD_iVuKzDXC4XLUcu4F3f
X-Proofpoint-GUID: gyh5TgK_QloDXicl0iQPT3eCPCpmYO5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060110
X-TUID: xKwm4idgRY8C

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
---
 linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 28a0b1f7882..c1045ea7925 100644
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
