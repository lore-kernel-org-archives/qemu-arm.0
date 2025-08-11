Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D9CA0ED3
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 19:39:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulYKw-0007I1-P5; Mon, 11 Aug 2025 15:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKa-0007Co-2I
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKR-0003rM-Bk
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:15 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BBVDlB005506
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=kTCG4odqlk4
 I31FckedmmBZfTyjLctBkXvzLD9hftMI=; b=YvyoM7Nrz9Utd/f3AJsGiHbc830
 p7dJ1sXW40ZAOaP90AEaY4sqmg5MnpuqXYt/nyqjkgmsxqodT3BNJr2ONMdva8Om
 aK/a3t9RVIYOhSnbOxKG6LvkoxnzkaXIj19emqN2QZVMvW/y7AeogjcCGGpUUrNp
 la4PsuC+rDoLStZrVJWzajJ5A8OnicHA+EeFD/XOAAegFqN7r/f/n34NIsNqvKe0
 5BjDct9PuhB2hcRa3BpM3yo9BUibpUjpwKqmmC+XpA88Jo/w7gqxaaqJiEqcFK9G
 rMzI9WGD2laBPXbZH4oUEu09XEtohvCch7QXQs0WAJXmlFZ2EojZlxhFZgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6hetu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:37:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-75e28bcec3bso9061849b3a.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 12:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754941020; x=1755545820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTCG4odqlk4I31FckedmmBZfTyjLctBkXvzLD9hftMI=;
 b=DI9Q+KjXUu9InqSRtVfX8EMmma4QZ97eqH67LTDsMtoq+EYrC4LWQoY8pbXOvDbpIi
 PtYZBjPCyls1zESqYRHqSr4SGxEouZQiuJYgL6XI2667akHAAa8B4I8ZFL3lXsV/Kngt
 VUFAvac1dVLS6tcd6F5h+kx7cbimsdgAhZPDkcYkCXg3KU9RI2+U25MhYWZo+FU9jWKd
 XlVPkCW6hla/hc3+OmAF1bpTefy8KBmaTHH8z/PdyfVDO+z4r4n2mdaK9cLAGBH1YlcY
 m5xUwpRAujwSnQwtluz95QdWpeqgjOPPBe39OML2s99XPxwCa2J3fbssdSndhYAnwQK5
 a5nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWCxVUf64MVkqLyMFVLhHHcA/eYhq2simvThM4khPEUCYhSKrfmRPpCRjCSrtdg2TjGZ60dxVS8g==@nongnu.org
X-Gm-Message-State: AOJu0YyQ5Fm0tcrDfAX10JfETQDjYXFFKUOTNhzBBswXpoIJHFhxRjH0
 3u556AO2WoWy6g8PlHiottZ5ttvEhL5+JQmSg65mR5RWIIvaWkhvdkZrriNOSaOA6M4KqZvlF7c
 2IULmUXS32iJlYOqqTBkiQDeS/EvZtDfZEiBROwGkrw0goyxD1oe0MYU=
X-Gm-Gg: ASbGncuo4kmNbr0HNkIGUh90WIS6EMOQ1aGsH0B1x4Yw8Cd4j/vkb/PbDM8Yuchkatl
 huglBoCkJCKtQBm9bM57aWqgosH9d8hjVuwWBSPHnaRkAcVxly3/FMe5VAVcrn/AQsJ/pvqvz8B
 3xaw8VC23TOxlwJUqkmNP6mqMT2c4/YphAqbF6wUqfst/LUWvKFcSSKqK+NAc2EwxvxvdQzRnAb
 tB4Tb4RpPdeq2A9tusXv9L700YPGGzbg4DgprKTTDP7Hxxx+iFXk+rI/oX5a2IeV8XR6ocOQDqB
 4MT4uJ42E+icIEUolVfj9JMCMwxdAUY+DAhXrxZ4C1xGvxUu9IBo+pAVS4JcjPPoJUY/zgJN6c/
 0j0vggEza4cBZD/8=
