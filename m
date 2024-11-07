Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4467632njc;
        Thu, 7 Nov 2024 11:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqKj6zoTpceUSeLWJY5o/Dcm6V5RpzqSFZlZzMz41AhVZ1gCZ/2Mq4Gs9qCpcWejHEtreobn07u8mgnw==@linaro.org
X-Google-Smtp-Source: AGHT+IHZFhq9I7r1O8XF/JNwUhwQuXwGuagYhSFJ/yCt5gouzZtFdhlEcquY/CnOItVwg2FFpoED
X-Received: by 2002:a05:6214:4a89:b0:6d3:556c:1002 with SMTP id 6a1803df08f44-6d39e1ea64amr1963256d6.43.1731009340817;
        Thu, 07 Nov 2024 11:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731009340; cv=none;
        d=google.com; s=arc-20240605;
        b=TLlf3ZNxhMugtaFZsZliWr6dblMcrfTyjAPZczy+hPBVa6XBZBCGZTLT4sAZjlSPy2
         25p+A0KQXIJzFpsFb0BJGu657ToIlQ6I6gXwoA8XUobt4K7da8vba/cJ/RIRCIR95hey
         yUdtwJg+BHxMFetGDdlYhr9R057khX7XSRGGDXxzhI7/3mDAv9T3KuR2HHPwqg7OSyYk
         /574o35ORrPou8xZ4FjX0y5PqGY2GxGRwveomj0Q6wjF+oIOYzNrjnO+V69ZtwGiQy47
         IZqijfZKOuybjxq8ik60YBwf6HOLJV3IuS5ksZhUB3/Ekd21HGzfY6+O5YA4JLla0H9t
         xBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:references:mime-version:in-reply-to:date
         :dkim-signature;
        bh=Dhx3Bv91IwsNiKrqW6EopdF6ygF7pLBG+NH0I9FnnMU=;
        fh=XuBrA54R9ySozHoD/qCHuwIA1pKE6YAf4KhJE72ECqw=;
        b=Co5nF28lxpMc1m3zVz/iRwnUc+uhZGKpPY1qVKmAzdyMat8cOrqW/jj8LXTJ2hgKoU
         MyccDIW3HU6dQ+oVGFOgS9WfLLSoUbqCHdyFwTSL5R16zTYuqshrBvszDBSeNLV9m7jF
         hZiNyWen15bkFOzpXOCWN7tQUUMIMH2GAM/1dBqhUCz2hdEHJMwQZhuFtGOhd8+tfmyB
         BW75gMOsYe8GlCCp/JYpat0Ovm148DeCXlZL5FGfTucKMGv5POsJ5omkWGpJXHfB1kZ9
         CpRp0o4DZdtOf8uKeJT5GmUpeeqojzXtw2xu221T19VaJRwGFqeoTDx0TqOMvTR7Aif3
         DAkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=HJOq6v5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d396666ae4si22265696d6.387.2024.11.07.11.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 11:55:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=HJOq6v5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t98az-0001YN-8u; Thu, 07 Nov 2024 14:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FhstZwYKCEEwlwxvujrrjoh.frpthpx-dupqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1t98aw-0001VC-W1
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 14:55:07 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FhstZwYKCEEwlwxvujrrjoh.frpthpx-dupqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1t98at-0003L8-EA
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 14:55:06 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e9d6636498so27172257b3.2
 for <qemu-arm@nongnu.org>; Thu, 07 Nov 2024 11:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731009302; x=1731614102; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Dhx3Bv91IwsNiKrqW6EopdF6ygF7pLBG+NH0I9FnnMU=;
 b=HJOq6v5rhqbMrcftI+/LxDpc/WkswW27a69yG2M7nZz6OT0iG2Fcghlv3gPFVjQr3z
 1HNV4wvzOms03U5fvZ/i6GQlAL/Pn7sUjpEGvhtXfQxErjHXZD7s4/IxUE3VdJNG+8+J
 gttdY/1hSxQlIr4objVtIODodZSwZn6NPCgUoncVn6KcfZiKtNazC1MC/47wjDUWwhW1
 eJCoUwVuPv4ehiBASv2PC3i4AK1hhMCYlKbsc0Q/ixvjFhn2t3j4EWfh8r2Oah9mZIDK
 6dFsO0p7LyBqYwmV+ESDnNGEMdRZAeoiR5JSB94Eta9OaNjqLjz4tOMHr0HS2tjlAZ/z
 fcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731009302; x=1731614102;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Dhx3Bv91IwsNiKrqW6EopdF6ygF7pLBG+NH0I9FnnMU=;
 b=ZcxLfC2xQ191HMczz4RIh92tMlijQmdonNmrpfN9WMxmo9VGaGVcxL3WWpogTeTJUW
 fRisz0Y2DdLUxRNtoDVbEXf81XfOYisLIvf1CR4gQcLXC1wpmvWpHAf2RQrPuKMcIjFw
 8MjXSHN+dFIlj6G+e1c1LRTuf4v6xOI/wecMyOSbCWWVzpSg6bo68CGPah4pKf5qGIN0
 fgoXjkajAThR4u2Q2rPTXvQl0u9iT61ShaiYRKPeqBEmmYo3ilGo5trQriok4z0UaL9m
 EPiewgIhDL5ZQCkjlOCbKyXKKZH8+qMBzzVluyBvJPE3GvzvG2uTCqtdM36/uv7vDlHF
 pgGg==
