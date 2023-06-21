Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128099ejb;
        Wed, 21 Jun 2023 13:36:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YCO5tgQtNhEyrtvA7WhAKvjGHHVPHGuXIubSDM0wtrPfSzluv68fAUHQc/xf1e0PUYtic
X-Received: by 2002:a25:e751:0:b0:bac:fc30:3913 with SMTP id e78-20020a25e751000000b00bacfc303913mr14000255ybh.21.1687379814094;
        Wed, 21 Jun 2023 13:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379814; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub2XWOR5AmXVhs3tM1DFdYhVkax9kKlFsh8Qpz/xQrMmwOgj/rYlcLmRvS3mv+q+G2
         ml3w6xiazbfSyLxcUUIyKrZtsWoWhtPoVApylloajtw1gk9g1v1nzirsWUPeo1GcKVrb
         ksxOrKkdDNNdUuCUZY9IPExb5Yf4s5rpLoEmfkl8IY+nu84E7t8KOACcjN2ghj2lFSI/
         hn1fHb55brB2z6CKO8Yaq73c/VnJyt9W0qQDZaOUd1jFIaDZI85SB/SeCH/MKFZ/L7Vd
         AVxT/RHNhDBu48veYHhQURlagVUTFuFjKfaCOcPJeraQqGAQwLA6txTlSYQiiHFboAV6
         kTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ng7WfdXlg9ZV8SK9VXpYm3h2tEulweiCY+p5AzwDX5o=;
        b=0j18u95EqSFxyJiPSJ5YnLkBILNi336N+8mm05L2pO/3LqDrnqSsftOTDwNmbnhz3S
         2acpFH+fLZdVQh7OFP/lrM0M+XDpVeqKpU+GqsYEahIjf/eiFxhx7PuRCFElK8SVLWjC
         F4ulrqUsQ3fDctOb96Rhoo9AAXT+vBeNnCu/ygc0ofkQyASBRppmETvzFCbKpOksb/b6
         HTKz2hC8zO4gTGN6yJnVB+McUsptZcXxiWtN3EyhmseQOl/HzPx/j+68JyPvquLGPfIC
         fz3WW3POCq0DmNWO6Lyu/WVuwdIggVvuwlyM/SKji/0cMogz8O42fZsww0JfAaaD1re7
         SIag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g1wZSB2y;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id x33-20020a25ace1000000b00bac530d712bsi4420618ybd.187.2023.06.21.13.36.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g1wZSB2y;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LKTmmw026718;
	Wed, 21 Jun 2023 20:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ng7WfdXlg9ZV8SK9VXpYm3h2tEulweiCY+p5AzwDX5o=;
 b=g1wZSB2y/IECQGExvUAk0LNFlvdF64DhAgy45vdWd8DdpZUttE8VohLRP9NWBAsJYwFP
 PbkcrXWw6taJshYGjy/XcqhjA4F9ql0q/tWXy/8jNgYUd5eSal9BMEKgJPe4hWRNWhfm
 1ih/RE75M9cWkYwc1m1lFEmWUxZ5US2attNvU28oYyFJyjsEGRnT99oJptdBQf8x5Nba
 u1JrpnSfi20WLo/JRMDdMtK9zV9aQxpY4YjXV0s43flp02tbfMSvVOApm+1qX9Xoq1g4
 e9srOJwh9z31/qmiMeLlfUm9DslLotjUWmqLOGyo02HEfV5Vjz3ylNEe5+Kh5sOI9uvK 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc89pg60m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:53 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKUapB029089;
	Wed, 21 Jun 2023 20:36:52 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc89pg5xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:52 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35LFaGE6031816;
	Wed, 21 Jun 2023 20:36:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r94f5aam1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKamwn16057020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52FC22004B;
	Wed, 21 Jun 2023 20:36:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC22620040;
	Wed, 21 Jun 2023 20:36:47 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:47 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 5/8] gdbstub: Report the actual qemu-user pid
Date: Wed, 21 Jun 2023 22:36:24 +0200
Message-Id: <20230621203627.1808446-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621203627.1808446-1-iii@linux.ibm.com>
References: <20230621203627.1808446-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AXPk5wnf-_p4Z-NMVCDfqwR7g9Nz4307
X-Proofpoint-ORIG-GUID: AF_Cuca7twhGw6Q8nUMi450LRQ98OGAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210167
X-TUID: MfN9HzclSjSW

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
index 9139fec92a..c7e3ee71f2 100644
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