X-Received: by 2002:a05:6a00:14cc:b0:748:f750:14c6 with SMTP id
 d2e1a72fcca58-76c4615bd8cmr20210601b3a.14.1754941019704; 
 Mon, 11 Aug 2025 12:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKY/+VMA4PGeSzQIazQ5ZD0pwlpk82BzSIgQzHx6RHSkmcgZaY3DKMeQMifr4wZ3Y0/xK7dQ==
X-Received: by 2002:a05:6a00:14cc:b0:748:f750:14c6 with SMTP id
 d2e1a72fcca58-76c4615bd8cmr20210563b3a.14.1754941019262; 
 Mon, 11 Aug 2025 12:36:59 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbcef6sm27677171b3a.85.2025.08.11.12.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 12:36:58 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v5 2/4] target/arm: Change GDBState's line_buf to a GString
Date: Mon, 11 Aug 2025 19:36:52 +0000
Message-Id: <20250811193654.4012878-3-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX+WTWe+iPwqkt
 1pqsoiUdHoFW+hE2aAlmJyFFfllFhfMA55jNO2mSA4z7KgsWGGky3qkZcdG9nm9rhBadQ6YIRmN
 uFWAqQxZnfn1kjBjGX3EcAgUZM7HEaBbUEWk1CRlO7uIROSNE9c+88LSgliRXIWtiEeNsk/ziuF
 fXQTpZK1HeNv33Pwgu9lwEazihqLl7oesAYxDZEsPG/5k1paqEJJKR8ogkX4hD+Qysl5WN0eIJC
 IGpRfjS71zPm0dRrNuYg2AUQePR0BMFOTm6QvERXd4TZsrlvikA28mFlcXiBrRh2ee8+QmWAJmM
 EAP9a70Up69WMBay/GxoC30gGHNQLtMqrBwD/CiKR930vW/NZDKQYSHHnOd6SZOEo3jW0Z5x3sa
 h8Ah4hhn
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689a465c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=w1AtNIWgmVDSpf7mFgMA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: VtL4ee9SxUYY41KRpsU25l9tUTDv-Qc6
X-Proofpoint-ORIG-GUID: VtL4ee9SxUYY41KRpsU25l9tUTDv-Qc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patch changes GDBState's line_buf from a character
array to a GString. This allows line_buf to be dynamically
re-sizeable.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v4:
- this patch was not present in v4, it has been added as
suggested during review of v4
---
 gdbstub/gdbstub.c   | 25 +++++++++++++------------
 gdbstub/internals.h |  3 +--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index dd5fb5667c..0634ff9e91 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -64,6 +64,7 @@ void gdb_init_gdbserver_state(void)
     memset(&gdbserver_state, 0, sizeof(GDBState));
     gdbserver_state.init = true;
     gdbserver_state.str_buf = g_string_new(NULL);
+    gdbserver_state.line_buf = g_string_new(NULL);
     gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
     gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);
 
@@ -2369,7 +2370,7 @@ void gdb_read_byte(uint8_t ch)
         case RS_IDLE:
             if (ch == '$') {
                 /* start of command packet */
-                gdbserver_state.line_buf_index = 0;
+                g_string_set_size(gdbserver_state.line_buf, 0);
                 gdbserver_state.line_sum = 0;
                 gdbserver_state.state = RS_GETLINE;
             } else if (ch == '+') {
@@ -2393,12 +2394,12 @@ void gdb_read_byte(uint8_t ch)
             } else if (ch == '#') {
                 /* end of command, start of checksum*/
                 gdbserver_state.state = RS_CHKSUM1;
-            } else if (gdbserver_state.line_buf_index >= sizeof(gdbserver_state.line_buf) - 1) {
+            } else if (gdbserver_state.line_buf->len >= MAX_PACKET_LENGTH) {
                 trace_gdbstub_err_overrun();
                 gdbserver_state.state = RS_IDLE;
             } else {
                 /* unescaped command character */
-                gdbserver_state.line_buf[gdbserver_state.line_buf_index++] = ch;
+                g_string_append_c(gdbserver_state.line_buf, (gchar) ch);
                 gdbserver_state.line_sum += ch;
             }
             break;
