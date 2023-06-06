Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487690ejb;
        Tue, 6 Jun 2023 06:27:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7SNK45ztm0RS1MchYx5NVTnx80D7TK5F/nYdsSzTv7/PAPQ1rinkpVniaFyHZ8WXs/0F6m
X-Received: by 2002:a25:ad66:0:b0:bab:dedb:5234 with SMTP id l38-20020a25ad66000000b00babdedb5234mr2239609ybe.26.1686058078819;
        Tue, 06 Jun 2023 06:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058078; cv=none;
        d=google.com; s=arc-20160816;
        b=NYSLKSpK4hsnI0gIZaJ93B5Lc6OlyTZTMzuKXAE8TI2cIySz7oaZF/NIh6PF2gtb+U
         MTH1PA/YGTWH0txtFa4eT+kWeQyyJHbOfOFus2V+N/Pez1edUF9AR3Tj2zekICBPogP3
         DRRB7+i2pHr3VXNtTSvTB2in8GvSxIyLOqVJm6z1B5RsWPTYKIf6WJvdYcIoFLn9vqRU
         QmhbQ1Pgrg6ejQQaOlTSqtN2jHoM1JVEFUc6gPybDFLrdM2D30DrBobuNh82iGVcf+xD
         7i1XuAZtwSjqKsX7iodTtHCwIDL913dZWr5U6KVBotXVMqVIwfPMG8b4h/oKwvuwIOh4
         Ny+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fkwdn8Ws44aD3rYO1PmOzo+tlEe5wrfn+U1LKWP3rWs=;
        b=OWxr2m3GfOoZN11RqJjk1hiVqF2m4uuPSB8zeyJIWtdoKLl4S9wyKWwOS6LgPuoJLP
         Qs3+ujfIZ/yJ82oHH2uPxCUMaC2/Cw9mb7LlON5iz+42kwPQv51cwvnVrCPposejY9/u
         xkd8I9g182rI0cFR41xZnqIRr7YcSU+sXugHo5DfPXjTRwcKozIv2Zs+mKkMGWoVTlTO
         5Me9U56q3Pk2GyygPSQQqfxekXmXO+7zL/iSAn7ZrKlEE1RKMAud6Ukppzi+c87sfcPV
         D8tY5Bf2JYqpzIGUf8fQJdpoLkkU3EoYvlJbvOvPbkKsGXEcJ8jFs5ufucCDqGhqJ5oS
         uC/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dc9b1Eoj;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id m76-20020a25d44f000000b00bad057b18dfsi10642231ybf.16.2023.06.06.06.27.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dc9b1Eoj;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356D897H023564;
	Tue, 6 Jun 2023 13:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=fkwdn8Ws44aD3rYO1PmOzo+tlEe5wrfn+U1LKWP3rWs=;
 b=dc9b1EojKc0OvvNBqJsq1ZwdWfH5t+fvakJFeswTWZz3FEv/5GSzoqJhyEDjScIrfCdL
 7Imq9JIKbl/5X7MsvBGDfp8w/KRZWO5t5u0X+QXt+ubR71FCglostNC0fdWWjE6hmWir
 jOyZ/Pl3YUcI7a2xnf/5fdzi6SJ54cCJmnMCTogOrY4QIUMvtk87ioj05FVBakAZCCxI
 3Q2aN8g6Ow5J1sb9Py92NcFvWJP9nWJlIUXYuD2MagRxINGkVjyG6PEJ7P86/MEWm3E/
 WhgV1zA0acRPbO5ymrxXWrkQpNG7PP4AtNwbkYIBrGWybqlezsG5+XtjSXdO1SMiLblz zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r258srutm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:58 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DHvDD025813;
	Tue, 6 Jun 2023 13:27:57 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r258srut1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:57 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 356BO9pb001944;
	Tue, 6 Jun 2023 13:27:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qyxdfhj4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:55 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRrQM12255802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C45B2004E;
	Tue,  6 Jun 2023 13:27:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28EE120040;
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
Subject: [PATCH v3 4/8] gdbstub: Expose gdb_get_process() and gdb_get_first_cpu_in_process()
Date: Tue,  6 Jun 2023 15:27:39 +0200
Message-Id: <20230606132743.1386003-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132743.1386003-1-iii@linux.ibm.com>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 863Eiht3FHFZ_zxMIjaZI1up11YtI5Ez
X-Proofpoint-ORIG-GUID: mZuZl-yoYspHxOUUORQCzOkrMPTwIY3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060110
X-TUID: MDw7DYD06y8n

