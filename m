Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487701ejb;
        Tue, 6 Jun 2023 06:28:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Kxft8005zZNMjqp1IFue+r/ndQK83qQ+DrJM7ER2ZAMS+YCTBZPI2GhWR1jAUm9Hqp0i5
X-Received: by 2002:a05:6902:3d1:b0:bac:a43e:88e9 with SMTP id g17-20020a05690203d100b00baca43e88e9mr1748818ybs.44.1686058080515;
        Tue, 06 Jun 2023 06:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058080; cv=none;
        d=google.com; s=arc-20160816;
        b=i/hjRWJiIQkpA1OsrPMzUM40tywQg6FdNXDM0nd/iDXJfA+bTZHrSJX8y2XJ8O1wbC
         Slz1vkQXazlSu14LIzD/hBF61l9+S87kTNnKKzXb8iYk10P9drNgqEYEuNnsBdz5FSeK
         c5IyrPkacan7q0q+7wd/NvCHR76zhX+YE1TWAlED4VB0g91pHFrjG3Nov6BI7Gje28Lz
         ZOSk1YW0Oku7r7Hr5KZeBQRz5JaZDtKbfXXB6E3rmuM8GCyLCPUofGBMIojSN1jF8uyT
         k/e4LG/mUwtchUX6qSKZuipJNpD7OFtxjQfXh4AWU5859uMRoicV495/3afGyeEe4RvU
         Cqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ttuqpbzwhJ4Wl/jaHNKltf3RIbjvKG8zKbpGiPou+Cc=;
        b=pDJ0Un7DeIiQz8FlKuLB2Ns1C6UpyRx3dL0fQwzM2HF99NnHlFVXU5pedsTW2mXQdg
         IlK+gN+Lm3f4aLvm8Hh1qbUlAWAaxUgTb+GZ2Z1J3rvd3/kUe+JvQCPC+DxuOGZXCILh
         XsiZUua7M/dezsjHtuAxc5IVKTU5sT9DD538Gw+2rplUWzgRL4OAXU2U/wSsylgO8yf9
         UMDl+GuLSNCjSbQN3j1Am+JoLibWjKkpjp/3BMdKtHhpWWh5lH+lOFpFdcst4r68FWdl
         NOVvZyWg2mOPOHjTsTXtnLzjQVETQF/ZRcfS1BaWw7HHtU2UMK/zdr/gwulon/IH2Cko
         G9IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Kq8+twtI;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id y8-20020a25ad08000000b00ba71bb7cfd8si9173167ybi.368.2023.06.06.06.28.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Kq8+twtI;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356DNImB013231;
	Tue, 6 Jun 2023 13:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ttuqpbzwhJ4Wl/jaHNKltf3RIbjvKG8zKbpGiPou+Cc=;
 b=Kq8+twtIGJV2qxFD8VYJzRSgrmKHFrxPBSo3FV9rbZl2n1epugkK/K5oqUz5vJ/ov4PS
 ijsatIjXc1BGOuTqs1QZ6bK5yyOR/FFPnRTvecx5O856JeqR5iAwyvOA+fP5c0bcuX3F
 AnaLHGti7NmBhPFSLmZP3fju3Ku3ppq3b1qxxrLWCPv0ke3aUlz6ftsR4AIyrX2WgOqk
 bs1B0CWCeIZib16fX9FeY9N57IT2Emv/Lw0g1OY9ZSoR4vl8hiPyTu8faLlGWVJZ+1p3
 crEtk3aRmi6fXDznKalFvNWzX3DBDahXEn4m3JY1+Ka5FfyUbUzIyfr2cE6O4FAlPRr1 sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25mt030h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:59 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DPFJX017691;
	Tue, 6 Jun 2023 13:27:58 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25mt02yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:58 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3566ZUlo030680;
	Tue, 6 Jun 2023 13:27:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qyxdfhj4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRsYQ27328794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33C2F20043;
	Tue,  6 Jun 2023 13:27:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E61B120040;
	Tue,  6 Jun 2023 13:27:53 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:27:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 5/8] gdbstub: Report the actual qemu-user pid
Date: Tue,  6 Jun 2023 15:27:40 +0200
Message-Id: <20230606132743.1386003-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132743.1386003-1-iii@linux.ibm.com>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K1-7-6BN05uRzY4X3uDJsqVqn4m1Vy0t
X-Proofpoint-ORIG-GUID: eNu7pW28H4i-pxoPKFQ4U6NwwFv82AjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060110
X-TUID: tytjiuczesty

Currently qemu-user reports pid 1 to GDB. Resolve the TODO and report
the actual PID. Using getpid() relies on the assumption that there is
only one GDBProcess. Add an assertion to make sure that future changes
don't break it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 gdbstub/gdbstub.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 9139fec92af..c7e3ee71f2f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -202,13 +202,16 @@ void gdb_memtox(GString *buf, const char *mem, int len)
 
 static uint32_t gdb_get_cpu_pid(CPUState *cpu)
 {
-    /* TODO: In user mode, we should use the task state PID */
+#ifdef CONFIG_USER_ONLY
+    return getpid();
+#else
     if (cpu->cluster_index == UNASSIGNED_CLUSTER_INDEX) {
         /* Return the default process' PID */
         int index = gdbserver_state.process_num - 1;
         return gdbserver_state.processes[index].pid;
     }
     return cpu->cluster_index + 1;
+#endif
 }
 
 GDBProcess *gdb_get_process(uint32_t pid)
@@ -2146,19 +2149,25 @@ void gdb_read_byte(uint8_t ch)
 void gdb_create_default_process(GDBState *s)
 {
     GDBProcess *process;
-    int max_pid = 0;
+    int pid;
 
+#ifdef CONFIG_USER_ONLY
+    assert(gdbserver_state.process_num == 0);
+    pid = getpid();
+#else
     if (gdbserver_state.process_num) {
-        max_pid = s->processes[s->process_num - 1].pid;
+        pid = s->processes[s->process_num - 1].pid;
+    } else {
+        pid = 0;
     }
+    /* We need an available PID slot for this process */
+    assert(pid < UINT32_MAX);
+    pid++;
+#endif
 
     s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
     process = &s->processes[s->process_num - 1];
-
-    /* We need an available PID slot for this process */
-    assert(max_pid < UINT32_MAX);
-
-    process->pid = max_pid + 1;
+    process->pid = pid;
     process->attached = false;
     process->target_xml[0] = '\0';
 }
-- 
2.40.1