@@ -2406,13 +2407,13 @@ void gdb_read_byte(uint8_t ch)
             if (ch == '#') {
                 /* unexpected end of command in escape sequence */
                 gdbserver_state.state = RS_CHKSUM1;
-            } else if (gdbserver_state.line_buf_index >= sizeof(gdbserver_state.line_buf) - 1) {
+            } else if (gdbserver_state.line_buf->len >= MAX_PACKET_LENGTH) {
                 /* command buffer overrun */
                 trace_gdbstub_err_overrun();
                 gdbserver_state.state = RS_IDLE;
             } else {
                 /* parse escaped character and leave escape state */
-                gdbserver_state.line_buf[gdbserver_state.line_buf_index++] = ch ^ 0x20;
+                g_string_append_c(gdbserver_state.line_buf, (gchar) ch ^ 0x20);
                 gdbserver_state.line_sum += ch;
                 gdbserver_state.state = RS_GETLINE;
             }
@@ -2429,19 +2430,20 @@ void gdb_read_byte(uint8_t ch)
             } else {
                 /* decode repeat length */
                 int repeat = ch - ' ' + 3;
-                if (gdbserver_state.line_buf_index + repeat >= sizeof(gdbserver_state.line_buf) - 1) {
+                if (gdbserver_state.line_buf->len + repeat >= MAX_PACKET_LENGTH) {
                     /* that many repeats would overrun the command buffer */
                     trace_gdbstub_err_overrun();
                     gdbserver_state.state = RS_IDLE;
-                } else if (gdbserver_state.line_buf_index < 1) {
+                } else if (gdbserver_state.line_buf->len < 1) {
                     /* got a repeat but we have nothing to repeat */
                     trace_gdbstub_err_invalid_rle();
                     gdbserver_state.state = RS_GETLINE;
                 } else {
                     /* repeat the last character */
-                    memset(gdbserver_state.line_buf + gdbserver_state.line_buf_index,
-                           gdbserver_state.line_buf[gdbserver_state.line_buf_index - 1], repeat);
-                    gdbserver_state.line_buf_index += repeat;
+                    for (int i = 0; i < repeat; i ++){
+                        g_string_append_c(gdbserver_state.line_buf, 
+                            gdbserver_state.line_buf->str[gdbserver_state.line_buf->len - 1]);
+                    }
                     gdbserver_state.line_sum += ch;
                     gdbserver_state.state = RS_GETLINE;
                 }
@@ -2454,7 +2456,6 @@ void gdb_read_byte(uint8_t ch)
                 gdbserver_state.state = RS_GETLINE;
                 break;
             }
-            gdbserver_state.line_buf[gdbserver_state.line_buf_index] = '\0';
             gdbserver_state.line_csum = fromhex(ch) << 4;
             gdbserver_state.state = RS_CHKSUM2;
             break;
@@ -2477,7 +2478,7 @@ void gdb_read_byte(uint8_t ch)
                 /* send ACK reply */
                 reply = '+';
                 gdb_put_buffer(&reply, 1);
-                gdbserver_state.state = gdb_handle_packet(gdbserver_state.line_buf);
+                gdbserver_state.state = gdb_handle_packet((char *) gdbserver_state.line_buf->str);
             }
             break;
         default:
diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 87f64b6318..27afbef4f5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -72,8 +72,7 @@ typedef struct GDBState {
     CPUState *g_cpu; /* current CPU for other ops */
     CPUState *query_cpu; /* for q{f|s}ThreadInfo */
     enum RSState state; /* parsing state */
-    char line_buf[MAX_PACKET_LENGTH];
-    int line_buf_index;
+    GString *line_buf;
     int line_sum; /* running checksum */
     int line_csum; /* checksum at the end of the packet */
     GByteArray *last_packet;
-- 
2.34.1