These functions will be needed by user-target.c in order to retrieve
the name of the executable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 gdbstub/gdbstub.c   | 16 ++++++++--------
 gdbstub/internals.h |  2 ++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be18568d0af..9139fec92af 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -211,7 +211,7 @@ static uint32_t gdb_get_cpu_pid(CPUState *cpu)
     return cpu->cluster_index + 1;
 }
 
-static GDBProcess *gdb_get_process(uint32_t pid)
+GDBProcess *gdb_get_process(uint32_t pid)
 {
     int i;
 
@@ -247,7 +247,7 @@ static CPUState *find_cpu(uint32_t thread_id)
     return NULL;
 }
 
-static CPUState *get_first_cpu_in_process(GDBProcess *process)
+CPUState *gdb_get_first_cpu_in_process(GDBProcess *process)
 {
     CPUState *cpu;
 
@@ -325,7 +325,7 @@ static CPUState *gdb_get_cpu(uint32_t pid, uint32_t tid)
             return NULL;
         }
 
-        return get_first_cpu_in_process(process);
+        return gdb_get_first_cpu_in_process(process);
     } else {
         /* a specific thread */
         cpu = find_cpu(tid);
@@ -354,7 +354,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
     size_t len;
     int i;
     const char *name;
-    CPUState *cpu = get_first_cpu_in_process(process);
+    CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     len = 0;
@@ -490,7 +490,7 @@ void gdb_register_coprocessor(CPUState *cpu,
 
 static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
-    CPUState *cpu = get_first_cpu_in_process(p);
+    CPUState *cpu = gdb_get_first_cpu_in_process(p);
 
     while (cpu) {
         gdb_breakpoint_remove_all(cpu);
@@ -653,7 +653,7 @@ static int gdb_handle_vcont(const char *p)
                 goto out;
             }
 
-            cpu = get_first_cpu_in_process(process);
+            cpu = gdb_get_first_cpu_in_process(process);
             while (cpu) {
                 if (newstates[cpu->cpu_index] == 1) {
                     newstates[cpu->cpu_index] = cur_action;
@@ -1280,7 +1280,7 @@ static void handle_v_attach(GArray *params, void *user_ctx)
         goto cleanup;
     }
 
-    cpu = get_first_cpu_in_process(process);
+    cpu = gdb_get_first_cpu_in_process(process);
     if (!cpu) {
         goto cleanup;
     }
@@ -1403,7 +1403,7 @@ static void handle_query_curr_tid(GArray *params, void *user_ctx)
      * first thread).
      */
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
-    cpu = get_first_cpu_in_process(process);
+    cpu = gdb_get_first_cpu_in_process(process);
     g_string_assign(gdbserver_state.str_buf, "QC");
     gdb_append_thread_id(cpu, gdbserver_state.str_buf);
     gdb_put_strbuf();
diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 33d21d64886..25e4d5eeaa6 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -129,6 +129,8 @@ void gdb_read_byte(uint8_t ch);
  */
 bool gdb_got_immediate_ack(void);
 /* utility helpers */
+GDBProcess *gdb_get_process(uint32_t pid);
+CPUState *gdb_get_first_cpu_in_process(GDBProcess *process);
 CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
-- 
2.40.1
