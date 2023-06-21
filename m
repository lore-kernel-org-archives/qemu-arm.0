Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128088ejb;
        Wed, 21 Jun 2023 13:36:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55QuPN2tNcxVr6pxQxpR9eWPfMPS/Kd5LvCUqbr5WMEMg5chCyaViWGhzNV7dNqr/WZ7+B
X-Received: by 2002:a81:920c:0:b0:56d:18fb:62a1 with SMTP id j12-20020a81920c000000b0056d18fb62a1mr19244131ywg.15.1687379812198;
        Wed, 21 Jun 2023 13:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379812; cv=none;
        d=google.com; s=arc-20160816;
        b=brIxJ7jAGAwTFyOYJfbE+MD6R3wV6z9ArJICkQh/lc+Aj0wnOOVMhkOWNaN+fOMpfk
         lonzJip9dmimtdDHuLXVsSajWZMxX+lwfroeL2kPFs1GyWTlPJocHKa/5YQpSAp+1Lmz
         cgdyCrteVWeNGKhwe7aXOPlfNJkP3dmJIQzvPkka+eAwgrJcASors4UX7h9OaOxnairG
         59Ibx9LHTKp02KT2CMQ7UXYlQztI5pGMnRpdx0xiHbZ0UpTnCdfNEIy+ZNB+WqLtza86
         27fvV2S3fCWXNo64XCFjJcAdFILdPKYfM9Ab5/P0BR8AvWY7MsKiVFg3dfmBVWv92i0L
         jCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ecx4lQo5WRp3o8z1DdIMZAnLsE8WXq4Knht2GICERP4=;
        b=01m7S3kSu+TeHNeFgdf/Ax43IqIx696msz5/3Z6Asz/zvJbUNiPnf0M7G5i9emRH1k
         gBjYie86a08YV3sD0srkPbc38v8I4CNujzRYcKA/UhSrU0pwsEzruYPeI36BfgUchKFR
         RFCSb0GqvFO0l4G872OwLHl2uhzp6PXoo9CE8e6KSnGgl+jG0ol1hcto3elZbejIo9lE
         jzWx1glMiCsIv/izkVTK9nfAd2RFx0ENbr7C2WmINgNy2Aok7sRlehfMyrqf7zcIndBN
         t77pc0JReTENparuk5Ilh/Gr29M2Ykp0202O+t2o7liGpoLSYX4MlKckN4D/fL7GvdC2
         RFhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lL09CaB5;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id c70-20020a814e49000000b0057078b8c8bbsi4474250ywb.35.2023.06.21.13.36.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lL09CaB5;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LKTn60026725;
	Wed, 21 Jun 2023 20:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ecx4lQo5WRp3o8z1DdIMZAnLsE8WXq4Knht2GICERP4=;
 b=lL09CaB5i6TwltOX1mJpY3/HzqvlV5tVF7kbY94Rjeav1Vs4Nmpf3BVRCibcv2pwVRzr
 ExNQJbWainHvz+dHOB4ceUMHOlM6Gvsn9ECEe8I5v3h+o8RjFBiuB4HR8cBvqoT8u/q0
 azuIKfdNEg5aW6JDMNyR8Fmh7To0f/t66RvVUVOxJ9bg0nx5iuQJl3tpt/QuQ4FR0wRv
 sDdLSxLjj4rTgUYNyMbKg65Cv4GESna++9SuamBvuACS5hT6zkwGSlRFOMJtBSG/9hqF
 05AUzfEnTLMpwD5hVbNlR2rJUM8jiHdxrJvrX5Je3uZROtlOBvQmnOSnbzs31fJV4JKM SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc89pg5xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:51 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKVLt4031240;
	Wed, 21 Jun 2023 20:36:50 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc89pg5vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:50 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35LAoGef017049;
	Wed, 21 Jun 2023 20:36:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3r94f5aasw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKajpt17367806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB0932004D;
	Wed, 21 Jun 2023 20:36:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EE3820040;
	Wed, 21 Jun 2023 20:36:45 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 4/8] gdbstub: Expose gdb_get_process() and gdb_get_first_cpu_in_process()
Date: Wed, 21 Jun 2023 22:36:23 +0200
Message-Id: <20230621203627.1808446-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621203627.1808446-1-iii@linux.ibm.com>
References: <20230621203627.1808446-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CMojB-1BKi_O6duSszaz8F-9qXhPrmx0
X-Proofpoint-ORIG-GUID: 4JUe-hdRrq2S4G5k6lMcNSoy0pH8LtaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210167
X-TUID: gwbGMMLH2/T8

These functions will be needed by user-target.c in order to retrieve
the name of the executable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 gdbstub/gdbstub.c   | 16 ++++++++--------
 gdbstub/internals.h |  2 ++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be18568d0a..9139fec92a 100644
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
index 33d21d6488..25e4d5eeaa 100644
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