X-Gm-Message-State: AOJu0YziNGO/t2TlWPct5IhajcrkNYR0+NCbnAcg6qeuoD9yJqFkXjmz
 /m5Uhgb5Q+w67vnxeN8X1s7p+YyJbjkmTQ5b950E7r35OjUbF5nAjRxn5Q1hWByihyZqcVYZLZY
 suw==
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:dc:567e:c0a8:e14])
 (user=titusr job=sendgmr) by 2002:a25:aac4:0:b0:e2b:da82:f695 with
 SMTP id
 3f1490d57ef6-e337f8c1754mr158276.6.1731009302052; Thu, 07 Nov 2024 11:55:02
 -0800 (PST)
Date: Thu,  7 Nov 2024 19:54:51 +0000
In-Reply-To: <20241107195453.2684138-1-titusr@google.com>
Mime-Version: 1.0
References: <20241107195453.2684138-1-titusr@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107195453.2684138-5-titusr@google.com>
Subject: [PATCH 4/6] hw/i2c: add canonical path to i2c event traces
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org, minyard@acm.org, clg@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org, 
 venture@google.com, wuhaotsh@google.com, milesg@linux.vnet.ibm.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3FhstZwYKCEEwlwxvujrrjoh.frpthpx-dupqrqjqx.ruj@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I8iealtXP6aQ

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/core.c       | 8 +++++---
 hw/i2c/trace-events | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 4cf30b2c86..d238311776 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t a=
ddress,
            start condition.  */
=20
         if (sc->event) {
-            trace_i2c_event(event =3D=3D I2C_START_SEND ? "start" : "start=
_async",
+            trace_i2c_event(DEVICE(s)->canonical_path,
+                            event =3D=3D I2C_START_SEND ? "start" : "start=
_async",
                             s->address);
             rv =3D sc->event(s, event);
             if (rv && !bus->broadcast) {
@@ -244,7 +245,7 @@ void i2c_end_transfer(I2CBus *bus)
         I2CSlave *s =3D node->elt;
         sc =3D I2C_SLAVE_GET_CLASS(s);
         if (sc->event) {
-            trace_i2c_event("finish", s->address);
+            trace_i2c_event(DEVICE(s)->canonical_path, "finish", s->addres=
s);
             sc->event(s, I2C_FINISH);
         }
         QLIST_REMOVE(node, next);
@@ -321,7 +322,8 @@ void i2c_nack(I2CBus *bus)
     QLIST_FOREACH(node, &bus->current_devs, next) {
         sc =3D I2C_SLAVE_GET_CLASS(node->elt);
         if (sc->event) {
-            trace_i2c_event("nack", node->elt->address);
+            trace_i2c_event(DEVICE(node->elt)->canonical_path,
+                            "nack", node->elt->address);
             sc->event(node->elt, I2C_NACK);
         }
     }
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index f708a7ace1..e5f2dc643e 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ bitbang_i2c_data(unsigned clk, unsigned dat, unsigned old_o=
ut, unsigned new_out)
=20
 # core.c
=20
-i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
+i2c_event(const char *id, const char *event, uint8_t address) "%s: %s(addr=
:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
 i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) dat=
a:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
--=20
2.47.0.277.g8800431eea-goog

